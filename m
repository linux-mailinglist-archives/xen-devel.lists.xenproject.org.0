Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6D276519A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 12:48:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571007.893801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyXs-0007KA-Lp; Thu, 27 Jul 2023 10:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571007.893801; Thu, 27 Jul 2023 10:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyXs-0007HY-J7; Thu, 27 Jul 2023 10:48:36 +0000
Received: by outflank-mailman (input) for mailman id 571007;
 Thu, 27 Jul 2023 10:48:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGGP=DN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qOyXq-00072A-Ub
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 10:48:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 221be437-2c6b-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 12:48:34 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.161.207.213])
 by support.bugseng.com (Postfix) with ESMTPSA id 836C64EE0741;
 Thu, 27 Jul 2023 12:48:32 +0200 (CEST)
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
X-Inumbo-ID: 221be437-2c6b-11ee-b247-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 1/4] x86: mechanically rename to address MISRA C:2012 Rule 5.3
Date: Thu, 27 Jul 2023 12:47:59 +0200
Message-Id: <614dd6fe03ab82db83eabc430b27435b19096791.1690449587.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690449587.git.nicola.vetrini@bugseng.com>
References: <cover.1690449587.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 5.3 has the following headline:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope"

The renames done by this patch avoid shadowing from happening.
They are as follows:
- s/str/s/ in 'lapic_disable'
- s/str/level/ in '(apic|mce)_set_verbosity'
- s/str/state_str/ in 'mwait_idle_probe'
- s/str/memmap_name/ in 'init_e820'
- s/i/j/ in 'mce_action' (the shadowing here is due to macro
  'x86_mcinfo_lookup' that defines 'i' as a loop counter)
- s/desc/descriptor/ in '_hvm_load_entry'
- s/socket_info/sock_info/ in 'do_write_psr_msrs'
- s/debug_stack_lines/dbg_stack_lines/ in 'compat_show_guest_stack'

The parameter 'cpu_khz' that causes a violation in 'pit_init'
is unused, and hence can be removed.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Function 'str' in 'xen/arch/x86/include/asm/desc.h'
causes the shadowing.
---
 xen/arch/x86/apic.c                 |  8 ++++----
 xen/arch/x86/cpu/mcheck/mce.c       | 12 ++++++------
 xen/arch/x86/cpu/mwait-idle.c       | 24 ++++++++++++------------
 xen/arch/x86/domain.c               |  2 +-
 xen/arch/x86/e820.c                 |  6 +++---
 xen/arch/x86/emul-i8254.c           |  2 +-
 xen/arch/x86/include/asm/e820.h     |  2 +-
 xen/arch/x86/include/asm/hvm/save.h |  8 ++++----
 xen/arch/x86/include/asm/hvm/vpt.h  |  2 +-
 xen/arch/x86/psr.c                  |  4 ++--
 xen/arch/x86/traps.c                |  4 ++--
 11 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 41879230ec..57ec500408 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -760,7 +760,7 @@ int lapic_resume(void)
  * Original code written by Keir Fraser.
  */
 
-static int __init cf_check lapic_disable(const char *str)
+static int __init cf_check lapic_disable(const char *s)
 {
     enable_local_apic = -1;
     setup_clear_cpu_cap(X86_FEATURE_APIC);
@@ -769,11 +769,11 @@ static int __init cf_check lapic_disable(const char *str)
 custom_param("nolapic", lapic_disable);
 boolean_param("lapic", enable_local_apic);
 
-static int __init cf_check apic_set_verbosity(const char *str)
+static int __init cf_check apic_set_verbosity(const char *level)
 {
-    if (strcmp("debug", str) == 0)
+    if (strcmp("debug", level) == 0)
         apic_verbosity = APIC_DEBUG;
-    else if (strcmp("verbose", str) == 0)
+    else if (strcmp("verbose", level) == 0)
         apic_verbosity = APIC_VERBOSE;
     else
         return -EINVAL;
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index c2173cfc78..9d76a462a7 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -63,9 +63,9 @@ struct mca_banks *mca_allbanks;
 #endif
 
 int mce_verbosity;
-static int __init cf_check mce_set_verbosity(const char *str)
+static int __init cf_check mce_set_verbosity(const char *level)
 {
-    if ( strcmp("verbose", str) == 0 )
+    if ( strcmp("verbose", level) == 0 )
         mce_verbosity = MCE_VERBOSE;
     else
         return -EINVAL;
@@ -1746,7 +1746,7 @@ static enum mce_result mce_action(const struct cpu_user_regs *regs,
     struct mcinfo_common *mic = NULL;
     struct mca_binfo binfo;
     const struct mca_error_handler *handlers = mce_dhandlers;
-    unsigned int i, handler_num = mce_dhandler_num;
+    unsigned int j, handler_num = mce_dhandler_num;
 
     /* When in mce context, regs is valid */
     if ( regs )
@@ -1780,11 +1780,11 @@ static enum mce_result mce_action(const struct cpu_user_regs *regs,
         binfo.mib = (struct mcinfo_bank *)mic;
         binfo.bank = binfo.mib->mc_bank;
         bank_result = MCER_NOERROR;
-        for ( i = 0; i < handler_num; i++ )
+        for ( j = 0; j < handler_num; j++ )
         {
-            if ( handlers[i].owned_error(binfo.mib->mc_status) )
+            if ( handlers[j].owned_error(binfo.mib->mc_status) )
             {
-                handlers[i].recovery_handler(&binfo, &bank_result, regs);
+                handlers[j].recovery_handler(&binfo, &bank_result, regs);
                 if ( worst_result < bank_result )
                     worst_result = bank_result;
                 break;
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index ff5c808bc9..8abe14773d 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1429,7 +1429,7 @@ static int __init mwait_idle_probe(void)
 {
 	unsigned int eax, ebx, ecx;
 	const struct x86_cpu_id *id = x86_match_cpu(intel_idle_ids);
-	const char *str;
+	const char *state_str;
 
 	if (!id) {
 		pr_debug(PREFIX "does not run on family %d model %d\n",
@@ -1471,10 +1471,10 @@ static int __init mwait_idle_probe(void)
 	pr_debug(PREFIX "lapic_timer_reliable_states %#x\n",
 		 lapic_timer_reliable_states);
 
-	str = preferred_states;
-	if (isdigit(str[0]))
-		preferred_states_mask = simple_strtoul(str, &str, 0);
-	else if (str[0])
+	state_str = preferred_states;
+	if (isdigit(state_str[0]))
+		preferred_states_mask = simple_strtoul(state_str, &state_str, 0);
+	else if (state_str[0])
 	{
 		const char *ss;
 
@@ -1482,13 +1482,13 @@ static int __init mwait_idle_probe(void)
 			const struct cpuidle_state *state = icpu->state_table;
 			unsigned int bit = 1;
 
-			ss = strchr(str, ',');
+			ss = strchr(state_str, ',');
 			if (!ss)
-				ss = strchr(str, '\0');
+				ss = strchr(state_str, '\0');
 
 			for (; state->name[0]; ++state) {
 				bit <<= 1;
-				if (!cmdline_strcmp(str, state->name)) {
+				if (!cmdline_strcmp(state_str, state->name)) {
 					preferred_states_mask |= bit;
 					break;
 				}
@@ -1496,13 +1496,13 @@ static int __init mwait_idle_probe(void)
 			if (!state->name[0])
 				break;
 
-			str = ss + 1;
+			state_str = ss + 1;
 		} while (*ss);
 
-		str -= str == ss + 1;
+		state_str -= state_str == ss + 1;
 	}
-	if (str[0])
-		printk("unrecognized \"preferred-cstates=%s\"\n", str);
+	if (state_str[0])
+		printk("unrecognized \"preferred-cstates=%s\"\n", state_str);
 
 	mwait_idle_state_table_update();
 
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 5f66c2ae33..fe86a7f853 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -858,7 +858,7 @@ int arch_domain_create(struct domain *d,
     }
 
     /* PV/PVH guests get an emulated PIT too for video BIOSes to use. */
-    pit_init(d, cpu_khz);
+    pit_init(d);
 
     /*
      * If the FPU does not save FCS/FDS then we can always
diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index 0b89935510..5bff35c4cf 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -683,11 +683,11 @@ int __init reserve_e820_ram(struct e820map *e820, uint64_t s, uint64_t e)
     return e820_change_range_type(e820, s, e, E820_RAM, E820_RESERVED);
 }
 
-unsigned long __init init_e820(const char *str, struct e820map *raw)
+unsigned long __init init_e820(const char *memmap_name, struct e820map *raw)
 {
     if ( e820_verbose )
     {
-        printk("Initial %s RAM map:\n", str);
+        printk("Initial %s RAM map:\n", memmap_name);
         print_e820_memory_map(raw->map, raw->nr_map);
     }
 
@@ -696,7 +696,7 @@ unsigned long __init init_e820(const char *str, struct e820map *raw)
     if ( cpu_has_hypervisor )
         hypervisor_e820_fixup(&e820);
 
-    printk("%s RAM map:\n", str);
+    printk("%s RAM map:\n", memmap_name);
     print_e820_memory_map(e820.map, e820.nr_map);
 
     return find_max_pfn();
diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index a81232fc55..41ec4a1ef1 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -495,7 +495,7 @@ void pit_reset(struct domain *d)
     spin_unlock(&pit->lock);
 }
 
-void pit_init(struct domain *d, unsigned long cpu_khz)
+void pit_init(struct domain *d)
 {
     PITState *pit = domain_vpit(d);
 
diff --git a/xen/arch/x86/include/asm/e820.h b/xen/arch/x86/include/asm/e820.h
index 92f5efa4f5..5cb1915a6e 100644
--- a/xen/arch/x86/include/asm/e820.h
+++ b/xen/arch/x86/include/asm/e820.h
@@ -31,7 +31,7 @@ extern int e820_change_range_type(
     uint32_t orig_type, uint32_t new_type);
 extern int e820_add_range(
     struct e820map *, uint64_t s, uint64_t e, uint32_t type);
-extern unsigned long init_e820(const char *, struct e820map *);
+extern unsigned long init_e820(const char *memmap_name, struct e820map *raw);
 extern void print_e820_memory_map(const struct e820entry *map,
     unsigned int entries);
 extern struct e820map e820;
diff --git a/xen/arch/x86/include/asm/hvm/save.h b/xen/arch/x86/include/asm/hvm/save.h
index 535cf68ed2..4d0a062b2c 100644
--- a/xen/arch/x86/include/asm/hvm/save.h
+++ b/xen/arch/x86/include/asm/hvm/save.h
@@ -49,21 +49,21 @@ void _hvm_read_entry(struct hvm_domain_context *h,
  */
 #define _hvm_load_entry(_x, _h, _dst, _strict) ({                       \
     int r;                                                              \
-    struct hvm_save_descriptor *desc                                    \
+    struct hvm_save_descriptor *descriptor                              \
         = (struct hvm_save_descriptor *)&(_h)->data[(_h)->cur];         \
     if ( (r = _hvm_check_entry((_h), HVM_SAVE_CODE(_x),                 \
                HVM_SAVE_LENGTH(_x), (_strict))) == 0 )                  \
     {                                                                   \
         _hvm_read_entry((_h), (_dst), HVM_SAVE_LENGTH(_x));             \
         if ( HVM_SAVE_HAS_COMPAT(_x) &&                                 \
-             desc->length != HVM_SAVE_LENGTH(_x) )                      \
-            r = HVM_SAVE_FIX_COMPAT(_x, (_dst), desc->length);          \
+             descriptor->length != HVM_SAVE_LENGTH(_x) )                \
+            r = HVM_SAVE_FIX_COMPAT(_x, (_dst), descriptor->length);    \
     }                                                                   \
     else if (HVM_SAVE_HAS_COMPAT(_x)                                    \
              && (r = _hvm_check_entry((_h), HVM_SAVE_CODE(_x),          \
                        HVM_SAVE_LENGTH_COMPAT(_x), (_strict))) == 0 ) { \
         _hvm_read_entry((_h), (_dst), HVM_SAVE_LENGTH_COMPAT(_x));      \
-        r = HVM_SAVE_FIX_COMPAT(_x, (_dst), desc->length);              \
+        r = HVM_SAVE_FIX_COMPAT(_x, (_dst), descriptor->length);        \
     }                                                                   \
     r; })
 
diff --git a/xen/arch/x86/include/asm/hvm/vpt.h b/xen/arch/x86/include/asm/hvm/vpt.h
index 2af76ca8dc..feb0bf43f1 100644
--- a/xen/arch/x86/include/asm/hvm/vpt.h
+++ b/xen/arch/x86/include/asm/hvm/vpt.h
@@ -179,7 +179,7 @@ void destroy_periodic_time(struct periodic_time *pt);
 int pv_pit_handler(int port, int data, int write);
 void pit_reset(struct domain *d);
 
-void pit_init(struct domain *d, unsigned long cpu_khz);
+void pit_init(struct domain *d);
 void pit_stop_channel0_irq(PITState * pit);
 void pit_deinit(struct domain *d);
 void rtc_init(struct domain *d);
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index a1e0af27c5..90bcb25e60 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -1252,7 +1252,7 @@ static void cf_check do_write_psr_msrs(void *data)
 {
     const struct cos_write_info *info = data;
     unsigned int i, index, cos = info->cos;
-    const struct psr_socket_info *socket_info =
+    const struct psr_socket_info *sock_info =
         get_socket_info(cpu_to_socket(smp_processor_id()));
 
     /*
@@ -1261,7 +1261,7 @@ static void cf_check do_write_psr_msrs(void *data)
      */
     for ( index = i = 0; i < ARRAY_SIZE(feat_props); i++ )
     {
-        struct feat_node *feat = socket_info->features[i];
+        struct feat_node *feat = sock_info->features[i];
         const struct feat_props *props = feat_props[i];
         unsigned int cos_num, j;
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 4229bda159..f32cd2126d 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -196,7 +196,7 @@ void show_code(const struct cpu_user_regs *regs)
 
 static void compat_show_guest_stack(struct vcpu *v,
                                     const struct cpu_user_regs *regs,
-                                    int debug_stack_lines)
+                                    int dbg_stack_lines)
 {
     unsigned int i, *stack, addr, mask = STACK_SIZE;
     void *stack_page = NULL;
@@ -233,7 +233,7 @@ static void compat_show_guest_stack(struct vcpu *v,
             mask = PAGE_SIZE;
     }
 
-    for ( i = 0; i < debug_stack_lines * 8; i++ )
+    for ( i = 0; i < dbg_stack_lines * 8; i++ )
     {
         if ( (((long)stack - 1) ^ ((long)(stack + 1) - 1)) & mask )
             break;
-- 
2.34.1


