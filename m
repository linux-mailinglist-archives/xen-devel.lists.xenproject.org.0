Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF60361F12
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 13:47:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111671.213554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXMw6-0006zJ-1H; Fri, 16 Apr 2021 11:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111671.213554; Fri, 16 Apr 2021 11:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXMw5-0006yx-SU; Fri, 16 Apr 2021 11:46:57 +0000
Received: by outflank-mailman (input) for mailman id 111671;
 Fri, 16 Apr 2021 11:46:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kml=JN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lXMw4-0006ys-Pk
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 11:46:56 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37f231ac-028d-4ad7-9694-ba8d70f38483;
 Fri, 16 Apr 2021 11:46:55 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 37f231ac-028d-4ad7-9694-ba8d70f38483
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618573615;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NkMCqHSKHFLMvJNKqGMYWZ26r6posdAwvMoxLS0/D9A=;
  b=TqwetfnNwPAwAomSCRRFCby5tomR0p6y1Bdtm/7z9H6LSK47/n0LCRrR
   QZtPYDGg6ZdTKq4p0qBJZcHIOfIXCMLOGuBqwGVy2/wnQurEWKPiZQRaw
   3nPo15JjV26I39xV+p4xIMTbsfVAIo+NYflo3EnUzPsD/rRoNvv6Lvol/
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PutT/HHvpnFA/3eZTflPqJXQCzpn4S6t5tzuCWQv17wP9dUQrRemk4nrcY8Rez5zn/t1/EHeAo
 TcBmvolntGEYa+KVHoHwTWLY0yGYgnTR7xC0IaFaLLlkntb7FnugaB9AVmM9/VM5k3i7bTToqf
 PwSyEsvKdRq0xmlDFV4LvoUiEHkLVMvj7z1FGkP+dOJ2ol3k6bJ6MMOQYGtk6pB12eG93Rv6uW
 7HODQrsJbIbSahpPeVCxl/vl4KTbVPshL3cuzew6/dhrtUCD1ZtIWouhSYzhTwAoganL+C4mfg
 iyo=
X-SBRS: 4.0
X-MesageID: 42132913
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3dRZKaFNWcxjUNBWpLqF+ZXXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7MBXh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbakrD38Zn/+
 Nbf6B6YeeAaWRSpczx7BCkV/Mpx9ea+K6l7N2uuktFZysCUdAc0y5SDAGHHkpqACxPApQkHJ
 SRj/A30waIU3IRc8i9Gz05T/HOzue7067OTDwnI1oc6AeIhS6187KSKXOl9zoXTj8n+8ZSzU
 HriAr8j5/TyM2T6hiZ7GPL6oQTpd2J8KowOOWtkc4TEzP2l0KTSb8JYdftgBkQgMWCrGkni8
 PNpRBIBbU011r0cnuuqRXgnynMuQxem0PK8lOTjXv9rcGRfltTZLsl9PspCifx0EYusMpx16
 hGxQuixulqJCndlyfw7cWgbWAXqmOIoGEvmeNWr3tTXZp2Us4ukaUj/VhYGJpFISTi6IpPKp
 gQMOjg4p9tACmnRkGclEZuxcGhRR0Ib0S7a3lHkMmSzzVtkGtnz0EVrfZv/EsoxdYQWoRg4e
 Lcas1T9Y1mf4s3dqR7PeEbXI+eNQX2LH6tQQGvCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtEYpEnieUfGm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmqVE0uqc29uP8Sa/erAM
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5IdV0+RpNnIbqnnrPbSfvqWBLeFK0d/ZkrPRl
 84GBTjLsRJ6U6mHlXihgLKZn/rckvjuZ1qFqzX+PUS1ZgNOoVAvhN9syXk2ui7bRl59oAmdk
 p3J73q1omho3OtwGrO52J1fhpRZ3wlv4nIYjdvn0snIkn0ebEMt5G0YmZJxkaKIRd5UofTGA
 5brFJn5LKvI/WrtH4fIuPiFljfo2oYpXqMQZtZsLaE/93ZdpQxCYtjXrdwGwXNHxl8gh1rt2
 9HdQ8BSibkZ27ToJTgqKZRKPDUdtF6jgvuC9VTs2jjuUKVotxqWmEWRCe0UcmcgR8nQj1dgl
 EZyd5PvJOw3RKUbUcviuUxN1NBLFmNCLVdFQKfecF/gbbwYjx9Sm+MmB2Xgxw+YXDR6k0Xn2
 DtRBfkKc3jMx54gDR42ryv2E5ofm+dFngAHUxSgMlYLyD6nVpdlcWMfbG+1mONbEBq+JBqDB
 j1JR0IIg1vwNir0gWygzjqLwR++rwnIvHdALM/c7vax3OqL8mSmbsbGuJPlawVfezGo6sFV/
 mSdBSSKy69A+Q12xaNrnJgIyVsrmI4+MmYmiHN/Sy80TonGvzZLE59S7xzGaDR00H0A/KJ2o
 5+l9Q7oK+5NXjwcMePzcjsHn5+AwKWpW69VOczr59I+ao0qbtoBpHeFT/FzmtO0hl7LMD6ki
 olMedGyaGEPo9kZMoJfS1FulIvidSUNUMu9hXsHfVWRyBjs1bLe9eSp7bYo7smBUOM4AP2JF
 mE6iVYu/PIRTGK27IWA785SF4mLXQU+TBn5qePZofQAAKle6VY8F22PmS0fbVdRKKGcI9g7y
 pS8pWNhauaZiD40AffsX9nOapI6X+gWt73DwSWG+JEmubKfWikk++v+oq0gzj2QzfgNBhdio
 1BaEAKbsNMzjMll5Y61yCuSqrx5kIp+mEuqw1PhxrowMyh5myeAERNdQveiZ9SVSNIMneJgd
 /emNLomkjV8XxAw93bCExUfttSANAeQYj8Mjd2JaErzfWV1rtqhj4GfQwnAGE9gi3sxu9q3b
 +23/PJRu3pYE2YdG4p6HpCHY57nisitGFGfYy/9PuGE00qKtI=
X-IronPort-AV: E=Sophos;i="5.82,226,1613451600"; 
   d="scan'208";a="42132913"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/pv: Improve dom0_update_physmap() with CONFIG_SPECULATIVE_HARDEN_BRANCH
Date: Fri, 16 Apr 2021 12:46:45 +0100
Message-ID: <20210416114645.21530-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

dom0_update_physmap() is mostly called in two tight loops, where the lfences
hidden in is_pv_32bit_domain() have a substantial impact.

None of the boot time construction needs protection against malicious
speculation, so use a local variable and calculate is_pv_32bit_domain() just
once.

Reformat the some of the code for legibility, now that the volume has reduced,
and removal of some gratuitous negations.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

I appear to written this patch ages ago, and never got aroudn to sending it.

I haven't perf tested this, but it is faster without a shadow of a doubt.
---
 xen/arch/x86/pv/dom0_build.c     | 52 +++++++++++++++++++---------------------
 xen/arch/x86/pv/shim.c           |  6 +++--
 xen/include/asm-x86/dom0_build.h |  2 +-
 3 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 265f56a3f8..44ed3dafd2 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -31,10 +31,10 @@
 #define L3_PROT (BASE_PROT|_PAGE_DIRTY)
 #define L4_PROT (BASE_PROT|_PAGE_DIRTY)
 
-void __init dom0_update_physmap(struct domain *d, unsigned long pfn,
+void __init dom0_update_physmap(bool compat, unsigned long pfn,
                                 unsigned long mfn, unsigned long vphysmap_s)
 {
-    if ( !is_pv_32bit_domain(d) )
+    if ( !compat )
         ((unsigned long *)vphysmap_s)[pfn] = mfn;
     else
         ((unsigned int *)vphysmap_s)[pfn] = mfn;
@@ -289,7 +289,7 @@ int __init dom0_construct_pv(struct domain *d,
                              char *cmdline)
 {
     int i, rc, order, machine;
-    bool compatible;
+    bool compatible, compat;
     struct cpu_user_regs *regs;
     unsigned long pfn, mfn;
     unsigned long nr_pages;
@@ -380,6 +380,8 @@ int __init dom0_construct_pv(struct domain *d,
     }
 #endif
 
+    compat = is_pv_32bit_domain(d);
+
     if ( elf_64bit(&elf) && machine == EM_X86_64 )
         compatible = true;
 
@@ -463,9 +465,9 @@ int __init dom0_construct_pv(struct domain *d,
         vinitrd_end    = vinitrd_start + initrd_len;
         vphysmap_start = round_pgup(vinitrd_end);
     }
-    vphysmap_end     = vphysmap_start + (nr_pages * (!is_pv_32bit_domain(d) ?
-                                                     sizeof(unsigned long) :
-                                                     sizeof(unsigned int)));
+    vphysmap_end = vphysmap_start +
+        (nr_pages * (compat ? sizeof(unsigned int) : sizeof(unsigned long)));
+
     if ( parms.p2m_base != UNSET_ADDR )
         vphysmap_end = vphysmap_start;
     vstartinfo_start = round_pgup(vphysmap_end);
@@ -496,9 +498,9 @@ int __init dom0_construct_pv(struct domain *d,
 #define NR(_l,_h,_s) \
     (((((_h) + ((1UL<<(_s))-1)) & ~((1UL<<(_s))-1)) - \
        ((_l) & ~((1UL<<(_s))-1))) >> (_s))
-        if ( (!is_pv_32bit_domain(d) + /* # L4 */
+        if ( (!compat + /* # L4 */
               NR(v_start, v_end, L4_PAGETABLE_SHIFT) + /* # L3 */
-              (!is_pv_32bit_domain(d) ?
+              (!compat ?
                NR(v_start, v_end, L3_PAGETABLE_SHIFT) : /* # L2 */
                4) + /* # compat L2 */
               NR(v_start, v_end, L2_PAGETABLE_SHIFT))  /* # L1 */
@@ -600,23 +602,22 @@ int __init dom0_construct_pv(struct domain *d,
         mpt_alloc -= PAGE_ALIGN(initrd_len);
 
     /* Overlap with Xen protected area? */
-    if ( !is_pv_32bit_domain(d) ?
-         ((v_start < HYPERVISOR_VIRT_END) &&
-          (v_end > HYPERVISOR_VIRT_START)) :
-         (v_end > HYPERVISOR_COMPAT_VIRT_START(d)) )
+    if ( compat
+         ? v_end > HYPERVISOR_COMPAT_VIRT_START(d)
+         : (v_start < HYPERVISOR_VIRT_END) && (v_end > HYPERVISOR_VIRT_START) )
     {
         printk("DOM0 image overlaps with Xen private area.\n");
         rc = -EINVAL;
         goto out;
     }
 
-    if ( is_pv_32bit_domain(d) )
+    if ( compat )
     {
         v->arch.pv.failsafe_callback_cs = FLAT_COMPAT_KERNEL_CS;
         v->arch.pv.event_callback_cs    = FLAT_COMPAT_KERNEL_CS;
     }
 
-    if ( !is_pv_32bit_domain(d) )
+    if ( !compat )
     {
         maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l4_page_table;
         l4start = l4tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
@@ -677,8 +678,7 @@ int __init dom0_construct_pv(struct domain *d,
             mfn = pfn++;
         else
             mfn = initrd_mfn++;
-        *l1tab = l1e_from_pfn(mfn, (!is_pv_32bit_domain(d) ?
-                                    L1_PROT : COMPAT_L1_PROT));
+        *l1tab = l1e_from_pfn(mfn, compat ? COMPAT_L1_PROT : L1_PROT);
         l1tab++;
 
         page = mfn_to_page(_mfn(mfn));
@@ -687,7 +687,7 @@ int __init dom0_construct_pv(struct domain *d,
             BUG();
     }
 
-    if ( is_pv_32bit_domain(d) )
+    if ( compat )
     {
         l2_pgentry_t *l2t;
 
@@ -806,7 +806,7 @@ int __init dom0_construct_pv(struct domain *d,
         if ( pfn > REVERSE_START && (vinitrd_start || pfn < initrd_pfn) )
             mfn = alloc_epfn - (pfn - REVERSE_START);
 #endif
-        dom0_update_physmap(d, pfn, mfn, vphysmap_start);
+        dom0_update_physmap(compat, pfn, mfn, vphysmap_start);
         if ( !(pfn & 0xfffff) )
             process_pending_softirqs();
     }
@@ -818,12 +818,12 @@ int __init dom0_construct_pv(struct domain *d,
         BUG_ON(SHARED_M2P(get_gpfn_from_mfn(mfn)));
         if ( get_gpfn_from_mfn(mfn) >= count )
         {
-            BUG_ON(is_pv_32bit_domain(d));
+            BUG_ON(compat);
             if ( !page->u.inuse.type_info &&
                  !get_page_and_type(page, d, PGT_writable_page) )
                 BUG();
 
-            dom0_update_physmap(d, pfn, mfn, vphysmap_start);
+            dom0_update_physmap(compat, pfn, mfn, vphysmap_start);
             ++pfn;
             if ( !(pfn & 0xfffff) )
                 process_pending_softirqs();
@@ -843,7 +843,7 @@ int __init dom0_construct_pv(struct domain *d,
 #ifndef NDEBUG
 #define pfn (nr_pages - 1 - (pfn - (alloc_epfn - alloc_spfn)))
 #endif
-            dom0_update_physmap(d, pfn, mfn, vphysmap_start);
+            dom0_update_physmap(compat, pfn, mfn, vphysmap_start);
 #undef pfn
             page++; pfn++;
             if ( !(pfn & 0xfffff) )
@@ -878,7 +878,7 @@ int __init dom0_construct_pv(struct domain *d,
                           vphysmap_start, si);
 
 #ifdef CONFIG_COMPAT
-    if ( is_pv_32bit_domain(d) )
+    if ( compat )
         xlat_start_info(si, pv_shim ? XLAT_start_info_console_domU
                                     : XLAT_start_info_console_dom0);
 #endif
@@ -899,11 +899,9 @@ int __init dom0_construct_pv(struct domain *d,
      */
     regs = &v->arch.user_regs;
     regs->ds = regs->es = regs->fs = regs->gs =
-        !is_pv_32bit_domain(d) ? FLAT_KERNEL_DS : FLAT_COMPAT_KERNEL_DS;
-    regs->ss = (!is_pv_32bit_domain(d) ?
-                FLAT_KERNEL_SS : FLAT_COMPAT_KERNEL_SS);
-    regs->cs = (!is_pv_32bit_domain(d) ?
-                FLAT_KERNEL_CS : FLAT_COMPAT_KERNEL_CS);
+               (compat ? FLAT_COMPAT_KERNEL_DS : FLAT_KERNEL_DS);
+    regs->ss = (compat ? FLAT_COMPAT_KERNEL_SS : FLAT_KERNEL_SS);
+    regs->cs = (compat ? FLAT_COMPAT_KERNEL_CS : FLAT_KERNEL_CS);
     regs->rip = parms.virt_entry;
     regs->rsp = vstack_end;
     regs->rsi = vstartinfo_start;
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index 92cb1adeed..1b86fc247e 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -204,6 +204,7 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pgentry_t *l4start,
                               unsigned long console_va, unsigned long vphysmap,
                               start_info_t *si)
 {
+    bool compat = is_pv_32bit_domain(d);
     hypercall_table_t *rw_pv_hypercall_table;
     uint64_t param = 0;
     long rc;
@@ -217,7 +218,8 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pgentry_t *l4start,
     {                                                                          \
         share_xen_page_with_guest(mfn_to_page(_mfn(param)), d, SHARE_rw);      \
         replace_va_mapping(d, l4start, va, _mfn(param));                       \
-        dom0_update_physmap(d, PFN_DOWN((va) - va_start), param, vphysmap);    \
+        dom0_update_physmap(compat,                                            \
+                            PFN_DOWN((va) - va_start), param, vphysmap);       \
     }                                                                          \
     else                                                                       \
     {                                                                          \
@@ -244,7 +246,7 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pgentry_t *l4start,
         si->console.domU.mfn = mfn_x(console_mfn);
         share_xen_page_with_guest(mfn_to_page(console_mfn), d, SHARE_rw);
         replace_va_mapping(d, l4start, console_va, console_mfn);
-        dom0_update_physmap(d, (console_va - va_start) >> PAGE_SHIFT,
+        dom0_update_physmap(compat, (console_va - va_start) >> PAGE_SHIFT,
                             mfn_x(console_mfn), vphysmap);
         consoled_set_ring_addr(page);
     }
diff --git a/xen/include/asm-x86/dom0_build.h b/xen/include/asm-x86/dom0_build.h
index 0b797b5806..a5f8c9e67f 100644
--- a/xen/include/asm-x86/dom0_build.h
+++ b/xen/include/asm-x86/dom0_build.h
@@ -26,7 +26,7 @@ int dom0_construct_pvh(struct domain *d, const module_t *image,
 unsigned long dom0_paging_pages(const struct domain *d,
                                 unsigned long nr_pages);
 
-void dom0_update_physmap(struct domain *d, unsigned long pfn,
+void dom0_update_physmap(bool compat, unsigned long pfn,
                          unsigned long mfn, unsigned long vphysmap_s);
 
 #endif	/* _DOM0_BUILD_H_ */
-- 
2.11.0


