Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D24938F47E
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 22:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131889.246329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHL2-0004HJ-93; Mon, 24 May 2021 20:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131889.246329; Mon, 24 May 2021 20:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHL2-0004DI-41; Mon, 24 May 2021 20:38:12 +0000
Received: by outflank-mailman (input) for mailman id 131889;
 Mon, 24 May 2021 20:38:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+P1=KT=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1llHL0-0001ey-SK
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 20:38:10 +0000
Received: from mail-qt1-x836.google.com (unknown [2607:f8b0:4864:20::836])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5820f8d2-f153-4cae-a01a-6ee81b2b2caa;
 Mon, 24 May 2021 20:37:46 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id i19so15076025qtw.9
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 13:37:46 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id t25sm5142847qkt.62.2021.05.24.13.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 13:37:45 -0700 (PDT)
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
X-Inumbo-ID: 5820f8d2-f153-4cae-a01a-6ee81b2b2caa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=x72Z2VWLOz6ahDBGysPBZw8qVE2KpRZgT2UaiLPYGoc=;
        b=Cw0ZSYaofRCWAfHDy+CfgskUQqQQ06W+8/xlsBgcRaS97XlztjW7YWKa1MHP8gpWoe
         s59XcFI0Wf7/Bd3r5dI5F9M4vXsX+3AIAZBnJ3tX9TCaEkBe5jVlCTnwvoSovbAwgh8+
         DgRUhTLxtgMDzHqmydBsweA1/1sAKzDxzblK8AUg1ikkmcxArOzva2irjDvDYtmb7hks
         8J4FZ8IAtooU8ooW1DBRlAnTBabW8MdwmxJfihKNQsn9F7065O+bNgiokjcKeFwYWRt+
         nHTE70wZN+gdWcUmFgRsa+vScoPQUCl3y56tL4de3Nvz6ej+h/AeMzuHI2ujREYbFfxC
         Dwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=x72Z2VWLOz6ahDBGysPBZw8qVE2KpRZgT2UaiLPYGoc=;
        b=gE9J4upgLHMMwgQQkZ2kffnuSzlAzJd2NqNOV+tilgM6HQYeOlQ7pflws3R7YSBNIG
         XGfLMrS00rZVyF96uUKv4hXMIrOX6jE7F4I4/HKFj8KjdiutXJmcCFiVUbSVsDr7mutB
         OxtN6WA7sVWuLnpu4YYwCmTzqp9HFA9h29q+6yPT8nT+sH2yps85qEGExLWk+yjknsUM
         X6Wne66GIDbEFUegNzuPUyUop3HFzWPxFb2cUNzhMrihRCsoCnRjVvJIKDT25upm3osa
         oteFNSWCQVuVbl9R5tqicWTwNmtZpbg/B9kV1pAPX4INS7ZgAq+4I6h0KQK3H0y1Hr6g
         cNcw==
X-Gm-Message-State: AOAM531J55qJS349PPYtw7qjCgZWzSRC9VMboJWZFTeQ1obDaykiQxED
	2CTj8fscKjZvnmRNsXF6mEQ=
X-Google-Smtp-Source: ABdhPJx6M1UNe75t87tnAzF5iaZq7xIMYUp7nUh2k24anPFVVcKb5qYcyaVrUQLtzGw5fXOK655yFA==
X-Received: by 2002:a05:622a:b:: with SMTP id x11mr28993947qtw.272.1621888665927;
        Mon, 24 May 2021 13:37:45 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.prg,
	xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [RESEND PATCH 06/12] golang/xenlight: rename Ctx receivers to ctx
Date: Mon, 24 May 2021 16:36:47 -0400
Message-Id: <c1f7b48068d3855f48f818d93ddd23638a0f9f70.1621887506.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>

As a matter of style, it is strange to see capitalized receiver names,
due to the significance of capitalized symbols in Go (although there is
in fact nothing special about a capitalized receiver name). Fix this in
xenlight.go by running:

  gofmt -w -r 'Ctx -> ctx' xenlight.go

from tools/golang/xenlight. There is no functional change.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/xenlight.go | 154 +++++++++++++++---------------
 1 file changed, 77 insertions(+), 77 deletions(-)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index 13171d0ad1..fc3eb0bf3f 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -203,13 +203,13 @@ type Domid uint32
 // NameToDomid does not guarantee that the domid associated with name at
 // the time NameToDomid is called is the same as the domid associated with
 // name at the time NameToDomid returns.
-func (Ctx *Context) NameToDomid(name string) (Domid, error) {
+func (ctx *Context) NameToDomid(name string) (Domid, error) {
 	var domid C.uint32_t
 
 	cname := C.CString(name)
 	defer C.free(unsafe.Pointer(cname))
 
-	if ret := C.libxl_name_to_domid(Ctx.ctx, cname, &domid); ret != 0 {
+	if ret := C.libxl_name_to_domid(ctx.ctx, cname, &domid); ret != 0 {
 		return DomidInvalid, Error(ret)
 	}
 
@@ -223,8 +223,8 @@ func (Ctx *Context) NameToDomid(name string) (Domid, error) {
 // DomidToName does not guarantee that the name (if any) associated with domid
 // at the time DomidToName is called is the same as the name (if any) associated
 // with domid at the time DomidToName returns.
-func (Ctx *Context) DomidToName(domid Domid) string {
-	cname := C.libxl_domid_to_name(Ctx.ctx, C.uint32_t(domid))
+func (ctx *Context) DomidToName(domid Domid) string {
+	cname := C.libxl_domid_to_name(ctx.ctx, C.uint32_t(domid))
 	defer C.free(unsafe.Pointer(cname))
 
 	return C.GoString(cname)
@@ -594,10 +594,10 @@ func SchedulerFromString(name string) (s Scheduler, err error) {
 
 // libxl_cpupoolinfo * libxl_list_cpupool(libxl_ctx*, int *nb_pool_out);
 // void libxl_cpupoolinfo_list_free(libxl_cpupoolinfo *list, int nb_pool);
-func (Ctx *Context) ListCpupool() (list []Cpupoolinfo) {
+func (ctx *Context) ListCpupool() (list []Cpupoolinfo) {
 	var nbPool C.int
 
-	c_cpupool_list := C.libxl_list_cpupool(Ctx.ctx, &nbPool)
+	c_cpupool_list := C.libxl_list_cpupool(ctx.ctx, &nbPool)
 
 	defer C.libxl_cpupoolinfo_list_free(c_cpupool_list, nbPool)
 
@@ -617,10 +617,10 @@ func (Ctx *Context) ListCpupool() (list []Cpupoolinfo) {
 }
 
 // int libxl_cpupool_info(libxl_ctx *ctx, libxl_cpupoolinfo *info, uint32_t poolid);
-func (Ctx *Context) CpupoolInfo(Poolid uint32) (pool Cpupoolinfo, err error) {
+func (ctx *Context) CpupoolInfo(Poolid uint32) (pool Cpupoolinfo, err error) {
 	var c_cpupool C.libxl_cpupoolinfo
 
-	ret := C.libxl_cpupool_info(Ctx.ctx, &c_cpupool, C.uint32_t(Poolid))
+	ret := C.libxl_cpupool_info(ctx.ctx, &c_cpupool, C.uint32_t(Poolid))
 	if ret != 0 {
 		err = Error(-ret)
 		return
@@ -638,7 +638,7 @@ func (Ctx *Context) CpupoolInfo(Poolid uint32) (pool Cpupoolinfo, err error) {
 //                          uint32_t *poolid);
 // FIXME: uuid
 // FIXME: Setting poolid
-func (Ctx *Context) CpupoolCreate(Name string, Scheduler Scheduler, Cpumap Bitmap) (err error, Poolid uint32) {
+func (ctx *Context) CpupoolCreate(Name string, Scheduler Scheduler, Cpumap Bitmap) (err error, Poolid uint32) {
 	poolid := C.uint32_t(C.LIBXL_CPUPOOL_POOLID_ANY)
 	name := C.CString(Name)
 	defer C.free(unsafe.Pointer(name))
@@ -653,7 +653,7 @@ func (Ctx *Context) CpupoolCreate(Name string, Scheduler Scheduler, Cpumap Bitma
 	}
 	defer C.libxl_bitmap_dispose(&cbm)
 
-	ret := C.libxl_cpupool_create(Ctx.ctx, name, C.libxl_scheduler(Scheduler),
+	ret := C.libxl_cpupool_create(ctx.ctx, name, C.libxl_scheduler(Scheduler),
 		cbm, &uuid, &poolid)
 	if ret != 0 {
 		err = Error(-ret)
@@ -666,8 +666,8 @@ func (Ctx *Context) CpupoolCreate(Name string, Scheduler Scheduler, Cpumap Bitma
 }
 
 // int libxl_cpupool_destroy(libxl_ctx *ctx, uint32_t poolid);
-func (Ctx *Context) CpupoolDestroy(Poolid uint32) (err error) {
-	ret := C.libxl_cpupool_destroy(Ctx.ctx, C.uint32_t(Poolid))
+func (ctx *Context) CpupoolDestroy(Poolid uint32) (err error) {
+	ret := C.libxl_cpupool_destroy(ctx.ctx, C.uint32_t(Poolid))
 	if ret != 0 {
 		err = Error(-ret)
 		return
@@ -677,8 +677,8 @@ func (Ctx *Context) CpupoolDestroy(Poolid uint32) (err error) {
 }
 
 // int libxl_cpupool_cpuadd(libxl_ctx *ctx, uint32_t poolid, int cpu);
-func (Ctx *Context) CpupoolCpuadd(Poolid uint32, Cpu int) (err error) {
-	ret := C.libxl_cpupool_cpuadd(Ctx.ctx, C.uint32_t(Poolid), C.int(Cpu))
+func (ctx *Context) CpupoolCpuadd(Poolid uint32, Cpu int) (err error) {
+	ret := C.libxl_cpupool_cpuadd(ctx.ctx, C.uint32_t(Poolid), C.int(Cpu))
 	if ret != 0 {
 		err = Error(-ret)
 		return
@@ -689,14 +689,14 @@ func (Ctx *Context) CpupoolCpuadd(Poolid uint32, Cpu int) (err error) {
 
 // int libxl_cpupool_cpuadd_cpumap(libxl_ctx *ctx, uint32_t poolid,
 //                                 const libxl_bitmap *cpumap);
-func (Ctx *Context) CpupoolCpuaddCpumap(Poolid uint32, Cpumap Bitmap) (err error) {
+func (ctx *Context) CpupoolCpuaddCpumap(Poolid uint32, Cpumap Bitmap) (err error) {
 	var cbm C.libxl_bitmap
 	if err = Cpumap.toC(&cbm); err != nil {
 		return
 	}
 	defer C.libxl_bitmap_dispose(&cbm)
 
-	ret := C.libxl_cpupool_cpuadd_cpumap(Ctx.ctx, C.uint32_t(Poolid), &cbm)
+	ret := C.libxl_cpupool_cpuadd_cpumap(ctx.ctx, C.uint32_t(Poolid), &cbm)
 	if ret != 0 {
 		err = Error(-ret)
 		return
@@ -706,8 +706,8 @@ func (Ctx *Context) CpupoolCpuaddCpumap(Poolid uint32, Cpumap Bitmap) (err error
 }
 
 // int libxl_cpupool_cpuremove(libxl_ctx *ctx, uint32_t poolid, int cpu);
-func (Ctx *Context) CpupoolCpuremove(Poolid uint32, Cpu int) (err error) {
-	ret := C.libxl_cpupool_cpuremove(Ctx.ctx, C.uint32_t(Poolid), C.int(Cpu))
+func (ctx *Context) CpupoolCpuremove(Poolid uint32, Cpu int) (err error) {
+	ret := C.libxl_cpupool_cpuremove(ctx.ctx, C.uint32_t(Poolid), C.int(Cpu))
 	if ret != 0 {
 		err = Error(-ret)
 		return
@@ -718,14 +718,14 @@ func (Ctx *Context) CpupoolCpuremove(Poolid uint32, Cpu int) (err error) {
 
 // int libxl_cpupool_cpuremove_cpumap(libxl_ctx *ctx, uint32_t poolid,
 //                                    const libxl_bitmap *cpumap);
-func (Ctx *Context) CpupoolCpuremoveCpumap(Poolid uint32, Cpumap Bitmap) (err error) {
+func (ctx *Context) CpupoolCpuremoveCpumap(Poolid uint32, Cpumap Bitmap) (err error) {
 	var cbm C.libxl_bitmap
 	if err = Cpumap.toC(&cbm); err != nil {
 		return
 	}
 	defer C.libxl_bitmap_dispose(&cbm)
 
-	ret := C.libxl_cpupool_cpuremove_cpumap(Ctx.ctx, C.uint32_t(Poolid), &cbm)
+	ret := C.libxl_cpupool_cpuremove_cpumap(ctx.ctx, C.uint32_t(Poolid), &cbm)
 	if ret != 0 {
 		err = Error(-ret)
 		return
@@ -735,11 +735,11 @@ func (Ctx *Context) CpupoolCpuremoveCpumap(Poolid uint32, Cpumap Bitmap) (err er
 }
 
 // int libxl_cpupool_rename(libxl_ctx *ctx, const char *name, uint32_t poolid);
-func (Ctx *Context) CpupoolRename(Name string, Poolid uint32) (err error) {
+func (ctx *Context) CpupoolRename(Name string, Poolid uint32) (err error) {
 	name := C.CString(Name)
 	defer C.free(unsafe.Pointer(name))
 
-	ret := C.libxl_cpupool_rename(Ctx.ctx, name, C.uint32_t(Poolid))
+	ret := C.libxl_cpupool_rename(ctx.ctx, name, C.uint32_t(Poolid))
 	if ret != 0 {
 		err = Error(-ret)
 		return
@@ -749,10 +749,10 @@ func (Ctx *Context) CpupoolRename(Name string, Poolid uint32) (err error) {
 }
 
 // int libxl_cpupool_cpuadd_node(libxl_ctx *ctx, uint32_t poolid, int node, int *cpus);
-func (Ctx *Context) CpupoolCpuaddNode(Poolid uint32, Node int) (Cpus int, err error) {
+func (ctx *Context) CpupoolCpuaddNode(Poolid uint32, Node int) (Cpus int, err error) {
 	ccpus := C.int(0)
 
-	ret := C.libxl_cpupool_cpuadd_node(Ctx.ctx, C.uint32_t(Poolid), C.int(Node), &ccpus)
+	ret := C.libxl_cpupool_cpuadd_node(ctx.ctx, C.uint32_t(Poolid), C.int(Node), &ccpus)
 	if ret != 0 {
 		err = Error(-ret)
 		return
@@ -764,10 +764,10 @@ func (Ctx *Context) CpupoolCpuaddNode(Poolid uint32, Node int) (Cpus int, err er
 }
 
 // int libxl_cpupool_cpuremove_node(libxl_ctx *ctx, uint32_t poolid, int node, int *cpus);
-func (Ctx *Context) CpupoolCpuremoveNode(Poolid uint32, Node int) (Cpus int, err error) {
+func (ctx *Context) CpupoolCpuremoveNode(Poolid uint32, Node int) (Cpus int, err error) {
 	ccpus := C.int(0)
 
-	ret := C.libxl_cpupool_cpuremove_node(Ctx.ctx, C.uint32_t(Poolid), C.int(Node), &ccpus)
+	ret := C.libxl_cpupool_cpuremove_node(ctx.ctx, C.uint32_t(Poolid), C.int(Node), &ccpus)
 	if ret != 0 {
 		err = Error(-ret)
 		return
@@ -779,8 +779,8 @@ func (Ctx *Context) CpupoolCpuremoveNode(Poolid uint32, Node int) (Cpus int, err
 }
 
 // int libxl_cpupool_movedomain(libxl_ctx *ctx, uint32_t poolid, uint32_t domid);
-func (Ctx *Context) CpupoolMovedomain(Poolid uint32, Id Domid) (err error) {
-	ret := C.libxl_cpupool_movedomain(Ctx.ctx, C.uint32_t(Poolid), C.uint32_t(Id))
+func (ctx *Context) CpupoolMovedomain(Poolid uint32, Id Domid) (err error) {
+	ret := C.libxl_cpupool_movedomain(ctx.ctx, C.uint32_t(Poolid), C.uint32_t(Id))
 	if ret != 0 {
 		err = Error(-ret)
 		return
@@ -792,8 +792,8 @@ func (Ctx *Context) CpupoolMovedomain(Poolid uint32, Id Domid) (err error) {
 //
 // Utility functions
 //
-func (Ctx *Context) CpupoolFindByName(name string) (info Cpupoolinfo, found bool) {
-	plist := Ctx.ListCpupool()
+func (ctx *Context) CpupoolFindByName(name string) (info Cpupoolinfo, found bool) {
+	plist := ctx.ListCpupool()
 
 	for i := range plist {
 		if plist[i].PoolName == name {
@@ -805,14 +805,14 @@ func (Ctx *Context) CpupoolFindByName(name string) (info Cpupoolinfo, found bool
 	return
 }
 
-func (Ctx *Context) CpupoolMakeFree(Cpumap Bitmap) (err error) {
-	plist := Ctx.ListCpupool()
+func (ctx *Context) CpupoolMakeFree(Cpumap Bitmap) (err error) {
+	plist := ctx.ListCpupool()
 
 	for i := range plist {
 		var Intersection Bitmap
 		Intersection = Cpumap.And(plist[i].Cpumap)
 		if !Intersection.IsEmpty() {
-			err = Ctx.CpupoolCpuremoveCpumap(plist[i].Poolid, Intersection)
+			err = ctx.CpupoolCpuremoveCpumap(plist[i].Poolid, Intersection)
 			if err != nil {
 				return
 			}
@@ -940,8 +940,8 @@ func (bm Bitmap) String() (s string) {
 }
 
 //int libxl_get_max_cpus(libxl_ctx *ctx);
-func (Ctx *Context) GetMaxCpus() (maxCpus int, err error) {
-	ret := C.libxl_get_max_cpus(Ctx.ctx)
+func (ctx *Context) GetMaxCpus() (maxCpus int, err error) {
+	ret := C.libxl_get_max_cpus(ctx.ctx)
 	if ret < 0 {
 		err = Error(-ret)
 		return
@@ -951,8 +951,8 @@ func (Ctx *Context) GetMaxCpus() (maxCpus int, err error) {
 }
 
 //int libxl_get_online_cpus(libxl_ctx *ctx);
-func (Ctx *Context) GetOnlineCpus() (onCpus int, err error) {
-	ret := C.libxl_get_online_cpus(Ctx.ctx)
+func (ctx *Context) GetOnlineCpus() (onCpus int, err error) {
+	ret := C.libxl_get_online_cpus(ctx.ctx)
 	if ret < 0 {
 		err = Error(-ret)
 		return
@@ -962,8 +962,8 @@ func (Ctx *Context) GetOnlineCpus() (onCpus int, err error) {
 }
 
 //int libxl_get_max_nodes(libxl_ctx *ctx);
-func (Ctx *Context) GetMaxNodes() (maxNodes int, err error) {
-	ret := C.libxl_get_max_nodes(Ctx.ctx)
+func (ctx *Context) GetMaxNodes() (maxNodes int, err error) {
+	ret := C.libxl_get_max_nodes(ctx.ctx)
 	if ret < 0 {
 		err = Error(-ret)
 		return
@@ -973,9 +973,9 @@ func (Ctx *Context) GetMaxNodes() (maxNodes int, err error) {
 }
 
 //int libxl_get_free_memory(libxl_ctx *ctx, uint64_t *memkb);
-func (Ctx *Context) GetFreeMemory() (memkb uint64, err error) {
+func (ctx *Context) GetFreeMemory() (memkb uint64, err error) {
 	var cmem C.uint64_t
-	ret := C.libxl_get_free_memory(Ctx.ctx, &cmem)
+	ret := C.libxl_get_free_memory(ctx.ctx, &cmem)
 
 	if ret < 0 {
 		err = Error(-ret)
@@ -988,12 +988,12 @@ func (Ctx *Context) GetFreeMemory() (memkb uint64, err error) {
 }
 
 //int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
-func (Ctx *Context) GetPhysinfo() (physinfo *Physinfo, err error) {
+func (ctx *Context) GetPhysinfo() (physinfo *Physinfo, err error) {
 	var cphys C.libxl_physinfo
 	C.libxl_physinfo_init(&cphys)
 	defer C.libxl_physinfo_dispose(&cphys)
 
-	ret := C.libxl_get_physinfo(Ctx.ctx, &cphys)
+	ret := C.libxl_get_physinfo(ctx.ctx, &cphys)
 
 	if ret < 0 {
 		err = Error(ret)
@@ -1005,22 +1005,22 @@ func (Ctx *Context) GetPhysinfo() (physinfo *Physinfo, err error) {
 }
 
 //const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx);
-func (Ctx *Context) GetVersionInfo() (info *VersionInfo, err error) {
+func (ctx *Context) GetVersionInfo() (info *VersionInfo, err error) {
 	var cinfo *C.libxl_version_info
 
-	cinfo = C.libxl_get_version_info(Ctx.ctx)
+	cinfo = C.libxl_get_version_info(ctx.ctx)
 
 	err = info.fromC(cinfo)
 
 	return
 }
 
-func (Ctx *Context) DomainInfo(Id Domid) (di *Dominfo, err error) {
+func (ctx *Context) DomainInfo(Id Domid) (di *Dominfo, err error) {
 	var cdi C.libxl_dominfo
 	C.libxl_dominfo_init(&cdi)
 	defer C.libxl_dominfo_dispose(&cdi)
 
-	ret := C.libxl_domain_info(Ctx.ctx, &cdi, C.uint32_t(Id))
+	ret := C.libxl_domain_info(ctx.ctx, &cdi, C.uint32_t(Id))
 
 	if ret != 0 {
 		err = Error(-ret)
@@ -1032,8 +1032,8 @@ func (Ctx *Context) DomainInfo(Id Domid) (di *Dominfo, err error) {
 	return
 }
 
-func (Ctx *Context) DomainUnpause(Id Domid) (err error) {
-	ret := C.libxl_domain_unpause(Ctx.ctx, C.uint32_t(Id), nil)
+func (ctx *Context) DomainUnpause(Id Domid) (err error) {
+	ret := C.libxl_domain_unpause(ctx.ctx, C.uint32_t(Id), nil)
 
 	if ret != 0 {
 		err = Error(-ret)
@@ -1042,8 +1042,8 @@ func (Ctx *Context) DomainUnpause(Id Domid) (err error) {
 }
 
 //int libxl_domain_pause(libxl_ctx *ctx, uint32_t domain);
-func (Ctx *Context) DomainPause(id Domid) (err error) {
-	ret := C.libxl_domain_pause(Ctx.ctx, C.uint32_t(id), nil)
+func (ctx *Context) DomainPause(id Domid) (err error) {
+	ret := C.libxl_domain_pause(ctx.ctx, C.uint32_t(id), nil)
 
 	if ret != 0 {
 		err = Error(-ret)
@@ -1052,8 +1052,8 @@ func (Ctx *Context) DomainPause(id Domid) (err error) {
 }
 
 //int libxl_domain_shutdown(libxl_ctx *ctx, uint32_t domid);
-func (Ctx *Context) DomainShutdown(id Domid) (err error) {
-	ret := C.libxl_domain_shutdown(Ctx.ctx, C.uint32_t(id), nil)
+func (ctx *Context) DomainShutdown(id Domid) (err error) {
+	ret := C.libxl_domain_shutdown(ctx.ctx, C.uint32_t(id), nil)
 
 	if ret != 0 {
 		err = Error(-ret)
@@ -1062,8 +1062,8 @@ func (Ctx *Context) DomainShutdown(id Domid) (err error) {
 }
 
 //int libxl_domain_reboot(libxl_ctx *ctx, uint32_t domid);
-func (Ctx *Context) DomainReboot(id Domid) (err error) {
-	ret := C.libxl_domain_reboot(Ctx.ctx, C.uint32_t(id), nil)
+func (ctx *Context) DomainReboot(id Domid) (err error) {
+	ret := C.libxl_domain_reboot(ctx.ctx, C.uint32_t(id), nil)
 
 	if ret != 0 {
 		err = Error(-ret)
@@ -1073,9 +1073,9 @@ func (Ctx *Context) DomainReboot(id Domid) (err error) {
 
 //libxl_dominfo * libxl_list_domain(libxl_ctx*, int *nb_domain_out);
 //void libxl_dominfo_list_free(libxl_dominfo *list, int nb_domain);
-func (Ctx *Context) ListDomain() (glist []Dominfo) {
+func (ctx *Context) ListDomain() (glist []Dominfo) {
 	var nbDomain C.int
-	clist := C.libxl_list_domain(Ctx.ctx, &nbDomain)
+	clist := C.libxl_list_domain(ctx.ctx, &nbDomain)
 	defer C.libxl_dominfo_list_free(clist, nbDomain)
 
 	if int(nbDomain) == 0 {
@@ -1095,11 +1095,11 @@ func (Ctx *Context) ListDomain() (glist []Dominfo) {
 //libxl_vcpuinfo *libxl_list_vcpu(libxl_ctx *ctx, uint32_t domid,
 //				int *nb_vcpu, int *nr_cpus_out);
 //void libxl_vcpuinfo_list_free(libxl_vcpuinfo *, int nr_vcpus);
-func (Ctx *Context) ListVcpu(id Domid) (glist []Vcpuinfo) {
+func (ctx *Context) ListVcpu(id Domid) (glist []Vcpuinfo) {
 	var nbVcpu C.int
 	var nrCpu C.int
 
-	clist := C.libxl_list_vcpu(Ctx.ctx, C.uint32_t(id), &nbVcpu, &nrCpu)
+	clist := C.libxl_list_vcpu(ctx.ctx, C.uint32_t(id), &nbVcpu, &nrCpu)
 	defer C.libxl_vcpuinfo_list_free(clist, nbVcpu)
 
 	if int(nbVcpu) == 0 {
@@ -1125,9 +1125,9 @@ func (ct ConsoleType) String() (str string) {
 
 //int libxl_console_get_tty(libxl_ctx *ctx, uint32_t domid, int cons_num,
 //libxl_console_type type, char **path);
-func (Ctx *Context) ConsoleGetTty(id Domid, consNum int, conType ConsoleType) (path string, err error) {
+func (ctx *Context) ConsoleGetTty(id Domid, consNum int, conType ConsoleType) (path string, err error) {
 	var cpath *C.char
-	ret := C.libxl_console_get_tty(Ctx.ctx, C.uint32_t(id), C.int(consNum), C.libxl_console_type(conType), &cpath)
+	ret := C.libxl_console_get_tty(ctx.ctx, C.uint32_t(id), C.int(consNum), C.libxl_console_type(conType), &cpath)
 	if ret != 0 {
 		err = Error(-ret)
 		return
@@ -1140,9 +1140,9 @@ func (Ctx *Context) ConsoleGetTty(id Domid, consNum int, conType ConsoleType) (p
 
 //int libxl_primary_console_get_tty(libxl_ctx *ctx, uint32_t domid_vm,
 //					char **path);
-func (Ctx *Context) PrimaryConsoleGetTty(domid uint32) (path string, err error) {
+func (ctx *Context) PrimaryConsoleGetTty(domid uint32) (path string, err error) {
 	var cpath *C.char
-	ret := C.libxl_primary_console_get_tty(Ctx.ctx, C.uint32_t(domid), &cpath)
+	ret := C.libxl_primary_console_get_tty(ctx.ctx, C.uint32_t(domid), &cpath)
 	if ret != 0 {
 		err = Error(-ret)
 		return
@@ -1154,7 +1154,7 @@ func (Ctx *Context) PrimaryConsoleGetTty(domid uint32) (path string, err error)
 }
 
 // DeviceNicAdd adds a nic to a domain.
-func (Ctx *Context) DeviceNicAdd(domid Domid, nic *DeviceNic) error {
+func (ctx *Context) DeviceNicAdd(domid Domid, nic *DeviceNic) error {
 	var cnic C.libxl_device_nic
 
 	if err := nic.toC(&cnic); err != nil {
@@ -1162,7 +1162,7 @@ func (Ctx *Context) DeviceNicAdd(domid Domid, nic *DeviceNic) error {
 	}
 	defer C.libxl_device_nic_dispose(&cnic)
 
-	ret := C.libxl_device_nic_add(Ctx.ctx, C.uint32_t(domid), &cnic, nil)
+	ret := C.libxl_device_nic_add(ctx.ctx, C.uint32_t(domid), &cnic, nil)
 	if ret != 0 {
 		return Error(ret)
 	}
@@ -1171,7 +1171,7 @@ func (Ctx *Context) DeviceNicAdd(domid Domid, nic *DeviceNic) error {
 }
 
 // DeviceNicRemove removes a nic from a domain.
-func (Ctx *Context) DeviceNicRemove(domid Domid, nic *DeviceNic) error {
+func (ctx *Context) DeviceNicRemove(domid Domid, nic *DeviceNic) error {
 	var cnic C.libxl_device_nic
 
 	if err := nic.toC(&cnic); err != nil {
@@ -1179,7 +1179,7 @@ func (Ctx *Context) DeviceNicRemove(domid Domid, nic *DeviceNic) error {
 	}
 	defer C.libxl_device_nic_dispose(&cnic)
 
-	ret := C.libxl_device_nic_remove(Ctx.ctx, C.uint32_t(domid), &cnic, nil)
+	ret := C.libxl_device_nic_remove(ctx.ctx, C.uint32_t(domid), &cnic, nil)
 	if ret != 0 {
 		return Error(ret)
 	}
@@ -1188,7 +1188,7 @@ func (Ctx *Context) DeviceNicRemove(domid Domid, nic *DeviceNic) error {
 }
 
 // DevicePciAdd is used to passthrough a PCI device to a domain.
-func (Ctx *Context) DevicePciAdd(domid Domid, pci *DevicePci) error {
+func (ctx *Context) DevicePciAdd(domid Domid, pci *DevicePci) error {
 	var cpci C.libxl_device_pci
 
 	if err := pci.toC(&cpci); err != nil {
@@ -1196,7 +1196,7 @@ func (Ctx *Context) DevicePciAdd(domid Domid, pci *DevicePci) error {
 	}
 	defer C.libxl_device_pci_dispose(&cpci)
 
-	ret := C.libxl_device_pci_add(Ctx.ctx, C.uint32_t(domid), &cpci, nil)
+	ret := C.libxl_device_pci_add(ctx.ctx, C.uint32_t(domid), &cpci, nil)
 	if ret != 0 {
 		return Error(ret)
 	}
@@ -1205,7 +1205,7 @@ func (Ctx *Context) DevicePciAdd(domid Domid, pci *DevicePci) error {
 }
 
 // DevicePciRemove removes a PCI device from a domain.
-func (Ctx *Context) DevicePciRemove(domid Domid, pci *DevicePci) error {
+func (ctx *Context) DevicePciRemove(domid Domid, pci *DevicePci) error {
 	var cpci C.libxl_device_pci
 
 	if err := pci.toC(&cpci); err != nil {
@@ -1213,7 +1213,7 @@ func (Ctx *Context) DevicePciRemove(domid Domid, pci *DevicePci) error {
 	}
 	defer C.libxl_device_pci_dispose(&cpci)
 
-	ret := C.libxl_device_pci_remove(Ctx.ctx, C.uint32_t(domid), &cpci, nil)
+	ret := C.libxl_device_pci_remove(ctx.ctx, C.uint32_t(domid), &cpci, nil)
 	if ret != 0 {
 		return Error(ret)
 	}
@@ -1222,7 +1222,7 @@ func (Ctx *Context) DevicePciRemove(domid Domid, pci *DevicePci) error {
 }
 
 // DeviceUsbdevAdd adds a USB device to a domain.
-func (Ctx *Context) DeviceUsbdevAdd(domid Domid, usbdev *DeviceUsbdev) error {
+func (ctx *Context) DeviceUsbdevAdd(domid Domid, usbdev *DeviceUsbdev) error {
 	var cusbdev C.libxl_device_usbdev
 
 	if err := usbdev.toC(&cusbdev); err != nil {
@@ -1230,7 +1230,7 @@ func (Ctx *Context) DeviceUsbdevAdd(domid Domid, usbdev *DeviceUsbdev) error {
 	}
 	defer C.libxl_device_usbdev_dispose(&cusbdev)
 
-	ret := C.libxl_device_usbdev_add(Ctx.ctx, C.uint32_t(domid), &cusbdev, nil)
+	ret := C.libxl_device_usbdev_add(ctx.ctx, C.uint32_t(domid), &cusbdev, nil)
 	if ret != 0 {
 		return Error(ret)
 	}
@@ -1239,7 +1239,7 @@ func (Ctx *Context) DeviceUsbdevAdd(domid Domid, usbdev *DeviceUsbdev) error {
 }
 
 // DeviceUsbdevRemove removes a USB device from a domain.
-func (Ctx *Context) DeviceUsbdevRemove(domid Domid, usbdev *DeviceUsbdev) error {
+func (ctx *Context) DeviceUsbdevRemove(domid Domid, usbdev *DeviceUsbdev) error {
 	var cusbdev C.libxl_device_usbdev
 
 	if err := usbdev.toC(&cusbdev); err != nil {
@@ -1247,7 +1247,7 @@ func (Ctx *Context) DeviceUsbdevRemove(domid Domid, usbdev *DeviceUsbdev) error
 	}
 	defer C.libxl_device_usbdev_dispose(&cusbdev)
 
-	ret := C.libxl_device_usbdev_remove(Ctx.ctx, C.uint32_t(domid), &cusbdev, nil)
+	ret := C.libxl_device_usbdev_remove(ctx.ctx, C.uint32_t(domid), &cusbdev, nil)
 	if ret != 0 {
 		return Error(ret)
 	}
@@ -1256,7 +1256,7 @@ func (Ctx *Context) DeviceUsbdevRemove(domid Domid, usbdev *DeviceUsbdev) error
 }
 
 // DomainCreateNew creates a new domain.
-func (Ctx *Context) DomainCreateNew(config *DomainConfig) (Domid, error) {
+func (ctx *Context) DomainCreateNew(config *DomainConfig) (Domid, error) {
 	var cdomid C.uint32_t
 	var cconfig C.libxl_domain_config
 	err := config.toC(&cconfig)
@@ -1265,7 +1265,7 @@ func (Ctx *Context) DomainCreateNew(config *DomainConfig) (Domid, error) {
 	}
 	defer C.libxl_domain_config_dispose(&cconfig)
 
-	ret := C.libxl_domain_create_new(Ctx.ctx, &cconfig, &cdomid, nil, nil)
+	ret := C.libxl_domain_create_new(ctx.ctx, &cconfig, &cdomid, nil, nil)
 	if ret != 0 {
 		return Domid(0), Error(ret)
 	}
-- 
2.17.1


