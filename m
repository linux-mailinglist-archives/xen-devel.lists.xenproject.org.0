Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD2F213744
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 11:09:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrHgU-0005Iz-PD; Fri, 03 Jul 2020 09:08:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rI2g=AO=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1jrHgT-0005Ii-H7
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 09:08:37 +0000
X-Inumbo-ID: c4b43b68-bd0c-11ea-8952-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.123]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4b43b68-bd0c-11ea-8952-12813bfff9fa;
 Fri, 03 Jul 2020 09:08:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PG75k+Ti7TRubwqEaO8gSY94vwbW7S+bDjZ537tvQvfdICuTL7ozIvER5SmyIsp6xbkn/Zppr4SG1sy/2wjtZkwUAFbhyvxHwf3oENnkXUyTVrum7TSu47AR9dSteFqqTU+9a0hF0fso0mwOpkNlP2ZTZ/T46TapmK+OZ0g7fpLwq9V6s7ndgUVR59H+3FsaXUuKWtQ842tX3/VFpPfWarLDaA2/jPHieCPogQRCVDH5q5LQye2YX0dEWYDLVZroB/ftRcLOO6DI3dC6ARE9WcxJTzf47fHSLzU2s9ugUC7VpcvcFNPJ3AgxNXEDSoxc7TpnjPetLY+ufEJnBZ/IAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfHSVlIo44tg6W+pIWSY0xjOo9Pxh+Mei6mpQ0bwGBI=;
 b=hfPRJtx8r8PeEjR/UnHIt4VrpuTkD5v+YQ6J1bYNuxkJhRj/nWuCwzMDf56F/n2Fm/qenz2eren1svMqpug8wPdn3uPcZpwCdeqvn3aQc5VKtM3QYurZ5hTDb6G8rcvd38DKWSvwjaxsZI2Rk0c1a8GgPxzIhNZP3F4snAkFRjTD6qBlUXlwuBpJeR/UtgW9O69eMZPlYmSOVrc6mgT2c9g8goshsxtXZHcagwTMQJU/TdwEWwdFiyBKLT60mt5j5Lkzme4XQ+js+OfgFd5xnRluRGYfShD9QjeDXDyAPuGiOvbgOTq7lTOzOWelOjbf4+2BtALDTwcfCoIlOFvMUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfHSVlIo44tg6W+pIWSY0xjOo9Pxh+Mei6mpQ0bwGBI=;
 b=I/zt7nZIKaKbYh5fzHlsIrXpH/QWCYg8H75OfNqP/KwfjJw3Yp7BvjYAcH1vW0rGfY+u2q+xroNqJqFHjqMy4rek6QZY9OU3JMWlET8kKTX+hS9zeeWt41pcqCCsOJs8thnk/251sTIEGCqMHd9O/c7BUMcSUYFeGKWdRFLqF9k=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5448.eurprd08.prod.outlook.com (2603:10a6:20b:106::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Fri, 3 Jul
 2020 09:08:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a408:2f0f:bc6c:d312]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a408:2f0f:bc6c:d312%4]) with mapi id 15.20.3131.028; Fri, 3 Jul 2020
 09:08:31 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 1/8] error: auto propagated local_err
Date: Fri,  3 Jul 2020 12:08:09 +0300
Message-Id: <20200703090816.3295-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200703090816.3295-1-vsementsov@virtuozzo.com>
References: <20200703090816.3295-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0022.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.15) by
 AM0PR10CA0022.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend
 Transport; Fri, 3 Jul 2020 09:08:29 +0000
X-Mailer: git-send-email 2.21.0
X-Originating-IP: [185.215.60.15]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 223dc08a-cc50-47bf-3d53-08d81f30a7d8
X-MS-TrafficTypeDiagnostic: AM7PR08MB5448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB544893CD56056C56E2F94BF3C16A0@AM7PR08MB5448.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1jbAEV1m1poFTYrkwpLSbN/kErl6G+bZeWohFVMoDtJNGWXm+Fmt8INoJVrgbeNzuGwWqhP1f+VL+NLOqdG/MIwyr5n1gRElbKtMMHFc0QnGXNl7RhfVKv1J30ODZzSa057Rm4CDUh9uFSbfCODxQBTDr14ILdf2J3AylZFy/74YjGHUf0+ydR5UKH3b0qh5yke4Ay76gA1vPxH5PcobrkFu6A+iSpuiLP5xeJtrRnG17eBOkFYEvR+HTPLrVCPOLjEZ1xR/tQqf+UeEGuxNeapz/cOGYbzfNzF1+nGrT445yXAjEEEGHRgIyeuc8XUDywLbKr8unsXxoxHWstIaKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39840400004)(366004)(376002)(136003)(396003)(346002)(66946007)(66476007)(66556008)(2906002)(86362001)(1076003)(30864003)(8676002)(83380400001)(6512007)(5660300002)(8936002)(6666004)(186003)(36756003)(4326008)(6506007)(16526019)(6486002)(6916009)(7416002)(26005)(478600001)(956004)(52116002)(316002)(54906003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: fBGiTrHrwuLh8rYAW6i0mZhe63DX/yN3XNiwlSHSCF1LLcQ9lxm8ZfeULw1gDejcYxvN4+hpD4TasCQh15+YOlOGqwdwXOpcp5qt07a/Gm6oR+RG57SY2Q52UhLyjpqT2hUDAB+ozFKHdIcG3SMpGhMFcosYuGJEyrrDeGYXNQQF0dBmreU4yY2b7eGhMgRVXNaOynDARbsEEF/NzzvpUce86vYIU4QFTuW5Bo6AHCfs0q3+wc3ubGq0TWdOCE7nhl0aN+x/rqIKbNhxeMZkONHPQ/YYQFzEiL3e+inVjizx5t+L4R4d5ojypXmb18kbhTfXhLdtM+HKpa5YYD0IUtEooxSUOznzm8vHEJfEnnPOiZtOsakFNnVEvyHQNpckpVQYPxGSrFZw/JMf5OjaL+UUpK1+0ItBgj93br0QGGLMgoLA32D0UJC8KO78mxdVtvbvSTQKtGGr7NDt3ht4drWSmWtD6klUgrn9YBbzjpA=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 223dc08a-cc50-47bf-3d53-08d81f30a7d8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 09:08:30.9515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGsMQcAU8WJFwLq3H2143YQ8NIIaOwmWlgKU86XBdnn75rmxrPIoYGyZlzhEwQLh71Bgd6E4FSlDKvBqIciCuD45B5qLaix0G8cAbFTyygY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5448
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
 Laszlo Ersek <lersek@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, armbru@redhat.com,
 groug@kaod.org, Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>, eblake@redhat.com,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

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
---

Cc: Eric Blake <eblake@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: Greg Kurz <groug@kaod.org>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
Cc: Laszlo Ersek <lersek@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Cc: xen-devel@lists.xenproject.org

 include/qapi/error.h | 205 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 172 insertions(+), 33 deletions(-)

diff --git a/include/qapi/error.h b/include/qapi/error.h
index 5ceb3ace06..b54aedbfd7 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -39,7 +39,7 @@
  *   • pointer-valued functions return non-null / null pointer, and
  *   • integer-valued functions return non-negative / negative.
  *
- * How to:
+ * = Deal with Error object =
  *
  * Create an error:
  *     error_setg(errp, "situation normal, all fouled up");
@@ -73,28 +73,91 @@
  * reporting it (primarily useful in testsuites):
  *     error_free_or_abort(&err);
  *
- * Pass an existing error to the caller:
- *     error_propagate(errp, err);
- * where Error **errp is a parameter, by convention the last one.
+ * = Deal with Error ** function parameter =
  *
- * Pass an existing error to the caller with the message modified:
- *     error_propagate_prepend(errp, err);
+ * A function may use the error system to return errors. In this case, the
+ * function defines an Error **errp parameter, by convention the last one (with
+ * exceptions for functions using ... or va_list).
  *
- * Avoid
- *     error_propagate(errp, err);
- *     error_prepend(errp, "Could not frobnicate '%s': ", name);
- * because this fails to prepend when @errp is &error_fatal.
+ * The caller may then pass in the following errp values:
+ *
+ * 1. &error_abort
+ *    Any error will result in abort().
+ * 2. &error_fatal
+ *    Any error will result in exit() with a non-zero status.
+ * 3. NULL
+ *    No error reporting through errp parameter.
+ * 4. The address of a NULL-initialized Error *err
+ *    Any error will populate errp with an error object.
  *
- * Create a new error and pass it to the caller:
+ * The following rules then implement the correct semantics desired by the
+ * caller.
+ *
+ * Create a new error to pass to the caller:
  *     error_setg(errp, "situation normal, all fouled up");
  *
- * Call a function and receive an error from it:
+ * Calling another errp-based function:
+ *     f(..., errp);
+ *
+ * == Checking success of subcall ==
+ *
+ * If a function returns a value indicating an error in addition to setting
+ * errp (which is recommended), then you don't need any additional code, just
+ * do:
+ *
+ *     int ret = f(..., errp);
+ *     if (ret < 0) {
+ *         ... handle error ...
+ *         return ret;
+ *     }
+ *
+ * If a function returns nothing (not recommended for new code), the only way
+ * to check success is by consulting errp; doing this safely requires the use
+ * of the ERRP_AUTO_PROPAGATE macro, like this:
+ *
+ *     int our_func(..., Error **errp) {
+ *         ERRP_AUTO_PROPAGATE();
+ *         ...
+ *         subcall(..., errp);
+ *         if (*errp) {
+ *             ...
+ *             return -EINVAL;
+ *         }
+ *         ...
+ *     }
+ *
+ * ERRP_AUTO_PROPAGATE takes care of wrapping the original errp as needed, so
+ * that the rest of the function can directly use errp (including
+ * dereferencing), where any errors will then be propagated on to the original
+ * errp when leaving the function.
+ *
+ * In some cases, we need to check result of subcall, but do not want to
+ * propagate the Error object to our caller. In such cases we don't need
+ * ERRP_AUTO_PROPAGATE, but just a local Error object:
+ *
+ * Receive an error and not pass it:
  *     Error *err = NULL;
- *     foo(arg, &err);
+ *     subcall(arg, &err);
  *     if (err) {
  *         handle the error...
+ *         error_free(err);
  *     }
  *
+ * Note that older code that did not use ERRP_AUTO_PROPAGATE would instead need
+ * a local Error * variable and the use of error_propagate() to properly handle
+ * all possible caller values of errp. Now this is DEPRECATED* (see below).
+ *
+ * Note that any function that wants to modify an error object, such as by
+ * calling error_append_hint or error_prepend, must use ERRP_AUTO_PROPAGATE, in
+ * order for a caller's use of &error_fatal to see the additional information.
+ *
+ * In rare cases, we need to pass existing Error object to the caller by hand:
+ *     error_propagate(errp, err);
+ *
+ * Pass an existing error to the caller with the message modified:
+ *     error_propagate_prepend(errp, err);
+ *
+ *
  * Call a function ignoring errors:
  *     foo(arg, NULL);
  *
@@ -104,26 +167,6 @@
  * Call a function treating errors as fatal:
  *     foo(arg, &error_fatal);
  *
- * Receive an error and pass it on to the caller:
- *     Error *err = NULL;
- *     foo(arg, &err);
- *     if (err) {
- *         handle the error...
- *         error_propagate(errp, err);
- *     }
- * where Error **errp is a parameter, by convention the last one.
- *
- * Do *not* "optimize" this to
- *     foo(arg, errp);
- *     if (*errp) { // WRONG!
- *         handle the error...
- *     }
- * because errp may be NULL!
- *
- * But when all you do with the error is pass it on, please use
- *     foo(arg, errp);
- * for readability.
- *
  * Receive and accumulate multiple errors (first one wins):
  *     Error *err = NULL, *local_err = NULL;
  *     foo(arg, &err);
@@ -151,6 +194,61 @@
  *         error_setg(&err, ...); // WRONG!
  *     }
  * because this may pass a non-null err to error_setg().
+ *
+ * DEPRECATED*
+ *
+ * The following pattern of receiving, checking, and then forwarding an error
+ * to the caller by hand is now deprecated:
+ *
+ *     Error *err = NULL;
+ *     foo(arg, &err);
+ *     if (err) {
+ *         handle the error...
+ *         error_propagate(errp, err);
+ *     }
+ *
+ * Instead, use ERRP_AUTO_PROPAGATE macro.
+ *
+ * The old pattern is deprecated because of two things:
+ *
+ * 1. Issue with error_abort and error_propagate: when we wrap error_abort by
+ * local_err+error_propagate, the resulting coredump will refer to
+ * error_propagate and not to the place where error happened.
+ *
+ * 2. A lot of extra code of the same pattern
+ *
+ * How to update old code to use ERRP_AUTO_PROPAGATE?
+ *
+ * All you need is to add ERRP_AUTO_PROPAGATE() invocation at function start,
+ * than you may safely dereference errp to check errors and do not need any
+ * additional local Error variables or calls to error_propagate().
+ *
+ * Example:
+ *
+ * old code
+ *
+ *     void fn(..., Error **errp) {
+ *         Error *err = NULL;
+ *         foo(arg, &err);
+ *         if (err) {
+ *             handle the error...
+ *             error_propagate(errp, err);
+ *             return;
+ *         }
+ *         ...
+ *     }
+ *
+ * updated code
+ *
+ *     void fn(..., Error **errp) {
+ *         ERRP_AUTO_PROPAGATE();
+ *         foo(arg, errp);
+ *         if (*errp) {
+ *             handle the error...
+ *             return;
+ *         }
+ *         ...
+ *     }
  */
 
 #ifndef ERROR_H
@@ -359,6 +457,47 @@ void error_set_internal(Error **errp,
                         ErrorClass err_class, const char *fmt, ...)
     GCC_FMT_ATTR(6, 7);
 
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
+/*
+ * ERRP_AUTO_PROPAGATE
+ *
+ * This macro exists to assist with proper error handling in a function which
+ * uses an Error **errp parameter.  It must be used as the first line of a
+ * function which modifies an error (with error_prepend, error_append_hint, or
+ * similar) or which wants to dereference *errp.  It is still safe (but
+ * useless) to use in other functions.
+ *
+ * If errp is NULL or points to error_fatal, it is rewritten to point to a
+ * local Error object, which will be automatically propagated to the original
+ * errp on function exit (see error_propagator_cleanup).
+ *
+ * After invocation of this macro it is always safe to dereference errp
+ * (as it's not NULL anymore) and to add information by error_prepend or
+ * error_append_hint (as, if it was error_fatal, we swapped it with a
+ * local_error to be propagated on cleanup).
+ *
+ * Note: we don't wrap the error_abort case, as we want resulting coredump
+ * to point to the place where the error happened, not to error_propagate.
+ */
+#define ERRP_AUTO_PROPAGATE() \
+    g_auto(ErrorPropagator) _auto_errp_prop = {.errp = errp}; \
+    do { \
+        if (!errp || errp == &error_fatal) { \
+            errp = &_auto_errp_prop.local_err; \
+        } \
+    } while (0)
+
 /*
  * Special error destination to abort on error.
  * See error_setg() and error_propagate() for details.
-- 
2.21.0


