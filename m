Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EF146988C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:19:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239070.414388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEq6-00081c-L8; Mon, 06 Dec 2021 14:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239070.414388; Mon, 06 Dec 2021 14:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEq6-0007zp-He; Mon, 06 Dec 2021 14:19:34 +0000
Received: by outflank-mailman (input) for mailman id 239070;
 Mon, 06 Dec 2021 14:19:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w5uy=QX=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1muEq5-0007zW-F6
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:19:33 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 8741af70-569f-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 15:19:31 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D8C41FB;
 Mon,  6 Dec 2021 06:19:30 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.4.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E9A23F5A1;
 Mon,  6 Dec 2021 06:19:28 -0800 (PST)
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
X-Inumbo-ID: 8741af70-569f-11ec-8a4d-196798b21f7b
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] xen/arm: Do not include in the image functions...
Date: Mon,  6 Dec 2021 15:19:23 +0100
Message-Id: <20211206141923.26757-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vtimer_update_irqs, vtimer_update_irq and vcpu_update_evtchn_irq if
CONFIG_NEW_VGIC is not set.

enter_hypervisor_from_guest is protecting calls to these functions
with CONFIG_NEW_VGIC but their definitions and declarations are not
protected. This means that we are including them in the image even
though we are not making use of them. Fix that.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/domain.c        | 2 ++
 xen/arch/arm/vtimer.c        | 2 ++
 xen/include/asm-arm/event.h  | 2 ++
 xen/include/asm-arm/vtimer.h | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 96e1b23550..7baa2b7417 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1108,12 +1108,14 @@ void vcpu_mark_events_pending(struct vcpu *v)
     vgic_inject_irq(v->domain, v, v->domain->arch.evtchn_irq, true);
 }
 
+#ifdef CONFIG_NEW_VGIC
 void vcpu_update_evtchn_irq(struct vcpu *v)
 {
     bool pending = vcpu_info(v, evtchn_upcall_pending);
 
     vgic_inject_irq(v->domain, v, v->domain->arch.evtchn_irq, pending);
 }
+#endif
 
 /* The ARM spec declares that even if local irqs are masked in
  * the CPSR register, an irq should wake up a cpu from WFI anyway.
diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
index 0196951af4..63a8374f7d 100644
--- a/xen/arch/arm/vtimer.c
+++ b/xen/arch/arm/vtimer.c
@@ -347,6 +347,7 @@ bool vtimer_emulate(struct cpu_user_regs *regs, union hsr hsr)
     }
 }
 
+#ifdef CONFIG_NEW_VGIC
 static void vtimer_update_irq(struct vcpu *v, struct vtimer *vtimer,
                               register_t vtimer_ctl)
 {
@@ -395,6 +396,7 @@ void vtimer_update_irqs(struct vcpu *v)
     /* For the physical timer we rely on our emulated state. */
     vtimer_update_irq(v, &v->arch.phys_timer, v->arch.phys_timer.ctl);
 }
+#endif /* CONFIG_NEW_VGIC */
 
 /*
  * Local variables:
diff --git a/xen/include/asm-arm/event.h b/xen/include/asm-arm/event.h
index b14c166ad6..f4193cb62e 100644
--- a/xen/include/asm-arm/event.h
+++ b/xen/include/asm-arm/event.h
@@ -5,7 +5,9 @@
 
 void vcpu_kick(struct vcpu *v);
 void vcpu_mark_events_pending(struct vcpu *v);
+#ifdef CONFIG_NEW_VGIC
 void vcpu_update_evtchn_irq(struct vcpu *v);
+#endif
 void vcpu_block_unless_event_pending(struct vcpu *v);
 
 static inline int vcpu_event_delivery_is_enabled(struct vcpu *v)
diff --git a/xen/include/asm-arm/vtimer.h b/xen/include/asm-arm/vtimer.h
index 9d4fb4c6e8..1e945ae2c5 100644
--- a/xen/include/asm-arm/vtimer.h
+++ b/xen/include/asm-arm/vtimer.h
@@ -27,7 +27,9 @@ extern bool vtimer_emulate(struct cpu_user_regs *regs, union hsr hsr);
 extern void virt_timer_save(struct vcpu *v);
 extern void virt_timer_restore(struct vcpu *v);
 extern void vcpu_timer_destroy(struct vcpu *v);
+#ifdef CONFIG_NEW_VGIC
 void vtimer_update_irqs(struct vcpu *v);
+#endif
 
 #endif
 
-- 
2.29.0


