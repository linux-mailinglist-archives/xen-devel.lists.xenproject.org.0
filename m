Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 093C036E272
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 02:15:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119631.226258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuKo-0007Zl-Uo; Thu, 29 Apr 2021 00:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119631.226258; Thu, 29 Apr 2021 00:15:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuKo-0007ZA-Qx; Thu, 29 Apr 2021 00:15:14 +0000
Received: by outflank-mailman (input) for mailman id 119631;
 Thu, 29 Apr 2021 00:15:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S48z=J2=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lbuKn-00072A-Ue
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 00:15:13 +0000
Received: from mail-qk1-x72e.google.com (unknown [2607:f8b0:4864:20::72e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37bb3426-b71e-45e2-bc68-03a2f74e5d3c;
 Thu, 29 Apr 2021 00:14:44 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id 66so26014683qkf.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Apr 2021 17:14:44 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id r185sm1021694qkf.78.2021.04.28.17.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 17:14:44 -0700 (PDT)
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
X-Inumbo-ID: 37bb3426-b71e-45e2-bc68-03a2f74e5d3c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=9uXGDDpJ9CrrbQAMDJkXAgE2yF4sZn3Mfqg0mD2vt8w=;
        b=GnTD7+ioGmWtK61iTA0bx7cyHU0a79TZRJjUpxX7SJpCsngstCsdi8DNFAftO8wNct
         qdsunU3kYNZsykJBWeKY9spMoDYeZTlwDTrJg5/GttOrqKBg02GZnPcaktxDb3OPGdEj
         knlQn9X9yacB7NSIEouOOdQ/nIFAbH1jlrd+bAl05cFNz0xU4xUf4cjnhP2WWo4BXCUl
         vnwqEJmOto/5beyWSbfhiIq7ICi4KgPJqm3562XL8nWxBQnyXRX/JEkuoJRJcOHif0BN
         Oih51vEEyTJjO4eRNgQ/rrGNSzMqqNkM/8Nz0s3zceE86DnA+yXmOXjk264HW2uoevLo
         I4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=9uXGDDpJ9CrrbQAMDJkXAgE2yF4sZn3Mfqg0mD2vt8w=;
        b=c9sZN3w70RzfS87gsYc4Kb9bz1ipUcCkk1pqCrwvd8NF+KH/I09EY16p2xrEiihFI/
         K8rwcwCaYfHZ9LlscadZOgWpbY5ugn6VKtR6lPMbx7oYnAcX62e9JgHRQ0BVlkMp4eYi
         yVTIJXwGuZWQee8agpe5YOv3CgmeRsTFsdT8QvQgsrAja0mVaUbaEwTi1z9sknck3y8m
         y6v5EKnx3wvRTRKXcRtx5uVK83YL/VlRUw6Z2KxSPVtnHxZEWmg4UJpgnNdsogNtl3PO
         JH7L9tOy/R+0CZDy9krzgOLC8PfRB13Y1d9D6/A2QgXSkdOMjIKlwhrSRSI40+KBDdBv
         Ip5w==
X-Gm-Message-State: AOAM530ApSorZxHeTCZxyTqpIiSheFNDiwQ3BIBQu+ViMOXg1aOzId+2
	8oaFTqs8Bg6Rpiumz26kYnpC2Wobsvo=
X-Google-Smtp-Source: ABdhPJzmlwZ2l6XQ2OEYQV12XIJkjXJHZ2yBLWVjPqShw9X6B6nDd+5PO1V3AVAs411HFMk1LjskBA==
X-Received: by 2002:a37:492:: with SMTP id 140mr31742249qke.161.1619655284380;
        Wed, 28 Apr 2021 17:14:44 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 07/12] golang/xenlight: add logging conveniences for within xenlight
Date: Wed, 28 Apr 2021 20:14:29 -0400
Message-Id: <452aac2489990ac0195c62d8cb820fbe5786c466.1619655104.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619650820.git.rosbrookn@ainfosec.com>
References: <cover.1619650820.git.rosbrookn@ainfosec.com>
In-Reply-To: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1619655104.git.rosbrookn@ainfosec.com>
References: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1619655104.git.rosbrookn@ainfosec.com>

Add some logging methods to Context to provide easy use of the
Contenxt's xentoollog_logger. These are not exported, but the LogLevel
type is so that a later commit can allow the Context's log level to be
configurable.

Becuase cgo does not support calling C functions with variable
arguments, e.g. xtl_log, add an xtl_log_wrap function to the cgo preamble
that accepts an already formatted string, and handle the formatting in
Go.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/xenlight.go | 45 +++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index fc3eb0bf3f..f68d7b6e97 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -32,6 +32,15 @@ static const libxl_childproc_hooks childproc_hooks = { .chldowner = libxl_sigchl
 void xenlight_set_chldproc(libxl_ctx *ctx) {
 	libxl_childproc_setmode(ctx, &childproc_hooks, NULL);
 }
+
+void xtl_log_wrap(struct xentoollog_logger *logger,
+		  xentoollog_level level,
+		  int errnoval,
+		  const char *context,
+		  const char *msg)
+{
+    xtl_log(logger, level, errnoval, context, "%s", msg);
+}
 */
 import "C"
 
@@ -192,6 +201,42 @@ func (ctx *Context) Close() error {
 	return nil
 }
 
+// LogLevel represents an xentoollog_level, and can be used to configre the log
+// level of a Context's logger.
+type LogLevel int
+
+const (
+	//LogLevelNone     LogLevel = C.XTL_NONE
+	LogLevelDebug    LogLevel = C.XTL_DEBUG
+	LogLevelVerbose  LogLevel = C.XTL_VERBOSE
+	LogLevelDetail   LogLevel = C.XTL_DETAIL
+	LogLevelProgress LogLevel = C.XTL_PROGRESS
+	LogLevelInfo     LogLevel = C.XTL_INFO
+	LogLevelNotice   LogLevel = C.XTL_NOTICE
+	LogLevelWarn     LogLevel = C.XTL_WARN
+	LogLevelError    LogLevel = C.XTL_ERROR
+	LogLevelCritical LogLevel = C.XTL_CRITICAL
+	//LogLevelNumLevels LogLevel = C.XTL_NUM_LEVELS
+)
+
+func (ctx *Context) log(lvl LogLevel, errnoval int, format string, a ...interface{}) {
+	msg := C.CString(fmt.Sprintf(format, a...))
+	defer C.free(unsafe.Pointer(msg))
+	context := C.CString("xenlight")
+	defer C.free(unsafe.Pointer(context))
+
+	C.xtl_log_wrap((*C.xentoollog_logger)(unsafe.Pointer(ctx.logger)),
+		C.xentoollog_level(lvl), C.int(errnoval), context, msg)
+}
+
+func (ctx *Context) logd(format string, a ...interface{}) {
+	ctx.log(LogLevelDebug, -1, format, a...)
+}
+
+func (ctx *Context) logw(format string, a ...interface{}) {
+	ctx.log(LogLevelWarn, -1, format, a...)
+}
+
 /*
  * Types: Builtins
  */
-- 
2.17.1


