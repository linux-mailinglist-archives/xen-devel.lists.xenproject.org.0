Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E0C217471
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 18:51:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsqnz-0000Dk-Fj; Tue, 07 Jul 2020 16:50:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gwtg=AS=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jsqny-0000Df-4l
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 16:50:50 +0000
X-Inumbo-ID: 02b555cf-c072-11ea-8dc2-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 02b555cf-c072-11ea-8dc2-12813bfff9fa;
 Tue, 07 Jul 2020 16:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594140649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKO2Q9u+xz+qTdzJ9ZmsOxTNiwSVbF6iRvMZkU+WmSs=;
 b=HlfXZsqzUZIFp22x0kaGtSSoFKguIpL+8VD/c3Sin28ZWkkHjVUn+YUTv791APz7bv6jRW
 iqIgn6EDd3tSjQqwd6MPZ6J7Vusw7H01gOLkp0qXCIC3ChzycMlJKH72lDDRiDPkFqxoVJ
 pEKTSdl/zhn5S9/13JhpOFbZ48ng8ww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-mq3_WHHyNKKe-_lpW2tf_w-1; Tue, 07 Jul 2020 12:50:46 -0400
X-MC-Unique: mq3_WHHyNKKe-_lpW2tf_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E66C7461;
 Tue,  7 Jul 2020 16:50:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9169A73FC0;
 Tue,  7 Jul 2020 16:50:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1DA4A1132921; Tue,  7 Jul 2020 18:50:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 1/8] error: New macro ERRP_AUTO_PROPAGATE()
Date: Tue,  7 Jul 2020 18:50:30 +0200
Message-Id: <20200707165037.1026246-2-armbru@redhat.com>
In-Reply-To: <20200707165037.1026246-1-armbru@redhat.com>
References: <20200707165037.1026246-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, groug@kaod.org,
 Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Introduce a new ERRP_AUTO_PROPAGATE macro, to be used at start of
functions with an errp OUT parameter.

It has three goals:

1. Fix issue with error_fatal and error_prepend/error_append_hint: user
can't see this additional information, because exit() happens in
error_setg earlier than information is added. [Reported by Greg Kurz]

2. Fix issue with error_abort and error_propagate: when we wrap
error_abort by local_err+error_propagate, the resulting coredump will
refer to error_propagate and not to the place where error happened.
(the macro itself doesn't fix the issue, but it allows us to [3.] drop
the local_err+error_propagate pattern, which will definitely fix the
issue) [Reported by Kevin Wolf]

3. Drop local_err+error_propagate pattern, which is used to workaround
void functions with errp parameter, when caller wants to know resulting
status. (Note: actually these functions could be merely updated to
return int error code).

To achieve these goals, later patches will add invocations
of this macro at the start of functions with either use
error_prepend/error_append_hint (solving 1) or which use
local_err+error_propagate to check errors, switching those
functions to use *errp instead (solving 2 and 3).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
[Comments merged properly with recent commit "error: Document Error
API usage rules", and edited for clarity.  Put ERRP_AUTO_PROPAGATE()
before its helpers, and touch up style.  Commit message tweaked.]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qapi/error.h | 160 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 141 insertions(+), 19 deletions(-)

diff --git a/include/qapi/error.h b/include/qapi/error.h
index 3fed49747d..c865a7d2f1 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -30,6 +30,10 @@
  *   job.  Since the value of @errp is about handling the error, the
  *   function should not examine it.
  *
+ * - The function may pass @errp to functions it calls to pass on
+ *   their errors to its caller.  If it dereferences @errp to check
+ *   for errors, it must use ERRP_AUTO_PROPAGATE().
+ *
  * - On success, the function should not touch *errp.  On failure, it
  *   should set a new error, e.g. with error_setg(errp, ...), or
  *   propagate an existing one, e.g. with error_propagate(errp, ...).
@@ -45,15 +49,17 @@
  * = Creating errors =
  *
  * Create an error:
- *     error_setg(&err, "situation normal, all fouled up");
+ *     error_setg(errp, "situation normal, all fouled up");
+ * where @errp points to the location to receive the error.
  *
  * Create an error and add additional explanation:
- *     error_setg(&err, "invalid quark");
- *     error_append_hint(&err, "Valid quarks are up, down, strange, "
+ *     error_setg(errp, "invalid quark");
+ *     error_append_hint(errp, "Valid quarks are up, down, strange, "
  *                       "charm, top, bottom.\n");
+ * This may require use of ERRP_AUTO_PROPAGATE(); more on that below.
  *
  * Do *not* contract this to
- *     error_setg(&err, "invalid quark\n" // WRONG!
+ *     error_setg(errp, "invalid quark\n" // WRONG!
  *                "Valid quarks are up, down, strange, charm, top, bottom.");
  *
  * = Reporting and destroying errors =
@@ -107,18 +113,6 @@
  * Errors get passed to the caller through the conventional @errp
  * parameter.
  *
- * Pass an existing error to the caller:
- *     error_propagate(errp, err);
- * where Error **errp is a parameter, by convention the last one.
- *
- * Pass an existing error to the caller with the message modified:
- *     error_propagate_prepend(errp, err,
- *                             "Could not frobnicate '%s': ", name);
- * This is more concise than
- *     error_propagate(errp, err); // don't do this
- *     error_prepend(errp, "Could not frobnicate '%s': ", name);
- * and works even when @errp is &error_fatal.
- *
  * Create a new error and pass it to the caller:
  *     error_setg(errp, "situation normal, all fouled up");
  *
@@ -128,18 +122,26 @@
  *         handle the error...
  *     }
  * when it doesn't, say a void function:
+ *     ERRP_AUTO_PROPAGATE();
+ *     foo(arg, errp);
+ *     if (*errp) {
+ *         handle the error...
+ *     }
+ * More on ERRP_AUTO_PROPAGATE() below.
+ *
+ * Code predating ERRP_AUTO_PROPAGATE() still exits, and looks like this:
  *     Error *err = NULL;
  *     foo(arg, &err);
  *     if (err) {
  *         handle the error...
- *         error_propagate(errp, err);
+ *         error_propagate(errp, err); // deprecated
  *     }
- * Do *not* "optimize" this to
+ * Avoid in new code.  Do *not* "optimize" it to
  *     foo(arg, errp);
  *     if (*errp) { // WRONG!
  *         handle the error...
  *     }
- * because errp may be NULL!
+ * because errp may be NULL!  Guard with ERRP_AUTO_PROPAGATE().
  *
  * But when all you do with the error is pass it on, please use
  *     foo(arg, errp);
@@ -158,6 +160,19 @@
  *         handle the error...
  *     }
  *
+ * Pass an existing error to the caller:
+ *     error_propagate(errp, err);
+ * This is rarely needed.  When @err is a local variable, use of
+ * ERRP_AUTO_PROPAGATE() commonly results in more readable code.
+ *
+ * Pass an existing error to the caller with the message modified:
+ *     error_propagate_prepend(errp, err,
+ *                             "Could not frobnicate '%s': ", name);
+ * This is more concise than
+ *     error_propagate(errp, err); // don't do this
+ *     error_prepend(errp, "Could not frobnicate '%s': ", name);
+ * and works even when @errp is &error_fatal.
+ *
  * Receive and accumulate multiple errors (first one wins):
  *     Error *err = NULL, *local_err = NULL;
  *     foo(arg, &err);
@@ -185,6 +200,70 @@
  *         error_setg(&err, ...); // WRONG!
  *     }
  * because this may pass a non-null err to error_setg().
+ *
+ * = Why, when and how to use ERRP_AUTO_PROPAGATE() =
+ *
+ * Without ERRP_AUTO_PROPAGATE(), use of the @errp parameter is
+ * restricted:
+ * - It must not be dereferenced, because it may be null.
+ * - It should not be passed to error_prepend() or
+ *   error_append_hint(), because that doesn't work with &error_fatal.
+ * ERRP_AUTO_PROPAGATE() lifts these restrictions.
+ *
+ * To use ERRP_AUTO_PROPAGATE(), add it right at the beginning of the
+ * function.  @errp can then be used without worrying about the
+ * argument being NULL or &error_fatal.
+ *
+ * Using it when it's not needed is safe, but please avoid cluttering
+ * the source with useless code.
+ *
+ * = Converting to ERRP_AUTO_PROPAGATE() =
+ *
+ * To convert a function to use ERRP_AUTO_PROPAGATE():
+ *
+ * 0. If the Error ** parameter is not named @errp, rename it to
+ *    @errp.
+ *
+ * 1. Add an ERRP_AUTO_PROPAGATE() invocation, by convention right at
+ *    the beginning of the function.  This makes @errp safe to use.
+ *
+ * 2. Replace &err by errp, and err by *errp.  Delete local variable
+ *    @err.
+ *
+ * 3. Delete error_propagate(errp, *errp), replace
+ *    error_propagate_prepend(errp, *errp, ...) by error_prepend(errp, ...),
+ *
+ * 4. Ensure @errp is valid at return: when you destroy *errp, set
+ *    errp = NULL.
+ *
+ * Example:
+ *
+ *     bool fn(..., Error **errp)
+ *     {
+ *         Error *err = NULL;
+ *
+ *         foo(arg, &err);
+ *         if (err) {
+ *             handle the error...
+ *             error_propagate(errp, err);
+ *             return false;
+ *         }
+ *         ...
+ *     }
+ *
+ * becomes
+ *
+ *     bool fn(..., Error **errp)
+ *     {
+ *         ERRP_AUTO_PROPAGATE();
+ *
+ *         foo(arg, errp);
+ *         if (*errp) {
+ *             handle the error...
+ *             return false;
+ *         }
+ *         ...
+ *     }
  */
 
 #ifndef ERROR_H
@@ -285,6 +364,7 @@ void error_setg_win32_internal(Error **errp,
  * the error object.
  * Else, move the error object from @local_err to *@dst_errp.
  * On return, @local_err is invalid.
+ * Please use ERRP_AUTO_PROPAGATE() instead when possible.
  * Please don't error_propagate(&error_fatal, ...), use
  * error_report_err() and exit(), because that's more obvious.
  */
@@ -296,6 +376,8 @@ void error_propagate(Error **dst_errp, Error *local_err);
  * Behaves like
  *     error_prepend(&local_err, fmt, ...);
  *     error_propagate(dst_errp, local_err);
+ * Please use ERRP_AUTO_PROPAGATE() and error_prepend() instead when
+ * possible.
  */
 void error_propagate_prepend(Error **dst_errp, Error *local_err,
                              const char *fmt, ...);
@@ -393,6 +475,46 @@ void error_set_internal(Error **errp,
                         ErrorClass err_class, const char *fmt, ...)
     GCC_FMT_ATTR(6, 7);
 
+/*
+ * Make @errp parameter easier to use regardless of argument value
+ *
+ * This macro is for use right at the beginning of a function that
+ * takes an Error **errp parameter to pass errors to its caller.  The
+ * parameter must be named @errp.
+ *
+ * It must be used when the function dereferences @errp or passes
+ * @errp to error_prepend(), error_vprepend(), or error_append_hint().
+ * It is safe to use even when it's not needed, but please avoid
+ * cluttering the source with useless code.
+ *
+ * If @errp is NULL or &error_fatal, rewrite it to point to a local
+ * Error variable, which will be automatically propagated to the
+ * original @errp on function exit.
+ *
+ * Note: &error_abort is not rewritten, because that would move the
+ * abort from the place where the error is created to the place where
+ * it's propagated.
+ */
+#define ERRP_AUTO_PROPAGATE()                                   \
+    g_auto(ErrorPropagator) _auto_errp_prop = {.errp = errp};   \
+    do {                                                        \
+        if (!errp || errp == &error_fatal) {                    \
+            errp = &_auto_errp_prop.local_err;                  \
+        }                                                       \
+    } while (0)
+
+typedef struct ErrorPropagator {
+    Error *local_err;
+    Error **errp;
+} ErrorPropagator;
+
+static inline void error_propagator_cleanup(ErrorPropagator *prop)
+{
+    error_propagate(prop->errp, prop->local_err);
+}
+
+G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(ErrorPropagator, error_propagator_cleanup);
+
 /*
  * Special error destination to abort on error.
  * See error_setg() and error_propagate() for details.
-- 
2.26.2


