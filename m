Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AA06E077D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:16:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520465.808087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBO-0002gV-OU; Thu, 13 Apr 2023 07:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520465.808087; Thu, 13 Apr 2023 07:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBO-0002bP-HV; Thu, 13 Apr 2023 07:15:50 +0000
Received: by outflank-mailman (input) for mailman id 520465;
 Thu, 13 Apr 2023 07:15:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrBM-0001gq-PI
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:15:48 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 036225ef-d9cb-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 09:15:47 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id d7so28946432lfj.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:15:47 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:15:46 -0700 (PDT)
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
X-Inumbo-ID: 036225ef-d9cb-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370147; x=1683962147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09FoNIBfx/AhxypRHIQzVNktgeSQpjk+3JcEVMVKSbQ=;
        b=mL3AGTAscDTr06MSOYuyOae/9mF5PB5pXeLkrsbHjr7olu0YfJ8Jy5+7ZIUDQG0x/e
         r+bvqpbM2txxDX1PdmXV6Rr8mr0rp8uqqqm+9VxnBFE3x1TPAjZcVMskqm3G5xnlZ4gW
         v4ak64XkvDUjMOkYgUY5KPCsFxiM3UlVYGmackYnC6HlqAoKnUtfMpv/khYJ1MMJbU66
         MD1R1MsSPgAJawf26IakdMQ1Lf8+EQDHRdEVo7NNBWl2ioMhR6D5k88Ru88KE+vJeraX
         RC2ZoqUjsyZoDJsQlj6lFscE96hlR5xbIZW7FDy0ZzDIDVtI+fLqpUBuQ+03HRjbQezk
         7aIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370147; x=1683962147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09FoNIBfx/AhxypRHIQzVNktgeSQpjk+3JcEVMVKSbQ=;
        b=N8owYxrnxmRUUnnJAyx1008JKere+IsFKpEUa7DGvNYVVtrm6kWxsn5LcbRXnaRkFa
         JFmW6jde8GB5X5RkX0kU1Pw/wbcbntju8ACPjpkYckQNWW/UnYlOymCB2rQLhARde5nj
         RoDbEI370RCR9a340W5KJfQnrXb9NJa5rvuH9flhpzOWS29kMeY8QtnhchbgX72bcgX5
         YeQbxP3hHQRM1+WI15RHCXnWgVKUJF+1xIaDpXgkFujN8BOdGFkpvPrDgQGC8NXqX5YP
         qknOovM2OKPWc8KXsK3GN5ePeVuuJajiA7mxp+SXAqFGPeM56AAJ5kuat7q2ItM3MMEa
         oGJA==
X-Gm-Message-State: AAQBX9csACw1OB0PX2ZJxmTyybv3UHfiGLylYibClV86oOrsxqbfn+Us
	ta09cTsEdozi6m0ipf1lPGfZfLF6UOM9LUdhQ8Y=
X-Google-Smtp-Source: AKy350Zu4mlvVFjzT3PBZkyGciR4NH8yu2tbn2rzyYy9BZQSqAIwB2Q8kebTAuck9yLTVDRzxW+ibg==
X-Received: by 2002:ac2:4199:0:b0:4ec:a218:4f8f with SMTP id z25-20020ac24199000000b004eca2184f8fmr509860lfh.8.1681370147122;
        Thu, 13 Apr 2023 00:15:47 -0700 (PDT)
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
Subject: [XEN PATCH v8 05/22] xen/arm: ffa: add flags for FFA_PARTITION_INFO_GET
Date: Thu, 13 Apr 2023 09:14:07 +0200
Message-Id: <20230413071424.3273490-6-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Defines flags used for the function FFA_PARTITION_INFO_GET.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index ba0942e76993..72e7d0575de5 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -57,6 +57,40 @@
 #define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
                                                  FFA_MY_VERSION_MINOR)
 
+/*
+ * Flags to determine partition properties in FFA_PARTITION_INFO_GET return
+ * message:
+ * BIT(0): Supports receipt of direct requests
+ * BIT(1): Can send direct requests
+ * BIT(2): Can send and receive indirect messages
+ * BIT(3): Supports receipt of notifications
+ * BIT(4-5): Partition ID is a PE endpoint ID
+ * BIT(6): Partition must be informed about each VM that is created by
+ *         the Hypervisor
+ * BIT(7): Partition must be informed about each VM that is destroyed by
+ *         the Hypervisor
+ * BIT(8): Partition runs in the AArch64 execution state else AArch32
+ *         execution state
+ */
+#define FFA_PART_PROP_DIRECT_REQ_RECV   BIT(0, U)
+#define FFA_PART_PROP_DIRECT_REQ_SEND   BIT(1, U)
+#define FFA_PART_PROP_INDIRECT_MSGS     BIT(2, U)
+#define FFA_PART_PROP_RECV_NOTIF        BIT(3, U)
+#define FFA_PART_PROP_IS_MASK           (3U << 4)
+#define FFA_PART_PROP_IS_PE_ID          (0U << 4)
+#define FFA_PART_PROP_IS_SEPID_INDEP    (1U << 4)
+#define FFA_PART_PROP_IS_SEPID_DEP      (2U << 4)
+#define FFA_PART_PROP_IS_AUX_ID         (3U << 4)
+#define FFA_PART_PROP_NOTIF_CREATED     BIT(6, U)
+#define FFA_PART_PROP_NOTIF_DESTROYED   BIT(7, U)
+#define FFA_PART_PROP_AARCH64_STATE     BIT(8, U)
+
+/*
+ * Flag used as parameter to FFA_PARTITION_INFO_GET to return partition
+ * count only.
+ */
+#define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
+
 /* Function IDs */
 #define FFA_ERROR                       0x84000060U
 #define FFA_SUCCESS_32                  0x84000061U
-- 
2.34.1


