Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FD23690A2
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 12:53:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116145.221727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtQj-0003r4-A0; Fri, 23 Apr 2021 10:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116145.221727; Fri, 23 Apr 2021 10:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtQj-0003qf-6q; Fri, 23 Apr 2021 10:53:01 +0000
Received: by outflank-mailman (input) for mailman id 116145;
 Fri, 23 Apr 2021 10:53:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZtQi-0003qX-6D
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 10:53:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 022f5376-5ce4-4f98-9068-a092707b59a9;
 Fri, 23 Apr 2021 10:52:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A44CBB05E;
 Fri, 23 Apr 2021 10:52:57 +0000 (UTC)
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
X-Inumbo-ID: 022f5376-5ce4-4f98-9068-a092707b59a9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619175177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oKJUzjD5NEc7cfDAEFdzVdDF07cDm6q66hm4fqeNQ88=;
	b=ueTKK1qvt3muiPrrKn9vxDRIoE6oahxpmJAm1xLQ7x7YEG7/xJha88yqbaeX1gvhoaDWZp
	pYwmtPO7Wzq8ekiGGIEXzAe0xF14miX5N9zcy4pVcB1OpdE4FXsHJSOZRzMtI6AiN+K8jZ
	zW077bAdySPLvJtVeb5rmk5c+ynpvPM=
Subject: [PATCH v4 1/3] VMX: use a single, global APIC access page
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Tim Deegan <tim@xen.org>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <3e7ad009-f062-d58a-9380-103ce1573a73@suse.com>
Message-ID: <837a427a-a74e-00e9-70c7-1d3cfa28b30c@suse.com>
Date: Fri, 23 Apr 2021 12:52:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3e7ad009-f062-d58a-9380-103ce1573a73@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The address of this page is used by the CPU only to recognize when to
access the virtual APIC page instead. No accesses would ever go to this
page. It only needs to be present in the (CPU) page tables so that
address translation will produce its address as result for respective
accesses.

By making this page global, we also eliminate the need to refcount it,
or to assign it to any domain in the first place.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v5: Init apic_access_mfn to INVALID_MFN. Move assignment out of if()
    condition. Introduce page_suppress_refcounting() and
    page_refcounting_suppressed().
v4: Set PGC_extra on the page. Make shadow mode work.
v3: Split p2m insertion change to a separate patch.
v2: Avoid insertion when !has_vlapic(). Split off change to
    p2m_get_iommu_flags().
---
I did further consider not allocating any real page at all, but just
using the address of some unpopulated space (which would require
announcing this page as reserved to Dom0, so it wouldn't put any PCI
MMIO BARs there). But I thought this would be too controversial, because
of the possible risks associated with this.

--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -66,8 +66,7 @@ boolean_param("force-ept", opt_force_ept
 static void vmx_ctxt_switch_from(struct vcpu *v);
 static void vmx_ctxt_switch_to(struct vcpu *v);
 
-static int  vmx_alloc_vlapic_mapping(struct domain *d);
-static void vmx_free_vlapic_mapping(struct domain *d);
+static int alloc_vlapic_mapping(void);
 static void vmx_install_vlapic_mapping(struct vcpu *v);
 static void vmx_update_guest_cr(struct vcpu *v, unsigned int cr,
                                 unsigned int flags);
@@ -78,6 +77,8 @@ static int vmx_msr_read_intercept(unsign
 static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content);
 static void vmx_invlpg(struct vcpu *v, unsigned long linear);
 
+static mfn_t __read_mostly apic_access_mfn = INVALID_MFN_INITIALIZER;
+
 /* Values for domain's ->arch.hvm_domain.pi_ops.flags. */
 #define PI_CSW_FROM (1u << 0)
 #define PI_CSW_TO   (1u << 1)
@@ -401,7 +402,6 @@ static int vmx_domain_initialise(struct
         .to   = vmx_ctxt_switch_to,
         .tail = vmx_do_resume,
     };
-    int rc;
 
     d->arch.ctxt_switch = &csw;
 
@@ -411,28 +411,22 @@ static int vmx_domain_initialise(struct
      */
     d->arch.hvm.vmx.exec_sp = is_hardware_domain(d) || opt_ept_exec_sp;
 
-    if ( !has_vlapic(d) )
-        return 0;
-
-    if ( (rc = vmx_alloc_vlapic_mapping(d)) != 0 )
-        return rc;
-
     return 0;
 }
 
-static void vmx_domain_relinquish_resources(struct domain *d)
+static void domain_creation_finished(struct domain *d)
 {
-    if ( !has_vlapic(d) )
+    gfn_t gfn = gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE);
+    uint8_t ipat;
+
+    if ( !has_vlapic(d) || mfn_eq(apic_access_mfn, INVALID_MFN) )
         return;
 
-    vmx_free_vlapic_mapping(d);
-}
+    ASSERT(epte_get_entry_emt(d, gfn_x(gfn), apic_access_mfn, 0, &ipat,
+                              true) == MTRR_TYPE_WRBACK);
+    ASSERT(ipat);
 
-static void domain_creation_finished(struct domain *d)
-{
-    if ( has_vlapic(d) && !mfn_eq(d->arch.hvm.vmx.apic_access_mfn, _mfn(0)) &&
-         set_mmio_p2m_entry(d, gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE),
-                            d->arch.hvm.vmx.apic_access_mfn, PAGE_ORDER_4K) )
+    if ( set_mmio_p2m_entry(d, gfn, apic_access_mfn, PAGE_ORDER_4K) )
         domain_crash(d);
 }
 
@@ -2415,7 +2409,6 @@ static struct hvm_function_table __initd
     .cpu_up_prepare       = vmx_cpu_up_prepare,
     .cpu_dead             = vmx_cpu_dead,
     .domain_initialise    = vmx_domain_initialise,
-    .domain_relinquish_resources = vmx_domain_relinquish_resources,
     .domain_creation_finished = domain_creation_finished,
     .vcpu_initialise      = vmx_vcpu_initialise,
     .vcpu_destroy         = vmx_vcpu_destroy,
@@ -2662,7 +2655,7 @@ const struct hvm_function_table * __init
 {
     set_in_cr4(X86_CR4_VMXE);
 
-    if ( vmx_vmcs_init() )
+    if ( vmx_vmcs_init() || alloc_vlapic_mapping() )
     {
         printk("VMX: failed to initialise.\n");
         return NULL;
@@ -3224,7 +3217,7 @@ gp_fault:
     return X86EMUL_EXCEPTION;
 }
 
-static int vmx_alloc_vlapic_mapping(struct domain *d)
+static int __init alloc_vlapic_mapping(void)
 {
     struct page_info *pg;
     mfn_t mfn;
@@ -3232,52 +3225,34 @@ static int vmx_alloc_vlapic_mapping(stru
     if ( !cpu_has_vmx_virtualize_apic_accesses )
         return 0;
 
-    pg = alloc_domheap_page(d, MEMF_no_refcount);
+    pg = alloc_domheap_page(NULL, 0);
     if ( !pg )
         return -ENOMEM;
 
-    if ( !get_page_and_type(pg, d, PGT_writable_page) )
-    {
-        /*
-         * The domain can't possibly know about this page yet, so failure
-         * here is a clear indication of something fishy going on.
-         */
-        domain_crash(d);
-        return -ENODATA;
-    }
+    /*
+     * Signal to shadow code that this page cannot be refcounted. This also
+     * makes epte_get_entry_emt() recognize this page as "special".
+     */
+    page_suppress_refcounting(pg);
 
     mfn = page_to_mfn(pg);
     clear_domain_page(mfn);
-    d->arch.hvm.vmx.apic_access_mfn = mfn;
+    apic_access_mfn = mfn;
 
     return 0;
 }
 
-static void vmx_free_vlapic_mapping(struct domain *d)
-{
-    mfn_t mfn = d->arch.hvm.vmx.apic_access_mfn;
-
-    d->arch.hvm.vmx.apic_access_mfn = _mfn(0);
-    if ( !mfn_eq(mfn, _mfn(0)) )
-    {
-        struct page_info *pg = mfn_to_page(mfn);
-
-        put_page_alloc_ref(pg);
-        put_page_and_type(pg);
-    }
-}
-
 static void vmx_install_vlapic_mapping(struct vcpu *v)
 {
     paddr_t virt_page_ma, apic_page_ma;
 
-    if ( mfn_eq(v->domain->arch.hvm.vmx.apic_access_mfn, _mfn(0)) )
+    if ( !has_vlapic(v->domain) || mfn_eq(apic_access_mfn, INVALID_MFN) )
         return;
 
     ASSERT(cpu_has_vmx_virtualize_apic_accesses);
 
     virt_page_ma = page_to_maddr(vcpu_vlapic(v)->regs_page);
-    apic_page_ma = mfn_to_maddr(v->domain->arch.hvm.vmx.apic_access_mfn);
+    apic_page_ma = mfn_to_maddr(apic_access_mfn);
 
     vmx_vmcs_enter(v);
     __vmwrite(VIRTUAL_APIC_PAGE_ADDR, virt_page_ma);
--- a/xen/arch/x86/mm/shadow/set.c
+++ b/xen/arch/x86/mm/shadow/set.c
@@ -94,6 +94,15 @@ shadow_get_page_from_l1e(shadow_l1e_t sl
     ASSERT(!sh_l1e_is_magic(sl1e));
     ASSERT(shadow_mode_refcounts(d));
 
+    /*
+     * Check whether refcounting is suppressed on this page. For example,
+     * VMX'es APIC access MFN is just a surrogate page.  It doesn't actually
+     * get accessed, and hence there's no need to refcount it.
+     */
+    mfn = shadow_l1e_get_mfn(sl1e);
+    if ( mfn_valid(mfn) && page_refcounting_suppressed(mfn_to_page(mfn)) )
+        return 0;
+
     res = get_page_from_l1e(sl1e, d, d);
 
     /*
--- a/xen/arch/x86/mm/shadow/types.h
+++ b/xen/arch/x86/mm/shadow/types.h
@@ -276,9 +276,16 @@ int shadow_set_l4e(struct domain *d, sha
 static void inline
 shadow_put_page_from_l1e(shadow_l1e_t sl1e, struct domain *d)
 {
+    mfn_t mfn;
+
     if ( !shadow_mode_refcounts(d) )
         return;
 
+    if ( mfn_valid(mfn = shadow_l1e_get_mfn(sl1e)) &&
+         /* See the respective comment in shadow_get_page_from_l1e(). */
+         page_refcounting_suppressed(mfn_to_page(mfn)) )
+        return;
+
     put_page_from_l1e(sl1e, d);
 }
 
--- a/xen/include/asm-x86/hvm/vmx/vmcs.h
+++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
@@ -58,7 +58,6 @@ struct ept_data {
 #define _VMX_DOMAIN_PML_ENABLED    0
 #define VMX_DOMAIN_PML_ENABLED     (1ul << _VMX_DOMAIN_PML_ENABLED)
 struct vmx_domain {
-    mfn_t apic_access_mfn;
     /* VMX_DOMAIN_* */
     unsigned int status;
 
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -82,7 +82,7 @@
 #define PGC_state_offlined PG_mask(2, 9)
 #define PGC_state_free    PG_mask(3, 9)
 #define page_state_is(pg, st) (((pg)->count_info&PGC_state) == PGC_state_##st)
-/* Page is not reference counted */
+/* Page is not reference counted (see below for caveats) */
 #define _PGC_extra        PG_shift(10)
 #define PGC_extra         PG_mask(1, 10)
 
@@ -374,6 +374,24 @@ void zap_ro_mpt(mfn_t mfn);
 
 bool is_iomem_page(mfn_t mfn);
 
+/*
+ * Pages with no owner which may get passed to functions wanting to
+ * refcount them can be marked PGC_extra to bypass this refcounting (which
+ * would fail due to the lack of an owner).
+ *
+ * (For pages with owner PGC_extra has different meaning.)
+ */
+static inline void page_suppress_refcounting(struct page_info *pg)
+{
+   ASSERT(!page_get_owner(pg));
+   pg->count_info |= PGC_extra;
+}
+
+static inline bool page_refcounting_suppressed(const struct page_info *pg)
+{
+    return !page_get_owner(pg) && (pg->count_info & PGC_extra);
+}
+
 struct platform_bad_page {
     unsigned long mfn;
     unsigned int order;


