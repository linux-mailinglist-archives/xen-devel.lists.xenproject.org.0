Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 216B066D966
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 10:11:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479128.742778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHi0M-0007hL-19; Tue, 17 Jan 2023 09:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479128.742778; Tue, 17 Jan 2023 09:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHi0L-0007eJ-Tw; Tue, 17 Jan 2023 09:11:41 +0000
Received: by outflank-mailman (input) for mailman id 479128;
 Tue, 17 Jan 2023 09:11:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uRIs=5O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pHi0K-0007bs-8P
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 09:11:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2ad1d0b-9646-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 10:11:38 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1399E38216;
 Tue, 17 Jan 2023 09:11:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D4A641390C;
 Tue, 17 Jan 2023 09:11:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0wGCMklmxmPrbwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 17 Jan 2023 09:11:37 +0000
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
X-Inumbo-ID: f2ad1d0b-9646-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673946698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pX5UiTuGTkIWUb6YtyjDTQ7IukPWx9sxAlYTbqTbJs0=;
	b=kx+Wz/gVoOvbmptZE+o5NRjQpL0o8XEFpo0rhNTFM4XenVeTBueyxVmYeNO452JN4anBW6
	PSaAVxieTZOABJCqPQ/TgEWzIvOYHswC4tzs3hMxHixMzjxaHy0lchG5RrEUfFsRsGiYnH
	JYtEgsnEow0RrybXY/9P1+o0+Ro53p0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 02/17] tools/xenstore: remove all watches when a domain has stopped
Date: Tue, 17 Jan 2023 10:11:09 +0100
Message-Id: <20230117091124.22170-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230117091124.22170-1-jgross@suse.com>
References: <20230117091124.22170-1-jgross@suse.com>
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


