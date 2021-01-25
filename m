Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE0C302B6D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 20:21:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74381.133750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47QD-0003gw-Bw; Mon, 25 Jan 2021 19:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74381.133750; Mon, 25 Jan 2021 19:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47QD-0003fU-2O; Mon, 25 Jan 2021 19:21:09 +0000
Received: by outflank-mailman (input) for mailman id 74381;
 Mon, 25 Jan 2021 19:21:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTVL=G4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l47GJ-0008N7-JR
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:10:55 +0000
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5bc4c605-df07-442b-8357-7150c8be4ed9;
 Mon, 25 Jan 2021 19:09:19 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id m187so388585wme.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 11:09:16 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k6sm12991031wro.27.2021.01.25.11.09.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 11:09:15 -0800 (PST)
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
X-Inumbo-ID: 5bc4c605-df07-442b-8357-7150c8be4ed9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=56q3vS7kTPjkBeZpCedlA35sj1F6SAbFf73YA28cuDw=;
        b=NAQXLR3YC0ePDFcJsMH2mJiS9iq1e7hqncXyhKPgAIZMXHKYL90qKiw9NPln14JyhJ
         ko/xbh3dydPY5irT9V1He2YZE32F2nM/EXck5OgfqpTzh9mC+T43vXlsCduaHjZM+u8/
         CMyvM8Vsx81GVsTyVd1aQeaYP9LO7AekDaITxS+WU/0KejucOPTaVBZlwGLMw2dG8oQY
         ACi9SUyne7kX/xeLPKxVZ6my/XbN0GiGE1c9eA6iYAOBRSd+gXd/cnmqexzyejRGTeYG
         Imara8PFomv2OPOgIUkvSHWHkOUSc4zIxe926xQqwcDHpS2RyOHOeTEkSE6D/6ncvsd2
         00AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=56q3vS7kTPjkBeZpCedlA35sj1F6SAbFf73YA28cuDw=;
        b=teMn0cPjRhsuaOc0sTZQXvngmm8sK4YvDwvCt00FViUcC6D8WVxYDGhoGOH77WrekW
         CFYGCIP+IiBOPBpssnT7eBOlYGOWVhyjdT+BIn9NPEaDiqZgwNuelKzS1ezaSAbQq951
         8f7z0V4IffMGznwXgg1cGYlCkZCfUVm0IY6QbP3eOTBQdHPpqKfot93xP3r/RjYpU7ZD
         DAZe/ISlJGG1desqYtf2OLHEQfBi5935JwrjOcX8XFS/6dORFGZ2rnwE6xR716kFdDXE
         LSRWC2FgZx4R8DjhaUhwf7MQx/W/OqvKXhp83rmgkhQw2CUaB88J4Yru7xpkQMmBDJx9
         /Jqw==
X-Gm-Message-State: AOAM530l4gmylGvep/xpp00r7krgexN+w1CNpJFkGPXCStpuFZuInwoh
	Wj9QKVTLAkeSBCusKq6f1p4WZxwQjninRA==
X-Google-Smtp-Source: ABdhPJxqWxZA1UNJHCs8azX6BOxbaVbtxb6CX9NTt1ZK8DMoPsOuUD+DEbXrlAAjS6M6ec1aRQWp0Q==
X-Received: by 2002:a1c:a593:: with SMTP id o141mr1467438wme.92.1611601755965;
        Mon, 25 Jan 2021 11:09:15 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V5 22/22] xen/arm: Add mapcache invalidation handling
Date: Mon, 25 Jan 2021 21:08:29 +0200
Message-Id: <1611601709-28361-23-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

We need to send mapcache invalidation request to qemu/demu everytime
the page gets removed from a guest.

At the moment, the Arm code doesn't explicitely remove the existing
mapping before inserting the new mapping. Instead, this is done
implicitely by __p2m_set_entry().

So we need to recognize a case when old entry is a RAM page *and*
the new MFN is different in order to set the corresponding flag.
The most suitable place to do this is p2m_free_entry(), there
we can find the correct leaf type. The invalidation request
will be sent in do_trap_hypercall() later on.

Taking into the account the following the do_trap_hypercall()
is the best place to send invalidation request:
 - The only way a guest can modify its P2M on Arm is via an hypercall
 - When sending the invalidation request, the vCPU will be blocked
   until all the IOREQ servers have acknowledged the invalidation

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

***
Please note, this patch depends on the following which is
on review:
https://patchwork.kernel.org/patch/11803383/

This patch is on par with x86 code (whether it is buggy or not).
If there is a need to improve/harden something, this can be done on
a follow-up.
***

Changes V1 -> V2:
   - new patch, some changes were derived from (+ new explanation):
     xen/ioreq: Make x86's invalidate qemu mapcache handling common
   - put setting of the flag into __p2m_set_entry()
   - clarify the conditions when the flag should be set
   - use domain_has_ioreq_server()
   - update do_trap_hypercall() by adding local variable

Changes V2 -> V3:
   - update patch description
   - move check to p2m_free_entry()
   - add a comment
   - use "curr" instead of "v" in do_trap_hypercall()

Changes V3 -> V4:
   - update patch description
   - re-order check in p2m_free_entry() to call domain_has_ioreq_server()
     only if p2m->domain == current->domain
   - add a comment in do_trap_hypercall()

Changes V4 -> V5:
   - add Stefano's R-b
   - update comment in do_trap_hypercall()
---
---
 xen/arch/arm/p2m.c   | 25 +++++++++++++++++--------
 xen/arch/arm/traps.c | 20 +++++++++++++++++---
 2 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index d41c4fa..26acb95d 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1,6 +1,7 @@
 #include <xen/cpu.h>
 #include <xen/domain_page.h>
 #include <xen/iocap.h>
+#include <xen/ioreq.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
@@ -749,17 +750,25 @@ static void p2m_free_entry(struct p2m_domain *p2m,
     if ( !p2m_is_valid(entry) )
         return;
 
-    /* Nothing to do but updating the stats if the entry is a super-page. */
-    if ( p2m_is_superpage(entry, level) )
+    if ( p2m_is_superpage(entry, level) || (level == 3) )
     {
-        p2m->stats.mappings[level]--;
-        return;
-    }
+#ifdef CONFIG_IOREQ_SERVER
+        /*
+         * If this gets called (non-recursively) then either the entry
+         * was replaced by an entry with a different base (valid case) or
+         * the shattering of a superpage was failed (error case).
+         * So, at worst, the spurious mapcache invalidation might be sent.
+         */
+        if ( (p2m->domain == current->domain) &&
+              domain_has_ioreq_server(p2m->domain) &&
+              p2m_is_ram(entry.p2m.type) )
+            p2m->domain->mapcache_invalidate = true;
+#endif
 
-    if ( level == 3 )
-    {
         p2m->stats.mappings[level]--;
-        p2m_put_l3_page(entry);
+        /* Nothing to do if the entry is a super-page. */
+        if ( level == 3 )
+            p2m_put_l3_page(entry);
         return;
     }
 
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 4cdd343..64b740b 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1443,6 +1443,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
                               const union hsr hsr)
 {
     arm_hypercall_fn_t call = NULL;
+    struct vcpu *curr = current;
 
     BUILD_BUG_ON(NR_hypercalls < ARRAY_SIZE(arm_hypercall_table) );
 
@@ -1459,7 +1460,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
         return;
     }
 
-    current->hcall_preempted = false;
+    curr->hcall_preempted = false;
 
     perfc_incra(hypercalls, *nr);
     call = arm_hypercall_table[*nr].fn;
@@ -1472,7 +1473,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
     HYPERCALL_RESULT_REG(regs) = call(HYPERCALL_ARGS(regs));
 
 #ifndef NDEBUG
-    if ( !current->hcall_preempted )
+    if ( !curr->hcall_preempted )
     {
         /* Deliberately corrupt parameter regs used by this hypercall. */
         switch ( arm_hypercall_table[*nr].nr_args ) {
@@ -1489,8 +1490,21 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
 #endif
 
     /* Ensure the hypercall trap instruction is re-executed. */
-    if ( current->hcall_preempted )
+    if ( curr->hcall_preempted )
         regs->pc -= 4;  /* re-execute 'hvc #XEN_HYPERCALL_TAG' */
+
+#ifdef CONFIG_IOREQ_SERVER
+    /*
+     * We call ioreq_signal_mapcache_invalidate from do_trap_hypercall()
+     * because the only way a guest can modify its P2M on Arm is via an
+     * hypercall.
+     * Note that sending the invalidation request causes the vCPU to block
+     * until all the IOREQ servers have acknowledged the invalidation.
+     */
+    if ( unlikely(curr->domain->mapcache_invalidate) &&
+         test_and_clear_bool(curr->domain->mapcache_invalidate) )
+        ioreq_signal_mapcache_invalidate();
+#endif
 }
 
 void arch_hypercall_tasklet_result(struct vcpu *v, long res)
-- 
2.7.4


