Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A6F36E28F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 02:25:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119678.226294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuU4-0000cF-If; Thu, 29 Apr 2021 00:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119678.226294; Thu, 29 Apr 2021 00:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuU4-0000bq-Ef; Thu, 29 Apr 2021 00:24:48 +0000
Received: by outflank-mailman (input) for mailman id 119678;
 Thu, 29 Apr 2021 00:24:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S48z=J2=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lbuL7-00072A-VB
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 00:15:33 +0000
Received: from mail-qk1-x72f.google.com (unknown [2607:f8b0:4864:20::72f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8575b3df-66e4-428c-9981-ed711e13a6d6;
 Thu, 29 Apr 2021 00:14:48 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id o5so65593965qkb.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Apr 2021 17:14:48 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id r185sm1021694qkf.78.2021.04.28.17.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 17:14:47 -0700 (PDT)
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
X-Inumbo-ID: 8575b3df-66e4-428c-9981-ed711e13a6d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=8RHEO4rjzSWCDCSeU8KH/ouMS7fzg0KSm8WpWB6iQ0M=;
        b=WuagplF/N+6Qq3E3bKSharLO65EdAjIlxj0a/hc7jj5kuwpyBG1FZx14nl01G5YTCq
         LHhx+jn0FnfUtRbj4/xtTRPICM+M2YM7N30iH1B0utAd7t1sB73yZSNu9wjXl2w5+Xh4
         AW396aY11QYihqi1MV7Fu495FGeyyN2gjzl1xgLLS6MKZTNkMt4t7gnuayA6rVbOyKLk
         +7vKsndChV4728Zbr8rWg8uWZRYgzhfrhjvw+UNQOmVoZICskbdvA5ZtM9ZLxRDgZ0eA
         FElsAcFCCGetVd0MOIioW7qOvXJ4Bts4JJ5vEJ/ibUq6RcJ8x4o8PidJk2Mg1PPNyTH+
         YQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=8RHEO4rjzSWCDCSeU8KH/ouMS7fzg0KSm8WpWB6iQ0M=;
        b=p/DcpLka2CRs0rinA5iVlWRim+33zpzEyi1kfHFLzN0fnqJhPOpE9U7SlTiUZXJ/IX
         7kpPNI3pCyKBmGq94cqi3l220/Ad1AJA5Q5XFIZE0o3gxtu7vwQb+MzrrImoNCNAwF/B
         KRGDMOFKe9jHPWJn3oaFhUi13IAAV5bZ9PH84lw8raRwq0GX6zRy8tQd+oxDlONg1P8+
         nMsFL2N2TB6/R4j+8S3rRhjAJzikSkQ31j3j0n0ZEucGC6tyPO4JAGYeP384drLzEgXm
         0isezo9OarSO6Cpw88pMa905LBZKvGYFeguxeASqL09QKwYUCdJBMRAcsO1Z4qQKvHF4
         +0Cw==
X-Gm-Message-State: AOAM531H/VO2PjR/jjgFK0a+mBZNrM12kvSWGjgSuRzKaEqU2jp7F5W0
	Ya57+eu+0V2/yxzfVK7iJHWDyIHMtlA=
X-Google-Smtp-Source: ABdhPJxDHHI9SX8SkOYc/LaA6GkpLiaYOCLPx1hZghaJbVgf3Qube0QSBLyc+Ww/Bu6L15GUalEg6A==
X-Received: by 2002:a37:6249:: with SMTP id w70mr24335100qkb.99.1619655288147;
        Wed, 28 Apr 2021 17:14:48 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 11/12] golang/xenlight: do not negate ret when converting to Error
Date: Wed, 28 Apr 2021 20:14:33 -0400
Message-Id: <82bc8b720c3dfb178e52d10ddbebfa8dc5880e7b.1619655104.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619650820.git.rosbrookn@ainfosec.com>
References: <cover.1619650820.git.rosbrookn@ainfosec.com>
In-Reply-To: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1619655104.git.rosbrookn@ainfosec.com>
References: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1619655104.git.rosbrookn@ainfosec.com>

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


