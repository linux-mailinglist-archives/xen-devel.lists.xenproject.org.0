Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8B7A8832C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 15:51:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950290.1346658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4KDl-0000ro-9D; Mon, 14 Apr 2025 13:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950290.1346658; Mon, 14 Apr 2025 13:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4KDl-0000qP-5O; Mon, 14 Apr 2025 13:51:33 +0000
Received: by outflank-mailman (input) for mailman id 950290;
 Mon, 14 Apr 2025 13:51:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LA9o=XA=suse.de=tzimmermann@srs-se1.protection.inumbo.net>)
 id 1u4KDj-0000qJ-2M
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 13:51:31 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 909b0822-1937-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 15:51:29 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 43B451F812;
 Mon, 14 Apr 2025 13:51:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A472136A7;
 Mon, 14 Apr 2025 13:51:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oG7/AOAS/We6BQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Apr 2025 13:51:28 +0000
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
X-Inumbo-ID: 909b0822-1937-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744638688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v5o1jrP68r7wTT/wB97zJmtcAIb58PoJZS1sfRVdP9c=;
	b=Nhx+fyPbhPetg4eaWXXZ8shhxTZ8SVwW5hU16yKi8Shj293IPJjyPxPmGQV6nZ2XpOHtVy
	biZC4JdUQ9k3pWCc3d2VK2Gseg7jnfRYcsec2x5QLbCJhc33IxbJhTbeAxfUeKl/WyjRRg
	1D6nLzJWdwYme17hfcsJlXpqBaRyKm8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744638688;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v5o1jrP68r7wTT/wB97zJmtcAIb58PoJZS1sfRVdP9c=;
	b=yDjPBNT1gGOppDZ/9qi6QOcrvIkS5cTFhCPONBq55AH7vRQ5LFDvbHOvDZXsQpkhtqSBag
	6CmGL31yVFepeACA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744638688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v5o1jrP68r7wTT/wB97zJmtcAIb58PoJZS1sfRVdP9c=;
	b=Nhx+fyPbhPetg4eaWXXZ8shhxTZ8SVwW5hU16yKi8Shj293IPJjyPxPmGQV6nZ2XpOHtVy
	biZC4JdUQ9k3pWCc3d2VK2Gseg7jnfRYcsec2x5QLbCJhc33IxbJhTbeAxfUeKl/WyjRRg
	1D6nLzJWdwYme17hfcsJlXpqBaRyKm8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744638688;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v5o1jrP68r7wTT/wB97zJmtcAIb58PoJZS1sfRVdP9c=;
	b=yDjPBNT1gGOppDZ/9qi6QOcrvIkS5cTFhCPONBq55AH7vRQ5LFDvbHOvDZXsQpkhtqSBag
	6CmGL31yVFepeACA==
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com,
	simona@ffwll.ch,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 07/11] drm/xen: Test for imported buffers with drm_gem_is_imported()
Date: Mon, 14 Apr 2025 15:48:14 +0200
Message-ID: <20250414134821.568225-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,kernel.org,linux.intel.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[8];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Instead of testing import_attach for imported GEM buffers, invoke
drm_gem_is_imported() to do the test. The helper tests the dma_buf
itself while import_attach is just an artifact of the import. Prepares
to make import_attach optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: xen-devel@lists.xenproject.org
---
 drivers/gpu/drm/xen/xen_drm_front_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index 63112ed975c4..62a83c36fce8 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -203,7 +203,7 @@ void xen_drm_front_gem_free_object_unlocked(struct drm_gem_object *gem_obj)
 {
 	struct xen_gem_object *xen_obj = to_xen_gem_obj(gem_obj);
 
-	if (xen_obj->base.import_attach) {
+	if (drm_gem_is_imported(&xen_obj->base)) {
 		drm_prime_gem_destroy(&xen_obj->base, xen_obj->sgt_imported);
 		gem_free_pages_array(xen_obj);
 	} else {
-- 
2.49.0


