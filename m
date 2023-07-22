Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4081975DB02
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 10:17:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567880.887366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN7nS-0001E0-Jp; Sat, 22 Jul 2023 08:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567880.887366; Sat, 22 Jul 2023 08:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN7nS-0001Aa-Gq; Sat, 22 Jul 2023 08:17:02 +0000
Received: by outflank-mailman (input) for mailman id 567880;
 Sat, 22 Jul 2023 08:17:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9aU5=DI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qN7nQ-0000sH-UM
 for xen-devel@lists.xenproject.org; Sat, 22 Jul 2023 08:17:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21ca3d1a-2868-11ee-b23a-6b7b168915f2;
 Sat, 22 Jul 2023 10:17:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4B89B1FD99;
 Sat, 22 Jul 2023 08:17:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1AFDA1346D;
 Sat, 22 Jul 2023 08:17:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MZknBXyQu2TGQQAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 22 Jul 2023 08:17:00 +0000
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
X-Inumbo-ID: 21ca3d1a-2868-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690013820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kd7YFY39EtpfbWA0cD3V6qSiR/q/58pWNd+JYYA4Oc4=;
	b=ZtA5qAX5FeosMEBzMZ5nABWpmR2ywfNbkBQO1fLkDoXxxGNrMgKUOhiUyU699pLl9UXpE5
	exGehh2Ll7i4My3c2/1/lNxnORpyife5CxojsEAiotB3l/SRkFM8sSeXPz7yRsPukAwyIc
	nzZpZ+TajwwMj8LzQRdfXv+OubI8/Ao=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 2/2] tools/xenstore: fix get_spec_node()
Date: Sat, 22 Jul 2023 10:16:46 +0200
Message-Id: <20230722081646.4136-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230722081646.4136-1-jgross@suse.com>
References: <20230722081646.4136-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case get_spec_node() is being called for a special node starting
with '@' it won't set *canonical_name. This can result in a crash of
xenstored due to dereferencing the uninitialized name in
fire_watches().

This is no security issue as it requires either a privileged caller or
ownership of the special node in question by an unprivileged caller
(which is questionable, as this would make the owner privileged in some
way).

Fixes: d6bb63924fc2 ("tools/xenstore: introduce dummy nodes for special watch paths")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 3d3c39bd70..749717ec25 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1253,8 +1253,11 @@ static struct node *get_spec_node(struct connection *conn, const void *ctx,
 				  const char *name, const char **canonical_name,
 				  unsigned int perm)
 {
-	if (name[0] == '@')
+	if (name[0] == '@') {
+		if (canonical_name)
+			*canonical_name = name;
 		return get_node(conn, ctx, name, perm);
+	}
 
 	return get_node_canonicalized(conn, ctx, name, canonical_name, perm);
 }
-- 
2.35.3


