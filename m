Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D9780710D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 14:43:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649313.1013685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAsBD-0001OP-QM; Wed, 06 Dec 2023 13:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649313.1013685; Wed, 06 Dec 2023 13:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAsBD-0001MB-NP; Wed, 06 Dec 2023 13:43:11 +0000
Received: by outflank-mailman (input) for mailman id 649313;
 Wed, 06 Dec 2023 13:43:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lx6I=HR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rAsBB-0001KH-Up
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 13:43:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61fdeb38-943d-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 14:43:05 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E162C1F8D7;
 Wed,  6 Dec 2023 13:43:03 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id A5A80133DD;
 Wed,  6 Dec 2023 13:43:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id CAUbJ2d6cGW2AwAAn2gu4w
 (envelope-from <jgross@suse.com>); Wed, 06 Dec 2023 13:43:03 +0000
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
X-Inumbo-ID: 61fdeb38-943d-11ee-9b0f-b553b5be7939
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] Mini-OS: export main_thread
Date: Wed,  6 Dec 2023 14:43:01 +0100
Message-Id: <20231206134301.6842-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ***************
X-Spamd-Bar: +++++++++++++++
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [15.76 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 BAYES_SPAM(0.93)[80.87%];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.17)[-0.847];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 15.76
X-Rspamd-Queue-Id: E162C1F8D7
X-Spam-Flag: YES
X-Spam: Yes

The main_thread variable needs to be exported for applications.

Fixes: 33411a11f848 ("Mini-OS: hide all symbols not exported via EXPORT_SYMBOLS()")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 sched.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sched.c b/sched.c
index e162cb60..b1633be9 100644
--- a/sched.c
+++ b/sched.c
@@ -62,6 +62,7 @@ static struct thread_list thread_list = MINIOS_TAILQ_HEAD_INITIALIZER(thread_lis
 static int threads_started;
 
 struct thread *main_thread;
+EXPORT_SYMBOL(main_thread);
 
 void schedule(void)
 {
-- 
2.35.3


