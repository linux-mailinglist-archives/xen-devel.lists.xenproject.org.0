Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F02135C86F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 16:14:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109216.208467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxKc-0006WK-3e; Mon, 12 Apr 2021 14:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109216.208467; Mon, 12 Apr 2021 14:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxKc-0006Vu-0V; Mon, 12 Apr 2021 14:14:26 +0000
Received: by outflank-mailman (input) for mailman id 109216;
 Mon, 12 Apr 2021 14:14:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVxKa-0006Vi-Ih
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 14:14:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 340aa3eb-3687-42f3-ba84-dd321bf55e96;
 Mon, 12 Apr 2021 14:14:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CDFB4B0C6;
 Mon, 12 Apr 2021 14:14:22 +0000 (UTC)
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
X-Inumbo-ID: 340aa3eb-3687-42f3-ba84-dd321bf55e96
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618236862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gI02vjjowQWzzvN/gkSlZfdNhI0WKj+tm5YpsfYK02w=;
	b=Fo/w+bGBe8LxHKE+Md8eMt8DqNigTQfaC0iTTVaJyrm267G46Gm7HYV8BspyZbbnUZ2vQe
	x3SaQUE4IGcqxy3aaYrnWw7rp3elzvJ/B3yCM3BUrLB3BOzB/XVURgVkDhjDu8Ow32CuSD
	1wUq7lJ5H1rR/po8dj6N+K9KXeIHvVo=
Subject: [PATCH v2 12/12] x86/p2m: re-arrange struct p2m_domain
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Message-ID: <f2db4101-d3fd-1a82-c38c-2efb69504821@suse.com>
Date: Mon, 12 Apr 2021 16:14:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Combine two HVM-specific sections in two cases (i.e. going from four of
them to just two). Make defer_nested_flush bool and HVM-only, moving it
next to other nested stuff. Move default_access up into a padding hole.

When moving them anyway, also adjust comment style.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1167,7 +1167,7 @@ void p2m_change_type_range(struct domain
     ASSERT(p2m_is_changeable(ot) && p2m_is_changeable(nt));
 
     p2m_lock(hostp2m);
-    hostp2m->defer_nested_flush = 1;
+    hostp2m->defer_nested_flush = true;
 
     change_type_range(hostp2m, start, end, ot, nt);
 
@@ -1185,7 +1185,7 @@ void p2m_change_type_range(struct domain
                 p2m_unlock(altp2m);
             }
     }
-    hostp2m->defer_nested_flush = 0;
+    hostp2m->defer_nested_flush = false;
     if ( nestedhvm_enabled(d) )
         p2m_flush_nestedp2m(d);
 
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -216,20 +216,15 @@ struct p2m_domain {
 
     p2m_class_t       p2m_class; /* host/nested/alternate */
 
-#ifdef CONFIG_HVM
-    /* Nested p2ms only: nested p2m base value that this p2m shadows.
-     * This can be cleared to P2M_BASE_EADDR under the per-p2m lock but
-     * needs both the per-p2m lock and the per-domain nestedp2m lock
-     * to set it to any other value. */
-#define P2M_BASE_EADDR     (~0ULL)
-    uint64_t           np2m_base;
-    uint64_t           np2m_generation;
+    /*
+     * Default P2M access type for each page in the the domain: new pages,
+     * swapped in pages, cleared pages, and pages that are ambiguously
+     * retyped get this access type.  See definition of p2m_access_t.
+     */
+    p2m_access_t default_access;
 
-    /* Nested p2ms: linked list of n2pms allocated to this domain. 
-     * The host p2m hasolds the head of the list and the np2ms are 
-     * threaded on in LRU order. */
-    struct list_head   np2m_list;
-#endif
+    /* Pages used to construct the p2m */
+    struct page_list_head pages;
 
     /* Host p2m: Log-dirty ranges registered for the domain. */
     struct rangeset   *logdirty_ranges;
@@ -237,21 +232,10 @@ struct p2m_domain {
     /* Host p2m: Global log-dirty mode enabled for the domain. */
     bool               global_logdirty;
 
-    /* Host p2m: when this flag is set, don't flush all the nested-p2m 
-     * tables on every host-p2m change.  The setter of this flag 
-     * is responsible for performing the full flush before releasing the
-     * host p2m's lock. */
-    int                defer_nested_flush;
-
 #ifdef CONFIG_HVM
     /* Alternate p2m: count of vcpu's currently using this p2m. */
     atomic_t           active_vcpus;
-#endif
-
-    /* Pages used to construct the p2m */
-    struct page_list_head pages;
 
-#ifdef CONFIG_HVM
     int                (*set_entry)(struct p2m_domain *p2m,
                                     gfn_t gfn,
                                     mfn_t mfn, unsigned int page_order,
@@ -306,11 +290,6 @@ struct p2m_domain {
     unsigned int defer_flush;
     bool_t need_flush;
 
-    /* Default P2M access type for each page in the the domain: new pages,
-     * swapped in pages, cleared pages, and pages that are ambiguously
-     * retyped get this access type.  See definition of p2m_access_t. */
-    p2m_access_t default_access;
-
     /* If true, and an access fault comes in and there is no vm_event listener, 
      * pause domain.  Otherwise, remove access restrictions. */
     bool_t       access_required;
@@ -357,6 +336,31 @@ struct p2m_domain {
         mm_lock_t        lock;         /* Locking of private pod structs,   *
                                         * not relying on the p2m lock.      */
     } pod;
+
+    /*
+     * Host p2m: when this flag is set, don't flush all the nested-p2m
+     * tables on every host-p2m change.  The setter of this flag
+     * is responsible for performing the full flush before releasing the
+     * host p2m's lock.
+     */
+    bool               defer_nested_flush;
+
+    /*
+     * Nested p2ms only: nested p2m base value that this p2m shadows.
+     * This can be cleared to P2M_BASE_EADDR under the per-p2m lock but
+     * needs both the per-p2m lock and the per-domain nestedp2m lock
+     * to set it to any other value.
+     */
+#define P2M_BASE_EADDR     (~0ULL)
+    uint64_t           np2m_base;
+    uint64_t           np2m_generation;
+
+    /*
+     * Nested p2ms: linked list of n2pms allocated to this domain.
+     * The host p2m hasolds the head of the list and the np2ms are
+     * threaded on in LRU order.
+     */
+    struct list_head   np2m_list;
 #endif
 
     union {


