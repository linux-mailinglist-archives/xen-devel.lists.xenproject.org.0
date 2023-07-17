Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D41755CB3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:22:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564191.881600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIYC-0001Bh-23; Mon, 17 Jul 2023 07:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564191.881600; Mon, 17 Jul 2023 07:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIYB-0000yH-6X; Mon, 17 Jul 2023 07:21:43 +0000
Received: by outflank-mailman (input) for mailman id 564191;
 Mon, 17 Jul 2023 07:21:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIY8-0005A9-QR
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:40 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 921d04c3-2472-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 09:21:39 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fb9ae4cef6so6518481e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:39 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:38 -0700 (PDT)
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
X-Inumbo-ID: 921d04c3-2472-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578498; x=1692170498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jd1PqoKu3zNmxIHhUbgtRR0UeglIV+SwdMxJBYTSy/E=;
        b=nvPCYn3abnrPXljDHRPFHr15KbPB3Cc2Tyw+MorT0s3B9IqRXnG88MbbEyfI7ypTXT
         WMYjHTRAVCnK3ucnJGH+IIM1fi0OJS4gRncdC1/u9eJSztM7D554l2vGB6qftAL+DW2K
         X6mm1S/lQUrAwoEcboi0aUrOF2rFXerWy4d0yqgSBGPq4quZBLnQZ1hSSkf0bijm1twq
         7x+jhkhD98MdLfv2hOTOOc4pCf4fWRQyPoSu80NeiGsYDsq6DjiEQQNIuhwQQX1T0dBK
         nndz/9Z9iZgMWQnx6eDWHvadXG0bTkBEcmjK7Hb95Dk0LZs1Ic642RwNW5fanYRsnaNF
         nU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578498; x=1692170498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jd1PqoKu3zNmxIHhUbgtRR0UeglIV+SwdMxJBYTSy/E=;
        b=ldDLSD+cGqgk4O9dTHkJvAM2rgQ8BnkzlCwe8oY9ZBXbDvl8NV7kXp2ijXrNEQvIxf
         1uE4MYY9G5fjAMZh+qOSfF8Hy72EtzUqR4p8Gg2m9w/Ih2FBGdoBNN6rnb+CWrn23nED
         EySPlR1cTDdHQIscDj077Y5LRpQW8FNFAwkpvZQ0cEMkaFV4P0p0IwPk656otHk5qsmc
         7rDc1S0wIAzFLVEtQc5aaCo2ATGkgVerGVtagdm0ygxkBGIVqAqAzSaBsKb0LlmTBk5C
         tSPh+jTrYDtW30L9EnHamG2wJVnCSR8r4/4JXoyLokfKmJCO4Iqdl1kEdFD3jPnoi5OZ
         OzAQ==
X-Gm-Message-State: ABy/qLbT2AO24MGSFjS6lZDpRK30AsHtS36LKcLXsQBZZNQGnGg/2wuL
	SxM8tRGK2RRvo67+L5z5IDtRNtPmQxlgryvvd+U=
X-Google-Smtp-Source: APBJJlFeGStcIAq8SjQ4HIsWMMxT/QdM8hZ/oScthPFdYUluUmJJtPdwGV1PkhIV44GGEQwQpjfibA==
X-Received: by 2002:a05:6512:1320:b0:4f8:7803:64e6 with SMTP id x32-20020a056512132000b004f8780364e6mr6704992lfu.41.1689578498489;
        Mon, 17 Jul 2023 00:21:38 -0700 (PDT)
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
Subject: [XEN PATCH v10 16/24] xen/arm: ffa: add defines for sharing memory
Date: Mon, 17 Jul 2023 09:20:59 +0200
Message-Id: <20230717072107.753304-17-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
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


