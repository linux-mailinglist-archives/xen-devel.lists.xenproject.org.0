Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B07E0A10F10
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 19:05:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871896.1282892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXlHg-0003XN-QX; Tue, 14 Jan 2025 18:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871896.1282892; Tue, 14 Jan 2025 18:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXlHg-0003VM-NJ; Tue, 14 Jan 2025 18:05:00 +0000
Received: by outflank-mailman (input) for mailman id 871896;
 Tue, 14 Jan 2025 18:04:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Qro=UG=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tXlHf-00020k-Hd
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 18:04:59 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ffdb93f-d2a2-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 19:04:57 +0100 (CET)
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-665-qGEuL7tjNvSDQHBRs9YUmQ-1; Tue,
 14 Jan 2025 13:04:52 -0500
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 69F741955D53; Tue, 14 Jan 2025 18:04:49 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.39.192.55])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix)
 with ESMTPS id 2A353195608A; Tue, 14 Jan 2025 18:04:25 +0000 (UTC)
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
X-Inumbo-ID: 0ffdb93f-d2a2-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736877896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qclZNz9KUbrYZjVF2oHux5/JPahdxImvR1KpALrIQ34=;
	b=U3/4lIPSpHv5yUv/D1OpO6sBQIbkc1hbS4mHYvWBFPlIzKmMsSg9jEZ56Vfx4H1CdGE3Ds
	zxnoTBaQiq48+MSEYiM6o9zxjIANJPtI5GFD8cTaV2ECsYgYNWbl8ZIRikcq+ctTNVjTZF
	c/w3TxEUB5SEuJMIdWcDQDPoUJy+AOU=
X-MC-Unique: qGEuL7tjNvSDQHBRs9YUmQ-1
X-Mimecast-MFC-AGG-ID: qGEuL7tjNvSDQHBRs9YUmQ
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Rong Xu <xur@google.com>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Jinghao Jia <jinghao7@illinois.edu>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v4 29/30] x86/mm, mm/vmalloc: Defer flush_tlb_kernel_range() targeting NOHZ_FULL CPUs
Date: Tue, 14 Jan 2025 18:51:42 +0100
Message-ID: <20250114175143.81438-30-vschneid@redhat.com>
In-Reply-To: <20250114175143.81438-1-vschneid@redhat.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

vunmap()'s issued from housekeeping CPUs are a relatively common source of
interference for isolated NOHZ_FULL CPUs, as they are hit by the
flush_tlb_kernel_range() IPIs.

Given that CPUs executing in userspace do not access data in the vmalloc
range, these IPIs could be deferred until their next kernel entry.

Deferral vs early entry danger zone
===================================

This requires a guarantee that nothing in the vmalloc range can be vunmap'd
and then accessed in early entry code.

Vmalloc uses are, as reported by vmallocinfo:

  $ cat /proc/vmallocinfo | awk '{ print $3 }' | sort | uniq
  __pci_enable_msix_range+0x32b/0x560
  acpi_os_map_iomem+0x22d/0x250
  bpf_prog_alloc_no_stats+0x34/0x140
  fork_idle+0x79/0x120
  gen_pool_add_owner+0x3e/0xb0          ?
  hpet_enable+0xbf/0x470
  irq_init_percpu_irqstack+0x129/0x160
  kernel_clone+0xab/0x3b0
  memremap+0x164/0x330
  n_tty_open+0x18/0xa0
  pcpu_create_chunk+0x4e/0x1b0
  pcpu_create_chunk+0x75/0x1b0
  pcpu_get_vm_areas+0x0/0x1100
  unpurged
  vp_modern_map_capability+0x140/0x270
  zisofs_init+0x16/0x30

I've categorized these as:

a) Device or percpu mappings

   For these to be unmapped, the device (or CPU) has to be removed and an
   eventual IRQ freed. Even if the IRQ isn't freed, context tracking entry
   happens before handling the IRQ itself, per irqentry_enter() usage.

   __pci_enable_msix_range()
   acpi_os_map_iomem()
   irq_init_percpu_irqstack() (not even unmapped when CPU is hot-unplugged!)
   memremap()
   n_tty_open()
   pcpu_create_chunk()
   pcpu_get_vm_areas()
   vp_modern_map_capability()

b) CONFIG_VMAP_STACK

  fork_idle() & kernel_clone()

  vmalloc'd kernel stacks are AFAICT a safe example, as a task running in
  userspace needs to enter kernelspace to execute do_exit() before its
  stack can be vfree'd.

c) Non-issues

  bpf_prog_alloc_no_stats() - early entry is noinstr, no BPF!
  hpet_enable() - hpet_clear_mapping() is only called if __init function
		  fails, no runtime worries
  zisofs_init () - used for zisofs block decompression, that's way past
		   context tracking entry

d) I'm not sure, have a look?

  gen_pool_add_owner() - AIUI this is mainly for PCI / DMA stuff, which
			 again I wouldn't expect to be accessed before
			 context tracking entry.

Changes
======

Blindly deferring any and all flush of the kernel mappings is a risky move,
so introduce a variant of flush_tlb_kernel_range() that explicitly allows
deferral. Use it for vunmap flushes.

Note that while flush_tlb_kernel_range() may end up issuing a full
flush (including user mappings), this only happens when reaching a
invalidation range threshold where it is cheaper to do a full flush than to
individually invalidate each page in the range via INVLPG. IOW, it doesn't
*require* invalidating user mappings, and thus remains safe to defer until
a later kernel entry.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/include/asm/context_tracking_work.h |  4 +++
 arch/x86/include/asm/tlbflush.h              |  1 +
 arch/x86/mm/tlb.c                            | 23 +++++++++++--
 include/linux/context_tracking_work.h        |  4 ++-
 mm/vmalloc.c                                 | 35 +++++++++++++++++---
 5 files changed, 58 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/context_tracking_work.h b/arch/x86/include/asm/context_tracking_work.h
index 485b32881fde5..da3d270289836 100644
--- a/arch/x86/include/asm/context_tracking_work.h
+++ b/arch/x86/include/asm/context_tracking_work.h
@@ -3,6 +3,7 @@
 #define _ASM_X86_CONTEXT_TRACKING_WORK_H
 
 #include <asm/sync_core.h>
+#include <asm/tlbflush.h>
 
 static __always_inline void arch_context_tracking_work(enum ct_work work)
 {
@@ -10,6 +11,9 @@ static __always_inline void arch_context_tracking_work(enum ct_work work)
 	case CT_WORK_SYNC:
 		sync_core();
 		break;
+	case CT_WORK_TLBI:
+		__flush_tlb_all();
+		break;
 	case CT_WORK_MAX:
 		WARN_ON_ONCE(true);
 	}
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 4d11396250999..6e690acc35e53 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -248,6 +248,7 @@ extern void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
 				unsigned long end, unsigned int stride_shift,
 				bool freed_tables);
 extern void flush_tlb_kernel_range(unsigned long start, unsigned long end);
+extern void flush_tlb_kernel_range_deferrable(unsigned long start, unsigned long end);
 
 static inline void flush_tlb_page(struct vm_area_struct *vma, unsigned long a)
 {
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 119765772ab11..47fb437acf52a 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -12,6 +12,7 @@
 #include <linux/task_work.h>
 #include <linux/mmu_notifier.h>
 #include <linux/mmu_context.h>
+#include <linux/context_tracking.h>
 
 #include <asm/tlbflush.h>
 #include <asm/mmu_context.h>
@@ -1042,6 +1043,11 @@ static void do_flush_tlb_all(void *info)
 	__flush_tlb_all();
 }
 
+static bool do_kernel_flush_defer_cond(int cpu, void *info)
+{
+	return !ct_set_cpu_work(cpu, CT_WORK_TLBI);
+}
+
 void flush_tlb_all(void)
 {
 	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH);
@@ -1058,12 +1064,13 @@ static void do_kernel_range_flush(void *info)
 		flush_tlb_one_kernel(addr);
 }
 
-void flush_tlb_kernel_range(unsigned long start, unsigned long end)
+static inline void
+__flush_tlb_kernel_range(smp_cond_func_t cond_func, unsigned long start, unsigned long end)
 {
 	/* Balance as user space task's flush, a bit conservative */
 	if (end == TLB_FLUSH_ALL ||
 	    (end - start) > tlb_single_page_flush_ceiling << PAGE_SHIFT) {
-		on_each_cpu(do_flush_tlb_all, NULL, 1);
+		on_each_cpu_cond(cond_func, do_flush_tlb_all, NULL, 1);
 	} else {
 		struct flush_tlb_info *info;
 
@@ -1071,13 +1078,23 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 		info = get_flush_tlb_info(NULL, start, end, 0, false,
 					  TLB_GENERATION_INVALID);
 
-		on_each_cpu(do_kernel_range_flush, info, 1);
+		on_each_cpu_cond(cond_func, do_kernel_range_flush, info, 1);
 
 		put_flush_tlb_info();
 		preempt_enable();
 	}
 }
 
+void flush_tlb_kernel_range(unsigned long start, unsigned long end)
+{
+	__flush_tlb_kernel_range(NULL, start, end);
+}
+
+void flush_tlb_kernel_range_deferrable(unsigned long start, unsigned long end)
+{
+	__flush_tlb_kernel_range(do_kernel_flush_defer_cond, start, end);
+}
+
 /*
  * This can be used from process context to figure out what the value of
  * CR3 is without needing to do a (slow) __read_cr3().
diff --git a/include/linux/context_tracking_work.h b/include/linux/context_tracking_work.h
index 931ade1dcbcc2..1be60c64cdeca 100644
--- a/include/linux/context_tracking_work.h
+++ b/include/linux/context_tracking_work.h
@@ -5,12 +5,14 @@
 #include <linux/bitops.h>
 
 enum {
-	CT_WORK_SYNC,
+	CT_WORK_SYNC_OFFSET,
+	CT_WORK_TLBI_OFFSET,
 	CT_WORK_MAX_OFFSET
 };
 
 enum ct_work {
 	CT_WORK_SYNC     = BIT(CT_WORK_SYNC_OFFSET),
+	CT_WORK_TLBI     = BIT(CT_WORK_TLBI_OFFSET),
 	CT_WORK_MAX      = BIT(CT_WORK_MAX_OFFSET)
 };
 
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 5c88d0e90c209..e8aad4d55e955 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -467,6 +467,31 @@ void vunmap_range_noflush(unsigned long start, unsigned long end)
 	__vunmap_range_noflush(start, end);
 }
 
+#ifdef CONFIG_CONTEXT_TRACKING_WORK
+/*
+ * !!! BIG FAT WARNING !!!
+ *
+ * The CPU is free to cache any part of the paging hierarchy it wants at any
+ * time. It's also free to set accessed and dirty bits at any time, even for
+ * instructions that may never execute architecturally.
+ *
+ * This means that deferring a TLB flush affecting freed page-table-pages (IOW,
+ * keeping them in a CPU's paging hierarchy cache) is akin to dancing in a
+ * minefield.
+ *
+ * This isn't a problem for deferral of TLB flushes in vmalloc, because
+ * page-table-pages used for vmap() mappings are never freed - see how
+ * __vunmap_range_noflush() walks the whole mapping but only clears the leaf PTEs.
+ * If this ever changes, TLB flush deferral will cause misery.
+ */
+void __weak flush_tlb_kernel_range_deferrable(unsigned long start, unsigned long end)
+{
+	flush_tlb_kernel_range(start, end);
+}
+#else
+#define flush_tlb_kernel_range_deferrable(start, end) flush_tlb_kernel_range(start, end)
+#endif
+
 /**
  * vunmap_range - unmap kernel virtual addresses
  * @addr: start of the VM area to unmap
@@ -480,7 +505,7 @@ void vunmap_range(unsigned long addr, unsigned long end)
 {
 	flush_cache_vunmap(addr, end);
 	vunmap_range_noflush(addr, end);
-	flush_tlb_kernel_range(addr, end);
+	flush_tlb_kernel_range_deferrable(addr, end);
 }
 
 static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
@@ -2281,7 +2306,7 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,
 
 	nr_purge_nodes = cpumask_weight(&purge_nodes);
 	if (nr_purge_nodes > 0) {
-		flush_tlb_kernel_range(start, end);
+		flush_tlb_kernel_range_deferrable(start, end);
 
 		/* One extra worker is per a lazy_max_pages() full set minus one. */
 		nr_purge_helpers = atomic_long_read(&vmap_lazy_nr) / lazy_max_pages();
@@ -2384,7 +2409,7 @@ static void free_unmap_vmap_area(struct vmap_area *va)
 	flush_cache_vunmap(va->va_start, va->va_end);
 	vunmap_range_noflush(va->va_start, va->va_end);
 	if (debug_pagealloc_enabled_static())
-		flush_tlb_kernel_range(va->va_start, va->va_end);
+		flush_tlb_kernel_range_deferrable(va->va_start, va->va_end);
 
 	free_vmap_area_noflush(va);
 }
@@ -2832,7 +2857,7 @@ static void vb_free(unsigned long addr, unsigned long size)
 	vunmap_range_noflush(addr, addr + size);
 
 	if (debug_pagealloc_enabled_static())
-		flush_tlb_kernel_range(addr, addr + size);
+		flush_tlb_kernel_range_deferrable(addr, addr + size);
 
 	spin_lock(&vb->lock);
 
@@ -2897,7 +2922,7 @@ static void _vm_unmap_aliases(unsigned long start, unsigned long end, int flush)
 	free_purged_blocks(&purge_list);
 
 	if (!__purge_vmap_area_lazy(start, end, false) && flush)
-		flush_tlb_kernel_range(start, end);
+		flush_tlb_kernel_range_deferrable(start, end);
 	mutex_unlock(&vmap_purge_lock);
 }
 
-- 
2.43.0


