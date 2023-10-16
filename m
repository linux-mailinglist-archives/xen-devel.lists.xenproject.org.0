Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBC97C9F7E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 08:29:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617231.959687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsH6A-0007KI-FG; Mon, 16 Oct 2023 06:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617231.959687; Mon, 16 Oct 2023 06:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsH6A-0007HY-Bd; Mon, 16 Oct 2023 06:29:06 +0000
Received: by outflank-mailman (input) for mailman id 617231;
 Mon, 16 Oct 2023 06:29:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4t3W=F6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qsH68-0005jO-DV
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 06:29:04 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cefc80b-6bed-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 08:29:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 868CC218B5;
 Mon, 16 Oct 2023 06:29:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5E04F138EF;
 Mon, 16 Oct 2023 06:29:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wMHDFS/YLGWsQQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 16 Oct 2023 06:29:03 +0000
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
X-Inumbo-ID: 4cefc80b-6bed-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697437743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EWxH6yY84p2rrj1E4gaItaAI46eHq+VAxQuigKOuHGo=;
	b=smLwHIHrpwYN5Ii4lwvKUk9sXb8cvuf5BlEueI3/bZyX1v4SepjiBMC1gazlnz6Ew6mIok
	BzxcYQje8gm1frKAVuVhZx6OQQIXko8LI3Uy+u/gN7pQzWtaDUC9aUZSdrsyhbhQLMs/5j
	IuxyQQMHXLyCzldgzs2bQ50eIjucq2w=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 5/7] xen/events: drop xen_allocate_irqs_dynamic()
Date: Mon, 16 Oct 2023 08:28:29 +0200
Message-Id: <20231016062831.20630-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231016062831.20630-1-jgross@suse.com>
References: <20231016062831.20630-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
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

Instead of having a common function for allocating a single IRQ or a
consecutive number of IRQs, split up the functionality into the callers
of xen_allocate_irqs_dynamic().

This allows to handle any allocation error in xen_irq_init() gracefully
instead of panicing the system. Let xen_irq_init() return the irq_info
pointer or NULL in case of an allocation error.

Additionally set the IRQ into irq_info already at allocation time, as
otherwise the IRQ would be '0' (which is a valid IRQ number) until
being set.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/events/events_base.c | 74 +++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 30 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 4ada3b6a4164..58e5549ee1db 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -302,6 +302,13 @@ static void channels_on_cpu_inc(struct irq_info *info)
 	info->is_accounted = 1;
 }
 
+static void xen_irq_free_desc(unsigned int irq)
+{
+	/* Legacy IRQ descriptors are managed by the arch. */
+	if (irq >= nr_legacy_irqs())
+		irq_free_desc(irq);
+}
+
 static void delayed_free_irq(struct work_struct *work)
 {
 	struct irq_info *info = container_of(to_rcu_work(work), struct irq_info,
@@ -313,9 +320,7 @@ static void delayed_free_irq(struct work_struct *work)
 
 	kfree(info);
 
-	/* Legacy IRQ descriptors are managed by the arch. */
-	if (irq >= nr_legacy_irqs())
-		irq_free_desc(irq);
+	xen_irq_free_desc(irq);
 }
 
 /* Constructors for packed IRQ information. */
@@ -330,7 +335,6 @@ static int xen_irq_info_common_setup(struct irq_info *info,
 	BUG_ON(info->type != IRQT_UNBOUND && info->type != type);
 
 	info->type = type;
-	info->irq = irq;
 	info->evtchn = evtchn;
 	info->cpu = cpu;
 	info->mask_reason = EVT_MASK_REASON_EXPLICIT;
@@ -730,47 +734,45 @@ void xen_irq_lateeoi(unsigned int irq, unsigned int eoi_flags)
 }
 EXPORT_SYMBOL_GPL(xen_irq_lateeoi);
 
-static void xen_irq_init(unsigned irq)
+static struct irq_info *xen_irq_init(unsigned int irq)
 {
 	struct irq_info *info;
 
 	info = kzalloc(sizeof(*info), GFP_KERNEL);
-	if (info == NULL)
-		panic("Unable to allocate metadata for IRQ%d\n", irq);
+	if (info) {
+		info->irq = irq;
+		info->type = IRQT_UNBOUND;
+		info->refcnt = -1;
+		INIT_RCU_WORK(&info->rwork, delayed_free_irq);
 
-	info->type = IRQT_UNBOUND;
-	info->refcnt = -1;
-	INIT_RCU_WORK(&info->rwork, delayed_free_irq);
+		set_info_for_irq(irq, info);
+		/*
+		 * Interrupt affinity setting can be immediate. No point
+		 * in delaying it until an interrupt is handled.
+		 */
+		irq_set_status_flags(irq, IRQ_MOVE_PCNTXT);
 
-	set_info_for_irq(irq, info);
-	/*
-	 * Interrupt affinity setting can be immediate. No point
-	 * in delaying it until an interrupt is handled.
-	 */
-	irq_set_status_flags(irq, IRQ_MOVE_PCNTXT);
+		INIT_LIST_HEAD(&info->eoi_list);
+		list_add_tail(&info->list, &xen_irq_list_head);
+	}
 
-	INIT_LIST_HEAD(&info->eoi_list);
-	list_add_tail(&info->list, &xen_irq_list_head);
+	return info;
 }
 
-static int __must_check xen_allocate_irqs_dynamic(int nvec)
+static inline int __must_check xen_allocate_irq_dynamic(void)
 {
-	int i, irq = irq_alloc_descs(-1, 0, nvec, -1);
+	int irq = irq_alloc_desc_from(0, -1);
 
 	if (irq >= 0) {
-		for (i = 0; i < nvec; i++)
-			xen_irq_init(irq + i);
+		if (!xen_irq_init(irq)) {
+			xen_irq_free_desc(irq);
+			irq = -1;
+		}
 	}
 
 	return irq;
 }
 
-static inline int __must_check xen_allocate_irq_dynamic(void)
-{
-
-	return xen_allocate_irqs_dynamic(1);
-}
-
 static int __must_check xen_allocate_irq_gsi(unsigned gsi)
 {
 	int irq;
@@ -790,7 +792,10 @@ static int __must_check xen_allocate_irq_gsi(unsigned gsi)
 	else
 		irq = irq_alloc_desc_at(gsi, -1);
 
-	xen_irq_init(irq);
+	if (!xen_irq_init(irq)) {
+		xen_irq_free_desc(irq);
+		irq = -1;
+	}
 
 	return irq;
 }
@@ -960,6 +965,11 @@ static void __unbind_from_irq(unsigned int irq)
 	evtchn_port_t evtchn = evtchn_from_irq(irq);
 	struct irq_info *info = info_for_irq(irq);
 
+	if (!info) {
+		xen_irq_free_desc(irq);
+		return;
+	}
+
 	if (info->refcnt > 0) {
 		info->refcnt--;
 		if (info->refcnt != 0)
@@ -1097,11 +1107,14 @@ int xen_bind_pirq_msi_to_irq(struct pci_dev *dev, struct msi_desc *msidesc,
 
 	mutex_lock(&irq_mapping_update_lock);
 
-	irq = xen_allocate_irqs_dynamic(nvec);
+	irq = irq_alloc_descs(-1, 0, nvec, -1);
 	if (irq < 0)
 		goto out;
 
 	for (i = 0; i < nvec; i++) {
+		if (!xen_irq_init(irq + i))
+			goto error_irq;
+
 		irq_set_chip_and_handler_name(irq + i, &xen_pirq_chip, handle_edge_irq, name);
 
 		ret = xen_irq_info_pirq_setup(irq + i, 0, pirq + i, 0, domid,
@@ -1725,6 +1738,7 @@ void rebind_evtchn_irq(evtchn_port_t evtchn, int irq)
 	   so there should be a proper type */
 	BUG_ON(info->type == IRQT_UNBOUND);
 
+	info->irq = irq;
 	(void)xen_irq_info_evtchn_setup(irq, evtchn, NULL);
 
 	mutex_unlock(&irq_mapping_update_lock);
-- 
2.35.3


