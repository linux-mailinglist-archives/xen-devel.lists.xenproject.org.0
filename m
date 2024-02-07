Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B50584CBFB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 14:49:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677623.1054342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXiJ6-0007ur-Sw; Wed, 07 Feb 2024 13:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677623.1054342; Wed, 07 Feb 2024 13:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXiJ6-0007sB-QI; Wed, 07 Feb 2024 13:49:44 +0000
Received: by outflank-mailman (input) for mailman id 677623;
 Wed, 07 Feb 2024 13:49:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D7mL=JQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rXiJ5-0007ot-D2
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 13:49:43 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bccc34c4-c5bf-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 14:49:39 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D322E1FBEF;
 Wed,  7 Feb 2024 13:49:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 93331139B9;
 Wed,  7 Feb 2024 13:49:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qzFYInKKw2WFIQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 07 Feb 2024 13:49:38 +0000
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
X-Inumbo-ID: bccc34c4-c5bf-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707313779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qlPbapYX5kD+SBGGRiIEqtqGLDnstGGBMPRRuI48fEU=;
	b=hYp0rCdwQeQ/RQFWd0OrwmaNklD55xsppQ9GowUeL6zq6TAfjcff9qV7464eMhPrzLTP8s
	KrDnfmhMNv41e5vGdsBRzItn3n3nBJWOQjau6OV7cr31TOu6S+qkuDwl66+l/RSURzTQLX
	PrIdlQRoK+lJjk92K6Y3zFm6ladMFes=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707313778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qlPbapYX5kD+SBGGRiIEqtqGLDnstGGBMPRRuI48fEU=;
	b=KSsN49K88lDFt2bgPyaUVH8oz+jaYQgrkosDO9GktKdZfwETj+25w49wnp9qkreNFAE5GD
	8+TUPaCCVOGJnNk8g1OSYF847SFdVFH09DkFJZn+tEeu68pOnvsjG4XNtYChFyH9tJnuT0
	iIWJt5dVcVQuEfutXCSeFGg6Fxrgn1U=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	julien@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] Mini-OS: fix 9pfront fix
Date: Wed,  7 Feb 2024 14:49:20 +0100
Message-Id: <20240207134920.7341-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=KSsN49K8
X-Spamd-Result: default: False [4.59 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
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
	 DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.10)[65.58%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 4.59
X-Rspamd-Queue-Id: D322E1FBEF
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spamd-Bar: ++++

There was a typo in the recent 9pfront fix.

Fixes: b119f0178fd8 ("Mini-OS: fix 9pfs frontend error path")
Reported-by: Julien Grall <julien@xen.org>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 9pfront.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/9pfront.c b/9pfront.c
index 042879a7..1741d600 100644
--- a/9pfront.c
+++ b/9pfront.c
@@ -729,7 +729,7 @@ static int p9_stat(struct dev_9pfs *dev, uint32_t fid, struct p9_stat *stat)
 
     ret = req->result;
     if ( ret )
-        free_stat(&stat);
+        free_stat(stat);
 
     put_free_req(dev, req);
 
-- 
2.35.3


