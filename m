Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD2F7695DA
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 14:16:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572966.897190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoV-0005VE-E7; Mon, 31 Jul 2023 12:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572966.897190; Mon, 31 Jul 2023 12:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoV-0005Qc-9G; Mon, 31 Jul 2023 12:15:51 +0000
Received: by outflank-mailman (input) for mailman id 572966;
 Mon, 31 Jul 2023 12:15:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VuP2=DR=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qQRoT-0003r0-JJ
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 12:15:49 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc10b9dd-2f9b-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 14:15:49 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fe21e7f3d1so4304579e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 05:15:49 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac2430a000000b004fbb1bc1ae0sm2028077lfh.163.2023.07.31.05.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 05:15:47 -0700 (PDT)
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
X-Inumbo-ID: fc10b9dd-2f9b-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690805748; x=1691410548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VXgpYeEzG0m5+ymIEw5RAHkfT6uMITIdBZHbBu8of4=;
        b=ylKMKE+tWA3sQFzkBLH9O/Gvaxr6PeIWBWD5xkoUS5sVPn2oqRMwmZbVjaoBgpm3Mf
         aWk1g3xQVkh5vhQi7WD4zLYhnD17heG1mfAEZlLMv46YNO1x61gV/dU0fNwQ8+GVhKd/
         86G7CKl/GGfUSBGIWAa7TGUE3c2FTedoEdiiVPA7F6lXdKDVU2T/yWHs5+nS1ofWeRwE
         vVU0HG5HzVp5vtQHT1aqfCx4YfiIH9YHnxGtqQJXm6Xzt2bQ0ZULCVja/2Z9j69Wv210
         RksnXvGmHaoNZq3fZXlGsBfmeXX1LgOdjwbTz4nnbR2rVio3Z4b5I3k2BkfMyAxpY6gs
         q41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805748; x=1691410548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VXgpYeEzG0m5+ymIEw5RAHkfT6uMITIdBZHbBu8of4=;
        b=L7cvuoVpNPHqk+WaONjUMG6HRQEKJdXVvqQ6nPO7B4sARXAejH8l/cC0L9UcPw7WTB
         +IZ2JaIHQ3Xris5dsOKrOtRaj1qro+RNBgUx58mJxmSDXsOi5KMBBmztCpsOS8eXH/W/
         LLPkY7cjEy6dIG9tdafejHmcoLla3NQP+zBd/7zbvg83TRgOAQVJ2qYsIvPNa03z1XUw
         mAWTaWNMgFK2hDsuNcgXJSC1rv3OocALGYCiiTsrO1qJRp7wGlI5L7xjVDM1GVfidrEi
         38qX9OSyZLa4i37SL9MBC2zRqA+3v0H9PYeT4U8ZGqqZ9371LsIJm5YHrMFZrmoEl0gi
         NDoA==
X-Gm-Message-State: ABy/qLY2Bhz+ORlz3hcYbJ3YDOf2sV0uCSEC58IvMqmkyPJ7B8t5dxAD
	fIpB8nD6rWSXxQlbNQesKYBtwj85/SEppmISc3A=
X-Google-Smtp-Source: APBJJlHKfP93ROT2ikVBjmRWxK5rgzAl/WYL5PB49C+k4cV0Wxy88iM+jAhYzdMKjMdGYA/zrFaoWg==
X-Received: by 2002:a05:6512:3290:b0:4fb:8939:d95c with SMTP id p16-20020a056512329000b004fb8939d95cmr5346679lfe.30.1690805748405;
        Mon, 31 Jul 2023 05:15:48 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH v11 06/14] xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h
Date: Mon, 31 Jul 2023 14:15:28 +0200
Message-Id: <20230731121536.934239-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731121536.934239-1-jens.wiklander@linaro.org>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moves the two helper functions regpair_to_uint64() and
uint64_to_regpair() from xen/arch/arm/tee/optee.c to the common arm
specific regs.h. This enables reuse of these functions in the FF-A
mediator in a subsequent patch.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
v10->v11
- No changes
---
 xen/arch/arm/include/asm/regs.h | 12 ++++++++++++
 xen/arch/arm/tee/optee.c        | 11 -----------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm/regs.h
index ef34b38aa171..8a0db9541507 100644
--- a/xen/arch/arm/include/asm/regs.h
+++ b/xen/arch/arm/include/asm/regs.h
@@ -60,6 +60,18 @@ static inline bool guest_mode(const struct cpu_user_regs *r)
 register_t get_user_reg(struct cpu_user_regs *regs, int reg);
 void set_user_reg(struct cpu_user_regs *regs, int reg, register_t value);
 
+static inline uint64_t regpair_to_uint64(register_t reg0, register_t reg1)
+{
+    return ((uint64_t)reg0 << 32) | (uint32_t)reg1;
+}
+
+static inline void uint64_to_regpair(register_t *reg0, register_t *reg1,
+                                     uint64_t val)
+{
+    *reg0 = val >> 32;
+    *reg1 = (uint32_t)val;
+}
+
 #endif
 
 #endif /* __ARM_REGS_H__ */
diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index c91bd7d5ac25..5151bd90ed02 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -273,17 +273,6 @@ static int optee_domain_teardown(struct domain *d)
     return 0;
 }
 
-static uint64_t regpair_to_uint64(register_t reg0, register_t reg1)
-{
-    return ((uint64_t)reg0 << 32) | (uint32_t)reg1;
-}
-
-static void uint64_to_regpair(register_t *reg0, register_t *reg1, uint64_t val)
-{
-    *reg0 = val >> 32;
-    *reg1 = (uint32_t)val;
-}
-
 static struct page_info *get_domain_ram_page(gfn_t gfn)
 {
     struct page_info *page;
-- 
2.34.1


