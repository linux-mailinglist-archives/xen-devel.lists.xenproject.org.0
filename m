Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1C9958946
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 16:30:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780534.1190213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPs6-0002U8-3V; Tue, 20 Aug 2024 14:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780534.1190213; Tue, 20 Aug 2024 14:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPs5-0002J6-Su; Tue, 20 Aug 2024 14:30:05 +0000
Received: by outflank-mailman (input) for mailman id 780534;
 Tue, 20 Aug 2024 14:30:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prYO=PT=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sgPs4-0000m9-PW
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 14:30:04 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0c6c0d1-5f00-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 16:30:04 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-530c2e5f4feso5684198e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 07:30:04 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d424725sm1790433e87.249.2024.08.20.07.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 07:30:02 -0700 (PDT)
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
X-Inumbo-ID: b0c6c0d1-5f00-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724164204; x=1724769004; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0gf4AWHulAzAV2HaIyUy+fKTdCex9KA7D9+c05rick=;
        b=mA5c6WzaQYSWFWO4VuzjBbPf1hQ5+gVKIH2/ZIYLfQmCgdi5ZrWwzrNGJ0wf69eguX
         2XDFi5My8xneOOd4asTm8PEnK7Kp1H8Pp9jWzAFxOKXuIFZPPlU2MlwsIqJt3oqpPpKw
         2NNhsgYXei+Rr0JukQQjjUfS9UfvatQUguN6SHwEivWZLyFnpGzmNf3XaxGYvVS8cgdB
         s0iobJyyBlkAF3YzPO5oveM+88amQrTrCCxq3KuIW/tB/Y+f6gfYp2VkeazRADKAfqcH
         PqFXcTrl66btGfAHWwwlmqadZBKKP9Sw5mDJwCXMgStmkc62lGCEaQag4e8NckfRal4g
         UXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164204; x=1724769004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0gf4AWHulAzAV2HaIyUy+fKTdCex9KA7D9+c05rick=;
        b=FMJB4GeezNTE+L3pV38XT6MpWMZkd9Ru14ViPj2zbUApkWPcX24tLHSg3SsViy1WIV
         GBJeShvkUIS0uMvc+kL2eKMaB9xa+OfhJuoyksWyjxRmf3ZCMT4JxGTXHm4AZQfMaMTx
         5BXCbDObmwMKtynRd3Z39Yv51+zu1/jXNYnDNwSWkadBqwN/wsAfCfLueVzaFm2cP/B+
         4zcTFd8iWAV5yZ7goKLUWEFP4wa+dWJn2MFK6RIsIvH6O9UhsuXQaRGUDnbyHR30mHVN
         ZIjKSB4OKE0QyHldU3IwDzuqL6UlsHHLGB6QaE0M1+lO1MVhGZl4YlyW4PFIDQTtE7Ba
         55Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWSFg2P5q0Ti2wIXyFSvmDMo+c9PbF+whj3VstUActugjZC5UUFjPKzdr1gs4eouFJJe8xF+2jcyIQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzz+uIqXy7Y/F19vwGvRHuHK9WUw0vokY5+GLXaM94gSpSaK1I8
	0oWo8yw5mca3EipJDLWvKVXAofJOG8mZnHZXg5VmX0Upfq5hxXK6
X-Google-Smtp-Source: AGHT+IES1gNwxhhoBVLe4AixtVypdxMBk0O0dKwZ1tDvA9tVYLXBSnaAgHk6+BIt+ttxuzPWUzelPw==
X-Received: by 2002:a05:6512:2c98:b0:533:4191:fa47 with SMTP id 2adb3069b0e04-5334191fc44mr1624238e87.47.1724164203068;
        Tue, 20 Aug 2024 07:30:03 -0700 (PDT)
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
Subject: [PATCH v2 06/12] hw/arm: xenpvh: Move stubbed functions to xen-stubs.c
Date: Tue, 20 Aug 2024 16:29:43 +0200
Message-ID: <20240820142949.533381-7-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820142949.533381-1-edgar.iglesias@gmail.com>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
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


