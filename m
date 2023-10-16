Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 578BF7C9F7D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 08:29:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617229.959678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsH64-0006nO-3a; Mon, 16 Oct 2023 06:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617229.959678; Mon, 16 Oct 2023 06:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsH63-0006k1-VI; Mon, 16 Oct 2023 06:28:59 +0000
Received: by outflank-mailman (input) for mailman id 617229;
 Mon, 16 Oct 2023 06:28:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4t3W=F6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qsH62-0005jO-V3
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 06:28:58 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49aa5903-6bed-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 08:28:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 015CF1FEA9;
 Mon, 16 Oct 2023 06:28:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C969A138EF;
 Mon, 16 Oct 2023 06:28:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SRfKLynYLGWZQQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 16 Oct 2023 06:28:57 +0000
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
X-Inumbo-ID: 49aa5903-6bed-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697437738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2fcuH+2ssIH6gHbiDgF8ajbt1+87kl2RXhpbm0CBdnw=;
	b=rbWoTjG3XieTmAXLYCgLjEdVydcBnR3jeB5LFub+XCLZRQrKyTZqfrLjyUk93gZ7oKnFFL
	N9qLd4yprTK7AlO1/DI7Z1wucWK+Ga3EJEDdaPB+854oRGNt9gV2SuglhVtsjZMcT8QhWV
	hflLQoeYQYrnOVFzF4ihI0509q/BqtY=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 4/7] xen/events: remove some simple helpers from events_base.c
Date: Mon, 16 Oct 2023 08:28:28 +0200
Message-Id: <20231016062831.20630-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231016062831.20630-1-jgross@suse.com>
References: <20231016062831.20630-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.10
X-Spamd-Result: default: False [-6.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

The helper functions type_from_irq() and cpu_from_irq() are just one
line functions used only internally.

Open code them where needed. At the same time modify and rename
get_evtchn_to_irq() to return a struct irq_info instead of the IRQ
number.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/events/events_base.c | 97 +++++++++++++-------------------
 1 file changed, 38 insertions(+), 59 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 97d71c5e7c28..4ada3b6a4164 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -246,15 +246,6 @@ static int set_evtchn_to_irq(evtchn_port_t evtchn, unsigned int irq)
 	return 0;
 }
 
-static int get_evtchn_to_irq(evtchn_port_t evtchn)
-{
-	if (evtchn >= xen_evtchn_max_channels())
-		return -1;
-	if (evtchn_to_irq[EVTCHN_ROW(evtchn)] == NULL)
-		return -1;
-	return READ_ONCE(evtchn_to_irq[EVTCHN_ROW(evtchn)][EVTCHN_COL(evtchn)]);
-}
-
 /* Get info for IRQ */
 static struct irq_info *info_for_irq(unsigned irq)
 {
@@ -272,6 +263,19 @@ static void set_info_for_irq(unsigned int irq, struct irq_info *info)
 		irq_set_chip_data(irq, info);
 }
 
+static struct irq_info *evtchn_to_info(evtchn_port_t evtchn)
+{
+	int irq;
+
+	if (evtchn >= xen_evtchn_max_channels())
+		return NULL;
+	if (evtchn_to_irq[EVTCHN_ROW(evtchn)] == NULL)
+		return NULL;
+	irq = READ_ONCE(evtchn_to_irq[EVTCHN_ROW(evtchn)][EVTCHN_COL(evtchn)]);
+
+	return (irq < 0) ? NULL : info_for_irq(irq);
+}
+
 /* Per CPU channel accounting */
 static void channels_on_cpu_dec(struct irq_info *info)
 {
@@ -426,7 +430,9 @@ static evtchn_port_t evtchn_from_irq(unsigned int irq)
 
 unsigned int irq_from_evtchn(evtchn_port_t evtchn)
 {
-	return get_evtchn_to_irq(evtchn);
+	struct irq_info *info = evtchn_to_info(evtchn);
+
+	return info ? info->irq : -1;
 }
 EXPORT_SYMBOL_GPL(irq_from_evtchn);
 
@@ -470,25 +476,11 @@ static unsigned pirq_from_irq(unsigned irq)
 	return info->u.pirq.pirq;
 }
 
-static enum xen_irq_type type_from_irq(unsigned irq)
-{
-	return info_for_irq(irq)->type;
-}
-
-static unsigned cpu_from_irq(unsigned irq)
-{
-	return info_for_irq(irq)->cpu;
-}
-
 unsigned int cpu_from_evtchn(evtchn_port_t evtchn)
 {
-	int irq = get_evtchn_to_irq(evtchn);
-	unsigned ret = 0;
-
-	if (irq != -1)
-		ret = cpu_from_irq(irq);
+	struct irq_info *info = evtchn_to_info(evtchn);
 
-	return ret;
+	return info ? info->cpu : 0;
 }
 
 static void do_mask(struct irq_info *info, u8 reason)
@@ -537,13 +529,12 @@ static bool pirq_needs_eoi_flag(unsigned irq)
 static void bind_evtchn_to_cpu(evtchn_port_t evtchn, unsigned int cpu,
 			       bool force_affinity)
 {
-	int irq = get_evtchn_to_irq(evtchn);
-	struct irq_info *info = info_for_irq(irq);
+	struct irq_info *info = evtchn_to_info(evtchn);
 
-	BUG_ON(irq == -1);
+	BUG_ON(info == NULL);
 
 	if (IS_ENABLED(CONFIG_SMP) && force_affinity) {
-		struct irq_data *data = irq_get_irq_data(irq);
+		struct irq_data *data = irq_get_irq_data(info->irq);
 
 		irq_data_update_affinity(data, cpumask_of(cpu));
 		irq_data_update_effective_affinity(data, cpumask_of(cpu));
@@ -976,13 +967,13 @@ static void __unbind_from_irq(unsigned int irq)
 	}
 
 	if (VALID_EVTCHN(evtchn)) {
-		unsigned int cpu = cpu_from_irq(irq);
+		unsigned int cpu = info->cpu;
 		struct xenbus_device *dev;
 
 		if (!info->is_static)
 			xen_evtchn_close(evtchn);
 
-		switch (type_from_irq(irq)) {
+		switch (info->type) {
 		case IRQT_VIRQ:
 			per_cpu(virq_to_irq, cpu)[virq_from_irq(irq)] = -1;
 			break;
@@ -1181,15 +1172,16 @@ static int bind_evtchn_to_irq_chip(evtchn_port_t evtchn, struct irq_chip *chip,
 {
 	int irq;
 	int ret;
+	struct irq_info *info;
 
 	if (evtchn >= xen_evtchn_max_channels())
 		return -ENOMEM;
 
 	mutex_lock(&irq_mapping_update_lock);
 
-	irq = get_evtchn_to_irq(evtchn);
+	info = evtchn_to_info(evtchn);
 
-	if (irq == -1) {
+	if (!info) {
 		irq = xen_allocate_irq_dynamic();
 		if (irq < 0)
 			goto out;
@@ -1212,8 +1204,8 @@ static int bind_evtchn_to_irq_chip(evtchn_port_t evtchn, struct irq_chip *chip,
 		 */
 		bind_evtchn_to_cpu(evtchn, 0, false);
 	} else {
-		struct irq_info *info = info_for_irq(irq);
-		WARN_ON(info == NULL || info->type != IRQT_EVTCHN);
+		WARN_ON(info->type != IRQT_EVTCHN);
+		irq = info->irq;
 	}
 
 out:
@@ -1551,13 +1543,7 @@ EXPORT_SYMBOL_GPL(xen_set_irq_priority);
 
 int evtchn_make_refcounted(evtchn_port_t evtchn, bool is_static)
 {
-	int irq = get_evtchn_to_irq(evtchn);
-	struct irq_info *info;
-
-	if (irq == -1)
-		return -ENOENT;
-
-	info = info_for_irq(irq);
+	struct irq_info *info = evtchn_to_info(evtchn);
 
 	if (!info)
 		return -ENOENT;
@@ -1573,7 +1559,6 @@ EXPORT_SYMBOL_GPL(evtchn_make_refcounted);
 
 int evtchn_get(evtchn_port_t evtchn)
 {
-	int irq;
 	struct irq_info *info;
 	int err = -ENOENT;
 
@@ -1582,11 +1567,7 @@ int evtchn_get(evtchn_port_t evtchn)
 
 	mutex_lock(&irq_mapping_update_lock);
 
-	irq = get_evtchn_to_irq(evtchn);
-	if (irq == -1)
-		goto done;
-
-	info = info_for_irq(irq);
+	info = evtchn_to_info(evtchn);
 
 	if (!info)
 		goto done;
@@ -1606,10 +1587,11 @@ EXPORT_SYMBOL_GPL(evtchn_get);
 
 void evtchn_put(evtchn_port_t evtchn)
 {
-	int irq = get_evtchn_to_irq(evtchn);
-	if (WARN_ON(irq == -1))
+	struct irq_info *info = evtchn_to_info(evtchn);
+
+	if (WARN_ON(!info))
 		return;
-	unbind_from_irq(irq);
+	unbind_from_irq(info->irq);
 }
 EXPORT_SYMBOL_GPL(evtchn_put);
 
@@ -1639,12 +1621,10 @@ struct evtchn_loop_ctrl {
 
 void handle_irq_for_port(evtchn_port_t port, struct evtchn_loop_ctrl *ctrl)
 {
-	int irq;
-	struct irq_info *info;
+	struct irq_info *info = evtchn_to_info(port);
 	struct xenbus_device *dev;
 
-	irq = get_evtchn_to_irq(port);
-	if (irq == -1)
+	if (!info)
 		return;
 
 	/*
@@ -1669,7 +1649,6 @@ void handle_irq_for_port(evtchn_port_t port, struct evtchn_loop_ctrl *ctrl)
 		}
 	}
 
-	info = info_for_irq(irq);
 	if (xchg_acquire(&info->is_active, 1))
 		return;
 
@@ -1683,7 +1662,7 @@ void handle_irq_for_port(evtchn_port_t port, struct evtchn_loop_ctrl *ctrl)
 		info->eoi_time = get_jiffies_64() + event_eoi_delay;
 	}
 
-	generic_handle_irq(irq);
+	generic_handle_irq(info->irq);
 }
 
 int xen_evtchn_do_upcall(void)
@@ -1741,7 +1720,7 @@ void rebind_evtchn_irq(evtchn_port_t evtchn, int irq)
 	mutex_lock(&irq_mapping_update_lock);
 
 	/* After resume the irq<->evtchn mappings are all cleared out */
-	BUG_ON(get_evtchn_to_irq(evtchn) != -1);
+	BUG_ON(evtchn_to_info(evtchn));
 	/* Expect irq to have been bound before,
 	   so there should be a proper type */
 	BUG_ON(info->type == IRQT_UNBOUND);
-- 
2.35.3


