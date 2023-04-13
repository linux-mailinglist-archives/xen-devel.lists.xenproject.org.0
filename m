Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED7D6E0792
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:19:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520513.808253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrEU-0004fK-Ta; Thu, 13 Apr 2023 07:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520513.808253; Thu, 13 Apr 2023 07:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrEU-0004cl-QU; Thu, 13 Apr 2023 07:19:02 +0000
Received: by outflank-mailman (input) for mailman id 520513;
 Thu, 13 Apr 2023 07:19:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrBT-0001gq-Qa
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:15:55 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07a336ea-d9cb-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 09:15:54 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id z8so19679568lfb.12
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:15:54 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.53
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
X-Inumbo-ID: 07a336ea-d9cb-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370154; x=1683962154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTVH9FKVgFMYmzPdlzuBZ/KTps+v6zvJIPz4zAQrzVk=;
        b=qhns4ayM4yU9XmaqWG8lePkqfyjARvlK8qOXmAnt7exl47vJPlIG7GOkizIDKe85cr
         87B0Z17dFrb952cUnI1MkOTr/HHEqF3hVUvroNHzidG61Ks6lKtj7GDQlyTuvrTKkNQP
         e94BO3L+xfeNkOIHfEVkAGp9SUDdTSmPkLHxjHeXfbEzjy9iGpqbR4hIEXEv85aO0zva
         Yv2chyl12UQxsl7Po0tVJd6H1bWn5s8M0qdNZjN6bjNMhyLF3FvmtPn4cLkoogsZmKSD
         1Bdt0EZLdxHxx0SkwX1NMR3eRhr6mmmoLS6mby0jvNPUYCa3m35mzaBLDzmSPImhrATt
         cQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370154; x=1683962154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OTVH9FKVgFMYmzPdlzuBZ/KTps+v6zvJIPz4zAQrzVk=;
        b=WLvMSN6h0a0jcAzxXgayxQWZdgcXLJdCSnTV7SYabHcqltDfmTgyMoaLDWTdfenSne
         nXPQ2sPpriK2ftciTOE9oCS9feEaATJzPYeCrWguFwiznjQ9Mv4Gl7hkx0hkq+f58JnJ
         5cn7skFunvEGzGlhuKJjJolLdRD8j3qoH+lxt4/AjddOyXlZh69D/ER4tugqQ1BkJaP2
         OYm2CSiWGZwT1Syvb3ksBCXxr0gV74iNdw7vtVnP3Sk0svZ+eWEQgxI8AX/f2E2v38uP
         FyDrKYZBDt+Nt27DXdRrcuztJWwmm8N7we1D656jr27H5PdmgDepa632BEwzpcYM0pDF
         P4/w==
X-Gm-Message-State: AAQBX9e69hFDvBwEi+xQR8nlwrKixceYRfzoLGKR+hxMeowWKJIHrrdx
	h19aV6mq3ZRSgrgcjVBAOEyPLSvdKI5uu12GT4k=
X-Google-Smtp-Source: AKy350az7dkINsL9Mv2dlGn6+WRY2SwA1BjsfL4s8/eqQ95rDG24jwsgOfVPQduKpoGhhcELdoJTTg==
X-Received: by 2002:ac2:592a:0:b0:4eb:3021:3a8f with SMTP id v10-20020ac2592a000000b004eb30213a8fmr580571lfi.61.1681370154377;
        Thu, 13 Apr 2023 00:15:54 -0700 (PDT)
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
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v8 14/22] xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h
Date: Thu, 13 Apr 2023 09:14:16 +0200
Message-Id: <20230413071424.3273490-15-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moves the two helper functions regpair_to_uint64() and
uint64_to_regpair() from xen/arch/arm/tee/optee.c to the common arm
specific regs.h. This enables reuse of these functions in the FF-A
mediator in a subsequent patch.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/include/asm/regs.h | 12 ++++++++++++
 xen/arch/arm/tee/optee.c        | 11 -----------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm/regs.h
index 0693a681315f..aa39e83ee5f4 100644
--- a/xen/arch/arm/include/asm/regs.h
+++ b/xen/arch/arm/include/asm/regs.h
@@ -60,6 +60,18 @@ static inline bool guest_mode(const struct cpu_user_regs *r)
 register_t get_user_reg(struct cpu_user_regs *regs, int reg);
 void set_user_reg(struct cpu_user_regs *regs, int reg, register_t val);
 
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
index 9cb9f16d43cb..47027ecef47c 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -268,17 +268,6 @@ static int optee_domain_init(struct domain *d)
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


