Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BB76C55E2
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 21:01:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513589.794815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf4eQ-0005XJ-Eo; Wed, 22 Mar 2023 20:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513589.794815; Wed, 22 Mar 2023 20:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf4eQ-0005Uc-Bq; Wed, 22 Mar 2023 20:01:38 +0000
Received: by outflank-mailman (input) for mailman id 513589;
 Wed, 22 Mar 2023 20:01:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ukyC=7O=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1pf4eO-0005UQ-Gn
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 20:01:36 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58be8c1d-c8ec-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 21:01:34 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 46342B81DF0;
 Wed, 22 Mar 2023 20:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEE1C433D2;
 Wed, 22 Mar 2023 20:01:31 +0000 (UTC)
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
X-Inumbo-ID: 58be8c1d-c8ec-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679515293;
	bh=AqSXgRIi/BJPiDJTWepOKNXUrQyyOJofAKS+fRFpeQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gGTtbm7kosVl9ic3773cxml5IH1TxgkNIs8+OIlCaNP6V4I8TZ36QtjNwomLjS58H
	 QR7D5PNhWARYSmkJS0gur/qfWpZEVGBf++WWprHKEiRt4Y/LcxcCRum7XpWzlNHJHT
	 9tb4HbZ0U7Otkg8v123kwI4+5+TLqALfYJnbkVpOhlbtK8gx/L5yOunCZ2XFUvC5vm
	 x6acBOvCxOuYcY5INBlp90jyoyCY0HNXakLgEJhxpT8jtiEeq1g+aKqmU6q92YAWSt
	 R8VQzmW1YcPVykuQfAG3H6JTqg57ywpfbvKCqAYWb7EKkU+B+tSKktjKF2kYYLffWK
	 5Z0M3F/X4nKhQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 5.15 04/16] x86/PVH: obtain VGA console info in Dom0
Date: Wed, 22 Mar 2023 16:01:08 -0400
Message-Id: <20230322200121.1997157-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322200121.1997157-1-sashal@kernel.org>
References: <20230322200121.1997157-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Jan Beulich <jbeulich@suse.com>

[ Upstream commit 934ef33ee75c3846f605f18b65048acd147e3918 ]

A new platform-op was added to Xen to allow obtaining the same VGA
console information PV Dom0 is handed. Invoke the new function and have
the output data processed by xen_init_vga().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com>

Link: https://lore.kernel.org/r/8f315e92-7bda-c124-71cc-478ab9c5e610@suse.com
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/xen/Makefile            |  2 +-
 arch/x86/xen/enlighten_pv.c      |  3 ++-
 arch/x86/xen/enlighten_pvh.c     | 13 +++++++++++++
 arch/x86/xen/vga.c               |  5 ++---
 arch/x86/xen/xen-ops.h           |  7 ++++---
 include/xen/interface/platform.h |  3 +++
 6 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/arch/x86/xen/Makefile b/arch/x86/xen/Makefile
index 4953260e281c3..40b5779fce21c 100644
--- a/arch/x86/xen/Makefile
+++ b/arch/x86/xen/Makefile
@@ -45,7 +45,7 @@ obj-$(CONFIG_PARAVIRT_SPINLOCKS)+= spinlock.o
 
 obj-$(CONFIG_XEN_DEBUG_FS)	+= debugfs.o
 
-obj-$(CONFIG_XEN_PV_DOM0)	+= vga.o
+obj-$(CONFIG_XEN_DOM0)		+= vga.o
 
 obj-$(CONFIG_SWIOTLB_XEN)	+= pci-swiotlb-xen.o
 
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 561aad13412f9..998db0257e2ad 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1353,7 +1353,8 @@ asmlinkage __visible void __init xen_start_kernel(void)
 
 		x86_platform.set_legacy_features =
 				xen_dom0_set_legacy_features;
-		xen_init_vga(info, xen_start_info->console.dom0.info_size);
+		xen_init_vga(info, xen_start_info->console.dom0.info_size,
+			     &boot_params.screen_info);
 		xen_start_info->console.domU.mfn = 0;
 		xen_start_info->console.domU.evtchn = 0;
 
diff --git a/arch/x86/xen/enlighten_pvh.c b/arch/x86/xen/enlighten_pvh.c
index bcae606bbc5cf..1da44aca896c6 100644
--- a/arch/x86/xen/enlighten_pvh.c
+++ b/arch/x86/xen/enlighten_pvh.c
@@ -43,6 +43,19 @@ void __init xen_pvh_init(struct boot_params *boot_params)
 	x86_init.oem.banner = xen_banner;
 
 	xen_efi_init(boot_params);
+
+	if (xen_initial_domain()) {
+		struct xen_platform_op op = {
+			.cmd = XENPF_get_dom0_console,
+		};
+		long ret = HYPERVISOR_platform_op(&op);
+
+		if (ret > 0)
+			xen_init_vga(&op.u.dom0_console,
+				     min(ret * sizeof(char),
+					 sizeof(op.u.dom0_console)),
+				     &boot_params->screen_info);
+	}
 }
 
 void __init mem_map_via_hcall(struct boot_params *boot_params_p)
diff --git a/arch/x86/xen/vga.c b/arch/x86/xen/vga.c
index e336f223f7f47..93697109592c3 100644
--- a/arch/x86/xen/vga.c
+++ b/arch/x86/xen/vga.c
@@ -9,10 +9,9 @@
 
 #include "xen-ops.h"
 
-void __init xen_init_vga(const struct dom0_vga_console_info *info, size_t size)
+void __init xen_init_vga(const struct dom0_vga_console_info *info, size_t size,
+			 struct screen_info *screen_info)
 {
-	struct screen_info *screen_info = &boot_params.screen_info;
-
 	/* This is drawn from a dump from vgacon:startup in
 	 * standard Linux. */
 	screen_info->orig_video_mode = 3;
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 16aed4b121297..71f31032c635f 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -110,11 +110,12 @@ static inline void xen_uninit_lock_cpu(int cpu)
 
 struct dom0_vga_console_info;
 
-#ifdef CONFIG_XEN_PV_DOM0
-void __init xen_init_vga(const struct dom0_vga_console_info *, size_t size);
+#ifdef CONFIG_XEN_DOM0
+void __init xen_init_vga(const struct dom0_vga_console_info *, size_t size,
+			 struct screen_info *);
 #else
 static inline void __init xen_init_vga(const struct dom0_vga_console_info *info,
-				       size_t size)
+				       size_t size, struct screen_info *si)
 {
 }
 #endif
diff --git a/include/xen/interface/platform.h b/include/xen/interface/platform.h
index 732efb08c3e17..744bc41355678 100644
--- a/include/xen/interface/platform.h
+++ b/include/xen/interface/platform.h
@@ -500,6 +500,8 @@ struct xenpf_symdata {
 };
 DEFINE_GUEST_HANDLE_STRUCT(xenpf_symdata);
 
+#define XENPF_get_dom0_console 64
+
 struct xen_platform_op {
 	uint32_t cmd;
 	uint32_t interface_version; /* XENPF_INTERFACE_VERSION */
@@ -523,6 +525,7 @@ struct xen_platform_op {
 		struct xenpf_mem_hotadd        mem_add;
 		struct xenpf_core_parking      core_parking;
 		struct xenpf_symdata           symdata;
+		struct dom0_vga_console_info   dom0_console;
 		uint8_t                        pad[128];
 	} u;
 };
-- 
2.39.2


