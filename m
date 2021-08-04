Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FEE3E07F1
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 20:45:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163849.300030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBLtl-00079U-EM; Wed, 04 Aug 2021 18:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163849.300030; Wed, 04 Aug 2021 18:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBLtl-00075c-AQ; Wed, 04 Aug 2021 18:45:49 +0000
Received: by outflank-mailman (input) for mailman id 163849;
 Wed, 04 Aug 2021 18:45:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q0vd=M3=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mBLtj-0005Nn-01
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 18:45:47 +0000
Received: from mail-pl1-x62a.google.com (unknown [2607:f8b0:4864:20::62a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6aae19a1-3dea-4cb3-9076-4aad18f92e3a;
 Wed, 04 Aug 2021 18:45:34 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id a20so4072338plm.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Aug 2021 11:45:34 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:f:1947:6842:b8a8:6f83])
 by smtp.gmail.com with ESMTPSA id f5sm3325647pjo.23.2021.08.04.11.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 11:45:33 -0700 (PDT)
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
X-Inumbo-ID: 6aae19a1-3dea-4cb3-9076-4aad18f92e3a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FjqcDsd3/8WG5LCe93SalrqBfhW3NFLliTRMxmsfSWY=;
        b=WLC7rbFu97EvBJcM9iAJVPZcOXaF+MOqN3rcZ9MpMYnd9Vb6tnMcNwGKQvKYQxpAUk
         wQSXwd8iovG9MxXaJMYTr6XlzfpUZZ8vNdPXq386rwciWYxt0V+7afeSzPE4tnxfHQAT
         XZUecZDtiyjrrltS9OfuZ2sSpu2GPvB567hXPKyTCsRVNm+gJ9DlfdEtha5Fg5uXt53b
         pQMVW1xdYMg//7zlOMUiPQw2bsZcvVSInMTyeuJ6xADnG2wflSiGHXQwId/yiezOYz4z
         cbvW7J+NIvV0wP5w11SG9Arkfk9Xmve/4rQRQfEsofs814k+uTbdXxXbpKf3WRSH0OdH
         2nyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FjqcDsd3/8WG5LCe93SalrqBfhW3NFLliTRMxmsfSWY=;
        b=s1hyZz8ZeAM3CY3qBJQabX+Apy4ZsUR0jnvbdA9G+IswHzWLIAbQc3368QaNPFlYPA
         EJ1sZEGR3zJZm1loPRzkonj6ZYPKf4komER5BDVdmRYFLdVjjHHch97jOx+aDVohk77y
         bJn+PzRmslNAt31m4DELPf1+6Ffxebn7RH6oZXH4WR+JiSVBu72HZ+v6D0LRcgWTUgBf
         xnKiND8VW8Okiwa871Gci2rdYltVSp8+NhPAhlha3Qd6P0T8TAmn6sQqruH1smI1uM3D
         h3ec5pDitgyw5BfDx4/zhNFnu8UA31wzVNXiHxVTHaJ0UA3XaFpZc5Z2JhvDCsgG+mwq
         SPeA==
X-Gm-Message-State: AOAM530mEJXe99Cw3MYYmmGbxTh6FqWfgUXkvcw9u8papviLoVRUuZHh
	dSyYQKjpOrsBp2zGuo1gwGg=
X-Google-Smtp-Source: ABdhPJwO5aD7mthpGg242+kZ4yRQSM9kDCTOHzrxihcaVLCLZkqlSU33CEcsbkdEBA8Z5IuFN2Ykuw==
X-Received: by 2002:a62:78cd:0:b029:3c1:f5bc:b5ed with SMTP id t196-20020a6278cd0000b02903c1f5bcb5edmr1048118pfc.65.1628102733763;
        Wed, 04 Aug 2021 11:45:33 -0700 (PDT)
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
	Tianyu.Lan@microsoft.com,
	rppt@kernel.org,
	kirill.shutemov@linux.intel.com,
	akpm@linux-foundation.org,
	brijesh.singh@amd.com,
	thomas.lendacky@amd.com,
	pgonda@google.com,
	david@redhat.com,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	aneesh.kumar@linux.ibm.com,
	xen-devel@lists.xenproject.org,
	martin.b.radev@gmail.com,
	ardb@kernel.org,
	rientjes@google.com,
	tj@kernel.org,
	keescook@chromium.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	parri.andrea@gmail.com
Subject: [PATCH V2 04/14] x86/HV: Add new hvcall guest address host visibility support
Date: Wed,  4 Aug 2021 14:45:00 -0400
Message-Id: <20210804184513.512888-5-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804184513.512888-1-ltykernel@gmail.com>
References: <20210804184513.512888-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Add new hvcall guest address host visibility support to mark
memory visible to host. Override x86_set_memory_enc static
call with hv hook to mark memory visible to host via set_
memory_decrypted().

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
Change since v1:
       * Use new staic call x86_set_memory_enc to avoid add Hyper-V
         specific check in the set_memory code.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 arch/x86/hyperv/Makefile           |   2 +-
 arch/x86/hyperv/hv_init.c          |   6 ++
 arch/x86/hyperv/ivm.c              | 114 +++++++++++++++++++++++++++++
 arch/x86/include/asm/hyperv-tlfs.h |  20 +++++
 arch/x86/include/asm/mshyperv.h    |   4 +-
 include/asm-generic/hyperv-tlfs.h  |   1 +
 6 files changed, 145 insertions(+), 2 deletions(-)
 create mode 100644 arch/x86/hyperv/ivm.c

diff --git a/arch/x86/hyperv/Makefile b/arch/x86/hyperv/Makefile
index 48e2c51464e8..5d2de10809ae 100644
--- a/arch/x86/hyperv/Makefile
+++ b/arch/x86/hyperv/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y			:= hv_init.o mmu.o nested.o irqdomain.o
+obj-y			:= hv_init.o mmu.o nested.o irqdomain.o ivm.o
 obj-$(CONFIG_X86_64)	+= hv_apic.o hv_proc.o
 
 ifdef CONFIG_X86_64
diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
index 247df301491f..57962d407484 100644
--- a/arch/x86/hyperv/hv_init.c
+++ b/arch/x86/hyperv/hv_init.c
@@ -17,6 +17,7 @@
 #include <asm/hyperv-tlfs.h>
 #include <asm/mshyperv.h>
 #include <asm/idtentry.h>
+#include <asm/set_memory.h>
 #include <linux/kexec.h>
 #include <linux/version.h>
 #include <linux/vmalloc.h>
@@ -29,6 +30,7 @@
 #include <linux/syscore_ops.h>
 #include <clocksource/hyperv_timer.h>
 #include <linux/highmem.h>
+#include <linux/static_call.h>
 
 int hyperv_init_cpuhp;
 u64 hv_current_partition_id = ~0ull;
@@ -450,6 +452,10 @@ void __init hyperv_init(void)
 
 	/* Query the VMs extended capability once, so that it can be cached. */
 	hv_query_ext_cap(0);
+
+	if (hv_is_isolation_supported())
+		static_call_update(x86_set_memory_enc, hv_set_mem_enc);
+
 	return;
 
 clean_guest_os_id:
diff --git a/arch/x86/hyperv/ivm.c b/arch/x86/hyperv/ivm.c
new file mode 100644
index 000000000000..6d130ba03f41
--- /dev/null
+++ b/arch/x86/hyperv/ivm.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hyper-V Isolation VM interface with paravisor and hypervisor
+ *
+ * Author:
+ *  Tianyu Lan <Tianyu.Lan@microsoft.com>
+ */
+
+#include <linux/hyperv.h>
+#include <linux/types.h>
+#include <linux/bitfield.h>
+#include <linux/slab.h>
+#include <asm/io.h>
+#include <asm/mshyperv.h>
+
+/*
+ * hv_mark_gpa_visibility - Set pages visible to host via hvcall.
+ *
+ * In Isolation VM, all guest memory is encripted from host and guest
+ * needs to set memory visible to host via hvcall before sharing memory
+ * with host.
+ */
+int hv_mark_gpa_visibility(u16 count, const u64 pfn[],
+			   enum hv_mem_host_visibility visibility)
+{
+	struct hv_gpa_range_for_visibility **input_pcpu, *input;
+	u16 pages_processed;
+	u64 hv_status;
+	unsigned long flags;
+
+	/* no-op if partition isolation is not enabled */
+	if (!hv_is_isolation_supported())
+		return 0;
+
+	if (count > HV_MAX_MODIFY_GPA_REP_COUNT) {
+		pr_err("Hyper-V: GPA count:%d exceeds supported:%lu\n", count,
+			HV_MAX_MODIFY_GPA_REP_COUNT);
+		return -EINVAL;
+	}
+
+	local_irq_save(flags);
+	input_pcpu = (struct hv_gpa_range_for_visibility **)
+			this_cpu_ptr(hyperv_pcpu_input_arg);
+	input = *input_pcpu;
+	if (unlikely(!input)) {
+		local_irq_restore(flags);
+		return -EINVAL;
+	}
+
+	input->partition_id = HV_PARTITION_ID_SELF;
+	input->host_visibility = visibility;
+	input->reserved0 = 0;
+	input->reserved1 = 0;
+	memcpy((void *)input->gpa_page_list, pfn, count * sizeof(*pfn));
+	hv_status = hv_do_rep_hypercall(
+			HVCALL_MODIFY_SPARSE_GPA_PAGE_HOST_VISIBILITY, count,
+			0, input, &pages_processed);
+	local_irq_restore(flags);
+
+	if (!(hv_status & HV_HYPERCALL_RESULT_MASK))
+		return 0;
+
+	return hv_status & HV_HYPERCALL_RESULT_MASK;
+}
+EXPORT_SYMBOL(hv_mark_gpa_visibility);
+
+/*
+ * hv_set_mem_host_visibility - Set specified memory visible to host.
+ *
+ * In Isolation VM, all guest memory is encrypted from host and guest
+ * needs to set memory visible to host via hvcall before sharing memory
+ * with host. This function works as wrap of hv_mark_gpa_visibility()
+ * with memory base and size.
+ */
+static int hv_set_mem_host_visibility(void *kbuffer, int pagecount,
+				      enum hv_mem_host_visibility visibility)
+{
+	u64 *pfn_array;
+	int ret = 0;
+	int i, pfn;
+
+	if (!hv_is_isolation_supported() || !ms_hyperv.ghcb_base)
+		return 0;
+
+	pfn_array = kzalloc(HV_HYP_PAGE_SIZE, GFP_KERNEL);
+	if (!pfn_array)
+		return -ENOMEM;
+
+	for (i = 0, pfn = 0; i < pagecount; i++) {
+		pfn_array[pfn] = virt_to_hvpfn(kbuffer + i * HV_HYP_PAGE_SIZE);
+		pfn++;
+
+		if (pfn == HV_MAX_MODIFY_GPA_REP_COUNT || i == pagecount - 1) {
+			ret |= hv_mark_gpa_visibility(pfn, pfn_array,
+					visibility);
+			pfn = 0;
+
+			if (ret)
+				goto err_free_pfn_array;
+		}
+	}
+
+ err_free_pfn_array:
+	kfree(pfn_array);
+	return ret;
+}
+
+int hv_set_mem_enc(unsigned long addr, int numpages, bool enc)
+{
+	enum hv_mem_host_visibility visibility = enc ? VMBUS_PAGE_NOT_VISIBLE :
+			VMBUS_PAGE_VISIBLE_READ_WRITE;
+
+	return hv_set_mem_host_visibility((void *)addr, numpages, visibility);
+}
diff --git a/arch/x86/include/asm/hyperv-tlfs.h b/arch/x86/include/asm/hyperv-tlfs.h
index f1366ce609e3..1b3e80bcca5b 100644
--- a/arch/x86/include/asm/hyperv-tlfs.h
+++ b/arch/x86/include/asm/hyperv-tlfs.h
@@ -276,6 +276,13 @@ enum hv_isolation_type {
 #define HV_X64_MSR_TIME_REF_COUNT	HV_REGISTER_TIME_REF_COUNT
 #define HV_X64_MSR_REFERENCE_TSC	HV_REGISTER_REFERENCE_TSC
 
+/* Hyper-V memory host visibility */
+enum hv_mem_host_visibility {
+	VMBUS_PAGE_NOT_VISIBLE		= 0,
+	VMBUS_PAGE_VISIBLE_READ_ONLY	= 1,
+	VMBUS_PAGE_VISIBLE_READ_WRITE	= 3
+};
+
 /*
  * Declare the MSR used to setup pages used to communicate with the hypervisor.
  */
@@ -578,4 +585,17 @@ enum hv_interrupt_type {
 
 #include <asm-generic/hyperv-tlfs.h>
 
+/* All input parameters should be in single page. */
+#define HV_MAX_MODIFY_GPA_REP_COUNT		\
+	((PAGE_SIZE / sizeof(u64)) - 2)
+
+/* HvCallModifySparseGpaPageHostVisibility hypercall */
+struct hv_gpa_range_for_visibility {
+	u64 partition_id;
+	u32 host_visibility:2;
+	u32 reserved0:30;
+	u32 reserved1;
+	u64 gpa_page_list[HV_MAX_MODIFY_GPA_REP_COUNT];
+} __packed;
+
 #endif
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index 6627cfd2bfba..33f0e95c9b76 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -190,7 +190,9 @@ struct irq_domain *hv_create_pci_msi_domain(void);
 int hv_map_ioapic_interrupt(int ioapic_id, bool level, int vcpu, int vector,
 		struct hv_interrupt_entry *entry);
 int hv_unmap_ioapic_interrupt(int ioapic_id, struct hv_interrupt_entry *entry);
-
+int hv_mark_gpa_visibility(u16 count, const u64 pfn[],
+			   enum hv_mem_host_visibility visibility);
+int hv_set_mem_enc(unsigned long addr, int numpages, bool enc);
 #else /* CONFIG_HYPERV */
 static inline void hyperv_init(void) {}
 static inline void hyperv_setup_mmu_ops(void) {}
diff --git a/include/asm-generic/hyperv-tlfs.h b/include/asm-generic/hyperv-tlfs.h
index 56348a541c50..8ed6733d5146 100644
--- a/include/asm-generic/hyperv-tlfs.h
+++ b/include/asm-generic/hyperv-tlfs.h
@@ -158,6 +158,7 @@ struct ms_hyperv_tsc_page {
 #define HVCALL_RETARGET_INTERRUPT		0x007e
 #define HVCALL_FLUSH_GUEST_PHYSICAL_ADDRESS_SPACE 0x00af
 #define HVCALL_FLUSH_GUEST_PHYSICAL_ADDRESS_LIST 0x00b0
+#define HVCALL_MODIFY_SPARSE_GPA_PAGE_HOST_VISIBILITY 0x00db
 
 /* Extended hypercalls */
 #define HV_EXT_CALL_QUERY_CAPABILITIES		0x8001
-- 
2.25.1


