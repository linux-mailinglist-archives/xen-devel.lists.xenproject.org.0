Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F0076AB88
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 10:59:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573835.898784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlDd-0003nx-Tw; Tue, 01 Aug 2023 08:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573835.898784; Tue, 01 Aug 2023 08:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlDd-0003l0-Qx; Tue, 01 Aug 2023 08:59:05 +0000
Received: by outflank-mailman (input) for mailman id 573835;
 Tue, 01 Aug 2023 08:59:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjSu=DS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQlDc-0003ku-Pa
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 08:59:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9692204-3049-11ee-b259-6b7b168915f2;
 Tue, 01 Aug 2023 10:59:03 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 1A9A44EE0737;
 Tue,  1 Aug 2023 10:59:00 +0200 (CEST)
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
X-Inumbo-ID: a9692204-3049-11ee-b259-6b7b168915f2
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
Subject: [XEN PATCH] x86: mechanically rename to address MISRA C:2012 Rule 5.3
Date: Tue,  1 Aug 2023 10:58:46 +0200
Message-Id: <6c421b903cf11e4dafdb0883e0401ebc2d6cb318.1690880275.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 5.3 has the following headline:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope"

The renames done by this patch avoid shadowing from happening.
They are as follows:
- s/socket_info/sock_info/ in 'do_write_psr_msrs'

The parameter 'cpu_khz' that causes a violation in 'pit_init'
is unused, and hence can be removed.

Parameter 'debug_stack_lines' in 'compat_show_guest_stack' is removed,
since the shadowed static variable has the same purpose.

The declaration of 'init_e820' is renamed to be consistent with its
definition.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
This patch is the non-controversial part of patch 1/4 from series
https://lore.kernel.org/xen-devel/cover.1690788513.git.nicola.vetrini@bugseng.com/
The other part has been dealt with with a patch from Jan Beulich
(not yet committed at the time of writing)
https://lore.kernel.org/xen-devel/e9035197-b329-af2e-65ed-af31cd0375c2@suse.com/
---
 xen/arch/x86/domain.c              | 2 +-
 xen/arch/x86/emul-i8254.c          | 2 +-
 xen/arch/x86/include/asm/e820.h    | 2 +-
 xen/arch/x86/include/asm/hvm/vpt.h | 2 +-
 xen/arch/x86/psr.c                 | 4 ++--
 xen/arch/x86/traps.c               | 5 ++---
 6 files changed, 8 insertions(+), 9 deletions(-)

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


