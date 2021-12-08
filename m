Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E175146D78B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 16:56:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242364.419278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzIs-0003dw-7G; Wed, 08 Dec 2021 15:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242364.419278; Wed, 08 Dec 2021 15:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzIr-0003HI-Iu; Wed, 08 Dec 2021 15:56:21 +0000
Received: by outflank-mailman (input) for mailman id 242364;
 Wed, 08 Dec 2021 15:56:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J2Or=QZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1muzIm-0001LM-76
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 15:56:16 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e2e218c-583f-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 16:56:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9ED941FE03;
 Wed,  8 Dec 2021 15:56:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D3CC13C8E;
 Wed,  8 Dec 2021 15:56:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CKp/GZzVsGHIXwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 08 Dec 2021 15:56:12 +0000
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
X-Inumbo-ID: 5e2e218c-583f-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638978972; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2n/9xey2IT4ZAnuW1PqFqQUspNgB5vGE/l2Zzlja0vw=;
	b=bkecxq9dHRAdMvoFFLkP2I1NXt3D/CTDUrKNFqqh4EEaPWeBHpHoDAg+8EaIA30+K+TbIq
	ObX3Td6NJRulPGk2ur1aSWeAL7zLqXCnV/iRxLKhJWC8JdNrp1CDvzkm/MRBcK4ThBY/Bp
	Hc3+uxypgu4nVCkdJhdueQTGJHkPZHk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@arm.com>
Subject: [PATCH v3 10/13] xen/arm: call hypercall handlers via generated macro
Date: Wed,  8 Dec 2021 16:56:03 +0100
Message-Id: <20211208155606.20029-11-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211208155606.20029-1-jgross@suse.com>
References: <20211208155606.20029-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using a function table use the generated macros for calling
the appropriate hypercall handlers.

This makes the calls of the handlers type safe.

For deprecated hypercalls define stub functions.

Signed-off-by: Juergen Gross <jgross@suse.com>
Tested-by: Michal Orzel <michal.orzel@arm.com>
---
V2:
- make hypercall_args[] const (Jan Beulich)
---
 xen/arch/arm/traps.c | 119 ++++++++++---------------------------------
 1 file changed, 26 insertions(+), 93 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 7abc28848e..00af76cf14 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1337,62 +1337,20 @@ static register_t do_deprecated_hypercall(void)
     return -ENOSYS;
 }
 
-typedef register_t (*arm_hypercall_fn_t)(
-    register_t, register_t, register_t, register_t, register_t);
-
-typedef struct {
-    arm_hypercall_fn_t fn;
-    int nr_args;
-} arm_hypercall_t;
-
-#define HYPERCALL(_name, _nr_args)                                   \
-    [ __HYPERVISOR_ ## _name ] =  {                                  \
-        .fn = (arm_hypercall_fn_t) &do_ ## _name,                    \
-        .nr_args = _nr_args,                                         \
-    }
+long dep_sched_op_compat(int cmd, unsigned long arg)
+{
+    return do_deprecated_hypercall();
+}
 
-/*
- * Only use this for hypercalls which were deprecated (i.e. replaced
- * by something else) before Xen on ARM was created, i.e. *not* for
- * hypercalls which are simply not yet used on ARM.
- */
-#define HYPERCALL_DEPRECATED(_name, _nr_args)                   \
-    [ __HYPERVISOR_##_name ] = {                                \
-        .fn = (arm_hypercall_fn_t) &do_deprecated_hypercall,    \
-        .nr_args = _nr_args,                                    \
-    }
+long dep_event_channel_op_compat(XEN_GUEST_HANDLE_PARAM(evtchn_op_t) uop)
+{
+    return do_deprecated_hypercall();
+}
 
-static arm_hypercall_t arm_hypercall_table[] = {
-    HYPERCALL(memory_op, 2),
-    HYPERCALL(domctl, 1),
-    HYPERCALL(sched_op, 2),
-    HYPERCALL_DEPRECATED(sched_op_compat, 2),
-    HYPERCALL(console_io, 3),
-    HYPERCALL(xen_version, 2),
-    HYPERCALL(xsm_op, 1),
-    HYPERCALL(event_channel_op, 2),
-    HYPERCALL_DEPRECATED(event_channel_op_compat, 1),
-    HYPERCALL(physdev_op, 2),
-    HYPERCALL_DEPRECATED(physdev_op_compat, 1),
-    HYPERCALL(sysctl, 2),
-    HYPERCALL(hvm_op, 2),
-#ifdef CONFIG_GRANT_TABLE
-    HYPERCALL(grant_table_op, 3),
-#endif
-    HYPERCALL(multicall, 2),
-    HYPERCALL(platform_op, 1),
-    HYPERCALL(vcpu_op, 3),
-    HYPERCALL(vm_assist, 2),
-#ifdef CONFIG_ARGO
-    HYPERCALL(argo_op, 5),
-#endif
-#ifdef CONFIG_HYPFS
-    HYPERCALL(hypfs_op, 5),
-#endif
-#ifdef CONFIG_IOREQ_SERVER
-    HYPERCALL(dm_op, 3),
-#endif
-};
+long dep_physdev_op_compat(XEN_GUEST_HANDLE_PARAM(physdev_op_t) uop)
+{
+    return do_deprecated_hypercall();
+}
 
 #ifndef NDEBUG
 static void do_debug_trap(struct cpu_user_regs *regs, unsigned int code)
@@ -1431,7 +1389,6 @@ static void do_debug_trap(struct cpu_user_regs *regs, unsigned int code)
 #define HYPERCALL_ARG3(r) (r)->x2
 #define HYPERCALL_ARG4(r) (r)->x3
 #define HYPERCALL_ARG5(r) (r)->x4
-#define HYPERCALL_ARGS(r) (r)->x0, (r)->x1, (r)->x2, (r)->x3, (r)->x4
 #else
 #define HYPERCALL_RESULT_REG(r) (r)->r0
 #define HYPERCALL_ARG1(r) (r)->r0
@@ -1439,52 +1396,40 @@ static void do_debug_trap(struct cpu_user_regs *regs, unsigned int code)
 #define HYPERCALL_ARG3(r) (r)->r2
 #define HYPERCALL_ARG4(r) (r)->r3
 #define HYPERCALL_ARG5(r) (r)->r4
-#define HYPERCALL_ARGS(r) (r)->r0, (r)->r1, (r)->r2, (r)->r3, (r)->r4
 #endif
 
+static const unsigned char hypercall_args[] = hypercall_args_arm;
+
 static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
                               const union hsr hsr)
 {
-    arm_hypercall_fn_t call = NULL;
     struct vcpu *curr = current;
 
-    BUILD_BUG_ON(NR_hypercalls < ARRAY_SIZE(arm_hypercall_table) );
-
     if ( hsr.iss != XEN_HYPERCALL_TAG )
     {
         gprintk(XENLOG_WARNING, "Invalid HVC imm 0x%x\n", hsr.iss);
         return inject_undef_exception(regs, hsr);
     }
 
-    if ( *nr >= ARRAY_SIZE(arm_hypercall_table) )
-    {
-        perfc_incr(invalid_hypercalls);
-        HYPERCALL_RESULT_REG(regs) = -ENOSYS;
-        return;
-    }
-
     curr->hcall_preempted = false;
 
     perfc_incra(hypercalls, *nr);
-    call = arm_hypercall_table[*nr].fn;
-    if ( call == NULL )
-    {
-        HYPERCALL_RESULT_REG(regs) = -ENOSYS;
-        return;
-    }
 
-    HYPERCALL_RESULT_REG(regs) = call(HYPERCALL_ARGS(regs));
+    call_handlers_arm(*nr, HYPERCALL_RESULT_REG(regs), HYPERCALL_ARG1(regs),
+                      HYPERCALL_ARG2(regs), HYPERCALL_ARG3(regs),
+                      HYPERCALL_ARG4(regs), HYPERCALL_ARG5(regs));
 
 #ifndef NDEBUG
-    if ( !curr->hcall_preempted )
+    if ( !curr->hcall_preempted && HYPERCALL_RESULT_REG(regs) != -ENOSYS )
     {
         /* Deliberately corrupt parameter regs used by this hypercall. */
-        switch ( arm_hypercall_table[*nr].nr_args ) {
+        switch ( hypercall_args[*nr] ) {
         case 5: HYPERCALL_ARG5(regs) = 0xDEADBEEF;
         case 4: HYPERCALL_ARG4(regs) = 0xDEADBEEF;
         case 3: HYPERCALL_ARG3(regs) = 0xDEADBEEF;
         case 2: HYPERCALL_ARG2(regs) = 0xDEADBEEF;
         case 1: /* Don't clobber x0/r0 -- it's the return value */
+        case 0: /* -ENOSYS case */
             break;
         default: BUG();
         }
@@ -1521,7 +1466,10 @@ static bool check_multicall_32bit_clean(struct multicall_entry *multi)
 {
     int i;
 
-    for ( i = 0; i < arm_hypercall_table[multi->op].nr_args; i++ )
+    if ( multi->op >= ARRAY_SIZE(hypercall_args) )
+        return true;
+
+    for ( i = 0; i < hypercall_args[multi->op]; i++ )
     {
         if ( unlikely(multi->args[i] & 0xffffffff00000000ULL) )
         {
@@ -1538,28 +1486,13 @@ static bool check_multicall_32bit_clean(struct multicall_entry *multi)
 enum mc_disposition arch_do_multicall_call(struct mc_state *state)
 {
     struct multicall_entry *multi = &state->call;
-    arm_hypercall_fn_t call = NULL;
-
-    if ( multi->op >= ARRAY_SIZE(arm_hypercall_table) )
-    {
-        multi->result = -ENOSYS;
-        return mc_continue;
-    }
-
-    call = arm_hypercall_table[multi->op].fn;
-    if ( call == NULL )
-    {
-        multi->result = -ENOSYS;
-        return mc_continue;
-    }
 
     if ( is_32bit_domain(current->domain) &&
          !check_multicall_32bit_clean(multi) )
         return mc_continue;
 
-    multi->result = call(multi->args[0], multi->args[1],
-                         multi->args[2], multi->args[3],
-                         multi->args[4]);
+    call_handlers_arm(multi->op, multi->result, multi->args[0], multi->args[1],
+                      multi->args[2], multi->args[3], multi->args[4]);
 
     return likely(!psr_mode_is_user(guest_cpu_user_regs()))
            ? mc_continue : mc_preempt;
-- 
2.26.2


