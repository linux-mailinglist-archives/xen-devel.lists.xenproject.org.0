Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFC022AD01
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 12:52:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyYpn-0001AV-Sv; Thu, 23 Jul 2020 10:52:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jyYpl-0001AL-Of
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 10:52:17 +0000
X-Inumbo-ID: 92811fc8-ccd2-11ea-86ee-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92811fc8-ccd2-11ea-86ee-bc764e2007e4;
 Thu, 23 Jul 2020 10:52:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C752CAE69;
 Thu, 23 Jul 2020 10:52:23 +0000 (UTC)
Subject: [PATCH 2/2] lockprof: don't pass name into registration function
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <47f5478d-2f46-656c-0882-121aebc77f39@suse.com>
Message-ID: <d8eab983-9377-a519-3be8-6ef83fa96516@suse.com>
Date: Thu, 23 Jul 2020 12:52:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <47f5478d-2f46-656c-0882-121aebc77f39@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The type uniquely identifies the associated name, hence the name fields
can be statically initialized.

Also constify not just the involved struct field, but also struct
lock_profile's. Rather than specifying lock_profile_ancs[]' dimension at
definition time, add a suitable build time check, such that at least
missing tail additions to the initializer can be spotted easily.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -392,7 +392,7 @@ struct domain *domain_create(domid_t dom
         d->max_vcpus = config->max_vcpus;
     }
 
-    lock_profile_register_struct(LOCKPROF_TYPE_PERDOM, d, domid, "Domain");
+    lock_profile_register_struct(LOCKPROF_TYPE_PERDOM, d, domid);
 
     if ( (err = xsm_alloc_security_domain(d)) != 0 )
         goto fail;
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -338,7 +338,7 @@ void _spin_unlock_recursive(spinlock_t *
 
 struct lock_profile_anc {
     struct lock_profile_qhead *head_q;   /* first head of this type */
-    char                      *name;     /* descriptive string for print */
+    const char                *name;     /* descriptive string for print */
 };
 
 typedef void lock_profile_subfunc(
@@ -348,7 +348,10 @@ extern struct lock_profile *__lock_profi
 extern struct lock_profile *__lock_profile_end;
 
 static s_time_t lock_profile_start;
-static struct lock_profile_anc lock_profile_ancs[LOCKPROF_TYPE_N];
+static struct lock_profile_anc lock_profile_ancs[] = {
+    [LOCKPROF_TYPE_GLOBAL] = { .name = "Global" },
+    [LOCKPROF_TYPE_PERDOM] = { .name = "Domain" },
+};
 static struct lock_profile_qhead lock_profile_glb_q;
 static spinlock_t lock_profile_lock = SPIN_LOCK_UNLOCKED;
 
@@ -473,13 +476,12 @@ int spinlock_profile_control(struct xen_
 }
 
 void _lock_profile_register_struct(
-    int32_t type, struct lock_profile_qhead *qhead, int32_t idx, char *name)
+    int32_t type, struct lock_profile_qhead *qhead, int32_t idx)
 {
     qhead->idx = idx;
     spin_lock(&lock_profile_lock);
     qhead->head_q = lock_profile_ancs[type].head_q;
     lock_profile_ancs[type].head_q = qhead;
-    lock_profile_ancs[type].name = name;
     spin_unlock(&lock_profile_lock);
 }
 
@@ -504,6 +506,8 @@ static int __init lock_prof_init(void)
 {
     struct lock_profile **q;
 
+    BUILD_BUG_ON(ARRAY_SIZE(lock_profile_ancs) != LOCKPROF_TYPE_N);
+
     for ( q = &__lock_profile_start; q < &__lock_profile_end; q++ )
     {
         (*q)->next = lock_profile_glb_q.elem_q;
@@ -511,9 +515,8 @@ static int __init lock_prof_init(void)
         (*q)->lock->profile = *q;
     }
 
-    _lock_profile_register_struct(
-        LOCKPROF_TYPE_GLOBAL, &lock_profile_glb_q,
-        0, "Global lock");
+    _lock_profile_register_struct(LOCKPROF_TYPE_GLOBAL,
+                                  &lock_profile_glb_q, 0);
 
     return 0;
 }
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -72,7 +72,7 @@ struct spinlock;
 
 struct lock_profile {
     struct lock_profile *next;       /* forward link */
-    char                *name;       /* lock name */
+    const char          *name;       /* lock name */
     struct spinlock     *lock;       /* the lock itself */
     u64                 lock_cnt;    /* # of complete locking ops */
     u64                 block_cnt;   /* # of complete wait for lock */
@@ -118,11 +118,11 @@ struct lock_profile_qhead {
     } while(0)
 
 void _lock_profile_register_struct(
-    int32_t, struct lock_profile_qhead *, int32_t, char *);
+    int32_t, struct lock_profile_qhead *, int32_t);
 void _lock_profile_deregister_struct(int32_t, struct lock_profile_qhead *);
 
-#define lock_profile_register_struct(type, ptr, idx, print)                   \
-    _lock_profile_register_struct(type, &((ptr)->profile_head), idx, print)
+#define lock_profile_register_struct(type, ptr, idx)                          \
+    _lock_profile_register_struct(type, &((ptr)->profile_head), idx)
 #define lock_profile_deregister_struct(type, ptr)                             \
     _lock_profile_deregister_struct(type, &((ptr)->profile_head))
 
@@ -138,7 +138,7 @@ struct lock_profile_qhead { };
 #define DEFINE_SPINLOCK(l) spinlock_t l = SPIN_LOCK_UNLOCKED
 
 #define spin_lock_init_prof(s, l) spin_lock_init(&((s)->l))
-#define lock_profile_register_struct(type, ptr, idx, print)
+#define lock_profile_register_struct(type, ptr, idx)
 #define lock_profile_deregister_struct(type, ptr)
 #define spinlock_profile_printall(key)
 


