Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0EB69F81B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 16:34:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499554.770873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr8O-0005pN-MY; Wed, 22 Feb 2023 15:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499554.770873; Wed, 22 Feb 2023 15:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr8N-0005HY-CL; Wed, 22 Feb 2023 15:34:19 +0000
Received: by outflank-mailman (input) for mailman id 499554;
 Wed, 22 Feb 2023 15:34:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvgA=6S=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pUr8E-0001MH-Nb
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 15:34:10 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58c7bb9a-b2c6-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 16:34:08 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id i9so10367529lfc.6
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 07:34:09 -0800 (PST)
Received: from localhost.localdomain (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25289000000b004db0d26adb4sm927746lfm.182.2023.02.22.07.34.07
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
X-Inumbo-ID: 58c7bb9a-b2c6-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mpbdpWvkQP3NZC61nZP/NPeTV2c8jtDhk5/FkNx/Xw=;
        b=hmD0HnFwUA9POGeBbCmOz3zaonZ39Kq5HvhDBcqw4q4BOOQV/dU0BVezOkVQShkaoM
         ZsXwZKJYYOFCM7MY0jtygaykHy/TqeFJHl/nToc3gyFVK3WEy4QdS3tZJSvsk/2L5Pxd
         24i+LVCwqjOJtB2JPUiQCQajkohPAKRb9SQJayOwH9ayLS/WwM+yem+vjYAGtOxkWbzi
         k1jtSfjVv0jFUXJ+jGK/bDU1WkhAtdbH+0rb3+R1RgnhnDOFxGm4rhsFdzoswJWFXDP2
         wa0lZaL/nZJhSTSKBRaLFZws+puREJRWuRnGrHVsriSZmpv8g9N6+WAd91ybtpI8nwgI
         0xiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mpbdpWvkQP3NZC61nZP/NPeTV2c8jtDhk5/FkNx/Xw=;
        b=EyJe4d9v6CWMr9+CXlOFvGi+YefvsIA8juXmwqL+z8oo5pQws4lBTVCyqmUrqmkdLv
         GV/0Z/A19Mgjm/NoNiTHcvrLMBUcZv+FftLKkrAI9Mal2kfWnEz319edpyqtlSUHeJ98
         Apv1hXupx8JM53Lsgnq+zjjZ3vhLZEJEUAFcc5hGClaSsUNET2fu2Ck6t6b6MSvCSttz
         oolYJEzCRIH66WI9EIo12U4WUnpubwudfVStrdDcDI2gTauK22Fp232Ji2XHJzPHkhct
         G1YCDaQDORmHW0fRYHc7PXgd0Pp0WhcNevCLxZwiCU5DHg89jE79S8+1LDCwpZ4PrYTD
         WRXg==
X-Gm-Message-State: AO0yUKW0scNVQk/EARNBIKtLvgWOkcIqwfLhN5ClHsqfQJu6ZuN6Hk/X
	DOYG1K1HJNm1SQQY5MjDKNZ34f+gCRm6zREQ1KE=
X-Google-Smtp-Source: AK7set+0TRegHa85MMH11cxIFnQQ6a0Xj9077dunvyV3UVJYeFbfsDVnZWDz2A/+evM6CP8tk9cPHQ==
X-Received: by 2002:ac2:4c0f:0:b0:4cb:2c19:ec21 with SMTP id t15-20020ac24c0f000000b004cb2c19ec21mr2816894lfq.0.1677080048376;
        Wed, 22 Feb 2023 07:34:08 -0800 (PST)
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
Subject: [XEN PATCH v7 17/20] xen/arm: ffa: add ABI structs for sharing memory
Date: Wed, 22 Feb 2023 16:33:14 +0100
Message-Id: <50da283fe4a91820a818d13db4ce50fd8414580a.1677079672.git.jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677079671.git.jens.wiklander@linaro.org>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds the ABI structs used by function FFA_MEM_SHARE and friends for
sharing memory.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 74 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index bfd378f7fcd7..94c90b252454 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -197,6 +197,11 @@
 #define FFA_MSG_SEND                    0x8400006EU
 #define FFA_MSG_POLL                    0x8400006AU
 
+/*
+ * Structs below ending with _1_0 are defined in FF-A-1.0-REL and
+ * struct ending with _1_1 are defined in FF-A-1.1-REL0.
+ */
+
 /* Partition information descriptor */
 struct ffa_partition_info_1_0 {
     uint16_t id;
@@ -211,6 +216,75 @@ struct ffa_partition_info_1_1 {
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
+    uint64_t global_handle;
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
+    uint64_t global_handle;
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


