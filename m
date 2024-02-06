Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6622384AE54
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 07:18:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676647.1052866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXEm1-0004p0-W9; Tue, 06 Feb 2024 06:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676647.1052866; Tue, 06 Feb 2024 06:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXEm1-0004kX-T9; Tue, 06 Feb 2024 06:17:37 +0000
Received: by outflank-mailman (input) for mailman id 676647;
 Tue, 06 Feb 2024 06:17:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z75a=JP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rXEm0-0004kB-98
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 06:17:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68b6be2e-c4b7-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 07:17:32 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4972E21FC2;
 Tue,  6 Feb 2024 06:17:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1015713786;
 Tue,  6 Feb 2024 06:17:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id E+1kAvjOwWWmPQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 06 Feb 2024 06:17:28 +0000
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
X-Inumbo-ID: 68b6be2e-c4b7-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707200250; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=15V5eFj2jLAbKEF5egEw/9Nn2ao4TpiAAM6VXmsstgs=;
	b=MDKwijcSTZSjPiSNoI6oMeSvn1EOmCiDJVsnqHVG31lmMGrHjdBKZ/cBL4kju1aOzzQTbz
	TDRKzOkKQnkF9RlSs56DYGSudNprjl46yXO6bL+LKnWkeZXjcHUrxFvN5q6WgfgzD9FFtm
	QwtcshgFXo3TFyMJSHWFGorAgTjj0b4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707200248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=15V5eFj2jLAbKEF5egEw/9Nn2ao4TpiAAM6VXmsstgs=;
	b=reB0C4nyfUk2/9p7m4JG9ILrEUd3B7b64VcDhi6c1Yk+cLQdR05DFDZSak0mk4jJESXmf7
	cSEIM/RSI/Jfskc36Nb1NXojIcmOFBocwp0y/WdhdBb12xUCS9FH7YfeqRznZ+9IEvgrpd
	aAa6wIF3DKH294LdUPuz7+HM7Qc6MWs=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	julien@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] Mini-OS: fix 9pfs frontend error path
Date: Tue,  6 Feb 2024 07:17:21 +0100
Message-Id: <20240206061721.27297-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=reB0C4ny
X-Spamd-Result: default: False [4.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:email,suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[22.69%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 4.69
X-Rspamd-Queue-Id: 4972E21FC2
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spamd-Bar: ++++

The early error exit in p9_stat() returns without zeroing the p9_stat
buffer, resulting in free() being called with an uninitialized pointer.

Fix that by doing the zeroing first.

Reported-by: Julien Grall <julien@xen.org>
Fixes: 2d1dfccd3aa3 ("Mini-OS: add read and write support to 9pfsfront")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 9pfront.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/9pfront.c b/9pfront.c
index 315089bc..33eaadce 100644
--- a/9pfront.c
+++ b/9pfront.c
@@ -716,10 +716,11 @@ static int p9_stat(struct dev_9pfs *dev, uint32_t fid, struct p9_stat *stat)
     uint16_t total;
     int ret;
 
+    memset(stat, 0, sizeof(*stat));
+
     if ( !req )
         return EAGAIN;
 
-    memset(stat, 0, sizeof(*stat));
     req->cmd = P9_CMD_STAT;
     send_9p(dev, req, "U", fid);
     rcv_9p(dev, req, "uuuUQUUULSSSSSUUU", &total, &stat->size, &stat->type,
-- 
2.35.3


