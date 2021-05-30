Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BE7395257
	for <lists+xen-devel@lfdr.de>; Sun, 30 May 2021 19:28:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134292.249942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnPE4-0005Zw-Ss; Sun, 30 May 2021 17:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134292.249942; Sun, 30 May 2021 17:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnPE4-0005Rs-IE; Sun, 30 May 2021 17:27:48 +0000
Received: by outflank-mailman (input) for mailman id 134292;
 Sun, 30 May 2021 15:06:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GvOc=KZ=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1lnN1Y-0000PC-09
 for xen-devel@lists.xenproject.org; Sun, 30 May 2021 15:06:44 +0000
Received: from mail-pj1-x102e.google.com (unknown [2607:f8b0:4864:20::102e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd11f8a9-b1f9-444a-b7fb-b7a2652d1e5e;
 Sun, 30 May 2021 15:06:39 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 jz2-20020a17090b14c2b0290162cf0b5a35so1479380pjb.5
 for <xen-devel@lists.xenproject.org>; Sun, 30 May 2021 08:06:39 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:9:dc2d:80ab:c3f3:1524])
 by smtp.gmail.com with ESMTPSA id b15sm8679688pfi.100.2021.05.30.08.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 08:06:38 -0700 (PDT)
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
X-Inumbo-ID: bd11f8a9-b1f9-444a-b7fb-b7a2652d1e5e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N7+X8C2xvctqats8In2MEizKCmhW7oGccQhxaGVYYMQ=;
        b=q7tWZton5iDKuT87fqyJEg2jMh65azm2dNFTU3sW+h6mvDH0LxlutXdO1Li/Bjijeg
         PwLdnmy0UWtYFAeQwSDrKPo7iqtlkOoQXcYZDnVe9dfNlYbKWOkVo5B0Qg8ecs08m3j/
         /uwMeD/kq1dIPgdCOE3VSDHtE4JUs4zmtILg/nC6KaBgzXjX970xYYivzVks4euWQADa
         lO90RfeNp6TullZFr9iAm5vXL/6z7Ihlfg8y/XtCyp4U5qWC3X75hxRMxGkME2ndXSTn
         HfLDHt92ew6o18+Ht4Tek8bvQWh2N+fa5+JDSf/+mdfR6e2Uq+pk5PFeDT+DkVytt5Rb
         musg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N7+X8C2xvctqats8In2MEizKCmhW7oGccQhxaGVYYMQ=;
        b=uCq1Lr4eEUC6pH+JBvcmtKdfzuJ7vUTelT+Xuno7Mx0iiMH/KtaQ3GcJNckpr8HT7s
         HM54xZHiZrR0/uk1q3dDdb6yaAp7DPdGIKXUmpJIfB3Rh7G7xhKNeZXFwXVTJ00f1BV9
         XCYC+ZiEP/WIHBCotQ4jh7VAupmsMHSHroFHqsGK/k2gNEsIjDnMic5r/HWH4n/wGo5h
         W4m8Y+KvdFclIiqltJA9gLnrP01ldsrgMX6fwj0QyzVhl3QiA5vhNi+8+mFx5v18XCXT
         EzaoyVl7cwZ0hO7qKoi1aIWJetPzXYIkuKY5kb9kMybFa9DvFcMDheowO4X8dCbFmWJN
         MmIg==
X-Gm-Message-State: AOAM532Ow4wBusdE2pYSfczL+ttB/aWywkU0wn4Lndk5KsOuAU8mjysA
	0hdWld6F+mvGrk3WjjOichM=
X-Google-Smtp-Source: ABdhPJwq2lgstXGT117iNMqQIPLAUzLBXpYXE32leEdMzHtS6k6jpdCmJdRCvRkfB+UaPhbQDgK8HQ==
X-Received: by 2002:a17:902:bb92:b029:f4:4a28:3ed0 with SMTP id m18-20020a170902bb92b02900f44a283ed0mr16822273pls.48.1622387198908;
        Sun, 30 May 2021 08:06:38 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	sthemmin@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	rppt@kernel.org,
	hannes@cmpxchg.org,
	cai@lca.pw,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	Tianyu.Lan@microsoft.com,
	konrad.wilk@oracle.com,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	xen-devel@lists.xenproject.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	thomas.lendacky@amd.com,
	brijesh.singh@amd.com,
	sunilmut@microsoft.com
Subject: [RFC PATCH V3 01/11] x86/HV: Initialize GHCB page in Isolation VM
Date: Sun, 30 May 2021 11:06:18 -0400
Message-Id: <20210530150628.2063957-2-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210530150628.2063957-1-ltykernel@gmail.com>
References: <20210530150628.2063957-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Hyper-V exposes GHCB page via SEV ES GHCB MSR for SNP guest
to communicate with hypervisor. Map GHCB page for all
cpus to read/write MSR register and submit hvcall request
via GHCB.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 arch/x86/hyperv/hv_init.c       | 60 ++++++++++++++++++++++++++++++---
 arch/x86/include/asm/mshyperv.h |  2 ++
 include/asm-generic/mshyperv.h  |  2 ++
 3 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
index bb0ae4b5c00f..dc74d01cb859 100644
--- a/arch/x86/hyperv/hv_init.c
+++ b/arch/x86/hyperv/hv_init.c
@@ -60,6 +60,9 @@ static int hv_cpu_init(unsigned int cpu)
 	struct hv_vp_assist_page **hvp = &hv_vp_assist_page[smp_processor_id()];
 	void **input_arg;
 	struct page *pg;
+	u64 ghcb_gpa;
+	void *ghcb_va;
+	void **ghcb_base;
 
 	/* hv_cpu_init() can be called with IRQs disabled from hv_resume() */
 	pg = alloc_pages(irqs_disabled() ? GFP_ATOMIC : GFP_KERNEL, hv_root_partition ? 1 : 0);
@@ -106,6 +109,17 @@ static int hv_cpu_init(unsigned int cpu)
 		wrmsrl(HV_X64_MSR_VP_ASSIST_PAGE, val);
 	}
 
+	if (ms_hyperv.ghcb_base) {
+		rdmsrl(MSR_AMD64_SEV_ES_GHCB, ghcb_gpa);
+
+		ghcb_va = ioremap_cache(ghcb_gpa, HV_HYP_PAGE_SIZE);
+		if (!ghcb_va)
+			return -ENOMEM;
+
+		ghcb_base = (void **)this_cpu_ptr(ms_hyperv.ghcb_base);
+		*ghcb_base = ghcb_va;
+	}
+
 	return 0;
 }
 
@@ -201,6 +215,7 @@ static int hv_cpu_die(unsigned int cpu)
 	unsigned long flags;
 	void **input_arg;
 	void *pg;
+	void **ghcb_va = NULL;
 
 	local_irq_save(flags);
 	input_arg = (void **)this_cpu_ptr(hyperv_pcpu_input_arg);
@@ -214,6 +229,13 @@ static int hv_cpu_die(unsigned int cpu)
 		*output_arg = NULL;
 	}
 
+	if (ms_hyperv.ghcb_base) {
+		ghcb_va = (void **)this_cpu_ptr(ms_hyperv.ghcb_base);
+		if (*ghcb_va)
+			iounmap(*ghcb_va);
+		*ghcb_va = NULL;
+	}
+
 	local_irq_restore(flags);
 
 	free_pages((unsigned long)pg, hv_root_partition ? 1 : 0);
@@ -369,6 +391,9 @@ void __init hyperv_init(void)
 	u64 guest_id, required_msrs;
 	union hv_x64_msr_hypercall_contents hypercall_msr;
 	int cpuhp, i;
+	u64 ghcb_gpa;
+	void *ghcb_va;
+	void **ghcb_base;
 
 	if (x86_hyper_type != X86_HYPER_MS_HYPERV)
 		return;
@@ -429,9 +454,24 @@ void __init hyperv_init(void)
 			VMALLOC_END, GFP_KERNEL, PAGE_KERNEL_ROX,
 			VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
 			__builtin_return_address(0));
-	if (hv_hypercall_pg == NULL) {
-		wrmsrl(HV_X64_MSR_GUEST_OS_ID, 0);
-		goto remove_cpuhp_state;
+	if (hv_hypercall_pg == NULL)
+		goto clean_guest_os_id;
+
+	if (hv_isolation_type_snp()) {
+		ms_hyperv.ghcb_base = alloc_percpu(void *);
+		if (!ms_hyperv.ghcb_base)
+			goto clean_guest_os_id;
+
+		rdmsrl(MSR_AMD64_SEV_ES_GHCB, ghcb_gpa);
+		ghcb_va = ioremap_cache(ghcb_gpa, HV_HYP_PAGE_SIZE);
+		if (!ghcb_va) {
+			free_percpu(ms_hyperv.ghcb_base);
+			ms_hyperv.ghcb_base = NULL;
+			goto clean_guest_os_id;
+		}
+
+		ghcb_base = (void **)this_cpu_ptr(ms_hyperv.ghcb_base);
+		*ghcb_base = ghcb_va;
 	}
 
 	rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
@@ -502,7 +542,8 @@ void __init hyperv_init(void)
 	hv_query_ext_cap(0);
 	return;
 
-remove_cpuhp_state:
+clean_guest_os_id:
+	wrmsrl(HV_X64_MSR_GUEST_OS_ID, 0);
 	cpuhp_remove_state(cpuhp);
 free_vp_assist_page:
 	kfree(hv_vp_assist_page);
@@ -531,6 +572,9 @@ void hyperv_cleanup(void)
 	 */
 	hv_hypercall_pg = NULL;
 
+	if (ms_hyperv.ghcb_base)
+		free_percpu(ms_hyperv.ghcb_base);
+
 	/* Reset the hypercall page */
 	hypercall_msr.as_uint64 = 0;
 	wrmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
@@ -615,6 +659,14 @@ bool hv_is_isolation_supported(void)
 }
 EXPORT_SYMBOL_GPL(hv_is_isolation_supported);
 
+DEFINE_STATIC_KEY_FALSE(isolation_type_snp);
+
+bool hv_isolation_type_snp(void)
+{
+	return static_branch_unlikely(&isolation_type_snp);
+}
+EXPORT_SYMBOL_GPL(hv_isolation_type_snp);
+
 /* Bit mask of the extended capability to query: see HV_EXT_CAPABILITY_xxx */
 bool hv_query_ext_cap(u64 cap_query)
 {
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index 67ff0d637e55..aeacca7c4da8 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -11,6 +11,8 @@
 #include <asm/paravirt.h>
 #include <asm/mshyperv.h>
 
+DECLARE_STATIC_KEY_FALSE(isolation_type_snp);
+
 typedef int (*hyperv_fill_flush_list_func)(
 		struct hv_guest_mapping_flush_list *flush,
 		void *data);
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index 9a000ba2bb75..3ae56a29594f 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -35,6 +35,7 @@ struct ms_hyperv_info {
 	u32 max_lp_index;
 	u32 isolation_config_a;
 	u32 isolation_config_b;
+	void  __percpu **ghcb_base;
 };
 extern struct ms_hyperv_info ms_hyperv;
 
@@ -224,6 +225,7 @@ bool hv_is_hyperv_initialized(void);
 bool hv_is_hibernation_supported(void);
 enum hv_isolation_type hv_get_isolation_type(void);
 bool hv_is_isolation_supported(void);
+bool hv_isolation_type_snp(void);
 void hyperv_cleanup(void);
 bool hv_query_ext_cap(u64 cap_query);
 #else /* CONFIG_HYPERV */
-- 
2.25.1


