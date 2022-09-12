Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE935B53B1
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 07:54:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405421.647876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXcOY-0007CL-WE; Mon, 12 Sep 2022 05:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405421.647876; Mon, 12 Sep 2022 05:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXcOY-00079f-Sy; Mon, 12 Sep 2022 05:54:10 +0000
Received: by outflank-mailman (input) for mailman id 405421;
 Mon, 12 Sep 2022 05:54:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oXcOW-00078t-Sn
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 05:54:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f5a542f-325f-11ed-a31c-8f8a9ae3403f;
 Mon, 12 Sep 2022 07:54:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0A9451F98E;
 Mon, 12 Sep 2022 05:54:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C157D139BE;
 Mon, 12 Sep 2022 05:54:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kGLqLXzJHmMnawAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 12 Sep 2022 05:54:04 +0000
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
X-Inumbo-ID: 4f5a542f-325f-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662962045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uD7RrO3aPkckiRSiv33Wtr4oGXbDCkJ2Ff62zi7V5Uc=;
	b=DTei/9XGCYT+qquqRDTge8bX7duA49Ou/AzSMJGkbtgYHWtnZM5j/ZxSN+aOdyNmUsjbWa
	FnmMZid9O9cf1zIubdXfUiBnITQa6YptuGZPYEs1+cfoZgkv+79g57F0c+xsY00MtnQfU5
	U6HTD0qaprG3CDvZhp8Ox/pox03S/ng=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] xen: add domid_to_domain() helper
Date: Mon, 12 Sep 2022 07:53:55 +0200
Message-Id: <20220912055356.24064-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220912055356.24064-1-jgross@suse.com>
References: <20220912055356.24064-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a helper domid_to_domain() returning the struct domain pointer for
a domain give by its domid and which is known not being able to be
released (its reference count isn't incremented and no rcu_lock_domain()
is called for it).

In order to simplify coding add an internal helper for doing the lookup
and call that from the new function and similar functions.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/domain.c     | 54 ++++++++++++++++++++++++++---------------
 xen/include/xen/sched.h |  4 +++
 2 files changed, 38 insertions(+), 20 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index c23f449451..2b1866ea42 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -832,25 +832,32 @@ out:
     return 0;
 }
 
-
-struct domain *get_domain_by_id(domid_t dom)
+/* rcu_read_lock(&domlist_read_lock) must be held. */
+static struct domain *domid_2_domain(domid_t dom)
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
+    d = domid_2_domain(dom);
+    if ( d && unlikely(!get_domain(d)) )
+        d = NULL;
+
     rcu_read_unlock(&domlist_read_lock);
 
     return d;
@@ -859,20 +866,27 @@ struct domain *get_domain_by_id(domid_t dom)
 
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
+    d = domid_2_domain(dom);
+    if ( d )
+        rcu_lock_domain(d);
+
+    rcu_read_unlock(&domlist_read_lock);
+
+    return d;
+}
+
+/* Use only if struct domain is known to stay allocated! */
+struct domain *domid_to_domain(domid_t dom)
+{
+    struct domain *d;
+
+    rcu_read_lock(&domlist_read_lock);
+
+    d = domid_2_domain(dom);
 
     rcu_read_unlock(&domlist_read_lock);
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 557b3229f6..f4c4d3a60f 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -737,8 +737,12 @@ static inline struct domain *rcu_lock_current_domain(void)
     return /*rcu_lock_domain*/(current->domain);
 }
 
+/* Get struct domain AND increase ref-count of domain. */
 struct domain *get_domain_by_id(domid_t dom);
 
+/* Get struct domain known to stay allocated. */
+struct domain *domid_to_domain(domid_t dom);
+
 struct domain *get_pg_owner(domid_t domid);
 
 static inline void put_pg_owner(struct domain *pg_owner)
-- 
2.35.3


