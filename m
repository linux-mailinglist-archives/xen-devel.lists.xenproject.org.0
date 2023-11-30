Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA5B7FF288
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:40:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644831.1006553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCt-0006MK-EC; Thu, 30 Nov 2023 14:39:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644831.1006553; Thu, 30 Nov 2023 14:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCs-00060a-8D; Thu, 30 Nov 2023 14:39:58 +0000
Received: by outflank-mailman (input) for mailman id 644831;
 Thu, 30 Nov 2023 14:37:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i4k-0004Xw-Ql
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:31:34 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27aa5209-8f8d-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 15:31:32 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:31:01 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:30:52 -0800
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
X-Inumbo-ID: 27aa5209-8f8d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354693; x=1732890693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=50lNzU4oWEfgKNc9gIKf0MEOC0NyWyVi0AxeNokOwXU=;
  b=epqoRAPAS/YlNO/PAcLcqAiqY1fh7I1c0c3+oAeflmd8i8EYeX1ALeBI
   1TMdzOBvGKNadyzHTg/3aonx1OPYT2xWNvDsEzCzQjjdAy6GiPwH4glZ8
   byNSkgc3emlRnSvymHo4cAjTTOWuEm7BpnNUPjxNRxv/tLasRJh7fTquD
   8lMwnIl3KErl5v7RqhHGmLJNWy0RDQmARN6Qjo9d1ETU70gwOp//eEG89
   4vl1PoQZjlwSdSADoqry7toWuGmOdeS7gXL/ne51+zxYiawErRbyUFuj0
   bzxkUz3GomiL99X0IxlH7VPe6hQepu5qy6HlnjurelZ0NIy8bgqD6zBPb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479530949"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479530949"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729615"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729615"
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bin Meng <bin.meng@windriver.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Zhiyuan Lv <zhiyuan.lv@intel.com>,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 03/41] system: Create base category devices from cli before board initialization
Date: Thu, 30 Nov 2023 22:41:25 +0800
Message-Id: <20231130144203.2307629-4-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

Topology devices are required to complete CPU topology building before
*_init_cpus() in MachineClass.init().

Add a qemu_create_cli_base_devices() before board initialization to
help create and realize topology devices from cli early.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 system/vl.c | 51 ++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/system/vl.c b/system/vl.c
index 0be155b530b4..65add2fb2460 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1197,8 +1197,9 @@ static int device_help_func(void *opaque, QemuOpts *opts, Error **errp)
 static int device_init_func(void *opaque, QemuOpts *opts, Error **errp)
 {
     DeviceState *dev;
+    long *category = opaque;
 
-    dev = qdev_device_add(opts, NULL, errp);
+    dev = qdev_device_add(opts, category, errp);
     if (!dev && *errp) {
         error_report_err(*errp);
         return -1;
@@ -2617,25 +2618,13 @@ static void qemu_init_board(void)
     realtime_init();
 }
 
-static void qemu_create_cli_devices(void)
+static void qemu_create_cli_devices(long *category)
 {
     DeviceOption *opt;
 
-    soundhw_init();
-
-    qemu_opts_foreach(qemu_find_opts("fw_cfg"),
-                      parse_fw_cfg, fw_cfg_find(), &error_fatal);
-
-    /* init USB devices */
-    if (machine_usb(current_machine)) {
-        if (foreach_device_config(DEV_USB, usb_parse) < 0)
-            exit(1);
-    }
-
-    /* init generic devices */
     rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
     qemu_opts_foreach(qemu_find_opts("device"),
-                      device_init_func, NULL, &error_fatal);
+                      device_init_func, category, &error_fatal);
     QTAILQ_FOREACH(opt, &device_opts, next) {
         DeviceState *dev;
         loc_push_restore(&opt->loc);
@@ -2646,13 +2635,40 @@ static void qemu_create_cli_devices(void)
          * from the start, so call qdev_device_add_from_qdict() directly for
          * now.
          */
-        dev = qdev_device_add_from_qdict(opt->opts, NULL, true, &error_fatal);
+        dev = qdev_device_add_from_qdict(opt->opts, category,
+                                         true, &error_fatal);
         object_unref(OBJECT(dev));
         loc_pop(&opt->loc);
     }
     rom_reset_order_override();
 }
 
+static void qemu_create_cli_base_devices(void)
+{
+    long category = DEVICE_CATEGORY_CPU_DEF;
+
+    qemu_opts_foreach(qemu_find_opts("fw_cfg"),
+                      parse_fw_cfg, fw_cfg_find(), &error_fatal);
+
+    /* init CPU topology devices which don't support hotplug. */
+    qemu_create_cli_devices(&category);
+}
+
+static void qemu_create_cli_periphery_devices(void)
+{
+    soundhw_init();
+
+    /* init USB devices */
+    if (machine_usb(current_machine)) {
+        if (foreach_device_config(DEV_USB, usb_parse) < 0) {
+            exit(1);
+        }
+    }
+
+    /* init generic devices */
+    qemu_create_cli_devices(NULL);
+}
+
 static void qemu_machine_creation_done(void)
 {
     MachineState *machine = MACHINE(qdev_get_machine());
@@ -2701,8 +2717,9 @@ void qmp_x_exit_preconfig(Error **errp)
         return;
     }
 
+    qemu_create_cli_base_devices();
     qemu_init_board();
-    qemu_create_cli_devices();
+    qemu_create_cli_periphery_devices();
     qemu_machine_creation_done();
 
     if (loadvm) {
-- 
2.34.1


