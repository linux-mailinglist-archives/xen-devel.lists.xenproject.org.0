Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51B159ACDF
	for <lists+xen-devel@lfdr.de>; Sat, 20 Aug 2022 11:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390687.628278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPKjk-0000L4-58; Sat, 20 Aug 2022 09:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390687.628278; Sat, 20 Aug 2022 09:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPKjj-0000C7-Pf; Sat, 20 Aug 2022 09:25:47 +0000
Received: by outflank-mailman (input) for mailman id 390687;
 Sat, 20 Aug 2022 09:25:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cfLG=YY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oPKjg-0006NK-KD
 for xen-devel@lists.xenproject.org; Sat, 20 Aug 2022 09:25:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e5d84f3-206a-11ed-9250-1f966e50362f;
 Sat, 20 Aug 2022 11:25:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AF1872005B;
 Sat, 20 Aug 2022 09:25:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5933213440;
 Sat, 20 Aug 2022 09:25:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KAScFJOoAGPJMAAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 20 Aug 2022 09:25:39 +0000
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
X-Inumbo-ID: 0e5d84f3-206a-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660987539; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JUJm8AzApP3BXUfz/8kYW4X5+H9Ehhz9tOTxTyy5q78=;
	b=pLwDNZdYw2eOdoTT+7tU43E4Jb9JnNXc6u/4Ne/QAtm6XHwsyV2Fd9Ul8cM8HsqGgbKKbP
	bJTrtLPgUbNpMM20fcnP4tOowZ4b2qR7nc8zd8Q9h8+omZJH7S28LBFKap+aBkpIK0QCoy
	G2ypbxWHcgr96ClzCmZzKbr93DnKD24=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v2 09/10] x86/mtrr: add a stop_machine() handler calling only cache_cpu_init()
Date: Sat, 20 Aug 2022 11:25:32 +0200
Message-Id: <20220820092533.29420-10-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220820092533.29420-1-jgross@suse.com>
References: <20220820092533.29420-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having a stop_machine() handler for either a specific MTRR
register or all state at once, add a handler just for calling
cache_cpu_init() if appropriate.

Add functions for calling stop_machine() with this handler as well.

Add a generic replacements for mtrr_bp_restore() and a wrapper for
mtrr_bp_init().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- completely new replacement of former patch 2
---
 arch/x86/include/asm/cacheinfo.h |  5 +-
 arch/x86/include/asm/mtrr.h      |  4 --
 arch/x86/kernel/cpu/cacheinfo.c  | 59 +++++++++++++++++++++-
 arch/x86/kernel/cpu/common.c     |  3 +-
 arch/x86/kernel/cpu/mtrr/mtrr.c  | 87 +-------------------------------
 arch/x86/kernel/setup.c          |  3 +-
 arch/x86/kernel/smpboot.c        |  4 +-
 arch/x86/power/cpu.c             |  3 +-
 8 files changed, 72 insertions(+), 96 deletions(-)

diff --git a/arch/x86/include/asm/cacheinfo.h b/arch/x86/include/asm/cacheinfo.h
index e80ed3c523c8..a122a1aad936 100644
--- a/arch/x86/include/asm/cacheinfo.h
+++ b/arch/x86/include/asm/cacheinfo.h
@@ -14,6 +14,9 @@ void cacheinfo_hygon_init_llc_id(struct cpuinfo_x86 *c, int cpu);
 
 void cache_disable(void);
 void cache_enable(void);
-void cache_cpu_init(void);
+void cache_bp_init(void);
+void cache_bp_restore(void);
+void cache_ap_init(void);
+void cache_aps_init(void);
 
 #endif /* _ASM_X86_CACHEINFO_H */
diff --git a/arch/x86/include/asm/mtrr.h b/arch/x86/include/asm/mtrr.h
index 5d31219c8529..ec73d1e5bafb 100644
--- a/arch/x86/include/asm/mtrr.h
+++ b/arch/x86/include/asm/mtrr.h
@@ -42,8 +42,6 @@ extern int mtrr_add_page(unsigned long base, unsigned long size,
 extern int mtrr_del(int reg, unsigned long base, unsigned long size);
 extern int mtrr_del_page(int reg, unsigned long base, unsigned long size);
 extern void mtrr_centaur_report_mcr(int mcr, u32 lo, u32 hi);
-extern void mtrr_ap_init(void);
-extern void mtrr_aps_init(void);
 extern void mtrr_bp_restore(void);
 extern int mtrr_trim_uncached_memory(unsigned long end_pfn);
 extern int amd_special_default_mtrr(void);
@@ -85,8 +83,6 @@ static inline int mtrr_trim_uncached_memory(unsigned long end_pfn)
 static inline void mtrr_centaur_report_mcr(int mcr, u32 lo, u32 hi)
 {
 }
-#define mtrr_ap_init() do {} while (0)
-#define mtrr_aps_init() do {} while (0)
 #define mtrr_bp_restore() do {} while (0)
 #define mtrr_disable() do {} while (0)
 #define mtrr_enable() do {} while (0)
diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index c6e7c93e45e8..4946f93eb16f 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -15,6 +15,7 @@
 #include <linux/capability.h>
 #include <linux/sysfs.h>
 #include <linux/pci.h>
+#include <linux/stop_machine.h>
 
 #include <asm/cpufeature.h>
 #include <asm/cacheinfo.h>
@@ -1121,7 +1122,7 @@ void cache_enable(void) __releases(cache_disable_lock)
 	raw_spin_unlock(&cache_disable_lock);
 }
 
-void cache_cpu_init(void)
+static void cache_cpu_init(void)
 {
 	unsigned long flags;
 
@@ -1141,3 +1142,59 @@ void cache_cpu_init(void)
 }
 
 bool cache_aps_delayed_init;
+
+static int cache_rendezvous_handler(void *unused)
+{
+	if (cache_aps_delayed_init || !cpu_online(smp_processor_id()))
+		cache_cpu_init();
+
+	return 0;
+}
+
+void __init cache_bp_init(void)
+{
+	mtrr_bp_init();
+
+	if (cache_generic)
+		cache_cpu_init();
+}
+
+void cache_bp_restore(void)
+{
+	if (cache_generic)
+		cache_cpu_init();
+}
+
+void cache_ap_init(void)
+{
+	if (!cache_generic || cache_aps_delayed_init)
+		return;
+
+	/*
+	 * Ideally we should hold mtrr_mutex here to avoid mtrr entries
+	 * changed, but this routine will be called in cpu boot time,
+	 * holding the lock breaks it.
+	 *
+	 * This routine is called in two cases:
+	 *
+	 *   1. very early time of software resume, when there absolutely
+	 *      isn't mtrr entry changes;
+	 *
+	 *   2. cpu hotadd time. We let mtrr_add/del_page hold cpuhotplug
+	 *      lock to prevent mtrr entry changes
+	 */
+	stop_machine_from_inactive_cpu(cache_rendezvous_handler, NULL,
+				       cpu_callout_mask);
+}
+
+/*
+ * Delayed cache initialization for all AP's
+ */
+void cache_aps_init(void)
+{
+	if (!cache_generic || !cache_aps_delayed_init)
+		return;
+
+	stop_machine(cache_rendezvous_handler, NULL, cpu_online_mask);
+	cache_aps_delayed_init = false;
+}
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 64a73f415f03..5c122dd17ec2 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -52,6 +52,7 @@
 #include <asm/cpu.h>
 #include <asm/mce.h>
 #include <asm/msr.h>
+#include <asm/cacheinfo.h>
 #include <asm/memtype.h>
 #include <asm/microcode.h>
 #include <asm/microcode_intel.h>
@@ -1936,7 +1937,7 @@ void identify_secondary_cpu(struct cpuinfo_x86 *c)
 #ifdef CONFIG_X86_32
 	enable_sep_cpu();
 #endif
-	mtrr_ap_init();
+	cache_ap_init();
 	validate_apic_and_package_id(c);
 	x86_spec_ctrl_setup_ap();
 	update_srbds_msr();
diff --git a/arch/x86/kernel/cpu/mtrr/mtrr.c b/arch/x86/kernel/cpu/mtrr/mtrr.c
index b68ec43e33a2..38531e021581 100644
--- a/arch/x86/kernel/cpu/mtrr/mtrr.c
+++ b/arch/x86/kernel/cpu/mtrr/mtrr.c
@@ -70,9 +70,6 @@ static const struct mtrr_ops *mtrr_ops[X86_VENDOR_NUM] __ro_after_init;
 
 const struct mtrr_ops *mtrr_if;
 
-static void set_mtrr(unsigned int reg, unsigned long base,
-		     unsigned long size, mtrr_type type);
-
 void __init set_mtrr_ops(const struct mtrr_ops *ops)
 {
 	if (ops->vendor && ops->vendor < X86_VENDOR_NUM)
@@ -155,25 +152,8 @@ static int mtrr_rendezvous_handler(void *info)
 {
 	struct set_mtrr_data *data = info;
 
-	/*
-	 * We use this same function to initialize the mtrrs during boot,
-	 * resume, runtime cpu online and on an explicit request to set a
-	 * specific MTRR.
-	 *
-	 * During boot or suspend, the state of the boot cpu's mtrrs has been
-	 * saved, and we want to replicate that across all the cpus that come
-	 * online (either at the end of boot or resume or during a runtime cpu
-	 * online). If we're doing that, @reg is set to something special and on
-	 * all the cpu's we do cache_cpu_init() (On the logical cpu that
-	 * started the boot/resume sequence, this might be a duplicate
-	 * cache_cpu_init()).
-	 */
-	if (data->smp_reg != ~0U) {
-		mtrr_if->set(data->smp_reg, data->smp_base,
-			     data->smp_size, data->smp_type);
-	} else if (cache_aps_delayed_init || !cpu_online(smp_processor_id())) {
-		cache_cpu_init();
-	}
+	mtrr_if->set(data->smp_reg, data->smp_base,
+		     data->smp_size, data->smp_type);
 	return 0;
 }
 
@@ -243,19 +223,6 @@ static void set_mtrr_cpuslocked(unsigned int reg, unsigned long base,
 	stop_machine_cpuslocked(mtrr_rendezvous_handler, &data, cpu_online_mask);
 }
 
-static void set_mtrr_from_inactive_cpu(unsigned int reg, unsigned long base,
-				      unsigned long size, mtrr_type type)
-{
-	struct set_mtrr_data data = { .smp_reg = reg,
-				      .smp_base = base,
-				      .smp_size = size,
-				      .smp_type = type
-				    };
-
-	stop_machine_from_inactive_cpu(mtrr_rendezvous_handler, &data,
-				       cpu_callout_mask);
-}
-
 /**
  * mtrr_add_page - Add a memory type region
  * @base: Physical base address of region in pages (in units of 4 kB!)
@@ -764,7 +731,6 @@ void __init mtrr_bp_init(void)
 						 CACHE_GENERIC_PAT;
 				changed_by_mtrr_cleanup =
 					mtrr_cleanup(phys_addr);
-				cache_cpu_init();
 			}
 		}
 	}
@@ -781,27 +747,6 @@ void __init mtrr_bp_init(void)
 	}
 }
 
-void mtrr_ap_init(void)
-{
-	if (!cache_generic || cache_aps_delayed_init)
-		return;
-
-	/*
-	 * Ideally we should hold mtrr_mutex here to avoid mtrr entries
-	 * changed, but this routine will be called in cpu boot time,
-	 * holding the lock breaks it.
-	 *
-	 * This routine is called in two cases:
-	 *
-	 *   1. very early time of software resume, when there absolutely
-	 *      isn't mtrr entry changes;
-	 *
-	 *   2. cpu hotadd time. We let mtrr_add/del_page hold cpuhotplug
-	 *      lock to prevent mtrr entry changes
-	 */
-	set_mtrr_from_inactive_cpu(~0U, 0, 0, 0);
-}
-
 /**
  * mtrr_save_state - Save current fixed-range MTRR state of the first
  *	cpu in cpu_online_mask.
@@ -817,34 +762,6 @@ void mtrr_save_state(void)
 	smp_call_function_single(first_cpu, mtrr_save_fixed_ranges, NULL, 1);
 }
 
-/*
- * Delayed MTRR initialization for all AP's
- */
-void mtrr_aps_init(void)
-{
-	if (!cache_generic)
-		return;
-
-	/*
-	 * Check if someone has requested the delay of AP MTRR initialization,
-	 * by doing set_mtrr_aps_delayed_init(), prior to this point. If not,
-	 * then we are done.
-	 */
-	if (!cache_aps_delayed_init)
-		return;
-
-	set_mtrr(~0U, 0, 0, 0);
-	cache_aps_delayed_init = false;
-}
-
-void mtrr_bp_restore(void)
-{
-	if (!cache_generic)
-		return;
-
-	cache_cpu_init();
-}
-
 static int __init mtrr_init_finialize(void)
 {
 	if (!mtrr_enabled)
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 216fee7144ee..e0e185ee0229 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -34,6 +34,7 @@
 #include <asm/numa.h>
 #include <asm/bios_ebda.h>
 #include <asm/bugs.h>
+#include <asm/cacheinfo.h>
 #include <asm/cpu.h>
 #include <asm/efi.h>
 #include <asm/gart.h>
@@ -1075,7 +1076,7 @@ void __init setup_arch(char **cmdline_p)
 
 	/* update e820 for memory not covered by WB MTRRs */
 	if (IS_ENABLED(CONFIG_MTRR))
-		mtrr_bp_init();
+		cache_bp_init();
 	else
 		pat_disable("PAT support disabled because CONFIG_MTRR is disabled in the kernel.");
 
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index ef7bce21cbe8..ff793f436904 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1445,7 +1445,7 @@ void arch_thaw_secondary_cpus_begin(void)
 
 void arch_thaw_secondary_cpus_end(void)
 {
-	mtrr_aps_init();
+	cache_aps_init();
 }
 
 /*
@@ -1488,7 +1488,7 @@ void __init native_smp_cpus_done(unsigned int max_cpus)
 
 	nmi_selftest();
 	impress_friends();
-	mtrr_aps_init();
+	cache_aps_init();
 }
 
 static int __initdata setup_possible_cpus = -1;
diff --git a/arch/x86/power/cpu.c b/arch/x86/power/cpu.c
index bb176c72891c..754221c9a1c3 100644
--- a/arch/x86/power/cpu.c
+++ b/arch/x86/power/cpu.c
@@ -23,6 +23,7 @@
 #include <asm/fpu/api.h>
 #include <asm/debugreg.h>
 #include <asm/cpu.h>
+#include <asm/cacheinfo.h>
 #include <asm/mmu_context.h>
 #include <asm/cpu_device_id.h>
 #include <asm/microcode.h>
@@ -261,7 +262,7 @@ static void notrace __restore_processor_state(struct saved_context *ctxt)
 	do_fpu_end();
 	tsc_verify_tsc_adjust(true);
 	x86_platform.restore_sched_clock_state();
-	mtrr_bp_restore();
+	cache_bp_restore();
 	perf_restore_debug_store();
 
 	c = &cpu_data(smp_processor_id());
-- 
2.35.3


