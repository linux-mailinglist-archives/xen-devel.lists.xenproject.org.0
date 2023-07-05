Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C22748121
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:39:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558932.873543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyyt-0007Wi-DF; Wed, 05 Jul 2023 09:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558932.873543; Wed, 05 Jul 2023 09:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyyt-0007Og-97; Wed, 05 Jul 2023 09:39:27 +0000
Received: by outflank-mailman (input) for mailman id 558932;
 Wed, 05 Jul 2023 09:39:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hy0b=CX=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qGyvA-0005bC-HF
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:35:36 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a477626-1b17-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 11:35:34 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b6fdaf6eefso9840481fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 02:35:34 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q22-20020a2e84d6000000b002b6d8cfb6d2sm2910625ljh.140.2023.07.05.02.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:35:32 -0700 (PDT)
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
X-Inumbo-ID: 4a477626-1b17-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688549733; x=1691141733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcMbvZQAuDfLbcHqMVEHcqz7Bisfyi8R+YRN0ovSOHM=;
        b=pp3m2feVOW0WTQUVdSOeb6fmKUFShrOpu81W4NVgjIS8b5Ty8XCeqWmEjiaq53i0sA
         AY0mAbR41D74t9Rd/4OnXm7ATqCUoOSDaEWRTbdq7ccaK3U7b6af9RK1dK9zV8VX33Dx
         +t7fihSUtPcUreGuXAaupJsZN7uIPnAnDonGWuv878TxHvyzG7wzagtxIpy8CZiu8JMA
         MiuarmJSNxm3wxsgM24VMoBYd5vMT+9GKQzle2tHx3bNWilRu6HVOo6MtJ58V+i+Bufa
         ++SerX5pwn5aPN3lYev8HKp8u6OToA6AFU/+xA2cOjklelZgWiwMfTSWi6vBcn03LiBd
         ShFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549733; x=1691141733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcMbvZQAuDfLbcHqMVEHcqz7Bisfyi8R+YRN0ovSOHM=;
        b=SkHWtVrfo6ejfm+VkEMNxovF+hUVX9sO5sOflftcKcJYexO6rX/GF2mx2e40eG8bO6
         A6d/TWcLn8uO4uUBE88kCeau0RV7ZvL+XYJBUDTBq77BnvKHN2bZOTZfi0UwzY5GKjgd
         45h/p1ngFyh6RXDolS7bJRkCEBN0vdrCsGgVbnchR8oO0Ns7DernqEwW+uzTwbgwQeRj
         I96AReEAdyM90IIf1iIPmcXz3qEZlQI5pfMMz+U77TfnjA1uKL0KrtjHXMYXGwwbCdIc
         RiGfU0BGTqTfxrXptIKbULYC+kLasdzBwPB0v8tSye6rKPeBtBtLk3fiCivJZeWzdt6T
         xd6Q==
X-Gm-Message-State: ABy/qLZDGkx68ZrQjPdfv6ghRSy+TTLYb5ePp4jquZhDAjo6U90Y1hvf
	5YQfV8YlE/CwyGESHhdmTbIhq2Enpf5Y5prSD1Y=
X-Google-Smtp-Source: APBJJlE0gVfOljS8MpbdcMy7JQIw9Ok0b7WsJC3Oc+ZkT6BTFzwoZPfyp/XWTUXKtDzygRVPkRvuiw==
X-Received: by 2002:a2e:3815:0:b0:2b6:a804:4cc with SMTP id f21-20020a2e3815000000b002b6a80404ccmr10458145lja.53.1688549733391;
        Wed, 05 Jul 2023 02:35:33 -0700 (PDT)
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
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH v9 15/24] xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h
Date: Wed,  5 Jul 2023 11:34:24 +0200
Message-Id: <20230705093433.2514898-16-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705093433.2514898-1-jens.wiklander@linaro.org>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
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


