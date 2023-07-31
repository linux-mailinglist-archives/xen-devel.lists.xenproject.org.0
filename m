Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F266F7695D9
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 14:15:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572967.897201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoW-0005p1-Sq; Mon, 31 Jul 2023 12:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572967.897201; Mon, 31 Jul 2023 12:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoW-0005jB-Lm; Mon, 31 Jul 2023 12:15:52 +0000
Received: by outflank-mailman (input) for mailman id 572967;
 Mon, 31 Jul 2023 12:15:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VuP2=DR=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qQRoU-0003r0-Ky
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 12:15:50 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcb18808-2f9b-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 14:15:50 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fe0e23a4b1so6932085e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 05:15:50 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac2430a000000b004fbb1bc1ae0sm2028077lfh.163.2023.07.31.05.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 05:15:48 -0700 (PDT)
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
X-Inumbo-ID: fcb18808-2f9b-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690805749; x=1691410549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91TK2fSJgBDrNg5Gf6mzXvMddHme3pib23sjpSHTPK4=;
        b=V0wqe86VBSiXbh/GxV5ECzB54GWICIbLdhcdwtWNfjxZUXNhQAjKv/BYMd1hC5ge88
         Y0IKkcze6XObSz/dtCHZub2KelLY7HPE5TG18ghaKmcvbaqEVGcDU5jQSj6lhpz4q9NI
         tkSklqRtW5i1fh14CtdMGpcTCVXHDlwfM4FPy3CloQ+DPAWJpgyRoiL1g+7zmA9oFzC0
         s3iZP3//GiqlNicxqqjbicdxtF7Ob2eX8gTm1Km5Vf6bReQIqLP+6hDFMbeAjMdzw9Vw
         c/IocJ11mO4+IiAme2ZsyBZaEnIbR/Uxop5x9eRmN/LaJBOL3TA569JAylXAPtQUoUMj
         iyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805749; x=1691410549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91TK2fSJgBDrNg5Gf6mzXvMddHme3pib23sjpSHTPK4=;
        b=jRoSlp2jlwIGRGNty940REE80Z19tJjomSkHmgG4wEVE6y2uWGgo5e0h9WvLSGCrJj
         bxE7EdCk/mC9WapU1U0LduuJ210bQY5GSL8BzSnCjB3QcavM1d3e1xmkYHyFkCkvNFtI
         74a7pQLHTM7/PztTDtUBVFG39NFh65bQmypt3SMKo80B/8z77hfjvVZ1CvqERyON6GDf
         SrNHQZUa85LKOZO48rYEtwbeuIe9wIpi/N4BsgHx5vyVLHpCg5sbBbx+oXzNpMsS2oxA
         lcpWrsSzos6b+cCEKTeVNYJUJh3BapnV5v+JiQR/bG9Oy1RzYix7q6QrFF/shvRC14bx
         w3Uw==
X-Gm-Message-State: ABy/qLaAs0aE9hI74AUCuTPruTxIIyqzPuxCcIFZQoyiaAgdYEyOANq7
	CmytWVNnKep4iJbkKkr4O2Ytpo3Nr39XxJyJc5I=
X-Google-Smtp-Source: APBJJlGhQLfstVSoA8t0Yv+/XhY3VvcHDySUWZUqNz0i+YUUzC8MSTmVNfhlJqYKZQ8wLlurghV9Iw==
X-Received: by 2002:a05:6512:718:b0:4f6:1779:b1c1 with SMTP id b24-20020a056512071800b004f61779b1c1mr5142914lfs.48.1690805749482;
        Mon, 31 Jul 2023 05:15:49 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH v11 07/14] xen/arm: ffa: add defines for sharing memory
Date: Mon, 31 Jul 2023 14:15:29 +0200
Message-Id: <20230731121536.934239-8-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731121536.934239-1-jens.wiklander@linaro.org>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
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
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
v10->v11
- Adding Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c | 58 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 6c889bf97002..e0d1746f3bfd 100644
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


