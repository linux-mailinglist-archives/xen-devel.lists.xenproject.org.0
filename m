Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC03B3F9D98
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 19:22:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173803.317126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJfXv-00027T-EU; Fri, 27 Aug 2021 17:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173803.317126; Fri, 27 Aug 2021 17:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJfXv-00023d-8Q; Fri, 27 Aug 2021 17:21:39 +0000
Received: by outflank-mailman (input) for mailman id 173803;
 Fri, 27 Aug 2021 17:21:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=brRM=NS=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mJfXt-00016Q-N1
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 17:21:37 +0000
Received: from mail-pg1-x52a.google.com (unknown [2607:f8b0:4864:20::52a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 913f8b25-f630-4fc2-844b-04781bc92c41;
 Fri, 27 Aug 2021 17:21:29 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id s11so6467420pgr.11
 for <xen-devel@lists.xenproject.org>; Fri, 27 Aug 2021 10:21:29 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:36:ef50:8fcd:44d1:eb17])
 by smtp.gmail.com with ESMTPSA id f5sm7155015pjo.23.2021.08.27.10.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 10:21:28 -0700 (PDT)
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
X-Inumbo-ID: 913f8b25-f630-4fc2-844b-04781bc92c41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=97TSoNEFUH/dcOtN9KWTkyqxlJ5Mdi7oz6hJ0eE1ORs=;
        b=YRAstm5ofU6lymcaSHffQzFjHf7CrC9ui/b162RG6xUbr7quns6FgP0SE8tVEHansz
         5qsaUt4VatKFIiI+VSvPF6adLk2ksLkJOPCCkx+qyeUI/ghRSDb9Y+rS6cfBhS3ZAnm3
         TM5FVIlEaiQKQjGrpI7U/S0HdVOi8yfWaJu4svbpOmvYP0OMHtyMxWJBGyPR7libNktp
         yF1QX8uIOENq25zYmUsHtyd3uyZnFFbumt9pqtI15qmj9L0GHnaUyYzAMst5t1wKshud
         1EPkxovDW0R+57wgcXgiwnxnRtr3Ud1HIU9mh+mhC2Don7t5kZJ+sLdVjQW8B3+2e4jG
         YP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=97TSoNEFUH/dcOtN9KWTkyqxlJ5Mdi7oz6hJ0eE1ORs=;
        b=rvU9bqNAfHxfVOk/cbdlnzBONWpOJoHNzctTu3H4tLlWwhjRBhowIsB25HpdBonoNg
         e+mLY84UJovPQ8BuujKs8Ce5cgK0uNMaZ86N7rvzYhdx6+CqS/RzxXgkU80qXMg1udK0
         TNzLvc8QkBuzCTFK5UUCBpaLoeh5x1r2vqVAeFl4nght+OluIdKZrbWgh5N3RgSK3/J8
         jHNg3c/5QqSuPCNdOpWK3Aw8eup2lhEoJzQtoeBQsg0R7ie6vfxO/5xam4+CGBDr9rqs
         c5tBk4n6qSnRel/N64lD7G2FF1pHqUOTXJ+MjJxMw+d6XbhNyQ7eJ4Zqd5g54vUleVSu
         EM2g==
X-Gm-Message-State: AOAM530MAHq6b5AmMOHNOTUSFX1qCi/lZQkkeIHiBhhsVCUWo3wVBbl1
	/y0B1hkC+2Ch630AKEFwJuw=
X-Google-Smtp-Source: ABdhPJwXkzmhKuM8IMAJzHz5jyUb4XiEbWyJ9t/qB/+cDCy1kYl16jf539JCUKzcxANI+FnYjNOQjQ==
X-Received: by 2002:aa7:96e7:0:b0:3f1:fbd4:68f2 with SMTP id i7-20020aa796e7000000b003f1fbd468f2mr9781666pfq.77.1630084888856;
        Fri, 27 Aug 2021 10:21:28 -0700 (PDT)
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
Subject: [PATCH V4 03/13] x86/hyperv: Add new hvcall guest address host visibility support
Date: Fri, 27 Aug 2021 13:21:01 -0400
Message-Id: <20210827172114.414281-4-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827172114.414281-1-ltykernel@gmail.com>
References: <20210827172114.414281-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Add new hvcall guest address host visibility support to mark
memory visible to host. Call it inside set_memory_decrypted
/encrypted(). Add HYPERVISOR feature check in the
hv_is_isolation_supported() to optimize in non-virtualization
environment.

Acked-by: Dave Hansen <dave.hansen@intel.com>
Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
Change since v3:
	* Fix error code handle in the __hv_set_mem_host_visibility().
	* Move HvCallModifySparseGpaPageHostVisibility near to enum
	  hv_mem_host_visibility.

Change since v2:
       * Rework __set_memory_enc_dec() and call Hyper-V and AMD function
         according to platform check.

Change since v1:
       * Use new staic call x86_set_memory_enc to avoid add Hyper-V
         specific check in the set_memory code.
---
 arch/x86/hyperv/Makefile           |   2 +-
 arch/x86/hyperv/hv_init.c          |   6 ++
 arch/x86/hyperv/ivm.c              | 113 +++++++++++++++++++++++++++++
 arch/x86/include/asm/hyperv-tlfs.h |  17 +++++
 arch/x86/include/asm/mshyperv.h    |   4 +-
 arch/x86/mm/pat/set_memory.c       |  19 +++--
 include/asm-generic/hyperv-tlfs.h  |   1 +
 include/asm-generic/mshyperv.h     |   1 +
 8 files changed, 156 insertions(+), 7 deletions(-)
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
index eba10ed4f73e..b1aa42f60faa 100644
--- a/arch/x86/hyperv/hv_init.c
+++ b/arch/x86/hyperv/hv_init.c
@@ -603,6 +603,12 @@ EXPORT_SYMBOL_GPL(hv_get_isolation_type);
 
 bool hv_is_isolation_supported(void)
 {
+	if (!cpu_feature_enabled(X86_FEATURE_HYPERVISOR))
+		return 0;
+
+	if (!hypervisor_is_type(X86_HYPER_MS_HYPERV))
+		return 0;
+
 	return hv_get_isolation_type() != HV_ISOLATION_TYPE_NONE;
 }
 
diff --git a/arch/x86/hyperv/ivm.c b/arch/x86/hyperv/ivm.c
new file mode 100644
index 000000000000..a069c788ce3c
--- /dev/null
+++ b/arch/x86/hyperv/ivm.c
@@ -0,0 +1,113 @@
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
+	if (hv_result_success(hv_status))
+		return 0;
+	else
+		return -EFAULT;
+}
+EXPORT_SYMBOL(hv_mark_gpa_visibility);
+
+static int __hv_set_mem_host_visibility(void *kbuffer, int pagecount,
+				      enum hv_mem_host_visibility visibility)
+{
+	u64 *pfn_array;
+	int ret = 0;
+	int i, pfn;
+
+	if (!hv_is_isolation_supported() || !hv_hypercall_pg)
+		return 0;
+
+	pfn_array = kmalloc(HV_HYP_PAGE_SIZE, GFP_KERNEL);
+	if (!pfn_array)
+		return -ENOMEM;
+
+	for (i = 0, pfn = 0; i < pagecount; i++) {
+		pfn_array[pfn] = virt_to_hvpfn(kbuffer + i * HV_HYP_PAGE_SIZE);
+		pfn++;
+
+		if (pfn == HV_MAX_MODIFY_GPA_REP_COUNT || i == pagecount - 1) {
+			ret = hv_mark_gpa_visibility(pfn, pfn_array,
+						     visibility);
+			if (ret)
+				goto err_free_pfn_array;
+			pfn = 0;
+		}
+	}
+
+ err_free_pfn_array:
+	kfree(pfn_array);
+	return ret;
+}
+
+/*
+ * hv_set_mem_host_visibility - Set specified memory visible to host.
+ *
+ * In Isolation VM, all guest memory is encrypted from host and guest
+ * needs to set memory visible to host via hvcall before sharing memory
+ * with host. This function works as wrap of hv_mark_gpa_visibility()
+ * with memory base and size.
+ */
+int hv_set_mem_host_visibility(unsigned long addr, int numpages, bool visible)
+{
+	enum hv_mem_host_visibility visibility = visible ?
+			VMBUS_PAGE_VISIBLE_READ_WRITE : VMBUS_PAGE_NOT_VISIBLE;
+
+	return __hv_set_mem_host_visibility((void *)addr, numpages, visibility);
+}
diff --git a/arch/x86/include/asm/hyperv-tlfs.h b/arch/x86/include/asm/hyperv-tlfs.h
index 2322d6bd5883..381e88122a5f 100644
--- a/arch/x86/include/asm/hyperv-tlfs.h
+++ b/arch/x86/include/asm/hyperv-tlfs.h
@@ -276,6 +276,23 @@ enum hv_isolation_type {
 #define HV_X64_MSR_TIME_REF_COUNT	HV_REGISTER_TIME_REF_COUNT
 #define HV_X64_MSR_REFERENCE_TSC	HV_REGISTER_REFERENCE_TSC
 
+/* Hyper-V memory host visibility */
+enum hv_mem_host_visibility {
+	VMBUS_PAGE_NOT_VISIBLE		= 0,
+	VMBUS_PAGE_VISIBLE_READ_ONLY	= 1,
+	VMBUS_PAGE_VISIBLE_READ_WRITE	= 3
+};
+
+/* HvCallModifySparseGpaPageHostVisibility hypercall */
+#define HV_MAX_MODIFY_GPA_REP_COUNT	((PAGE_SIZE / sizeof(u64)) - 2)
+struct hv_gpa_range_for_visibility {
+	u64 partition_id;
+	u32 host_visibility:2;
+	u32 reserved0:30;
+	u32 reserved1;
+	u64 gpa_page_list[HV_MAX_MODIFY_GPA_REP_COUNT];
+} __packed;
+
 /*
  * Declare the MSR used to setup pages used to communicate with the hypervisor.
  */
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index 37739a277ac6..ffb2af079c6b 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -192,7 +192,9 @@ struct irq_domain *hv_create_pci_msi_domain(void);
 int hv_map_ioapic_interrupt(int ioapic_id, bool level, int vcpu, int vector,
 		struct hv_interrupt_entry *entry);
 int hv_unmap_ioapic_interrupt(int ioapic_id, struct hv_interrupt_entry *entry);
-
+int hv_mark_gpa_visibility(u16 count, const u64 pfn[],
+			   enum hv_mem_host_visibility visibility);
+int hv_set_mem_host_visibility(unsigned long addr, int numpages, bool visible);
 #else /* CONFIG_HYPERV */
 static inline void hyperv_init(void) {}
 static inline void hyperv_setup_mmu_ops(void) {}
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index ad8a5c586a35..1e4a0882820a 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -29,6 +29,8 @@
 #include <asm/proto.h>
 #include <asm/memtype.h>
 #include <asm/set_memory.h>
+#include <asm/hyperv-tlfs.h>
+#include <asm/mshyperv.h>
 
 #include "../mm_internal.h"
 
@@ -1980,15 +1982,11 @@ int set_memory_global(unsigned long addr, int numpages)
 				    __pgprot(_PAGE_GLOBAL), 0);
 }
 
-static int __set_memory_enc_dec(unsigned long addr, int numpages, bool enc)
+static int __set_memory_enc_pgtable(unsigned long addr, int numpages, bool enc)
 {
 	struct cpa_data cpa;
 	int ret;
 
-	/* Nothing to do if memory encryption is not active */
-	if (!mem_encrypt_active())
-		return 0;
-
 	/* Should not be working on unaligned addresses */
 	if (WARN_ONCE(addr & ~PAGE_MASK, "misaligned address: %#lx\n", addr))
 		addr &= PAGE_MASK;
@@ -2023,6 +2021,17 @@ static int __set_memory_enc_dec(unsigned long addr, int numpages, bool enc)
 	return ret;
 }
 
+static int __set_memory_enc_dec(unsigned long addr, int numpages, bool enc)
+{
+	if (hv_is_isolation_supported())
+		return hv_set_mem_host_visibility(addr, numpages, !enc);
+
+	if (mem_encrypt_active())
+		return __set_memory_enc_pgtable(addr, numpages, enc);
+
+	return 0;
+}
+
 int set_memory_encrypted(unsigned long addr, int numpages)
 {
 	return __set_memory_enc_dec(addr, numpages, true);
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
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index 7537ae1db828..aa55447b9700 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -254,6 +254,7 @@ bool hv_query_ext_cap(u64 cap_query);
 static inline bool hv_is_hyperv_initialized(void) { return false; }
 static inline bool hv_is_hibernation_supported(void) { return false; }
 static inline void hyperv_cleanup(void) {}
+static inline hv_is_isolation_supported(void);
 #endif /* CONFIG_HYPERV */
 
 #endif
-- 
2.25.1


