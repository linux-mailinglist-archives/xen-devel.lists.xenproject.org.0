Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D09F751B9EB
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 10:17:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321681.542892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmWfj-00089d-7W; Thu, 05 May 2022 08:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321681.542892; Thu, 05 May 2022 08:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmWfi-0007N6-8T; Thu, 05 May 2022 08:17:14 +0000
Received: by outflank-mailman (input) for mailman id 321681;
 Thu, 05 May 2022 08:16:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YMz1=VN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nmWfQ-0001qT-Ow
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 08:16:56 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b61a15f6-cc4b-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 10:16:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 120B11F8A8;
 Thu,  5 May 2022 08:16:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD80F13B11;
 Thu,  5 May 2022 08:16:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8OnlMPCHc2K1BwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 05 May 2022 08:16:48 +0000
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
X-Inumbo-ID: b61a15f6-cc4b-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651738609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YieP6g6GD+6KZq0OezPbFilh5pPFUmXvxSeu0Xk0Zbk=;
	b=a47wg7hs+Ar9ubMMFW2QBPgc/9OvtFAxtGENzHnQvWq+IimOl5w725xLTv49E1Lysuln+l
	EWdRp77qNP7Ww6z0rS78kI+ZFPVH8Y9J42HfkArvJavBRQdnE3UQxjVoQ5CYzVGeYAGP7p
	3Gk9ApfmiHo+Z13DYIfwZirMV54dG0w=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH v3 20/21] xen/sndfront: use xenbus_setup_ring() and xenbus_teardown_ring()
Date: Thu,  5 May 2022 10:16:39 +0200
Message-Id: <20220505081640.17425-21-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220505081640.17425-1-jgross@suse.com>
References: <20220505081640.17425-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify sndfront's ring creation and removal via xenbus_setup_ring()
and xenbus_teardown_ring().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 sound/xen/xen_snd_front_evtchnl.c | 44 +++++++------------------------
 1 file changed, 10 insertions(+), 34 deletions(-)

diff --git a/sound/xen/xen_snd_front_evtchnl.c b/sound/xen/xen_snd_front_evtchnl.c
index 3e21369c8216..26d1b3987887 100644
--- a/sound/xen/xen_snd_front_evtchnl.c
+++ b/sound/xen/xen_snd_front_evtchnl.c
@@ -143,12 +143,12 @@ void xen_snd_front_evtchnl_flush(struct xen_snd_front_evtchnl *channel)
 static void evtchnl_free(struct xen_snd_front_info *front_info,
 			 struct xen_snd_front_evtchnl *channel)
 {
-	unsigned long page = 0;
+	void *page = NULL;
 
 	if (channel->type == EVTCHNL_TYPE_REQ)
-		page = (unsigned long)channel->u.req.ring.sring;
+		page = channel->u.req.ring.sring;
 	else if (channel->type == EVTCHNL_TYPE_EVT)
-		page = (unsigned long)channel->u.evt.page;
+		page = channel->u.evt.page;
 
 	if (!page)
 		return;
@@ -167,10 +167,7 @@ static void evtchnl_free(struct xen_snd_front_info *front_info,
 		xenbus_free_evtchn(front_info->xb_dev, channel->port);
 
 	/* End access and free the page. */
-	if (channel->gref != INVALID_GRANT_REF)
-		gnttab_end_foreign_access(channel->gref, page);
-	else
-		free_page(page);
+	xenbus_teardown_ring(&page, 1, &channel->gref);
 
 	memset(channel, 0, sizeof(*channel));
 }
@@ -196,8 +193,7 @@ static int evtchnl_alloc(struct xen_snd_front_info *front_info, int index,
 			 enum xen_snd_front_evtchnl_type type)
 {
 	struct xenbus_device *xb_dev = front_info->xb_dev;
-	unsigned long page;
-	grant_ref_t gref;
+	void *page;
 	irq_handler_t handler;
 	char *handler_name = NULL;
 	int ret;
@@ -207,12 +203,9 @@ static int evtchnl_alloc(struct xen_snd_front_info *front_info, int index,
 	channel->index = index;
 	channel->front_info = front_info;
 	channel->state = EVTCHNL_STATE_DISCONNECTED;
-	channel->gref = INVALID_GRANT_REF;
-	page = get_zeroed_page(GFP_KERNEL);
-	if (!page) {
-		ret = -ENOMEM;
+	ret = xenbus_setup_ring(xb_dev, GFP_KERNEL, &page, 1, &channel->gref);
+	if (ret)
 		goto fail;
-	}
 
 	handler_name = kasprintf(GFP_KERNEL, "%s-%s", XENSND_DRIVER_NAME,
 				 type == EVTCHNL_TYPE_REQ ?
@@ -226,33 +219,18 @@ static int evtchnl_alloc(struct xen_snd_front_info *front_info, int index,
 	mutex_init(&channel->ring_io_lock);
 
 	if (type == EVTCHNL_TYPE_REQ) {
-		struct xen_sndif_sring *sring = (struct xen_sndif_sring *)page;
+		struct xen_sndif_sring *sring = page;
 
 		init_completion(&channel->u.req.completion);
 		mutex_init(&channel->u.req.req_io_lock);
-		SHARED_RING_INIT(sring);
-		FRONT_RING_INIT(&channel->u.req.ring, sring, XEN_PAGE_SIZE);
-
-		ret = xenbus_grant_ring(xb_dev, sring, 1, &gref);
-		if (ret < 0) {
-			channel->u.req.ring.sring = NULL;
-			goto fail;
-		}
+		XEN_FRONT_RING_INIT(&channel->u.req.ring, sring, XEN_PAGE_SIZE);
 
 		handler = evtchnl_interrupt_req;
 	} else {
-		ret = gnttab_grant_foreign_access(xb_dev->otherend_id,
-						  virt_to_gfn((void *)page), 0);
-		if (ret < 0)
-			goto fail;
-
-		channel->u.evt.page = (struct xensnd_event_page *)page;
-		gref = ret;
+		channel->u.evt.page = page;
 		handler = evtchnl_interrupt_evt;
 	}
 
-	channel->gref = gref;
-
 	ret = xenbus_alloc_evtchn(xb_dev, &channel->port);
 	if (ret < 0)
 		goto fail;
@@ -279,8 +257,6 @@ static int evtchnl_alloc(struct xen_snd_front_info *front_info, int index,
 	return 0;
 
 fail:
-	if (page)
-		free_page(page);
 	kfree(handler_name);
 	dev_err(&xb_dev->dev, "Failed to allocate ring: %d\n", ret);
 	return ret;
-- 
2.35.3


