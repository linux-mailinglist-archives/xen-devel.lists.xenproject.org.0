Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A1555B57A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 04:59:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356187.584259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5exq-0005Ge-Eq; Mon, 27 Jun 2022 02:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356187.584259; Mon, 27 Jun 2022 02:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5exq-0005Eb-B1; Mon, 27 Jun 2022 02:59:02 +0000
Received: by outflank-mailman (input) for mailman id 356187;
 Mon, 27 Jun 2022 02:59:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RfAm=XC=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1o5exp-0005ET-BT
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 02:59:01 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 17468c28-f5c5-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 04:58:59 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2DE223A;
 Sun, 26 Jun 2022 19:58:58 -0700 (PDT)
Received: from a015971.shanghai.arm.com (unknown [10.169.188.104])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 324853F66F;
 Sun, 26 Jun 2022 19:58:55 -0700 (PDT)
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
X-Inumbo-ID: 17468c28-f5c5-11ec-b725-ed86ccbb4733
From: Jiamei Xie <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Jiamei Xie <jiamei.xie@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH] xen/arm: avoid extra caclulations when setting vtimer in context switch
Date: Mon, 27 Jun 2022 10:58:09 +0800
Message-Id: <20220627025809.1985720-1-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virt_vtimer_save is calculating the new time for the vtimer in:
"v->arch.virt_timer.cval + v->domain->arch.virt_timer_base.offset
- boot_count".
In this formula, "cval + offset" might cause uint64_t overflow.
Changing it to "v->domain->arch.virt_timer_base.offset - boot_count +
v->arch.virt_timer.cval" can reduce the possibility of overflow, and
"arch.virt_timer_base.offset - boot_count" will be always the same,
which has been caculated in domain_vtimer_init. Introduce a new field
vtimer_offset.nanoseconds to store this value for arm in struct
arch_domain, so we can use it directly and extra caclulations can be
avoided.

This patch is enlightened from [1].

Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>

[1] https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg123139.htm
---
xen/arch/arm/include/asm/domain.h | 4 ++++
 xen/arch/arm/vtimer.c             | 6 ++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index ed63c2b6f9..94fe5b6444 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -73,6 +73,10 @@ struct arch_domain
         uint64_t offset;
     } virt_timer_base;
 
+    struct {
+        int64_t nanoseconds;
+    } vtimer_offset;
+
     struct vgic_dist vgic;
 
     struct vuart {
diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
index 6b78fea77d..54161e5fea 100644
--- a/xen/arch/arm/vtimer.c
+++ b/xen/arch/arm/vtimer.c
@@ -64,6 +64,7 @@ int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config)
 {
     d->arch.virt_timer_base.offset = get_cycles();
     d->time_offset.seconds = ticks_to_ns(d->arch.virt_timer_base.offset - boot_count);
+    d->arch.vtimer_offset.nanoseconds = d->time_offset.seconds;
     do_div(d->time_offset.seconds, 1000000000);
 
     config->clock_frequency = timer_dt_clock_frequency;
@@ -144,8 +145,9 @@ void virt_timer_save(struct vcpu *v)
     if ( (v->arch.virt_timer.ctl & CNTx_CTL_ENABLE) &&
          !(v->arch.virt_timer.ctl & CNTx_CTL_MASK))
     {
-        set_timer(&v->arch.virt_timer.timer, ticks_to_ns(v->arch.virt_timer.cval +
-                  v->domain->arch.virt_timer_base.offset - boot_count));
+        set_timer(&v->arch.virt_timer.timer,
+                  v->domain->arch.vtimer_offset.nanoseconds +
+                  ticks_to_ns(v->arch.virt_timer.cval));
     }
 }
 
-- 
2.25.1


