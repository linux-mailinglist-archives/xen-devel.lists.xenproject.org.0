Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E8B7C9F79
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 08:28:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617225.959658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsH5u-00065d-J4; Mon, 16 Oct 2023 06:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617225.959658; Mon, 16 Oct 2023 06:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsH5u-00062w-FE; Mon, 16 Oct 2023 06:28:50 +0000
Received: by outflank-mailman (input) for mailman id 617225;
 Mon, 16 Oct 2023 06:28:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4t3W=F6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qsH5s-0005UW-Ui
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 06:28:48 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4307737b-6bed-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 08:28:47 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D6A6F1FEAB;
 Mon, 16 Oct 2023 06:28:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AAE61138EF;
 Mon, 16 Oct 2023 06:28:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id guxNKB7YLGWMQQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 16 Oct 2023 06:28:46 +0000
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
X-Inumbo-ID: 4307737b-6bed-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697437726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rNX0BHA06/8Nsdx4Ml8n47rtnGq7y7Ylo5Rine36zkk=;
	b=ed1mpfG/OdNtnERvr+u0c/5UTTxcVdh9dCockRC8xxBjDyYoXSxtc546veqFCMPuApPqyY
	yQFuoDELuRLH4GV7uBNq23liBMDD8kapEMMsmP9CFILss5qIpbHjsVEokdBaq9Nn/lrxRi
	f1Q7JXSosDLutEXExiXohxy2p2r/7Tk=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 2/7] xen/events: remove unused functions
Date: Mon, 16 Oct 2023 08:28:26 +0200
Message-Id: <20231016062831.20630-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231016062831.20630-1-jgross@suse.com>
References: <20231016062831.20630-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.10
X-Spamd-Result: default: False [-3.10 / 50.00];
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
	 BAYES_HAM(-0.00)[11.11%]
X-Spam-Flag: NO

There are no users of xen_irq_from_pirq() and xen_set_irq_pending().

Remove those functions.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/events/events_base.c | 30 ------------------------------
 include/xen/events.h             |  4 ----
 2 files changed, 34 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 0e458b1c0c8c..1d797dd85d0e 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -1165,29 +1165,6 @@ int xen_destroy_irq(int irq)
 	return rc;
 }
 
-int xen_irq_from_pirq(unsigned pirq)
-{
-	int irq;
-
-	struct irq_info *info;
-
-	mutex_lock(&irq_mapping_update_lock);
-
-	list_for_each_entry(info, &xen_irq_list_head, list) {
-		if (info->type != IRQT_PIRQ)
-			continue;
-		irq = info->irq;
-		if (info->u.pirq.pirq == pirq)
-			goto out;
-	}
-	irq = -1;
-out:
-	mutex_unlock(&irq_mapping_update_lock);
-
-	return irq;
-}
-
-
 int xen_pirq_from_irq(unsigned irq)
 {
 	return pirq_from_irq(irq);
@@ -2026,13 +2003,6 @@ void xen_clear_irq_pending(int irq)
 		event_handler_exit(info);
 }
 EXPORT_SYMBOL(xen_clear_irq_pending);
-void xen_set_irq_pending(int irq)
-{
-	evtchn_port_t evtchn = evtchn_from_irq(irq);
-
-	if (VALID_EVTCHN(evtchn))
-		set_evtchn(evtchn);
-}
 
 bool xen_test_irq_pending(int irq)
 {
diff --git a/include/xen/events.h b/include/xen/events.h
index 23932b0673dc..a129cafa80ed 100644
--- a/include/xen/events.h
+++ b/include/xen/events.h
@@ -88,7 +88,6 @@ void xen_irq_resume(void);
 
 /* Clear an irq's pending state, in preparation for polling on it */
 void xen_clear_irq_pending(int irq);
-void xen_set_irq_pending(int irq);
 bool xen_test_irq_pending(int irq);
 
 /* Poll waiting for an irq to become pending.  In the usual case, the
@@ -122,9 +121,6 @@ int xen_bind_pirq_msi_to_irq(struct pci_dev *dev, struct msi_desc *msidesc,
 /* De-allocates the above mentioned physical interrupt. */
 int xen_destroy_irq(int irq);
 
-/* Return irq from pirq */
-int xen_irq_from_pirq(unsigned pirq);
-
 /* Return the pirq allocated to the irq. */
 int xen_pirq_from_irq(unsigned irq);
 
-- 
2.35.3


