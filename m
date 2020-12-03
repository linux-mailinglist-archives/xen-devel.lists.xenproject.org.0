Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6255A2CD5AB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 13:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43406.78026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kknvz-0005wT-AR; Thu, 03 Dec 2020 12:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43406.78026; Thu, 03 Dec 2020 12:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kknvz-0005w6-53; Thu, 03 Dec 2020 12:42:07 +0000
Received: by outflank-mailman (input) for mailman id 43406;
 Thu, 03 Dec 2020 12:42:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kknvx-0005v7-G6
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 12:42:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kknvv-00045z-VV; Thu, 03 Dec 2020 12:42:03 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kknvv-00015A-Lq; Thu, 03 Dec 2020 12:42:03 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=TkS/3Nu1RBKiO2GK1mYbF+lmLCDon9ThVaW6ItHos8g=; b=0ZcGMieUH5oylchv/0Q1N6RoT+
	chFubiScjuIJhbbcCo/zH4WpyG1MAPRGvKytPqFMxAXYDiWVI2owoeHrLy6Zhe3NHUwrK1ksDqxOq
	ZJmyj7jwwqXjFT+MuYmyk72O9yZCWarv59e4IUXr7esdcEvqK3FWX2feEPvKmI6nO4HA=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Eslam Elnikety <elnikety@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 1/4] domctl: introduce a new domain create flag, XEN_DOMCTL_CDF_evtchn_fifo, ...
Date: Thu,  3 Dec 2020 12:41:56 +0000
Message-Id: <20201203124159.3688-2-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203124159.3688-1-paul@xen.org>
References: <20201203124159.3688-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

...to control the visibility of the FIFO event channel operations
(EVTCHNOP_init_control, EVTCHNOP_expand_array, and EVTCHNOP_set_priority) to
the guest.

These operations were added to the public header in commit d2d50c2f308f
("evtchn: add FIFO-based event channel ABI") and the first implementation
appeared in the two subsequent commits: edc8872aeb4a ("evtchn: implement
EVTCHNOP_set_priority and add the set_priority hook") and 88910061ec61
("evtchn: add FIFO-based event channel hypercalls and port ops"). Prior to
that, a guest issuing those operations would receive a return value of
-ENOSYS (not implemented) from Xen. Guests aware of the FIFO operations but
running on an older (pre-4.4) Xen would fall back to using the 2-level event
channel interface upon seeing this return value.

Unfortunately the uncontrolable appearance of these new operations in Xen 4.4
onwards has implications for hibernation of some Linux guests. During resume
from hibernation, there are two kernels involved: the "boot" kernel and the
"resume" kernel. The guest boot kernel may default to use FIFO operations and
instruct Xen via EVTCHNOP_init_control to switch from 2-level to FIFO. On the
other hand, the resume kernel keeps assuming 2-level, because it was hibernated
on a version of Xen that did not support the FIFO operations.

To maintain compatibility it is necessary to make Xen behave as it did
before the new operations were added and hence the code in this patch ensures
that, if XEN_DOMCTL_CDF_evtchn_fifo is not set, the FIFO event channel
operations will again result in -ENOSYS being returned to the guest.

This patch also adds an extra log line into the 'e' key handler output to
call out which event channel ABI is in use by a domain.

NOTE: To maintain current behavior, until a tool-stack option is added to
      control the flag, it is unconditionally set for all domains. A
      subsequent patch will introduce such tool-stack control.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Signed-off-by: Eslam Elnikety <elnikety@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Christian Lindig <christian.lindig@citrix.com>
Cc: David Scott <dave@recoil.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>

v5:
 - Flip the sense of the flag from disabling to enabling, as requested by
   Andrew

v4:
 - New in v4
---
 tools/libs/light/libxl_create.c |  1 +
 tools/ocaml/libs/xc/xenctrl.ml  |  1 +
 tools/ocaml/libs/xc/xenctrl.mli |  1 +
 xen/arch/arm/domain.c           |  3 ++-
 xen/arch/arm/domain_build.c     |  3 ++-
 xen/arch/arm/setup.c            |  3 ++-
 xen/arch/x86/setup.c            |  3 ++-
 xen/common/domain.c             |  2 +-
 xen/common/event_channel.c      | 24 +++++++++++++++++++++---
 xen/include/public/domctl.h     |  4 +++-
 10 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 321a13e519b5..3ca9f00d6d83 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -607,6 +607,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_evtchn_port = b_info->event_channels,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
+            .flags = XEN_DOMCTL_CDF_evtchn_fifo,
         };
 
         if (info->type != LIBXL_DOMAIN_TYPE_PV) {
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index e878699b0a1a..fa5c7b7eb0a2 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -65,6 +65,7 @@ type domain_create_flag =
 	| CDF_XS_DOMAIN
 	| CDF_IOMMU
 	| CDF_NESTED_VIRT
+	| CDF_EVTCHN_FIFO
 
 type domain_create_iommu_opts =
 	| IOMMU_NO_SHAREPT
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index e64907df8e7e..a872002d90cc 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -58,6 +58,7 @@ type domain_create_flag =
   | CDF_XS_DOMAIN
   | CDF_IOMMU
   | CDF_NESTED_VIRT
+  | CDF_EVTCHN_FIFO
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 18cafcdda7b1..59f947370053 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -622,7 +622,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     unsigned int max_vcpus;
 
     /* HVM and HAP must be set. IOMMU may or may not be */
-    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu) !=
+    if ( (config->flags &
+          ~(XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_evtchn_fifo) !=
          (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )
     {
         dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index e824ba34b012..13d1e79f1463 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2478,7 +2478,8 @@ void __init create_domUs(void)
         struct domain *d;
         struct xen_domctl_createdomain d_cfg = {
             .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
-            .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+            .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
+                     XEN_DOMCTL_CDF_evtchn_fifo,
             .max_evtchn_port = -1,
             .max_grant_frames = 64,
             .max_maptrack_frames = 1024,
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 7fcff9af2a7e..0267acfca16e 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -805,7 +805,8 @@ void __init start_xen(unsigned long boot_phys_offset,
     struct bootmodule *xen_bootmodule;
     struct domain *dom0;
     struct xen_domctl_createdomain dom0_cfg = {
-        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
+                 XEN_DOMCTL_CDF_evtchn_fifo,
         .max_evtchn_port = -1,
         .max_grant_frames = gnttab_dom0_frames(),
         .max_maptrack_frames = -1,
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 30d6f375a3af..e558241c73da 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -738,7 +738,8 @@ static struct domain *__init create_dom0(const module_t *image,
                                          const char *loader)
 {
     struct xen_domctl_createdomain dom0_cfg = {
-        .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
+        .flags = XEN_DOMCTL_CDF_evtchn_fifo |
+                 (IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0),
         .max_evtchn_port = -1,
         .max_grant_frames = -1,
         .max_maptrack_frames = -1,
diff --git a/xen/common/domain.c b/xen/common/domain.c
index f748806a450b..28592c7c8486 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -307,7 +307,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
-           XEN_DOMCTL_CDF_nested_virt) )
+           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_evtchn_fifo) )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index dbfba62a4934..91133bf3c263 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1188,10 +1188,27 @@ static long evtchn_set_priority(const struct evtchn_set_priority *set_priority)
     return ret;
 }
 
+static bool is_fifo_op(int cmd)
+{
+    switch ( cmd )
+    {
+    case EVTCHNOP_init_control:
+    case EVTCHNOP_expand_array:
+    case EVTCHNOP_set_priority:
+        return true;
+    default:
+        return false;
+    }
+}
+
 long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc;
 
+    if ( !(current->domain->options & XEN_DOMCTL_CDF_evtchn_fifo) &&
+         is_fifo_op(cmd) )
+        return -ENOSYS;
+
     switch ( cmd )
     {
     case EVTCHNOP_alloc_unbound: {
@@ -1568,9 +1585,10 @@ static void domain_dump_evtchn_info(struct domain *d)
     unsigned int port;
     int irq;
 
-    printk("Event channel information for domain %d:\n"
-           "Polling vCPUs: {%*pbl}\n"
-           "    port [p/m/s]\n", d->domain_id, d->max_vcpus, d->poll_mask);
+    printk("Event channel information for %pd:\n", d);
+    printk("ABI: %s\n", d->evtchn_fifo ? "FIFO" : "2-level");
+    printk("Polling vCPUs: {%*pbl}\n"
+           "    port [p/m/s]\n", d->max_vcpus, d->poll_mask);
 
     spin_lock(&d->event_lock);
 
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 666aeb71bf1b..f7149c81a7c2 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -70,9 +70,11 @@ struct xen_domctl_createdomain {
 #define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
 #define _XEN_DOMCTL_CDF_nested_virt   6
 #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
+#define _XEN_DOMCTL_CDF_evtchn_fifo   7
+#define XEN_DOMCTL_CDF_evtchn_fifo    (1U << _XEN_DOMCTL_CDF_evtchn_fifo)
 
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
-#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_nested_virt
+#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_evtchn_fifo
 
     uint32_t flags;
 
-- 
2.20.1


