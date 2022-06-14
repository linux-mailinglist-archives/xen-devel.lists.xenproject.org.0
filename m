Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF62054B4B5
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 17:32:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349153.575335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o18WM-0000y8-65; Tue, 14 Jun 2022 15:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349153.575335; Tue, 14 Jun 2022 15:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o18WM-0000vV-35; Tue, 14 Jun 2022 15:31:58 +0000
Received: by outflank-mailman (input) for mailman id 349153;
 Tue, 14 Jun 2022 15:31:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qNKJ=WV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o18WL-0000vP-32
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 15:31:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f3d3e40-ebf7-11ec-a26a-b96bd03d9e80;
 Tue, 14 Jun 2022 17:31:55 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 53FF821B9F;
 Tue, 14 Jun 2022 15:31:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 21B411361C;
 Tue, 14 Jun 2022 15:31:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ipcIBuupqGKrYQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Jun 2022 15:31:55 +0000
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
X-Inumbo-ID: 1f3d3e40-ebf7-11ec-a26a-b96bd03d9e80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655220715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v3nOr0/TQ7TPym3sBGUMzU6nbzZrs0YvMJej6BkqOj0=;
	b=EG9+QAEDInNklGzH5J+3OEpiM7Vn53KhK5AKoNZNj7+rB+bo4Yu5gwlSCtiws34BfFYxWL
	P+WI1H1dspbtwututv0Tih0CgsGF3LRUssxiaZdL3OvzcxrPH/jTQojEPZNPQk7iw72iGk
	mmEjGX/s5zNgpnibKfs8LxUKk7cg3z0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/xenstore: simplify loop handling connection I/O
Date: Tue, 14 Jun 2022 17:31:52 +0200
Message-Id: <20220614153152.25919-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The loop handling input and output of connections of xenstored is
open coding list_for_each_entry_safe() in an incredibly complicated
way.

Use list_for_each_entry_safe() instead, making it much more clear how
the code is working.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 6e4022e5da..fa733e714e 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2368,16 +2368,8 @@ int main(int argc, char *argv[])
 			}
 		}
 
-		next = list_entry(connections.next, typeof(*conn), list);
-		if (&next->list != &connections)
-			talloc_increase_ref_count(next);
-		while (&next->list != &connections) {
-			conn = next;
-
-			next = list_entry(conn->list.next,
-					  typeof(*conn), list);
-			if (&next->list != &connections)
-				talloc_increase_ref_count(next);
+		list_for_each_entry_safe(conn, next, &connections, list) {
+			talloc_increase_ref_count(conn);
 
 			if (conn_can_read(conn))
 				handle_input(conn);
-- 
2.35.3


