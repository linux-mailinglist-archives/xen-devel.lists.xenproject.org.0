Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CED075F47A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 13:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568760.888716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtQ2-0000Ng-11; Mon, 24 Jul 2023 11:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568760.888716; Mon, 24 Jul 2023 11:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtQ1-0000LJ-UR; Mon, 24 Jul 2023 11:08:01 +0000
Received: by outflank-mailman (input) for mailman id 568760;
 Mon, 24 Jul 2023 11:08:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVkC=DK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qNtLl-0008WC-0G
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 11:03:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc13b991-2a11-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 13:03:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3F31522971;
 Mon, 24 Jul 2023 11:03:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1404513476;
 Mon, 24 Jul 2023 11:03:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5EluA4davmSdYQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Jul 2023 11:03:35 +0000
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
X-Inumbo-ID: bc13b991-2a11-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690196615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=siTlKvWMR/RT4S0FnCgR+ZpOvEYZZwpHnARxR3tmw/4=;
	b=GhkPau+GxIQNm74gzCxgvTBrLWE2MgNHxieKxWzLiPjFgsNIFEOgi7RytaTF7pPUsSfRza
	DCLsvzH7D+ukWicqelez/plpzkItVdogW46c3rM6PBa4p9wCdzdgJCRobpbNsqNz51o33/
	ETy0NnKk3qhcCynU9B/BCCLdpaAS/hk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 08/25] tools/xenstore: make hashtable key and value parameters const
Date: Mon, 24 Jul 2023 13:02:30 +0200
Message-Id: <20230724110247.10520-9-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230724110247.10520-1-jgross@suse.com>
References: <20230724110247.10520-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The key and value are never modified by hashtable code, so they should
be marked as const.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- make value const, too.
---
 tools/xenstore/hashtable.c | 7 ++++---
 tools/xenstore/hashtable.h | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index 11f6bf8f15..670dc01003 100644
--- a/tools/xenstore/hashtable.c
+++ b/tools/xenstore/hashtable.c
@@ -11,7 +11,8 @@
 
 struct entry
 {
-    void *k, *v;
+    const void *k;
+    void *v;
     unsigned int h;
     struct entry *next;
 };
@@ -140,7 +141,7 @@ static int hashtable_expand(struct hashtable *h)
     return 0;
 }
 
-int hashtable_add(struct hashtable *h, void *k, void *v)
+int hashtable_add(struct hashtable *h, const void *k, const void *v)
 {
     /* This method allows duplicate keys - but they shouldn't be used */
     unsigned int index;
@@ -164,7 +165,7 @@ int hashtable_add(struct hashtable *h, void *k, void *v)
     e->k = k;
     if (h->flags & HASHTABLE_FREE_KEY)
         talloc_steal(e, k);
-    e->v = v;
+    e->v = (void *)v;
     if (h->flags & HASHTABLE_FREE_VALUE)
         talloc_steal(e, v);
     e->next = h->table[index];
diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
index 5a2cc4a4be..1da3af2648 100644
--- a/tools/xenstore/hashtable.h
+++ b/tools/xenstore/hashtable.h
@@ -48,8 +48,8 @@ create_hashtable(const void *ctx, const char *name,
  * If in doubt, remove before insert.
  */
 
-int 
-hashtable_add(struct hashtable *h, void *k, void *v);
+int
+hashtable_add(struct hashtable *h, const void *k, const void *v);
 
 /*****************************************************************************
  * hashtable_search
-- 
2.35.3


