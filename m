Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5269C2C8275
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:44:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40930.73997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgfX-0003p3-J6; Mon, 30 Nov 2020 10:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40930.73997; Mon, 30 Nov 2020 10:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgfX-0003nr-AV; Mon, 30 Nov 2020 10:44:31 +0000
Received: by outflank-mailman (input) for mailman id 40930;
 Mon, 30 Nov 2020 10:44:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avKr=FE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kjgV7-0000Uu-En
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:33:45 +0000
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99336363-45f7-42cc-a685-7b4091276a2a;
 Mon, 30 Nov 2020 10:32:22 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id q13so19910159lfr.10
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 02:32:21 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 136sm2399393lfb.62.2020.11.30.02.32.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:32:19 -0800 (PST)
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
X-Inumbo-ID: 99336363-45f7-42cc-a685-7b4091276a2a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Z671f8NtIQQSdLKPW7Ujw7d1GChOiu14pAFcqn9342M=;
        b=i6IB/D3cTa/9KbdcsLiGLYiGU6RKFd30neH7OpWV/zgMkEGuWqh+gK44FpPVNN/3gP
         han1c6Bc+aJ7ampbPFJ3PotG9kHTiB/SmzdbG9AtbSSXUjZZy9daEfdQyKZa9xaECzyW
         jI/U6vZJ5OlUVbejs/MYuUuU9a3pJlePvsPRLqgZcfijVh3ShuEnax5TdUD1kPrPH8Kb
         61PNowVZZudUxAYJZWDrbGRIlBfKb7O05MHYeZu7PPXcObLrevrEkWXBwv4DQhMlhafy
         1pT7yjQIXQwiI7c3sxPx7BPPTXPCvpAWBDV0rLa6uoKWRIpIp+W5i8h4+/FEyGAYFfET
         rSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Z671f8NtIQQSdLKPW7Ujw7d1GChOiu14pAFcqn9342M=;
        b=AmQ+0F93qdliGcez0NUbb7n0ce5VePfxPH9FdAOijEpXxG0mk88AEgpcYWyWAhLhBV
         zs7LkE2UQV4y7p/j/NjyANNw5i8avYYF9dGo3T4ev7XURORq6pa6Auyhj4zER7kHnaJn
         +YWl8RCQ2cyrfA5DIAxViuRl7UqYo2D3W6NPepojmkoTC8PQvxXJNttYvY3fXjrAWoJe
         IhDKAInT89zxQ2SVahEB0s3thW21Nw7a4ppvZXxV/Zv4UO3hKYxIqF0wYHRhVaWq7ZUb
         GZXJQNsGKybOWwMpw4dBvPkNZ82XipQABcr4UOxTp4FNOAf7QriuFlo0llDcjIsEjh6U
         NKvg==
X-Gm-Message-State: AOAM530MEYe8YCM76tI2gcKSm1fqgT+fonxW1PYDJt1psepVYS6CLOUA
	rYCLUPG0NdHLQ1ddjx0e5qhnWAtfrLB1Aw==
X-Google-Smtp-Source: ABdhPJySun5qea1qs774Yk8F4e0pmXYkhq/Jfe962JNLAOrwOFlSTOgFx57BlncSwpz28P1vAOSXVQ==
X-Received: by 2002:a05:6512:3243:: with SMTP id c3mr8426212lfr.371.1606732340364;
        Mon, 30 Nov 2020 02:32:20 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V3 21/23] xen/arm: Add mapcache invalidation handling
Date: Mon, 30 Nov 2020 12:31:36 +0200
Message-Id: <1606732298-22107-22-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>

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

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

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
---
---
 xen/arch/arm/p2m.c   | 24 ++++++++++++++++--------
 xen/arch/arm/traps.c | 13 ++++++++++---
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 5b8d494..9674f6f 100644
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
@@ -749,17 +750,24 @@ static void p2m_free_entry(struct p2m_domain *p2m,
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
+        if ( domain_has_ioreq_server(p2m->domain) &&
+             (p2m->domain == current->domain) && p2m_is_ram(entry.p2m.type) )
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
index b6077d2..151c626 100644
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
@@ -1489,8 +1490,14 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
 #endif
 
     /* Ensure the hypercall trap instruction is re-executed. */
-    if ( current->hcall_preempted )
+    if ( curr->hcall_preempted )
         regs->pc -= 4;  /* re-execute 'hvc #XEN_HYPERCALL_TAG' */
+
+#ifdef CONFIG_IOREQ_SERVER
+    if ( unlikely(curr->domain->mapcache_invalidate) &&
+         test_and_clear_bool(curr->domain->mapcache_invalidate) )
+        ioreq_signal_mapcache_invalidate();
+#endif
 }
 
 void arch_hypercall_tasklet_result(struct vcpu *v, long res)
-- 
2.7.4


