Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LzRKOucoWkOvAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 14:32:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DC91B7B83
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 14:32:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242815.1543040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvxwK-0002u6-5U; Fri, 27 Feb 2026 13:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242815.1543040; Fri, 27 Feb 2026 13:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvxwK-0002ra-2c; Fri, 27 Feb 2026 13:31:32 +0000
Received: by outflank-mailman (input) for mailman id 1242815;
 Fri, 27 Feb 2026 13:31:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rg6b=A7=suse.de=tzimmermann@srs-se1.protection.inumbo.net>)
 id 1vvxwH-0002rT-MV
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 13:31:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e57639e-13e0-11f1-b164-2bf370ae4941;
 Fri, 27 Feb 2026 14:31:28 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C7E923FFF7;
 Fri, 27 Feb 2026 13:31:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E4773EA69;
 Fri, 27 Feb 2026 13:31:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MPqGIa6coWkrLQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Feb 2026 13:31:26 +0000
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
X-Inumbo-ID: 9e57639e-13e0-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772199086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MjLceajnFqhra3Jb3mX4oFtSi4Rj0D7JYvmHOrBhBS8=;
	b=id1cmgUt3Yv1H5NiPzA9q5bUsqsH0ZUnY9pkeqV5eXfwICs9MgzOPWVgeD+V2jdO0P0mU3
	41TpRGU5TvnfF7SmFV8sFbibol8Tkj2hL5JxiMMESdbTvIdDIvvTUI/2Xmf3fdANZaSR5c
	XEtL/428Gp5pqQVSHEffcFiXH7+ANy4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772199086;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MjLceajnFqhra3Jb3mX4oFtSi4Rj0D7JYvmHOrBhBS8=;
	b=b6xTxwaYJSHEkoBSysrRdgRfYdywpG0gL8qU9jImTnDmbzNu9tG6E/lllu7zzz9vD+Gnhx
	JFbxmkMJGwKQweAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=id1cmgUt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=b6xTxwaY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772199086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MjLceajnFqhra3Jb3mX4oFtSi4Rj0D7JYvmHOrBhBS8=;
	b=id1cmgUt3Yv1H5NiPzA9q5bUsqsH0ZUnY9pkeqV5eXfwICs9MgzOPWVgeD+V2jdO0P0mU3
	41TpRGU5TvnfF7SmFV8sFbibol8Tkj2hL5JxiMMESdbTvIdDIvvTUI/2Xmf3fdANZaSR5c
	XEtL/428Gp5pqQVSHEffcFiXH7+ANy4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772199086;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MjLceajnFqhra3Jb3mX4oFtSi4Rj0D7JYvmHOrBhBS8=;
	b=b6xTxwaYJSHEkoBSysrRdgRfYdywpG0gL8qU9jImTnDmbzNu9tG6E/lllu7zzz9vD+Gnhx
	JFbxmkMJGwKQweAw==
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] drm/xen: Test for imported buffers with drm_gem_is_imported()
Date: Fri, 27 Feb 2026 14:31:13 +0100
Message-ID: <20260227133113.235940-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:tzimmermann@suse.de,m:oleksandr_andrushchenko@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,suse.de:mid,suse.de:dkim,suse.de:email,xenproject.org:email];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 45DC91B7B83
X-Rspamd-Action: no action

Instead of testing import_attach for imported GEM buffers, invoke
drm_gem_is_imported() to do the test. The test itself does not change.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: xen-devel@lists.xenproject.org
---
 drivers/gpu/drm/xen/xen_drm_front_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index eec4c1da3f9e..280982b85ce7 100644
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
2.52.0


