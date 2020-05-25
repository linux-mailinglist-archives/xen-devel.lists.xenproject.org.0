Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDD41E1184
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 17:19:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdEsL-0004pX-He; Mon, 25 May 2020 15:18:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdEsK-0004pS-QI
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 15:18:48 +0000
X-Inumbo-ID: 07be82e6-9e9b-11ea-aeed-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07be82e6-9e9b-11ea-aeed-12813bfff9fa;
 Mon, 25 May 2020 15:18:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9C855AC85;
 Mon, 25 May 2020 15:18:49 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: avoid HPET use also on certain Coffee Lake H
Message-ID: <26a90632-bb76-a24b-aef1-4c068b610c6a@suse.com>
Date: Mon, 25 May 2020 17:18:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
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

Linux commit f8edbde885bbcab6a2b4a1b5ca614e6ccb807577 says

"Coffee Lake H SoC has similar behavior as Coffee Lake, skewed HPET
 timer once the SoCs entered PC10."

Again follow this for Xen as well, noting though that even the
pre-existing PCI ID refers to a H-processor line variant (the 6-core
one). It is also suspicious that the datasheet names 0x3e10 for the
4-core variant, while the Linux commit specifies 0x3e20, which I haven't
been able to locate in any datasheet yet. To be on the safe side, add
both until clarification can be provided by Intel.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -397,10 +397,16 @@ static int64_t __init init_hpet(struct p
          * entered PC10.
          */
         if ( pci_conf_read16(PCI_SBDF(0, 0, 0, 0),
-                             PCI_VENDOR_ID) == PCI_VENDOR_ID_INTEL &&
-             pci_conf_read16(PCI_SBDF(0, 0, 0, 0),
-                             PCI_DEVICE_ID) == 0x3ec4 )
-            hpet_address = 0;
+                             PCI_VENDOR_ID) == PCI_VENDOR_ID_INTEL )
+            switch ( pci_conf_read16(PCI_SBDF(0, 0, 0, 0),
+                                     PCI_DEVICE_ID) )
+            {
+            case 0x3e10: /* as per datasheet (4 core variant) */
+            case 0x3e20: /* as per respective Linux commit */
+            case 0x3ec4:
+                hpet_address = 0;
+                break;
+            }
 
         if ( !hpet_address )
             printk("Disabling HPET for being unreliable\n");

