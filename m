Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 892C778EE8A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 15:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593898.927040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbhgM-0001Is-0Z; Thu, 31 Aug 2023 13:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593898.927040; Thu, 31 Aug 2023 13:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbhgL-0001DA-Sg; Thu, 31 Aug 2023 13:25:57 +0000
Received: by outflank-mailman (input) for mailman id 593898;
 Thu, 31 Aug 2023 13:25:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=smM9=EQ=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qbhgK-00011s-NH
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 13:25:56 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e942bb3b-4801-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 15:25:54 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-ZOz2lGL7N_eF6b9Vwy-JnQ-1; Thu, 31 Aug 2023 09:25:50 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8C49185A7AC;
 Thu, 31 Aug 2023 13:25:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 799C3401E63;
 Thu, 31 Aug 2023 13:25:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C82A921E60D8; Thu, 31 Aug 2023 15:25:46 +0200 (CEST)
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
X-Inumbo-ID: e942bb3b-4801-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693488353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hg2ISKwBEelJK+K3yl7ZcIq6TU8ASl2mfkZDanBbqQM=;
	b=LoWI5Sj6leXAQWfNLUyYYZUn+wzY/9HoA0WZ08YJiK/yNmwCBvzDAnJ8tGSiyFrqCXrH+U
	aDz89yzrktEpsLfR/mqywLxx2WHCKCX+lJFs/7hy5bF+vu7ZYPlIMDryz7cuo1h97I5O2Q
	HBJe9XI5PH7zU2bpG57c44E/I0egHRo=
X-MC-Unique: ZOz2lGL7N_eF6b9Vwy-JnQ-1
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	hreitz@redhat.com,
	eblake@redhat.com,
	vsementsov@yandex-team.ru,
	jsnow@redhat.com,
	idryomov@gmail.com,
	pl@kamp.de,
	sw@weilnetz.de,
	sstabellini@kernel.org,
	anthony.perard@citrix.com,
	paul@xen.org,
	pbonzini@redhat.com,
	marcandre.lureau@redhat.com,
	berrange@redhat.com,
	thuth@redhat.com,
	philmd@linaro.org,
	stefanha@redhat.com,
	fam@euphon.net,
	quintela@redhat.com,
	peterx@redhat.com,
	leobras@redhat.com,
	kraxel@redhat.com,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH 7/7] qobject atomics osdep: Make a few macros more hygienic
Date: Thu, 31 Aug 2023 15:25:46 +0200
Message-ID: <20230831132546.3525721-8-armbru@redhat.com>
In-Reply-To: <20230831132546.3525721-1-armbru@redhat.com>
References: <20230831132546.3525721-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10

Variables declared in macros can shadow other variables.  Much of the
time, this is harmless, e.g.:

    #define _FDT(exp)                                                  \
        do {                                                           \
            int ret = (exp);                                           \
            if (ret < 0) {                                             \
                error_report("error creating device tree: %s: %s",   \
                        #exp, fdt_strerror(ret));                      \
                exit(1);                                               \
            }                                                          \
        } while (0)

Harmless shadowing in h_client_architecture_support():

        target_ulong ret;

        [...]

        ret = do_client_architecture_support(cpu, spapr, vec, fdt_bufsize);
        if (ret == H_SUCCESS) {
            _FDT((fdt_pack(spapr->fdt_blob)));
            [...]
        }

        return ret;

However, we can get in trouble when the shadowed variable is used in a
macro argument:

    #define QOBJECT(obj) ({                                 \
        typeof(obj) o = (obj);                              \
        o ? container_of(&(o)->base, QObject, base) : NULL; \
     })

QOBJECT(o) expands into

    ({
--->    typeof(o) o = (o);
        o ? container_of(&(o)->base, QObject, base) : NULL;
    })

Unintended variable name capture at --->.  We'd be saved by
-Winit-self.  But I could certainly construct more elaborate death
traps that don't trigger it.

To reduce the risk of trapping ourselves, we use variable names in
macros that no sane person would use elsewhere.  Here's our actual
definition of QOBJECT():

    #define QOBJECT(obj) ({                                         \
        typeof(obj) _obj = (obj);                                   \
        _obj ? container_of(&(_obj)->base, QObject, base) : NULL;   \
    })

Works well enough until we nest macro calls.  For instance, with

    #define qobject_ref(obj) ({                     \
        typeof(obj) _obj = (obj);                   \
        qobject_ref_impl(QOBJECT(_obj));            \
        _obj;                                       \
    })

the expression qobject_ref(obj) expands into

    ({
        typeof(obj) _obj = (obj);
        qobject_ref_impl(
            ({
--->            typeof(_obj) _obj = (_obj);
                _obj ? container_of(&(_obj)->base, QObject, base) : NULL;
            }));
        _obj;
    })

Unintended variable name capture at --->.

The only reliable way to prevent unintended variable name capture is
-Wshadow.

One blocker for enabling it is shadowing hiding in function-like
macros like

     qdict_put(dict, "name", qobject_ref(...))

qdict_put() wraps its last argument in QOBJECT(), and the last
argument here contains another QOBJECT().

Use dark preprocessor sorcery to make the macros that give us this
problem use different variable names on every call.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qapi/qmp/qobject.h |  8 +++++---
 include/qemu/atomic.h      | 11 ++++++-----
 include/qemu/osdep.h       | 34 +++++++++++++++++++---------------
 3 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/include/qapi/qmp/qobject.h b/include/qapi/qmp/qobject.h
index 9003b71fd3..7b50fc905d 100644
--- a/include/qapi/qmp/qobject.h
+++ b/include/qapi/qmp/qobject.h
@@ -45,10 +45,12 @@ struct QObject {
     struct QObjectBase_ base;
 };
 
-#define QOBJECT(obj) ({                                         \
-    typeof(obj) _obj = (obj);                                   \
-    _obj ? container_of(&(_obj)->base, QObject, base) : NULL;   \
+#define QOBJECT_INTERNAL(obj, l) ({                                     \
+    typeof(obj) PASTE(_obj, l) = (obj);                                 \
+    PASTE(_obj, l)                                                      \
+        ? container_of(&(PASTE(_obj, l))->base, QObject, base) : NULL;  \
 })
+#define QOBJECT(obj) QOBJECT_INTERNAL((obj), __COUNTER__)
 
 /* Required for qobject_to() */
 #define QTYPE_CAST_TO_QNull     QTYPE_QNULL
diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
index d95612f7a0..3f80ffac69 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -157,13 +157,14 @@
     smp_read_barrier_depends();
 #endif
 
-#define qatomic_rcu_read(ptr)                          \
-    ({                                                 \
+#define qatomic_rcu_read_internal(ptr, l)               \
+    ({                                                  \
     qemu_build_assert(sizeof(*ptr) <= ATOMIC_REG_SIZE); \
-    typeof_strip_qual(*ptr) _val;                      \
-    qatomic_rcu_read__nocheck(ptr, &_val);             \
-    _val;                                              \
+    typeof_strip_qual(*ptr) PASTE(_val, l);             \
+    qatomic_rcu_read__nocheck(ptr, &PASTE(_val, l));    \
+    PASTE(_val, l);                                     \
     })
+#define qatomic_rcu_read(ptr) qatomic_rcu_read_internal((ptr), __COUNTER__)
 
 #define qatomic_rcu_set(ptr, i) do {                   \
     qemu_build_assert(sizeof(*ptr) <= ATOMIC_REG_SIZE); \
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 21ef8f1699..9c191ebe99 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -371,18 +371,21 @@ void QEMU_ERROR("code path is reachable")
  * have to open-code it.  Sadly, Coverity is severely confused by the
  * constant variants, so we have to dumb things down there.
  */
+#define PASTE(a, b) a##b
+#define MIN_INTERNAL(a, b, l)                                           \
+    ({                                                                  \
+        typeof(1 ? (a) : (b)) PASTE(_a, l) = (a), PASTE(_b, l) = (b);   \
+        PASTE(_a, l) < PASTE(_b, l) ? PASTE(_a, l) : PASTE(_b, l);      \
+    })
 #undef MIN
-#define MIN(a, b)                                       \
-    ({                                                  \
-        typeof(1 ? (a) : (b)) _a = (a), _b = (b);       \
-        _a < _b ? _a : _b;                              \
+#define MIN(a, b) MIN_INTERNAL((a), (b), __COUNTER__)
+#define MAX_INTERNAL(a, b, l)                                           \
+    ({                                                                  \
+        typeof(1 ? (a) : (b)) PASTE(_a, l) = (a), PASTE(_b, l) = (b);   \
+        PASTE(_a, l) > PASTE(_b, l) ? PASTE(_a, l) : PASTE(_b, l);      \
     })
 #undef MAX
-#define MAX(a, b)                                       \
-    ({                                                  \
-        typeof(1 ? (a) : (b)) _a = (a), _b = (b);       \
-        _a > _b ? _a : _b;                              \
-    })
+#define MAX(a, b) MAX_INTERNAL((a), (b), __COUNTER__)
 
 #ifdef __COVERITY__
 # define MIN_CONST(a, b) ((a) < (b) ? (a) : (b))
@@ -404,13 +407,14 @@ void QEMU_ERROR("code path is reachable")
  * Minimum function that returns zero only if both values are zero.
  * Intended for use with unsigned values only.
  */
-#ifndef MIN_NON_ZERO
-#define MIN_NON_ZERO(a, b)                              \
-    ({                                                  \
-        typeof(1 ? (a) : (b)) _a = (a), _b = (b);       \
-        _a == 0 ? _b : (_b == 0 || _b > _a) ? _a : _b;  \
+#define MIN_NON_ZERO_INTERNAL(a, b, l)                                  \
+    ({                                                                  \
+        typeof(1 ? (a) : (b)) PASTE(_a, l) = (a), PASTE(_b, l) = (b);   \
+        PASTE(_a, l) == 0 ? PASTE(_b, l)                                \
+        : (PASTE(_b, l) == 0 || PASTE(_b, l) > PASTE(_a, l)) ? PASTE(_a, l) \
+        : PASTE(_b, l);                                                 \
     })
-#endif
+#define MIN_NON_ZERO(a, b) MIN_NON_ZERO_INTERNAL((a), (b), __COUNTER__)
 
 /*
  * Round number down to multiple. Safe when m is not a power of 2 (see
-- 
2.41.0


