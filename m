Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6E36E077E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:16:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520474.808170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBY-00054J-OI; Thu, 13 Apr 2023 07:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520474.808170; Thu, 13 Apr 2023 07:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBY-0004ob-4t; Thu, 13 Apr 2023 07:16:00 +0000
Received: by outflank-mailman (input) for mailman id 520474;
 Thu, 13 Apr 2023 07:15:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrBV-0001gr-RI
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:15:57 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 087a2851-d9cb-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 09:15:56 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id u12so154347lfu.5
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:15:56 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:15:55 -0700 (PDT)
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
X-Inumbo-ID: 087a2851-d9cb-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370155; x=1683962155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQr8Av63Y05+KRPqQW2MMZI9t0v676Nzga708PFgZbs=;
        b=xvxXEBK2Compws42neNLU7+SQEYWylb37C3YXI+KnyyvdTZWisC+dizJ54qPLe/7BC
         F11IjC/0l2XcefIx8iJhYi3TF+WZWHPvfub72LmSh53AbtCaW9NIy3kY3Qja74ixd6PH
         dbyKlzrPuNpdAPqs4RGvaaVEx6hpV2OCdK1RbrAIyqwpOkJ6V5xMls0Fal+x6mJttwyD
         BXSFedWxmKUb5ec+JCbveQxkxKeJ5szHSwzzAfR9pPIVITVVN2iaOOtNDQYx5la3dSWo
         SZ3GQwv9ZHzTFkBJJDDO2IbPbD3586GTH9NzfXhR/C4dFl6khMr7vgaGNKbaIphF+riY
         vwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370155; x=1683962155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQr8Av63Y05+KRPqQW2MMZI9t0v676Nzga708PFgZbs=;
        b=YoD1S/G4Fn6dunZ6G4PLzQ1PR99OJr3crDXKwhquv5xYIDkHrwfAAk2A+sc+yS8vHe
         zD20h1qm869TlTyPyKSk7h2VxJ/h+AOc9SmCea1iH6rqXSPmVlApxrWE6qxHghW7sSmq
         hdJQr6/mmdmn8Fkf+FOhIEKwf+YOl7Bd67SPPQfAEc5cVHKW8ARdtkck0jQjcRtodWDC
         MmnVd7zhIzFy9BlBoK0+4uTldDkU9eXCV9mScf32I6X/Ie/COcR/Axb3KtNLT7uXoDqE
         TcdPAx46NJaUvDgLgEwNQALUWK3ixJrF5EVmhxD6wdeCyYRdGYnza/qFLILFGI56iBf4
         6ybw==
X-Gm-Message-State: AAQBX9e+aeVqNYZ65eeEnrH1B4Xe0MGJdftf2X//TTlyf4EORUzSPUQi
	CvRgmUFozuzGUPhrJQSiulBBL1KbTlr45TzOR/E=
X-Google-Smtp-Source: AKy350Zs8E4alI77NZ8nPoBbhBLjXrkqVWz+tUygSw+cu9HmXrFfnPMlnm+5FI3jSslmcHKSwGkg1A==
X-Received: by 2002:a19:f00f:0:b0:4eb:2b32:feab with SMTP id p15-20020a19f00f000000b004eb2b32feabmr444477lfc.50.1681370155779;
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
Subject: [XEN PATCH v8 16/22] xen/arm: ffa: add ABI structs for sharing memory
Date: Thu, 13 Apr 2023 09:14:18 +0200
Message-Id: <20230413071424.3273490-17-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds the ABI structs used by function FFA_MEM_SHARE and friends for
sharing memory.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c | 69 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 58c581c8ffc7..f3e05911e16e 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -245,6 +245,75 @@ struct ffa_partition_info_1_1 {
     uint8_t uuid[16];
 };
 
+/* Constituent memory region descriptor */
+struct ffa_address_range {
+    uint64_t address;
+    uint32_t page_count;
+    uint32_t reserved;
+};
+
+/* Composite memory region descriptor */
+struct ffa_mem_region {
+    uint32_t total_page_count;
+    uint32_t address_range_count;
+    uint64_t reserved;
+    struct ffa_address_range address_range_array[];
+};
+
+/* Memory access permissions descriptor */
+struct ffa_mem_access_perm {
+    uint16_t endpoint_id;
+    uint8_t perm;
+    uint8_t flags;
+};
+
+/* Endpoint memory access descriptor */
+struct ffa_mem_access {
+    struct ffa_mem_access_perm access_perm;
+    uint32_t region_offs;
+    uint64_t reserved;
+};
+
+/* Lend, donate or share memory transaction descriptor */
+struct ffa_mem_transaction_1_0 {
+    uint16_t sender_id;
+    uint8_t mem_reg_attr;
+    uint8_t reserved0;
+    uint32_t flags;
+    uint64_t handle;
+    uint64_t tag;
+    uint32_t reserved1;
+    uint32_t mem_access_count;
+    struct ffa_mem_access mem_access_array[];
+};
+
+struct ffa_mem_transaction_1_1 {
+    uint16_t sender_id;
+    uint16_t mem_reg_attr;
+    uint32_t flags;
+    uint64_t handle;
+    uint64_t tag;
+    uint32_t mem_access_size;
+    uint32_t mem_access_count;
+    uint32_t mem_access_offs;
+    uint8_t reserved[12];
+};
+
+/* Endpoint RX/TX descriptor */
+struct ffa_endpoint_rxtx_descriptor_1_0 {
+    uint16_t sender_id;
+    uint16_t reserved;
+    uint32_t rx_range_count;
+    uint32_t tx_range_count;
+};
+
+struct ffa_endpoint_rxtx_descriptor_1_1 {
+    uint16_t sender_id;
+    uint16_t reserved;
+    uint32_t rx_region_offs;
+    uint32_t tx_region_offs;
+};
+
 struct ffa_ctx {
     void *rx;
     const void *tx;
-- 
2.34.1


