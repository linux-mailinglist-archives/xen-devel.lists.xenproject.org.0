Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6553784B57B
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 13:44:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676893.1053221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXKnp-0007MX-Nf; Tue, 06 Feb 2024 12:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676893.1053221; Tue, 06 Feb 2024 12:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXKnp-0007Ji-Kv; Tue, 06 Feb 2024 12:43:53 +0000
Received: by outflank-mailman (input) for mailman id 676893;
 Tue, 06 Feb 2024 12:43:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z75a=JP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rXKno-0007Jc-HS
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 12:43:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60845f2e-c4ed-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 13:43:50 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B6F4C1FB7B;
 Tue,  6 Feb 2024 12:43:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C932139D8;
 Tue,  6 Feb 2024 12:43:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id w/7XIIUpwmVgLwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 06 Feb 2024 12:43:49 +0000
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
X-Inumbo-ID: 60845f2e-c4ed-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707223429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pLWMim2B/YQSmAwCWn+D8u0DBo5Nz/tbQLySCJq5lh4=;
	b=hVIN8I8uFlEDikCOeI0K2mFEXTK31guGfdCKPeZ62Mg9iZWmLfnRQ5r27q2Ujf1gO6eEml
	jqIK/nJtCPCQnZzdvN1UHwdVI0x9i2QZTcNKhRaCyniNJdxF192mX/kLGYTy5Lnt7fybA3
	Tzd5G81kmw3fq+7EHFvT97G9w148fwo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707223429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pLWMim2B/YQSmAwCWn+D8u0DBo5Nz/tbQLySCJq5lh4=;
	b=hVIN8I8uFlEDikCOeI0K2mFEXTK31guGfdCKPeZ62Mg9iZWmLfnRQ5r27q2Ujf1gO6eEml
	jqIK/nJtCPCQnZzdvN1UHwdVI0x9i2QZTcNKhRaCyniNJdxF192mX/kLGYTy5Lnt7fybA3
	Tzd5G81kmw3fq+7EHFvT97G9w148fwo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/libs/light: don't allow to stop Xenstore stubdom
Date: Tue,  6 Feb 2024 13:43:45 +0100
Message-Id: <20240206124345.19433-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [4.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[34.66%]
X-Spam-Level: ****
X-Spam-Score: 4.90
X-Spam-Flag: NO

A Xenstore stubdom should never be stoppable.

Reject attempts to do so.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/light/libxl_domain.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 5ee1544d9c..21d1b0babf 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -1167,13 +1167,19 @@ void libxl__destroy_domid(libxl__egc *egc, libxl__destroy_domid_state *dis)
 {
     STATE_AO_GC(dis->ao);
     uint32_t domid = dis->domid;
+    libxl_dominfo info;
     int rc;
 
     libxl__ev_child_init(&dis->destroyer);
 
-    rc = libxl_domain_info(CTX, NULL, domid);
+    rc = libxl_domain_info(CTX, &info, domid);
     switch(rc) {
     case 0:
+        if (info.never_stop) {
+            LOGD(ERROR, domid, "Non-stoppable domain");
+            rc = ERROR_INVAL;
+            goto out;
+        }
         break;
     case ERROR_DOMAIN_NOTFOUND:
         LOGD(ERROR, domid, "Non-existant domain");
-- 
2.35.3


