Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F2C715921
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 10:55:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540888.843023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3v8G-000578-Ed; Tue, 30 May 2023 08:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540888.843023; Tue, 30 May 2023 08:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3v8G-00053I-An; Tue, 30 May 2023 08:55:08 +0000
Received: by outflank-mailman (input) for mailman id 540888;
 Tue, 30 May 2023 08:55:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3v8E-0001Xf-RM
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 08:55:06 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac67b290-fec7-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 10:55:06 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3798D1F889;
 Tue, 30 May 2023 08:55:06 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 074B31341B;
 Tue, 30 May 2023 08:55:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id DXN3AOq5dWSIGwAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 08:55:06 +0000
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
X-Inumbo-ID: ac67b290-fec7-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685436906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l2FBUE2T4MH30TEu8Jlu1UNyg7s+XGZ/EyB1vpKoEVo=;
	b=rVU9GKPTrUebAF1qgXiONfJxixh4JihMiavSlJhFXZkfAKrbYpPykvpwZ6zAfDpiMsZZf5
	bYyNH5k03CIyHg48Kk2Z1omFwaMBi+tkAk4/D6joyNh0AtXaGlHbUIoyIdF5J2xq7o1Tsh
	lK08Pq0iQywMso6/4/1KuixPQ8phuIQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 08/16] tools/xenstore: remove unused events list
Date: Tue, 30 May 2023 10:54:10 +0200
Message-Id: <20230530085418.5417-9-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230530085418.5417-1-jgross@suse.com>
References: <20230530085418.5417-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct watch contains an unused struct list_head events. Remove it.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_watch.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index e8eb35de02..4195c59e17 100644
--- a/tools/xenstore/xenstored_watch.c
+++ b/tools/xenstore/xenstored_watch.c
@@ -36,9 +36,6 @@ struct watch
 	/* Watches on this connection */
 	struct list_head list;
 
-	/* Current outstanding events applying to this watch. */
-	struct list_head events;
-
 	/* Offset into path for skipping prefix (used for relative paths). */
 	unsigned int prefix_len;
 
@@ -205,8 +202,6 @@ static struct watch *add_watch(struct connection *conn, char *path, char *token,
 
 	watch->prefix_len = relative ? strlen(get_implicit_path(conn)) + 1 : 0;
 
-	INIT_LIST_HEAD(&watch->events);
-
 	domain_watch_inc(conn);
 	list_add_tail(&watch->list, &conn->watches);
 	talloc_set_destructor(watch, destroy_watch);
-- 
2.35.3


