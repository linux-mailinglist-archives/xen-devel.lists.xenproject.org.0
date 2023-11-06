Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 419327E24DB
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 14:26:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627986.978959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzzbo-0003Vv-Eb; Mon, 06 Nov 2023 13:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627986.978959; Mon, 06 Nov 2023 13:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzzbo-0003Sk-9M; Mon, 06 Nov 2023 13:25:40 +0000
Received: by outflank-mailman (input) for mailman id 627986;
 Mon, 06 Nov 2023 13:25:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eGT=GT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1qzzbm-0003Se-Do
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 13:25:38 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6f0fe58-7ca7-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 14:25:34 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-32dcd3e5f3fso2739786f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 05:25:34 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a5d58f2000000b0032da4c98ab2sm9410734wrd.35.2023.11.06.05.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 05:25:32 -0800 (PST)
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
X-Inumbo-ID: f6f0fe58-7ca7-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699277133; x=1699881933; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BrsN8g85tOZCVitdJsaSvLMkxIXsjHmxBEHEuL5QyAw=;
        b=hPvsOGAYqCwzSjCZwch67lx5L9s9J0MNpwnB2/9qeEJzyhnTlzKPohOnbgNQiqMRMg
         p8tKcnDZuziRiuNt9csvQFxIkHnzi8FDV+25UuO8DU7t8j9evJFSOjcIDtIyFwjR1EI9
         Ku2MifT1f58yasccd4+VCgMP1gFppsKMNVk1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699277133; x=1699881933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BrsN8g85tOZCVitdJsaSvLMkxIXsjHmxBEHEuL5QyAw=;
        b=fpRp2k6MjJ5nIZP6AlcjAIdcq33Ir/wSsPZSFbDpiyRVFkxjzl99KrsGt9GpmwJcNg
         mse2tbwEdmSSjYAVKjuDk3akUuB+HdgW/LPf8qopsur5elNUZ2tJweBVTCnodgUg15bZ
         FfiAa2vYxPGwXdAgsr+dezJ9+/FWQ9gLOtzrS2fAnu7lX7c/pLT6F1LuSRNRwYiIh54k
         tGxB+Tp+10p9cEVo5MV9nOdznyi1YACLn0D9VViCEni5kdOZaUISCAUyPNeLL2pUugS4
         kHIpKVS8D8PHz9iGPsDzq3VWOGfbM2k/vTHXqbbGdHC1W2mp4fk6y8dk7YhHV4GKN9GY
         sfGw==
X-Gm-Message-State: AOJu0YwkzH5/ft9lzTil1Wja5XgYDhgXR5xn33TVaycbdmYFgki4KK81
	T7PFNb8zMs8pB0palfzIP6IP9dmZHESg0YVKvfA=
X-Google-Smtp-Source: AGHT+IFH8vonB56laO79Py5VYcnm7uOCoQjjtNhJKEciZBtfBeAiszeqo4ywv/trva87VRaxUOz5Zg==
X-Received: by 2002:a5d:5986:0:b0:32f:8248:e00 with SMTP id n6-20020a5d5986000000b0032f82480e00mr21460995wri.51.1699277132883;
        Mon, 06 Nov 2023 05:25:32 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>,
	xen-devel@dornerworks.com
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Nathan Studer <nathan.studer@dornerworks.com>,
	Stewart Hildebrand <stewart@stew.dk>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2] tools: Remove all DECLARE_* op macros in xc
Date: Mon,  6 Nov 2023 13:25:29 +0000
Message-Id: <20231106132529.21248-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These macros were hiding that the ops are not zero-initialized by the
toolstack. This is needlessly opaque for something so simple, so this patch
removes them and replaces them with explicit zero-initialising versions.

The patch also removes PHYSDEV_OP from there, as that seems to be an old
dead macro.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
@Daniel: I CC'd you due to the DECLARE_FLASK_OP removal, though it
shouldn't functionally affect anything at all.

The patch looks big, but all changes are reproducible via this snippet in
the "tools/libs" folder, followed by manually removing the #defines in
"xc_private.h"

  for f in `find -name "*.[ch]"`; do                                 \
      sed -i 's/DECLARE_FLASK_OP/struct xen_flask_op op = {}/g' $f; \
      sed -i 's/DECLARE_SYSCTL/struct xen_sysctl sysctl = {}/g' $f; \
      sed -i 's/DECLARE_DOMCTL/struct xen_domctl domctl = {}/g' $f; \
      sed -i 's/DECLARE_PLATFORM_OP/struct xen_platform_op platform_op = {}/g' $f; \
  done
---
 tools/libs/ctrl/xc_arinc653.c           |   4 +-
 tools/libs/ctrl/xc_cpu_hotplug.c        |   8 +-
 tools/libs/ctrl/xc_cpupool.c            |  14 +--
 tools/libs/ctrl/xc_csched.c             |   8 +-
 tools/libs/ctrl/xc_csched2.c            |   8 +-
 tools/libs/ctrl/xc_domain.c             | 108 ++++++++++++------------
 tools/libs/ctrl/xc_flask.c              |  34 ++++----
 tools/libs/ctrl/xc_memshr.c             |   2 +-
 tools/libs/ctrl/xc_misc.c               |  40 ++++-----
 tools/libs/ctrl/xc_monitor.c            |  30 +++----
 tools/libs/ctrl/xc_pm.c                 |  32 +++----
 tools/libs/ctrl/xc_private.c            |   4 +-
 tools/libs/ctrl/xc_private.h            |   6 --
 tools/libs/ctrl/xc_psr.c                |  22 ++---
 tools/libs/ctrl/xc_resource.c           |   2 +-
 tools/libs/ctrl/xc_rt.c                 |   8 +-
 tools/libs/ctrl/xc_tbuf.c               |  12 +--
 tools/libs/ctrl/xc_vm_event.c           |   4 +-
 tools/libs/guest/xg_cpuid_x86.c         |   8 +-
 tools/libs/guest/xg_dom_arm.c           |   2 +-
 tools/libs/guest/xg_dom_boot.c          |   2 +-
 tools/libs/guest/xg_dom_x86.c           |   2 +-
 tools/libs/guest/xg_offline_page.c      |   6 +-
 tools/libs/guest/xg_resume.c            |   6 +-
 tools/libs/guest/xg_sr_restore_x86_pv.c |   6 +-
 25 files changed, 186 insertions(+), 192 deletions(-)

diff --git a/tools/libs/ctrl/xc_arinc653.c b/tools/libs/ctrl/xc_arinc653.c
index 5d61c1ac11..7f1bb723ba 100644
--- a/tools/libs/ctrl/xc_arinc653.c
+++ b/tools/libs/ctrl/xc_arinc653.c
@@ -33,7 +33,7 @@ xc_sched_arinc653_schedule_set(
     struct xen_sysctl_arinc653_schedule *schedule)
 {
     int rc;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BOUNCE(
         schedule,
         sizeof(*schedule),
@@ -63,7 +63,7 @@ xc_sched_arinc653_schedule_get(
     struct xen_sysctl_arinc653_schedule *schedule)
 {
     int rc;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BOUNCE(
         schedule,
         sizeof(*schedule),
diff --git a/tools/libs/ctrl/xc_cpu_hotplug.c b/tools/libs/ctrl/xc_cpu_hotplug.c
index 2ea9825779..136aad2a39 100644
--- a/tools/libs/ctrl/xc_cpu_hotplug.c
+++ b/tools/libs/ctrl/xc_cpu_hotplug.c
@@ -22,7 +22,7 @@
 
 int xc_cpu_online(xc_interface *xch, int cpu)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     int ret;
 
     sysctl.cmd = XEN_SYSCTL_cpu_hotplug;
@@ -35,7 +35,7 @@ int xc_cpu_online(xc_interface *xch, int cpu)
 
 int xc_cpu_offline(xc_interface *xch, int cpu)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     int ret;
 
     sysctl.cmd = XEN_SYSCTL_cpu_hotplug;
@@ -48,7 +48,7 @@ int xc_cpu_offline(xc_interface *xch, int cpu)
 
 int xc_smt_enable(xc_interface *xch)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     int ret;
 
     sysctl.cmd = XEN_SYSCTL_cpu_hotplug;
@@ -61,7 +61,7 @@ int xc_smt_enable(xc_interface *xch)
 
 int xc_smt_disable(xc_interface *xch)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     int ret;
 
     sysctl.cmd = XEN_SYSCTL_cpu_hotplug;
diff --git a/tools/libs/ctrl/xc_cpupool.c b/tools/libs/ctrl/xc_cpupool.c
index fbd8cc9d03..f0ff332e83 100644
--- a/tools/libs/ctrl/xc_cpupool.c
+++ b/tools/libs/ctrl/xc_cpupool.c
@@ -39,7 +39,7 @@ int xc_cpupool_create(xc_interface *xch,
                       uint32_t sched_id)
 {
     int err;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_cpupool_op;
     sysctl.u.cpupool_op.op = XEN_SYSCTL_CPUPOOL_OP_CREATE;
@@ -56,7 +56,7 @@ int xc_cpupool_create(xc_interface *xch,
 int xc_cpupool_destroy(xc_interface *xch,
                        uint32_t poolid)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_cpupool_op;
     sysctl.u.cpupool_op.op = XEN_SYSCTL_CPUPOOL_OP_DESTROY;
@@ -70,7 +70,7 @@ xc_cpupoolinfo_t *xc_cpupool_getinfo(xc_interface *xch,
     int err = 0;
     xc_cpupoolinfo_t *info = NULL;
     int local_size;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BUFFER(uint8_t, local);
 
     local_size = xc_get_cpumap_size(xch);
@@ -129,7 +129,7 @@ int xc_cpupool_addcpu(xc_interface *xch,
                       uint32_t poolid,
                       int cpu)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_cpupool_op;
     sysctl.u.cpupool_op.op = XEN_SYSCTL_CPUPOOL_OP_ADDCPU;
@@ -152,7 +152,7 @@ int xc_cpupool_removecpu(xc_interface *xch,
 {
     unsigned retries;
     int err = 0;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_cpupool_op;
     sysctl.u.cpupool_op.op = XEN_SYSCTL_CPUPOOL_OP_RMCPU;
@@ -170,7 +170,7 @@ int xc_cpupool_movedomain(xc_interface *xch,
                           uint32_t poolid,
                           uint32_t domid)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_cpupool_op;
     sysctl.u.cpupool_op.op = XEN_SYSCTL_CPUPOOL_OP_MOVEDOMAIN;
@@ -184,7 +184,7 @@ xc_cpumap_t xc_cpupool_freeinfo(xc_interface *xch)
     int err = -1;
     xc_cpumap_t cpumap = NULL;
     int mapsize;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BUFFER(uint8_t, local);
 
     mapsize = xc_get_cpumap_size(xch);
diff --git a/tools/libs/ctrl/xc_csched.c b/tools/libs/ctrl/xc_csched.c
index 8e8c67220a..d59b50d4d4 100644
--- a/tools/libs/ctrl/xc_csched.c
+++ b/tools/libs/ctrl/xc_csched.c
@@ -29,7 +29,7 @@ xc_sched_credit_domain_set(
     uint32_t domid,
     struct xen_domctl_sched_credit *sdom)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_scheduler_op;
     domctl.domain = domid;
@@ -49,7 +49,7 @@ xc_sched_credit_domain_get(
     uint32_t domid,
     struct xen_domctl_sched_credit *sdom)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_scheduler_op;
     domctl.domain = domid;
@@ -70,7 +70,7 @@ xc_sched_credit_params_set(
     uint32_t cpupool_id,
     struct xen_sysctl_credit_schedule *schedule)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_scheduler_op;
     sysctl.u.scheduler_op.cpupool_id = cpupool_id;
@@ -93,7 +93,7 @@ xc_sched_credit_params_get(
     uint32_t cpupool_id,
     struct xen_sysctl_credit_schedule *schedule)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_scheduler_op;
     sysctl.u.scheduler_op.cpupool_id = cpupool_id;
diff --git a/tools/libs/ctrl/xc_csched2.c b/tools/libs/ctrl/xc_csched2.c
index 5eb753ad99..c032e3603e 100644
--- a/tools/libs/ctrl/xc_csched2.c
+++ b/tools/libs/ctrl/xc_csched2.c
@@ -29,7 +29,7 @@ xc_sched_credit2_domain_set(
     uint32_t domid,
     struct xen_domctl_sched_credit2 *sdom)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_scheduler_op;
     domctl.domain = domid;
@@ -49,7 +49,7 @@ xc_sched_credit2_domain_get(
     uint32_t domid,
     struct xen_domctl_sched_credit2 *sdom)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_scheduler_op;
     domctl.domain = domid;
@@ -70,7 +70,7 @@ xc_sched_credit2_params_set(
     uint32_t cpupool_id,
     struct xen_sysctl_credit2_schedule *schedule)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_scheduler_op;
     sysctl.u.scheduler_op.cpupool_id = cpupool_id;
@@ -93,7 +93,7 @@ xc_sched_credit2_params_get(
     uint32_t cpupool_id,
     struct xen_sysctl_credit2_schedule *schedule)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_scheduler_op;
     sysctl.u.scheduler_op.cpupool_id = cpupool_id;
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 724fa6f753..f2d9d14b4d 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -27,7 +27,7 @@ int xc_domain_create(xc_interface *xch, uint32_t *pdomid,
                      struct xen_domctl_createdomain *config)
 {
     int err;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_createdomain;
     domctl.domain = *pdomid;
@@ -54,7 +54,7 @@ int xc_domain_cacheflush(xc_interface *xch, uint32_t domid,
      */
     return 0;
 #else
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     domctl.cmd = XEN_DOMCTL_cacheflush;
     domctl.domain = domid;
     domctl.u.cacheflush.start_pfn = start_pfn;
@@ -66,7 +66,7 @@ int xc_domain_cacheflush(xc_interface *xch, uint32_t domid,
 int xc_domain_pause(xc_interface *xch,
                     uint32_t domid)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     domctl.cmd = XEN_DOMCTL_pausedomain;
     domctl.domain = domid;
     return do_domctl(xch, &domctl);
@@ -76,7 +76,7 @@ int xc_domain_pause(xc_interface *xch,
 int xc_domain_unpause(xc_interface *xch,
                       uint32_t domid)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     domctl.cmd = XEN_DOMCTL_unpausedomain;
     domctl.domain = domid;
     return do_domctl(xch, &domctl);
@@ -86,7 +86,7 @@ int xc_domain_unpause(xc_interface *xch,
 int xc_domain_destroy(xc_interface *xch,
                       uint32_t domid)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     domctl.cmd = XEN_DOMCTL_destroydomain;
     domctl.domain = domid;
     return do_domctl(xch, &domctl);
@@ -123,7 +123,7 @@ int xc_domain_node_setaffinity(xc_interface *xch,
                                uint32_t domid,
                                xc_nodemap_t nodemap)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BUFFER(uint8_t, local);
     int ret = -1;
     int nodesize;
@@ -161,7 +161,7 @@ int xc_domain_node_getaffinity(xc_interface *xch,
                                uint32_t domid,
                                xc_nodemap_t nodemap)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BUFFER(uint8_t, local);
     int ret = -1;
     int nodesize;
@@ -203,7 +203,7 @@ int xc_vcpu_setaffinity(xc_interface *xch,
                         xc_cpumap_t cpumap_soft_inout,
                         uint32_t flags)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BOUNCE(cpumap_hard_inout, 0,
                              XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
     DECLARE_HYPERCALL_BOUNCE(cpumap_soft_inout, 0,
@@ -257,7 +257,7 @@ int xc_vcpu_getaffinity(xc_interface *xch,
                         xc_cpumap_t cpumap_soft,
                         uint32_t flags)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BOUNCE(cpumap_hard, 0, XC_HYPERCALL_BUFFER_BOUNCE_OUT);
     DECLARE_HYPERCALL_BOUNCE(cpumap_soft, 0, XC_HYPERCALL_BUFFER_BOUNCE_OUT);
     int ret = -1;
@@ -304,7 +304,7 @@ int xc_vcpu_getaffinity(xc_interface *xch,
 int xc_domain_get_guest_width(xc_interface *xch, uint32_t domid,
                               unsigned int *guest_width)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     memset(&domctl, 0, sizeof(domctl));
     domctl.domain = domid;
@@ -325,7 +325,7 @@ int xc_dom_vuart_init(xc_interface *xch,
                       xen_pfn_t gfn,
                       evtchn_port_t *evtchn)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     int rc = 0;
 
     memset(&domctl, 0, sizeof(domctl));
@@ -369,7 +369,7 @@ int xc_domain_getinfolist(xc_interface *xch,
                           xc_domaininfo_t *info)
 {
     int ret = 0;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BOUNCE(info, max_domains*sizeof(*info), XC_HYPERCALL_BUFFER_BOUNCE_OUT);
 
     if ( xc_hypercall_bounce_pre(xch, info) )
@@ -396,7 +396,7 @@ int xc_set_broken_page_p2m(xc_interface *xch,
                            unsigned long pfn)
 {
     int ret;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_set_broken_page_p2m;
     domctl.domain = domid;
@@ -413,7 +413,7 @@ int xc_domain_hvm_getcontext(xc_interface *xch,
                              uint32_t size)
 {
     int ret;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BOUNCE(ctxt_buf, size, XC_HYPERCALL_BUFFER_BOUNCE_OUT);
 
     if ( xc_hypercall_bounce_pre(xch, ctxt_buf) )
@@ -441,7 +441,7 @@ int xc_domain_hvm_getcontext_partial(xc_interface *xch,
                                      uint32_t size)
 {
     int ret;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BOUNCE(ctxt_buf, size, XC_HYPERCALL_BUFFER_BOUNCE_OUT);
 
     if ( !ctxt_buf || xc_hypercall_bounce_pre(xch, ctxt_buf) )
@@ -468,7 +468,7 @@ int xc_domain_hvm_setcontext(xc_interface *xch,
                              uint32_t size)
 {
     int ret;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BOUNCE(ctxt_buf, size, XC_HYPERCALL_BUFFER_BOUNCE_IN);
 
     if ( xc_hypercall_bounce_pre(xch, ctxt_buf) )
@@ -492,7 +492,7 @@ int xc_vcpu_getcontext(xc_interface *xch,
                        vcpu_guest_context_any_t *ctxt)
 {
     int rc;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BOUNCE(ctxt, sizeof(vcpu_guest_context_any_t), XC_HYPERCALL_BUFFER_BOUNCE_OUT);
 
     if ( xc_hypercall_bounce_pre(xch, ctxt) )
@@ -517,7 +517,7 @@ int xc_vcpu_get_extstate(xc_interface *xch,
 {
     int rc = -ENODEV;
 #if defined (__i386__) || defined(__x86_64__)
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BUFFER(void, buffer);
     bool get_state;
 
@@ -606,7 +606,7 @@ int xc_shadow_control(xc_interface *xch,
                       unsigned int mode)
 {
     int rc;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     memset(&domctl, 0, sizeof(domctl));
 
@@ -690,7 +690,7 @@ int xc_domain_setmaxmem(xc_interface *xch,
                         uint32_t domid,
                         uint64_t max_memkb)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     domctl.cmd = XEN_DOMCTL_max_mem;
     domctl.domain = domid;
     domctl.u.max_mem.max_memkb = max_memkb;
@@ -808,7 +808,7 @@ int xc_domain_set_time_offset(xc_interface *xch,
                               uint32_t domid,
                               int32_t time_offset_seconds)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     domctl.cmd = XEN_DOMCTL_settimeoffset;
     domctl.domain = domid;
     domctl.u.settimeoffset.time_offset_seconds = time_offset_seconds;
@@ -822,7 +822,7 @@ int xc_domain_set_tsc_info(xc_interface *xch,
                            uint32_t gtsc_khz,
                            uint32_t incarnation)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     domctl.cmd = XEN_DOMCTL_settscinfo;
     domctl.domain = domid;
     domctl.u.tsc_info.tsc_mode = tsc_mode;
@@ -840,7 +840,7 @@ int xc_domain_get_tsc_info(xc_interface *xch,
                            uint32_t *incarnation)
 {
     int rc;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_gettscinfo;
     domctl.domain = domid;
@@ -1280,7 +1280,7 @@ int xc_domain_get_pod_target(xc_interface *xch,
 
 int xc_domain_max_vcpus(xc_interface *xch, uint32_t domid, unsigned int max)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     domctl.cmd = XEN_DOMCTL_max_vcpus;
     domctl.domain = domid;
     domctl.u.max_vcpus.max    = max;
@@ -1290,7 +1290,7 @@ int xc_domain_max_vcpus(xc_interface *xch, uint32_t domid, unsigned int max)
 int xc_domain_sethandle(xc_interface *xch, uint32_t domid,
                         xen_domain_handle_t handle)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     domctl.cmd = XEN_DOMCTL_setdomainhandle;
     domctl.domain = domid;
     memcpy(domctl.u.setdomainhandle.handle, handle,
@@ -1304,7 +1304,7 @@ int xc_vcpu_getinfo(xc_interface *xch,
                     xc_vcpuinfo_t *info)
 {
     int rc;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_getvcpuinfo;
     domctl.domain = domid;
@@ -1323,7 +1323,7 @@ int xc_domain_ioport_permission(xc_interface *xch,
                                 uint32_t nr_ports,
                                 uint32_t allow_access)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_ioport_permission;
     domctl.domain = domid;
@@ -1340,7 +1340,7 @@ int xc_availheap(xc_interface *xch,
                  int node,
                  uint64_t *bytes)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     int rc;
 
     sysctl.cmd = XEN_SYSCTL_availheap;
@@ -1360,7 +1360,7 @@ int xc_vcpu_setcontext(xc_interface *xch,
                        uint32_t vcpu,
                        vcpu_guest_context_any_t *ctxt)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BOUNCE(ctxt, sizeof(vcpu_guest_context_any_t), XC_HYPERCALL_BUFFER_BOUNCE_IN);
     int rc;
 
@@ -1384,7 +1384,7 @@ int xc_domain_irq_permission(xc_interface *xch,
                              uint32_t pirq,
                              bool allow_access)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_irq_permission;
     domctl.domain = domid;
@@ -1400,7 +1400,7 @@ int xc_domain_iomem_permission(xc_interface *xch,
                                unsigned long nr_mfns,
                                uint8_t allow_access)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_iomem_permission;
     domctl.domain = domid;
@@ -1416,7 +1416,7 @@ int xc_domain_send_trigger(xc_interface *xch,
                            uint32_t trigger,
                            uint32_t vcpu)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_sendtrigger;
     domctl.domain = domid;
@@ -1485,7 +1485,7 @@ int xc_domain_setdebugging(xc_interface *xch,
                            uint32_t domid,
                            unsigned int enable)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_setdebugging;
     domctl.domain = domid;
@@ -1499,7 +1499,7 @@ int xc_assign_device(
     uint32_t machine_sbdf,
     uint32_t flags)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_assign_device;
     domctl.domain = domid;
@@ -1519,7 +1519,7 @@ int xc_get_device_group(
     uint32_t *sdev_array)
 {
     int rc;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BOUNCE(sdev_array, max_sdevs * sizeof(*sdev_array),
                              XC_HYPERCALL_BUFFER_BOUNCE_OUT);
 
@@ -1551,7 +1551,7 @@ int xc_test_assign_device(
     uint32_t domid,
     uint32_t machine_sbdf)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_test_assign_device;
     domctl.domain = domid;
@@ -1567,7 +1567,7 @@ int xc_deassign_device(
     uint32_t domid,
     uint32_t machine_sbdf)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_deassign_device;
     domctl.domain = domid;
@@ -1585,7 +1585,7 @@ int xc_assign_dt_device(
 {
     int rc;
     size_t size = strlen(path);
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BOUNCE(path, size, XC_HYPERCALL_BUFFER_BOUNCE_IN);
 
     if ( xc_hypercall_bounce_pre(xch, path) )
@@ -1617,7 +1617,7 @@ int xc_test_assign_dt_device(
 {
     int rc;
     size_t size = strlen(path);
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BOUNCE(path, size, XC_HYPERCALL_BUFFER_BOUNCE_IN);
 
     if ( xc_hypercall_bounce_pre(xch, path) )
@@ -1645,7 +1645,7 @@ int xc_deassign_dt_device(
 {
     int rc;
     size_t size = strlen(path);
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BOUNCE(path, size, XC_HYPERCALL_BUFFER_BOUNCE_IN);
 
     if ( xc_hypercall_bounce_pre(xch, path) )
@@ -1679,7 +1679,7 @@ int xc_domain_update_msi_irq(
 {
     int rc;
     struct xen_domctl_bind_pt_irq *bind;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_bind_pt_irq;
     domctl.domain = domid;
@@ -1704,7 +1704,7 @@ int xc_domain_unbind_msi_irq(
 {
     int rc;
     struct xen_domctl_bind_pt_irq *bind;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_unbind_pt_irq;
     domctl.domain = domid;
@@ -1733,7 +1733,7 @@ static int xc_domain_bind_pt_irq_int(
 {
     int rc;
     struct xen_domctl_bind_pt_irq *bind;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_bind_pt_irq;
     domctl.domain = domid;
@@ -1791,7 +1791,7 @@ static int xc_domain_unbind_pt_irq_int(
 {
     int rc;
     struct xen_domctl_bind_pt_irq *bind;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_unbind_pt_irq;
     domctl.domain = domid;
@@ -1886,7 +1886,7 @@ int xc_domain_memory_mapping(
     unsigned long nr_mfns,
     uint32_t add_mapping)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     xc_domaininfo_t info;
     int ret = 0, rc;
     unsigned long done = 0, nr, max_batch_sz;
@@ -1958,7 +1958,7 @@ int xc_domain_ioport_mapping(
     uint32_t nr_ports,
     uint32_t add_mapping)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_ioport_mapping;
     domctl.domain = domid;
@@ -1975,7 +1975,7 @@ int xc_domain_set_target(
     uint32_t domid,
     uint32_t target)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_set_target;
     domctl.domain = domid;
@@ -1987,7 +1987,7 @@ int xc_domain_set_target(
 int xc_domain_subscribe_for_suspend(
     xc_interface *xch, uint32_t dom, evtchn_port_t port)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_subscribe;
     domctl.domain = dom;
@@ -1998,7 +1998,7 @@ int xc_domain_subscribe_for_suspend(
 
 int xc_domain_debug_control(xc_interface *xc, uint32_t domid, uint32_t sop, uint32_t vcpu)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     memset(&domctl, 0, sizeof(domctl));
     domctl.domain = domid;
@@ -2015,7 +2015,7 @@ int xc_domain_p2m_audit(xc_interface *xch,
                         uint64_t *m2p_bad,   
                         uint64_t *p2m_bad)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     int rc;
 
     domctl.cmd = XEN_DOMCTL_audit_p2m;
@@ -2033,7 +2033,7 @@ int xc_domain_set_access_required(xc_interface *xch,
                                   uint32_t domid,
                                   unsigned int required)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_set_access_required;
     domctl.domain = domid;
@@ -2043,7 +2043,7 @@ int xc_domain_set_access_required(xc_interface *xch,
 
 int xc_domain_set_virq_handler(xc_interface *xch, uint32_t domid, int virq)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_set_virq_handler;
     domctl.domain = domid;
@@ -2063,7 +2063,7 @@ int xc_domain_setvnuma(xc_interface *xch,
                        unsigned int *vnode_to_pnode)
 {
     int rc;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BOUNCE(vmemrange, sizeof(*vmemrange) * nr_vmemranges,
                              XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
     DECLARE_HYPERCALL_BOUNCE(vdistance, sizeof(*vdistance) *
@@ -2175,7 +2175,7 @@ int xc_domain_getvnuma(xc_interface *xch,
 int xc_domain_soft_reset(xc_interface *xch,
                          uint32_t domid)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     domctl.cmd = XEN_DOMCTL_soft_reset;
     domctl.domain = domid;
     return do_domctl(xch, &domctl);
diff --git a/tools/libs/ctrl/xc_flask.c b/tools/libs/ctrl/xc_flask.c
index c1652ba48d..21ba697ad6 100644
--- a/tools/libs/ctrl/xc_flask.c
+++ b/tools/libs/ctrl/xc_flask.c
@@ -64,7 +64,7 @@ int xc_flask_op(xc_interface *xch, xen_flask_op_t *op)
 int xc_flask_load(xc_interface *xch, char *buf, uint32_t size)
 {
     int err;
-    DECLARE_FLASK_OP;
+    struct xen_flask_op op = {};
     DECLARE_HYPERCALL_BOUNCE(buf, size, XC_HYPERCALL_BUFFER_BOUNCE_IN);
     if ( xc_hypercall_bounce_pre(xch, buf) )
     {
@@ -86,7 +86,7 @@ int xc_flask_load(xc_interface *xch, char *buf, uint32_t size)
 int xc_flask_context_to_sid(xc_interface *xch, char *buf, uint32_t size, uint32_t *sid)
 {
     int err;
-    DECLARE_FLASK_OP;
+    struct xen_flask_op op = {};
     DECLARE_HYPERCALL_BOUNCE(buf, size, XC_HYPERCALL_BUFFER_BOUNCE_IN);
 
     if ( xc_hypercall_bounce_pre(xch, buf) )
@@ -112,7 +112,7 @@ int xc_flask_context_to_sid(xc_interface *xch, char *buf, uint32_t size, uint32_
 int xc_flask_sid_to_context(xc_interface *xch, int sid, char *buf, uint32_t size)
 {
     int err;
-    DECLARE_FLASK_OP;
+    struct xen_flask_op op = {};
     DECLARE_HYPERCALL_BOUNCE(buf, size, XC_HYPERCALL_BUFFER_BOUNCE_OUT);
 
     if ( xc_hypercall_bounce_pre(xch, buf) )
@@ -135,7 +135,7 @@ int xc_flask_sid_to_context(xc_interface *xch, int sid, char *buf, uint32_t size
 
 int xc_flask_getenforce(xc_interface *xch)
 {
-    DECLARE_FLASK_OP;
+    struct xen_flask_op op = {};
     op.cmd = FLASK_GETENFORCE;
     
     return xc_flask_op(xch, &op);
@@ -143,7 +143,7 @@ int xc_flask_getenforce(xc_interface *xch)
 
 int xc_flask_setenforce(xc_interface *xch, int mode)
 {
-    DECLARE_FLASK_OP;
+    struct xen_flask_op op = {};
     op.cmd = FLASK_SETENFORCE;
     op.u.enforce.enforcing = mode;
    
@@ -153,7 +153,7 @@ int xc_flask_setenforce(xc_interface *xch, int mode)
 int xc_flask_getbool_byid(xc_interface *xch, int id, char *name, uint32_t size, int *curr, int *pend)
 {
     int rv;
-    DECLARE_FLASK_OP;
+    struct xen_flask_op op = {};
     DECLARE_HYPERCALL_BOUNCE(name, size, XC_HYPERCALL_BUFFER_BOUNCE_OUT);
 
     if ( xc_hypercall_bounce_pre(xch, name) )
@@ -185,7 +185,7 @@ int xc_flask_getbool_byid(xc_interface *xch, int id, char *name, uint32_t size,
 int xc_flask_getbool_byname(xc_interface *xch, char *name, int *curr, int *pend)
 {
     int rv;
-    DECLARE_FLASK_OP;
+    struct xen_flask_op op = {};
     DECLARE_HYPERCALL_BOUNCE(name, strlen(name), XC_HYPERCALL_BUFFER_BOUNCE_IN);
 
     if ( xc_hypercall_bounce_pre(xch, name) )
@@ -217,7 +217,7 @@ int xc_flask_getbool_byname(xc_interface *xch, char *name, int *curr, int *pend)
 int xc_flask_setbool(xc_interface *xch, char *name, int value, int commit)
 {
     int rv;
-    DECLARE_FLASK_OP;
+    struct xen_flask_op op = {};
     DECLARE_HYPERCALL_BOUNCE(name, strlen(name), XC_HYPERCALL_BUFFER_BOUNCE_IN);
 
     if ( xc_hypercall_bounce_pre(xch, name) )
@@ -245,7 +245,7 @@ static int xc_flask_add(xc_interface *xch, uint32_t ocon, uint64_t low, uint64_t
 {
     uint32_t sid;
     int err;
-    DECLARE_FLASK_OP;
+    struct xen_flask_op op = {};
 
     err = xc_flask_context_to_sid(xch, scontext, strlen(scontext), &sid);
     if ( err )
@@ -284,7 +284,7 @@ int xc_flask_add_device(xc_interface *xch, unsigned long device, char *scontext)
 
 static int xc_flask_del(xc_interface *xch, uint32_t ocon, uint64_t low, uint64_t high)
 {
-    DECLARE_FLASK_OP;
+    struct xen_flask_op op = {};
 
     op.cmd = FLASK_DEL_OCONTEXT;
     op.u.ocontext.ocon = ocon;
@@ -320,7 +320,7 @@ int xc_flask_access(xc_interface *xch, const char *scon, const char *tcon,
                 uint32_t *auditallow, uint32_t *auditdeny,
                 uint32_t *seqno)
 {
-    DECLARE_FLASK_OP;
+    struct xen_flask_op op = {};
     int err;
 
     err = xc_flask_context_to_sid(xch, (char*)scon, strlen(scon), &op.u.access.ssid);
@@ -359,7 +359,7 @@ int xc_flask_access(xc_interface *xch, const char *scon, const char *tcon,
 int xc_flask_avc_hashstats(xc_interface *xch, char *buf, int size)
 {
     int err;
-    DECLARE_FLASK_OP;
+    struct xen_flask_op op = {};
   
     op.cmd = FLASK_AVC_HASHSTATS;
   
@@ -377,7 +377,7 @@ int xc_flask_avc_cachestats(xc_interface *xch, char *buf, int size)
 {
     int err, n;
     int i = 0;
-    DECLARE_FLASK_OP;
+    struct xen_flask_op op = {};
 
     n = snprintf(buf, size, "lookups hits misses allocations reclaims frees\n");
     buf += n;
@@ -406,7 +406,7 @@ int xc_flask_avc_cachestats(xc_interface *xch, char *buf, int size)
 
 int xc_flask_policyvers(xc_interface *xch)
 {
-    DECLARE_FLASK_OP;
+    struct xen_flask_op op = {};
     op.cmd = FLASK_POLICYVERS;
 
     return xc_flask_op(xch, &op);
@@ -414,7 +414,7 @@ int xc_flask_policyvers(xc_interface *xch)
 
 int xc_flask_getavc_threshold(xc_interface *xch)
 {
-    DECLARE_FLASK_OP;
+    struct xen_flask_op op = {};
     op.cmd = FLASK_GETAVC_THRESHOLD;
     
     return xc_flask_op(xch, &op);
@@ -422,7 +422,7 @@ int xc_flask_getavc_threshold(xc_interface *xch)
 
 int xc_flask_setavc_threshold(xc_interface *xch, int threshold)
 {
-    DECLARE_FLASK_OP;
+    struct xen_flask_op op = {};
     op.cmd = FLASK_SETAVC_THRESHOLD;
     op.u.setavc_threshold.threshold = threshold;
 
@@ -431,7 +431,7 @@ int xc_flask_setavc_threshold(xc_interface *xch, int threshold)
 
 int xc_flask_relabel_domain(xc_interface *xch, uint32_t domid, uint32_t sid)
 {
-    DECLARE_FLASK_OP;
+    struct xen_flask_op op = {};
     op.cmd = FLASK_RELABEL_DOMAIN;
     op.u.relabel.domid = domid;
     op.u.relabel.sid = sid;
diff --git a/tools/libs/ctrl/xc_memshr.c b/tools/libs/ctrl/xc_memshr.c
index 2f65b3b22e..6f5e005c99 100644
--- a/tools/libs/ctrl/xc_memshr.c
+++ b/tools/libs/ctrl/xc_memshr.c
@@ -28,7 +28,7 @@ int xc_memshr_control(xc_interface *xch,
                       uint32_t domid,
                       int enable)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     struct xen_domctl_mem_sharing_op *op;
 
     domctl.cmd = XEN_DOMCTL_mem_sharing_op;
diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
index 4159294b2e..5ecdfa2c79 100644
--- a/tools/libs/ctrl/xc_misc.c
+++ b/tools/libs/ctrl/xc_misc.c
@@ -138,7 +138,7 @@ int xc_readconsolering(xc_interface *xch,
 {
     int ret;
     unsigned int nr_chars = *pnr_chars;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BOUNCE(buffer, nr_chars, XC_HYPERCALL_BUFFER_BOUNCE_OUT);
 
     if ( xc_hypercall_bounce_pre(xch, buffer) )
@@ -170,7 +170,7 @@ int xc_readconsolering(xc_interface *xch,
 int xc_send_debug_keys(xc_interface *xch, const char *keys)
 {
     int ret, len = strlen(keys);
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BOUNCE_IN(keys, len);
 
     if ( xc_hypercall_bounce_pre(xch, keys) )
@@ -191,7 +191,7 @@ int xc_physinfo(xc_interface *xch,
                 xc_physinfo_t *put_info)
 {
     int ret;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_physinfo;
 
@@ -206,7 +206,7 @@ int xc_physinfo(xc_interface *xch,
 int xc_microcode_update(xc_interface *xch, const void *buf, size_t len)
 {
     int ret;
-    DECLARE_PLATFORM_OP;
+    struct xen_platform_op platform_op = {};
     DECLARE_HYPERCALL_BUFFER(struct xenpf_microcode_update, uc);
 
     uc = xc_hypercall_buffer_alloc(xch, uc, len);
@@ -265,7 +265,7 @@ int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
                    xc_cputopo_t *cputopo)
 {
     int ret;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BOUNCE(cputopo, *max_cpus * sizeof(*cputopo),
                              XC_HYPERCALL_BUFFER_BOUNCE_OUT);
 
@@ -292,7 +292,7 @@ int xc_numainfo(xc_interface *xch, unsigned *max_nodes,
                 xc_meminfo_t *meminfo, uint32_t *distance)
 {
     int ret;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BOUNCE(meminfo, *max_nodes * sizeof(*meminfo),
                              XC_HYPERCALL_BUFFER_BOUNCE_OUT);
     DECLARE_HYPERCALL_BOUNCE(distance,
@@ -328,7 +328,7 @@ int xc_pcitopoinfo(xc_interface *xch, unsigned num_devs,
 {
     int ret = 0;
     unsigned processed = 0;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BOUNCE(devs, num_devs * sizeof(*devs),
                              XC_HYPERCALL_BUFFER_BOUNCE_IN);
     DECLARE_HYPERCALL_BOUNCE(nodes, num_devs* sizeof(*nodes),
@@ -366,7 +366,7 @@ int xc_sched_id(xc_interface *xch,
                 int *sched_id)
 {
     int ret;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_sched_id;
 
@@ -451,7 +451,7 @@ out:
 
 int xc_perfc_reset(xc_interface *xch)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_perfc_op;
     sysctl.u.perfc_op.cmd = XEN_SYSCTL_PERFCOP_reset;
@@ -466,7 +466,7 @@ int xc_perfc_query_number(xc_interface *xch,
                           int *nbr_val)
 {
     int rc;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_perfc_op;
     sysctl.u.perfc_op.cmd = XEN_SYSCTL_PERFCOP_query;
@@ -487,7 +487,7 @@ int xc_perfc_query(xc_interface *xch,
                    struct xc_hypercall_buffer *desc,
                    struct xc_hypercall_buffer *val)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BUFFER_ARGUMENT(desc);
     DECLARE_HYPERCALL_BUFFER_ARGUMENT(val);
 
@@ -501,7 +501,7 @@ int xc_perfc_query(xc_interface *xch,
 
 int xc_lockprof_reset(xc_interface *xch)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_lockprof_op;
     sysctl.u.lockprof_op.cmd = XEN_SYSCTL_LOCKPROF_reset;
@@ -514,7 +514,7 @@ int xc_lockprof_query_number(xc_interface *xch,
                              uint32_t *n_elems)
 {
     int rc;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_lockprof_op;
     sysctl.u.lockprof_op.max_elem = 0;
@@ -534,7 +534,7 @@ int xc_lockprof_query(xc_interface *xch,
                       struct xc_hypercall_buffer *data)
 {
     int rc;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BUFFER_ARGUMENT(data);
 
     sysctl.cmd = XEN_SYSCTL_lockprof_op;
@@ -553,7 +553,7 @@ int xc_getcpuinfo(xc_interface *xch, int max_cpus,
                   xc_cpuinfo_t *info, int *nr_cpus)
 {
     int rc;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BOUNCE(info, max_cpus*sizeof(*info), XC_HYPERCALL_BUFFER_BOUNCE_OUT);
 
     if ( xc_hypercall_bounce_pre(xch, info) )
@@ -579,7 +579,7 @@ int xc_livepatch_upload(xc_interface *xch,
                         uint32_t size)
 {
     int rc;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BUFFER(char, local);
     DECLARE_HYPERCALL_BOUNCE(name, 0 /* later */, XC_HYPERCALL_BUFFER_BOUNCE_IN);
     struct xen_livepatch_name def_name = { };
@@ -632,7 +632,7 @@ int xc_livepatch_get(xc_interface *xch,
                      struct xen_livepatch_status *status)
 {
     int rc;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BOUNCE(name, 0 /*adjust later */, XC_HYPERCALL_BUFFER_BOUNCE_IN);
     struct xen_livepatch_name def_name = { };
 
@@ -689,7 +689,7 @@ int xc_livepatch_list_get_sizes(xc_interface *xch, unsigned int *nr,
                                 uint32_t *name_total_size,
                                 uint32_t *metadata_total_size)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     int rc;
 
     if ( !nr || !name_total_size || !metadata_total_size )
@@ -770,7 +770,7 @@ int xc_livepatch_list(xc_interface *xch, const unsigned int max,
                       unsigned int *done, unsigned int *left)
 {
     int rc;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     /* The sizes are adjusted later - hence zero. */
     DECLARE_HYPERCALL_BOUNCE(info, 0, XC_HYPERCALL_BUFFER_BOUNCE_OUT);
     DECLARE_HYPERCALL_BOUNCE(name, 0, XC_HYPERCALL_BUFFER_BOUNCE_OUT);
@@ -965,7 +965,7 @@ static int _xc_livepatch_action(xc_interface *xch,
                                 uint32_t flags)
 {
     int rc;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     /* The size is figured out when we strlen(name) */
     DECLARE_HYPERCALL_BOUNCE(name, 0, XC_HYPERCALL_BUFFER_BOUNCE_IN);
     struct xen_livepatch_name def_name = { };
diff --git a/tools/libs/ctrl/xc_monitor.c b/tools/libs/ctrl/xc_monitor.c
index 3cb96f444f..5e3a01c333 100644
--- a/tools/libs/ctrl/xc_monitor.c
+++ b/tools/libs/ctrl/xc_monitor.c
@@ -48,7 +48,7 @@ int xc_monitor_get_capabilities(xc_interface *xch, uint32_t domain_id,
                                 uint32_t *capabilities)
 {
     int rc;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     if ( !capabilities )
     {
@@ -72,7 +72,7 @@ int xc_monitor_write_ctrlreg(xc_interface *xch, uint32_t domain_id,
                              uint16_t index, bool enable, bool sync,
                              uint64_t bitmask, bool onchangeonly)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_monitor_op;
     domctl.domain = domain_id;
@@ -92,7 +92,7 @@ int xc_monitor_write_ctrlreg(xc_interface *xch, uint32_t domain_id,
 int xc_monitor_mov_to_msr(xc_interface *xch, uint32_t domain_id, uint32_t msr,
                           bool enable, bool onchangeonly)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_monitor_op;
     domctl.domain = domain_id;
@@ -108,7 +108,7 @@ int xc_monitor_mov_to_msr(xc_interface *xch, uint32_t domain_id, uint32_t msr,
 int xc_monitor_software_breakpoint(xc_interface *xch, uint32_t domain_id,
                                    bool enable)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_monitor_op;
     domctl.domain = domain_id;
@@ -122,7 +122,7 @@ int xc_monitor_software_breakpoint(xc_interface *xch, uint32_t domain_id,
 int xc_monitor_singlestep(xc_interface *xch, uint32_t domain_id,
                           bool enable)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_monitor_op;
     domctl.domain = domain_id;
@@ -136,7 +136,7 @@ int xc_monitor_singlestep(xc_interface *xch, uint32_t domain_id,
 int xc_monitor_descriptor_access(xc_interface *xch, uint32_t domain_id,
                                  bool enable)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_monitor_op;
     domctl.domain = domain_id;
@@ -150,7 +150,7 @@ int xc_monitor_descriptor_access(xc_interface *xch, uint32_t domain_id,
 int xc_monitor_guest_request(xc_interface *xch, uint32_t domain_id, bool enable,
                              bool sync, bool allow_userspace)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_monitor_op;
     domctl.domain = domain_id;
@@ -166,7 +166,7 @@ int xc_monitor_guest_request(xc_interface *xch, uint32_t domain_id, bool enable,
 int xc_monitor_inguest_pagefault(xc_interface *xch, uint32_t domain_id,
                                 bool disable)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_monitor_op;
     domctl.domain = domain_id;
@@ -180,7 +180,7 @@ int xc_monitor_inguest_pagefault(xc_interface *xch, uint32_t domain_id,
 int xc_monitor_emulate_each_rep(xc_interface *xch, uint32_t domain_id,
                                 bool enable)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_monitor_op;
     domctl.domain = domain_id;
@@ -193,7 +193,7 @@ int xc_monitor_emulate_each_rep(xc_interface *xch, uint32_t domain_id,
 int xc_monitor_debug_exceptions(xc_interface *xch, uint32_t domain_id,
                                 bool enable, bool sync)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_monitor_op;
     domctl.domain = domain_id;
@@ -207,7 +207,7 @@ int xc_monitor_debug_exceptions(xc_interface *xch, uint32_t domain_id,
 
 int xc_monitor_cpuid(xc_interface *xch, uint32_t domain_id, bool enable)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_monitor_op;
     domctl.domain = domain_id;
@@ -221,7 +221,7 @@ int xc_monitor_cpuid(xc_interface *xch, uint32_t domain_id, bool enable)
 int xc_monitor_privileged_call(xc_interface *xch, uint32_t domain_id,
                                bool enable)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_monitor_op;
     domctl.domain = domain_id;
@@ -235,7 +235,7 @@ int xc_monitor_privileged_call(xc_interface *xch, uint32_t domain_id,
 int xc_monitor_emul_unimplemented(xc_interface *xch, uint32_t domain_id,
                                   bool enable)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_monitor_op;
     domctl.domain = domain_id;
@@ -249,7 +249,7 @@ int xc_monitor_emul_unimplemented(xc_interface *xch, uint32_t domain_id,
 int xc_monitor_vmexit(xc_interface *xch, uint32_t domain_id, bool enable,
                       bool sync)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_monitor_op;
     domctl.domain = domain_id;
@@ -263,7 +263,7 @@ int xc_monitor_vmexit(xc_interface *xch, uint32_t domain_id, bool enable,
 
 int xc_monitor_io(xc_interface *xch, uint32_t domain_id, bool enable)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_monitor_op;
     domctl.domain = domain_id;
diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
index b20b675280..b27b45c3dc 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -28,7 +28,7 @@
  */
 int xc_pm_get_max_px(xc_interface *xch, int cpuid, int *max_px)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     int ret;
 
     sysctl.cmd = XEN_SYSCTL_get_pmstat;
@@ -44,7 +44,7 @@ int xc_pm_get_max_px(xc_interface *xch, int cpuid, int *max_px)
 
 int xc_pm_get_pxstat(xc_interface *xch, int cpuid, struct xc_px_stat *pxpt)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     /* Sizes unknown until xc_pm_get_max_px */
     DECLARE_NAMED_HYPERCALL_BOUNCE(trans, pxpt->trans_pt, 0, XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
     DECLARE_NAMED_HYPERCALL_BOUNCE(pt, pxpt->pt, 0, XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
@@ -99,7 +99,7 @@ int xc_pm_get_pxstat(xc_interface *xch, int cpuid, struct xc_px_stat *pxpt)
 
 int xc_pm_reset_pxstat(xc_interface *xch, int cpuid)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_get_pmstat;
     sysctl.u.get_pmstat.type = PMSTAT_reset_pxstat;
@@ -110,7 +110,7 @@ int xc_pm_reset_pxstat(xc_interface *xch, int cpuid)
 
 int xc_pm_get_max_cx(xc_interface *xch, int cpuid, int *max_cx)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     int ret = 0;
 
     sysctl.cmd = XEN_SYSCTL_get_pmstat;
@@ -125,7 +125,7 @@ int xc_pm_get_max_cx(xc_interface *xch, int cpuid, int *max_cx)
 
 int xc_pm_get_cxstat(xc_interface *xch, int cpuid, struct xc_cx_stat *cxpt)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_NAMED_HYPERCALL_BOUNCE(triggers, cxpt->triggers,
                                    cxpt->nr * sizeof(*cxpt->triggers),
                                    XC_HYPERCALL_BUFFER_BOUNCE_OUT);
@@ -183,7 +183,7 @@ unlock_0:
 
 int xc_pm_reset_cxstat(xc_interface *xch, int cpuid)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_get_pmstat;
     sysctl.u.get_pmstat.type = PMSTAT_reset_cxstat;
@@ -200,7 +200,7 @@ int xc_pm_reset_cxstat(xc_interface *xch, int cpuid)
 int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
                         struct xc_get_cpufreq_para *user_para)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     int ret = 0;
     struct xen_get_cpufreq_para *sys_para = &sysctl.u.pm_op.u.get_para;
     DECLARE_NAMED_HYPERCALL_BOUNCE(affected_cpus,
@@ -310,7 +310,7 @@ unlock_1:
 
 int xc_set_cpufreq_gov(xc_interface *xch, int cpuid, char *govname)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     char *scaling_governor = sysctl.u.pm_op.u.set_gov.scaling_governor;
 
     if ( !xch || !govname )
@@ -330,7 +330,7 @@ int xc_set_cpufreq_gov(xc_interface *xch, int cpuid, char *govname)
 int xc_set_cpufreq_para(xc_interface *xch, int cpuid, 
                         int ctrl_type, int ctrl_value)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     if ( !xch )
     {
@@ -349,7 +349,7 @@ int xc_set_cpufreq_para(xc_interface *xch, int cpuid,
 int xc_set_cpufreq_cppc(xc_interface *xch, int cpuid,
                         xc_set_cppc_para_t *set_cppc)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     int ret;
 
     if ( !xch )
@@ -372,7 +372,7 @@ int xc_set_cpufreq_cppc(xc_interface *xch, int cpuid,
 int xc_get_cpufreq_avgfreq(xc_interface *xch, int cpuid, int *avg_freq)
 {
     int ret = 0;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     if ( !xch || !avg_freq )
     {
@@ -395,7 +395,7 @@ int xc_get_cpufreq_avgfreq(xc_interface *xch, int cpuid, int *avg_freq)
 int xc_set_sched_opt_smt(xc_interface *xch, uint32_t value)
 {
    int rc;
-   DECLARE_SYSCTL;
+   struct xen_sysctl sysctl = {};
 
    sysctl.cmd = XEN_SYSCTL_pm_op;
    sysctl.u.pm_op.cmd = XEN_SYSCTL_pm_op_set_sched_opt_smt;
@@ -409,7 +409,7 @@ int xc_set_sched_opt_smt(xc_interface *xch, uint32_t value)
 static int get_max_cstate(xc_interface *xch, uint32_t *value, uint32_t type)
 {
     int rc;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     if ( !xch || !value )
     {
@@ -438,7 +438,7 @@ int xc_get_cpuidle_max_csubstate(xc_interface *xch, uint32_t *value)
 
 static int set_max_cstate(xc_interface *xch, uint32_t value, uint32_t type)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     if ( !xch )
     {
@@ -465,7 +465,7 @@ int xc_set_cpuidle_max_csubstate(xc_interface *xch, uint32_t value)
 
 int xc_enable_turbo(xc_interface *xch, int cpuid)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     if ( !xch )
     {
@@ -480,7 +480,7 @@ int xc_enable_turbo(xc_interface *xch, int cpuid)
 
 int xc_disable_turbo(xc_interface *xch, int cpuid)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     if ( !xch )
     {
diff --git a/tools/libs/ctrl/xc_private.c b/tools/libs/ctrl/xc_private.c
index 6293a45531..abd0b0d849 100644
--- a/tools/libs/ctrl/xc_private.c
+++ b/tools/libs/ctrl/xc_private.c
@@ -229,7 +229,7 @@ int xc_get_pfn_type_batch(xc_interface *xch, uint32_t dom,
                           unsigned int num, xen_pfn_t *arr)
 {
     int rc;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BOUNCE(arr, sizeof(*arr) * num, XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
     if ( xc_hypercall_bounce_pre(xch, arr) )
         return -1;
@@ -398,7 +398,7 @@ int xc_maximum_ram_page(xc_interface *xch, unsigned long *max_mfn)
 
 long long xc_domain_get_cpu_usage(xc_interface *xch, uint32_t domid, int vcpu)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_getvcpuinfo;
     domctl.domain = domid;
diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index 8faabaea67..d8b7da2805 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -62,12 +62,6 @@ struct iovec {
 #include <sys/uio.h>
 #endif
 
-#define DECLARE_DOMCTL struct xen_domctl domctl
-#define DECLARE_SYSCTL struct xen_sysctl sysctl
-#define DECLARE_PHYSDEV_OP struct physdev_op physdev_op
-#define DECLARE_FLASK_OP struct xen_flask_op op
-#define DECLARE_PLATFORM_OP struct xen_platform_op platform_op
-
 #undef PAGE_SHIFT
 #undef PAGE_SIZE
 #undef PAGE_MASK
diff --git a/tools/libs/ctrl/xc_psr.c b/tools/libs/ctrl/xc_psr.c
index 1a0ab636f0..477009ec12 100644
--- a/tools/libs/ctrl/xc_psr.c
+++ b/tools/libs/ctrl/xc_psr.c
@@ -29,7 +29,7 @@
 
 int xc_psr_cmt_attach(xc_interface *xch, uint32_t domid)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_psr_cmt_op;
     domctl.domain = domid;
@@ -40,7 +40,7 @@ int xc_psr_cmt_attach(xc_interface *xch, uint32_t domid)
 
 int xc_psr_cmt_detach(xc_interface *xch, uint32_t domid)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_psr_cmt_op;
     domctl.domain = domid;
@@ -53,7 +53,7 @@ int xc_psr_cmt_get_domain_rmid(xc_interface *xch, uint32_t domid,
                                uint32_t *rmid)
 {
     int rc;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_psr_cmt_op;
     domctl.domain = domid;
@@ -71,7 +71,7 @@ int xc_psr_cmt_get_total_rmid(xc_interface *xch, uint32_t *total_rmid)
 {
     static int val = 0;
     int rc;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     if ( val )
     {
@@ -95,7 +95,7 @@ int xc_psr_cmt_get_l3_upscaling_factor(xc_interface *xch,
 {
     static int val = 0;
     int rc;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     if ( val )
     {
@@ -118,7 +118,7 @@ int xc_psr_cmt_get_l3_upscaling_factor(xc_interface *xch,
 int xc_psr_cmt_get_l3_event_mask(xc_interface *xch, uint32_t *event_mask)
 {
     int rc;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_psr_cmt_op;
     sysctl.u.psr_cmt_op.cmd =
@@ -137,7 +137,7 @@ int xc_psr_cmt_get_l3_cache_size(xc_interface *xch, uint32_t cpu,
 {
     static int val = 0;
     int rc;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     if ( val )
     {
@@ -230,7 +230,7 @@ int xc_psr_cmt_enabled(xc_interface *xch)
 {
     static int val = -1;
     int rc;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     if ( val >= 0 )
         return val;
@@ -252,7 +252,7 @@ int xc_psr_set_domain_data(xc_interface *xch, uint32_t domid,
                            xc_psr_type type, uint32_t target,
                            uint64_t data)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     uint32_t cmd;
 
     switch ( type )
@@ -291,7 +291,7 @@ int xc_psr_get_domain_data(xc_interface *xch, uint32_t domid,
                            uint64_t *data)
 {
     int rc;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     uint32_t cmd;
 
     switch ( type )
@@ -333,7 +333,7 @@ int xc_psr_get_hw_info(xc_interface *xch, uint32_t socket,
                        xc_psr_feat_type type, xc_psr_hw_info *hw_info)
 {
     int rc = -1;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     if ( !hw_info )
     {
diff --git a/tools/libs/ctrl/xc_resource.c b/tools/libs/ctrl/xc_resource.c
index 3394cc1833..cb6a97202b 100644
--- a/tools/libs/ctrl/xc_resource.c
+++ b/tools/libs/ctrl/xc_resource.c
@@ -22,7 +22,7 @@
 static int xc_resource_op_one(xc_interface *xch, xc_resource_op_t *op)
 {
     int rc;
-    DECLARE_PLATFORM_OP;
+    struct xen_platform_op platform_op = {};
     DECLARE_NAMED_HYPERCALL_BOUNCE(entries, op->entries,
                                 op->nr_entries * sizeof(*op->entries),
                                 XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
diff --git a/tools/libs/ctrl/xc_rt.c b/tools/libs/ctrl/xc_rt.c
index ad257c6e52..3cb3fbb923 100644
--- a/tools/libs/ctrl/xc_rt.c
+++ b/tools/libs/ctrl/xc_rt.c
@@ -29,7 +29,7 @@ int xc_sched_rtds_domain_set(xc_interface *xch,
                            struct xen_domctl_sched_rtds *sdom)
 {
     int rc;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_scheduler_op;
     domctl.domain = domid;
@@ -48,7 +48,7 @@ int xc_sched_rtds_domain_get(xc_interface *xch,
                            struct xen_domctl_sched_rtds *sdom)
 {
     int rc;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_scheduler_op;
     domctl.domain = domid;
@@ -70,7 +70,7 @@ int xc_sched_rtds_vcpu_set(xc_interface *xch,
 {
     int rc = 0;
     unsigned processed = 0;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BOUNCE(vcpus, sizeof(*vcpus) * num_vcpus,
                              XC_HYPERCALL_BUFFER_BOUNCE_IN);
 
@@ -104,7 +104,7 @@ int xc_sched_rtds_vcpu_get(xc_interface *xch,
 {
     int rc = 0;
     unsigned processed = 0;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BOUNCE(vcpus, sizeof(*vcpus) * num_vcpus,
                              XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
 
diff --git a/tools/libs/ctrl/xc_tbuf.c b/tools/libs/ctrl/xc_tbuf.c
index 283fbd1c8f..73b0d1e323 100644
--- a/tools/libs/ctrl/xc_tbuf.c
+++ b/tools/libs/ctrl/xc_tbuf.c
@@ -27,7 +27,7 @@
 
 static int tbuf_enable(xc_interface *xch, int enable)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_tbuf_op;
     sysctl.interface_version = XEN_SYSCTL_INTERFACE_VERSION;
@@ -41,7 +41,7 @@ static int tbuf_enable(xc_interface *xch, int enable)
 
 int xc_tbuf_set_size(xc_interface *xch, unsigned long size)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_tbuf_op;
     sysctl.interface_version = XEN_SYSCTL_INTERFACE_VERSION;
@@ -55,7 +55,7 @@ int xc_tbuf_get_size(xc_interface *xch, unsigned long *size)
 {
     struct t_info *t_info;
     int rc;
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_tbuf_op;
     sysctl.interface_version = XEN_SYSCTL_INTERFACE_VERSION;
@@ -82,7 +82,7 @@ int xc_tbuf_get_size(xc_interface *xch, unsigned long *size)
 int xc_tbuf_enable(xc_interface *xch, unsigned long pages, unsigned long *mfn,
                    unsigned long *size)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     int rc;
 
     /*
@@ -116,7 +116,7 @@ int xc_tbuf_disable(xc_interface *xch)
 
 int xc_tbuf_set_cpu_mask(xc_interface *xch, xc_cpumap_t mask)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BOUNCE(mask, 0, XC_HYPERCALL_BUFFER_BOUNCE_IN);
     int ret = -1;
     int bits, cpusize;
@@ -160,7 +160,7 @@ int xc_tbuf_set_cpu_mask(xc_interface *xch, xc_cpumap_t mask)
 
 int xc_tbuf_set_evt_mask(xc_interface *xch, uint32_t mask)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
 
     sysctl.cmd = XEN_SYSCTL_tbuf_op;
     sysctl.interface_version = XEN_SYSCTL_INTERFACE_VERSION;
diff --git a/tools/libs/ctrl/xc_vm_event.c b/tools/libs/ctrl/xc_vm_event.c
index a97c615b18..2f03315648 100644
--- a/tools/libs/ctrl/xc_vm_event.c
+++ b/tools/libs/ctrl/xc_vm_event.c
@@ -25,7 +25,7 @@
 int xc_vm_event_control(xc_interface *xch, uint32_t domain_id, unsigned int op,
                         unsigned int mode, uint32_t *port)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     int rc;
 
     domctl.cmd = XEN_DOMCTL_vm_event_op;
@@ -158,7 +158,7 @@ void *xc_vm_event_enable(xc_interface *xch, uint32_t domain_id, int param,
 
 int xc_vm_event_get_version(xc_interface *xch)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     int rc;
 
     domctl.cmd = XEN_DOMCTL_vm_event_op;
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index f2b1e80901..4497087daa 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -38,7 +38,7 @@ enum {
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     int ret;
 
     sysctl.cmd = XEN_SYSCTL_get_cpu_levelling_caps;
@@ -53,7 +53,7 @@ int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps)
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BOUNCE(featureset,
                              *nr_features * sizeof(*featureset),
                              XC_HYPERCALL_BUFFER_BOUNCE_OUT);
@@ -167,7 +167,7 @@ static int get_domain_cpu_policy(xc_interface *xch, uint32_t domid,
                                  uint32_t *nr_leaves, xen_cpuid_leaf_t *leaves,
                                  uint32_t *nr_msrs, xen_msr_entry_t *msrs)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BOUNCE(leaves,
                              *nr_leaves * sizeof(*leaves),
                              XC_HYPERCALL_BUFFER_BOUNCE_OUT);
@@ -207,7 +207,7 @@ int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
                              uint32_t *err_leaf_p, uint32_t *err_subleaf_p,
                              uint32_t *err_msr_p)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BOUNCE(leaves,
                              nr_leaves * sizeof(*leaves),
                              XC_HYPERCALL_BUFFER_BOUNCE_IN);
diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
index d616dccbd6..2fd8ee7ad4 100644
--- a/tools/libs/guest/xg_dom_arm.c
+++ b/tools/libs/guest/xg_dom_arm.c
@@ -204,7 +204,7 @@ static int set_mode(xc_interface *xch, uint32_t domid, const char *guest_type)
         { "xen-3.0-aarch64", 64 },
         { "xen-3.0-armv7l",  32 },
     };
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     int i,rc;
 
     domctl.domain = domid;
diff --git a/tools/libs/guest/xg_dom_boot.c b/tools/libs/guest/xg_dom_boot.c
index 6e0847e718..5c7e12221d 100644
--- a/tools/libs/guest/xg_dom_boot.c
+++ b/tools/libs/guest/xg_dom_boot.c
@@ -39,7 +39,7 @@
 
 static int setup_hypercall_page(struct xc_dom_image *dom)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     xen_pfn_t pfn;
     int rc;
 
diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index 811d176488..cba01384ae 100644
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -1158,7 +1158,7 @@ static int x86_compat(xc_interface *xch, uint32_t domid,
         { "xen-3.0-x86_32p", 32 },
         { "xen-3.0-x86_64",  64 },
     };
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     int i,rc;
 
     memset(&domctl, 0, sizeof(domctl));
diff --git a/tools/libs/guest/xg_offline_page.c b/tools/libs/guest/xg_offline_page.c
index 5f61d49456..ffd0e6975e 100644
--- a/tools/libs/guest/xg_offline_page.c
+++ b/tools/libs/guest/xg_offline_page.c
@@ -51,7 +51,7 @@ static struct domain_info_context *dinfo = &_dinfo;
 int xc_mark_page_online(xc_interface *xch, unsigned long start,
                         unsigned long end, uint32_t *status)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BOUNCE(status, sizeof(uint32_t)*(end - start + 1), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
     int ret = -1;
 
@@ -81,7 +81,7 @@ int xc_mark_page_online(xc_interface *xch, unsigned long start,
 int xc_mark_page_offline(xc_interface *xch, unsigned long start,
                           unsigned long end, uint32_t *status)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BOUNCE(status, sizeof(uint32_t)*(end - start + 1), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
     int ret = -1;
 
@@ -111,7 +111,7 @@ int xc_mark_page_offline(xc_interface *xch, unsigned long start,
 int xc_query_page_offline_status(xc_interface *xch, unsigned long start,
                                  unsigned long end, uint32_t *status)
 {
-    DECLARE_SYSCTL;
+    struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BOUNCE(status, sizeof(uint32_t)*(end - start + 1), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
     int ret = -1;
 
diff --git a/tools/libs/guest/xg_resume.c b/tools/libs/guest/xg_resume.c
index c85d09a7f5..31c49d320e 100644
--- a/tools/libs/guest/xg_resume.c
+++ b/tools/libs/guest/xg_resume.c
@@ -93,7 +93,7 @@ static int modify_returncode(xc_interface *xch, uint32_t domid)
 
 static int xc_domain_resume_cooperative(xc_interface *xch, uint32_t domid)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     int rc;
 
     /*
@@ -111,7 +111,7 @@ static int xc_domain_resume_cooperative(xc_interface *xch, uint32_t domid)
 #if defined(__i386__) || defined(__x86_64__)
 static int xc_domain_resume_hvm(xc_interface *xch, uint32_t domid)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     /*
      * The domctl XEN_DOMCTL_resumedomain unpause each vcpu. After
@@ -132,7 +132,7 @@ static int xc_domain_resume_hvm(xc_interface *xch, uint32_t domid)
 
 static int xc_domain_resume_any(xc_interface *xch, uint32_t domid)
 {
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     xc_domaininfo_t info;
     int i, rc = -1;
 #if defined(__i386__) || defined(__x86_64__)
diff --git a/tools/libs/guest/xg_sr_restore_x86_pv.c b/tools/libs/guest/xg_sr_restore_x86_pv.c
index eaeb97f4a0..9cd6a88022 100644
--- a/tools/libs/guest/xg_sr_restore_x86_pv.c
+++ b/tools/libs/guest/xg_sr_restore_x86_pv.c
@@ -376,7 +376,7 @@ static int process_vcpu_extended(struct xc_sr_context *ctx,
     xc_interface *xch = ctx->xch;
     struct xc_sr_x86_pv_restore_vcpu *vcpu =
         &ctx->x86.pv.restore.vcpus[vcpuid];
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
 
     domctl.cmd = XEN_DOMCTL_set_ext_vcpucontext;
     domctl.domain = ctx->domid;
@@ -401,7 +401,7 @@ static int process_vcpu_xsave(struct xc_sr_context *ctx,
     struct xc_sr_x86_pv_restore_vcpu *vcpu =
         &ctx->x86.pv.restore.vcpus[vcpuid];
     int rc;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BUFFER(void, buffer);
 
     buffer = xc_hypercall_buffer_alloc(xch, buffer, vcpu->xsave.size);
@@ -439,7 +439,7 @@ static int process_vcpu_msrs(struct xc_sr_context *ctx,
     struct xc_sr_x86_pv_restore_vcpu *vcpu =
         &ctx->x86.pv.restore.vcpus[vcpuid];
     int rc;
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BUFFER(void, buffer);
 
     buffer = xc_hypercall_buffer_alloc(xch, buffer, vcpu->msr.size);
-- 
2.34.1


