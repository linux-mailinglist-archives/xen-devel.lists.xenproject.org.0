Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75AA7FF2B4
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:43:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644906.1006611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iFh-0008Bo-6Q; Thu, 30 Nov 2023 14:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644906.1006611; Thu, 30 Nov 2023 14:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iFh-00088m-33; Thu, 30 Nov 2023 14:42:53 +0000
Received: by outflank-mailman (input) for mailman id 644906;
 Thu, 30 Nov 2023 14:42:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i51-0004Xw-Cg
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:31:51 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3239d44c-8f8d-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 15:31:49 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:31:20 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:31:10 -0800
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
X-Inumbo-ID: 3239d44c-8f8d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354709; x=1732890709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FvkKzJCE6FUWENQ9f97m08P62P/QoMoZpAQ1rnP03oI=;
  b=UrcGRvFnCAnzdiNOM4AYpNGm+Ui5Ukg46b9RnRhw7MtlrcKLxFtdklZc
   0ThvUH9qT7RHY1teggUxrhswQ7kv0XIrE/k7xZnReSyYPcqu1iaapInBe
   o7DFrWV4L9rqDOuSax5dDX3bWJCdbUBeZ0QMEYZ99GWfKwG+NHmntoNMq
   CDrDZQnrudMWwDp//KrBQhTCnPl52Kk84WB5UflLFSq9nUlLYUZ/ktE1s
   2zng7EqBIiMSTEMhoaaM2WwxWfdMiivvxEXaEjHvDt9egh8lb1d3Uxyzk
   MoTKkkPmgldXgcJzOteGBwCk8c6i6Ybgw35NmW/2efLSV4Xb+tnm5aDrx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531147"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479531147"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729654"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729654"
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
Subject: [RFC 05/41] qdev: Set device parent and id after setting properties
Date: Thu, 30 Nov 2023 22:41:27 +0800
Message-Id: <20231130144203.2307629-6-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

The properties setting does not conflict with the creation of child<>
property.

Pre-setting the device's properties can help the device's parent
selection. Some topology devices (e.g., CPUs that support hotplug)
usually define topology sub indexes as properties, and the selection of
their parent needs to be based on these proteries.

Move qdev_set_id() after properties setting to help the next user-child
introduction.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 system/qdev-monitor.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/system/qdev-monitor.c b/system/qdev-monitor.c
index 7ee33a50142a..107411bb50cc 100644
--- a/system/qdev-monitor.c
+++ b/system/qdev-monitor.c
@@ -700,14 +700,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
         }
     }
 
-    /*
-     * set dev's parent and register its id.
-     * If it fails it means the id is already taken.
-     */
     id = g_strdup(qdict_get_try_str(opts, "id"));
-    if (!qdev_set_id(dev, id, errp)) {
-        goto err_del_dev;
-    }
 
     /* set properties */
     dev->opts = qdict_clone_shallow(opts);
@@ -721,6 +714,14 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
         goto err_del_dev;
     }
 
+    /*
+     * set dev's parent and register its id.
+     * If it fails it means the id is already taken.
+     */
+    if (!qdev_set_id(dev, id, errp)) {
+        goto err_del_dev;
+    }
+
     if (!qdev_realize(dev, bus, errp)) {
         goto err_del_dev;
     }
-- 
2.34.1


