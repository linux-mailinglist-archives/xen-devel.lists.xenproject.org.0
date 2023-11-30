Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C217FF286
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:40:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644827.1006540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCq-0005ZG-CM; Thu, 30 Nov 2023 14:39:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644827.1006540; Thu, 30 Nov 2023 14:39:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCo-00057T-Qg; Thu, 30 Nov 2023 14:39:54 +0000
Received: by outflank-mailman (input) for mailman id 644827;
 Thu, 30 Nov 2023 14:36:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i9v-00012Q-QO
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:36:55 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7691a85-8f8d-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 15:36:54 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:36:52 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:36:42 -0800
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
X-Inumbo-ID: e7691a85-8f8d-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701355014; x=1732891014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n1bOTd1De6zljXfwth5hOf8VQYb/0aDsDjxTGUGzfGQ=;
  b=F5QTSm5jbN6dDpxGptEEyRAKNkqpedZ1wSJ5+sA9RhQFSah02QO70J08
   Zp/Cqx4Xl/Y0qsglGYFkBayyl2Gs3d/WCiOgNp5SS4u4Kj+phJ2qGvYQB
   tL1oN2BkFFxsDbQ0n+GZJAdYy8ZSGjtVIKjMakS1UM6ALsnaLrrcha+CB
   uFk4iAROETImcLkq8J9CYoK4GimVcJ66WEK8JMot0z5xh0XUWdw4653wP
   CqwHge/vPwd99U2O6irk3KrkgOblQjV6cdBxwULrbiLLCwBcBTGF7fYfm
   Jov4H87c6+WjB3lCTtl6lqhrf71xxknX6sbNJgro8KrNZPFcghTwIirPy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532843"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532843"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730582"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730582"
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
Subject: [RFC 40/41] hw/i386: Support QOM topology
Date: Thu, 30 Nov 2023 22:42:02 +0800
Message-Id: <20231130144203.2307629-41-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

Set MachineClass.smp_props.possible_cpus_qom_granu and
TopoClass.search_parent_pre_plug for i386.

So far, the i386 topology is based on the QOM topology.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c     | 1 +
 target/i386/cpu.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 595d4365fdd1..99f6c502de43 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1565,6 +1565,7 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = x86_cpu_index_to_props;
     mc->get_default_cpu_node_id = x86_get_default_cpu_node_id;
     mc->possible_cpu_arch_ids = x86_possible_cpu_arch_ids;
+    mc->smp_props.possible_cpus_qom_granu = CPU_TOPO_THREAD;
     x86mc->save_tsc_khz = true;
     x86mc->fwcfg_dma_enabled = true;
     nc->nmi_monitor_handler = x86_nmi;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index cd16cb893daf..1de5726691e1 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -41,6 +41,7 @@
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
 #include "hw/i386/sgx-epc.h"
+#include "hw/i386/x86.h"
 #endif
 
 #include "disas/capstone.h"
@@ -8009,6 +8010,9 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 #if !defined(CONFIG_USER_ONLY)
     object_class_property_add(oc, "crash-information", "GuestPanicInformation",
                               x86_cpu_get_crash_info_qom, NULL, NULL, NULL);
+
+    CPU_TOPO_CLASS(oc)->search_parent_pre_plug =
+        x86_cpu_search_parent_pre_plug;
 #endif
 
     for (w = 0; w < FEATURE_WORDS; w++) {
-- 
2.34.1


