Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C62CF7FF271
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:39:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644795.1006409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCP-0007dJ-LJ; Thu, 30 Nov 2023 14:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644795.1006409; Thu, 30 Nov 2023 14:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCN-0007F7-SC; Thu, 30 Nov 2023 14:39:27 +0000
Received: by outflank-mailman (input) for mailman id 644795;
 Thu, 30 Nov 2023 14:34:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i7b-0008E0-Ew
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:34:31 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 919ec32c-8f8d-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 15:34:30 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:34:28 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:34:18 -0800
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
X-Inumbo-ID: 919ec32c-8f8d-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354870; x=1732890870;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R67m9mW34W7uiETtegm4359TeHvWglaSP7oCtBRRyHM=;
  b=A7LjNdy2Cl1idzU5WEFIh+IWk8Jzgx+oZMnkcWWtXEiBUFFkT/qfZgE5
   hxToLcxpj6GyFJdUmYrR3xl6iTpyXjCHVXryCJivk9IVEXMynH3qD/F93
   eZnF3oI3uoB9wTsOYbYzwVhR7rujApL7YoQncNreDK3s+PWogwgDKYscv
   fHDjpsvLXafe7ptI6j94QyqN6O6c7lNS5pSNyI0uu2LE+70jBQgd3MemS
   3iUMkv9SeFyfAk2dsH0xS2vL1De5JV3jYMzlr9VFS03gM1krd3pUFUXvZ
   rlBt+VgCxFCc1s4joYsmk5zTtuxFaA0iw00Mg+BNptKoBPWRsXqqVMfY7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532217"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532217"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730090"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730090"
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
Subject: [RFC 25/41] hw/cpu/book: Abstract cpu-book level as topology device
Date: Thu, 30 Nov 2023 22:41:47 +0800
Message-Id: <20231130144203.2307629-26-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

Abstract book level as a topology device "cpu-book" to allow user to
create book level topology from cli and later the cpu-books could be
added into topology tree.

In addition, mark the cpu-book as DEVICE_CATEGORY_CPU_DEF category to
indicate it belongs to the basic CPU definition and should be created
from cli before board initialization.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 MAINTAINERS           |  2 ++
 hw/cpu/book.c         | 46 +++++++++++++++++++++++++++++++++++++++++++
 hw/cpu/meson.build    |  2 +-
 include/hw/cpu/book.h | 38 +++++++++++++++++++++++++++++++++++
 4 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 hw/cpu/book.c
 create mode 100644 include/hw/cpu/book.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6a9fa0aeed0c..dd5adfda64cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1862,6 +1862,7 @@ F: hw/core/machine.c
 F: hw/core/machine-smp.c
 F: hw/core/null-machine.c
 F: hw/core/numa.c
+F: hw/cpu/book.c
 F: hw/cpu/cluster.c
 F: hw/cpu/die.c
 F: hw/cpu/socket.c
@@ -1871,6 +1872,7 @@ F: qapi/machine-target.json
 F: include/hw/boards.h
 F: include/hw/core/cpu.h
 F: include/hw/core/cpu-topo.h
+F: include/hw/cpu/book.h
 F: include/hw/cpu/cluster.h
 F: include/hw/cpu/die.h
 F: include/hw/cpu/socket.h
diff --git a/hw/cpu/book.c b/hw/cpu/book.c
new file mode 100644
index 000000000000..4b16267b10eb
--- /dev/null
+++ b/hw/cpu/book.c
@@ -0,0 +1,46 @@
+/*
+ * CPU book abstract device
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
+#include "hw/cpu/book.h"
+
+static void cpu_book_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    CPUTopoClass *tc = CPU_TOPO_CLASS(oc);
+
+    set_bit(DEVICE_CATEGORY_CPU_DEF, dc->categories);
+
+    tc->level = CPU_TOPO_BOOK;
+}
+
+static const TypeInfo cpu_book_type_info = {
+    .name = TYPE_CPU_BOOK,
+    .parent = TYPE_CPU_TOPO,
+    .class_init = cpu_book_class_init,
+    .instance_size = sizeof(CPUBook),
+};
+
+static void cpu_book_register_types(void)
+{
+    type_register_static(&cpu_book_type_info);
+}
+
+type_init(cpu_book_register_types)
diff --git a/hw/cpu/meson.build b/hw/cpu/meson.build
index 251724fea86c..c44b54c5abb0 100644
--- a/hw/cpu/meson.build
+++ b/hw/cpu/meson.build
@@ -1,4 +1,4 @@
-system_ss.add(files('core.c', 'cluster.c', 'die.c', 'socket.c'))
+system_ss.add(files('core.c', 'cluster.c', 'die.c', 'socket.c', 'book.c'))
 
 system_ss.add(when: 'CONFIG_ARM11MPCORE', if_true: files('arm11mpcore.c'))
 system_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_mpcore.c'))
diff --git a/include/hw/cpu/book.h b/include/hw/cpu/book.h
new file mode 100644
index 000000000000..b91bd553bea6
--- /dev/null
+++ b/include/hw/cpu/book.h
@@ -0,0 +1,38 @@
+/*
+ * CPU book abstract device
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
+#ifndef HW_CPU_BOOK_H
+#define HW_CPU_BOOK_H
+
+#include "hw/core/cpu-topo.h"
+#include "hw/qdev-core.h"
+
+#define TYPE_CPU_BOOK "cpu-book"
+
+OBJECT_DECLARE_SIMPLE_TYPE(CPUBook, CPU_BOOK)
+
+struct CPUBook {
+    /*< private >*/
+    CPUTopoState obj;
+
+    /*< public >*/
+};
+
+#endif /* HW_CPU_BOOK_H */
-- 
2.34.1


