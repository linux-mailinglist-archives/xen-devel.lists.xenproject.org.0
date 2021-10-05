Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F834227FA
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 15:34:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202273.356987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXkac-00031z-Dq; Tue, 05 Oct 2021 13:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202273.356987; Tue, 05 Oct 2021 13:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXkac-0002zo-Aw; Tue, 05 Oct 2021 13:34:38 +0000
Received: by outflank-mailman (input) for mailman id 202273;
 Tue, 05 Oct 2021 13:34:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/jnY=OZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mXkab-0002ze-8J
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 13:34:37 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b68957c-58fc-44b2-a12c-7d1a9f5ec69e;
 Tue, 05 Oct 2021 13:34:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9BBDF20028;
 Tue,  5 Oct 2021 13:34:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6487D13C35;
 Tue,  5 Oct 2021 13:34:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id a1xEF2tUXGHnDwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 05 Oct 2021 13:34:35 +0000
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
X-Inumbo-ID: 2b68957c-58fc-44b2-a12c-7d1a9f5ec69e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1633440875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=muVpN94mowz5PNDdbHLdWMwCxQCzzIFQLh6tPGkXOCw=;
	b=WB084CpVgo7IVkufWcK3GX0mN37NTIXQAwwmpfy8mfvZjcDCTnJJph90jEaoPJ8gs6E5BO
	s7Z+YiKqhftnBIOnEtwSjw6L/5HUFyKN3dBids+HBSzO8WlZAQPyLKQ8bJBkW6WBWRx9Qa
	iO4ZxJ64g3GTX589cF6hqBGZ96qyPzc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	stable@vger.kernel.org,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] xen/balloon: fix cancelled balloon action
Date: Tue,  5 Oct 2021 15:34:33 +0200
Message-Id: <20211005133433.32008-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In case a ballooning action is cancelled the new kernel thread handling
the ballooning might end up in a busy loop.

Fix that by handling the cancelled action gracefully.

While at it introduce a short wait for the BP_WAIT case.

Cc: stable@vger.kernel.org
Fixes: 8480ed9c2bbd56 ("xen/balloon: use a kernel thread instead a workqueue")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/balloon.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 43ebfe36ac27..3a50f097ed3e 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -491,12 +491,12 @@ static enum bp_state decrease_reservation(unsigned long nr_pages, gfp_t gfp)
 }
 
 /*
- * Stop waiting if either state is not BP_EAGAIN and ballooning action is
- * needed, or if the credit has changed while state is BP_EAGAIN.
+ * Stop waiting if either state is BP_DONE and ballooning action is
+ * needed, or if the credit has changed while state is not BP_DONE.
  */
 static bool balloon_thread_cond(enum bp_state state, long credit)
 {
-	if (state != BP_EAGAIN)
+	if (state == BP_DONE)
 		credit = 0;
 
 	return current_credit() != credit || kthread_should_stop();
@@ -516,10 +516,19 @@ static int balloon_thread(void *unused)
 
 	set_freezable();
 	for (;;) {
-		if (state == BP_EAGAIN)
-			timeout = balloon_stats.schedule_delay * HZ;
-		else
+		switch (state) {
+		case BP_DONE:
+		case BP_ECANCELED:
 			timeout = 3600 * HZ;
+			break;
+		case BP_EAGAIN:
+			timeout = balloon_stats.schedule_delay * HZ;
+			break;
+		case BP_WAIT:
+			timeout = HZ;
+			break;
+		}
+
 		credit = current_credit();
 
 		wait_event_freezable_timeout(balloon_thread_wq,
-- 
2.26.2


