Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 137E07FF269
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:39:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644785.1006361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCF-0005ix-O2; Thu, 30 Nov 2023 14:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644785.1006361; Thu, 30 Nov 2023 14:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCE-0005Xd-Nw; Thu, 30 Nov 2023 14:39:18 +0000
Received: by outflank-mailman (input) for mailman id 644785;
 Thu, 30 Nov 2023 14:33:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i6r-0008E0-71
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:33:45 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75d38361-8f8d-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 15:33:44 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:33:41 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:33:32 -0800
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
X-Inumbo-ID: 75d38361-8f8d-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354824; x=1732890824;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tVF0CmmcOBEuYyYp6LOjwJOc13qp/jolnKC9SQQ9zpo=;
  b=f64LBCQHUvmpnb4ErDMm3hOl7i37ccVub4uYjknCHcgkYW0rAmO6qMXG
   Dnt3RHBsiwSbT9ULIWb2awWOl5B8Yi3OBaF60L26qPrH6NlX2Lp7rlDhY
   /eWFM1PgOzNoT4EXw06EiYTQ3govrKWacebBciq4tCtnqrSHyHFws3129
   a4p+CDk4tm1Au4EOsl2Nm1f8eWV4Lx1jgv6UR2DfJN9rkUGn1GDnuP8QW
   vae2G4cdYXGS2fggit8GYIAlS8LA8Mzns/iwiVg84av2+ZGf4ReR2ezBs
   xsEgycHqtPALx6EO/iZOtW2FgwSdnOd5iOiBPgCAI1SMkOXwxFWdNTS0U
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532020"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532020"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730040"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730040"
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
Subject: [RFC 20/41] hw/cpu/cluster: Descript cluster is not only used for TCG in comment
Date: Thu, 30 Nov 2023 22:41:42 +0800
Message-Id: <20231130144203.2307629-21-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

Update the comment to make the cpu-cluster description more general for
both TCG and accel cases.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/cpu/cluster.c         |  2 +-
 include/hw/cpu/cluster.h | 20 +++++++++++++++-----
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index 340cfad9f8f1..27ab9e25a265 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -1,5 +1,5 @@
 /*
- * QEMU CPU cluster
+ * CPU cluster abstract device
  *
  * Copyright (c) 2018 GreenSocs SAS
  *
diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
index c038f05ddc9f..b3185e2f2566 100644
--- a/include/hw/cpu/cluster.h
+++ b/include/hw/cpu/cluster.h
@@ -1,5 +1,5 @@
 /*
- * QEMU CPU cluster
+ * CPU cluster abstract device
  *
  * Copyright (c) 2018 GreenSocs SAS
  *
@@ -24,17 +24,27 @@
 #include "qom/object.h"
 
 /*
- * CPU Cluster type
+ * # CPU Cluster
  *
- * A cluster is a group of CPUs which are all identical and have the same view
- * of the rest of the system. It is mainly an internal QEMU representation and
- * does not necessarily match with the notion of clusters on the real hardware.
+ * A cluster is a group of CPUs, that is, a level above the CPU (or Core).
+ *
+ * - For accel case, it's a CPU topology level concept above cores, in which
+ * the cores may share some resources (L2 cache or some others like L3
+ * cache tags, depending on the Archs). It is used to emulate the physical
+ * CPU cluster/module.
+ *
+ * - For TCG, cluster is used to organize CPUs directly without core. In one
+ * cluster, CPUs are all identical and have the same view of the rest of the
+ * system. It is mainly an internal QEMU representation and may not necessarily
+ * match with the notion of clusters on the real hardware.
  *
  * If CPUs are not identical (for example, Cortex-A53 and Cortex-A57 CPUs in an
  * Arm big.LITTLE system) they should be in different clusters. If the CPUs do
  * not have the same view of memory (for example the main CPU and a management
  * controller processor) they should be in different clusters.
  *
+ * # Use case for cluster in TCG
+ *
  * A cluster is created by creating an object of TYPE_CPU_CLUSTER, and then
  * adding the CPUs to it as QOM child objects (e.g. using the
  * object_initialize_child() or object_property_add_child() functions).
-- 
2.34.1


