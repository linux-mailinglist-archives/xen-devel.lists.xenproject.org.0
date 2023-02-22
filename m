Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7917F69F816
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 16:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499553.770858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr8L-00055U-U8; Wed, 22 Feb 2023 15:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499553.770858; Wed, 22 Feb 2023 15:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr8K-0004iT-D0; Wed, 22 Feb 2023 15:34:16 +0000
Received: by outflank-mailman (input) for mailman id 499553;
 Wed, 22 Feb 2023 15:34:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvgA=6S=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pUr8C-0001MC-Bc
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 15:34:08 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 589ce21f-b2c6-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 16:34:07 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id g8so6807600lfj.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 07:34:07 -0800 (PST)
Received: from localhost.localdomain (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25289000000b004db0d26adb4sm927746lfm.182.2023.02.22.07.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:34:07 -0800 (PST)
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
X-Inumbo-ID: 589ce21f-b2c6-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhAiY5OLLPHeZBZaC/MjkG52+6CXwzhSsS3y4KPhi9A=;
        b=cky4pHS//IDFn8KcURyNgEQyvp6E4MB4IMdKlCgh47mvVsRQlq9BRRMlVq8DdZL8jb
         eMuzQbcLf4sF/lfyHIHRni4sEPnlikqeVLYcW5Ku+sGPopazRytm7RDXOhc739bzWQsI
         JySIaXdFwJjbsHB2ePyF4iiiWuClN+EUfie3s/rkur03emkjT57nxcpg/0abTSwpQ89S
         mZD/CJtVpeZnvrccbmeva3AsuRZWB4l68xCDfjIYKKVaEPOwVvryAn6PUzOm4ZjnFutJ
         WpHEmbRuXwSd/QQbYwtmz/5SiySYHrNKK4JNk6eSrm97uIVFnlBPofTOjRry2XxdVyLf
         zhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhAiY5OLLPHeZBZaC/MjkG52+6CXwzhSsS3y4KPhi9A=;
        b=i/OCr7sKGqRbCgT3VHvEK1Q30aBJJa2FQjlPWbPQGZWrp2VIXydpOmMPVxQXTULY0j
         EuVJkPaQlHIC2ZpnFPmmi0ubjSPjG+etcFGGgHe/KOPToOsQSICt+aSZgQOe6z/0gjA9
         TFi6vLNcGgGgsN3D9mypiyEbXGqziKJZ2KwzVO6L2X4aFeYY201qlunPEbXwPK0B375A
         mT/FR2HRiqqDNTiiZIm1feKSMAC9l4jBXlXimC/a93M7oXE7WrxPwOx/CzkjCLsCO33H
         ZD5vZC9JxTxrqEVsQcrXINl6SwleOFaYBTnkpMkU7PJq8jmitiuW7uTdY/0ddu0NVMw0
         RPMQ==
X-Gm-Message-State: AO0yUKXzjSJH3yloYpRtBwlRBqCzBjQFyQEWvxoIstqpJqAyVhust2W5
	IKikGaRX5E7SHvyk8XsoEQMySJUmOmgRb0HZ3D4=
X-Google-Smtp-Source: AK7set/kmBjenoML7LDyTljAhBrKRq++3DX/KZvrrW+9a4EJ0hpd35LEVJfNiOGCpNNLk1MoOSkTyg==
X-Received: by 2002:ac2:54b0:0:b0:4d2:72bf:7382 with SMTP id w16-20020ac254b0000000b004d272bf7382mr2950346lfk.37.1677080047369;
        Wed, 22 Feb 2023 07:34:07 -0800 (PST)
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
Subject: [XEN PATCH v7 16/20] xen/arm: ffa: add defines for sharing memory
Date: Wed, 22 Feb 2023 16:33:13 +0100
Message-Id: <ad85591c42f4db3c3001ae4b5572c1096c159593.1677079672.git.jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677079671.git.jens.wiklander@linaro.org>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds defines needed for sharing using the function FFA_MEM_SHARE and
friends.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 57 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 3571817c0bcd..bfd378f7fcd7 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -22,6 +22,14 @@
 #include <asm/tee/ffa.h>
 #include <asm/regs.h>
 
+/*
+ * References:
+ * FF-A-1.0-REL: FF-A specification version 1.0 available at
+ *               https://developer.arm.com/documentation/den0077/a
+ * FF-A-1.1-REL0: FF-A specification version 1.1 available at
+ *                https://developer.arm.com/documentation/den0077/e
+ */
+
 /* Error codes */
 #define FFA_RET_OK                      0
 #define FFA_RET_NOT_SUPPORTED           -1
@@ -66,6 +74,55 @@
  */
 #define FFA_PAGE_SIZE                   SZ_4K
 
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
+ * 512KB. Due to align issue mentioned above, we need to increase this
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
+ * The bits for FFA_NORMAL_MEM_REG_ATTR FFA_MEM_ACC_RW below are
+ * defined in FF-A-1.1-REL0 Table 10.18 at page 175.
+ */
+ /* Memory attributes: Normal memory, Write-Back cacheable, Inner shareable */
+#define FFA_NORMAL_MEM_REG_ATTR         0x2fU
+/* Memory access permissions: Read-write */
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
+
 /* Framework direct request/response */
 #define FFA_MSG_FLAG_FRAMEWORK          BIT(31, U)
 #define FFA_MSG_TYPE_MASK               0xFFU;
-- 
2.34.1


