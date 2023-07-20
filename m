Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC38475B20B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 17:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566655.885771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMVH1-0004KS-G8; Thu, 20 Jul 2023 15:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566655.885771; Thu, 20 Jul 2023 15:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMVH1-0004I2-DY; Thu, 20 Jul 2023 15:08:59 +0000
Received: by outflank-mailman (input) for mailman id 566655;
 Thu, 20 Jul 2023 15:08:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F2Z1=DG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qMVGz-0004Hu-Vk
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 15:08:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 587dd974-270f-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 17:08:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AC1AD21DB7;
 Thu, 20 Jul 2023 15:08:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E7C2138EC;
 Thu, 20 Jul 2023 15:08:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7FRYHQdOuWQ5DQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 20 Jul 2023 15:08:55 +0000
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
X-Inumbo-ID: 587dd974-270f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1689865735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Mm9z2RuOqoZtdeMxdTy+7Yv+GZAtLc3X7R1vOQMQKZ4=;
	b=ZQylcMZMlaFi9eMmPyvQ9pzmW2gmfRRXsOz/RF8Bx3pEtl5NtwbWgojPxn01SUGQnq07GS
	FT2Ozkm08TgNrIWINe0uxVtfAjHH/JK63sUjr02aEjLJ/ZpySD4w/YCKasmaaTdeNG8tuy
	K5HaV7BhqVIHRHMRZeZ+YtMysbeD8i0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/xenstore: fix get_spec_node()
Date: Thu, 20 Jul 2023 17:08:53 +0200
Message-Id: <20230720150853.31368-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
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
index a1d3047e48..790c403904 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1252,8 +1252,11 @@ static struct node *get_spec_node(struct connection *conn, const void *ctx,
 				  const char *name, char **canonical_name,
 				  unsigned int perm)
 {
-	if (name[0] == '@')
+	if (name[0] == '@') {
+		if (canonical_name)
+			*canonical_name = (char *)name;
 		return get_node(conn, ctx, name, perm);
+	}
 
 	return get_node_canonicalized(conn, ctx, name, canonical_name, perm);
 }
-- 
2.35.3


