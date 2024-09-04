Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B9D96C3BC
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 18:16:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790552.1200395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfg-0001rs-I6; Wed, 04 Sep 2024 16:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790552.1200395; Wed, 04 Sep 2024 16:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfg-0001ol-Dh; Wed, 04 Sep 2024 16:15:52 +0000
Received: by outflank-mailman (input) for mailman id 790552;
 Wed, 04 Sep 2024 16:15:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ufny=QC=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1slsfe-0000I6-UX
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 16:15:50 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3a0c0a1-6ad8-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 18:15:50 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-53345604960so7817184e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 09:15:50 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535407ac380sm2378135e87.83.2024.09.04.09.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 09:15:48 -0700 (PDT)
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
X-Inumbo-ID: f3a0c0a1-6ad8-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725466550; x=1726071350; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Je23wvBBopidSll9UpAaH5rZwvVBAj7ARc0Pm2/k3kk=;
        b=PLIgvx8xkjyzpMeTWrLPRss3/JIQNRCRCH6fBxvjwBEJkSw4nGd9x7pdzYOeCWfJMO
         YLcvOtKIolbEwgUaswlP6RvuUPa1U8+KyJmv3ScGmwmv6/4AXa8XfF13Cmm/gMKuYmDK
         yXwy7QteLMqjGDJjY/51KLh4JBPrZuXYfnxwDRnUgFqcSa8xWo9LK9gy4o2lLjifolTf
         LT23ftGq5MpLTnzwE9PlpJUgkKZrb060EYNEyv3AAQHVaXi2hoMY8ig7DVy3F0wW9MKz
         4FZgGDl7jQAT8WfRzL1eHHLH8RD217QQH/QEd7AUtg1KYd/as07kkRQcCe98z6B6r3Pj
         j1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466550; x=1726071350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Je23wvBBopidSll9UpAaH5rZwvVBAj7ARc0Pm2/k3kk=;
        b=Z215FaZf7sqW1flI6rlI/XBQzVSOzu5qAYvs27EAc8P/PV6hkH+nOmeEq5iFMRfQY7
         lWsFF+vQQ9d5Yv92sXN1f8f8GgYUmdcBQ8sTJy8C77lepPAsAXffy7T+uWlt/iOyPoV7
         M7PAOJLiUtcHDB6gfHASNjgleQct4tP/eQksFXDF4Q0uNyUqCfwTucUyDZG4Po92dV9l
         IKdIBflt9QrUUoq1HiryDpVX2zr6iEBYClEZKwmBChPjeUAkKNrxFM+NAlQdUkf/tXTa
         Jek4a/VPL8A0ePtK8gvagXyRh8D2x5qAIU1jKQcpreNV9Sr+EtGDygW5RhSLxgxww8Z1
         ogBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnWTPcYuvoHnSNzP/xnm0h72C1HrvWuoFbFeccwFEzYLjMFWY6csgxVCpSnFEaAuKh5beBMxEW8U4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZfXvOpMTH0lcbPsmLDxRrNfGSSN9asaZHQWEoKnASShxdDMXf
	W6IF/KiDXT9suhpN//Gkyvcl9GOrPvmcW+UjC1SvyRZyFXM+xK2s
X-Google-Smtp-Source: AGHT+IFDpz1IZD0Qtgo2lbwg04ZmmoJdx9qSrR477CRxTjdjnUIVorw3NCNELME4Ae86vdZ9W6Lr1A==
X-Received: by 2002:a05:6512:3da9:b0:530:ae4a:58d0 with SMTP id 2adb3069b0e04-53546af3605mr12601930e87.8.1725466549784;
        Wed, 04 Sep 2024 09:15:49 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: [PULL v1 06/12] hw/arm: xenpvh: Move stubbed functions to xen-stubs.c
Date: Wed,  4 Sep 2024 18:15:30 +0200
Message-ID: <20240904161537.664189-7-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904161537.664189-1-edgar.iglesias@gmail.com>
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/arm/meson.build |  5 ++++-
 hw/arm/xen-stubs.c | 32 ++++++++++++++++++++++++++++++++
 hw/arm/xen_arm.c   | 20 --------------------
 3 files changed, 36 insertions(+), 21 deletions(-)
 create mode 100644 hw/arm/xen-stubs.c

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 0c07ab522f..074612b40c 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -59,7 +59,10 @@ arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.
 arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
-arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen_arm.c'))
+arm_ss.add(when: 'CONFIG_XEN', if_true: files(
+  'xen-stubs.c',
+  'xen_arm.c',
+))
 
 system_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
 system_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
diff --git a/hw/arm/xen-stubs.c b/hw/arm/xen-stubs.c
new file mode 100644
index 0000000000..4ac6a56a96
--- /dev/null
+++ b/hw/arm/xen-stubs.c
@@ -0,0 +1,32 @@
+/*
+ * Stubs for unimplemented Xen functions for ARM.
+ *
+ * SPDX-License-Identifier: MIT
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qapi/qapi-commands-migration.h"
+#include "hw/boards.h"
+#include "sysemu/sysemu.h"
+#include "hw/xen/xen-hvm-common.h"
+#include "hw/xen/arch_hvm.h"
+
+void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
+{
+    hw_error("Invalid ioreq type 0x%x\n", req->type);
+    return;
+}
+
+void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
+                         bool add)
+{
+}
+
+void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
+{
+}
+
+void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
+{
+}
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 16b3f00992..f0868e7be5 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -115,26 +115,6 @@ static void xen_init_ram(MachineState *machine)
     memory_region_add_subregion(sysmem, XEN_GRANT_ADDR_OFF, &xen_grants);
 }
 
-void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
-{
-    hw_error("Invalid ioreq type 0x%x\n", req->type);
-
-    return;
-}
-
-void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
-                         bool add)
-{
-}
-
-void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
-{
-}
-
-void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
-{
-}
-
 #ifdef CONFIG_TPM
 static void xen_enable_tpm(XenArmState *xam)
 {
-- 
2.43.0


