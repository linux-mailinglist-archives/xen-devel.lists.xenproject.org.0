Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF36E512E5E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 10:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316174.534993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVD-0006Td-0q; Thu, 28 Apr 2022 08:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316174.534993; Thu, 28 Apr 2022 08:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVC-0006HV-92; Thu, 28 Apr 2022 08:27:54 +0000
Received: by outflank-mailman (input) for mailman id 316174;
 Thu, 28 Apr 2022 08:27:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KUQd=VG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njzV9-0005SM-Dw
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 08:27:51 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16b2dfeb-c6cd-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 10:27:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3AA1321873;
 Thu, 28 Apr 2022 08:27:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0188D13491;
 Thu, 28 Apr 2022 08:27:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EMGoOgRQamIBLgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Apr 2022 08:27:48 +0000
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
X-Inumbo-ID: 16b2dfeb-c6cd-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651134469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tOhV6YQDouFKSF4kDrscgmAnoCYSHdFmpTsct9Kqzek=;
	b=h6hwiM9FHRpDwvATx8ZJwxdJgF4aQmHGQmkHLtLJrYUY3ATb3CYZi1lh3cJIcZpfglwM82
	FnnkX9Ux6gOptve9MuodDmBZFvSvzzfaQd9rtWom4I0jgM9qfoQTzXUk9eOHuFfhhQ3J0o
	Hsizgzz4vnGMgdDhowBzhKzpG3NUYfc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 05/19] xen/drm: switch xen_drm_front to use INVALID_GRANT_REF
Date: Thu, 28 Apr 2022 10:27:29 +0200
Message-Id: <20220428082743.16593-6-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220428082743.16593-1-jgross@suse.com>
References: <20220428082743.16593-1-jgross@suse.com>
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
2.34.1


