Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8616C55C2
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 21:00:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513585.794805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf4dZ-0004wh-16; Wed, 22 Mar 2023 20:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513585.794805; Wed, 22 Mar 2023 20:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf4dY-0004uR-Te; Wed, 22 Mar 2023 20:00:44 +0000
Received: by outflank-mailman (input) for mailman id 513585;
 Wed, 22 Mar 2023 20:00:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ukyC=7O=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1pf4dX-0004uL-HX
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 20:00:43 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 389a359e-c8ec-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 21:00:40 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 61C50B81DC6;
 Wed, 22 Mar 2023 20:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A4CC433D2;
 Wed, 22 Mar 2023 20:00:37 +0000 (UTC)
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
X-Inumbo-ID: 389a359e-c8ec-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679515239;
	bh=cxVfjDcJ3o4/9WbrsHYV+z94c00ix0JIOKFcYYwCllg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DbRjq2qAggn3dretjc4XyEgCrSZrnwNmIx1tDb2EcqW6HlZXMlFS7W4hKEisGPEbv
	 Hz2I7SHc+X1qiM8gtNGqSnGMwBsRkHuBXw70z3tyWv8qN12CBTHs2LKv2DFzzYfCNI
	 q7IfLS7166chzMjMKi41L8LJLwJSLocZ3aS+kBJNUKfMSMJqDjpP68jLaM/T6Gu1VN
	 4TX+Bh6arNaIqd81xXxJ0l8uEWIkIJMVyKBv4y5HBywva46KQobA9NRfQ9nhoAWTyq
	 e9biyvwhOoJNPpxGF0vyRM+FrHNTVCbbt6JUB/VmtbhAo8up+lNPyXmnLTUpXUnSQ2
	 nJh033id3ot5g==
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
Subject: [PATCH AUTOSEL 6.1 15/34] x86/PVH: obtain VGA console info in Dom0
Date: Wed, 22 Mar 2023 15:59:07 -0400
Message-Id: <20230322195926.1996699-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195926.1996699-1-sashal@kernel.org>
References: <20230322195926.1996699-1-sashal@kernel.org>
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
index 3c5b52fbe4a7f..a9ec8c9f5c5dd 100644
--- a/arch/x86/xen/Makefile
+++ b/arch/x86/xen/Makefile
@@ -45,6 +45,6 @@ obj-$(CONFIG_PARAVIRT_SPINLOCKS)+= spinlock.o
 
 obj-$(CONFIG_XEN_DEBUG_FS)	+= debugfs.o
 
-obj-$(CONFIG_XEN_PV_DOM0)	+= vga.o
+obj-$(CONFIG_XEN_DOM0)		+= vga.o
 
 obj-$(CONFIG_XEN_EFI)		+= efi.o
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 8944726255c9c..333539bdbdaae 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1389,7 +1389,8 @@ asmlinkage __visible void __init xen_start_kernel(struct start_info *si)
 
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
index 14ea32e734d59..d97adab8420f4 100644
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
index 9a8bb972193d8..a10903785a338 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -108,11 +108,12 @@ static inline void xen_uninit_lock_cpu(int cpu)
 
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
index 655d92e803e14..79a443c65ea93 100644
--- a/include/xen/interface/platform.h
+++ b/include/xen/interface/platform.h
@@ -483,6 +483,8 @@ struct xenpf_symdata {
 };
 DEFINE_GUEST_HANDLE_STRUCT(xenpf_symdata);
 
+#define XENPF_get_dom0_console 64
+
 struct xen_platform_op {
 	uint32_t cmd;
 	uint32_t interface_version; /* XENPF_INTERFACE_VERSION */
@@ -506,6 +508,7 @@ struct xen_platform_op {
 		struct xenpf_mem_hotadd        mem_add;
 		struct xenpf_core_parking      core_parking;
 		struct xenpf_symdata           symdata;
+		struct dom0_vga_console_info   dom0_console;
 		uint8_t                        pad[128];
 	} u;
 };
-- 
2.39.2


