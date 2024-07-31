Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18067942DB0
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 14:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768521.1179350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ83y-0007eF-9h; Wed, 31 Jul 2024 12:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768521.1179350; Wed, 31 Jul 2024 12:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ83y-0007cl-73; Wed, 31 Jul 2024 12:04:14 +0000
Received: by outflank-mailman (input) for mailman id 768521;
 Wed, 31 Jul 2024 12:04:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F/qb=O7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sZ83w-0007cf-Ti
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 12:04:12 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc9007d1-4f34-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 14:04:06 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ef248ab2aeso84862501fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 05:04:11 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb98dbsm760514766b.216.2024.07.31.05.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 05:04:09 -0700 (PDT)
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
X-Inumbo-ID: fc9007d1-4f34-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722427450; x=1723032250; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X0gbgRWc2cl9Mm9yDqSZuShUHfl8oIG76nyaAhdJolY=;
        b=r3GXqEAtBCFcibr9O43xBuWIQwvyk7cnJ7wVCSIQk1NWhru8FTZRck3EBs+0b/wfNI
         bgtAizIqxihfXH9+nZ9xcp7jOCh4gsZ6u59raJznEnav4zmHGURkaXxyS5Ir/JuacOwU
         vjdmrKHCO/xIjb1jxApp/11lKLxshzZaUfCUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722427450; x=1723032250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X0gbgRWc2cl9Mm9yDqSZuShUHfl8oIG76nyaAhdJolY=;
        b=ZpXT+bXUHSV8vqtHZwH158GoZFHnsXDL+gtp9SUFCyeB/4HNtiouUMVr8UVrfNYcVy
         kCFw1EWBHjUDhNcLtv2tbxJ/wYLjF4ACQLBqfLxB/x9rFgXWGGivlDWnmlY8AYDMVLju
         yhM+I5WIgF9fChZVsQycaw55Fc7i80cdoBZIYctDPMgBUvSn4GWpJIDWGInitB+2x7zT
         eMN5ezyyNf1APu0Wxbd5nCPKkVNpSxA9EMeBZfpopCdla+trNmGL5brCGqvD+kri0wDm
         wFyEzQ1NwkHUfj6hCgJtF1klHUDE3jRIgNY23MKHWqsXcVOLYuFqsZbj5aet46/sYiny
         ZvUA==
X-Gm-Message-State: AOJu0YxoaSODGfi8H+pT9hZYigWnv1HycEUns4Og1wKhspD8kHtDHIjK
	/Mk7yqXrfhpfXqQFqvljhSTbY9Eo7pDCeZwioAuH9zJ+Ek7/+R0QBnRR07mQvnOu9oMJ6QMaJpt
	A
X-Google-Smtp-Source: AGHT+IHfjkJFEQUtisi7OhG3DBCoi73hFYBAuUD5RurOriQYn7NUH6qhEhW43aB3N+amHwVk2MSDVw==
X-Received: by 2002:a2e:8250:0:b0:2ef:2226:2317 with SMTP id 38308e7fff4ca-2f12ee12fe6mr120989151fa.20.1722427449595;
        Wed, 31 Jul 2024 05:04:09 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] xen/domain: Factor domlist_{insert,remove}() out of domain_{create,destroy}()
Date: Wed, 31 Jul 2024 13:04:06 +0100
Message-Id: <20240731120406.3429430-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are opencoded linked list and hashtable manipulations.  Factor them out
into static inline helpers, and discuss the consequence for the domain.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>

Calling domain_hash a hash is rather disingenuous... It's technically true,
but it has terrible scaling.
---
 xen/common/domain.c | 80 +++++++++++++++++++++++++++++++--------------
 1 file changed, 55 insertions(+), 25 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 256660473861..fc0a56673449 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -64,6 +64,57 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
 static struct domain *domain_hash[DOMAIN_HASH_SIZE];
 struct domain *domain_list;
 
+/*
+ * Insert a domain into the domlist/hash.  This allows the domain to be looked
+ * up by domid, and therefore to be the subject of hypercalls/etc.
+ */
+static void domlist_insert(struct domain *d)
+{
+    struct domain **pd;
+
+    spin_lock(&domlist_update_lock);
+
+    /* domain_list is maintained in domid order. */
+    pd = &domain_list;
+    for ( ; *pd != NULL; pd = &(*pd)->next_in_list )
+        if ( (*pd)->domain_id > d->domain_id )
+            break;
+
+    d->next_in_list = *pd;
+    d->next_in_hashbucket = domain_hash[DOMAIN_HASH(d->domain_id)];
+    rcu_assign_pointer(*pd, d);
+    rcu_assign_pointer(domain_hash[DOMAIN_HASH(d->domain_id)], d);
+
+    spin_unlock(&domlist_update_lock);
+}
+
+/*
+ * Remove a domain from the domlist/hash.  This means the domain can no longer
+ * be looked up by domid, and therefore can no longer be the subject of
+ * *subsequent* hypercalls/etc.  In-progress hypercalls/etc can still operate
+ * on the domain.
+ */
+static void domlist_remove(struct domain *d)
+{
+    struct domain **pd = &domain_list;
+
+    spin_lock(&domlist_update_lock);
+
+    pd = &domain_list;
+    while ( *pd != d )
+        pd = &(*pd)->next_in_list;
+
+    rcu_assign_pointer(*pd, d->next_in_list);
+
+    pd = &domain_hash[DOMAIN_HASH(d->domain_id)];
+    while ( *pd != d )
+        pd = &(*pd)->next_in_hashbucket;
+
+    rcu_assign_pointer(*pd, d->next_in_hashbucket);
+
+    spin_unlock(&domlist_update_lock);
+}
+
 struct domain *hardware_domain __read_mostly;
 
 #ifdef CONFIG_LATE_HWDOM
@@ -589,7 +640,7 @@ struct domain *domain_create(domid_t domid,
                              struct xen_domctl_createdomain *config,
                              unsigned int flags)
 {
-    struct domain *d, **pd, *old_hwdom = NULL;
+    struct domain *d, *old_hwdom = NULL;
     enum { INIT_watchdog = 1u<<1,
            INIT_evtchn = 1u<<3, INIT_gnttab = 1u<<4, INIT_arch = 1u<<5 };
     int err, init_status = 0;
@@ -758,17 +809,7 @@ struct domain *domain_create(domid_t domid,
      * Must not fail beyond this point, as our caller doesn't know whether
      * the domain has been entered into domain_list or not.
      */
-
-    spin_lock(&domlist_update_lock);
-    pd = &domain_list; /* NB. domain_list maintained in order of domid. */
-    for ( pd = &domain_list; *pd != NULL; pd = &(*pd)->next_in_list )
-        if ( (*pd)->domain_id > d->domain_id )
-            break;
-    d->next_in_list = *pd;
-    d->next_in_hashbucket = domain_hash[DOMAIN_HASH(domid)];
-    rcu_assign_pointer(*pd, d);
-    rcu_assign_pointer(domain_hash[DOMAIN_HASH(domid)], d);
-    spin_unlock(&domlist_update_lock);
+    domlist_insert(d);
 
     memcpy(d->handle, config->handle, sizeof(d->handle));
 
@@ -1232,8 +1273,6 @@ static void cf_check complete_domain_destroy(struct rcu_head *head)
 /* Release resources belonging to task @p. */
 void domain_destroy(struct domain *d)
 {
-    struct domain **pd;
-
     BUG_ON(!d->is_dying);
 
     /* May be already destroyed, or get_domain() can race us. */
@@ -1242,17 +1281,8 @@ void domain_destroy(struct domain *d)
 
     TRACE_TIME(TRC_DOM0_DOM_REM, d->domain_id);
 
-    /* Delete from task list and task hashtable. */
-    spin_lock(&domlist_update_lock);
-    pd = &domain_list;
-    while ( *pd != d ) 
-        pd = &(*pd)->next_in_list;
-    rcu_assign_pointer(*pd, d->next_in_list);
-    pd = &domain_hash[DOMAIN_HASH(d->domain_id)];
-    while ( *pd != d ) 
-        pd = &(*pd)->next_in_hashbucket;
-    rcu_assign_pointer(*pd, d->next_in_hashbucket);
-    spin_unlock(&domlist_update_lock);
+    /* Remove from the domlist/hash. */
+    domlist_remove(d);
 
     /* Schedule RCU asynchronous completion of domain destroy. */
     call_rcu(&d->rcu, complete_domain_destroy);

base-commit: 561cba38ff551383a628dc93e64ab0691cfc92bf
-- 
2.39.2


