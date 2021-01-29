Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60060308383
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 02:59:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77635.140825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J4F-0007XM-4Q; Fri, 29 Jan 2021 01:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77635.140825; Fri, 29 Jan 2021 01:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J4E-0007Tv-IQ; Fri, 29 Jan 2021 01:59:22 +0000
Received: by outflank-mailman (input) for mailman id 77635;
 Fri, 29 Jan 2021 01:59:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5Iw5-0004da-Me
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 01:50:57 +0000
Received: from mail-lj1-x229.google.com (unknown [2a00:1450:4864:20::229])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b1eead0-3291-4457-83cd-8c707f3c6841;
 Fri, 29 Jan 2021 01:49:30 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id a25so8754720ljn.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 17:49:29 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z128sm1840238lfa.72.2021.01.28.17.49.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 17:49:27 -0800 (PST)
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
X-Inumbo-ID: 6b1eead0-3291-4457-83cd-8c707f3c6841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rF6mEm5YriIEef9BT+XrdAFUqgH3Lonx+bIstOZUlFo=;
        b=FR0GXFcoTPqEIp5GCxkPfPq2ulwOtg6Hzes21Npdyg0cEm5DHrHMd/xs/M7iMCrRan
         X2nNOorGumkqMQbUR0nz8Cux0sfnJ0CEkc2JmvMccubZtcEuwRaPJwuvJ+S0MluXCcHM
         41UyQyMEw6Py9VzT//IL5qTByLkWmT2JFctqJBrrLiqd2Lp5sqzA1QdrohEDy5Xe2wHp
         3b3CijIMNeVssQ/tu8cD6QabTzKp2425h1CUrJyzbJggzsEIp3l93qSK0kp/wTOJugz1
         gdJGwwBHokpmHS2FLc7k6PSQVhV4mku93I4+tNm1VPMrmOxxuW1i1j1vJnRKfLjA+61a
         tSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rF6mEm5YriIEef9BT+XrdAFUqgH3Lonx+bIstOZUlFo=;
        b=Y5I4xKUwcu5C+nKC7iQ7N2gk5NTQVG1hJHh3ORwXOzdorPSumXBhNsbi/FNcgiN5Q+
         ksq9+zkhzokSE6FywpodBkcut9rJ4W+plBmEdWmhjEYTW9H31JZd6mMiUd8Wcg5HTiS0
         tAUDTNwuSlvuZTvOspYY1j7ALqv33TWu0NsuD6sImyqLsZ1gpXNJ0DGChRa78E0MXUU6
         rU+xe4rWnawGdubqGgYArykbg+qBeua2pdZtKJPKXxr4q+jB+9S4ge75gjUs++gO0iq9
         Dig9cRZT1CKX8BAeM7gdS5K/HBERBUD2nxwvUxwXMCgK/zyXQZN09nYR9+UaQPSqxyH+
         +Hkg==
X-Gm-Message-State: AOAM5330BIU5l4yZMWKHGNyY+oyYNUAslT0eGt1rLX/MhYzADlOv58+9
	iAefvMr7Sl4hou5c33fTRLsE9FmsU2kSUw==
X-Google-Smtp-Source: ABdhPJyHkJfC7bxhBDFViDBdYVc370+fwWLTAVrgT2cS351liUPi/9hR6v02WdPtPWY2oJpaLClD/w==
X-Received: by 2002:a2e:a54f:: with SMTP id e15mr1129782ljn.441.1611884968369;
        Thu, 28 Jan 2021 17:49:28 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V6 22/24] xen/arm: Add mapcache invalidation handling
Date: Fri, 29 Jan 2021 03:48:50 +0200
Message-Id: <1611884932-1851-23-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

We need to send mapcache invalidation request to qemu/demu everytime
the page gets removed from a guest.

At the moment, the Arm code doesn't explicitely remove the existing
mapping before inserting the new mapping. Instead, this is done
implicitely by __p2m_set_entry().

First of all we need to recognize a case when the "freed" entry
contains some RAM page in order to set the corresponding flag.
The most suitable place to do this is p2m_free_entry(), there we can
find the correct leaf type. The invalidation request will be sent
in do_trap_hypercall() later on.

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

Changes V5 -> V6:
   - update comment in p2m_free_entry() and patch description

---
---
 xen/arch/arm/p2m.c   | 25 +++++++++++++++++--------
 xen/arch/arm/traps.c | 20 +++++++++++++++++---
 2 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index d41c4fa..6895804 100644
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
+         * If this gets called then either the entry was replaced by an entry
+         * with a different base (valid case) or the shattering of a superpage
+         * has failed (error case).
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
index 476900e..6fa1350 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1451,6 +1451,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
                               const union hsr hsr)
 {
     arm_hypercall_fn_t call = NULL;
+    struct vcpu *curr = current;
 
     BUILD_BUG_ON(NR_hypercalls < ARRAY_SIZE(arm_hypercall_table) );
 
@@ -1467,7 +1468,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
         return;
     }
 
-    current->hcall_preempted = false;
+    curr->hcall_preempted = false;
 
     perfc_incra(hypercalls, *nr);
     call = arm_hypercall_table[*nr].fn;
@@ -1480,7 +1481,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
     HYPERCALL_RESULT_REG(regs) = call(HYPERCALL_ARGS(regs));
 
 #ifndef NDEBUG
-    if ( !current->hcall_preempted )
+    if ( !curr->hcall_preempted )
     {
         /* Deliberately corrupt parameter regs used by this hypercall. */
         switch ( arm_hypercall_table[*nr].nr_args ) {
@@ -1497,8 +1498,21 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
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


