Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4967695E0
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 14:16:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572968.897207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoX-0005zW-IG; Mon, 31 Jul 2023 12:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572968.897207; Mon, 31 Jul 2023 12:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoX-0005rU-D2; Mon, 31 Jul 2023 12:15:53 +0000
Received: by outflank-mailman (input) for mailman id 572968;
 Mon, 31 Jul 2023 12:15:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VuP2=DR=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qQRoV-0003r0-PJ
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 12:15:51 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd64c346-2f9b-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 14:15:51 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe07f0636bso7121423e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 05:15:51 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac2430a000000b004fbb1bc1ae0sm2028077lfh.163.2023.07.31.05.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 05:15:50 -0700 (PDT)
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
X-Inumbo-ID: fd64c346-2f9b-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690805750; x=1691410550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ra6bzn7NO+Bj2QIqg1KOF4qCATzBH3WWnRdNuT2ZsJk=;
        b=jsPWksmQaVnXCdmZ0VKCJytk2yXrXjtkIS1Jqd9Ht5F4lFa8BVhrdSeLd1XqrLdUnF
         WX2RFQ5f+uaAvQDO09ANKhhIHoibC7td8iPebZC3Z+5pvxeGPyI0gd1fgBWLXGR/vv9Z
         5RrkMuQunnMjxgRQc7AqDywMxl5pwwlSLselyQHWuA1PCEVuPr/ZhDvNDZMuAMCLgGil
         0v3rE1fSY+rx3rzz79QNUJsklmNXZREgpjFxAX5/THhr9Sp7bVGDyYmi10n5DDBJpkDw
         3ltUpR6NcEl6iloXWhbHf0j3u1pPDFlfaJC0cMUk1mqZODNPd/sFHJjgAkB5spaGVlFR
         ZBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805750; x=1691410550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ra6bzn7NO+Bj2QIqg1KOF4qCATzBH3WWnRdNuT2ZsJk=;
        b=Lwys28J2PwQjOlfWO1cUjlU8NB7X2o4A2+Ws8KqBcPD7nVAmuOierja4cvFnGOJ6AZ
         ix1o6/1JQzZmpYom0XPzWQ1l8UwuXB9frIA+AOYcsCT17I04CgD+fo+D9AEVJaMhidzl
         rpHp8IES9+n301tPdiSvMcpvvohejoIheOKjA2PPaz4K9SVE4Apfnm6Kldj/JADvmVvR
         G56R9mrs51gPWUaIFnULf29HPT/PBx59KCWPOzBV6tBUgipAgZK6mnsc7NnAfmbklPNm
         dFYYgDe7DONZ1g3nHfhNQnYY6Z2rcpJtwrzS2Va+2K9beIuPDQFdwma5KkQ+vzSOzirN
         csHQ==
X-Gm-Message-State: ABy/qLbCimhsYE1yIrTjNWSddfePcISFHTy4mMKvpbE2DEh47pfErF0W
	sdQuT5u/EVcOmMDFHQvpVD7DgDlNJfG3lRgg12Q=
X-Google-Smtp-Source: APBJJlG56YNcj8dVMPrIORRIRMloOKThCd3L3exybXwsNk8fmMggAuHfiku9rUraKur4MeQpSuK1lA==
X-Received: by 2002:a19:7401:0:b0:4f9:69af:9857 with SMTP id v1-20020a197401000000b004f969af9857mr4090577lfe.51.1690805750658;
        Mon, 31 Jul 2023 05:15:50 -0700 (PDT)
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
Subject: [XEN PATCH v11 08/14] xen/arm: ffa: add ABI structs for sharing memory
Date: Mon, 31 Jul 2023 14:15:30 +0200
Message-Id: <20230731121536.934239-9-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731121536.934239-1-jens.wiklander@linaro.org>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds the ABI structs used by function FFA_MEM_SHARE and friends for
sharing memory.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
v10->v11
- No changes
---
 xen/arch/arm/tee/ffa.c | 69 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index e0d1746f3bfd..9927fdf78af5 100644
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


