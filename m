Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9012755CA8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564192.881609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIYF-0001zI-70; Mon, 17 Jul 2023 07:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564192.881609; Mon, 17 Jul 2023 07:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIYE-0001WB-Af; Mon, 17 Jul 2023 07:21:46 +0000
Received: by outflank-mailman (input) for mailman id 564192;
 Mon, 17 Jul 2023 07:21:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIY9-0005A9-NU
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:41 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92b9e9a9-2472-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 09:21:40 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fd32e611e0so2989703e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:40 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:39 -0700 (PDT)
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
X-Inumbo-ID: 92b9e9a9-2472-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578499; x=1692170499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZBEdfHgu5rAc17OpHgYSz2Q4Zpnm6hWeKYd8pGy/wA=;
        b=iucW60f/fAN0+6ve7OkwZFSP4Oyxoe1jGLAnZjNeH4h3EAn4gPx1KntoldD/UOWOUU
         /0KqzkJGIoTD+zZI9isB7wqPCN2eemCk820mI/J8hDae0Ck0tNXhm5TGCLysYNkFEkzj
         gE7olqlrAHjGtK0b1Q2jZLHjrCNrXWkdFzsmiUoo6OGG20Mmo3n8PYJZe72GjQebgZXM
         9kNUtF9RR8TU6+/+R/M4yet7FWe1/b/cX4iihIEg+M4jHCG0qWEneliSUJMFpD1eKWhm
         MrtiYW6lpomlgeay3er/gedhgOcelonVanztlvli3kzjTAFCyusW2qiunQmaKPoUkXQQ
         q68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578499; x=1692170499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZBEdfHgu5rAc17OpHgYSz2Q4Zpnm6hWeKYd8pGy/wA=;
        b=l27ImCxfZXom6JllSAjqc6puF7thdzkYbkiNW4CgBygVdFh3YxlwMmC5RSh46wG2j7
         Htm9SU8Y3PkDfbOGkNHJs8UMsghdb5/TqBD86DiHwAWruFPmMLqcFqo+3Ner9YUkI+V4
         rj10Mcb5jItnuWWOhF7Ge7O1iAz18BCyvcpLnPCgHsTKwicELBrkLlIsQ2WyJnhFyRcV
         VqXfCsCnkGVK1tESnG+DUd1KpydxD7JdkVybPD47NetcT/err9VcJfqDQrdZAo5/mbIi
         5IeLf/NwQU8puWeu9SNxt4h/BsKf0e5PyTtei0dgZhT+PO1v81uCEAAvS4fYRayAFull
         fYUQ==
X-Gm-Message-State: ABy/qLYzzLXz2kfwGyhlsT827Zw572Akymzvh4eJuNiV8aOXya7fvBr5
	brfTTetvlXRs+p4UKHguQoCBCb7tHT0+7jyU4yQ=
X-Google-Smtp-Source: APBJJlFD4qAYhSmwDwqmvpEfTfkWIvsqG73wtcb94Pi+OjPUt5L2wdqYf/Z0oL6E7tmJUHxaG5FK7A==
X-Received: by 2002:a05:6512:247:b0:4fb:7624:85a5 with SMTP id b7-20020a056512024700b004fb762485a5mr2988561lfo.0.1689578499565;
        Mon, 17 Jul 2023 00:21:39 -0700 (PDT)
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
Subject: [XEN PATCH v10 17/24] xen/arm: ffa: add ABI structs for sharing memory
Date: Mon, 17 Jul 2023 09:21:00 +0200
Message-Id: <20230717072107.753304-18-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
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


