Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263E63F9D95
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 19:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173801.317103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJfXk-0001Q7-OO; Fri, 27 Aug 2021 17:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173801.317103; Fri, 27 Aug 2021 17:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJfXk-0001NK-LH; Fri, 27 Aug 2021 17:21:28 +0000
Received: by outflank-mailman (input) for mailman id 173801;
 Fri, 27 Aug 2021 17:21:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=brRM=NS=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mJfXj-00016Q-Ml
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 17:21:27 +0000
Received: from mail-pg1-x534.google.com (unknown [2607:f8b0:4864:20::534])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8e4df1c-2153-4e7c-b0a1-865dfab1a0ac;
 Fri, 27 Aug 2021 17:21:24 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id w8so6495932pgf.5
 for <xen-devel@lists.xenproject.org>; Fri, 27 Aug 2021 10:21:24 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:36:ef50:8fcd:44d1:eb17])
 by smtp.gmail.com with ESMTPSA id f5sm7155015pjo.23.2021.08.27.10.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 10:21:23 -0700 (PDT)
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
X-Inumbo-ID: a8e4df1c-2153-4e7c-b0a1-865dfab1a0ac
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Nk88C9e1YSHytuy/urYiBm6Fh5qFSuemVpCrvWv3wM=;
        b=db5MNBSjoza6wsbnzpTXcqhXMWNAkPil3VzTzRkr8eab8nRn2vsvGPetAqygAw9Oti
         z9PQvIHMo6mHcaqWgvsteCbwKuLYm5f3eLHVWICjJlCTf6EK3HrUHXv9NRulvSbupxpB
         sJCrCbtW71aQAWI7MFFPYOvcSuzX4caFNCQXBsgoBxwA+2lUG0w6wj0SNE6/dFS/ZZMN
         fZWAla5uWMXjB9Y5JLmibogA2NGNW9mHorSwWfKfZL+QylXBH0ubW+UylhiSONw5dBIT
         raikB2e0Z44S56mI5Y4m5Htbrd0tHhDr5TIhkbA8+U5dincKUJsV/ZJRk3QlCwnvE2FZ
         756w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Nk88C9e1YSHytuy/urYiBm6Fh5qFSuemVpCrvWv3wM=;
        b=rNKj4aX5E6osTC+AJKceX0mQOD3bVIvzFF5nlCAardJ7QjlnP13CVBq79rh9qyQrqt
         xOiO+8b/wNBhHRu3ocbJSHs5gTZJMsudIl9WGZswfnJGPwDpDmbEp+ybEDgsjEzo6T//
         Ihnlv9q/QYD4Q0e+oY7aVJ2rZd55PSKoNlOcqLrteSU05CC2f6yLaE6tdImUTzjGub9k
         6omw8/UCaAnaHk+bpw5DXyd37Awkg3ZWrfpCExNmYSX4OrOpxJLBuQA5MzvJab5eiiJl
         FGsL3Q7k8ILO0clabHitc1FRyIILELeSq0QqOYU3U7PewH0vi/DjGbfyGaCjvSFgTCki
         lOwA==
X-Gm-Message-State: AOAM532Ccm3HiqRt9OIi7kOpwr7SG3g3RFylvngvjb34EXwhPRWNUpwG
	oxKE+bEcokzXGXSJ1tHo06A=
X-Google-Smtp-Source: ABdhPJyHLaXpMtlT/ZlRFeVCoAbs+0dWwpmbMrqQ/Sjs8GeDF6jIbsyeb/ptNZwnBj40znc0QMZmfA==
X-Received: by 2002:a63:fc0a:: with SMTP id j10mr8717240pgi.136.1630084884095;
        Fri, 27 Aug 2021 10:21:24 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	sthemmin@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	konrad.wilk@oracle.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	joro@8bytes.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	brijesh.singh@amd.com,
	thomas.lendacky@amd.com,
	Tianyu.Lan@microsoft.com,
	pgonda@google.com,
	martin.b.radev@gmail.com,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	rppt@kernel.org,
	hannes@cmpxchg.org,
	aneesh.kumar@linux.ibm.com,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	rientjes@google.com,
	ardb@kernel.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	parri.andrea@gmail.com,
	dave.hansen@intel.com
Subject: [PATCH V4 01/13] x86/hyperv: Initialize GHCB page in Isolation VM
Date: Fri, 27 Aug 2021 13:20:59 -0400
Message-Id: <20210827172114.414281-2-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827172114.414281-1-ltykernel@gmail.com>
References: <20210827172114.414281-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Hyperv exposes GHCB page via SEV ES GHCB MSR for SNP guest
to communicate with hypervisor. Map GHCB page for all
cpus to read/write MSR register and submit hvcall request
via ghcb page.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
Chagne since v3:
        * Rename ghcb_base to hv_ghcb_pg and move it out of
	  struct ms_hyperv_info.
	* Allocate hv_ghcb_pg before cpuhp_setup_state() and leverage
	  hv_cpu_init() to initialize ghcb page.
---
 arch/x86/hyperv/hv_init.c       | 68 +++++++++++++++++++++++++++++----
 arch/x86/include/asm/mshyperv.h |  4 ++
 arch/x86/kernel/cpu/mshyperv.c  |  3 ++
 include/asm-generic/mshyperv.h  |  1 +
 4 files changed, 69 insertions(+), 7 deletions(-)

diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
index 708a2712a516..eba10ed4f73e 100644
--- a/arch/x86/hyperv/hv_init.c
+++ b/arch/x86/hyperv/hv_init.c
@@ -20,6 +20,7 @@
 #include <linux/kexec.h>
 #include <linux/version.h>
 #include <linux/vmalloc.h>
+#include <linux/io.h>
 #include <linux/mm.h>
 #include <linux/hyperv.h>
 #include <linux/slab.h>
@@ -36,12 +37,42 @@ EXPORT_SYMBOL_GPL(hv_current_partition_id);
 void *hv_hypercall_pg;
 EXPORT_SYMBOL_GPL(hv_hypercall_pg);
 
+void __percpu **hv_ghcb_pg;
+
 /* Storage to save the hypercall page temporarily for hibernation */
 static void *hv_hypercall_pg_saved;
 
 struct hv_vp_assist_page **hv_vp_assist_page;
 EXPORT_SYMBOL_GPL(hv_vp_assist_page);
 
+static int hyperv_init_ghcb(void)
+{
+	u64 ghcb_gpa;
+	void *ghcb_va;
+	void **ghcb_base;
+
+	if (!hv_isolation_type_snp())
+		return 0;
+
+	if (!hv_ghcb_pg)
+		return -EINVAL;
+
+	/*
+	 * GHCB page is allocated by paravisor. The address
+	 * returned by MSR_AMD64_SEV_ES_GHCB is above shared
+	 * ghcb boundary and map it here.
+	 */
+	rdmsrl(MSR_AMD64_SEV_ES_GHCB, ghcb_gpa);
+	ghcb_va = memremap(ghcb_gpa, HV_HYP_PAGE_SIZE, MEMREMAP_WB);
+	if (!ghcb_va)
+		return -ENOMEM;
+
+	ghcb_base = (void **)this_cpu_ptr(hv_ghcb_pg);
+	*ghcb_base = ghcb_va;
+
+	return 0;
+}
+
 static int hv_cpu_init(unsigned int cpu)
 {
 	union hv_vp_assist_msr_contents msr = { 0 };
@@ -85,7 +116,7 @@ static int hv_cpu_init(unsigned int cpu)
 		}
 	}
 
-	return 0;
+	return hyperv_init_ghcb();
 }
 
 static void (*hv_reenlightenment_cb)(void);
@@ -177,6 +208,14 @@ static int hv_cpu_die(unsigned int cpu)
 {
 	struct hv_reenlightenment_control re_ctrl;
 	unsigned int new_cpu;
+	void **ghcb_va;
+
+	if (hv_ghcb_pg) {
+		ghcb_va = (void **)this_cpu_ptr(hv_ghcb_pg);
+		if (*ghcb_va)
+			memunmap(*ghcb_va);
+		*ghcb_va = NULL;
+	}
 
 	hv_common_cpu_die(cpu);
 
@@ -366,10 +405,16 @@ void __init hyperv_init(void)
 		goto common_free;
 	}
 
+	if (hv_isolation_type_snp()) {
+		hv_ghcb_pg = alloc_percpu(void *);
+		if (!hv_ghcb_pg)
+			goto free_vp_assist_page;
+	}
+
 	cpuhp = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "x86/hyperv_init:online",
 				  hv_cpu_init, hv_cpu_die);
 	if (cpuhp < 0)
-		goto free_vp_assist_page;
+		goto free_ghcb_page;
 
 	/*
 	 * Setup the hypercall page and enable hypercalls.
@@ -383,10 +428,8 @@ void __init hyperv_init(void)
 			VMALLOC_END, GFP_KERNEL, PAGE_KERNEL_ROX,
 			VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
 			__builtin_return_address(0));
-	if (hv_hypercall_pg == NULL) {
-		wrmsrl(HV_X64_MSR_GUEST_OS_ID, 0);
-		goto remove_cpuhp_state;
-	}
+	if (hv_hypercall_pg == NULL)
+		goto clean_guest_os_id;
 
 	rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
 	hypercall_msr.enable = 1;
@@ -456,8 +499,11 @@ void __init hyperv_init(void)
 	hv_query_ext_cap(0);
 	return;
 
-remove_cpuhp_state:
+clean_guest_os_id:
+	wrmsrl(HV_X64_MSR_GUEST_OS_ID, 0);
 	cpuhp_remove_state(cpuhp);
+free_ghcb_page:
+	free_percpu(hv_ghcb_pg);
 free_vp_assist_page:
 	kfree(hv_vp_assist_page);
 	hv_vp_assist_page = NULL;
@@ -559,3 +605,11 @@ bool hv_is_isolation_supported(void)
 {
 	return hv_get_isolation_type() != HV_ISOLATION_TYPE_NONE;
 }
+
+DEFINE_STATIC_KEY_FALSE(isolation_type_snp);
+
+bool hv_isolation_type_snp(void)
+{
+	return static_branch_unlikely(&isolation_type_snp);
+}
+EXPORT_SYMBOL_GPL(hv_isolation_type_snp);
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index adccbc209169..37739a277ac6 100644
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
@@ -39,6 +41,8 @@ extern void *hv_hypercall_pg;
 
 extern u64 hv_current_partition_id;
 
+extern void __percpu **hv_ghcb_pg;
+
 int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages);
 int hv_call_add_logical_proc(int node, u32 lp_index, u32 acpi_id);
 int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flags);
diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index 6b5835a087a3..20557a9d6e25 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -316,6 +316,9 @@ static void __init ms_hyperv_init_platform(void)
 
 		pr_info("Hyper-V: Isolation Config: Group A 0x%x, Group B 0x%x\n",
 			ms_hyperv.isolation_config_a, ms_hyperv.isolation_config_b);
+
+		if (hv_get_isolation_type() == HV_ISOLATION_TYPE_SNP)
+			static_branch_enable(&isolation_type_snp);
 	}
 
 	if (hv_max_functions_eax >= HYPERV_CPUID_NESTED_FEATURES) {
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index c1ab6a6e72b5..0924bbd8458e 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -237,6 +237,7 @@ bool hv_is_hyperv_initialized(void);
 bool hv_is_hibernation_supported(void);
 enum hv_isolation_type hv_get_isolation_type(void);
 bool hv_is_isolation_supported(void);
+bool hv_isolation_type_snp(void);
 void hyperv_cleanup(void);
 bool hv_query_ext_cap(u64 cap_query);
 #else /* CONFIG_HYPERV */
-- 
2.25.1


