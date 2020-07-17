Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5983223BFC
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 15:11:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwQ8R-0007or-Jp; Fri, 17 Jul 2020 13:10:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jwQ8Q-0007om-BU
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 13:10:42 +0000
X-Inumbo-ID: ea270a6a-c82e-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea270a6a-c82e-11ea-8496-bc764e2007e4;
 Fri, 17 Jul 2020 13:10:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2D6CCB6AB;
 Fri, 17 Jul 2020 13:10:45 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: guard against port I/O overlapping the RTC/CMOS range
Message-ID: <38c73e17-30b8-27b4-bc7c-e6ef7817fa1e@suse.com>
Date: Fri, 17 Jul 2020 15:10:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Since we intercept RTC/CMOS port accesses, let's do so consistently in
all cases, i.e. also for e.g. a dword access to [006E,0071]. To avoid
the risk of unintended impact on Dom0 code actually doing so (despite
the belief that none ought to exist), also extend
guest_io_{read,write}() to decompose accesses where some ports are
allowed to be directly accessed and some aren't.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -210,7 +210,7 @@ static bool admin_io_okay(unsigned int p
         return false;
 
     /* We also never permit direct access to the RTC/CMOS registers. */
-    if ( ((port & ~1) == RTC_PORT(0)) )
+    if ( port <= RTC_PORT(1) && port + bytes > RTC_PORT(0) )
         return false;
 
     return ioports_access_permitted(d, port, port + bytes - 1);
@@ -297,6 +297,17 @@ static uint32_t guest_io_read(unsigned i
             if ( pci_cfg_ok(currd, port & 3, size, NULL) )
                 sub_data = pci_conf_read(currd->arch.pci_cf8, port & 3, size);
         }
+        else if ( ioports_access_permitted(currd, port, port) )
+        {
+            if ( bytes > 1 && !(port & 1) &&
+                 ioports_access_permitted(currd, port, port + 1) )
+            {
+                sub_data = inw(port);
+                size = 2;
+            }
+            else
+                sub_data = inb(port);
+        }
 
         if ( size == 4 )
             return sub_data;
@@ -373,25 +384,31 @@ static int read_io(unsigned int port, un
     return X86EMUL_OKAY;
 }
 
+static void _guest_io_write(unsigned int port, unsigned int bytes,
+                            uint32_t data)
+{
+    switch ( bytes )
+    {
+    case 1:
+        outb((uint8_t)data, port);
+        if ( amd_acpi_c1e_quirk )
+            amd_check_disable_c1e(port, (uint8_t)data);
+        break;
+    case 2:
+        outw((uint16_t)data, port);
+        break;
+    case 4:
+        outl(data, port);
+        break;
+    }
+}
+
 static void guest_io_write(unsigned int port, unsigned int bytes,
                            uint32_t data, struct domain *currd)
 {
     if ( admin_io_okay(port, bytes, currd) )
     {
-        switch ( bytes )
-        {
-        case 1:
-            outb((uint8_t)data, port);
-            if ( amd_acpi_c1e_quirk )
-                amd_check_disable_c1e(port, (uint8_t)data);
-            break;
-        case 2:
-            outw((uint16_t)data, port);
-            break;
-        case 4:
-            outl(data, port);
-            break;
-        }
+        _guest_io_write(port, bytes, data);
         return;
     }
 
@@ -420,6 +437,13 @@ static void guest_io_write(unsigned int
             if ( pci_cfg_ok(currd, port & 3, size, &data) )
                 pci_conf_write(currd->arch.pci_cf8, port & 3, size, data);
         }
+        else if ( ioports_access_permitted(currd, port, port) )
+        {
+            if ( bytes > 1 && !(port & 1) &&
+                 ioports_access_permitted(currd, port, port + 1) )
+                size = 2;
+            _guest_io_write(port, size, data);
+        }
 
         if ( size == 4 )
             return;

