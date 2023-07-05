Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6C4748124
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:39:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558948.873578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyz3-0000EP-IA; Wed, 05 Jul 2023 09:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558948.873578; Wed, 05 Jul 2023 09:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyz3-0000BK-Eq; Wed, 05 Jul 2023 09:39:37 +0000
Received: by outflank-mailman (input) for mailman id 558948;
 Wed, 05 Jul 2023 09:39:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hy0b=CX=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qGyvD-0005bC-Hj
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:35:39 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4baac23b-1b17-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 11:35:36 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b702319893so1064051fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 02:35:36 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q22-20020a2e84d6000000b002b6d8cfb6d2sm2910625ljh.140.2023.07.05.02.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:35:35 -0700 (PDT)
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
X-Inumbo-ID: 4baac23b-1b17-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688549735; x=1691141735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZBEdfHgu5rAc17OpHgYSz2Q4Zpnm6hWeKYd8pGy/wA=;
        b=VapJGscb5IgJCmRF1M/FkdFBn4lJV/Wkqp0/zl1VATS+qXvDKpKe30k0t7lc2LCYbB
         vyFczcjHjWJWxQOkgtUw6VL+aqtFtkygooYvfGWMcciHT97xzvrojDcgGbYgK1u/f1Lm
         2OFG4f7Yc7XgPvN5KhaHenm0q4407tPjWNlRVFQ8A/DLSdIDE8tyPfZ2AZah7a9ppOi3
         pr/lK0si+7k2dPCmnLbeieYe0+cew2BJZ3van1ygtmomihprUSVwNni4TUdmnjG9bimr
         Bh0bISK4kuNhTRNj1ib1yazLnqh4lcrnfJk58CL8bGQDOyp6zDqzpwKub577GUJTqUY6
         2utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549735; x=1691141735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZBEdfHgu5rAc17OpHgYSz2Q4Zpnm6hWeKYd8pGy/wA=;
        b=lqAd7ldkCC2MepOu484Z+FUeb/leJWNllN4C0dp1MPGUbjR3KQsMxORQ40ErkN2Vka
         cTypNJ2izMn8+d/LcvQn/4hfgeXJZY3V5JZN23aZL07Ojx3LLasBcCmuKHEA032rhGws
         l3XjheIJEEC/C94YbR5msPUd1/IvY75ycIWmqLVZa6wkTiZOI6ns5FCzwJ1FnyapCyQS
         HZd8SyDX/5htX+Gx5qYo1ccfSFHby1GGBDLT1sHWeclxKMqDPhc/zCQ41ahgi8ulTNo/
         wCwbsGLU0SBu9SuWh5/+dW2QNdRSzAI7ak2N+vvkDORbKtCwmatLKC+cjLrsvhiyQLWm
         0TOw==
X-Gm-Message-State: ABy/qLZWPZm+VwTZMWorFqBDu5dDkF3ccIPMGYLSsIcXKZI2JFRhkWem
	/KHUOsjSQEY638M88p2RS99XTQ/509uB39fq4yc=
X-Google-Smtp-Source: APBJJlGIZZycqhIAKudqt909+uOsbXnjdgh2GxNsB3tbsqwEgJydSgpmRp2nyDDlRcxBsKlRVOFsNw==
X-Received: by 2002:a2e:8847:0:b0:2b1:e807:f0f with SMTP id z7-20020a2e8847000000b002b1e8070f0fmr11326365ljj.28.1688549735702;
        Wed, 05 Jul 2023 02:35:35 -0700 (PDT)
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
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH v9 17/24] xen/arm: ffa: add ABI structs for sharing memory
Date: Wed,  5 Jul 2023 11:34:26 +0200
Message-Id: <20230705093433.2514898-18-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705093433.2514898-1-jens.wiklander@linaro.org>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
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
index e895e355e620..03699473cfc5 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -243,6 +243,75 @@ struct ffa_partition_info_1_1 {
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


