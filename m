Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E7E8AAD2D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 13:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708981.1108240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlyG-0005Ni-A5; Fri, 19 Apr 2024 10:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708981.1108240; Fri, 19 Apr 2024 10:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlyG-0005KL-6l; Fri, 19 Apr 2024 10:59:56 +0000
Received: by outflank-mailman (input) for mailman id 708981;
 Fri, 19 Apr 2024 10:59:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zESt=LY=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rxlyE-00053e-P7
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 10:59:54 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2a0c06f-fe3b-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 12:59:52 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-417f5268b12so20081775e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 03:59:52 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a5d678d000000b003462b54bc8asm4124418wru.109.2024.04.19.03.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 03:59:50 -0700 (PDT)
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
X-Inumbo-ID: f2a0c06f-fe3b-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713524391; x=1714129191; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XAcWiCO0s9msPOLTT5GYrsFMpU+ydrJnzgaSpig/3Q=;
        b=Qc1GWugmzJdxIW5YYkmdhllslzraap1ZqDk7PWtSm7rpaPZmufb5C/fuGDunLIWowx
         50ZaQzJ5xrRDZhVGqp9x4DOqWhvktPISepXLtGvxNnairBDy8J8n/X2fmp+eqP6Fl48W
         tGUyWpQevfKTbFacyl25FVNj/nz3brMIQYw6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713524391; x=1714129191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1XAcWiCO0s9msPOLTT5GYrsFMpU+ydrJnzgaSpig/3Q=;
        b=jkKMicsD1FAeszdMJ8AlF4fuMsLzbBGWtgtT7sHc4Vok+Y+j2jIXWvMa6BprYrYlaC
         qk6IoqwvAF1pfI0GffR/QDUagTIXfV2oX3jzLsqpsZV+OcUTwAS39x6DHME5TFt2OBMf
         FEyd2658opEfrz+azvEer+Bwadm3jNzMI8mZivgnSfUCRTUJe4AoM/w3j/M3QLdXVHQT
         Nsuik1MpDHqGQZo1cWG5bC5k3djiFsTCAU/HBydrOufw8/OKN6NHRIIGXvlZ3Xdt0Inz
         q4OXmEyEYdHPgnVc9K/l7uk8n6KdoW4LasH5Na6anIBDLj0/clVW2k2C5JrvsqtihjWS
         Hulw==
X-Gm-Message-State: AOJu0Yw3n5ejJq/C6dKFJJRn8EjtEivhXaZ10iVk9MjEvGCq6o1ZQ+k+
	DKSc0p8wAddfPjfmKaN9MvngycXKtndN+A2AvFdzlDGECa1SxqVEfAxsWSlL94BTOOuNtNe7Ifl
	9
X-Google-Smtp-Source: AGHT+IGH9FzVoX/AvntYxCRBaqY26+bBX03Ma4Oi/EG8SHABjRsEj1dAF1LkccYsLGFyXjAPWdpEog==
X-Received: by 2002:adf:a357:0:b0:34a:6eb5:c36 with SMTP id d23-20020adfa357000000b0034a6eb50c36mr701864wrb.22.1713524391425;
        Fri, 19 Apr 2024 03:59:51 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 2/3] golang/xenlight: Run `go fmt` on non-generated golang files
Date: Fri, 19 Apr 2024 11:50:36 +0100
Message-Id: <20240419105037.700283-2-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419105037.700283-1-george.dunlap@cloud.com>
References: <20240419105037.700283-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
CC: Nick Rosbrook <rosbrookn@gmail.com>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/golang/xenlight/xenlight.go | 55 +++++++++++++++++--------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index d793f172e5..0ff28590ee 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -633,9 +633,11 @@ func (ctx *Context) CpupoolInfo(Poolid uint32) (pool Cpupoolinfo, err error) {
 }
 
 // int libxl_cpupool_create(libxl_ctx *ctx, const char *name,
-//                          libxl_scheduler sched,
-//                          libxl_bitmap cpumap, libxl_uuid *uuid,
-//                          uint32_t *poolid);
+//
+//	libxl_scheduler sched,
+//	libxl_bitmap cpumap, libxl_uuid *uuid,
+//	uint32_t *poolid);
+//
 // FIXME: uuid
 // FIXME: Setting poolid
 func (ctx *Context) CpupoolCreate(Name string, Scheduler Scheduler, Cpumap Bitmap) (err error, Poolid uint32) {
@@ -688,7 +690,8 @@ func (ctx *Context) CpupoolCpuadd(Poolid uint32, Cpu int) (err error) {
 }
 
 // int libxl_cpupool_cpuadd_cpumap(libxl_ctx *ctx, uint32_t poolid,
-//                                 const libxl_bitmap *cpumap);
+//
+//	const libxl_bitmap *cpumap);
 func (ctx *Context) CpupoolCpuaddCpumap(Poolid uint32, Cpumap Bitmap) (err error) {
 	var cbm C.libxl_bitmap
 	if err = Cpumap.toC(&cbm); err != nil {
@@ -717,7 +720,8 @@ func (ctx *Context) CpupoolCpuremove(Poolid uint32, Cpu int) (err error) {
 }
 
 // int libxl_cpupool_cpuremove_cpumap(libxl_ctx *ctx, uint32_t poolid,
-//                                    const libxl_bitmap *cpumap);
+//
+//	const libxl_bitmap *cpumap);
 func (ctx *Context) CpupoolCpuremoveCpumap(Poolid uint32, Cpumap Bitmap) (err error) {
 	var cbm C.libxl_bitmap
 	if err = Cpumap.toC(&cbm); err != nil {
@@ -789,9 +793,7 @@ func (ctx *Context) CpupoolMovedomain(Poolid uint32, Id Domid) (err error) {
 	return
 }
 
-//
 // Utility functions
-//
 func (ctx *Context) CpupoolFindByName(name string) (info Cpupoolinfo, found bool) {
 	plist := ctx.ListCpupool()
 
@@ -939,7 +941,7 @@ func (bm Bitmap) String() (s string) {
 	return
 }
 
-//int libxl_get_max_cpus(libxl_ctx *ctx);
+// int libxl_get_max_cpus(libxl_ctx *ctx);
 func (ctx *Context) GetMaxCpus() (maxCpus int, err error) {
 	ret := C.libxl_get_max_cpus(ctx.ctx)
 	if ret < 0 {
@@ -950,7 +952,7 @@ func (ctx *Context) GetMaxCpus() (maxCpus int, err error) {
 	return
 }
 
-//int libxl_get_online_cpus(libxl_ctx *ctx);
+// int libxl_get_online_cpus(libxl_ctx *ctx);
 func (ctx *Context) GetOnlineCpus() (onCpus int, err error) {
 	ret := C.libxl_get_online_cpus(ctx.ctx)
 	if ret < 0 {
@@ -961,7 +963,7 @@ func (ctx *Context) GetOnlineCpus() (onCpus int, err error) {
 	return
 }
 
-//int libxl_get_max_nodes(libxl_ctx *ctx);
+// int libxl_get_max_nodes(libxl_ctx *ctx);
 func (ctx *Context) GetMaxNodes() (maxNodes int, err error) {
 	ret := C.libxl_get_max_nodes(ctx.ctx)
 	if ret < 0 {
@@ -972,7 +974,7 @@ func (ctx *Context) GetMaxNodes() (maxNodes int, err error) {
 	return
 }
 
-//int libxl_get_free_memory(libxl_ctx *ctx, uint64_t *memkb);
+// int libxl_get_free_memory(libxl_ctx *ctx, uint64_t *memkb);
 func (ctx *Context) GetFreeMemory() (memkb uint64, err error) {
 	var cmem C.uint64_t
 	ret := C.libxl_get_free_memory(ctx.ctx, &cmem)
@@ -987,7 +989,7 @@ func (ctx *Context) GetFreeMemory() (memkb uint64, err error) {
 
 }
 
-//int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
+// int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
 func (ctx *Context) GetPhysinfo() (physinfo *Physinfo, err error) {
 	var cphys C.libxl_physinfo
 	C.libxl_physinfo_init(&cphys)
@@ -1005,7 +1007,7 @@ func (ctx *Context) GetPhysinfo() (physinfo *Physinfo, err error) {
 	return
 }
 
-//const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx);
+// const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx);
 func (ctx *Context) GetVersionInfo() (info *VersionInfo, err error) {
 	var cinfo *C.libxl_version_info
 
@@ -1044,7 +1046,7 @@ func (ctx *Context) DomainUnpause(Id Domid) (err error) {
 	return
 }
 
-//int libxl_domain_pause(libxl_ctx *ctx, uint32_t domain);
+// int libxl_domain_pause(libxl_ctx *ctx, uint32_t domain);
 func (ctx *Context) DomainPause(id Domid) (err error) {
 	ret := C.libxl_domain_pause(ctx.ctx, C.uint32_t(id), nil)
 
@@ -1054,7 +1056,7 @@ func (ctx *Context) DomainPause(id Domid) (err error) {
 	return
 }
 
-//int libxl_domain_shutdown(libxl_ctx *ctx, uint32_t domid);
+// int libxl_domain_shutdown(libxl_ctx *ctx, uint32_t domid);
 func (ctx *Context) DomainShutdown(id Domid) (err error) {
 	ret := C.libxl_domain_shutdown(ctx.ctx, C.uint32_t(id), nil)
 
@@ -1064,7 +1066,7 @@ func (ctx *Context) DomainShutdown(id Domid) (err error) {
 	return
 }
 
-//int libxl_domain_reboot(libxl_ctx *ctx, uint32_t domid);
+// int libxl_domain_reboot(libxl_ctx *ctx, uint32_t domid);
 func (ctx *Context) DomainReboot(id Domid) (err error) {
 	ret := C.libxl_domain_reboot(ctx.ctx, C.uint32_t(id), nil)
 
@@ -1074,8 +1076,8 @@ func (ctx *Context) DomainReboot(id Domid) (err error) {
 	return
 }
 
-//libxl_dominfo * libxl_list_domain(libxl_ctx*, int *nb_domain_out);
-//void libxl_dominfo_list_free(libxl_dominfo *list, int nb_domain);
+// libxl_dominfo * libxl_list_domain(libxl_ctx*, int *nb_domain_out);
+// void libxl_dominfo_list_free(libxl_dominfo *list, int nb_domain);
 func (ctx *Context) ListDomain() (glist []Dominfo) {
 	var nbDomain C.int
 	clist := C.libxl_list_domain(ctx.ctx, &nbDomain)
@@ -1095,9 +1097,11 @@ func (ctx *Context) ListDomain() (glist []Dominfo) {
 	return
 }
 
-//libxl_vcpuinfo *libxl_list_vcpu(libxl_ctx *ctx, uint32_t domid,
-//				int *nb_vcpu, int *nr_cpus_out);
-//void libxl_vcpuinfo_list_free(libxl_vcpuinfo *, int nr_vcpus);
+// libxl_vcpuinfo *libxl_list_vcpu(libxl_ctx *ctx, uint32_t domid,
+//
+//	int *nb_vcpu, int *nr_cpus_out);
+//
+// void libxl_vcpuinfo_list_free(libxl_vcpuinfo *, int nr_vcpus);
 func (ctx *Context) ListVcpu(id Domid) (glist []Vcpuinfo) {
 	var nbVcpu C.int
 	var nrCpu C.int
@@ -1126,8 +1130,8 @@ func (ct ConsoleType) String() (str string) {
 	return
 }
 
-//int libxl_console_get_tty(libxl_ctx *ctx, uint32_t domid, int cons_num,
-//libxl_console_type type, char **path);
+// int libxl_console_get_tty(libxl_ctx *ctx, uint32_t domid, int cons_num,
+// libxl_console_type type, char **path);
 func (ctx *Context) ConsoleGetTty(id Domid, consNum int, conType ConsoleType) (path string, err error) {
 	var cpath *C.char
 	ret := C.libxl_console_get_tty(ctx.ctx, C.uint32_t(id), C.int(consNum), C.libxl_console_type(conType), &cpath)
@@ -1141,8 +1145,9 @@ func (ctx *Context) ConsoleGetTty(id Domid, consNum int, conType ConsoleType) (p
 	return
 }
 
-//int libxl_primary_console_get_tty(libxl_ctx *ctx, uint32_t domid_vm,
-//					char **path);
+// int libxl_primary_console_get_tty(libxl_ctx *ctx, uint32_t domid_vm,
+//
+//	char **path);
 func (ctx *Context) PrimaryConsoleGetTty(domid uint32) (path string, err error) {
 	var cpath *C.char
 	ret := C.libxl_primary_console_get_tty(ctx.ctx, C.uint32_t(domid), &cpath)
-- 
2.25.1


