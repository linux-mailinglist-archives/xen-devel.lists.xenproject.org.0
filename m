Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1DD56813A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 10:26:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361955.591750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o90MX-00042g-3A; Wed, 06 Jul 2022 08:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361955.591750; Wed, 06 Jul 2022 08:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o90MX-0003zJ-0J; Wed, 06 Jul 2022 08:26:21 +0000
Received: by outflank-mailman (input) for mailman id 361955;
 Wed, 06 Jul 2022 08:26:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYPZ=XL=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1o90MV-0003zD-IM
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 08:26:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 4eb6bb86-fd05-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 10:26:18 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D900B1596;
 Wed,  6 Jul 2022 01:26:17 -0700 (PDT)
Received: from a015971.shanghai.arm.com (unknown [10.169.188.104])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2D9923F792;
 Wed,  6 Jul 2022 01:26:14 -0700 (PDT)
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
X-Inumbo-ID: 4eb6bb86-fd05-11ec-bd2d-47488cf2e6aa
From: Jiamei Xie <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Jiamei Xie <jiamei.xie@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v4] xen/arm: avoid overflow when setting vtimer in context switch
Date: Wed,  6 Jul 2022 16:25:58 +0800
Message-Id: <20220706082558.1116811-1-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virt_vtimer_save() will calculate the next deadline when the vCPU is
scheduled out. At the moment, Xen will use the following equation:

  virt_timer.cval + virt_time_base.offset - boot_count

The three values are 64-bit and one (cval) is controlled by domain. In
theory, it would be possible that the domain has started a long time
after the system boot. So virt_time_base.offset - boot_count may be a
large numbers.

This means a domain may inadvertently set a cval so the result would
overflow. Consequently, the deadline would be set very far in the
future. This could result to loss of timer interrupts or the vCPU
getting block "forever".

One way to solve the problem, would be to separately
   1) compute when the domain was created in ns
   2) convert cval to ns
   3) Add 1 and 2 together

The first part of the equation never change (the value is set/known at
domain creation). So take the opportunity to store it in domain structure.

Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
---
was "xen/arm: avoid vtimer flip-flop transition in context switch".
v4 changes:
- re-write commit message
---
v3 changes:
- re-write commit message
- store nanoseconds in virt_timer_base instead of adding a new structure
- assign to nanoseconds first, then seconds
---
 xen/arch/arm/include/asm/domain.h | 1 +
 xen/arch/arm/vtimer.c             | 9 ++++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index ed63c2b6f9..cd9ce19b4b 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -71,6 +71,7 @@ struct arch_domain
 
     struct {
         uint64_t offset;
+        s_time_t nanoseconds;
     } virt_timer_base;
 
     struct vgic_dist vgic;
diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
index 6b78fea77d..aeaea78e4c 100644
--- a/xen/arch/arm/vtimer.c
+++ b/xen/arch/arm/vtimer.c
@@ -63,7 +63,9 @@ static void virt_timer_expired(void *data)
 int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config)
 {
     d->arch.virt_timer_base.offset = get_cycles();
-    d->time_offset.seconds = ticks_to_ns(d->arch.virt_timer_base.offset - boot_count);
+    d->arch.virt_timer_base.nanoseconds =
+        ticks_to_ns(d->arch.virt_timer_base.offset - boot_count);
+    d->time_offset.seconds = d->arch.virt_timer_base.nanoseconds;
     do_div(d->time_offset.seconds, 1000000000);
 
     config->clock_frequency = timer_dt_clock_frequency;
@@ -144,8 +146,9 @@ void virt_timer_save(struct vcpu *v)
     if ( (v->arch.virt_timer.ctl & CNTx_CTL_ENABLE) &&
          !(v->arch.virt_timer.ctl & CNTx_CTL_MASK))
     {
-        set_timer(&v->arch.virt_timer.timer, ticks_to_ns(v->arch.virt_timer.cval +
-                  v->domain->arch.virt_timer_base.offset - boot_count));
+        set_timer(&v->arch.virt_timer.timer,
+                  v->domain->arch.virt_timer_base.nanoseconds +
+                  ticks_to_ns(v->arch.virt_timer.cval));
     }
 }
 
-- 
2.25.1


