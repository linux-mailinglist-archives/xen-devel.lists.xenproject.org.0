Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 021D18AB000
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 16:01:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709098.1108355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxonC-0008LN-Ke; Fri, 19 Apr 2024 14:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709098.1108355; Fri, 19 Apr 2024 14:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxonC-0008Ip-Fq; Fri, 19 Apr 2024 14:00:42 +0000
Received: by outflank-mailman (input) for mailman id 709098;
 Fri, 19 Apr 2024 14:00:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zESt=LY=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rxonB-00084S-21
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 14:00:41 +0000
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [2607:f8b0:4864:20::f2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 334997a9-fe55-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 16:00:39 +0200 (CEST)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-69b6c2e9ed9so7753996d6.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 07:00:39 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a0c8d89000000b0069b7eb7edebsm1582413qvb.71.2024.04.19.07.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 07:00:37 -0700 (PDT)
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
X-Inumbo-ID: 334997a9-fe55-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713535237; x=1714140037; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWMIoc6b1WKFM7SSJlKfUX9Err3kWMV0UKmrQ0B2hfA=;
        b=W31ly7XY0DiUULpdgoIkWhoaktY8RB8X0TwNa7b9QhDPeY7eDh5/MKxEDPcv/C5Avl
         Fc5se1Jny/I6/MRecfKWrFxO+/0madfIIDZ6zheIRL4Y7Va8u7KLcI6MusTJb2qlFzAE
         HLkOtfk3aCEFjYoouOXgryOHWDq7LiwfWVeTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713535237; x=1714140037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWMIoc6b1WKFM7SSJlKfUX9Err3kWMV0UKmrQ0B2hfA=;
        b=fMR2mVYngdIRMB7JLyvQ/fb8hYFRhczA7vLi2e9hy6GotWUBVsI4P+liJrzbAgucJv
         XOW4Ex03dobAtL3FNBWb5K12Ge3vJ/Q5VUCIeq15TrdcZ7a7sxVz1J85fYGyTw0nNIqy
         4W8fq5HHMHepk2VcEE/TU56YmXTwas0deeEBvhdvhzSNLAqxWywEopQO5iNRAeHnDqEr
         Co3mC8Ur3YIq2GNnmryJDa6jVd1e0ZrAaMYr4dp2zHiX4O6sFtG1XljoUvhQqEfw7DGC
         Tr+8R2CidkxOp3/vr9hMeWQLZ36ggqfvOcu4R8/QJcbQDtipI4XzHZCcrusquvoiM1ZD
         Wn+g==
X-Gm-Message-State: AOJu0Ywkp4xZiLa/LYck9GeyO5NXkIBS6FYkTLuz6aiUO5AVOGQLtmnE
	VULKT3IGPMTUasyxyK6hGuHPw9ApYsRXjfMQpnZee2VfZKt+jw/sp6xFp+8NM1x2ISHejd8rQOJ
	q
X-Google-Smtp-Source: AGHT+IH0lKHDZEJh+i9JynrdqwV8Vt4hD50JQB+HhFxOMPW0z8nHQWuRz5QxYE7vhyBxgZArgaGB9g==
X-Received: by 2002:ad4:4dca:0:b0:69b:7b95:8ef1 with SMTP id cw10-20020ad44dca000000b0069b7b958ef1mr2392817qvb.22.1713535237381;
        Fri, 19 Apr 2024 07:00:37 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 2/3] golang/xenlight: Ensure comments aren't interpreted as docstrings
Date: Fri, 19 Apr 2024 14:51:19 +0100
Message-Id: <20240419135120.830517-2-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419135120.830517-1-george.dunlap@cloud.com>
References: <20240419135120.830517-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Go has always interpreted a comment directly before a function as a
docstring, so having the C function prototypes which the golang method
is meant to wrap in the comment before was always a bit non-standard.
However, recent versions of `go fmt` now attempt to normalize these
docstrings as well, leading to strange changes, particularly if `go
fmt` is run on save.

Go through and put a space between non-docstring comments and methods,
so that `go fmt` leaves the comments alone.

No functional change.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
v2:
 - New (replaced previous `go fmt` patch)

CC: Nick Rosbrook <rosbrookn@gmail.com>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/golang/xenlight/xenlight.go | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index d793f172e5..7f08657187 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -562,6 +562,7 @@ func (dt DomainType) String() (str string) {
 }
 
 // const char *libxl_scheduler_to_string(libxl_scheduler p);
+
 func (s Scheduler) String() string {
 	cs := C.libxl_scheduler_to_string(C.libxl_scheduler(s))
 	// No need to free const return value
@@ -570,6 +571,7 @@ func (s Scheduler) String() string {
 }
 
 // int libxl_scheduler_from_string(const char *s, libxl_scheduler *e);
+
 func (s *Scheduler) FromString(gstr string) (err error) {
 	*s, err = SchedulerFromString(gstr)
 	return
@@ -594,6 +596,7 @@ func SchedulerFromString(name string) (s Scheduler, err error) {
 
 // libxl_cpupoolinfo * libxl_list_cpupool(libxl_ctx*, int *nb_pool_out);
 // void libxl_cpupoolinfo_list_free(libxl_cpupoolinfo *list, int nb_pool);
+
 func (ctx *Context) ListCpupool() (list []Cpupoolinfo) {
 	var nbPool C.int
 
@@ -617,6 +620,7 @@ func (ctx *Context) ListCpupool() (list []Cpupoolinfo) {
 }
 
 // int libxl_cpupool_info(libxl_ctx *ctx, libxl_cpupoolinfo *info, uint32_t poolid);
+
 func (ctx *Context) CpupoolInfo(Poolid uint32) (pool Cpupoolinfo, err error) {
 	var c_cpupool C.libxl_cpupoolinfo
 
@@ -638,6 +642,7 @@ func (ctx *Context) CpupoolInfo(Poolid uint32) (pool Cpupoolinfo, err error) {
 //                          uint32_t *poolid);
 // FIXME: uuid
 // FIXME: Setting poolid
+
 func (ctx *Context) CpupoolCreate(Name string, Scheduler Scheduler, Cpumap Bitmap) (err error, Poolid uint32) {
 	poolid := C.uint32_t(C.LIBXL_CPUPOOL_POOLID_ANY)
 	name := C.CString(Name)
@@ -666,6 +671,7 @@ func (ctx *Context) CpupoolCreate(Name string, Scheduler Scheduler, Cpumap Bitma
 }
 
 // int libxl_cpupool_destroy(libxl_ctx *ctx, uint32_t poolid);
+
 func (ctx *Context) CpupoolDestroy(Poolid uint32) (err error) {
 	ret := C.libxl_cpupool_destroy(ctx.ctx, C.uint32_t(Poolid))
 	if ret != 0 {
@@ -677,6 +683,7 @@ func (ctx *Context) CpupoolDestroy(Poolid uint32) (err error) {
 }
 
 // int libxl_cpupool_cpuadd(libxl_ctx *ctx, uint32_t poolid, int cpu);
+
 func (ctx *Context) CpupoolCpuadd(Poolid uint32, Cpu int) (err error) {
 	ret := C.libxl_cpupool_cpuadd(ctx.ctx, C.uint32_t(Poolid), C.int(Cpu))
 	if ret != 0 {
@@ -689,6 +696,7 @@ func (ctx *Context) CpupoolCpuadd(Poolid uint32, Cpu int) (err error) {
 
 // int libxl_cpupool_cpuadd_cpumap(libxl_ctx *ctx, uint32_t poolid,
 //                                 const libxl_bitmap *cpumap);
+
 func (ctx *Context) CpupoolCpuaddCpumap(Poolid uint32, Cpumap Bitmap) (err error) {
 	var cbm C.libxl_bitmap
 	if err = Cpumap.toC(&cbm); err != nil {
@@ -706,6 +714,7 @@ func (ctx *Context) CpupoolCpuaddCpumap(Poolid uint32, Cpumap Bitmap) (err error
 }
 
 // int libxl_cpupool_cpuremove(libxl_ctx *ctx, uint32_t poolid, int cpu);
+
 func (ctx *Context) CpupoolCpuremove(Poolid uint32, Cpu int) (err error) {
 	ret := C.libxl_cpupool_cpuremove(ctx.ctx, C.uint32_t(Poolid), C.int(Cpu))
 	if ret != 0 {
@@ -718,6 +727,7 @@ func (ctx *Context) CpupoolCpuremove(Poolid uint32, Cpu int) (err error) {
 
 // int libxl_cpupool_cpuremove_cpumap(libxl_ctx *ctx, uint32_t poolid,
 //                                    const libxl_bitmap *cpumap);
+
 func (ctx *Context) CpupoolCpuremoveCpumap(Poolid uint32, Cpumap Bitmap) (err error) {
 	var cbm C.libxl_bitmap
 	if err = Cpumap.toC(&cbm); err != nil {
@@ -735,6 +745,7 @@ func (ctx *Context) CpupoolCpuremoveCpumap(Poolid uint32, Cpumap Bitmap) (err er
 }
 
 // int libxl_cpupool_rename(libxl_ctx *ctx, const char *name, uint32_t poolid);
+
 func (ctx *Context) CpupoolRename(Name string, Poolid uint32) (err error) {
 	name := C.CString(Name)
 	defer C.free(unsafe.Pointer(name))
@@ -749,6 +760,7 @@ func (ctx *Context) CpupoolRename(Name string, Poolid uint32) (err error) {
 }
 
 // int libxl_cpupool_cpuadd_node(libxl_ctx *ctx, uint32_t poolid, int node, int *cpus);
+
 func (ctx *Context) CpupoolCpuaddNode(Poolid uint32, Node int) (Cpus int, err error) {
 	ccpus := C.int(0)
 
@@ -764,6 +776,7 @@ func (ctx *Context) CpupoolCpuaddNode(Poolid uint32, Node int) (Cpus int, err er
 }
 
 // int libxl_cpupool_cpuremove_node(libxl_ctx *ctx, uint32_t poolid, int node, int *cpus);
+
 func (ctx *Context) CpupoolCpuremoveNode(Poolid uint32, Node int) (Cpus int, err error) {
 	ccpus := C.int(0)
 
@@ -779,6 +792,7 @@ func (ctx *Context) CpupoolCpuremoveNode(Poolid uint32, Node int) (Cpus int, err
 }
 
 // int libxl_cpupool_movedomain(libxl_ctx *ctx, uint32_t poolid, uint32_t domid);
+
 func (ctx *Context) CpupoolMovedomain(Poolid uint32, Id Domid) (err error) {
 	ret := C.libxl_cpupool_movedomain(ctx.ctx, C.uint32_t(Poolid), C.uint32_t(Id))
 	if ret != 0 {
@@ -792,6 +806,7 @@ func (ctx *Context) CpupoolMovedomain(Poolid uint32, Id Domid) (err error) {
 //
 // Utility functions
 //
+
 func (ctx *Context) CpupoolFindByName(name string) (info Cpupoolinfo, found bool) {
 	plist := ctx.ListCpupool()
 
@@ -940,6 +955,7 @@ func (bm Bitmap) String() (s string) {
 }
 
 //int libxl_get_max_cpus(libxl_ctx *ctx);
+
 func (ctx *Context) GetMaxCpus() (maxCpus int, err error) {
 	ret := C.libxl_get_max_cpus(ctx.ctx)
 	if ret < 0 {
@@ -951,6 +967,7 @@ func (ctx *Context) GetMaxCpus() (maxCpus int, err error) {
 }
 
 //int libxl_get_online_cpus(libxl_ctx *ctx);
+
 func (ctx *Context) GetOnlineCpus() (onCpus int, err error) {
 	ret := C.libxl_get_online_cpus(ctx.ctx)
 	if ret < 0 {
@@ -962,6 +979,7 @@ func (ctx *Context) GetOnlineCpus() (onCpus int, err error) {
 }
 
 //int libxl_get_max_nodes(libxl_ctx *ctx);
+
 func (ctx *Context) GetMaxNodes() (maxNodes int, err error) {
 	ret := C.libxl_get_max_nodes(ctx.ctx)
 	if ret < 0 {
@@ -973,6 +991,7 @@ func (ctx *Context) GetMaxNodes() (maxNodes int, err error) {
 }
 
 //int libxl_get_free_memory(libxl_ctx *ctx, uint64_t *memkb);
+
 func (ctx *Context) GetFreeMemory() (memkb uint64, err error) {
 	var cmem C.uint64_t
 	ret := C.libxl_get_free_memory(ctx.ctx, &cmem)
@@ -988,6 +1007,7 @@ func (ctx *Context) GetFreeMemory() (memkb uint64, err error) {
 }
 
 //int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
+
 func (ctx *Context) GetPhysinfo() (physinfo *Physinfo, err error) {
 	var cphys C.libxl_physinfo
 	C.libxl_physinfo_init(&cphys)
@@ -1006,6 +1026,7 @@ func (ctx *Context) GetPhysinfo() (physinfo *Physinfo, err error) {
 }
 
 //const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx);
+
 func (ctx *Context) GetVersionInfo() (info *VersionInfo, err error) {
 	var cinfo *C.libxl_version_info
 
@@ -1045,6 +1066,7 @@ func (ctx *Context) DomainUnpause(Id Domid) (err error) {
 }
 
 //int libxl_domain_pause(libxl_ctx *ctx, uint32_t domain);
+
 func (ctx *Context) DomainPause(id Domid) (err error) {
 	ret := C.libxl_domain_pause(ctx.ctx, C.uint32_t(id), nil)
 
@@ -1055,6 +1077,7 @@ func (ctx *Context) DomainPause(id Domid) (err error) {
 }
 
 //int libxl_domain_shutdown(libxl_ctx *ctx, uint32_t domid);
+
 func (ctx *Context) DomainShutdown(id Domid) (err error) {
 	ret := C.libxl_domain_shutdown(ctx.ctx, C.uint32_t(id), nil)
 
@@ -1065,6 +1088,7 @@ func (ctx *Context) DomainShutdown(id Domid) (err error) {
 }
 
 //int libxl_domain_reboot(libxl_ctx *ctx, uint32_t domid);
+
 func (ctx *Context) DomainReboot(id Domid) (err error) {
 	ret := C.libxl_domain_reboot(ctx.ctx, C.uint32_t(id), nil)
 
@@ -1076,6 +1100,7 @@ func (ctx *Context) DomainReboot(id Domid) (err error) {
 
 //libxl_dominfo * libxl_list_domain(libxl_ctx*, int *nb_domain_out);
 //void libxl_dominfo_list_free(libxl_dominfo *list, int nb_domain);
+
 func (ctx *Context) ListDomain() (glist []Dominfo) {
 	var nbDomain C.int
 	clist := C.libxl_list_domain(ctx.ctx, &nbDomain)
@@ -1098,6 +1123,7 @@ func (ctx *Context) ListDomain() (glist []Dominfo) {
 //libxl_vcpuinfo *libxl_list_vcpu(libxl_ctx *ctx, uint32_t domid,
 //				int *nb_vcpu, int *nr_cpus_out);
 //void libxl_vcpuinfo_list_free(libxl_vcpuinfo *, int nr_vcpus);
+
 func (ctx *Context) ListVcpu(id Domid) (glist []Vcpuinfo) {
 	var nbVcpu C.int
 	var nrCpu C.int
@@ -1128,6 +1154,7 @@ func (ct ConsoleType) String() (str string) {
 
 //int libxl_console_get_tty(libxl_ctx *ctx, uint32_t domid, int cons_num,
 //libxl_console_type type, char **path);
+
 func (ctx *Context) ConsoleGetTty(id Domid, consNum int, conType ConsoleType) (path string, err error) {
 	var cpath *C.char
 	ret := C.libxl_console_get_tty(ctx.ctx, C.uint32_t(id), C.int(consNum), C.libxl_console_type(conType), &cpath)
@@ -1143,6 +1170,7 @@ func (ctx *Context) ConsoleGetTty(id Domid, consNum int, conType ConsoleType) (p
 
 //int libxl_primary_console_get_tty(libxl_ctx *ctx, uint32_t domid_vm,
 //					char **path);
+
 func (ctx *Context) PrimaryConsoleGetTty(domid uint32) (path string, err error) {
 	var cpath *C.char
 	ret := C.libxl_primary_console_get_tty(ctx.ctx, C.uint32_t(domid), &cpath)
-- 
2.25.1


