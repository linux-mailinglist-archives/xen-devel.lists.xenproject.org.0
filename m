Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC55311CB0
	for <lists+xen-devel@lfdr.de>; Sat,  6 Feb 2021 11:50:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82121.151785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8LA3-0005Y6-BQ; Sat, 06 Feb 2021 10:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82121.151785; Sat, 06 Feb 2021 10:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8LA3-0005Xa-54; Sat, 06 Feb 2021 10:49:55 +0000
Received: by outflank-mailman (input) for mailman id 82121;
 Sat, 06 Feb 2021 10:49:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l8LA1-0005Wo-Gc
 for xen-devel@lists.xenproject.org; Sat, 06 Feb 2021 10:49:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdf918e8-a7cd-4417-a934-24d4bee992af;
 Sat, 06 Feb 2021 10:49:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E5AFAAD2B;
 Sat,  6 Feb 2021 10:49:46 +0000 (UTC)
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
X-Inumbo-ID: bdf918e8-a7cd-4417-a934-24d4bee992af
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612608587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GH77gMFeluI4ISQQCL5mL3HOsRIyaZbyOEdSH8AsWt0=;
	b=IFFMq9YDbxtkEPiO6C/5LtLAtDHYvxM651iS1+qH4tvdDWCxIzsRg6ikvZ/7+U0tEsFI1x
	ri0x4lc7ZzQrLo2ZMEyqZPK8rluRKsUjTIfUFmT+v41H7Vdw1SFIxyZnTE+MZ2UQIsn8hn
	Yc3SHb9TRQIBgPoj/vnPwBgJcmpAZU4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	stable@vger.kernel.org,
	Julien Grall <julien@xen.org>
Subject: [PATCH 2/7] xen/events: don't unmask an event channel when an eoi is pending
Date: Sat,  6 Feb 2021 11:49:27 +0100
Message-Id: <20210206104932.29064-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210206104932.29064-1-jgross@suse.com>
References: <20210206104932.29064-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An event channel should be kept masked when an eoi is pending for it.
When being migrated to another cpu it might be unmasked, though.

In order to avoid this keep two different flags for each event channel
to be able to distinguish "normal" masking/unmasking from eoi related
masking/unmasking. The event channel should only be able to generate
an interrupt if both flags are cleared.

Cc: stable@vger.kernel.org
Fixes: 54c9de89895e0a36047 ("xen/events: add a new late EOI evtchn framework")
Reported-by: Julien Grall <julien@xen.org>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/events/events_base.c | 63 +++++++++++++++++++++++++++-----
 1 file changed, 53 insertions(+), 10 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index e850f79351cb..6a836d131e73 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -97,7 +97,9 @@ struct irq_info {
 	short refcnt;
 	u8 spurious_cnt;
 	u8 is_accounted;
-	enum xen_irq_type type; /* type */
+	short type;		/* type: IRQT_* */
+	bool masked;		/* Is event explicitly masked? */
+	bool eoi_pending;	/* Is EOI pending? */
 	unsigned irq;
 	evtchn_port_t evtchn;   /* event channel */
 	unsigned short cpu;     /* cpu bound */
@@ -302,6 +304,8 @@ static int xen_irq_info_common_setup(struct irq_info *info,
 	info->irq = irq;
 	info->evtchn = evtchn;
 	info->cpu = cpu;
+	info->masked = true;
+	info->eoi_pending = false;
 
 	ret = set_evtchn_to_irq(evtchn, irq);
 	if (ret < 0)
@@ -585,7 +589,10 @@ static void xen_irq_lateeoi_locked(struct irq_info *info, bool spurious)
 	}
 
 	info->eoi_time = 0;
-	unmask_evtchn(evtchn);
+	info->eoi_pending = false;
+
+	if (!info->masked)
+		unmask_evtchn(evtchn);
 }
 
 static void xen_irq_lateeoi_worker(struct work_struct *work)
@@ -830,7 +837,11 @@ static unsigned int __startup_pirq(unsigned int irq)
 		goto err;
 
 out:
-	unmask_evtchn(evtchn);
+	info->masked = false;
+
+	if (!info->eoi_pending)
+		unmask_evtchn(evtchn);
+
 	eoi_pirq(irq_get_irq_data(irq));
 
 	return 0;
@@ -857,6 +868,7 @@ static void shutdown_pirq(struct irq_data *data)
 	if (!VALID_EVTCHN(evtchn))
 		return;
 
+	info->masked = true;
 	mask_evtchn(evtchn);
 	xen_evtchn_close(evtchn);
 	xen_irq_info_cleanup(info);
@@ -1768,18 +1780,26 @@ static int set_affinity_irq(struct irq_data *data, const struct cpumask *dest,
 
 static void enable_dynirq(struct irq_data *data)
 {
-	evtchn_port_t evtchn = evtchn_from_irq(data->irq);
+	struct irq_info *info = info_for_irq(data->irq);
+	evtchn_port_t evtchn = info ? info->evtchn : 0;
 
-	if (VALID_EVTCHN(evtchn))
-		unmask_evtchn(evtchn);
+	if (VALID_EVTCHN(evtchn)) {
+		info->masked = false;
+
+		if (!info->eoi_pending)
+			unmask_evtchn(evtchn);
+	}
 }
 
 static void disable_dynirq(struct irq_data *data)
 {
-	evtchn_port_t evtchn = evtchn_from_irq(data->irq);
+	struct irq_info *info = info_for_irq(data->irq);
+	evtchn_port_t evtchn = info ? info->evtchn : 0;
 
-	if (VALID_EVTCHN(evtchn))
+	if (VALID_EVTCHN(evtchn)) {
+		info->masked = true;
 		mask_evtchn(evtchn);
+	}
 }
 
 static void ack_dynirq(struct irq_data *data)
@@ -1798,6 +1818,29 @@ static void mask_ack_dynirq(struct irq_data *data)
 	ack_dynirq(data);
 }
 
+static void lateeoi_ack_dynirq(struct irq_data *data)
+{
+	struct irq_info *info = info_for_irq(data->irq);
+	evtchn_port_t evtchn = info ? info->evtchn : 0;
+
+	if (VALID_EVTCHN(evtchn)) {
+		info->eoi_pending = true;
+		mask_evtchn(evtchn);
+	}
+}
+
+static void lateeoi_mask_ack_dynirq(struct irq_data *data)
+{
+	struct irq_info *info = info_for_irq(data->irq);
+	evtchn_port_t evtchn = info ? info->evtchn : 0;
+
+	if (VALID_EVTCHN(evtchn)) {
+		info->masked = true;
+		info->eoi_pending = true;
+		mask_evtchn(evtchn);
+	}
+}
+
 static int retrigger_dynirq(struct irq_data *data)
 {
 	evtchn_port_t evtchn = evtchn_from_irq(data->irq);
@@ -2023,8 +2066,8 @@ static struct irq_chip xen_lateeoi_chip __read_mostly = {
 	.irq_mask		= disable_dynirq,
 	.irq_unmask		= enable_dynirq,
 
-	.irq_ack		= mask_ack_dynirq,
-	.irq_mask_ack		= mask_ack_dynirq,
+	.irq_ack		= lateeoi_ack_dynirq,
+	.irq_mask_ack		= lateeoi_mask_ack_dynirq,
 
 	.irq_set_affinity	= set_affinity_irq,
 	.irq_retrigger		= retrigger_dynirq,
-- 
2.26.2


