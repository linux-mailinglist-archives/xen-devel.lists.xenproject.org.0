Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BA55B6ABD
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 11:33:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406232.648631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY2I1-0006Qg-2J; Tue, 13 Sep 2022 09:33:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406232.648631; Tue, 13 Sep 2022 09:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY2I0-0006N5-Ux; Tue, 13 Sep 2022 09:33:08 +0000
Received: by outflank-mailman (input) for mailman id 406232;
 Tue, 13 Sep 2022 09:33:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQ52=ZQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oY2Hz-0006MX-KI
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 09:33:07 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 125de643-3347-11ed-a31c-8f8a9ae3403f;
 Tue, 13 Sep 2022 11:33:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 267C95C0F1;
 Tue, 13 Sep 2022 09:33:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E2EB513AB5;
 Tue, 13 Sep 2022 09:33:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id z1kxNlFOIGN6MwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 13 Sep 2022 09:33:05 +0000
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
X-Inumbo-ID: 125de643-3347-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1663061586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lx6c3891hAGbDFpKqMPhKGwIWWdvpb5PtucMX1OQj20=;
	b=V7FRTGGCSfXDd7GA62lTqPCmja654fPfHi28hgx4JJ3X0S/jQGkHafuDdBVTXNuLwo/ZKI
	B9/971Z1/pBw/0zNmddvQnkQWHnJIRQPARDeCblnfP33OqBzQOs+kP7y2sTWNyVzkgNh45
	QebKl15vpmHmg55MonKJX+gey77f+tE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/2] xen: add knownalive_domain_from_domid() helper
Date: Tue, 13 Sep 2022 11:32:55 +0200
Message-Id: <20220913093256.22880-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220913093256.22880-1-jgross@suse.com>
References: <20220913093256.22880-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a helper knownalive_domain_from_domid() returning the struct domain
pointer for a domain give by its domid and which is known not being
able to be released (its reference count isn't incremented and no
rcu_lock_domain() is called for it).

In order to simplify coding add an internal helper for doing the lookup
and call that from the new function and similar functions.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- rename helper to knownalive_domain_from_domid() (Jan Beulich)
- enhance comment in header (Jan Beulich)
- rename internal helper (Julien Grall)
---
 xen/common/domain.c     | 53 +++++++++++++++++++++++++----------------
 xen/include/xen/sched.h |  4 ++++
 2 files changed, 37 insertions(+), 20 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8dd6cd5a8f..35e0dc5139 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -835,25 +835,32 @@ out:
     return 0;
 }
 
-
-struct domain *get_domain_by_id(domid_t dom)
+/* rcu_read_lock(&domlist_read_lock) must be held. */
+static struct domain *domid_to_domain(domid_t dom)
 {
     struct domain *d;
 
-    rcu_read_lock(&domlist_read_lock);
-
     for ( d = rcu_dereference(domain_hash[DOMAIN_HASH(dom)]);
           d != NULL;
           d = rcu_dereference(d->next_in_hashbucket) )
     {
         if ( d->domain_id == dom )
-        {
-            if ( unlikely(!get_domain(d)) )
-                d = NULL;
-            break;
-        }
+            return d;
     }
 
+    return NULL;
+}
+
+struct domain *get_domain_by_id(domid_t dom)
+{
+    struct domain *d;
+
+    rcu_read_lock(&domlist_read_lock);
+
+    d = domid_to_domain(dom);
+    if ( d && unlikely(!get_domain(d)) )
+        d = NULL;
+
     rcu_read_unlock(&domlist_read_lock);
 
     return d;
@@ -862,20 +869,26 @@ struct domain *get_domain_by_id(domid_t dom)
 
 struct domain *rcu_lock_domain_by_id(domid_t dom)
 {
-    struct domain *d = NULL;
+    struct domain *d;
 
     rcu_read_lock(&domlist_read_lock);
 
-    for ( d = rcu_dereference(domain_hash[DOMAIN_HASH(dom)]);
-          d != NULL;
-          d = rcu_dereference(d->next_in_hashbucket) )
-    {
-        if ( d->domain_id == dom )
-        {
-            rcu_lock_domain(d);
-            break;
-        }
-    }
+    d = domid_to_domain(dom);
+    if ( d )
+        rcu_lock_domain(d);
+
+    rcu_read_unlock(&domlist_read_lock);
+
+    return d;
+}
+
+struct domain *knownalive_domain_from_domid(domid_t dom)
+{
+    struct domain *d;
+
+    rcu_read_lock(&domlist_read_lock);
+
+    d = domid_to_domain(dom);
 
     rcu_read_unlock(&domlist_read_lock);
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 557b3229f6..9e9c3d834b 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -737,8 +737,12 @@ static inline struct domain *rcu_lock_current_domain(void)
     return /*rcu_lock_domain*/(current->domain);
 }
 
+/* Get struct domain AND increase ref-count of domain. */
 struct domain *get_domain_by_id(domid_t dom);
 
+/* Get struct domain known to have reference held or being RCU-locked. */
+struct domain *knownalive_domain_from_domid(domid_t dom);
+
 struct domain *get_pg_owner(domid_t domid);
 
 static inline void put_pg_owner(struct domain *pg_owner)
-- 
2.35.3


