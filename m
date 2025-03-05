Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D67AA4FA2F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:34:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902065.1310020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpl9A-0005t0-5K; Wed, 05 Mar 2025 09:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902065.1310020; Wed, 05 Mar 2025 09:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpl9A-0005rE-1f; Wed, 05 Mar 2025 09:34:36 +0000
Received: by outflank-mailman (input) for mailman id 902065;
 Wed, 05 Mar 2025 09:34:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0bc7=VY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tpknY-0006ew-AT
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:12:16 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed12a1a3-f9a1-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 10:12:13 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5495078cd59so5447662e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:12:13 -0800 (PST)
Received: from EPUAKYIW02F7.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495de028fasm1078264e87.139.2025.03.05.01.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 01:12:11 -0800 (PST)
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
X-Inumbo-ID: ed12a1a3-f9a1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741165933; x=1741770733; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2TmN1BzAMOulOXirn8ZPb+RBDTzjlvF9BdHXNBPEhs=;
        b=Bw0Bbwab6Nn7l8N5/AbxGThhI/5BSttUFcUvamw6o4PnBw372zJl5q/Ftm8hJn+YkI
         qlNATeOw1iPmJUr0WSW6pf/7qmErGR6biBe/Hfi4pEdpPYiEf5CnANzqnplqlreu0J0x
         i+TnqxPIBM1q0wjSz4jVJ7tr8u5YmNeAXyqhlmkmkLArI2P5Oy0hPlhvNx5pw0bQIxtd
         jqNUSSsCTNzNSuaigon3wasGvoxnFaZISzvu+Z9sxD5e2G45JdYKhVzI4iXkMR413VLC
         sP7gBkAm0sDgE6JJgPALS/V41yzs8wSIcKC5pAJX+FpubSi8wtnLOBk6frgF/GJyrqYZ
         NIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165933; x=1741770733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2TmN1BzAMOulOXirn8ZPb+RBDTzjlvF9BdHXNBPEhs=;
        b=pM9lRNWYwiTjUEvQRMwcNeH+4KEsAFLLn8LfXp/rfPBRHZF+LYxaPwFGhooEbTWrnX
         tZf491sDelIDyVmyTZdeak5s+yihECIp1Ev1kb836Y5vMuIcUEsYBW82aLWgwil0kjFN
         Os41wtvafxQLKne9G43w5wO2NVSzmgPDvRNnDKawDkerbr9pykmOEKx1DC3gbpDzYE8Z
         rajgXddkER8N5pFz3hWaEyB2mF+f69VDcghf4ry8mKHc/okWOJuYfdat/Hm+b9fTXMiY
         WQiAsXRwO2FINIQjYglX+k8gQ4iQDsyD9Zo9xNVnneBRo2cySz9BWSukiBfAI0NTl2CA
         2f8w==
X-Gm-Message-State: AOJu0Yz33CXb2SDeUbcgN6Zw5n8zI0qlNyLyhog9ihw1SNsoc3ZjDN6l
	Ht1MBj8ODoBkaB7sXk8SA+0A60TOOFemussuOXLgUWGG6PQm+V/6E7BAJTFR
X-Gm-Gg: ASbGncseUd71bNplJrfQnHYaVvrVh9PXYZyCeDDn5sZGIV5lvU3ltsa+chaW+cWSuJy
	cElU55U11K2/EWAVFbLtY641IM+WM7Jz/DVGU5R8r25/10ziocS3doffNC1zPazyX8ngspI3JQ0
	hBH76d88mH4sPgtAOjBu+qlmNvSmmCKSzUpmmL95t0kxMqRQ1c89INOXd3/bjED5N9cnxGLSs+i
	+r3usU1YF/bSpWBIb+xNtmQ6S6V76/fmbJ6FSIO22FxwkRnHW3fZbFL402voW+TLzRnO+dwfTCu
	H3SoJbTA6VVpA9Qg1TkpiLqeICTr0mH/NREJXRBQ9TgrIlGAMQ==
X-Google-Smtp-Source: AGHT+IEawaJ5thoARcmiuSdGY6fIkdNnAu5jE7n/R2L8GjsZ4boHnU4722Pq87bdX6owRtzPi9cjgA==
X-Received: by 2002:a05:6512:3d90:b0:545:576:cbca with SMTP id 2adb3069b0e04-5497d3305b7mr807982e87.8.1741165932532;
        Wed, 05 Mar 2025 01:12:12 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH 14/16] xen/arm: Resume memory management on Xen resume
Date: Wed,  5 Mar 2025 11:11:22 +0200
Message-ID: <2ef15cb605f987eb087c5496d123c47c01cc0ae7.1741164138.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741164138.git.xakep.amatop@gmail.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

The MMU needs to be enabled in the resume flow before the context
can be restored (we need to be able to access the context data by
virtual address in order to restore it). The configuration of system
registers prior to branching to the routine that sets up the page
tables is copied from xen/arch/arm/arm64/head.S.
After the MMU is enabled, the content of TTBR0_EL2 is changed to
point to init_ttbr (page tables used at runtime).

At boot the init_ttbr variable is updated when a secondary CPU is
hotplugged. In the scenario where there is only one physical CPU in
the system, the init_ttbr would not be initialized for the use in
resume flow. To get the variable initialized in all scenarios in this
patch we add that the boot CPU updates init_ttbr after it sets the
page tables for runtime.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V3:
- updated commit message
- instead of using create_page_tables, enable_mmu, and mmu_init_secondary_cpu,
  the existing function enable_secondary_cpu_mm is now used
- prepare_secondary_mm (previously init_secondary_pagetables in the previous
  patch series) is now called at the end of start_xen instead of
  setup_pagetables. Calling it in the previous location caused a crash
- add early printk init during resume

Changes in V2:
- moved hyp_resume to head.S to place it near the rest of the start code
- simplified the code in hyp_resume by using existing functions such as
  check_cpu_mode, cpu_init, create_page_tables, and enable_mmu
---
 xen/arch/arm/arm64/head.S | 23 +++++++++++++++++++++++
 xen/arch/arm/setup.c      |  8 ++++++++
 2 files changed, 31 insertions(+)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 3522c497c5..fab2812e54 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -564,6 +564,29 @@ END(efi_xen_start)
 #ifdef CONFIG_SYSTEM_SUSPEND
 
 FUNC(hyp_resume)
+        msr   DAIFSet, 0xf           /* Disable all interrupts */
+
+        tlbi  alle2
+        dsb   sy                     /* Ensure completion of TLB flush */
+        isb
+
+        ldr   x0, =start
+        adr   x19, start             /* x19 := paddr (start) */
+        sub   x20, x19, x0           /* x20 := phys-offset */
+
+        /* Initialize the UART if earlyprintk has been enabled. */
+#ifdef CONFIG_EARLY_PRINTK
+        bl    init_uart
+#endif
+        PRINT_ID("- Xen resuming -\r\n")
+
+        bl    check_cpu_mode
+        bl    cpu_init
+
+        ldr   lr, =mmu_resumed
+        b     enable_secondary_cpu_mm
+
+mmu_resumed:
         b .
 END(hyp_resume)
 
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index ffcae900d7..3a89ac436b 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -508,6 +508,14 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
     for_each_domain( d )
         domain_unpause_by_systemcontroller(d);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    /*
+     * It is called to initialize init_ttbr.
+     * Without this call, Xen gets stuck after resuming.
+     */
+    prepare_secondary_mm(0);
+#endif
+
     /* Switch on to the dynamically allocated stack for the idle vcpu
      * since the static one we're running on is about to be freed. */
     memcpy(idle_vcpu[0]->arch.cpu_info, get_cpu_info(),
-- 
2.43.0


