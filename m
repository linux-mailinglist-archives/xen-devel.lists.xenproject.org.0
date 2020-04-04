Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3440319E472
	for <lists+xen-devel@lfdr.de>; Sat,  4 Apr 2020 12:27:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKg1A-00009w-EO; Sat, 04 Apr 2020 10:27:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7qE9=5U=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jKg18-00009X-VH
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2020 10:27:10 +0000
X-Inumbo-ID: d3dd9e94-765e-11ea-be07-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3dd9e94-765e-11ea-be07-12813bfff9fa;
 Sat, 04 Apr 2020 10:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DJghX+ClWFBEitlSEELmqx/5BPYM3zMSGVJh1wbvZ88=; b=TuJHMQQh4eitbo26HRtC5Q6B8O
 csvGa7LKROzysYT28ACKFjztwxcx1O6sAjCpbKA25n0JRkMn06iMIJDR6Yx42szv24YAtm6+VWGby
 tAfZ0aYaYqX5g6+30z6pLqa6a8d2KIwDqIO1Zxt7vnQOv8PP0RA3cDaFgiQhHQo1Xca0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKg11-0005AU-B2; Sat, 04 Apr 2020 10:27:03 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKg11-0005h7-28; Sat, 04 Apr 2020 10:27:03 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 3/3] xen/x86: ioapic: Simplify ioapic_init()
Date: Sat,  4 Apr 2020 11:26:56 +0100
Message-Id: <20200404102656.29730-4-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404102656.29730-1-julien@xen.org>
References: <20200404102656.29730-1-julien@xen.org>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: julien@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Since commit 9facd54a45 "x86/ioapic: Add register level checks to detect
bogus io-apic entries", Xen is able to cope with IO APICs not mapped in
the fixmap.

Therefore the whole logic to allocate a fake page for some IO APICs is
unnecessary.

With the logic removed, the code can be simplified a lot as we don't
need to go through all the IO APIC if SMP has not been detected or a
bogus zero IO-APIC address has been detected.

To avoid another level of tabulation, the simplification is now moved in
its own function.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - Don't set ioapic_phys twice in a row
        - Rename init_ioapic_mappings() to ioapic_init_mappings()
        - Use paddr_t rather than unsigned long
        - Move nr_irq_gsis = 0 in ioapic_init_mappings()
---
 xen/arch/x86/io_apic.c | 61 +++++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 8233eb44e1..878ee5192d 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2537,34 +2537,26 @@ static __init bool bad_ioapic_register(unsigned int idx)
     return false;
 }
 
-void __init ioapic_init(void)
+static void __init ioapic_init_mappings(void)
 {
-    unsigned long ioapic_phys;
     unsigned int i, idx = FIX_IO_APIC_BASE_0;
-    union IO_APIC_reg_01 reg_01;
 
-    if ( smp_found_config )
-        nr_irqs_gsi = 0;
+    nr_irqs_gsi = 0;
+
     for ( i = 0; i < nr_ioapics; i++ )
     {
-        if ( smp_found_config )
-        {
-            ioapic_phys = mp_ioapics[i].mpc_apicaddr;
-            if ( !ioapic_phys )
-            {
-                printk(KERN_ERR "WARNING: bogus zero IO-APIC address "
-                       "found in MPTABLE, disabling IO/APIC support!\n");
-                smp_found_config = false;
-                skip_ioapic_setup = true;
-                goto fake_ioapic_page;
-            }
-        }
-        else
+        union IO_APIC_reg_01 reg_01;
+        paddr_t ioapic_phys = mp_ioapics[i].mpc_apicaddr;
+
+        if ( !ioapic_phys )
         {
- fake_ioapic_page:
-            ioapic_phys = __pa(alloc_xenheap_page());
-            clear_page(__va(ioapic_phys));
+            printk(KERN_ERR
+                   "WARNING: bogus zero IO-APIC address found in MPTABLE, disabling IO/APIC support!\n");
+            smp_found_config = false;
+            skip_ioapic_setup = true;
+            break;
         }
+
         set_fixmap_nocache(idx, ioapic_phys);
         apic_printk(APIC_VERBOSE, "mapped IOAPIC to %08Lx (%08lx)\n",
                     __fix_to_virt(idx), ioapic_phys);
@@ -2576,19 +2568,22 @@ void __init ioapic_init(void)
             continue;
         }
 
-        if ( smp_found_config )
-        {
-            /* The number of IO-APIC IRQ registers (== #pins): */
-            reg_01.raw = io_apic_read(i, 1);
-            nr_ioapic_entries[i] = reg_01.bits.entries + 1;
-            nr_irqs_gsi += nr_ioapic_entries[i];
-
-            if ( rangeset_add_singleton(mmio_ro_ranges,
-                                        ioapic_phys >> PAGE_SHIFT) )
-                printk(KERN_ERR "Failed to mark IO-APIC page %lx read-only\n",
-                       ioapic_phys);
-        }
+        /* The number of IO-APIC IRQ registers (== #pins): */
+        reg_01.raw = io_apic_read(i, 1);
+        nr_ioapic_entries[i] = reg_01.bits.entries + 1;
+        nr_irqs_gsi += nr_ioapic_entries[i];
+
+        if ( rangeset_add_singleton(mmio_ro_ranges,
+                                    ioapic_phys >> PAGE_SHIFT) )
+            printk(KERN_ERR "Failed to mark IO-APIC page %lx read-only\n",
+                   ioapic_phys);
     }
+}
+
+void __init ioapic_init(void)
+{
+    if ( smp_found_config )
+        ioapic_init_mappings();
 
     nr_irqs_gsi = max(nr_irqs_gsi, highest_gsi() + 1);
 
-- 
2.17.1


