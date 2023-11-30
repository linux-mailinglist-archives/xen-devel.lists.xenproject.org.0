Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5CB7FF268
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:39:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644787.1006372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCH-000687-EH; Thu, 30 Nov 2023 14:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644787.1006372; Thu, 30 Nov 2023 14:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCG-0005jE-DZ; Thu, 30 Nov 2023 14:39:20 +0000
Received: by outflank-mailman (input) for mailman id 644787;
 Thu, 30 Nov 2023 14:33:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i6z-0008E0-Qx
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:33:53 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b1ace92-8f8d-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 15:33:53 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:33:50 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:33:41 -0800
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
X-Inumbo-ID: 7b1ace92-8f8d-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354833; x=1732890833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TLbpY7EX///aEBUshQ9nHMg5QAVw4jJxDP0uMhZZdFI=;
  b=mGg+D15kVa+FbiZDXgQ6ZHjLcP9IGa1SsWu3qFYa5gpgh/ypdPCj33A1
   JeaefoQgFaOxS0GfiGS4R4pew1nb1z85dO9W3SMF6vIyapkKz1ep6keIr
   Hkk6+n8wSmLaUhekVwfsA4tXRHWK9z93cuU0jmxbhO4mlfMexQXen7MZ/
   K8nPxIx0WKn/j0czd1kxmDaugQQ/HwUndD0MNsBwKGvWVvsl7E0qp2qXw
   IKnQqN27c0AH8wYlEU3qWl+lC4SPw7tgvvf4ULlmsjWzWM6xml0aHDpyw
   zlwFs0BYs278c3IBTdGSOfz5ftKbnY379boc4ijmFfn/FAWZ3iJZCN22j
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532051"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532051"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730047"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730047"
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
Subject: [RFC 21/41] hw/cpu/cluster: Allow cpu-cluster to be created by -device
Date: Thu, 30 Nov 2023 22:41:43 +0800
Message-Id: <20231130144203.2307629-22-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

Since we will extend cpu-cluster to build CPU topology in virtualization
case via -device, remove the original limitition.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/cpu/cluster.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index 27ab9e25a265..8a666c27d151 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -96,9 +96,6 @@ static void cpu_cluster_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, cpu_cluster_properties);
     dc->realize = cpu_cluster_realize;
 
-    /* This is not directly for users, CPU children must be attached by code */
-    dc->user_creatable = false;
-
 #ifdef CONFIG_TCG
     cc->tcg_clu_ops = &common_cluster_tcg_ops;
 #endif
-- 
2.34.1


