Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 975C223D89A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 11:28:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3cBy-0002XF-C7; Thu, 06 Aug 2020 09:28:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3cBw-0002X7-Sm
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 09:28:04 +0000
X-Inumbo-ID: 60544132-7af2-4fb0-820f-966b2ae4b41f
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60544132-7af2-4fb0-820f-966b2ae4b41f;
 Thu, 06 Aug 2020 09:28:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 40FCBB65C;
 Thu,  6 Aug 2020 09:28:20 +0000 (UTC)
Subject: [PATCH 1/3] x86: slightly re-arrange 32-bit handling in
 dom0_construct_pv()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a2b8f0e9-77ea-6127-a25e-d8fd3dcbb866@suse.com>
Message-ID: <0972ea3c-c2a8-b0f4-ae25-132bdb798f6a@suse.com>
Date: Thu, 6 Aug 2020 11:28:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <a2b8f0e9-77ea-6127-a25e-d8fd3dcbb866@suse.com>
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

Add #ifdef-s (the 2nd one will be needed in particular, to guard the
uses of m2p_compat_vstart and HYPERVISOR_COMPAT_VIRT_START()) and fold
duplicate uses of elf_32bit().

Also adjust what gets logged: Avoid "compat32" when support isn't built
in, and don't assume ELF class <> ELFCLASS64 means ELFCLASS32.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -300,7 +300,6 @@ int __init dom0_construct_pv(struct doma
     struct page_info *page = NULL;
     start_info_t *si;
     struct vcpu *v = d->vcpu[0];
-    unsigned long long value;
     void *image_base = bootstrap_map(image);
     unsigned long image_len = image->mod_end;
     void *image_start = image_base + image_headroom;
@@ -357,27 +356,36 @@ int __init dom0_construct_pv(struct doma
         goto out;
 
     /* compatibility check */
+    printk(" Xen  kernel: 64-bit, lsb%s\n",
+           IS_ENABLED(CONFIG_PV32) ? ", compat32" : "");
     compatible = 0;
     machine = elf_uval(&elf, elf.ehdr, e_machine);
-    printk(" Xen  kernel: 64-bit, lsb, compat32\n");
-    if ( elf_32bit(&elf) && parms.pae == XEN_PAE_BIMODAL )
-        parms.pae = XEN_PAE_EXTCR3;
-    if ( elf_32bit(&elf) && parms.pae && machine == EM_386 )
+
+#ifdef CONFIG_PV32
+    if ( elf_32bit(&elf) )
     {
-        if ( unlikely(rc = switch_compat(d)) )
+        if ( parms.pae == XEN_PAE_BIMODAL )
+            parms.pae = XEN_PAE_EXTCR3;
+        if ( parms.pae && machine == EM_386 )
         {
-            printk("Dom0 failed to switch to compat: %d\n", rc);
-            return rc;
-        }
+            if ( unlikely(rc = switch_compat(d)) )
+            {
+                printk("Dom0 failed to switch to compat: %d\n", rc);
+                return rc;
+            }
 
-        compatible = 1;
+            compatible = 1;
+        }
     }
-    if (elf_64bit(&elf) && machine == EM_X86_64)
+#endif
+
+    if ( elf_64bit(&elf) && machine == EM_X86_64 )
         compatible = 1;
-    printk(" Dom0 kernel: %s%s, %s, paddr %#" PRIx64 " -> %#" PRIx64 "\n",
-           elf_64bit(&elf) ? "64-bit" : "32-bit",
-           parms.pae       ? ", PAE"  : "",
-           elf_msb(&elf)   ? "msb"    : "lsb",
+
+    printk(" Dom0 kernel: %s-bit%s, %s, paddr %#" PRIx64 " -> %#" PRIx64 "\n",
+           elf_64bit(&elf) ? "64" : elf_32bit(&elf) ? "32" : "??",
+           parms.pae       ? ", PAE" : "",
+           elf_msb(&elf)   ? "msb"   : "lsb",
            elf.pstart, elf.pend);
     if ( elf.bsd_symtab_pstart )
         printk(" Dom0 symbol map %#" PRIx64 " -> %#" PRIx64 "\n",
@@ -405,23 +413,28 @@ int __init dom0_construct_pv(struct doma
     if ( parms.pae == XEN_PAE_EXTCR3 )
             set_bit(VMASST_TYPE_pae_extended_cr3, &d->vm_assist);
 
-    if ( !pv_shim && (parms.virt_hv_start_low != UNSET_ADDR) &&
-         elf_32bit(&elf) )
+#ifdef CONFIG_PV32
+    if ( elf_32bit(&elf) )
     {
-        unsigned long mask = (1UL << L2_PAGETABLE_SHIFT) - 1;
-        value = (parms.virt_hv_start_low + mask) & ~mask;
-        BUG_ON(!is_pv_32bit_domain(d));
-        if ( value > __HYPERVISOR_COMPAT_VIRT_START )
-            panic("Domain 0 expects too high a hypervisor start address\n");
-        HYPERVISOR_COMPAT_VIRT_START(d) =
-            max_t(unsigned int, m2p_compat_vstart, value);
-    }
+        if ( !pv_shim && (parms.virt_hv_start_low != UNSET_ADDR) )
+        {
+            unsigned long mask = (1UL << L2_PAGETABLE_SHIFT) - 1;
+            unsigned long value = (parms.virt_hv_start_low + mask) & ~mask;
 
-    if ( (parms.p2m_base != UNSET_ADDR) && elf_32bit(&elf) )
-    {
-        printk(XENLOG_WARNING "P2M table base ignored\n");
-        parms.p2m_base = UNSET_ADDR;
+            BUG_ON(!is_pv_32bit_domain(d));
+            if ( value > __HYPERVISOR_COMPAT_VIRT_START )
+                panic("Domain 0 expects too high a hypervisor start address\n");
+            HYPERVISOR_COMPAT_VIRT_START(d) =
+                max_t(unsigned int, m2p_compat_vstart, value);
+        }
+
+        if ( parms.p2m_base != UNSET_ADDR )
+        {
+            printk(XENLOG_WARNING "P2M table base ignored\n");
+            parms.p2m_base = UNSET_ADDR;
+        }
     }
+#endif
 
     /*
      * Why do we need this? The number of page-table frames depends on the


