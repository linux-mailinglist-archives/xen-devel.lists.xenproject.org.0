Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E247A8BC8
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 20:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605889.943536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj1zW-0008Sp-TF; Wed, 20 Sep 2023 18:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605889.943536; Wed, 20 Sep 2023 18:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj1zW-0008Hp-KZ; Wed, 20 Sep 2023 18:32:02 +0000
Received: by outflank-mailman (input) for mailman id 605889;
 Wed, 20 Sep 2023 18:32:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wKQE=FE=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qj1zU-0007W9-Me
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 18:32:00 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbee1a60-57e3-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 20:31:59 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-hrEPizR0PjKkhEZ8z8iLZA-1; Wed, 20 Sep 2023 14:31:54 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC7CE28EC10E;
 Wed, 20 Sep 2023 18:31:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64D8A40C6EBF;
 Wed, 20 Sep 2023 18:31:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4A41521E690E; Wed, 20 Sep 2023 20:31:49 +0200 (CEST)
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
X-Inumbo-ID: fbee1a60-57e3-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695234718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4d8o9jVLRrQAC/C156ADyMbZ06/G9fhC8Of9ewcXqM0=;
	b=ZzpS1voN6BMlmA59e3w/qgCeAJucXXblcAJrlVOpu4y6grOPlr8NNW9lgqq0IaHDjim0Gk
	sABq3ZNzcWiW/LO2+caenfahGCFeCbjEzvpFWH1uNsxhqHLgdy8mkW99YaPNp/yyLD8VGB
	FX+TJPxex0ve/vvktKcA5lgbHuovSME=
X-MC-Unique: hrEPizR0PjKkhEZ8z8iLZA-1
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
Subject: [PATCH v2 7/7] qobject atomics osdep: Make a few macros more hygienic
Date: Wed, 20 Sep 2023 20:31:49 +0200
Message-ID: <20230920183149.1105333-8-armbru@redhat.com>
In-Reply-To: <20230920183149.1105333-1-armbru@redhat.com>
References: <20230920183149.1105333-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

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
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/qapi/qmp/qobject.h | 11 +++++++++--
 include/qemu/atomic.h      | 17 ++++++++++++-----
 include/qemu/compiler.h    |  3 +++
 include/qemu/osdep.h       | 31 +++++++++++++++++++++++--------
 4 files changed, 47 insertions(+), 15 deletions(-)

diff --git a/include/qapi/qmp/qobject.h b/include/qapi/qmp/qobject.h
index 9003b71fd3..d36cc97805 100644
--- a/include/qapi/qmp/qobject.h
+++ b/include/qapi/qmp/qobject.h
@@ -45,10 +45,17 @@ struct QObject {
     struct QObjectBase_ base;
 };
 
-#define QOBJECT(obj) ({                                         \
+/*
+ * Preprocessory sorcery ahead: use a different identifier for the
+ * local variable in each expansion, so we can nest macro calls
+ * without shadowing variables.
+ */
+#define QOBJECT_INTERNAL(obj, _obj) ({                          \
     typeof(obj) _obj = (obj);                                   \
-    _obj ? container_of(&(_obj)->base, QObject, base) : NULL;   \
+    _obj                                                        \
+        ? container_of(&(_obj)->base, QObject, base) : NULL;    \
 })
+#define QOBJECT(obj) QOBJECT_INTERNAL((obj), MAKE_IDENTFIER(_obj))
 
 /* Required for qobject_to() */
 #define QTYPE_CAST_TO_QNull     QTYPE_QNULL
diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
index d95612f7a0..d4cbd01909 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -157,13 +157,20 @@
     smp_read_barrier_depends();
 #endif
 
-#define qatomic_rcu_read(ptr)                          \
-    ({                                                 \
+/*
+ * Preprocessory sorcery ahead: use a different identifier for the
+ * local variable in each expansion, so we can nest macro calls
+ * without shadowing variables.
+ */
+#define qatomic_rcu_read_internal(ptr, _val)            \
+    ({                                                  \
     qemu_build_assert(sizeof(*ptr) <= ATOMIC_REG_SIZE); \
-    typeof_strip_qual(*ptr) _val;                      \
-    qatomic_rcu_read__nocheck(ptr, &_val);             \
-    _val;                                              \
+    typeof_strip_qual(*ptr) _val;                       \
+    qatomic_rcu_read__nocheck(ptr, &_val);              \
+    _val;                                               \
     })
+#define qatomic_rcu_read(ptr) \
+    qatomic_rcu_read_internal((ptr), MAKE_IDENTFIER(_val))
 
 #define qatomic_rcu_set(ptr, i) do {                   \
     qemu_build_assert(sizeof(*ptr) <= ATOMIC_REG_SIZE); \
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index a309f90c76..03236d830c 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -37,6 +37,9 @@
 #define tostring(s) #s
 #endif
 
+/* Expands into an identifier stemN, where N is another number each time */
+#define MAKE_IDENTFIER(stem) glue(stem, __COUNTER__)
+
 #ifndef likely
 #define likely(x)   __builtin_expect(!!(x), 1)
 #define unlikely(x)   __builtin_expect(!!(x), 0)
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 2897720fac..0d39bb1876 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -383,19 +383,28 @@ void QEMU_ERROR("code path is reachable")
  * determined by the pre-processor instead of the compiler, you'll
  * have to open-code it.  Sadly, Coverity is severely confused by the
  * constant variants, so we have to dumb things down there.
+ *
+ * Preprocessory sorcery ahead: use different identifiers for the
+ * local variables in each expansion, so we can nest macro calls
+ * without shadowing variables.
  */
-#undef MIN
-#define MIN(a, b)                                       \
+#define MIN_INTERNAL(a, b, _a, _b)                      \
     ({                                                  \
         typeof(1 ? (a) : (b)) _a = (a), _b = (b);       \
         _a < _b ? _a : _b;                              \
     })
-#undef MAX
-#define MAX(a, b)                                       \
+#undef MIN
+#define MIN(a, b) \
+    MIN_INTERNAL((a), (b), MAKE_IDENTFIER(_a), MAKE_IDENTFIER(_b))
+
+#define MAX_INTERNAL(a, b, _a, _b)                      \
     ({                                                  \
         typeof(1 ? (a) : (b)) _a = (a), _b = (b);       \
         _a > _b ? _a : _b;                              \
     })
+#undef MAX
+#define MAX(a, b) \
+    MAX_INTERNAL((a), (b), MAKE_IDENTFIER(_a), MAKE_IDENTFIER(_b))
 
 #ifdef __COVERITY__
 # define MIN_CONST(a, b) ((a) < (b) ? (a) : (b))
@@ -416,14 +425,20 @@ void QEMU_ERROR("code path is reachable")
 /*
  * Minimum function that returns zero only if both values are zero.
  * Intended for use with unsigned values only.
+ *
+ * Preprocessory sorcery ahead: use different identifiers for the
+ * local variables in each expansion, so we can nest macro calls
+ * without shadowing variables.
  */
-#ifndef MIN_NON_ZERO
-#define MIN_NON_ZERO(a, b)                              \
+#define MIN_NON_ZERO_INTERNAL(a, b, _a, _b)             \
     ({                                                  \
         typeof(1 ? (a) : (b)) _a = (a), _b = (b);       \
-        _a == 0 ? _b : (_b == 0 || _b > _a) ? _a : _b;  \
+        _a == 0 ? _b                                    \
+        : (_b == 0 || _b > _a) ? _a                     \
+        : _b;                                           \
     })
-#endif
+#define MIN_NON_ZERO(a, b) \
+    MIN_NON_ZERO_INTERNAL((a), (b), MAKE_IDENTFIER(_a), MAKE_IDENTFIER(_b))
 
 /*
  * Round number down to multiple. Safe when m is not a power of 2 (see
-- 
2.41.0


