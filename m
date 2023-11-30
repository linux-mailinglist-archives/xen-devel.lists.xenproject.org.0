Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AB37FF280
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:39:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644819.1006496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCh-0003OR-Vb; Thu, 30 Nov 2023 14:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644819.1006496; Thu, 30 Nov 2023 14:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCg-0002jM-6S; Thu, 30 Nov 2023 14:39:46 +0000
Received: by outflank-mailman (input) for mailman id 644819;
 Thu, 30 Nov 2023 14:36:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i9j-0000pO-Kk
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:36:43 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df06d535-8f8d-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 15:36:41 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:36:16 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:36:03 -0800
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
X-Inumbo-ID: df06d535-8f8d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701355001; x=1732891001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xvYlraOGB3zayUrWIK0PscKH2Ic2SrgqXJLGzTM1XXI=;
  b=nf7zfM5ep/A9Skf6dZhIHN/1tVx6PH1M90+O18AbWo7Y3X0J6Wij6e+q
   Y9KzqrlPCEtSTlHX4hf7hBwUZrpZghXFyZ8OuEVGGaHR6C83FTtFkd3Y8
   jUCnv7wmEK5AvHpfjUUsyC+5sGe54ALc1V5hy+78CDaXUohnthq37HS7w
   aMdskleeq/rrCwQZutYoh56u8uuKajlm5k4HHwKZmOoi+z6bHp103fGEq
   lclaASyZXMLDfAhVqJAfyVrblk9GrmaSRFq/nDpJD4UYJz2yOtAGI1iPR
   CBC1fZVBF0OrT8ogA5/KJsO0AFUm4RxJsUAkWJ+95se0LYCnwAZvBlWb2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532657"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532657"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730473"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730473"
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
Subject: [RFC 36/41] hw/i386: Allow x86_cpu_new() to specify parent for new CPU
Date: Thu, 30 Nov 2023 22:41:58 +0800
Message-Id: <20231130144203.2307629-37-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

For QOM topology, CPU should be inserted under its parent core.

Extend x86_cpu_new() to allow caller to specify topology parent.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index d9293846db64..3c99f4c3ab51 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -94,15 +94,22 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
     return x86_apicid_from_cpu_idx(&topo_info, cpu_index);
 }
 
-
 static void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id,
-                        Error **errp)
+                        Object *parent, int index, Error **errp)
 {
-    Object *cpu = object_new(MACHINE(x86ms)->cpu_type);
+    const char *cpu_type = MACHINE(x86ms)->cpu_type;
+    Object *cpu = object_new(cpu_type);
 
     if (!object_property_set_uint(cpu, "apic-id", apic_id, errp)) {
         goto out;
     }
+
+    if (parent) {
+        char *name = g_strdup_printf("%s[%d]", cpu_type, index);
+        object_property_add_child(parent, name, cpu);
+        g_free(name);
+    }
+
     qdev_realize(DEVICE(cpu), NULL, errp);
 
 out:
@@ -146,7 +153,8 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
 
     possible_cpus = mc->possible_cpu_arch_ids(ms);
     for (i = 0; i < ms->smp.cpus; i++) {
-        x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id, &error_fatal);
+        x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id,
+                    NULL, i, &error_fatal);
     }
 }
 
-- 
2.34.1


