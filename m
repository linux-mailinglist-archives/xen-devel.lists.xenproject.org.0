Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB776E0795
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:19:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520534.808264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrEs-0005aE-5e; Thu, 13 Apr 2023 07:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520534.808264; Thu, 13 Apr 2023 07:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrEs-0005YN-2R; Thu, 13 Apr 2023 07:19:26 +0000
Received: by outflank-mailman (input) for mailman id 520534;
 Thu, 13 Apr 2023 07:19:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrBU-0001gq-Qo
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:15:56 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0823b4e8-d9cb-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 09:15:55 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id m4so17676305lfj.13
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:15:55 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:15:54 -0700 (PDT)
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
X-Inumbo-ID: 0823b4e8-d9cb-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370155; x=1683962155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pVvJSmvEUbWoR8Cd3hbfPcIyCeeGauP1BW/rZN5S8A=;
        b=RNWnGeHLfTdsBTj5l1au/ZPEzs0NX4KpVVgZq3rrBHb2zkglV7qAy9hipsYphVje+K
         d8xDdthy83lot7BtgNvicD6dVPsyZFv7bg5MfTvH9A/EvuRxYRSPf5cnzSNaoyNd+Ylk
         iHTl8GiMQMGMGebCKZLMZ4qngMBiz4NsjkI8S4XopdD6xnPyig/tQbPOiOX/nnBapHx8
         OnIsHydBrAUiGBbHOQ8Zp/hRcjqOHrEUUcX+7iNSe2E6eXa62GOEW90XldApCFVbLNXg
         X4YRtzOG8vPcnbNCViNmn6nuFuPARWZ5OE7gCPtLS4rmMXXDPjzpigisTYTFJ37b7pLU
         LWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370155; x=1683962155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pVvJSmvEUbWoR8Cd3hbfPcIyCeeGauP1BW/rZN5S8A=;
        b=gQlRvEv77admM5hxR8ltLqdI9yn6hoHo7K9k8VH3ErrAtm0H4qHra68q4+zuBxL6dx
         MMxmaw3Ji90lXG85dpkNajKaDJgj5rMUd+g9f6wPjprZPzYq89rkZWoqDliHW8sM9tX/
         l5EH6LtXzD/C+ztYfcT74/GOO9Y9j0VrKIrFBZBlfC4riNRWu14+lxJALbMu+U8c/jy1
         WHwA9/LpQrhKvcPwi3YfBs91OaQNVLokQGkcEA9br1uQncv2lat6YBlwfOCqgUKLg9nI
         racTcAxa4+rm6x9wz6z7A9Nz2FChIYkI/aFjqSrA1HtLkFGIairCgAUZHJtzW6OKTGv4
         17qg==
X-Gm-Message-State: AAQBX9cDwrzhNsigzQJlDPZqhD02aL0o+5KR8flpVZ7Ot+AcqAug4+5f
	iAawriKTq+YrGyPySZNl4+n1+K8wS31LB5Zbmy8=
X-Google-Smtp-Source: AKy350aISGmyJtT6PnyRYtke2nmyaEfxDFKxQorAbQ5fkpsNjHgfVnvRPhyT/3byMsJ8NdgcOkumvA==
X-Received: by 2002:ac2:5296:0:b0:4eb:11c:f83 with SMTP id q22-20020ac25296000000b004eb011c0f83mr599448lfm.49.1681370155064;
        Thu, 13 Apr 2023 00:15:55 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH v8 15/22] xen/arm: ffa: add defines for sharing memory
Date: Thu, 13 Apr 2023 09:14:17 +0200
Message-Id: <20230413071424.3273490-16-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds defines needed for sharing using the function FFA_MEM_SHARE and
friends.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 60 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 74b8c517afb8..58c581c8ffc7 100644
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
@@ -80,6 +88,58 @@
  */
 #define FFA_MAX_RXTX_PAGE_COUNT         32
 
+/*
+ * Limit for shared buffer size. Please note that this define limits
+ * number of pages. But user buffer can be not aligned to a page
+ * boundary. So it is possible that user would not be able to share
+ * exactly FFA_MAX_SHM_BUFFER_PG * FFA_PAGE_SIZE bytes.
+ *
+ * FF-A doesn't have any direct requirments on GlobalPlatform or vice
+ * versa, but an implementation can very well use FF-A in order to provide
+ * a GlobalPlatform interface on top.
+ *
+ * Global Platform specification for TEE requires that any TEE
+ * implementation should allow to share buffers with size of at least
+ * 512KB, defined in TEEC-1.0C page 24, Table 4-1,
+ * TEEC_CONFIG_SHAREDMEM_MAX_SIZE.
+ * Due to align issue mentioned above, we need to increase this
+ * value with one.
+ */
+#define FFA_MAX_SHM_PAGE_COUNT          (SZ_512K / FFA_PAGE_SIZE + 1)
+
+/*
+ * Limits the number of shared buffers that guest can have at once. This
+ * is to prevent case, when guests tricks XEN into exhausting its own
+ * memory by allocating many small buffers. This value has been chosen
+ * arbitrary.
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


