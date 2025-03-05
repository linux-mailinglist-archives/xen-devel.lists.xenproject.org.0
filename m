Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D226FA4F93F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 09:55:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901844.1309770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpkXW-0001zk-0C; Wed, 05 Mar 2025 08:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901844.1309770; Wed, 05 Mar 2025 08:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpkXV-0001xD-Te; Wed, 05 Mar 2025 08:55:41 +0000
Received: by outflank-mailman (input) for mailman id 901844;
 Wed, 05 Mar 2025 08:55:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/re5=VY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tpkXU-0001uA-Ho
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 08:55:40 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c857724-f99f-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 09:55:39 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0443F1F393;
 Wed,  5 Mar 2025 08:55:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C941713939;
 Wed,  5 Mar 2025 08:55:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Mn5lL4oRyGdRYQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 05 Mar 2025 08:55:38 +0000
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
X-Inumbo-ID: 9c857724-f99f-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741164939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=44elmMZDJ4NWzroJcs96iQJfsVGMGkqIOdAS9gkXqP0=;
	b=oclCavpistoU+x2FaHhQtlAFVx7Q4rlX92o0/7H99VyQyt9NanSAr3j0eH6D/ZP24FNlTq
	HnjC5sRQNJual7ZEuaeDGhyAhnJ1ZURzmf0o93G91JcFPaf4UtvdPHZfhwgvDH+8VTVm0j
	yULeotFOGOyx+JEexiFYCA79lm9SrM4=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=oclCavpi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741164939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=44elmMZDJ4NWzroJcs96iQJfsVGMGkqIOdAS9gkXqP0=;
	b=oclCavpistoU+x2FaHhQtlAFVx7Q4rlX92o0/7H99VyQyt9NanSAr3j0eH6D/ZP24FNlTq
	HnjC5sRQNJual7ZEuaeDGhyAhnJ1ZURzmf0o93G91JcFPaf4UtvdPHZfhwgvDH+8VTVm0j
	yULeotFOGOyx+JEexiFYCA79lm9SrM4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] tools/libs/store: use single_with_domid() in xs_get_domain_path()
Date: Wed,  5 Mar 2025 09:55:36 +0100
Message-ID: <20250305085536.26311-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0443F1F393
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

xs_get_domain_path() can be simplified by using single_with_domid().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/store/xs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index e22f99b59f..cf3266807f 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -1345,11 +1345,7 @@ bool xs_resume_domain(struct xs_handle *h, unsigned int domid)
 
 char *xs_get_domain_path(struct xs_handle *h, unsigned int domid)
 {
-	char domid_str[MAX_STRLEN(domid)];
-
-	snprintf(domid_str, sizeof(domid_str), "%u", domid);
-
-	return xs_single(h, XBT_NULL, XS_GET_DOMAIN_PATH, domid_str, NULL);
+	return single_with_domid(h, XS_GET_DOMAIN_PATH, domid);
 }
 
 bool xs_path_is_subpath(const char *parent, const char *child)
-- 
2.43.0


