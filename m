Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 736A41A60CE
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2020 00:03:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jNkgm-0003EM-D6; Sun, 12 Apr 2020 22:02:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Dwh=54=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jNkgl-0003EF-JE
 for xen-devel@lists.xenproject.org; Sun, 12 Apr 2020 22:02:51 +0000
X-Inumbo-ID: 57e82190-7d09-11ea-b58d-bc764e2007e4
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57e82190-7d09-11ea-b58d-bc764e2007e4;
 Sun, 12 Apr 2020 22:02:47 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id q73so3616609qvq.2
 for <xen-devel@lists.xenproject.org>; Sun, 12 Apr 2020 15:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=EYuJy7ICD2kfNTKAB5E+SVFDtpQL5zTM1dMZH8Nfw14=;
 b=ADa+qUn5NQzV1qu4k6654JciCe63UHdb3SDQW9LOG4BvO3u9NLetoxp0KDUSNTWaZf
 jKCsdqZxSu2snqj/vc4AULhFMgKyThQMhgmvUYdYRFvuPFbA6yiVhO1izoacj1i8toQl
 XeNMrwTWDu33P2mT3SbSyQ4E0GE8gsVshcSdYpdbuGLYBU4u9yXTC6Fz4AMhx9E5hI6v
 7C0B7Z/TWEsx9/pLK7Kanm/o4JsW6e76sRiDuaHAQGFrd3PS05vdEhM0BJE3KLzSDhng
 4UU80/mYEMJsZm8YvEe0ggSQ0mCcCJetaT61TDJW9uys377wmFyfaBdOjgRURcDMp8Mv
 Ssrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=EYuJy7ICD2kfNTKAB5E+SVFDtpQL5zTM1dMZH8Nfw14=;
 b=uXtcnXXXR7yzBMzektehxuZMWVuOWZINBrrODBaq18TsCUgI1QRCp+zlK3r2VWeX1F
 xpNrg2fqE5GooXCrCR+xNdTAoPSQwy9ZsozqlNSXI9b/xTa46kSPqlwNG+oVIuLlIQ6h
 ua8EPG2Ps+Qy6Qwug74Gk7E7Vmot+Qc2iOvkVVeXxJ5VXXMR0zru2kAEn1gjkZLDbWXe
 KgE3WQtAE2OTfN/7JVgw380yrKRbshQwiAjvzbNuBZoI3Y4UuRw3q7cZgg9G0wEHSqV1
 UKJIVy6Urag3MonBXBPXaKzyYn0J0jRl3tI9Ejnul4NZyLZALDwP7gJXD2NHWs/FMmQW
 0TCQ==
X-Gm-Message-State: AGi0PuadroHCD4lUZlsZRgC1Sw+p+NMszvln0TyxKtUeMpsjRhnogiNM
 LNgGaRKHW7+IjvjRGWc0b9WANF7s
X-Google-Smtp-Source: APiQypKOSKazjyYGBfbvqjoDULajgQ4tkzHcgT01amGgnMryarJC3NHwfSK8I5N3KYiDpNCYXdpyVQ==
X-Received: by 2002:a05:6214:1e5:: with SMTP id
 c5mr14095258qvu.79.1586728966528; 
 Sun, 12 Apr 2020 15:02:46 -0700 (PDT)
Received: from four.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 s14sm3691128qts.70.2020.04.12.15.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:02:45 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 1/4] golang/xenlight: add NameToDomid and DomidToName util
 functions
Date: Sun, 12 Apr 2020 18:02:39 -0400
Message-Id: <e2d8d6c1293c8251be881cd471265aa8188ae2ae.1586727061.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1586727061.git.rosbrookn@ainfosec.com>
References: <cover.1586727061.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1586727061.git.rosbrookn@ainfosec.com>
References: <cover.1586727061.git.rosbrookn@ainfosec.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 tools/golang/xenlight/xenlight.go | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index 3f1b0baa0c..8492bcec4e 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -20,6 +20,7 @@ package xenlight
 #cgo LDFLAGS: -lxenlight -lyajl -lxentoollog
 #include <stdlib.h>
 #include <libxl.h>
+#include <libxl_utils.h>
 */
 import "C"
 
@@ -124,6 +125,28 @@ func (ctx *Context) Close() error {
 
 type Domid uint32
 
+// NameToDomid returns the Domid for a domain, given its name, if it exists.
+func (Ctx *Context) NameToDomid(name string) (Domid, error) {
+	var domid C.uint32_t
+
+	cname := C.CString(name)
+	defer C.free(unsafe.Pointer(cname))
+
+	if ret := C.libxl_name_to_domid(Ctx.ctx, cname, &domid); ret != 0 {
+		return ^Domid(0), Error(ret)
+	}
+
+	return Domid(domid), nil
+}
+
+// DomidToName returns the name for a domain, given its domid.
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


