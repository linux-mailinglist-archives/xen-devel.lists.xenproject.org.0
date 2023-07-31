Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B24A768EE8
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 09:34:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572769.896816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQNQE-0008UC-I4; Mon, 31 Jul 2023 07:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572769.896816; Mon, 31 Jul 2023 07:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQNQE-0008PI-Cm; Mon, 31 Jul 2023 07:34:30 +0000
Received: by outflank-mailman (input) for mailman id 572769;
 Mon, 31 Jul 2023 07:34:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wefb=DR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQNQC-0008M2-O0
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 07:34:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acffca73-2f74-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 09:34:26 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 7FEE24EE0740;
 Mon, 31 Jul 2023 09:34:24 +0200 (CEST)
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
X-Inumbo-ID: acffca73-2f74-11ee-8613-37d641c3527e
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
Subject: [XEN PATCH v2 1/4] x86: mechanically rename to address MISRA C:2012 Rule 5.3
Date: Mon, 31 Jul 2023 09:33:38 +0200
Message-Id: <b169d1c682254e682e6ed34f33481a768209ce9b.1690788513.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690788513.git.nicola.vetrini@bugseng.com>
References: <cover.1690788513.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 5.3 has the following headline:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope"

The renames done by this patch avoid shadowing from happening.
They are as follows:
- s/i/j/ in 'mce_action' (the shadowing here is due to macro
  'x86_mcinfo_lookup' that defines 'i' as a loop counter)
- s/desc/descriptor/ in '_hvm_load_entry'
- s/socket_info/sock_info/ in 'do_write_psr_msrs'

The parameter 'cpu_khz' that causes a violation in 'pit_init'
is unused, and hence can be removed.

Parameter 'debug_stack_lines' in 'compat_show_guest_stack' is removed,
since the shadowed static variable has the same purpose.

The declaration of 'init_e820' is renamed to be consistent with its
definition.

No functional changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- removed renames for 'str' parameters
- removed parameter 'debug_stack_lines' from
  'compat_show_guest_stack'
---
 xen/arch/x86/cpu/mcheck/mce.c       | 8 ++++----
 xen/arch/x86/domain.c               | 2 +-
 xen/arch/x86/emul-i8254.c           | 2 +-
 xen/arch/x86/include/asm/e820.h     | 2 +-
 xen/arch/x86/include/asm/hvm/save.h | 8 ++++----
 xen/arch/x86/include/asm/hvm/vpt.h  | 2 +-
 xen/arch/x86/psr.c                  | 4 ++--
 xen/arch/x86/traps.c                | 5 ++---
 8 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index c2173cfc78..2dbed604b1 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
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
index 92f5efa4f5..213d5b5dd2 100644
--- a/xen/arch/x86/include/asm/e820.h
+++ b/xen/arch/x86/include/asm/e820.h
@@ -31,7 +31,7 @@ extern int e820_change_range_type(
     uint32_t orig_type, uint32_t new_type);
 extern int e820_add_range(
     struct e820map *, uint64_t s, uint64_t e, uint32_t type);
-extern unsigned long init_e820(const char *, struct e820map *);
+extern unsigned long init_e820(const char *str, struct e820map *raw);
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
index 4229bda159..f11239fd0f 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -195,8 +195,7 @@ void show_code(const struct cpu_user_regs *regs)
 }

 static void compat_show_guest_stack(struct vcpu *v,
-                                    const struct cpu_user_regs *regs,
-                                    int debug_stack_lines)
+                                    const struct cpu_user_regs *regs)
 {
     unsigned int i, *stack, addr, mask = STACK_SIZE;
     void *stack_page = NULL;
@@ -273,7 +272,7 @@ static void show_guest_stack(struct vcpu *v, const struct cpu_user_regs *regs)

     if ( is_pv_32bit_vcpu(v) )
     {
-        compat_show_guest_stack(v, regs, debug_stack_lines);
+        compat_show_guest_stack(v, regs);
         return;
     }

--
2.34.1

