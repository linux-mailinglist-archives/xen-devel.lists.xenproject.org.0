Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F6F38F480
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 22:38:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131897.246350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHLD-0005aP-3f; Mon, 24 May 2021 20:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131897.246350; Mon, 24 May 2021 20:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHLC-0005X5-VE; Mon, 24 May 2021 20:38:22 +0000
Received: by outflank-mailman (input) for mailman id 131897;
 Mon, 24 May 2021 20:38:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+P1=KT=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1llHLA-0001ey-Sp
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 20:38:20 +0000
Received: from mail-qv1-xf33.google.com (unknown [2607:f8b0:4864:20::f33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 350ac5e6-6dfb-4f62-a383-343ea6a0b2f6;
 Mon, 24 May 2021 20:37:48 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id c13so13706066qvx.5
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 13:37:48 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id t25sm5142847qkt.62.2021.05.24.13.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 13:37:47 -0700 (PDT)
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
X-Inumbo-ID: 350ac5e6-6dfb-4f62-a383-343ea6a0b2f6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=kEyMtRkVLFS8i1iO7mYtPK1CFn3AKiqVnXMVPcMO4BI=;
        b=Vrt/ol88f+vhW1GfAucOx70Qu+yZwIoMcbshMwrLnzRMhAgYMMK/Lv46VGXZpfqnP1
         5bS1YfA5QIfmt94DA8U5eGKapbh6dVmPmRpJ9eqltYO+zTibgImd5DT+d9ZbMSx15xhR
         wnQu8yiv2m1DoMGoNFRdoyqDyzVMtjDZr7ChQ3I6WsBoEnhjgCnzEvK2F8zvi+lOPZ83
         W8eqVuHxo1S8zOY7XH/fstFsFT3+IlbU59swx2mSkXsHx3ooI1w1D/cIQRDIZUfna2tf
         hy6GH4YM9V1Sxi6l8UplT1EpeTrmXVu1fMMgNm9n4o5yi2jYhXe2kwsKkwQ/gmXYLmhE
         /xPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=kEyMtRkVLFS8i1iO7mYtPK1CFn3AKiqVnXMVPcMO4BI=;
        b=kbIT20CGEhNwhYmb1ZZ+UZ/yrzDGfzzYsHoqGm8VFWrh0LR5mFGZwqlxQtu7asBfau
         K0PsrH3oXHZXOyu9Vq2Nsejz/gGOeycjvJezLUt9vOSigDVgPshdE9ZDce83+W8u/FIC
         J+lmOOsP56Yr8cTAX8idGbciCsJqe7/bbYwiTIPpcPJXZo0aIXsaGm73Qyx80PdTljjW
         KXzlpNG9yGC+v45c4uxbENt2Q14gUdUaELDhghwSr2QJPgF8ZMOWbIhJBqGxkNdXYOzo
         XNXo0WUwahXA1UG9UnDsxlV6pYDUDsCPLvQ5UmvrJcdH/4nLszFX6efdScgyO9JulAe8
         Di/A==
X-Gm-Message-State: AOAM532qM9H6qHUKK/+XJ2eIdrnJU4jX20Rs1egteCbIfiVa7uOkAxDi
	J+PtzVnlT2xEdHIKVGxypDc=
X-Google-Smtp-Source: ABdhPJzv32CRG5XOYG3kL2lFnYIno7V3neguHQ9gP5UhEg2ReDfWkIk7Hkqp+XEdktaK/+wjnh6OoA==
X-Received: by 2002:a0c:b28c:: with SMTP id r12mr32851943qve.32.1621888667919;
        Mon, 24 May 2021 13:37:47 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.prg,
	xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [RESEND PATCH 08/12] golang/xenlight: add functional options to configure Context
Date: Mon, 24 May 2021 16:36:49 -0400
Message-Id: <dc5cd6728e8477c9eb3ba75a55c7128da46a86ef.1621887506.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>

Add a ContextOption type to support functional options in NewContext.
Then, add a variadic ContextOption parameter to NewContext, which allows
callers to specify 0 or more configuration options.

For now, just add the WithLogLevel option so that callers can set the
log level of the Context's xentoollog_logger. Future configuration
options can be created by adding an appropriate field to the
contextOptions struct and creating a With<OptionName> function to return
a ContextOption

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/xenlight.go | 44 +++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index f68d7b6e97..65f93abe32 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -136,7 +136,7 @@ func sigchldHandler(ctx *Context) {
 }
 
 // NewContext returns a new Context.
-func NewContext() (ctx *Context, err error) {
+func NewContext(opts ...ContextOption) (ctx *Context, err error) {
 	ctx = &Context{}
 
 	defer func() {
@@ -146,8 +146,19 @@ func NewContext() (ctx *Context, err error) {
 		}
 	}()
 
+	// Set the default context options. These fields may
+	// be modified by the provided opts.
+	copts := &contextOptions{
+		logLevel: LogLevelError,
+	}
+
+	for _, opt := range opts {
+		opt.apply(copts)
+	}
+
 	// Create a logger
-	ctx.logger = C.xtl_createlogger_stdiostream(C.stderr, C.XTL_ERROR, 0)
+	ctx.logger = C.xtl_createlogger_stdiostream(C.stderr,
+		C.xentoollog_level(copts.logLevel), 0)
 
 	// Allocate a context
 	ret := C.libxl_ctx_alloc(&ctx.ctx, C.LIBXL_VERSION, 0,
@@ -201,6 +212,35 @@ func (ctx *Context) Close() error {
 	return nil
 }
 
+type contextOptions struct {
+	logLevel LogLevel
+}
+
+// ContextOption is used to configure options for a Context.
+type ContextOption interface {
+	apply(*contextOptions)
+}
+
+type funcContextOption struct {
+	f func(*contextOptions)
+}
+
+func (fco *funcContextOption) apply(c *contextOptions) {
+	fco.f(c)
+}
+
+func newFuncContextOption(f func(*contextOptions)) *funcContextOption {
+	return &funcContextOption{f}
+}
+
+// WithLogLevel sets the log level for a Context's logger. The default level is
+// LogLevelError.
+func WithLogLevel(level LogLevel) ContextOption {
+	return newFuncContextOption(func(co *contextOptions) {
+		co.logLevel = level
+	})
+}
+
 // LogLevel represents an xentoollog_level, and can be used to configre the log
 // level of a Context's logger.
 type LogLevel int
-- 
2.17.1


