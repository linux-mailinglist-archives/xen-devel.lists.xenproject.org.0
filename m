Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BA4321492
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 11:57:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87924.165177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE8ti-0004BG-9A; Mon, 22 Feb 2021 10:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87924.165177; Mon, 22 Feb 2021 10:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE8ti-0004Aq-5i; Mon, 22 Feb 2021 10:57:02 +0000
Received: by outflank-mailman (input) for mailman id 87924;
 Mon, 22 Feb 2021 10:57:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lE8tg-0004AA-V7
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 10:57:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16605c37-2f38-4771-b03e-73c7aa7b963f;
 Mon, 22 Feb 2021 10:56:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E2F7FAF23;
 Mon, 22 Feb 2021 10:56:58 +0000 (UTC)
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
X-Inumbo-ID: 16605c37-2f38-4771-b03e-73c7aa7b963f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613991419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8uj5lky+beBmzi1shgy61QnM9D1z2TNAJ5ARxpmCwuk=;
	b=dETcHXuZtaAQA4Kh8SPgm2s3OPELVTc6arhwtd9UXJ227s7dLkKVrvFg9oHknfWLuUF4b0
	TDtPNu47G9x3kHzcdiAoczKUMvc+Lwkq6JZMm2PyyRmBJykVY1PtHNMy6dKnkZwHPlOMyX
	ydoibrdOJhoaxkXxNhjYCOY9ppJcKIo=
Subject: [PATCH v3 1/2][4.15] VMX: delay p2m insertion of APIC access page
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Julien Grall <julien@xen.org>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
Message-ID: <90271e69-c07e-a32c-5531-a79b10ef03dd@suse.com>
Date: Mon, 22 Feb 2021 11:56:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Inserting the mapping at domain creation time leads to a memory leak
when the creation fails later on and the domain uses separate CPU and
IOMMU page tables - the latter requires intermediate page tables to be
allocated, but there's no freeing of them at present in this case. Since
we don't need the p2m insertion to happen this early, avoid the problem
altogether by deferring it until the last possible point. This comes at
the price of not being able to handle an error other than by crashing
the domain.

Reported-by: Julien Grall <julien@xen.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New (split out).
---
Hooking p2m insertion onto arch_domain_creation_finished() isn't very
nice, but I couldn't find any better hook (nor a good place where to
introduce a new one). In particular there look to be no hvm_funcs hooks
being used on a domain-wide basis (except for init/destroy of course).
I did consider connecting this to the setting of HVM_PARAM_IDENT_PT, but
considered this no better, the more that the tool stack could be smarter
and avoid setting that param when not needed.

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
@@ -428,6 +428,14 @@ static void vmx_domain_relinquish_resour
     vmx_free_vlapic_mapping(d);
 }
 
+static void domain_creation_finished(struct domain *d)
+{
+    if ( has_vlapic(d) && !mfn_eq(d->arch.hvm.vmx.apic_access_mfn, _mfn(0)) &&
+         set_mmio_p2m_entry(d, gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE),
+                            d->arch.hvm.vmx.apic_access_mfn, PAGE_ORDER_4K) )
+        domain_crash(d);
+}
+
 static void vmx_init_ipt(struct vcpu *v)
 {
     unsigned int size = v->domain->vmtrace_size;
@@ -2408,6 +2416,7 @@ static struct hvm_function_table __initd
     .cpu_dead             = vmx_cpu_dead,
     .domain_initialise    = vmx_domain_initialise,
     .domain_relinquish_resources = vmx_domain_relinquish_resources,
+    .domain_creation_finished = domain_creation_finished,
     .vcpu_initialise      = vmx_vcpu_initialise,
     .vcpu_destroy         = vmx_vcpu_destroy,
     .save_cpu_ctxt        = vmx_save_vmcs_ctxt,
@@ -3234,8 +3243,7 @@ static int vmx_alloc_vlapic_mapping(stru
     clear_domain_page(mfn);
     d->arch.hvm.vmx.apic_access_mfn = mfn;
 
-    return set_mmio_p2m_entry(d, gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE), mfn,
-                              PAGE_ORDER_4K);
+    return 0;
 }
 
 static void vmx_free_vlapic_mapping(struct domain *d)
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


