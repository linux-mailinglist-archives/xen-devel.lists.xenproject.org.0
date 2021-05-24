Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D455838F47A
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 22:38:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131891.246340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHL7-0004z7-Pp; Mon, 24 May 2021 20:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131891.246340; Mon, 24 May 2021 20:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHL7-0004uF-Jd; Mon, 24 May 2021 20:38:17 +0000
Received: by outflank-mailman (input) for mailman id 131891;
 Mon, 24 May 2021 20:38:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+P1=KT=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1llHL5-0001ey-SW
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 20:38:15 +0000
Received: from mail-qt1-x829.google.com (unknown [2607:f8b0:4864:20::829])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b97bdf1b-26ce-4ef3-95a2-ccf3d493893c;
 Mon, 24 May 2021 20:37:47 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id v4so21607714qtp.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 13:37:47 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id t25sm5142847qkt.62.2021.05.24.13.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 13:37:46 -0700 (PDT)
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
X-Inumbo-ID: b97bdf1b-26ce-4ef3-95a2-ccf3d493893c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=9uXGDDpJ9CrrbQAMDJkXAgE2yF4sZn3Mfqg0mD2vt8w=;
        b=f+S1418ZVs4jNRq5JPcL3ZkKr/yrsAXbaZwrixfKE08F34Gf8M/kgrpE7MYUQNXeHS
         ZaMzEcsPVNwNb7usCAXyuhZlRRZNHXm8GLPSjDGo972/srrl+LbxcsZPSpE4dw2ZSbfq
         LsYRd4puWnoPH91/1WqxJqLr30HAO1osjX/By9pN8+930wD+DQu42h7hYkPZTptitofh
         xFTNoeDxfCZOZtdSy3PUxfd+eHU9ZaOQZwt6rpIsNtdjVZgEa7eLc0ufQ5Tg8Kp+gJsf
         O2OWXYtKDvkLzM2raQjQUkIZ1avB2+ywbnj7CctVWQi9OKHkSObtBF0m6U6pE5AANhez
         zcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=9uXGDDpJ9CrrbQAMDJkXAgE2yF4sZn3Mfqg0mD2vt8w=;
        b=NoJswnTlHHrxzCY3fiqm5Dz7THX2Vz+ylN8Bv+5o3xKjaTmcZ5kqfeUt78FIg1Hefj
         /mt1zsF395aZ52XunnoSn9garPjS27uI+jTXJFJnYTRB233NpmRQdl/Q6ycJQP1NMAol
         BMhIxu9E5UzUjPH8wG3Ea72EM4KjWG4ClRxj8DC6i9OGd3tzyVYp4UtN4+QBOnQdM4yk
         jPh+V7A3509KUHSGwrV2H2qKuVIb1v3cFevC1HyF+sAVXrq8gx63cJMw0VRjRikRhujr
         Wgf4mzblP/bKL7+fqzWF4fZ2ROPOJLJXHg2jdAygjIOgAph6QWamdBsjJc7LrVf9VXAa
         yroQ==
X-Gm-Message-State: AOAM530O3y6OwdP3X/mI2D+f+e3bxzYOt9kE9ONYXruy/LAAwyGz/YyU
	bwoYwsz6liaMH9MgNqGSNq8=
X-Google-Smtp-Source: ABdhPJz32pZMzPFi766pOO+4M3WoRNhbgUGhqo72JUmiexqunSwH+GtFEWRIQDP9xPyXbh3tDHoj6g==
X-Received: by 2002:ac8:7e93:: with SMTP id w19mr27948061qtj.314.1621888666941;
        Mon, 24 May 2021 13:37:46 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.prg,
	xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [RESEND PATCH 07/12] golang/xenlight: add logging conveniences for within xenlight
Date: Mon, 24 May 2021 16:36:48 -0400
Message-Id: <452aac2489990ac0195c62d8cb820fbe5786c466.1621887506.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>

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


