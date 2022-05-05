Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 740AE51B9FB
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 10:17:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321675.542817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmWfT-0004fV-S0; Thu, 05 May 2022 08:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321675.542817; Thu, 05 May 2022 08:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmWfS-0004Mz-QM; Thu, 05 May 2022 08:16:58 +0000
Received: by outflank-mailman (input) for mailman id 321675;
 Thu, 05 May 2022 08:16:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YMz1=VN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nmWfM-0001qT-NY
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 08:16:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4194cc7-cc4b-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 10:16:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AD77B1F891;
 Thu,  5 May 2022 08:16:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 75BD113B11;
 Thu,  5 May 2022 08:16:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GKd6G+2Hc2K1BwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 05 May 2022 08:16:45 +0000
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
X-Inumbo-ID: b4194cc7-cc4b-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651738605; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i6ggN2balHjG5CI3jRk1VrmRzP8B/Nm2ztrH3YOWGCk=;
	b=helWnP73V72ZSHcX1/aibZU8SheuDic0cwyuSMwpOutceVsMy58aFEH/CDLZXrGoidt9BX
	7t+UwBsoDdE6odBOC2KMcJdtaJihm/5I7y8lbWp4Q7bOuuFSRsLN6jJbVGWTBEd9nduCyW
	hil4J+m7kbB57nwtL9W34PEnDiV3IrU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 07/21] xen/drm: switch xen_drm_front to use INVALID_GRANT_REF
Date: Thu,  5 May 2022 10:16:26 +0200
Message-Id: <20220505081640.17425-8-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220505081640.17425-1-jgross@suse.com>
References: <20220505081640.17425-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using a private macro for an invalid grant reference use
the common one.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/gpu/drm/xen/xen_drm_front.h         | 9 ---------
 drivers/gpu/drm/xen/xen_drm_front_evtchnl.c | 4 ++--
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.h b/drivers/gpu/drm/xen/xen_drm_front.h
index cefafe859aba..a987c78abe41 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.h
+++ b/drivers/gpu/drm/xen/xen_drm_front.h
@@ -80,15 +80,6 @@ struct drm_pending_vblank_event;
 /* timeout in ms to wait for backend to respond */
 #define XEN_DRM_FRONT_WAIT_BACK_MS	3000
 
-#ifndef GRANT_INVALID_REF
-/*
- * Note on usage of grant reference 0 as invalid grant reference:
- * grant reference 0 is valid, but never exposed to a PV driver,
- * because of the fact it is already in use/reserved by the PV console.
- */
-#define GRANT_INVALID_REF	0
-#endif
-
 struct xen_drm_front_info {
 	struct xenbus_device *xb_dev;
 	struct xen_drm_front_drm_info *drm_info;
diff --git a/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c b/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c
index 08b526eeec16..4006568b9e32 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c
@@ -147,7 +147,7 @@ static void evtchnl_free(struct xen_drm_front_info *front_info,
 		xenbus_free_evtchn(front_info->xb_dev, evtchnl->port);
 
 	/* end access and free the page */
-	if (evtchnl->gref != GRANT_INVALID_REF)
+	if (evtchnl->gref != INVALID_GRANT_REF)
 		gnttab_end_foreign_access(evtchnl->gref, page);
 
 	memset(evtchnl, 0, sizeof(*evtchnl));
@@ -168,7 +168,7 @@ static int evtchnl_alloc(struct xen_drm_front_info *front_info, int index,
 	evtchnl->index = index;
 	evtchnl->front_info = front_info;
 	evtchnl->state = EVTCHNL_STATE_DISCONNECTED;
-	evtchnl->gref = GRANT_INVALID_REF;
+	evtchnl->gref = INVALID_GRANT_REF;
 
 	page = get_zeroed_page(GFP_NOIO | __GFP_HIGH);
 	if (!page) {
-- 
2.35.3


