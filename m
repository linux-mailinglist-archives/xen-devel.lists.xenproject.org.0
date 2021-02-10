Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A64316BAA
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 17:49:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83664.156284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9sfG-00011f-H5; Wed, 10 Feb 2021 16:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83664.156284; Wed, 10 Feb 2021 16:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9sfG-000110-DL; Wed, 10 Feb 2021 16:48:30 +0000
Received: by outflank-mailman (input) for mailman id 83664;
 Wed, 10 Feb 2021 16:48:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9sfF-00010v-Gh
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 16:48:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id abb190ba-46fa-4cd4-afea-0190bcd40ad2;
 Wed, 10 Feb 2021 16:48:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0F920AE2D;
 Wed, 10 Feb 2021 16:48:27 +0000 (UTC)
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
X-Inumbo-ID: abb190ba-46fa-4cd4-afea-0190bcd40ad2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612975707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3BNKw5nysKMcyfik1KDgQujjMjTFovLjRJ+boG950gw=;
	b=CsbbXckuTNIqKkqXJHoK/q0a80N1ZxWX8vWzzrDUTmNJQ5aaKkhvGAbJeejEBG8KnC3nZs
	ERAWWcLciJsBpW1ovc9xrjA8B2OeX9x9B1r0fmaF2S4ZPs266Ak0Tj3xowlGNeyh75pGFs
	9sTTUudeJnS9VRL9a8GwXa6GNQ/WOqM=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] VMX: use a single, global APIC access page
Message-ID: <1b6a411b-84e7-bfb1-647e-511a13df838c@suse.com>
Date: Wed, 10 Feb 2021 17:48:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The address of this page is used by the CPU only to recognize when to
instead access the virtual APIC page instead. No accesses would ever go
to this page. It only needs to be present in the (CPU) page tables so
that address translation will produce its address as result for
respective accesses.

By making this page global, we also eliminate the need to refcount it,
or to assign it to any domain in the first place.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Hooking p2m insertion onto arch_domain_creation_finished() isn't very
nice, but I couldn't find any better hook (nor a good place where to
introduce a new one). In particular there look to be no hvm_funcs hooks
being used on a domain-wide basis (except for init/destroy of course).
I did consider connecting this to the setting of HVM_PARAM_IDENT_PT, but
considered this no better, the more that the tool stack could be smarter
and avoid setting that param when not needed.

I did further consider not allocating any real page at all, but just
using the address of some unpopulated space (which would require
announcing this page as reserved to Dom0, so it wouldn't put any PCI
MMIO BARs there). But I thought this would be too controversial, because
of the possible risks associated with this.

Perhaps the change to p2m_get_iommu_flags() should be in a separate
patch.

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1007,6 +1007,8 @@ int arch_domain_soft_reset(struct domain
 
 void arch_domain_creation_finished(struct domain *d)
 {
+    if ( is_hvm_domain(d) )
+        hvm_domain_creation_finished(d);
 }
 
 #define xen_vcpu_guest_context vcpu_guest_context
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
 
+static mfn_t __read_mostly apic_access_mfn;
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
 
@@ -411,21 +411,16 @@ static int vmx_domain_initialise(struct
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
-        return;
 
-    vmx_free_vlapic_mapping(d);
+    if ( !mfn_eq(apic_access_mfn, _mfn(0)) &&
+         set_mmio_p2m_entry(d, gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE),
+                            apic_access_mfn, PAGE_ORDER_4K) )
+        domain_crash(d);
 }
 
 static void vmx_init_ipt(struct vcpu *v)
@@ -2407,7 +2402,7 @@ static struct hvm_function_table __initd
     .cpu_up_prepare       = vmx_cpu_up_prepare,
     .cpu_dead             = vmx_cpu_dead,
     .domain_initialise    = vmx_domain_initialise,
-    .domain_relinquish_resources = vmx_domain_relinquish_resources,
+    .domain_creation_finished = domain_creation_finished,
     .vcpu_initialise      = vmx_vcpu_initialise,
     .vcpu_destroy         = vmx_vcpu_destroy,
     .save_cpu_ctxt        = vmx_save_vmcs_ctxt,
@@ -2653,7 +2648,7 @@ const struct hvm_function_table * __init
 {
     set_in_cr4(X86_CR4_VMXE);
 
-    if ( vmx_vmcs_init() )
+    if ( vmx_vmcs_init() || alloc_vlapic_mapping() )
     {
         printk("VMX: failed to initialise.\n");
         return NULL;
@@ -3208,7 +3203,7 @@ gp_fault:
     return X86EMUL_EXCEPTION;
 }
 
-static int vmx_alloc_vlapic_mapping(struct domain *d)
+static int __init alloc_vlapic_mapping(void)
 {
     struct page_info *pg;
     mfn_t mfn;
@@ -3216,53 +3211,28 @@ static int vmx_alloc_vlapic_mapping(stru
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
-
     mfn = page_to_mfn(pg);
     clear_domain_page(mfn);
-    d->arch.hvm.vmx.apic_access_mfn = mfn;
+    apic_access_mfn = mfn;
 
-    return set_mmio_p2m_entry(d, gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE), mfn,
-                              PAGE_ORDER_4K);
-}
-
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
+    return 0;
 }
 
 static void vmx_install_vlapic_mapping(struct vcpu *v)
 {
     paddr_t virt_page_ma, apic_page_ma;
 
-    if ( mfn_eq(v->domain->arch.hvm.vmx.apic_access_mfn, _mfn(0)) )
+    if ( mfn_eq(apic_access_mfn, _mfn(0)) )
         return;
 
     ASSERT(cpu_has_vmx_virtualize_apic_accesses);
 
     virt_page_ma = page_to_maddr(vcpu_vlapic(v)->regs_page);
-    apic_page_ma = mfn_to_maddr(v->domain->arch.hvm.vmx.apic_access_mfn);
+    apic_page_ma = mfn_to_maddr(apic_access_mfn);
 
     vmx_vmcs_enter(v);
     __vmwrite(VIRTUAL_APIC_PAGE_ADDR, virt_page_ma);
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -106,6 +106,7 @@ struct hvm_function_table {
      * Initialise/destroy HVM domain/vcpu resources
      */
     int  (*domain_initialise)(struct domain *d);
+    void (*domain_creation_finished)(struct domain *d);
     void (*domain_relinquish_resources)(struct domain *d);
     void (*domain_destroy)(struct domain *d);
     int  (*vcpu_initialise)(struct vcpu *v);
@@ -390,6 +391,12 @@ static inline bool hvm_has_set_descripto
     return hvm_funcs.set_descriptor_access_exiting;
 }
 
+static inline void hvm_domain_creation_finished(struct domain *d)
+{
+    if ( hvm_funcs.domain_creation_finished )
+        alternative_vcall(hvm_funcs.domain_creation_finished, d);
+}
+
 static inline int
 hvm_guest_x86_mode(struct vcpu *v)
 {
@@ -765,6 +772,11 @@ static inline void hvm_invlpg(const stru
 {
     ASSERT_UNREACHABLE();
 }
+
+static inline void hvm_domain_creation_finished(struct domain *d)
+{
+    ASSERT_UNREACHABLE();
+}
 
 /*
  * Shadow code needs further cleanup to eliminate some HVM-only paths. For
--- a/xen/include/asm-x86/hvm/vmx/vmcs.h
+++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
@@ -58,7 +58,6 @@ struct ept_data {
 #define _VMX_DOMAIN_PML_ENABLED    0
 #define VMX_DOMAIN_PML_ENABLED     (1ul << _VMX_DOMAIN_PML_ENABLED)
 struct vmx_domain {
-    mfn_t apic_access_mfn;
     /* VMX_DOMAIN_* */
     unsigned int status;
 
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -935,6 +935,9 @@ static inline unsigned int p2m_get_iommu
         flags = IOMMUF_readable;
         if ( !rangeset_contains_singleton(mmio_ro_ranges, mfn_x(mfn)) )
             flags |= IOMMUF_writable;
+        /* VMX'es APIC access page is global and hence has no owner. */
+        if ( mfn_valid(mfn) && !page_get_owner(mfn_to_page(mfn)) )
+            flags = 0;
         break;
     default:
         flags = 0;

