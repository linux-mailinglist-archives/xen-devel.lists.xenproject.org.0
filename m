Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E147F4961EF
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 16:21:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259388.447687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAvjC-0003Le-KI; Fri, 21 Jan 2022 15:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259388.447687; Fri, 21 Jan 2022 15:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAvjC-0003Jj-EE; Fri, 21 Jan 2022 15:21:26 +0000
Received: by outflank-mailman (input) for mailman id 259388;
 Fri, 21 Jan 2022 15:21:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CqVI=SF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nAvjA-0003JS-I1
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 15:21:24 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cae5fff1-7acd-11ec-bc18-3156f6d857e4;
 Fri, 21 Jan 2022 16:21:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 32F521F3CA;
 Fri, 21 Jan 2022 15:21:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 07C1E139FE;
 Fri, 21 Jan 2022 15:21:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UOyLAHPP6mFpAgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 21 Jan 2022 15:21:23 +0000
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
X-Inumbo-ID: cae5fff1-7acd-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642778483; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VXZ4prMIpVFrrFMIWdWQrhRMeB3VhjvcCXF+R1jtDDI=;
	b=K0RVKNNxDd6j45+dZrVhb2dnyL5frrMrFuBynomw1azt35e1z2ocyBv2UiBzfA05hQZnwC
	Y0fTJuMM8o/WBI2tzl5uVdOLkVfY58oZXALVpbi98B5xWYeFignI4JiBQbzobXm6Zm2ALL
	fWa49cqpclhC9Gwsrw2//JT2GQWtAyU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 2/3] tools/xenstore: fix hashtable_expand() zeroing new area
Date: Fri, 21 Jan 2022 16:21:19 +0100
Message-Id: <20220121152120.23160-3-jgross@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121152120.23160-1-jgross@suse.com>
References: <20220121152120.23160-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When realloc()ing the hashtable for expanding it, zero out all the new
bytes at the end of the table, not only one byte for each new element.

Fixes: 186f0e02a1c ("Added hashtable implementation")
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
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


