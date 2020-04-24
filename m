Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7FB1B6BB0
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 05:03:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRobr-0001Wv-3t; Fri, 24 Apr 2020 03:02:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6uIs=6I=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jRobp-0001Wl-U5
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 03:02:33 +0000
X-Inumbo-ID: 08c207b6-85d8-11ea-b4f4-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08c207b6-85d8-11ea-b4f4-bc764e2007e4;
 Fri, 24 Apr 2020 03:02:29 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id n143so8857110qkn.8
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2020 20:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=omHxvvNf5Pv3ZOKDgsTQhZY6McIm27KQ9kB0Xgc12vs=;
 b=C2Uq/YbmHigGFo6KhCvp4kIJ8dmQfhohEld85TPbtshStz29W6ifHSHOBUk0prL1tZ
 Irawxeq6f+zokpyHBhGd8vxmxb1KQhji2GLpmm45i2z/Q2WwwrCjBiFfxbkL4P9S5Oh2
 01REU9C6XE7behfxHiB8dv5QteFbLqJC7ZUeKXiZ5FsOLwxfywS8fKeeif+ZjYqPPSTp
 ppA1Qejan35IfX7Xc6aINllAg3IzJoLg2mpVAtnZooG46RKV9mm11QUwb/c0EJeFq2b3
 1gXYBDgYk3J3QVSSHyEJUuXUiq0IjdL/F0+MXCskDxdQzpr4uh8AGzR+9uDdXKxCtbtZ
 yr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=omHxvvNf5Pv3ZOKDgsTQhZY6McIm27KQ9kB0Xgc12vs=;
 b=tyW8IZDIrV+HcsP14e3tXf6F5laJfRbvZTZCcF71lm0P6ZROxHe8cR419W84FpITK6
 Zy4yF7mrLgLqEALEFZh7uprrCjVR80p5VQAvCkbm17coB7TopEUjHXAXQ3taSEPPcnjE
 b7Sw5yovNS+cMGiEQReKFh6vdb8ef+Z18doUfrSwyMu2GNvwNSRdeFrKkuistnhsCDnb
 PjhEm/pclaDH3cPdNe4A2Lq6jsNNLxK32QlEu8lqGshVxlievRdcLMGU3974tGF6WwX5
 OJmZpzW4C/hqJg5gON2oGSBYnftQAZYtjuXaTgzTl4uY1QfBHclUrGhJf8etCOViSLal
 D0mA==
X-Gm-Message-State: AGi0PublMr6ysNQlMq+ItzAVq+n7oBuShGIsS3r6DJHfLvz9IeK3wlaJ
 3J00Cz6J750YXr53KhjcCHdKwKzQcYs=
X-Google-Smtp-Source: APiQypJxMngb7/CVOcVv3eCLHUwJvwuuVqm7Eg3mvEw1Buwl3RBkj+MxsJv9A9JxHPigGo4k5h25YA==
X-Received: by 2002:ae9:ef93:: with SMTP id d141mr6908540qkg.311.1587697348777; 
 Thu, 23 Apr 2020 20:02:28 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id i6sm2836197qkk.123.2020.04.23.20.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 20:02:28 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/1] golang/xenlight: add NameToDomid and DomidToName util
 functions
Date: Thu, 23 Apr 2020 23:02:24 -0400
Message-Id: <73e709cf0a87f3728de438e4a3b849462fd098ac.1587682041.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587682041.git.rosbrookn@ainfosec.com>
References: <cover.1587682041.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1587682041.git.rosbrookn@ainfosec.com>
References: <cover.1587682041.git.rosbrookn@ainfosec.com>
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
 tools/golang/xenlight/xenlight.go | 38 ++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index 6b4f492550..d1d30b63e1 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -21,13 +21,13 @@ package xenlight
 #cgo LDFLAGS: -lxenlight -lyajl -lxentoollog
 #include <stdlib.h>
 #include <libxl.h>
+#include <libxl_utils.h>
 
 static const libxl_childproc_hooks childproc_hooks = { .chldowner = libxl_sigchld_owner_mainloop };
 
 void xenlight_set_chldproc(libxl_ctx *ctx) {
 	libxl_childproc_setmode(ctx, &childproc_hooks, NULL);
 }
-
 */
 import "C"
 
@@ -75,6 +75,10 @@ var libxlErrors = map[Error]string{
 	ErrorFeatureRemoved:               "Feature removed",
 }
 
+const (
+	DomidInvalid Domid = ^Domid(0)
+)
+
 func (e Error) Error() string {
 	if s, ok := libxlErrors[e]; ok {
 		return s
@@ -190,6 +194,38 @@ func (ctx *Context) Close() error {
 
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


