Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BC235513F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 12:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105793.202336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjIt-00035D-PJ; Tue, 06 Apr 2021 10:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105793.202336; Tue, 06 Apr 2021 10:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjIt-00034o-Lu; Tue, 06 Apr 2021 10:51:27 +0000
Received: by outflank-mailman (input) for mailman id 105793;
 Tue, 06 Apr 2021 10:51:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZnD=JD=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lTjIs-00034Q-PM
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 10:51:26 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id dd21e63e-4c1f-4a54-b146-49ebbd0fb2cf;
 Tue, 06 Apr 2021 10:51:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4F9531B;
 Tue,  6 Apr 2021 03:51:25 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D44A3F73D;
 Tue,  6 Apr 2021 03:51:24 -0700 (PDT)
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
X-Inumbo-ID: dd21e63e-4c1f-4a54-b146-49ebbd0fb2cf
From: Luca Fancellu <luca.fancellu@arm.com>
To: sstabellini@kernel.org,
	jgross@suse.com,
	jgrall@amazon.com
Cc: boris.ostrovsky@oracle.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	jbeulich@suse.com,
	yyankovskyi@gmail.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	bertrand.marquis@arm.com
Subject: [PATCH] xen/evtchn: Change irq_info lock to raw_spinlock_t
Date: Tue,  6 Apr 2021 11:51:04 +0100
Message-Id: <20210406105105.10141-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

Unmask operation must be called with interrupt disabled,
on preempt_rt spin_lock_irqsave/spin_unlock_irqrestore
don't disable/enable interrupts, so use raw_* implementation
and change lock variable in struct irq_info from spinlock_t
to raw_spinlock_t

Cc: stable@vger.kernel.org
Fixes: 25da4618af24 ("xen/events: don't unmask an event channel
when an eoi is pending")

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 drivers/xen/events/events_base.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 8236e2364eeb..7bbfd58958bc 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -110,7 +110,7 @@ struct irq_info {
 	unsigned short eoi_cpu; /* EOI must happen on this cpu-1 */
 	unsigned int irq_epoch; /* If eoi_cpu valid: irq_epoch of event */
 	u64 eoi_time;           /* Time in jiffies when to EOI. */
-	spinlock_t lock;
+	raw_spinlock_t lock;
 
 	union {
 		unsigned short virq;
@@ -312,7 +312,7 @@ static int xen_irq_info_common_setup(struct irq_info *info,
 	info->evtchn = evtchn;
 	info->cpu = cpu;
 	info->mask_reason = EVT_MASK_REASON_EXPLICIT;
-	spin_lock_init(&info->lock);
+	raw_spin_lock_init(&info->lock);
 
 	ret = set_evtchn_to_irq(evtchn, irq);
 	if (ret < 0)
@@ -472,28 +472,28 @@ static void do_mask(struct irq_info *info, u8 reason)
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&info->lock, flags);
+	raw_spin_lock_irqsave(&info->lock, flags);
 
 	if (!info->mask_reason)
 		mask_evtchn(info->evtchn);
 
 	info->mask_reason |= reason;
 
-	spin_unlock_irqrestore(&info->lock, flags);
+	raw_spin_unlock_irqrestore(&info->lock, flags);
 }
 
 static void do_unmask(struct irq_info *info, u8 reason)
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&info->lock, flags);
+	raw_spin_lock_irqsave(&info->lock, flags);
 
 	info->mask_reason &= ~reason;
 
 	if (!info->mask_reason)
 		unmask_evtchn(info->evtchn);
 
-	spin_unlock_irqrestore(&info->lock, flags);
+	raw_spin_unlock_irqrestore(&info->lock, flags);
 }
 
 #ifdef CONFIG_X86
-- 
2.17.1


