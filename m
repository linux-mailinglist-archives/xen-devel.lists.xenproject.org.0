Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C47453E4B62
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 19:56:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165113.301769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD9Vp-0000WK-BE; Mon, 09 Aug 2021 17:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165113.301769; Mon, 09 Aug 2021 17:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD9Vp-0000UB-7F; Mon, 09 Aug 2021 17:56:33 +0000
Received: by outflank-mailman (input) for mailman id 165113;
 Mon, 09 Aug 2021 17:56:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD4O=NA=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mD9Vo-0000Aq-1I
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 17:56:32 +0000
Received: from mail-pj1-x1033.google.com (unknown [2607:f8b0:4864:20::1033])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64359619-a63f-477e-aaae-c806bd099924;
 Mon, 09 Aug 2021 17:56:27 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id j1so29234607pjv.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Aug 2021 10:56:27 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:2:106e:6ed1:5da1:2ac4])
 by smtp.gmail.com with ESMTPSA id x14sm20589708pfa.127.2021.08.09.10.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 10:56:26 -0700 (PDT)
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
X-Inumbo-ID: 64359619-a63f-477e-aaae-c806bd099924
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+SXmZnVGaWXOY/RYkmLfCtWMULRdMkbPmQ9ViuTHD4g=;
        b=vEiVBsmsjWFoq4H9xIe2JkVBV6ZRxO8oTc1d0POF8FBUFnHfygUIcXu1Q6lIUO6G8V
         OZ0eKnK8b2FYfXzWwIFzo7hO/SDSbktZBgBA9q5MzDM2tSVD+lUqIOyamzBgk9mM4sd7
         +/ChsJIEW5dMQMfRN0VzltH1RuxxvHykERIWU2rB7pLq/8xj0nq7SVaiK3ZsuHFQ8FoW
         D9nA4u0vEJoYCDwR5KWdept1EbyGZC9nhnkSNJdwsfiss59YjCsICZPyWMfbNLKZ4vZL
         o6/PPIdsLDr6vZuwTGl4jdGx8871bBC+zvCYBedAkrhQuufnqjjdtdNfQqXrkOuRK22k
         4L9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+SXmZnVGaWXOY/RYkmLfCtWMULRdMkbPmQ9ViuTHD4g=;
        b=tsq5ZbeWDPfYp82NJxEOGzI2MGJXVvy3taVOFShOy1Y+tsZZT6yJfyPILR7Xl4Pf5q
         Zv8+v/5DQfonrqj42S1M0UOL1n08P2x0yJy1y8+u49v6zF29vavsYw9FcY9Eib3mgCN/
         0FjcVKMyCFqlA5N5N0VV+VqWPto917TZ7kBtxQh8Doz21xKUPV1QRNaH7MCnbvdZDCy2
         sNQKtR9A1mAhz8oeXBLd7rSEAf8m4pCDyHtW2/zdAFAXiDVMLIlWT18WgWAfgy7NWx/P
         J0k2fAK2VE2c5K+yc0nz3kmTHr9QsNPw5ymBioWNsrtb99NaS8WpGaM/N8eWEi53w/P3
         /8rQ==
X-Gm-Message-State: AOAM530WLI7FkjGL5iF7KlF8IZvjRvHo3+51TqWPjSOrQWHba10darSW
	N5agjtsK/gCGAPmTXaMurjo=
X-Google-Smtp-Source: ABdhPJw/Bw/9aycFrRX8qJNE8oCpvKM3rGElUB7qQ9nDgVBBQ7qhpDJqT8kHjxicHZLhAf9ipjwyRA==
X-Received: by 2002:a62:f244:0:b029:3c3:100f:c302 with SMTP id y4-20020a62f2440000b02903c3100fc302mr25175993pfl.37.1628531786781;
        Mon, 09 Aug 2021 10:56:26 -0700 (PDT)
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
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	konrad.wilk@oracle.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	arnd@arndb.de,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	thomas.lendacky@amd.com,
	brijesh.singh@amd.com,
	ardb@kernel.org,
	Tianyu.Lan@microsoft.com,
	pgonda@google.com,
	martin.b.radev@gmail.com,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	rppt@kernel.org,
	sfr@canb.auug.org.au,
	saravanand@fb.com,
	krish.sadhukhan@oracle.com,
	aneesh.kumar@linux.ibm.com,
	xen-devel@lists.xenproject.org,
	rientjes@google.com,
	hannes@cmpxchg.org,
	tj@kernel.org,
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
Subject: [PATCH V3 01/13] x86/HV: Initialize GHCB page in Isolation VM
Date: Mon,  9 Aug 2021 13:56:05 -0400
Message-Id: <20210809175620.720923-2-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809175620.720923-1-ltykernel@gmail.com>
References: <20210809175620.720923-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Hyper-V exposes GHCB page via SEV ES GHCB MSR for SNP guest
to communicate with hypervisor. Map GHCB page for all
cpus to read/write MSR register and submit hvcall request
via GHCB.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 arch/x86/hyperv/hv_init.c       | 66 +++++++++++++++++++++++++++++++--
 arch/x86/include/asm/mshyperv.h |  2 +
 include/asm-generic/mshyperv.h  |  2 +
 3 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
index 708a2712a516..0bb4d9ca7a55 100644
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
@@ -42,6 +43,31 @@ static void *hv_hypercall_pg_saved;
 struct hv_vp_assist_page **hv_vp_assist_page;
 EXPORT_SYMBOL_GPL(hv_vp_assist_page);
 
+static int hyperv_init_ghcb(void)
+{
+	u64 ghcb_gpa;
+	void *ghcb_va;
+	void **ghcb_base;
+
+	if (!ms_hyperv.ghcb_base)
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
+	ghcb_base = (void **)this_cpu_ptr(ms_hyperv.ghcb_base);
+	*ghcb_base = ghcb_va;
+
+	return 0;
+}
+
 static int hv_cpu_init(unsigned int cpu)
 {
 	union hv_vp_assist_msr_contents msr = { 0 };
@@ -85,6 +111,8 @@ static int hv_cpu_init(unsigned int cpu)
 		}
 	}
 
+	hyperv_init_ghcb();
+
 	return 0;
 }
 
@@ -177,6 +205,14 @@ static int hv_cpu_die(unsigned int cpu)
 {
 	struct hv_reenlightenment_control re_ctrl;
 	unsigned int new_cpu;
+	void **ghcb_va = NULL;
+
+	if (ms_hyperv.ghcb_base) {
+		ghcb_va = (void **)this_cpu_ptr(ms_hyperv.ghcb_base);
+		if (*ghcb_va)
+			memunmap(*ghcb_va);
+		*ghcb_va = NULL;
+	}
 
 	hv_common_cpu_die(cpu);
 
@@ -383,9 +419,19 @@ void __init hyperv_init(void)
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
+		if (hyperv_init_ghcb()) {
+			free_percpu(ms_hyperv.ghcb_base);
+			ms_hyperv.ghcb_base = NULL;
+			goto clean_guest_os_id;
+		}
 	}
 
 	rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
@@ -456,7 +502,8 @@ void __init hyperv_init(void)
 	hv_query_ext_cap(0);
 	return;
 
-remove_cpuhp_state:
+clean_guest_os_id:
+	wrmsrl(HV_X64_MSR_GUEST_OS_ID, 0);
 	cpuhp_remove_state(cpuhp);
 free_vp_assist_page:
 	kfree(hv_vp_assist_page);
@@ -484,6 +531,9 @@ void hyperv_cleanup(void)
 	 */
 	hv_hypercall_pg = NULL;
 
+	if (ms_hyperv.ghcb_base)
+		free_percpu(ms_hyperv.ghcb_base);
+
 	/* Reset the hypercall page */
 	hypercall_msr.as_uint64 = 0;
 	wrmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
@@ -559,3 +609,11 @@ bool hv_is_isolation_supported(void)
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
index adccbc209169..6627cfd2bfba 100644
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
index c1ab6a6e72b5..4269f3174e58 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -36,6 +36,7 @@ struct ms_hyperv_info {
 	u32 max_lp_index;
 	u32 isolation_config_a;
 	u32 isolation_config_b;
+	void  __percpu **ghcb_base;
 };
 extern struct ms_hyperv_info ms_hyperv;
 
@@ -237,6 +238,7 @@ bool hv_is_hyperv_initialized(void);
 bool hv_is_hibernation_supported(void);
 enum hv_isolation_type hv_get_isolation_type(void);
 bool hv_is_isolation_supported(void);
+bool hv_isolation_type_snp(void);
 void hyperv_cleanup(void);
 bool hv_query_ext_cap(u64 cap_query);
 #else /* CONFIG_HYPERV */
-- 
2.25.1


