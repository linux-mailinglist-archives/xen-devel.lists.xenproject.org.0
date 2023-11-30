Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 993D87FF273
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:39:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644799.1006427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCS-0008EB-UP; Thu, 30 Nov 2023 14:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644799.1006427; Thu, 30 Nov 2023 14:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCR-0007vo-4o; Thu, 30 Nov 2023 14:39:31 +0000
Received: by outflank-mailman (input) for mailman id 644799;
 Thu, 30 Nov 2023 14:34:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i7v-0008Nr-07
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:34:51 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cb3f37e-8f8d-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 15:34:49 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:34:47 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:34:37 -0800
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
X-Inumbo-ID: 9cb3f37e-8f8d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354889; x=1732890889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dK+ilj3Q1LqgiJ2/EiJWYjQp1qXfjG6+/g3hE8BTtcM=;
  b=S+uqvQeIY/+UlzIPEQmvk9Kko1omXkX6YAvDYBAQIsl2Z54fRu7mwDPD
   DIXIzmYyKSW0TWZCL5MiGkIyfm9munIEfmjlMdjY/YOQ5rY/0/9XLz/C9
   yY8ORf9uBtaGxhtE7FvxiJvru3To7eKtjZTHj7LBY+SfSjFVEI4MPYNmV
   JLC3ejyvDepJHTfxVeNhv2rQnPXBUFo0YAp4GA5/YCmTorNSaEqCvSocJ
   BGzYMVO2VMS09rRv257X2abEG5fLB81t7kvgmvQcVXuwY4t5Ic/t2erbn
   HWj9LIT6kyTcZ7qc3HfjqK4TD+5IoQoILhgUR/Y/2ugXIFtp/z2kXELwY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532281"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532281"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730118"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730118"
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
Subject: [RFC 27/41] hw/core/slot: Introduce CPU slot as the root of CPU topology
Date: Thu, 30 Nov 2023 22:41:49 +0800
Message-Id: <20231130144203.2307629-28-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

Abstract the root of topology tree as a special topology device
"cpu-slot".

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 MAINTAINERS                |  2 ++
 hw/core/cpu-slot.c         | 48 ++++++++++++++++++++++++++++++++++++++
 hw/core/meson.build        |  1 +
 include/hw/core/cpu-slot.h | 38 ++++++++++++++++++++++++++++++
 4 files changed, 89 insertions(+)
 create mode 100644 hw/core/cpu-slot.c
 create mode 100644 include/hw/core/cpu-slot.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 4b373ff46ce3..ac08b5a8c4e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1856,6 +1856,7 @@ R: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Yanan Wang <wangyanan55@huawei.com>
 S: Supported
 F: hw/core/cpu.c
+F: hw/core/cpu-slot.c
 F: hw/core/cpu-topo.c
 F: hw/core/machine-qmp-cmds.c
 F: hw/core/machine.c
@@ -1872,6 +1873,7 @@ F: qapi/machine-common.json
 F: qapi/machine-target.json
 F: include/hw/boards.h
 F: include/hw/core/cpu.h
+F: include/hw/core/cpu-slot.h
 F: include/hw/core/cpu-topo.h
 F: include/hw/cpu/book.h
 F: include/hw/cpu/cluster.h
diff --git a/hw/core/cpu-slot.c b/hw/core/cpu-slot.c
new file mode 100644
index 000000000000..5aef5b0189c2
--- /dev/null
+++ b/hw/core/cpu-slot.c
@@ -0,0 +1,48 @@
+/*
+ * CPU slot device abstraction
+ *
+ * Copyright (c) 2023 Intel Corporation
+ * Author: Zhao Liu <zhao1.liu@intel.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License,
+ * or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/core/cpu-slot.h"
+
+static void cpu_slot_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    CPUTopoClass *tc = CPU_TOPO_CLASS(oc);
+
+    set_bit(DEVICE_CATEGORY_CPU_DEF, dc->categories);
+    dc->user_creatable = false;
+
+    tc->level = CPU_TOPO_ROOT;
+}
+
+static const TypeInfo cpu_slot_type_info = {
+    .name = TYPE_CPU_SLOT,
+    .parent = TYPE_CPU_TOPO,
+    .class_init = cpu_slot_class_init,
+    .instance_size = sizeof(CPUSlot),
+};
+
+static void cpu_slot_register_types(void)
+{
+    type_register_static(&cpu_slot_type_info);
+}
+
+type_init(cpu_slot_register_types)
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 501d2529697e..3347c054e162 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -23,6 +23,7 @@ else
 endif
 
 common_ss.add(files('cpu-common.c'))
+common_ss.add(files('cpu-slot.c'))
 common_ss.add(files('cpu-topo.c'))
 common_ss.add(files('machine-smp.c'))
 system_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
diff --git a/include/hw/core/cpu-slot.h b/include/hw/core/cpu-slot.h
new file mode 100644
index 000000000000..718c8ecaa751
--- /dev/null
+++ b/include/hw/core/cpu-slot.h
@@ -0,0 +1,38 @@
+/*
+ * CPU slot device abstraction
+ *
+ * Copyright (c) 2023 Intel Corporation
+ * Author: Zhao Liu <zhao1.liu@intel.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License,
+ * or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef CPU_SLOT_H
+#define CPU_SLOT_H
+
+#include "hw/core/cpu-topo.h"
+#include "hw/qdev-core.h"
+
+#define TYPE_CPU_SLOT "cpu-slot"
+
+OBJECT_DECLARE_SIMPLE_TYPE(CPUSlot, CPU_SLOT)
+
+struct CPUSlot {
+    /*< private >*/
+    CPUTopoState parent_obj;
+
+    /*< public >*/
+};
+
+#endif /* CPU_SLOT_H */
-- 
2.34.1


