Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB107FF27E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:39:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644817.1006483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCe-0002he-RB; Thu, 30 Nov 2023 14:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644817.1006483; Thu, 30 Nov 2023 14:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCd-00025F-PG; Thu, 30 Nov 2023 14:39:43 +0000
Received: by outflank-mailman (input) for mailman id 644817;
 Thu, 30 Nov 2023 14:36:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i9A-0000W8-2w
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:36:08 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca6b3264-8f8d-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 15:36:05 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:36:03 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:35:54 -0800
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
X-Inumbo-ID: ca6b3264-8f8d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354965; x=1732890965;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1ATU854G1+lM0AKtC/FFv0wTbLk1yiIDIW9pRjL09lQ=;
  b=CWOo8NiZSeph855JmZHll98ggBldNO0k1NR4fp4Addk1ISGRd+9w6MgV
   yYw7JTWNg37QNOW/Ahs8DQNL9YppZCGeQqcthJw4U69cBnC9ALNQyGQ0P
   EoTvkulRmLiIXr0m08O9csZ4xqGpKG3EhdK6Bk95iA1370bEWyHHeIvYh
   e94usb7HRZO8FBlJW8tA6kSv6UeIq+ayQPfN2tNQVIPtjNuoKDTvPjH+r
   A0KreWbQtYy+T3Go6V2lz8xeW+nLUMx3xZOisbSTA0xE/Qg3tkZGOKHWW
   3XVuR638qaSuG+bl62bAM+Wo5053XmxLSpT1hCPLARYg1jEEBew6WIQPw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532572"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532572"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730346"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730346"
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
Subject: [RFC 35/41] hw/i386: Make x86_cpu_new() private in x86.c
Date: Thu, 30 Nov 2023 22:41:57 +0800
Message-Id: <20231130144203.2307629-36-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

x86_cpu_new() is only invoked in x86.c. Declear it as static in x86.c.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c         | 3 ++-
 include/hw/i386/x86.h | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index b3d054889bba..d9293846db64 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -95,7 +95,8 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
 }
 
 
-void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
+static void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id,
+                        Error **errp)
 {
     Object *cpu = object_new(MACHINE(x86ms)->cpu_type);
 
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index da19ae15463a..19e9f93fe286 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -97,8 +97,6 @@ OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
 
 uint32_t x86_cpu_apic_id_from_index(X86MachineState *pcms,
                                     unsigned int cpu_index);
-
-void x86_cpu_new(X86MachineState *pcms, int64_t apic_id, Error **errp);
 void x86_cpus_init(X86MachineState *pcms, int default_cpu_version);
 CpuInstanceProperties x86_cpu_index_to_props(MachineState *ms,
                                              unsigned cpu_index);
-- 
2.34.1


