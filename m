Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E497560ED8
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 03:56:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358121.587139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6jP1-0001LX-BU; Thu, 30 Jun 2022 01:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358121.587139; Thu, 30 Jun 2022 01:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6jP1-0001Jn-8T; Thu, 30 Jun 2022 01:55:31 +0000
Received: by outflank-mailman (input) for mailman id 358121;
 Thu, 30 Jun 2022 01:55:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IfmQ=XF=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1o6jOz-0001Jh-ME
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 01:55:29 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id b67370fe-f817-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 03:55:27 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D89261480;
 Wed, 29 Jun 2022 18:55:26 -0700 (PDT)
Received: from a015971.shanghai.arm.com (unknown [10.169.188.104])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3DCE73F5A1;
 Wed, 29 Jun 2022 18:55:23 -0700 (PDT)
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
X-Inumbo-ID: b67370fe-f817-11ec-bdce-3d151da133c5
From: Jiamei Xie <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Jiamei Xie <jiamei.xie@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3] xen/arm: avoid overflow when setting vtimer in context switch
Date: Thu, 30 Jun 2022 09:53:37 +0800
Message-Id: <20220630015336.3040355-1-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virt_vtimer_save is calculating the new time for the vtimer in:
"v->arch.virt_timer.cval + v->domain->arch.virt_timer_base.offset
- boot_count".
In this formula, "cval + offset" might cause uint64_t overflow.
Changing it to "ticks_to_ns(v->domain->arch.virt_timer_base.offset -
boot_count) + ticks_to_ns(v->arch.virt_timer.cval)" can avoid overflow,
and "ticks_to_ns(arch.virt_timer_base.offset - boot_count)" will be
always the same, which has been caculated in domain_vtimer_init.
Introduce a new field virt_timer_base.nanoseconds to store this value
for arm in struct arch_domain, so we can use it directly.

Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
Change-Id: Ib80cee51eaf844661e6f92154a0339ad2a652f9b
---
was "xen/arm: avoid vtimer flip-flop transition in context switch".
v3 changes:
-re-write commit message
-store nanoseconds in virt_timer_base instead of adding a new structure
-assign to nanoseconds first, then seconds
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


