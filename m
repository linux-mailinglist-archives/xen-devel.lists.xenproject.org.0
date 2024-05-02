Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDFF8B9788
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 11:22:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715711.1117552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Sdz-0004qG-08; Thu, 02 May 2024 09:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715711.1117552; Thu, 02 May 2024 09:22:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Sdy-0004nR-Sb; Thu, 02 May 2024 09:22:22 +0000
Received: by outflank-mailman (input) for mailman id 715711;
 Thu, 02 May 2024 09:22:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+3sG=MF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1s2Sdx-0004nL-HZ
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 09:22:21 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 790baa5f-0865-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 11:22:19 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7C9731FBBF;
 Thu,  2 May 2024 09:22:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 53D1913957;
 Thu,  2 May 2024 09:22:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Q5D9EkpbM2aKdQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 02 May 2024 09:22:18 +0000
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
X-Inumbo-ID: 790baa5f-0865-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1714641738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cATNxw1g0F/LigKNEgEM99/Pu1Mz9opkA8rmEbHNY9E=;
	b=JKTWtgQjeS/EIhHah9mCKjBSqFAcLyDW0Fj8/4tiiESK9CJBMpWXoTsrHXL7SkFL8UjVZP
	DEgDuqy45csNeMgrWTMxMOF9gK9mXq+zrkE6yDEc4Vi+VuC/mRtjUzV2XGAGd/2oIJZLPc
	ZOPEDJtBoV8pduAUZ4HQzVkmBxL3rco=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=JKTWtgQj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1714641738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cATNxw1g0F/LigKNEgEM99/Pu1Mz9opkA8rmEbHNY9E=;
	b=JKTWtgQjeS/EIhHah9mCKjBSqFAcLyDW0Fj8/4tiiESK9CJBMpWXoTsrHXL7SkFL8UjVZP
	DEgDuqy45csNeMgrWTMxMOF9gK9mXq+zrkE6yDEc4Vi+VuC/mRtjUzV2XGAGd/2oIJZLPc
	ZOPEDJtBoV8pduAUZ4HQzVkmBxL3rco=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] tools/tests: let test-xenstore exit with non-0 status in case of error
Date: Thu,  2 May 2024 11:22:13 +0200
Message-Id: <20240502092213.15163-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.02
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 7C9731FBBF
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.02 / 50.00];
	DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	BAYES_HAM(-0.01)[45.29%];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]

In case a test is failing in test-xenstore, let the tool exit with an
exit status other than 0.

Fix a typo in an error message.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Fixes: 3afc5e4a5b75 ("tools/tests: add xenstore testing framework")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/tests/xenstore/test-xenstore.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/tests/xenstore/test-xenstore.c b/tools/tests/xenstore/test-xenstore.c
index d491dac53b..d7d44cc0fa 100644
--- a/tools/tests/xenstore/test-xenstore.c
+++ b/tools/tests/xenstore/test-xenstore.c
@@ -506,14 +506,14 @@ int main(int argc, char *argv[])
         stop = time(NULL) + randtime;
         srandom((unsigned int)stop);
 
-        while ( time(NULL) < stop )
+        while ( time(NULL) < stop && !ret )
         {
             t = random() % ARRAY_SIZE(tests);
             ret = call_test(tests + t, iters, true);
         }
     }
     else
-        for ( t = 0; t < ARRAY_SIZE(tests); t++ )
+        for ( t = 0; t < ARRAY_SIZE(tests) && !ret; t++ )
         {
             if ( !test || !strcmp(test, tests[t].name) )
                 ret = call_test(tests + t, iters, false);
@@ -525,10 +525,10 @@ int main(int argc, char *argv[])
     xs_close(xsh);
 
     if ( ta_loops )
-        printf("Exhaustive transaction retries (%d) occurrred %d times.\n",
+        printf("Exhaustive transaction retries (%d) occurred %d times.\n",
                MAX_TA_LOOPS, ta_loops);
 
-    return 0;
+    return ret ? 3 : 0;
 }
 
 /*
-- 
2.35.3


