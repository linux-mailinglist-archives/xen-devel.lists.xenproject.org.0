Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6839431E0
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 16:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768842.1179725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZAB2-0002by-5r; Wed, 31 Jul 2024 14:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768842.1179725; Wed, 31 Jul 2024 14:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZAB2-0002Za-3E; Wed, 31 Jul 2024 14:19:40 +0000
Received: by outflank-mailman (input) for mailman id 768842;
 Wed, 31 Jul 2024 14:19:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F/qb=O7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sZAB0-0002ZU-Bb
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 14:19:38 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eade39c2-4f47-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 16:19:37 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52f04c29588so10301237e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 07:19:37 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb9d9asm777498066b.219.2024.07.31.07.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 07:19:35 -0700 (PDT)
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
X-Inumbo-ID: eade39c2-4f47-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722435576; x=1723040376; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijyBmU4maUrCxHoQhqzhCbe9tU7fdMzzUQEWgOmkkew=;
        b=hs1D0avyhKZm9g6iVxhGBmvA2AosnBodnNKFaHQotsCeoyGh7aejXsoidLua8rXmWe
         +eX32vZuqyGH4nN0FzpRgC2pKx35EM98Y8mgK9LitH5GhGvWbvsTPRMC0r4azddK1vDh
         3/QETM0bS7JnXWkFS91D3MakYS3lh4/jBOg9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722435576; x=1723040376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijyBmU4maUrCxHoQhqzhCbe9tU7fdMzzUQEWgOmkkew=;
        b=KEztMfh8QT4rbwEWwXbg4CxRo3LjyAjaYU7iOfDhESOwydBkTgykCLxy4aYSz1JWfD
         MchW2gnx23aUhaBUMtGV3utF8iPqwSmrWcwWg4u+EtNN8ei6ttitwPbPoYsRsGq6OkPq
         FWSc3etaqXoNte0HmlNXBLfYReaplRj4shuX++I95TzF7GIToVxi90iSLHhm85/8UIkZ
         v6WMU6Ao+h03cawjEQ7mvZvOboULRVTB56po9Dz+21iPR1WgbbSp7KYcj2JnvSP84IOI
         ObC8EY2R6xuOSpJinuprkCTKT/BgWJnCzEbsIAQA57vF1wA0JueOTkG32VqxLI9y0kCF
         vsHg==
X-Gm-Message-State: AOJu0YwTt/IPpgeFCN7IovNppJxanZcT9gN1qWSAOYDFWi4sFSs6mgTw
	K14vKowQqZyjh4mjvItdivFIBsr56IEzOI+dWt0Kp+4RCq3dq00JhAdBQLxgxXqdqUnX1HaHQZ2
	1
X-Google-Smtp-Source: AGHT+IGFdqdMXhw7v1J/I5gpbqpAMPq61s9CnEhfx/SKAF32NJS7dslXYaiRUGp5xhfoHyHtJzVb4Q==
X-Received: by 2002:ac2:58ed:0:b0:52e:a008:8f55 with SMTP id 2adb3069b0e04-5309b2c39c5mr8994722e87.41.1722435576448;
        Wed, 31 Jul 2024 07:19:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v2] xen/domain: Factor domlist_{insert,remove}() out of domain_{create,destroy}()
Date: Wed, 31 Jul 2024 15:19:33 +0100
Message-Id: <20240731141933.3488244-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731120406.3429430-1-andrew.cooper3@citrix.com>
References: <20240731120406.3429430-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are opencoded linked list and hashtable manipulations.  Factor them out
into static inline helpers, and discuss the consequence for the domain.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>

v2:
 * Factor out the hash bucket calculation
 * Drop double initilaisation of pd in domlist_remove()
---
 xen/common/domain.c | 81 +++++++++++++++++++++++++++++++--------------
 1 file changed, 56 insertions(+), 25 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 256660473861..8d8f40ccb245 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -64,6 +64,58 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
 static struct domain *domain_hash[DOMAIN_HASH_SIZE];
 struct domain *domain_list;
 
+/*
+ * Insert a domain into the domlist/hash.  This allows the domain to be looked
+ * up by domid, and therefore to be the subject of hypercalls/etc.
+ */
+static void domlist_insert(struct domain *d)
+{
+    struct domain **pd, *bucket;
+
+    spin_lock(&domlist_update_lock);
+
+    /* domain_list is maintained in domid order. */
+    for ( pd = &domain_list; *pd != NULL; pd = &(*pd)->next_in_list )
+        if ( (*pd)->domain_id > d->domain_id )
+            break;
+
+    bucket = domain_hash[DOMAIN_HASH(d->domain_id)];
+
+    d->next_in_list = *pd;
+    d->next_in_hashbucket = bucket;
+    rcu_assign_pointer(*pd, d);
+    rcu_assign_pointer(bucket, d);
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
+    struct domain **pd;
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
@@ -589,7 +641,7 @@ struct domain *domain_create(domid_t domid,
                              struct xen_domctl_createdomain *config,
                              unsigned int flags)
 {
-    struct domain *d, **pd, *old_hwdom = NULL;
+    struct domain *d, *old_hwdom = NULL;
     enum { INIT_watchdog = 1u<<1,
            INIT_evtchn = 1u<<3, INIT_gnttab = 1u<<4, INIT_arch = 1u<<5 };
     int err, init_status = 0;
@@ -758,17 +810,7 @@ struct domain *domain_create(domid_t domid,
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
 
@@ -1232,8 +1274,6 @@ static void cf_check complete_domain_destroy(struct rcu_head *head)
 /* Release resources belonging to task @p. */
 void domain_destroy(struct domain *d)
 {
-    struct domain **pd;
-
     BUG_ON(!d->is_dying);
 
     /* May be already destroyed, or get_domain() can race us. */
@@ -1242,17 +1282,8 @@ void domain_destroy(struct domain *d)
 
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

base-commit: d2b91faec4d905acebbc80aaec4def825e2f7280
-- 
2.39.2


