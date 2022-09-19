Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE495BC520
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 11:13:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408582.651415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCpn-00017f-7R; Mon, 19 Sep 2022 09:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408582.651415; Mon, 19 Sep 2022 09:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCpm-00010h-VV; Mon, 19 Sep 2022 09:12:58 +0000
Received: by outflank-mailman (input) for mailman id 408582;
 Mon, 19 Sep 2022 09:12:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3sJ0=ZW=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oaCpl-0007Fl-AH
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 09:12:57 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33473681-37fb-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 11:12:35 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id y14so2632639ljn.7
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 02:12:56 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 f3-20020a05651c02c300b0025fdf1af42asm4815394ljo.78.2022.09.19.02.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 02:12:55 -0700 (PDT)
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
X-Inumbo-ID: 33473681-37fb-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=MVzlwh9ZWd5r9tSvwBW+tgS5BQq9td5KtU8nL+38bko=;
        b=kdNv91pcvqhyO1pdo68gLMXnqms2yVDgV4Uk3jzf6bJd9lmapkd6rxGCusajFPTUbr
         XCtEuF5zjv6aDT1JApxnXcfSCqR9U4p9eWLXbYKYskybt44htZQrSRIazXxcvAAzkqk4
         RBC0zYTd+5gS0jsXaOkQzGZ9d2tPoevk2xjPJ+3Z6LgIUyWQvxa9ldCdxG1Mh5F1P0kR
         n2lJtl3adv0Q8+7aiynX6b34lpU5Xj4A4NOAVMjvcVvhU+e6J1KDicoME/bP8kP7e45/
         swe9ydS+ON5sYHwPDT2hDGoXHNvpXEtHMpk/HaqIF6EKECb+Xq9M646MfdqXz+uMrRp+
         FsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=MVzlwh9ZWd5r9tSvwBW+tgS5BQq9td5KtU8nL+38bko=;
        b=j6Dbf/jBwRpibTYg0vdsde9woKNkbyWr1Ab8wyDyAAap5HinSjCoLKBqpRho7IpbcG
         WjdXhWo+wnIiK1lVZjAAISr0Leq3lnEkzCmsGQLeQr/EVrs0HS37ooqwqoyW05jmj9G3
         kYQYino7j4Jgdn3aB4lXbV+oIznpaG3aNnbepfAD4DgxNum8zvf6bYdAYR9pOM4ht751
         1z/y0BCORbUYHZtimnex2KAKTEdeMlBpG8Ef6SeUdROzoi38oMWauf3Jsmos/81wabNi
         ueDAYPQMTni5VUHsivH3z6Ke7T9Ea+pnRghA0Qd5trXw2H3WoD3p6PuD0IY+kkrwrwJw
         sB8g==
X-Gm-Message-State: ACrzQf0e8qlMDdXvQpXO7eaFLRAFFdZx9kwNYfm+oFlPq9nMsn1H18VM
	nL736V5Ux0tp6lFP1GiPk1UQhLYfjKAfYVUe
X-Google-Smtp-Source: AMsMyM4kUE+fIr13DjUJsuyY1YVO4KHee+mVnrgYsumRL9/jGqomHHpREwMRjN3WqVrGQOfxV9q20w==
X-Received: by 2002:a05:651c:1141:b0:261:6ea9:ac97 with SMTP id h1-20020a05651c114100b002616ea9ac97mr5043579ljo.434.1663578775902;
        Mon, 19 Sep 2022 02:12:55 -0700 (PDT)
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
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v6 8/9] xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h
Date: Mon, 19 Sep 2022 11:12:37 +0200
Message-Id: <20220919091238.2068052-9-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220919091238.2068052-1-jens.wiklander@linaro.org>
References: <20220919091238.2068052-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moves the two helper functions regpair_to_uint64() and
uint64_to_regpair() from xen/arch/arm/tee/optee.c to the common arm
specific regs.h. This enables reuse of these functions in the FF-A
mediator in a subsequent patch.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
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
2.31.1


