Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AFCA54DE2
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 15:34:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903626.1311594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqCIa-0004Mm-1P; Thu, 06 Mar 2025 14:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903626.1311594; Thu, 06 Mar 2025 14:34:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqCIZ-0004KP-UF; Thu, 06 Mar 2025 14:34:07 +0000
Received: by outflank-mailman (input) for mailman id 903626;
 Thu, 06 Mar 2025 14:34:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TCcn=VZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tqCIY-0004KJ-9o
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 14:34:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0be07b73-fa98-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 15:34:01 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0985F211AD;
 Thu,  6 Mar 2025 14:34:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE5C713A91;
 Thu,  6 Mar 2025 14:33:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eMbHMFeyyWe1AQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 06 Mar 2025 14:33:59 +0000
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
X-Inumbo-ID: 0be07b73-fa98-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741271641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=e5R3H2Gp2OkWAklm2AOWn+b5T8JI2Yypbfu9SLdCrGI=;
	b=pnjWY6eH3iOiU3uUgtUWoho18vqHGXdyfgkcE2xPiTDvQzE97ckW37gEACL36+xwgbb7y0
	0A0U/Bpc3n5CT0U1jgBqeXprzYxBdJUCwmy952M+BCpHdvcYKZP3B2LESoqg3Z6YtcJs5W
	SX6Ef1HDzZoplD+4rXPO4is4mxmIKGI=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741271640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=e5R3H2Gp2OkWAklm2AOWn+b5T8JI2Yypbfu9SLdCrGI=;
	b=neCgQuwdAOXlQFGyko7XEGo7Won9yvhOJ9HXOTCs4L+c32hdybdCIHgskiJiS6BcsqVYk4
	0QdRP1XarhLbssnLaWlollz1vjwNAy18bxQpZozPmGGEYddu9+tYKhvUYFIMwQ6DeWmT8r
	MT5c2HT16d3L+9sJ9kMWyor1n2/8scQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH] xen/xsm: fix xsm_get_domain_state() in xsm.h
Date: Thu,  6 Mar 2025 15:33:57 +0100
Message-ID: <20250306143357.21077-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

xsm_get_domain_state() in xsm.h is lacking a xsm_default_t parameter.

Add it.

Fixes: 3ad3df1bd0aa ("xen: add new domctl get_domain_state")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/include/xsm/xsm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 0689bf5c9f..6c60b923fd 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -775,7 +775,7 @@ static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
 
 #endif /* CONFIG_ARGO */
 
-static inline int xsm_get_domain_state(struct domain *d)
+static inline int xsm_get_domain_state(xsm_default_t def, struct domain *d)
 {
     return alternative_call(xsm_ops.get_domain_state, d);
 }
-- 
2.43.0


