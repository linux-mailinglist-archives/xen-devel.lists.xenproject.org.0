Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EED538F48C
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 22:43:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131970.246413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHQG-0001lW-CH; Mon, 24 May 2021 20:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131970.246413; Mon, 24 May 2021 20:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHQG-0001jO-7r; Mon, 24 May 2021 20:43:36 +0000
Received: by outflank-mailman (input) for mailman id 131970;
 Mon, 24 May 2021 20:43:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+P1=KT=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1llHLP-0001ey-TM
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 20:38:35 +0000
Received: from mail-qv1-xf32.google.com (unknown [2607:f8b0:4864:20::f32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00947046-2e8c-4f35-809d-b69a18d0ab17;
 Mon, 24 May 2021 20:37:51 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id ez19so14903082qvb.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 13:37:51 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id t25sm5142847qkt.62.2021.05.24.13.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 13:37:50 -0700 (PDT)
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
X-Inumbo-ID: 00947046-2e8c-4f35-809d-b69a18d0ab17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=8RHEO4rjzSWCDCSeU8KH/ouMS7fzg0KSm8WpWB6iQ0M=;
        b=nLWFNrdnKIm7Ua2HOww9s19j0PP204z3qiMCFBp+83qlAImJwMTOuRRCJsRXJR5zDP
         ErdrQ0XGJpNnYYHP6bjIOeLKzUXQfnP7NYVbSKeXHFOcg0oWV9c9BlamjIfwYvplKB1t
         uD6XiotgzFevOJBGv6JpehpiSc8bMqyKeiSz7ZhddO/rmHvg9TpZoj9d7p1gDqAcJRyR
         nboeKBqFhx91jBLRutaAJjCUv5GWL+F26WDCRa0O5YsdgCOzYNTCtJ5+S0nj2gXABSw9
         CKDu1zE/S+Yaxi+IshtHMHT1lDBK/dSCeDHCrrgJatUfKcCpoBIRTDQGnn3r4R1pBa5p
         mhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=8RHEO4rjzSWCDCSeU8KH/ouMS7fzg0KSm8WpWB6iQ0M=;
        b=lzli4nSrlgK9rJS83lr7dOt241jqKIaHD3BGgKjNWyygtnn2504nxmoQjrV+L9TQeZ
         njHvm6Y2GHsGlzM/wdVQxuJIQrj0FYNwxHJLMtEbRVhmdwphZ5PV1py82vq/CpaMNL/T
         3MewJbl8NhvYvLtcN3l/FDcifeK+mXRf3nztL2FkeqLJUcBD981G/LnxZSwd05nsQdYq
         nBOuClGOaDjWJQz9TvyvEChoeIGMUGMpGFEXl3PG6oUSJwApw8uPn7CMlZgpLSgYv9rk
         14QX+U6Q0OIn5Bj1rbMl3kAThajze/EFIlX5Lh6XKz/qTSay+xDnFcIrcGwnCK53v03J
         3uPA==
X-Gm-Message-State: AOAM531HYLKZiZLgH5AVKdgHojHgtU4gxciMHNp7+Jl9K2SMkDocxzpv
	6VNXMVjfi4OLvr1dNnnB/BQ=
X-Google-Smtp-Source: ABdhPJwBi7YXGDE83pTP//+sHby1z1JIFNQPgNbLE9qNLpKIgm+Mq9a7Pnh1C7dJWjpJu4r1jDr2YQ==
X-Received: by 2002:a05:6214:11a4:: with SMTP id u4mr31962146qvv.55.1621888671080;
        Mon, 24 May 2021 13:37:51 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.prg,
	xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [RESEND PATCH 11/12] golang/xenlight: do not negate ret when converting to Error
Date: Mon, 24 May 2021 16:36:52 -0400
Message-Id: <82bc8b720c3dfb178e52d10ddbebfa8dc5880e7b.1621887506.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>

There are several locations where the return code from calling into C is
negated when being converted to Error. This results in error strings
like "libxl error: <x>", rather than the correct message. Fix all
occurrances of this by running:

  gofmt -w -r 'Error(-ret) -> Error(ret)' xenlight.go

from tools/golang/xenlight.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/xenlight.go | 46 +++++++++++++++----------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index d153feb851..6fb22665cc 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -668,7 +668,7 @@ func SchedulerFromString(name string) (s Scheduler, err error) {
 
 	ret := C.libxl_scheduler_from_string(cname, &cs)
 	if ret != 0 {
-		err = Error(-ret)
+		err = Error(ret)
 		return
 	}
 
@@ -707,7 +707,7 @@ func (ctx *Context) CpupoolInfo(Poolid uint32) (pool Cpupoolinfo, err error) {
 
 	ret := C.libxl_cpupool_info(ctx.ctx, &c_cpupool, C.uint32_t(Poolid))
 	if ret != 0 {
-		err = Error(-ret)
+		err = Error(ret)
 		return
 	}
 	defer C.libxl_cpupoolinfo_dispose(&c_cpupool)
@@ -741,7 +741,7 @@ func (ctx *Context) CpupoolCreate(Name string, Scheduler Scheduler, Cpumap Bitma
 	ret := C.libxl_cpupool_create(ctx.ctx, name, C.libxl_scheduler(Scheduler),
 		cbm, &uuid, &poolid)
 	if ret != 0 {
-		err = Error(-ret)
+		err = Error(ret)
 		return
 	}
 
@@ -754,7 +754,7 @@ func (ctx *Context) CpupoolCreate(Name string, Scheduler Scheduler, Cpumap Bitma
 func (ctx *Context) CpupoolDestroy(Poolid uint32) (err error) {
 	ret := C.libxl_cpupool_destroy(ctx.ctx, C.uint32_t(Poolid))
 	if ret != 0 {
-		err = Error(-ret)
+		err = Error(ret)
 		return
 	}
 
@@ -765,7 +765,7 @@ func (ctx *Context) CpupoolDestroy(Poolid uint32) (err error) {
 func (ctx *Context) CpupoolCpuadd(Poolid uint32, Cpu int) (err error) {
 	ret := C.libxl_cpupool_cpuadd(ctx.ctx, C.uint32_t(Poolid), C.int(Cpu))
 	if ret != 0 {
-		err = Error(-ret)
+		err = Error(ret)
 		return
 	}
 
@@ -783,7 +783,7 @@ func (ctx *Context) CpupoolCpuaddCpumap(Poolid uint32, Cpumap Bitmap) (err error
 
 	ret := C.libxl_cpupool_cpuadd_cpumap(ctx.ctx, C.uint32_t(Poolid), &cbm)
 	if ret != 0 {
-		err = Error(-ret)
+		err = Error(ret)
 		return
 	}
 
@@ -794,7 +794,7 @@ func (ctx *Context) CpupoolCpuaddCpumap(Poolid uint32, Cpumap Bitmap) (err error
 func (ctx *Context) CpupoolCpuremove(Poolid uint32, Cpu int) (err error) {
 	ret := C.libxl_cpupool_cpuremove(ctx.ctx, C.uint32_t(Poolid), C.int(Cpu))
 	if ret != 0 {
-		err = Error(-ret)
+		err = Error(ret)
 		return
 	}
 
@@ -812,7 +812,7 @@ func (ctx *Context) CpupoolCpuremoveCpumap(Poolid uint32, Cpumap Bitmap) (err er
 
 	ret := C.libxl_cpupool_cpuremove_cpumap(ctx.ctx, C.uint32_t(Poolid), &cbm)
 	if ret != 0 {
-		err = Error(-ret)
+		err = Error(ret)
 		return
 	}
 
@@ -826,7 +826,7 @@ func (ctx *Context) CpupoolRename(Name string, Poolid uint32) (err error) {
 
 	ret := C.libxl_cpupool_rename(ctx.ctx, name, C.uint32_t(Poolid))
 	if ret != 0 {
-		err = Error(-ret)
+		err = Error(ret)
 		return
 	}
 
@@ -839,7 +839,7 @@ func (ctx *Context) CpupoolCpuaddNode(Poolid uint32, Node int) (Cpus int, err er
 
 	ret := C.libxl_cpupool_cpuadd_node(ctx.ctx, C.uint32_t(Poolid), C.int(Node), &ccpus)
 	if ret != 0 {
-		err = Error(-ret)
+		err = Error(ret)
 		return
 	}
 
@@ -854,7 +854,7 @@ func (ctx *Context) CpupoolCpuremoveNode(Poolid uint32, Node int) (Cpus int, err
 
 	ret := C.libxl_cpupool_cpuremove_node(ctx.ctx, C.uint32_t(Poolid), C.int(Node), &ccpus)
 	if ret != 0 {
-		err = Error(-ret)
+		err = Error(ret)
 		return
 	}
 
@@ -867,7 +867,7 @@ func (ctx *Context) CpupoolCpuremoveNode(Poolid uint32, Node int) (Cpus int, err
 func (ctx *Context) CpupoolMovedomain(Poolid uint32, Id Domid) (err error) {
 	ret := C.libxl_cpupool_movedomain(ctx.ctx, C.uint32_t(Poolid), C.uint32_t(Id))
 	if ret != 0 {
-		err = Error(-ret)
+		err = Error(ret)
 		return
 	}
 
@@ -1028,7 +1028,7 @@ func (bm Bitmap) String() (s string) {
 func (ctx *Context) GetMaxCpus() (maxCpus int, err error) {
 	ret := C.libxl_get_max_cpus(ctx.ctx)
 	if ret < 0 {
-		err = Error(-ret)
+		err = Error(ret)
 		return
 	}
 	maxCpus = int(ret)
@@ -1039,7 +1039,7 @@ func (ctx *Context) GetMaxCpus() (maxCpus int, err error) {
 func (ctx *Context) GetOnlineCpus() (onCpus int, err error) {
 	ret := C.libxl_get_online_cpus(ctx.ctx)
 	if ret < 0 {
-		err = Error(-ret)
+		err = Error(ret)
 		return
 	}
 	onCpus = int(ret)
@@ -1050,7 +1050,7 @@ func (ctx *Context) GetOnlineCpus() (onCpus int, err error) {
 func (ctx *Context) GetMaxNodes() (maxNodes int, err error) {
 	ret := C.libxl_get_max_nodes(ctx.ctx)
 	if ret < 0 {
-		err = Error(-ret)
+		err = Error(ret)
 		return
 	}
 	maxNodes = int(ret)
@@ -1063,7 +1063,7 @@ func (ctx *Context) GetFreeMemory() (memkb uint64, err error) {
 	ret := C.libxl_get_free_memory(ctx.ctx, &cmem)
 
 	if ret < 0 {
-		err = Error(-ret)
+		err = Error(ret)
 		return
 	}
 
@@ -1108,7 +1108,7 @@ func (ctx *Context) DomainInfo(Id Domid) (di *Dominfo, err error) {
 	ret := C.libxl_domain_info(ctx.ctx, &cdi, C.uint32_t(Id))
 
 	if ret != 0 {
-		err = Error(-ret)
+		err = Error(ret)
 		return
 	}
 
@@ -1121,7 +1121,7 @@ func (ctx *Context) DomainUnpause(Id Domid) (err error) {
 	ret := C.libxl_domain_unpause(ctx.ctx, C.uint32_t(Id), nil)
 
 	if ret != 0 {
-		err = Error(-ret)
+		err = Error(ret)
 	}
 	return
 }
@@ -1131,7 +1131,7 @@ func (ctx *Context) DomainPause(id Domid) (err error) {
 	ret := C.libxl_domain_pause(ctx.ctx, C.uint32_t(id), nil)
 
 	if ret != 0 {
-		err = Error(-ret)
+		err = Error(ret)
 	}
 	return
 }
@@ -1141,7 +1141,7 @@ func (ctx *Context) DomainShutdown(id Domid) (err error) {
 	ret := C.libxl_domain_shutdown(ctx.ctx, C.uint32_t(id), nil)
 
 	if ret != 0 {
-		err = Error(-ret)
+		err = Error(ret)
 	}
 	return
 }
@@ -1151,7 +1151,7 @@ func (ctx *Context) DomainReboot(id Domid) (err error) {
 	ret := C.libxl_domain_reboot(ctx.ctx, C.uint32_t(id), nil)
 
 	if ret != 0 {
-		err = Error(-ret)
+		err = Error(ret)
 	}
 	return
 }
@@ -1214,7 +1214,7 @@ func (ctx *Context) ConsoleGetTty(id Domid, consNum int, conType ConsoleType) (p
 	var cpath *C.char
 	ret := C.libxl_console_get_tty(ctx.ctx, C.uint32_t(id), C.int(consNum), C.libxl_console_type(conType), &cpath)
 	if ret != 0 {
-		err = Error(-ret)
+		err = Error(ret)
 		return
 	}
 	defer C.free(unsafe.Pointer(cpath))
@@ -1229,7 +1229,7 @@ func (ctx *Context) PrimaryConsoleGetTty(domid uint32) (path string, err error)
 	var cpath *C.char
 	ret := C.libxl_primary_console_get_tty(ctx.ctx, C.uint32_t(domid), &cpath)
 	if ret != 0 {
-		err = Error(-ret)
+		err = Error(ret)
 		return
 	}
 	defer C.free(unsafe.Pointer(cpath))
-- 
2.17.1


