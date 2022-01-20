Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1178494D94
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 13:02:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259039.446727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAW9L-0007hu-0d; Thu, 20 Jan 2022 12:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259039.446727; Thu, 20 Jan 2022 12:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAW9K-0007d4-P5; Thu, 20 Jan 2022 12:02:42 +0000
Received: by outflank-mailman (input) for mailman id 259039;
 Thu, 20 Jan 2022 12:02:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fK7G=SE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nAW9J-0007ap-Fy
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 12:02:41 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd852dac-79e8-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 13:02:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AABF61F3A9;
 Thu, 20 Jan 2022 12:02:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7FCD613B51;
 Thu, 20 Jan 2022 12:02:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QCPyHV9P6WF5UwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 20 Jan 2022 12:02:39 +0000
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
X-Inumbo-ID: dd852dac-79e8-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642680159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CfrxD3KienyM7pfSnYwZtHjuwO56/KVSIOkTvQ20tA0=;
	b=QsjSp3f9qxpoAl3MSrZV4OTsuhqapl0c2HpKntCjxdFTn1PZ7lnU0YaXx96zA+kqRG7su4
	jf8uXkkoxpzfUZdqALbbB2Txco0cFFysTIojS6pqVf6gq6BN8Nyuwk3wCpW+zYxCT/gEjZ
	MBxmFlEqISGoW3GWPXw/W0Zlh5tLack=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 2/3] tools/xenstore: fix hashtable_expand() zeroing new area
Date: Thu, 20 Jan 2022 13:02:35 +0100
Message-Id: <20220120120236.13826-3-jgross@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220120120236.13826-1-jgross@suse.com>
References: <20220120120236.13826-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When realloc()ing the hashtable for expanding it, zero out all the new
bytes at the end of the table, not only one byte for each new element.

Fixes: 186f0e02a1c ("Added hashtable implementation")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
This might be a backport candidate
---
 tools/xenstore/hashtable.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index 39fb3ed338..6ac336eff1 100644
--- a/tools/xenstore/hashtable.c
+++ b/tools/xenstore/hashtable.c
@@ -136,7 +136,8 @@ hashtable_expand(struct hashtable *h)
                    realloc(h->table, newsize * sizeof(struct entry *));
         if (NULL == newtable) { (h->primeindex)--; return 0; }
         h->table = newtable;
-        memset(newtable[h->tablelength], 0, newsize - h->tablelength);
+        memset(newtable + h->tablelength, 0,
+               (newsize - h->tablelength) * sizeof(*newtable));
         for (i = 0; i < h->tablelength; i++) {
             for (pE = &(newtable[i]), e = *pE; e != NULL; e = *pE) {
                 index = indexFor(newsize,e->h);
-- 
2.31.1


