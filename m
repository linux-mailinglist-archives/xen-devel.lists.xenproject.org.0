Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9631D0413
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 02:56:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYfgn-00064F-Mu; Wed, 13 May 2020 00:56:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FcTI=63=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jYfgm-000646-9y
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 00:56:00 +0000
X-Inumbo-ID: 8090bc20-94b4-11ea-ae69-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8090bc20-94b4-11ea-ae69-bc764e2007e4;
 Wed, 13 May 2020 00:55:56 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id i68so12867109qtb.5
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2020 17:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=vucWzifnCHg1Y17H84jeYTA4ym+JO/tR6T+lTmzuxUM=;
 b=nFwHOxIyQmzykfR4t6Lqr1JLUBfjw6TpV3GM0+nB9D79zh+TotaGfgG11UemFt7Adj
 QpiNhIOWB1LW5E3UhqOSmz5I0YcY8ifsuCpN8upCe3YgVAqskiiF0psYKUttBMeZK3Rb
 rfMlbiYg7Y6obDCP1hruvkfFp7Ek2ZldAIyB2TL3NZg/UIy0h2lqOLk2knz/ILX/m1u1
 N2DiP/j2LrNnLncOe2BGliPHdlrVS59He/s64RMwA18xLXnKR/MrTR0Z75zutnHFKTcb
 7JhNisfQLDqmczUGs8Ph/yb6BrpNuSL5VSG//nDoAHKxY6ccJ+2M094snSOs/EwO3aiI
 sIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=vucWzifnCHg1Y17H84jeYTA4ym+JO/tR6T+lTmzuxUM=;
 b=DNvfWDQUoJ09ucxLK8wSuuaIZ6e11/QGyFZFJoajDsauXvT7vyz36iT6mUd32mQaxo
 H5Ait62QBFK+ZdA8efr5N6WGwAL71b1soA8brj5lZ0L0UdvFzdUqhlN5jyJPL0HV/Pbj
 JcWJ8rbCRrwwNd7N8hEWF00HLY9+Ln5P+lpAfJXCoeI5lhljVEeQW4vzDaDSePoklsLZ
 wS4tl2v0scIaUOeNenBphFs8OQ1nH0FktHbHOOhognDLtxMj2NANGsqGCCvKvqrL/fUG
 i6TjxO5yZe4KKx5B17XkjLrOTqXOohZwYKpLWGjhNCy7t9nQLj0sET/RWUCTalXMxcP0
 3R0g==
X-Gm-Message-State: AGi0PubWI9EPYVg67scmqAfz6uMAfDhWwXexhLY5v1sU4+prKasvd/np
 tGdyOoRN5j2sKRdQZSS1LlgE/SjNS/4=
X-Google-Smtp-Source: APiQypL+6WJmum4S4Lp8c1UA4uB8kZY4IOWco9PVZueHJf77++cWuk8UFJRu+Z2ujqjmdlZiGd4JhQ==
X-Received: by 2002:aed:3788:: with SMTP id j8mr24430376qtb.113.1589331355391; 
 Tue, 12 May 2020 17:55:55 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id y28sm8388602qtc.62.2020.05.12.17.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 17:55:54 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 1/1] golang/xenlight: add NameToDomid and DomidToName util
 functions
Date: Tue, 12 May 2020 20:55:50 -0400
Message-Id: <a543eec1da35b619a06816f8aed29774daa38cb7.1589321804.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589321804.git.rosbrookn@ainfosec.com>
References: <cover.1589321804.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1589321804.git.rosbrookn@ainfosec.com>
References: <cover.1589321804.git.rosbrookn@ainfosec.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Many exported functions in xenlight require a domid as an argument. Make
it easier for package users to use these functions by adding wrappers
for the libxl utility functions libxl_name_to_domid and
libxl_domid_to_name.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/xenlight.go | 40 ++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index 6b4f492550..742e5e11f1 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -21,13 +21,15 @@ package xenlight
 #cgo LDFLAGS: -lxenlight -lyajl -lxentoollog
 #include <stdlib.h>
 #include <libxl.h>
+#include <libxl_utils.h>
+
+#define INVALID_DOMID_TYPED ((uint32_t) INVALID_DOMID)
 
 static const libxl_childproc_hooks childproc_hooks = { .chldowner = libxl_sigchld_owner_mainloop };
 
 void xenlight_set_chldproc(libxl_ctx *ctx) {
 	libxl_childproc_setmode(ctx, &childproc_hooks, NULL);
 }
-
 */
 import "C"
 
@@ -75,6 +77,10 @@ var libxlErrors = map[Error]string{
 	ErrorFeatureRemoved:               "Feature removed",
 }
 
+const (
+	DomidInvalid Domid = Domid(C.INVALID_DOMID_TYPED)
+)
+
 func (e Error) Error() string {
 	if s, ok := libxlErrors[e]; ok {
 		return s
@@ -190,6 +196,38 @@ func (ctx *Context) Close() error {
 
 type Domid uint32
 
+// NameToDomid returns the Domid for a domain, given its name, if it exists.
+//
+// NameToDomid does not guarantee that the domid associated with name at
+// the time NameToDomid is called is the same as the domid associated with
+// name at the time NameToDomid returns.
+func (Ctx *Context) NameToDomid(name string) (Domid, error) {
+	var domid C.uint32_t
+
+	cname := C.CString(name)
+	defer C.free(unsafe.Pointer(cname))
+
+	if ret := C.libxl_name_to_domid(Ctx.ctx, cname, &domid); ret != 0 {
+		return DomidInvalid, Error(ret)
+	}
+
+	return Domid(domid), nil
+}
+
+// DomidToName returns the name for a domain, given its domid. If there
+// is no domain with the given domid, DomidToName will return the empty
+// string.
+//
+// DomidToName does not guarantee that the name (if any) associated with domid
+// at the time DomidToName is called is the same as the name (if any) associated
+// with domid at the time DomidToName returns.
+func (Ctx *Context) DomidToName(domid Domid) string {
+	cname := C.libxl_domid_to_name(Ctx.ctx, C.uint32_t(domid))
+	defer C.free(unsafe.Pointer(cname))
+
+	return C.GoString(cname)
+}
+
 // Devid is a device ID.
 type Devid int
 
-- 
2.17.1


