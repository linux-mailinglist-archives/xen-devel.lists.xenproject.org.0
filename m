Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1937FF27F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:39:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644820.1006509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCk-00044W-5P; Thu, 30 Nov 2023 14:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644820.1006509; Thu, 30 Nov 2023 14:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCi-0003P8-QH; Thu, 30 Nov 2023 14:39:48 +0000
Received: by outflank-mailman (input) for mailman id 644820;
 Thu, 30 Nov 2023 14:36:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i9k-0000pO-AZ
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:36:44 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfa734af-8f8d-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 15:36:42 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:36:24 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:36:14 -0800
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
X-Inumbo-ID: dfa734af-8f8d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701355002; x=1732891002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lndGadsp6lchipVix45sBuugJYcXf54DoIQPmPepLjo=;
  b=A6azXLPohjn3O2rubFp/PwjM2P0N7a1vzt+L4NzbeQoNeofkrrtPBG/V
   cVz5L2SGMPrFA1l5NUmqhJ253NbxyUg/ZIFrmkgprX0Y8f2Fr9fdnAlqk
   jhRJTq8FKmnPjdFXWtbJdgoBhKs59YptmVLm6FE87Eov8rGRgGDqmY60A
   47/SdNx8iMnGlK22IMQXNESB57X0UU2jq6G6H4Re4/olwPJnBnKGMi/LK
   RRRiQhDOzjiVF2XoVMinXQ9RiQOjHw3dDbVdN6DkX0uE8+UVlbynjGWRI
   0K2ezNsW1+f4+CqnyuJlZN36itjZChq9OgKlmqESyCCgk6nU+9FAdkEhp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532685"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532685"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730506"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730506"
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
Subject: [RFC 37/41] hw/i386: Allow i386 to create new CPUs from QOM topology
Date: Thu, 30 Nov 2023 22:41:59 +0800
Message-Id: <20231130144203.2307629-38-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

For QOM topology, maximum number of CPUs and the number of plugged CPUs
are configured in core level.

Iterate through all the cpu-cores to determine how many CPUs should be
created in each cpu-core.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 3c99f4c3ab51..febffed92a83 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -152,9 +152,35 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
     }
 
     possible_cpus = mc->possible_cpu_arch_ids(ms);
-    for (i = 0; i < ms->smp.cpus; i++) {
-        x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id,
-                    NULL, i, &error_fatal);
+
+    /*
+     * possible_cpus_qom_granu means the QOM topology support.
+     *
+     * TODO: Drop the "!mc->smp_props.possible_cpus_qom_granu" case when
+     * i386 completes QOM topology support.
+     */
+    if (mc->smp_props.possible_cpus_qom_granu) {
+        CPUCore *core;
+        int cpu_index = 0;
+        int core_idx = 0;
+
+        MACHINE_CORE_FOREACH(ms, core) {
+            for (i = 0; i < core->plugged_threads; i++) {
+                x86_cpu_new(x86ms, possible_cpus->cpus[cpu_index].arch_id,
+                            OBJECT(core), cpu_index, &error_fatal);
+                cpu_index++;
+            }
+
+            if (core->plugged_threads < core->nr_threads) {
+                cpu_index += core->nr_threads - core->plugged_threads;
+            }
+            core_idx++;
+        }
+    } else {
+        for (i = 0; i < ms->smp.cpus; i++) {
+            x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id,
+                        NULL, i, &error_fatal);
+        }
     }
 }
 
-- 
2.34.1


