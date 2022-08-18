Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3C05981BF
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 12:56:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389433.626354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOdCA-0004UT-Le; Thu, 18 Aug 2022 10:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389433.626354; Thu, 18 Aug 2022 10:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOdCA-0004RV-I9; Thu, 18 Aug 2022 10:56:14 +0000
Received: by outflank-mailman (input) for mailman id 389433;
 Thu, 18 Aug 2022 10:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avir=YW=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oOdC9-00040G-Fh
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 10:56:13 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fa6dc2f-1ee4-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 12:56:12 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id z6so1624812lfu.9
 for <xen-devel@lists.xenproject.org>; Thu, 18 Aug 2022 03:56:12 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 y27-20020a0565123f1b00b0048a85334a11sm176837lfa.143.2022.08.18.03.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 03:56:11 -0700 (PDT)
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
X-Inumbo-ID: 5fa6dc2f-1ee4-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=1Fjd1okIgEA9p0C/7C8J1XEejpGqvH+5B4ZTC6XABnY=;
        b=smqX1lmDrMxp+L91C3MJ7EnCARtdlyY3gtDYAvPxsfNpUtN6cn308UJytTo3AzYelL
         vGXBFUfAtpNL5JLV7HgBUmUQtxT/HKB4c1hkxfNsADsOpWIXuzFpK/ve4HNdRkwVIKxl
         2wPOSM13JEoSWrFzvsO6fF6VYvipHAThV+EIHpnRJQoepaZLAudJbOdpFc4CCG3xhwwY
         STMPfr5WUGTnqXnhAXcNVq2v9P+bYhGdYJP6S2VlfdCbs51KV/ilSTlPdDLUfQp5hKgA
         HpWl4ZIfg6ODDtaeUjNnyTbqPNgWmBJX1rQmL0UNFM76sLyn+SWOQrx7o2/8cR938f6p
         5HKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=1Fjd1okIgEA9p0C/7C8J1XEejpGqvH+5B4ZTC6XABnY=;
        b=CGdoFm9eryvH2N62svt0Yu0rA4tmrj9/dYrMuK8F/akKz1iZMTyieHoW5F/OpWqYaO
         cPoBmAzoZ0h4e5Thos0L6PJ+PbR0a/bu7bgKaRvin/r0ujTF9nR7SYNdHPoKLRLwUx4M
         QAy4FpWTNQN8NPgVSqFXIGDsen8AING+tk1HZKTH5PGPURMPAV1Q3KnVyrAg8ZfiBrqn
         Ju3062KsElrxMUWaS9NCDrxnfH/HNud0ZjvK5zrbdTjDpbZOAfr+9PCWRKPtvMvD6W/A
         YGDkfFLzuJskjw4detXur57m/oP8PJ7P34ubxa8IVujnt6WSLQTFBkccOpQNStUrSM9/
         FAwQ==
X-Gm-Message-State: ACgBeo2i0IvaSgdzaFrB8gxXG5w52sfPuL19ZvQ6fRroLGZaohrIsrPY
	OScDDeh8gIg6UB+q0Dmqs5wcTIa8t08IDQ==
X-Google-Smtp-Source: AA6agR4kDGCK2ZnfgTty4u1clmHG1iDq+OLzCTCGDu9isvXMUD0C2oWqZY9lCo6t4fm3OkKZaZcDpg==
X-Received: by 2002:a05:6512:3992:b0:48b:3f6c:9222 with SMTP id j18-20020a056512399200b0048b3f6c9222mr729891lfu.561.1660820171837;
        Thu, 18 Aug 2022 03:56:11 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand.Marquis@arm.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v5 2/9] xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h
Date: Thu, 18 Aug 2022 12:55:54 +0200
Message-Id: <20220818105601.1896082-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220818105601.1896082-1-jens.wiklander@linaro.org>
References: <20220818105601.1896082-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moves the two helper functions regpair_to_uint64() and
uint64_to_regpair() from xen/arch/arm/tee/optee.c to the common arm
specific regs.h.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/include/asm/regs.h | 12 ++++++++++++
 xen/arch/arm/tee/optee.c        | 11 -----------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm/regs.h
index 794721a103a4..977fc3c07f4a 100644
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
2.31.1


