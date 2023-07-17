Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855C5755CA6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:22:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564190.881594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIYA-0000wz-Kt; Mon, 17 Jul 2023 07:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564190.881594; Mon, 17 Jul 2023 07:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIY9-0000lq-V4; Mon, 17 Jul 2023 07:21:41 +0000
Received: by outflank-mailman (input) for mailman id 564190;
 Mon, 17 Jul 2023 07:21:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIY7-0005A9-IP
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:39 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 916f14b0-2472-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 09:21:38 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f954d7309fso5144996e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:38 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:36 -0700 (PDT)
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
X-Inumbo-ID: 916f14b0-2472-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578497; x=1692170497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcMbvZQAuDfLbcHqMVEHcqz7Bisfyi8R+YRN0ovSOHM=;
        b=wQrqM2t2606UV0OnFoV2KErLEwJQoYnzx747nLlbR+U3DbAlXjM5LrRtBVRMkkn8HC
         HyJCITUZwZy/XJoFrplzmTu86j9+Skn8tQWH+CA5fP9jNJ+/cef22S1L5ZxngOSoQwXU
         Yb3kOKHIPp6Wm4jqDcBdsnkWWSN7tT1o/hc8xCWOUjCfXUK+kxCWnYYuBGRa42w8MrLX
         gahOCC3tC2itPq/xZNawqqziBj+B0/5oaZyT0Z7U6GDXTb4qOvinb0uvBS6TQatVz5wc
         6d+bz1SDyGdrr62YUY2pakJq/2Sqy5Vvk6jSJ/iZnysncboTmTGJ6aH+j4zPHxkxjnrk
         Peqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578497; x=1692170497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcMbvZQAuDfLbcHqMVEHcqz7Bisfyi8R+YRN0ovSOHM=;
        b=FFjZhhdOb9HGORWAvEMvaT61YON7PziuucYsxhMTilrS0Uib9uRtZUTC7CXqtBLwya
         QmSg1GRIfVQrEXQ0X5L14ZK7FjK5pjuI0tu0jAUNxYNu0ooX1mtQI6T2ffKKq//ZpEgh
         eQh8uzIrCmeZvCzBiO8HLzopRimawI71BNC09gt0l8AWz8XlYxImwsQUWkb9Y1l0l38w
         C0/7CDDsUhGdCthqZSALCNoFsRf3Gak5/kfwxEsF8KJyYKKAGmdbGXP9kr6IMg1WdSRi
         OwHSjrOjT3rzu9Bc6f6SvUdzEvfIfxl/ZwW/9FhvFonbxfvFAh3GZICKb75DJ4brOt0x
         eybA==
X-Gm-Message-State: ABy/qLYrwMCNLm4FG4BmyZEZ5vgU2IL5M3eyfDTWsvjBf/u+4hHgaaIu
	JH3NXRDBlzQtWKtVtqSvqr1sA3rhMgo77CAg4PE=
X-Google-Smtp-Source: APBJJlGGxa+H0X6sEoILtlGCpBLd3sxIME8YJaVhY4CqTPoCQVaCTJ+SwgtDIbXAAAlhE+ON3Le2mw==
X-Received: by 2002:a19:4f05:0:b0:4fb:c9e1:5286 with SMTP id d5-20020a194f05000000b004fbc9e15286mr2707204lfb.7.1689578497391;
        Mon, 17 Jul 2023 00:21:37 -0700 (PDT)
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
Subject: [XEN PATCH v10 15/24] xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h
Date: Mon, 17 Jul 2023 09:20:58 +0200
Message-Id: <20230717072107.753304-16-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
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


