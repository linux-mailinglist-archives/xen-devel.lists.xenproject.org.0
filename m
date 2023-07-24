Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB70875FE81
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 19:53:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569203.889529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNzjU-0002Hp-Pa; Mon, 24 Jul 2023 17:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569203.889529; Mon, 24 Jul 2023 17:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNzjU-0002Fc-Mo; Mon, 24 Jul 2023 17:52:32 +0000
Received: by outflank-mailman (input) for mailman id 569203;
 Mon, 24 Jul 2023 17:52:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ixEc=DK=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qNzjT-0001ku-Fs
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 17:52:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc65252d-2a4a-11ee-b23c-6b7b168915f2;
 Mon, 24 Jul 2023 19:52:31 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.223.75])
 by support.bugseng.com (Postfix) with ESMTPSA id 034474EE0C88;
 Mon, 24 Jul 2023 19:52:29 +0200 (CEST)
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
X-Inumbo-ID: dc65252d-2a4a-11ee-b23c-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH 2/3] xen/arm: irq: address violations of MISRA C: 2012 Rules 8.2 and 8.3
Date: Mon, 24 Jul 2023 19:50:28 +0200
Message-Id: <a62e88a9c29cf7866c251968b5a5b6865aff4a2a.1690217195.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690217195.git.federico.serafini@bugseng.com>
References: <cover.1690217195.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Give a name to unnamed parameters thus addressing violations of
MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
named parameters").
Keep consistency between parameter names and types used in function
declarations and the ones used in the corresponding function
definitions, thus addressing violations of MISRA C:2012 Rule 8.3
("All declarations of an object or function shall use the same names
and type qualifiers").

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/irq.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 16e56f8945..335e06a2a7 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -58,7 +58,7 @@ hw_irq_controller no_irq_type = {
 static irq_desc_t irq_desc[NR_IRQS];
 static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
 
-irq_desc_t *__irq_to_desc(int irq)
+struct irq_desc *__irq_to_desc(int irq)
 {
     if ( irq < NR_LOCAL_IRQS )
         return &this_cpu(local_irq_desc)[irq];
@@ -182,7 +182,8 @@ void irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_mask)
 }
 
 int request_irq(unsigned int irq, unsigned int irqflags,
-                void (*handler)(int, void *, struct cpu_user_regs *),
+                void (*handler)(int irq, void *dev_id,
+                                struct cpu_user_regs *regs),
                 const char *devname, void *dev_id)
 {
     struct irqaction *action;
@@ -617,7 +618,7 @@ void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
     BUG();
 }
 
-void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
+void pirq_set_affinity(struct domain *d, int irq, const cpumask_t *mask)
 {
     BUG();
 }
-- 
2.34.1


