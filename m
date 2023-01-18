Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A09671829
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 10:50:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480312.744661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI55V-00020C-9b; Wed, 18 Jan 2023 09:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480312.744661; Wed, 18 Jan 2023 09:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI55V-0001wk-4n; Wed, 18 Jan 2023 09:50:33 +0000
Received: by outflank-mailman (input) for mailman id 480312;
 Wed, 18 Jan 2023 09:50:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov7m=5P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pI55T-0001v4-PZ
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:50:31 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b4f7fbd-9715-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 10:50:30 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7B4463EA5D;
 Wed, 18 Jan 2023 09:50:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4A628139D2;
 Wed, 18 Jan 2023 09:50:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9jHlEObAx2NSQwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 18 Jan 2023 09:50:30 +0000
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
X-Inumbo-ID: 8b4f7fbd-9715-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674035430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pX5UiTuGTkIWUb6YtyjDTQ7IukPWx9sxAlYTbqTbJs0=;
	b=nkpQqbBeRExaXkv9iWcK+4haSg4IaIenagyUessqnl3AGVnzBHHRcu0QF/+0g0ad58FLrQ
	eaSbYvhatgEDEmTEkt/YCzUC/8HwYMKpYK7BnX7gS7rNewY9E1qbHs5A2LwrVQgxS7UXnG
	wla69kWD5kP8jKcImZKPF8lRyk4JdL0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 02/17] tools/xenstore: remove all watches when a domain has stopped
Date: Wed, 18 Jan 2023 10:50:01 +0100
Message-Id: <20230118095016.13091-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118095016.13091-1-jgross@suse.com>
References: <20230118095016.13091-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a domain has been released by Xen tools, remove all its
registered watches. This avoids sending watch events to the dead domain
when all the nodes related to it are being removed by the Xen tools.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V2:
- move call to do_release() (Julien Grall)
---
 tools/xenstore/xenstored_domain.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index aa86892fed..e669c89e94 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -740,6 +740,9 @@ int do_release(const void *ctx, struct connection *conn,
 	if (IS_ERR(domain))
 		return -PTR_ERR(domain);
 
+	/* Avoid triggering watch events when the domain's nodes are deleted. */
+	conn_delete_all_watches(domain->conn);
+
 	talloc_free(domain->conn);
 
 	send_ack(conn, XS_RELEASE);
-- 
2.35.3


