Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F35748125
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:39:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558960.873588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyz5-0000gE-VX; Wed, 05 Jul 2023 09:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558960.873588; Wed, 05 Jul 2023 09:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyz5-0000eE-Nv; Wed, 05 Jul 2023 09:39:39 +0000
Received: by outflank-mailman (input) for mailman id 558960;
 Wed, 05 Jul 2023 09:39:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hy0b=CX=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qGyvC-0005bC-Hh
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:35:38 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b053be9-1b17-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 11:35:35 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f954d7309fso661802e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 02:35:35 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q22-20020a2e84d6000000b002b6d8cfb6d2sm2910625ljh.140.2023.07.05.02.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:35:34 -0700 (PDT)
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
X-Inumbo-ID: 4b053be9-1b17-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688549734; x=1691141734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jd1PqoKu3zNmxIHhUbgtRR0UeglIV+SwdMxJBYTSy/E=;
        b=FyL+sojBuZm/elrnCYhlczxOzQWpPWmPl8isP57HPXDdhoMHYoKUusoO22frV6d+QD
         XZixMu173FNWtayEXgoA9jb5K1OiB1ATZLF0bC9OIw2mLHZUADpIJpVBHsqREO24PUCq
         eyKs3uOiTYjEBLe+l3rXkDEIYYM0NbG5owAbwkmCGGuBgyZeLsw1IFIObSSRRzozVizf
         sZN3c17+6GiGyOTcfmPcHurn0nirO8Pd7tOyw4hjtbTCTjptiMxnSfORdOwSzty/OJ6N
         xuQLAx2MoA+Tq1TE401VXlZo/3ZX//w2Ln+xp9HWROBF+wR3Q7fMe80WAm6vqYJMi5dQ
         zttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549734; x=1691141734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jd1PqoKu3zNmxIHhUbgtRR0UeglIV+SwdMxJBYTSy/E=;
        b=LqWGZajekorbQXW1+QI4RWPtRENhEn+YTxtF38OVwTGMie15qdBwRsncTMR87Zqn4k
         9QyKMi2VAglapMJg8ECBx6kSkQTeBYYtEcPHGQECu1a4hSiV0QfEJIBLYbShDQN3gi4S
         q0yWMsM4+g3cUeeolm4MtuH8ipvhtfm/nmRWX9Z8tInlKavpyJCNyhFrokFt7dEEPI/2
         qCm6HU3L/WyqQxTejOjGgFh5JkbQgj392Tqfc+8dvzF9n3vY9HMB1raYDqs4pIjKNg28
         872uzd7bjEbn5m/QQtcuext2eljNGMvVLyEZw07YNMc1gADYpNucU/vu0XKp64Ys05QC
         K+dA==
X-Gm-Message-State: ABy/qLYVi4XtVXmQ6QzexDG0VoeKxJojr8gZtqpfV+bJumUOyoZi0GFN
	+sCdfHxk/YUWKwzF/DCAySuUlaDzmsSJ5BxLRbM=
X-Google-Smtp-Source: APBJJlHPM8fpcFFS2935sU4w8P/nYq1uPlNDlVSDk7rIgrQVGG3GkRebkD2L+5ufvFxZ0cpNyjKWVQ==
X-Received: by 2002:a05:6512:1588:b0:4fb:7758:4ec0 with SMTP id bp8-20020a056512158800b004fb77584ec0mr681199lfb.24.1688549734512;
        Wed, 05 Jul 2023 02:35:34 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand.Marquis@arm.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH v9 16/24] xen/arm: ffa: add defines for sharing memory
Date: Wed,  5 Jul 2023 11:34:25 +0200
Message-Id: <20230705093433.2514898-17-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705093433.2514898-1-jens.wiklander@linaro.org>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to DEN0077A version 1.1 REL0
- Section 10.9.2 Memory region handle, page 167
- Table 10.18 at page 175
- Table 10.15 at page 168
- Section 10.11.4 Flags usage, page 184-187
add defines needed for sharing using the function FFA_MEM_SHARE and
friends.

Also add limits for how many shared buffers that a guest can have at
once and how large a shared buffer can be at most.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/arm/tee/ffa.c | 58 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index d5748b9ce88c..e895e355e620 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -5,6 +5,14 @@
  * Arm Firmware Framework for ARMv8-A (FF-A) mediator
  *
  * Copyright (C) 2023  Linaro Limited
+ *
+ * References:
+ * FF-A-1.0-REL: FF-A specification version 1.0 available at
+ *               https://developer.arm.com/documentation/den0077/a
+ * FF-A-1.1-REL0: FF-A specification version 1.1 available at
+ *                https://developer.arm.com/documentation/den0077/e
+ * TEEC-1.0C: TEE Client API Specification version 1.0c available at
+ *            https://globalplatform.org/specs-library/tee-client-api-specification/
  */
 
 #include <xen/bitops.h>
@@ -80,6 +88,56 @@
  */
 #define FFA_MAX_RXTX_PAGE_COUNT         1
 
+/*
+ * Limit for shared buffer size. Please note that this define limits
+ * number of pages.
+ *
+ * FF-A doesn't have any direct requirements on GlobalPlatform or vice
+ * versa, but an implementation can very well use FF-A in order to provide
+ * a GlobalPlatform interface on top.
+ *
+ * Global Platform specification for TEE requires that any TEE
+ * implementation should allow to share buffers with size of at least
+ * 512KB, defined in TEEC-1.0C page 24, Table 4-1,
+ * TEEC_CONFIG_SHAREDMEM_MAX_SIZE.
+ * Due to overhead which can be hard to predict exactly, double this number
+ * to give a safe margin.
+ */
+#define FFA_MAX_SHM_PAGE_COUNT          (2 * SZ_512K / FFA_PAGE_SIZE)
+
+/*
+ * Limits the number of shared buffers that guest can have at once. This
+ * is to prevent case, when guests trick XEN into exhausting its own
+ * memory by allocating many small buffers. This value has been chosen
+ * arbitrarily.
+ */
+#define FFA_MAX_SHM_COUNT               32
+
+/* FF-A-1.1-REL0 section 10.9.2 Memory region handle, page 167 */
+#define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
+#define FFA_HANDLE_INVALID              0xffffffffffffffffULL
+
+/*
+ * Memory attributes: Normal memory, Write-Back cacheable, Inner shareable
+ * Defined in FF-A-1.1-REL0 Table 10.18 at page 175.
+ */
+#define FFA_NORMAL_MEM_REG_ATTR         0x2fU
+/*
+ * Memory access permissions: Read-write
+ * Defined in FF-A-1.1-REL0 Table 10.15 at page 168.
+ */
+#define FFA_MEM_ACC_RW                  0x2U
+
+/* FF-A-1.1-REL0 section 10.11.4 Flags usage, page 184-187 */
+/* Clear memory before mapping in receiver */
+#define FFA_MEMORY_REGION_FLAG_CLEAR            BIT(0, U)
+/* Relayer may time slice this operation */
+#define FFA_MEMORY_REGION_FLAG_TIME_SLICE       BIT(1, U)
+/* Clear memory after receiver relinquishes it */
+#define FFA_MEMORY_REGION_FLAG_CLEAR_RELINQUISH BIT(2, U)
+/* Share memory transaction */
+#define FFA_MEMORY_REGION_TRANSACTION_TYPE_SHARE (1U << 3)
+
 /*
  * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
  * BIT(31): Framework or partition message
-- 
2.34.1


