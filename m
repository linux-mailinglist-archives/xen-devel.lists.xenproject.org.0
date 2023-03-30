Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A58CE6CFF1B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 10:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516517.800766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phnzp-0000Te-8e; Thu, 30 Mar 2023 08:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516517.800766; Thu, 30 Mar 2023 08:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phnzp-0000Qc-4p; Thu, 30 Mar 2023 08:51:01 +0000
Received: by outflank-mailman (input) for mailman id 516517;
 Thu, 30 Mar 2023 08:51:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QMey=7W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1phnzn-0005fr-Vq
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 08:50:59 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe16c54a-ced7-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 10:50:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5F97221B0D;
 Thu, 30 Mar 2023 08:50:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2F3A1138FF;
 Thu, 30 Mar 2023 08:50:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Vhn1CXNNJWRLIwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 30 Mar 2023 08:50:59 +0000
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
X-Inumbo-ID: fe16c54a-ced7-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680166259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T80cElhqLxq4rDBJa35Qe57b/vAHNK+lXXK39qwQ7f8=;
	b=AD2g/j7L31YdO58SaRadPox8D30vLPmjAsZ0YeTMmbSluay7kwuLjb4tFGySknN+kOpZ7D
	/SJHRn5jSeb1gIwuQ1ImYr8ejQS/rFcid7uXIeJtqhfX/DuF98jMuD5ejD3RzcnvOaB8P5
	jiRDaZBkOFeHTpdBg8D1taVcdmLA22s=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 08/13] tools/xenstore: remove unused events list
Date: Thu, 30 Mar 2023 10:50:06 +0200
Message-Id: <20230330085011.9170-9-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330085011.9170-1-jgross@suse.com>
References: <20230330085011.9170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct watch contains an used struct list_head events. Remove it.

Signed-off-by: Juergen Gross <jgross@suse.com>
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


