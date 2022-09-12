Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20CD5B53B2
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 07:54:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405422.647888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXcOc-0007TQ-9u; Mon, 12 Sep 2022 05:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405422.647888; Mon, 12 Sep 2022 05:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXcOc-0007RJ-58; Mon, 12 Sep 2022 05:54:14 +0000
Received: by outflank-mailman (input) for mailman id 405422;
 Mon, 12 Sep 2022 05:54:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oXcOa-00078t-4d
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 05:54:12 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52a17d56-325f-11ed-a31c-8f8a9ae3403f;
 Mon, 12 Sep 2022 07:54:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B3E25227C6;
 Mon, 12 Sep 2022 05:54:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E504139BE;
 Mon, 12 Sep 2022 05:54:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HJuEGYLJHmMuawAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 12 Sep 2022 05:54:10 +0000
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
X-Inumbo-ID: 52a17d56-325f-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662962050; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ul1iFRnyaP+EjSwgFYHlOg+ezwj9WuwKzmQ6FnbRLy4=;
	b=ObwtyCGROAgkmoE9giDM1R+ryoK6UHuHq00FAOvQdcf+/7Kcq3LYYFsMD3OgNI7pZxuh8h
	cNs+ByOJlNBuI2UDlgaezEtW6bXLf0Xn+/YhDmNoLEpURH3UrT66OeeGAhoY1GJlecgOCR
	RMG6MXrMqlGp88Hr5SVcSgVXuoA9LYs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] xen/gnttab: reduce size of struct active_grant_entry
Date: Mon, 12 Sep 2022 07:53:56 +0200
Message-Id: <20220912055356.24064-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220912055356.24064-1-jgross@suse.com>
References: <20220912055356.24064-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The size of struct active_grant_entry for 64-bit builds is 40 or 48
bytes today (with or without NDEBUG).

It can easily be reduced by 8 bytes by replacing the trans_domain
pointer with the domid of the related domain. trans_domain is only ever
used for transitive grants, which last known user has been the old
Xenolinux branch of the Linux kernel.

This reduction will result in less memory usage and (for production
builds) in faster code, as indexing into the active_grant_entry array
will be much easier with an entry having a power-of-2 size.

The performance loss when using transitive grants shouldn't really
matter, given the probability that those aren't in use at all today.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/grant_table.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index fba329dcc2..8e4bbe3824 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -381,13 +381,13 @@ struct active_grant_entry {
 })
 
     domid_t       domid;  /* Domain being granted access.             */
+    domid_t       trans_domid; /* Domain granting access.             */
     unsigned int  start:15; /* For sub-page grants, the start offset
                                in the page.                           */
     bool          is_sub_page:1; /* True if this is a sub-page grant. */
     unsigned int  length:16; /* For sub-page grants, the length of the
                                 grant.                                */
     grant_ref_t   trans_gref;
-    struct domain *trans_domain;
     mfn_t         mfn;    /* Machine frame being granted.             */
 #ifndef NDEBUG
     gfn_t         gfn;    /* Guest's idea of the frame being granted. */
@@ -1095,7 +1095,7 @@ map_grant_ref(
             act->start = 0;
             act->length = PAGE_SIZE;
             act->is_sub_page = false;
-            act->trans_domain = rd;
+            act->trans_domid = rd->domain_id;
             act->trans_gref = ref;
         }
     }
@@ -2494,7 +2494,8 @@ release_grant_for_copy(
     else
     {
         status = &status_entry(rgt, gref);
-        td = act->trans_domain;
+        td = (act->trans_domid == rd->domain_id)
+             ? rd : domid_to_domain(act->trans_domid);
         trans_gref = act->trans_gref;
     }
 
@@ -2657,7 +2658,7 @@ acquire_grant_for_copy(
                           !mfn_eq(act->mfn, grant_mfn) ||
                           act->start != trans_page_off ||
                           act->length != trans_length ||
-                          act->trans_domain != td ||
+                          act->trans_domid != td->domain_id ||
                           act->trans_gref != trans_gref ||
                           !act->is_sub_page)) )
         {
@@ -2676,7 +2677,7 @@ acquire_grant_for_copy(
             act->domid = ldom;
             act->start = trans_page_off;
             act->length = trans_length;
-            act->trans_domain = td;
+            act->trans_domid = td->domain_id;
             act->trans_gref = trans_gref;
             act->mfn = grant_mfn;
             act_set_gfn(act, INVALID_GFN);
@@ -2738,7 +2739,7 @@ acquire_grant_for_copy(
             act->is_sub_page = is_sub_page;
             act->start = trans_page_off;
             act->length = trans_length;
-            act->trans_domain = td;
+            act->trans_domid = td->domain_id;
             act->trans_gref = trans_gref;
             act->mfn = grant_mfn;
         }
-- 
2.35.3


