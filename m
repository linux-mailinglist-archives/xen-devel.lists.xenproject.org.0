Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24746220C7E
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 13:57:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvg29-0000es-0H; Wed, 15 Jul 2020 11:57:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvg27-0000ef-MY
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 11:57:07 +0000
X-Inumbo-ID: 4de68af6-c692-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4de68af6-c692-11ea-bb8b-bc764e2007e4;
 Wed, 15 Jul 2020 11:57:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 280CAAC6E;
 Wed, 15 Jul 2020 11:57:09 +0000 (UTC)
Subject: [PATCH v3 2/2] x86: detect CMOS aliasing on ports other than 0x70/0x71
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
Message-ID: <441327cd-a7d6-8cb6-bf90-69df8e509425@suse.com>
Date: Wed, 15 Jul 2020 13:57:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

... in order to also intercept accesses through the alias ports.

Also stop intercepting accesses to the CMOS ports if we won't ourselves
use the CMOS RTC.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Re-base over change to earlier patch.
v2: Re-base.

--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -670,6 +670,80 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
     return ret;
 }
 
+#ifndef COMPAT
+#include <asm/mc146818rtc.h>
+
+unsigned int __read_mostly cmos_alias_mask;
+
+static int __init probe_cmos_alias(void)
+{
+    unsigned int i, offs;
+
+    if ( acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC )
+        return 0;
+
+    for ( offs = 2; offs < 8; offs <<= 1 )
+    {
+        bool read = true;
+
+        for ( i = RTC_REG_D + 1; i < 0x80; ++i )
+        {
+            uint8_t normal, alt;
+            unsigned long flags;
+
+            if ( i == acpi_gbl_FADT.century )
+                continue;
+
+            spin_lock_irqsave(&rtc_lock, flags);
+
+            normal = CMOS_READ(i);
+            if ( inb(RTC_PORT(offs)) != i )
+                read = false;
+
+            alt = inb(RTC_PORT(offs + 1));
+
+            spin_unlock_irqrestore(&rtc_lock, flags);
+
+            if ( normal != alt )
+                break;
+
+            process_pending_softirqs();
+        }
+        if ( i == 0x80 )
+        {
+            cmos_alias_mask |= offs;
+            printk(XENLOG_INFO "CMOS aliased at %02x, index %s\n",
+                   RTC_PORT(offs), read ? "r/w" : "w/o");
+        }
+    }
+
+    return 0;
+}
+__initcall(probe_cmos_alias);
+
+/* Has the administrator granted sufficient permission for this I/O access? */
+bool admin_io_okay(unsigned int port, unsigned int bytes,
+                   const struct domain *d)
+{
+    /*
+     * Port 0xcf8 (CONFIG_ADDRESS) is only visible for DWORD accesses.
+     * We never permit direct access to that register.
+     */
+    if ( (port == 0xcf8) && (bytes == 4) )
+        return false;
+
+    /*
+     * We also never permit direct access to the RTC/CMOS registers
+     * if we may be accessing the RTC ones ourselves.
+     */
+    if ( !(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) &&
+         ((port & ~(cmos_alias_mask | 1)) == RTC_PORT(0)) )
+        return false;
+
+    return ioports_access_permitted(d, port, port + bytes - 1);
+}
+#endif /* COMPAT */
+
 /*
  * Local variables:
  * mode: C
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -198,24 +198,6 @@ static bool guest_io_okay(unsigned int p
     return false;
 }
 
-/* Has the administrator granted sufficient permission for this I/O access? */
-static bool admin_io_okay(unsigned int port, unsigned int bytes,
-                          const struct domain *d)
-{
-    /*
-     * Port 0xcf8 (CONFIG_ADDRESS) is only visible for DWORD accesses.
-     * We never permit direct access to that register.
-     */
-    if ( (port == 0xcf8) && (bytes == 4) )
-        return false;
-
-    /* We also never permit direct access to the RTC/CMOS registers. */
-    if ( ((port & ~1) == RTC_PORT(0)) )
-        return false;
-
-    return ioports_access_permitted(d, port, port + bytes - 1);
-}
-
 static bool pci_cfg_ok(struct domain *currd, unsigned int start,
                        unsigned int size, uint32_t *write)
 {
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -48,7 +48,7 @@
 #include <xen/cpu.h>
 #include <asm/nmi.h>
 #include <asm/alternative.h>
-#include <asm/mc146818rtc.h>
+#include <asm/iocap.h>
 #include <asm/cpuid.h>
 #include <asm/spec_ctrl.h>
 #include <asm/guest.h>
@@ -2009,37 +2009,33 @@ int __hwdom_init xen_in_range(unsigned l
 static int __hwdom_init io_bitmap_cb(unsigned long s, unsigned long e,
                                      void *ctx)
 {
-    struct domain *d = ctx;
+    const struct domain *d = ctx;
     unsigned int i;
 
     ASSERT(e <= INT_MAX);
     for ( i = s; i <= e; i++ )
-        __clear_bit(i, d->arch.hvm.io_bitmap);
+        if ( admin_io_okay(i, 1, d) )
+            __clear_bit(i, d->arch.hvm.io_bitmap);
 
     return 0;
 }
 
 void __hwdom_init setup_io_bitmap(struct domain *d)
 {
-    int rc;
+    if ( !is_hvm_domain(d) )
+        return;
 
-    if ( is_hvm_domain(d) )
-    {
-        bitmap_fill(d->arch.hvm.io_bitmap, 0x10000);
-        rc = rangeset_report_ranges(d->arch.ioport_caps, 0, 0x10000,
-                                    io_bitmap_cb, d);
-        BUG_ON(rc);
-        /*
-         * NB: we need to trap accesses to 0xcf8 in order to intercept
-         * 4 byte accesses, that need to be handled by Xen in order to
-         * keep consistency.
-         * Access to 1 byte RTC ports also needs to be trapped in order
-         * to keep consistency with PV.
-         */
-        __set_bit(0xcf8, d->arch.hvm.io_bitmap);
-        __set_bit(RTC_PORT(0), d->arch.hvm.io_bitmap);
-        __set_bit(RTC_PORT(1), d->arch.hvm.io_bitmap);
-    }
+    bitmap_fill(d->arch.hvm.io_bitmap, 0x10000);
+    if ( rangeset_report_ranges(d->arch.ioport_caps, 0, 0x10000,
+                                io_bitmap_cb, d) )
+        BUG();
+
+    /*
+     * We need to trap 4-byte accesses to 0xcf8 (see admin_io_okay(),
+     * guest_io_read(), and guest_io_write()), which isn't covered by
+     * the admin_io_okay() check in io_bitmap_cb().
+     */
+    __set_bit(0xcf8, d->arch.hvm.io_bitmap);
 }
 
 /*
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1092,7 +1092,10 @@ static unsigned long get_cmos_time(void)
         if ( seconds < 60 )
         {
             if ( rtc.sec != seconds )
+            {
                 cmos_rtc_probe = false;
+                acpi_gbl_FADT.boot_flags &= ~ACPI_FADT_NO_CMOS_RTC;
+            }
             break;
         }
 
@@ -1114,7 +1117,7 @@ unsigned int rtc_guest_read(unsigned int
     unsigned long flags;
     unsigned int data = ~0;
 
-    switch ( port )
+    switch ( port & ~cmos_alias_mask )
     {
     case RTC_PORT(0):
         /*
@@ -1126,11 +1129,12 @@ unsigned int rtc_guest_read(unsigned int
         break;
 
     case RTC_PORT(1):
-        if ( !ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
+        if ( !ioports_access_permitted(currd, port - 1, port) )
             break;
         spin_lock_irqsave(&rtc_lock, flags);
-        outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
-        data = inb(RTC_PORT(1));
+        outb(currd->arch.cmos_idx & (0xff >> (port == RTC_PORT(1))),
+             port - 1);
+        data = inb(port);
         spin_unlock_irqrestore(&rtc_lock, flags);
         break;
 
@@ -1146,9 +1150,10 @@ void rtc_guest_write(unsigned int port,
     struct domain *currd = current->domain;
     unsigned long flags;
 
-    switch ( port )
+    switch ( port & ~cmos_alias_mask )
     {
         typeof(pv_rtc_handler) hook;
+        unsigned int idx;
 
     case RTC_PORT(0):
         /*
@@ -1160,19 +1165,21 @@ void rtc_guest_write(unsigned int port,
         break;
 
     case RTC_PORT(1):
-        if ( !ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
+        if ( !ioports_access_permitted(currd, port - 1, port) )
             break;
 
         spin_lock_irqsave(&rtc_lock, flags);
         hook = pv_rtc_handler;
         spin_unlock_irqrestore(&rtc_lock, flags);
 
+        idx = currd->arch.cmos_idx & (0xff >> (port == RTC_PORT(1)));
+
         if ( hook )
-            hook(currd->arch.cmos_idx & 0x7f, data);
+            hook(idx, data);
 
         spin_lock_irqsave(&rtc_lock, flags);
-        outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
-        outb(data, RTC_PORT(1));
+        outb(idx, port - 1);
+        outb(data, port);
         spin_unlock_irqrestore(&rtc_lock, flags);
         break;
 
--- a/xen/include/asm-x86/iocap.h
+++ b/xen/include/asm-x86/iocap.h
@@ -18,4 +18,7 @@
     (!rangeset_is_empty((d)->iomem_caps) ||             \
      !rangeset_is_empty((d)->arch.ioport_caps))
 
+bool admin_io_okay(unsigned int port, unsigned int bytes,
+                   const struct domain *d);
+
 #endif /* __X86_IOCAP_H__ */
--- a/xen/include/asm-x86/mc146818rtc.h
+++ b/xen/include/asm-x86/mc146818rtc.h
@@ -9,6 +9,8 @@
 
 extern spinlock_t rtc_lock;             /* serialize CMOS RAM access */
 
+extern unsigned int cmos_alias_mask;
+
 /**********************************************************************
  * register summary
  **********************************************************************/


