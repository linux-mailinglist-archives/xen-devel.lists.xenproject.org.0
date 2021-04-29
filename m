Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0056F36E273
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 02:15:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119634.226270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuKu-0007fq-B6; Thu, 29 Apr 2021 00:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119634.226270; Thu, 29 Apr 2021 00:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuKu-0007f3-5U; Thu, 29 Apr 2021 00:15:20 +0000
Received: by outflank-mailman (input) for mailman id 119634;
 Thu, 29 Apr 2021 00:15:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S48z=J2=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lbuKs-00072A-V0
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 00:15:18 +0000
Received: from mail-qk1-x734.google.com (unknown [2607:f8b0:4864:20::734])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 386a6d89-0e87-4b8b-8b32-2cc2046bbd63;
 Thu, 29 Apr 2021 00:14:45 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id z2so28593406qkb.9
 for <xen-devel@lists.xenproject.org>; Wed, 28 Apr 2021 17:14:45 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id r185sm1021694qkf.78.2021.04.28.17.14.44
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
X-Inumbo-ID: 386a6d89-0e87-4b8b-8b32-2cc2046bbd63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=kEyMtRkVLFS8i1iO7mYtPK1CFn3AKiqVnXMVPcMO4BI=;
        b=X3RpbNRLFIasvagDXGGPh4iUBDU69CrFMYzRIyLErGYCEdZ/F3ViE3SE66plN6a5Es
         gQkA6VfDpOKa+gfrhuUgEQqg0s3s40nSIS0TD3SKMmysMLO81KwfJelOvzVR/RmrX6cQ
         DYx9BKcFLihTy9DxumdgX4q5TTVzgoqJZcwTSPMFIi6nsa/0EBoxCmDlGmviX/RMozqb
         R/jrQU19YigGSDaIQJgF2vtl0vhDSvVydYT8kUALZT9MBoxn2zyyhzDNkhXrl8B4IvFZ
         TMiNDUapu0vrLGPlIa+fa3zAPGUy8OJ03glUmg8F2pe3wgirARY73Gk192qkx1ImG9Kz
         H4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=kEyMtRkVLFS8i1iO7mYtPK1CFn3AKiqVnXMVPcMO4BI=;
        b=NAPg34CgIfU0i5z8vvzL6l5VBDcrl6r0rMdq0IK0a6FLk71vEydQ29IQyh/0s9UGzq
         1VInsBCNBuZfKEVhfOaW8UnnvyubYfjyFmVjC979q0cm29ZRVtItcmlpX1I5c9Vc3zYK
         KhK8bla3mfcVWJQJbBlID7gMrD2Qv42VI1ykENqV5TTF/8UQLV0XXTA+yASFXMefiL0N
         Qo4bmr3ywxTKmX4sKCmNhx/FVRBcs8TClMdx0yuysHxa2J9whcu/NudYQwvnbYIC1KTL
         sgmYpWeTqqjz3JuN3GDahmAry75DqT6OOxoD+n+iTwDemPGIv7yDTFCoZRzmOerf/WbN
         OEOA==
X-Gm-Message-State: AOAM531zPF0Cm4R673pW/vnebAFeTesIHxbS+S0ZBPu+jBEOfhbdQvH2
	o6TYSQDfxHn7DqSSoUUTi8IWhkr5fbQ=
X-Google-Smtp-Source: ABdhPJwd6DikwTnvprfp3pacBRfo7u3DzsZpMRnz89VqwVPX1hHAa4qPM5XCgXmkwZii7SBHi9g5wA==
X-Received: by 2002:ae9:ebd1:: with SMTP id b200mr31607745qkg.200.1619655285229;
        Wed, 28 Apr 2021 17:14:45 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 08/12] golang/xenlight: add functional options to configure Context
Date: Wed, 28 Apr 2021 20:14:30 -0400
Message-Id: <dc5cd6728e8477c9eb3ba75a55c7128da46a86ef.1619655104.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619650820.git.rosbrookn@ainfosec.com>
References: <cover.1619650820.git.rosbrookn@ainfosec.com>
In-Reply-To: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1619655104.git.rosbrookn@ainfosec.com>
References: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1619655104.git.rosbrookn@ainfosec.com>

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


