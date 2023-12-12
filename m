Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD5880F136
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 16:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653191.1019547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD4pf-0000c3-Fr; Tue, 12 Dec 2023 15:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653191.1019547; Tue, 12 Dec 2023 15:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD4pf-0000Zi-Cy; Tue, 12 Dec 2023 15:38:03 +0000
Received: by outflank-mailman (input) for mailman id 653191;
 Tue, 12 Dec 2023 15:38:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0UEi=HX=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rD4pd-0000ZM-FF
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 15:38:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e47a0f6-9904-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 16:38:00 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-82-60-45-193.retail.telecomitalia.it [82.60.45.193])
 by support.bugseng.com (Postfix) with ESMTPSA id 0662B4EE0C91;
 Tue, 12 Dec 2023 16:37:59 +0100 (CET)
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
X-Inumbo-ID: 6e47a0f6-9904-11ee-98e8-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 2/4] x86/asm: address violations of MISRA C:2012 Rule 8.2
Date: Tue, 12 Dec 2023 16:37:40 +0100
Message-Id: <0db906df2d3649fc8652be6b80e14870b78b0f56.1702394721.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702394721.git.federico.serafini@bugseng.com>
References: <cover.1702394721.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/amd.h       | 2 +-
 xen/arch/x86/include/asm/debugreg.h  | 4 ++--
 xen/arch/x86/include/asm/flushtlb.h  | 3 ++-
 xen/arch/x86/include/asm/hap.h       | 2 +-
 xen/arch/x86/include/asm/iommu.h     | 2 +-
 xen/arch/x86/include/asm/microcode.h | 2 +-
 6 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 0700827561..2cc0ce2e9f 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -157,7 +157,7 @@
 #define is_zen4_uarch()   boot_cpu_has(X86_FEATURE_AUTO_IBRS)
 
 struct cpuinfo_x86;
-int cpu_has_amd_erratum(const struct cpuinfo_x86 *, int, ...);
+int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...);
 
 extern s8 opt_allow_unsafe;
 
diff --git a/xen/arch/x86/include/asm/debugreg.h b/xen/arch/x86/include/asm/debugreg.h
index b6454cc04e..2bdaf5d9aa 100644
--- a/xen/arch/x86/include/asm/debugreg.h
+++ b/xen/arch/x86/include/asm/debugreg.h
@@ -96,8 +96,8 @@
 #define breakpoint_addr_ok(a) __addr_ok(a)
 
 struct vcpu;
-long set_debugreg(struct vcpu *, unsigned int reg, unsigned long value);
-void activate_debugregs(const struct vcpu *);
+long set_debugreg(struct vcpu *v, unsigned int reg, unsigned long value);
+void activate_debugregs(const struct vcpu *curr);
 
 struct cpu_policy;
 
diff --git a/xen/arch/x86/include/asm/flushtlb.h b/xen/arch/x86/include/asm/flushtlb.h
index a461ee36ff..bb0ad58db4 100644
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -141,7 +141,8 @@ unsigned int flush_area_local(const void *va, unsigned int flags);
 #define flush_local(flags) flush_area_local(NULL, flags)
 
 /* Flush specified CPUs' TLBs/caches */
-void flush_area_mask(const cpumask_t *, const void *va, unsigned int flags);
+void flush_area_mask(const cpumask_t *mask, const void *va,
+                     unsigned int flags);
 #define flush_mask(mask, flags) flush_area_mask(mask, NULL, flags)
 
 /* Flush all CPUs' TLBs/caches */
diff --git a/xen/arch/x86/include/asm/hap.h b/xen/arch/x86/include/asm/hap.h
index 05e124ad57..f01ce73fb4 100644
--- a/xen/arch/x86/include/asm/hap.h
+++ b/xen/arch/x86/include/asm/hap.h
@@ -32,7 +32,7 @@ int   hap_track_dirty_vram(struct domain *d,
                            unsigned int nr_frames,
                            XEN_GUEST_HANDLE(void) guest_dirty_bitmap);
 
-extern const struct paging_mode *hap_paging_get_mode(struct vcpu *);
+extern const struct paging_mode *hap_paging_get_mode(struct vcpu *v);
 int hap_set_allocation(struct domain *d, unsigned int pages, bool *preempted);
 unsigned int hap_get_allocation(struct domain *d);
 
diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index eb720205e2..15a848ddc3 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -87,7 +87,7 @@ extern const struct iommu_init_ops *iommu_init_ops;
 void iommu_update_ire_from_apic(unsigned int apic, unsigned int pin,
                                 uint64_t rte);
 unsigned int iommu_read_apic_from_ire(unsigned int apic, unsigned int reg);
-int iommu_setup_hpet_msi(struct msi_desc *);
+int iommu_setup_hpet_msi(struct msi_desc *msi);
 
 static inline void iommu_adjust_irq_affinities(void)
 {
diff --git a/xen/arch/x86/include/asm/microcode.h b/xen/arch/x86/include/asm/microcode.h
index 62ce3418f7..8f59b20b02 100644
--- a/xen/arch/x86/include/asm/microcode.h
+++ b/xen/arch/x86/include/asm/microcode.h
@@ -22,7 +22,7 @@ struct cpu_signature {
 DECLARE_PER_CPU(struct cpu_signature, cpu_sig);
 
 void microcode_set_module(unsigned int idx);
-int microcode_update(XEN_GUEST_HANDLE(const_void), unsigned long len);
+int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len);
 int early_microcode_init(unsigned long *module_map,
                          const struct multiboot_info *mbi);
 int microcode_init_cache(unsigned long *module_map,
-- 
2.34.1


