Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D8274CDD1
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 09:00:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560965.877194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIksv-00074f-Nq; Mon, 10 Jul 2023 07:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560965.877194; Mon, 10 Jul 2023 07:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIksv-00072D-J3; Mon, 10 Jul 2023 07:00:37 +0000
Received: by outflank-mailman (input) for mailman id 560965;
 Mon, 10 Jul 2023 07:00:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xcmr=C4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qIksu-0002xd-DS
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 07:00:36 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 782b6cab-1eef-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 09:00:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A47761F88C;
 Mon, 10 Jul 2023 07:00:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 729FE1361C;
 Mon, 10 Jul 2023 07:00:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hJ2OGpOsq2T3YgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 10 Jul 2023 07:00:35 +0000
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
X-Inumbo-ID: 782b6cab-1eef-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688972435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uX1UtLDeHIuSncID7ztx+3m5/A25DEYmNmT0JgfiUNQ=;
	b=RG1r3QY6qqWMTTwHNomt9UbriFqZ9RasnX1HCWxp2EaIpb3ej32ug23RE7FJeCSD5KC2ok
	IxeuEL0zn9SlA/F5I/Hgfa2EwftmL3B7yBGU5euAyt+27vTaqbygBdN5ttclA+MXi2sd55
	kr+fA3fvd1Obh7T1f2VVjIqJav1Oeqg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 08/18] tools/xenstore: make hashtable key and value parameters const
Date: Mon, 10 Jul 2023 08:59:37 +0200
Message-Id: <20230710065947.4201-9-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230710065947.4201-1-jgross@suse.com>
References: <20230710065947.4201-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The key is never modified by hashtable code, so it should be marked
as const.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/hashtable.c | 5 +++--
 tools/xenstore/hashtable.h | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index 11f6bf8f15..9daddd9782 100644
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
+int hashtable_add(struct hashtable *h, const void *k, void *v)
 {
     /* This method allows duplicate keys - but they shouldn't be used */
     unsigned int index;
diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
index 5a2cc4a4be..792f6cda7b 100644
--- a/tools/xenstore/hashtable.h
+++ b/tools/xenstore/hashtable.h
@@ -48,8 +48,8 @@ create_hashtable(const void *ctx, const char *name,
  * If in doubt, remove before insert.
  */
 
-int 
-hashtable_add(struct hashtable *h, void *k, void *v);
+int
+hashtable_add(struct hashtable *h, const void *k, void *v);
 
 /*****************************************************************************
  * hashtable_search
-- 
2.35.3


