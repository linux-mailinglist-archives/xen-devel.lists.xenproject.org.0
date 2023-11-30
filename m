Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C0A7FF256
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:39:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644742.1006241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iC4-0002Yu-If; Thu, 30 Nov 2023 14:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644742.1006241; Thu, 30 Nov 2023 14:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iC4-0002Sh-D6; Thu, 30 Nov 2023 14:39:08 +0000
Received: by outflank-mailman (input) for mailman id 644742;
 Thu, 30 Nov 2023 14:30:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i48-0004Xw-Ev
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:30:56 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10b8fafd-8f8d-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 15:30:54 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:30:52 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:30:42 -0800
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
X-Inumbo-ID: 10b8fafd-8f8d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354654; x=1732890654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LfXluGcV2XSbwSzs1A7j8csA0H78Hr7rImWxVfjhw/E=;
  b=V6UG72gsbeGYESC94oLSnMkVPRcFWSBkNUTMWl8YiamJ0Eq94IdgTOM3
   UDr9QsLyRzHbbvwe0bwcorUsJGsh6HKiYt26dpL3ufjfZlX+IlQgFJe4J
   z2c+Ssl66EGv6eqMoLO48uafxSABwwt3iMG6uh9V4yINF05ob9aiMWwP2
   uuQHU5ekK8aCw5uyTCrYVIRskRp7siWXhYKWyDatMXliKKZObrcyvoyi6
   EgdvGrU3cwEgVVfAI9JF1JdNP5LiV1ZkA1InGgNtb58cCqgMrzdHN0bm1
   qvGpAQtTPz31naWKuW0ERZvlcrlV37lQgps5YFCf9tE6fgk087yu383f2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479530883"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479530883"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729606"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729606"
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
Subject: [RFC 02/41] qdev: Allow qdev_device_add() to add specific category device
Date: Thu, 30 Nov 2023 22:41:24 +0800
Message-Id: <20231130144203.2307629-3-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

Topology devices need to be created and realized before board
initialization.

Allow qdev_device_add() to specify category to help create topology
devices early.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/net/virtio-net.c    |  2 +-
 hw/usb/xen-usb.c       |  3 ++-
 include/monitor/qdev.h |  4 ++--
 system/qdev-monitor.c  | 12 ++++++++----
 system/vl.c            |  4 ++--
 5 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 80c56f0cfcf1..fc225049ee30 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -965,7 +965,7 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
         return;
     }
 
-    dev = qdev_device_add_from_qdict(n->primary_opts,
+    dev = qdev_device_add_from_qdict(n->primary_opts, NULL,
                                      n->primary_opts_from_json,
                                      &err);
     if (err) {
diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
index 09ec326aeae5..bc00d47ff021 100644
--- a/hw/usb/xen-usb.c
+++ b/hw/usb/xen-usb.c
@@ -766,7 +766,8 @@ static void usbback_portid_add(struct usbback_info *usbif, unsigned port,
     qdict_put_str(qdict, "hostport", portname);
     opts = qemu_opts_from_qdict(qemu_find_opts("device"), qdict,
                                 &error_abort);
-    usbif->ports[port - 1].dev = USB_DEVICE(qdev_device_add(opts, &local_err));
+    usbif->ports[port - 1].dev = USB_DEVICE(
+                                     qdev_device_add(opts, NULL, &local_err));
     if (!usbif->ports[port - 1].dev) {
         qobject_unref(qdict);
         xen_pv_printf(&usbif->xendev, 0,
diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
index 1d57bf657794..f5fd6e6c1ffc 100644
--- a/include/monitor/qdev.h
+++ b/include/monitor/qdev.h
@@ -8,8 +8,8 @@ void hmp_info_qdm(Monitor *mon, const QDict *qdict);
 void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp);
 
 int qdev_device_help(QemuOpts *opts);
-DeviceState *qdev_device_add(QemuOpts *opts, Error **errp);
-DeviceState *qdev_device_add_from_qdict(const QDict *opts,
+DeviceState *qdev_device_add(QemuOpts *opts, long *category, Error **errp);
+DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
                                         bool from_json, Error **errp);
 
 /**
diff --git a/system/qdev-monitor.c b/system/qdev-monitor.c
index 0f163b2d0310..7ee33a50142a 100644
--- a/system/qdev-monitor.c
+++ b/system/qdev-monitor.c
@@ -617,7 +617,7 @@ const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
     return prop->name;
 }
 
-DeviceState *qdev_device_add_from_qdict(const QDict *opts,
+DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
                                         bool from_json, Error **errp)
 {
     ERRP_GUARD();
@@ -639,6 +639,10 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
         return NULL;
     }
 
+    if (category && !test_bit(*category, dc->categories)) {
+        return NULL;
+    }
+
     /* find bus */
     path = qdict_get_try_str(opts, "bus");
     if (path != NULL) {
@@ -731,12 +735,12 @@ err_del_dev:
 }
 
 /* Takes ownership of @opts on success */
-DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
+DeviceState *qdev_device_add(QemuOpts *opts, long *category, Error **errp)
 {
     QDict *qdict = qemu_opts_to_qdict(opts, NULL);
     DeviceState *ret;
 
-    ret = qdev_device_add_from_qdict(qdict, false, errp);
+    ret = qdev_device_add_from_qdict(qdict, category, false, errp);
     if (ret) {
         qemu_opts_del(opts);
     }
@@ -858,7 +862,7 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
         qemu_opts_del(opts);
         return;
     }
-    dev = qdev_device_add(opts, errp);
+    dev = qdev_device_add(opts, NULL, errp);
 
     /*
      * Drain all pending RCU callbacks. This is done because
diff --git a/system/vl.c b/system/vl.c
index 2bcd9efb9a64..0be155b530b4 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1198,7 +1198,7 @@ static int device_init_func(void *opaque, QemuOpts *opts, Error **errp)
 {
     DeviceState *dev;
 
-    dev = qdev_device_add(opts, errp);
+    dev = qdev_device_add(opts, NULL, errp);
     if (!dev && *errp) {
         error_report_err(*errp);
         return -1;
@@ -2646,7 +2646,7 @@ static void qemu_create_cli_devices(void)
          * from the start, so call qdev_device_add_from_qdict() directly for
          * now.
          */
-        dev = qdev_device_add_from_qdict(opt->opts, true, &error_fatal);
+        dev = qdev_device_add_from_qdict(opt->opts, NULL, true, &error_fatal);
         object_unref(OBJECT(dev));
         loc_pop(&opt->loc);
     }
-- 
2.34.1


