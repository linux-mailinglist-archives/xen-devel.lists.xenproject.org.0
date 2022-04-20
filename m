Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4EB508BA6
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 17:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309353.525545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhBy1-00055K-UN; Wed, 20 Apr 2022 15:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309353.525545; Wed, 20 Apr 2022 15:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhBy1-0004ww-8W; Wed, 20 Apr 2022 15:10:05 +0000
Received: by outflank-mailman (input) for mailman id 309353;
 Wed, 20 Apr 2022 15:10:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nhBxy-0003l4-Mv
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 15:10:02 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2633f23-c0bb-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 17:10:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D9190212CA;
 Wed, 20 Apr 2022 15:09:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A555313AE0;
 Wed, 20 Apr 2022 15:09:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iIX9JkciYGJILQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 15:09:59 +0000
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
X-Inumbo-ID: f2633f23-c0bb-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650467399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nqfEAJYikez5yuRaJWQFVEnr7bTvqklH6kJ7XEyZeH4=;
	b=uZzO2cwIu/sM9Hdm1fFLMi4NNhXH9dzuMEXeAORI9mIENpJgMi0mH8YBRcV8SfzpXm4aCJ
	mgsKBrn4Aeo/6RKAQb2zKRH4zXldm3hlBxeNEOtRX2j1vJT8fz76y2iMt2w21WFF5SD4De
	UvfkRO//eO3i1T3ieg9KOtmlKggUaBw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 06/18] xen/sound: switch xen_snd_front to use INVALID_GRANT_REF
Date: Wed, 20 Apr 2022 17:09:30 +0200
Message-Id: <20220420150942.31235-7-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420150942.31235-1-jgross@suse.com>
References: <20220420150942.31235-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using a private macro for an invalid grant reference use
the common one.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 sound/xen/xen_snd_front_evtchnl.c | 4 ++--
 sound/xen/xen_snd_front_evtchnl.h | 9 ---------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/sound/xen/xen_snd_front_evtchnl.c b/sound/xen/xen_snd_front_evtchnl.c
index ecbc294fc59a..3e21369c8216 100644
--- a/sound/xen/xen_snd_front_evtchnl.c
+++ b/sound/xen/xen_snd_front_evtchnl.c
@@ -167,7 +167,7 @@ static void evtchnl_free(struct xen_snd_front_info *front_info,
 		xenbus_free_evtchn(front_info->xb_dev, channel->port);
 
 	/* End access and free the page. */
-	if (channel->gref != GRANT_INVALID_REF)
+	if (channel->gref != INVALID_GRANT_REF)
 		gnttab_end_foreign_access(channel->gref, page);
 	else
 		free_page(page);
@@ -207,7 +207,7 @@ static int evtchnl_alloc(struct xen_snd_front_info *front_info, int index,
 	channel->index = index;
 	channel->front_info = front_info;
 	channel->state = EVTCHNL_STATE_DISCONNECTED;
-	channel->gref = GRANT_INVALID_REF;
+	channel->gref = INVALID_GRANT_REF;
 	page = get_zeroed_page(GFP_KERNEL);
 	if (!page) {
 		ret = -ENOMEM;
diff --git a/sound/xen/xen_snd_front_evtchnl.h b/sound/xen/xen_snd_front_evtchnl.h
index cbe51fd1ec15..3675fba70564 100644
--- a/sound/xen/xen_snd_front_evtchnl.h
+++ b/sound/xen/xen_snd_front_evtchnl.h
@@ -15,15 +15,6 @@
 
 struct xen_snd_front_info;
 
-#ifndef GRANT_INVALID_REF
-/*
- * FIXME: usage of grant reference 0 as invalid grant reference:
- * grant reference 0 is valid, but never exposed to a PV driver,
- * because of the fact it is already in use/reserved by the PV console.
- */
-#define GRANT_INVALID_REF	0
-#endif
-
 /* Timeout in ms to wait for backend to respond. */
 #define VSND_WAIT_BACK_MS	3000
 
-- 
2.34.1


