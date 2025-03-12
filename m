Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBFAA5E30C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 18:47:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910631.1317325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQAt-0007Gv-1g; Wed, 12 Mar 2025 17:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910631.1317325; Wed, 12 Mar 2025 17:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQAs-000795-RA; Wed, 12 Mar 2025 17:47:22 +0000
Received: by outflank-mailman (input) for mailman id 910631;
 Wed, 12 Mar 2025 17:47:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5o35=V7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsQAr-0006h8-9U
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 17:47:21 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b3c08ac-ff6a-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 18:47:19 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so89779f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 10:47:19 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8d0b79sm27333805e9.36.2025.03.12.10.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 10:47:18 -0700 (PDT)
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
X-Inumbo-ID: 0b3c08ac-ff6a-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741801638; x=1742406438; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASh+oxmtGu6mpYhQylcthMaG5UYE6EuOEdO1LTm87Ak=;
        b=V28NYY3tA4sb5oMuQbTG8UICVeLUCJ61yglzgV/505XvpVEfTtGHIba4gZ2NE6zYSF
         6EVHBmj5USnn6zkwHPW6cO/FqcVzK6Ak1SDjunBW51pV57Pb+ov3SGdIsAbKW7GANE/t
         PNPva5GXpwSc1svZXd7NaQJyXqY9VL8p2kxfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741801638; x=1742406438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ASh+oxmtGu6mpYhQylcthMaG5UYE6EuOEdO1LTm87Ak=;
        b=ZBQCV2pKm+xOoUb1t+bGPETVD4NFR+UKnLAtp+0NpO2rw0+tPwwRXmqfXvNQs+33bz
         CNuz6Iz5Vjggw4ILQ3DqPRx/YqvgkxUoQKymkLJIUMDSFRM7cYbVMgcmVHbRuR1a0Cot
         EWSfCjPhcVhM0GLvCRpjJCWitgkjRgVHulF51HdCLOwOJ+Jl2ihNldiplrIWQEXesH8Y
         g8cjxPZcuSYb9SHudABpmmLsMPM1HZ2Lsj2jjtym62lEtKRxSEgQh2HWyg02lBOtpUTz
         DMa6lSomgvKxtK8QjDAa3MoHPkhZZTMcKa0L5epbcu/CTnyEN8+qV2Fvh1v0woxv5Si+
         34qw==
X-Gm-Message-State: AOJu0YzSyXS2H/HfkLj9mB0IRjIZmmT64pR/9EivGF+yaXaEGR6UMD51
	/mkjybq7jn1zauFlvNepmDhXQnp1FbmjhxHtlU4xle3TJMKteZFfj0gS01ZfMrgjpcLX6rubpOM
	k
X-Gm-Gg: ASbGncuv2YEFc+sganGL28egSoMtDhRTOJ0im+nV+8mY8mrF72+folW282EC5YyH8H+
	YCjHdY5164zczzFT9iCRChzhvmiz6RzUksEEs4viaiYvgUMm8n3Pvgvh4xFRVzwgsAYZiRXeN35
	NJAa1jGxBs8OcfbZnHJsV8i0CfSvFgunpPIyDn4asiOvmy+7utHPFnZ83u0yrGD0hl9gP6bv4/0
	Be9kvgsIDLLqsjKklkXAcFxfdUhUJ9RQs9Ufk9PDhChwdSz99N0AbthEExGXy9WLO0IUvTZNrTv
	JkYJBZmsVkowuMAnv1esPmIcBXU3ruQLpLI6AYOZbVJA93LYjXHuf2Dr7FmqS6XG4ZjVlftPYG9
	5Hje836oGU262Mvyt12lgbUdx
X-Google-Smtp-Source: AGHT+IE5nDsvP0JO7zeLJ2XUe6p6WZCWTlMmroP6ph36U/2EbdaCZ462o6JeGm2rCf9WGs3fzhBkxQ==
X-Received: by 2002:a05:6000:154b:b0:390:f6be:af1d with SMTP id ffacd0b85a97d-3926beec333mr8724474f8f.41.1741801638478;
        Wed, 12 Mar 2025 10:47:18 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 2/8] xen/livepatch: Fix include hierarchy
Date: Wed, 12 Mar 2025 17:45:06 +0000
Message-Id: <20250312174513.4075066-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
References: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xen/livepatch.h includes public/sysctl.h twice, which can be deduplicated, and
includes asm/livepatch.h meaning that each livepatch.c does not need to
include both.

Comment the #else and #endif cases to aid legibility.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/arm/arm32/livepatch.c |  1 -
 xen/arch/arm/arm64/livepatch.c |  1 -
 xen/arch/arm/livepatch.c       |  1 -
 xen/arch/x86/livepatch.c       |  1 -
 xen/include/xen/livepatch.h    | 10 +++++-----
 5 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/arm32/livepatch.c b/xen/arch/arm/arm32/livepatch.c
index 134d07a175bb..8541c71d6e2e 100644
--- a/xen/arch/arm/arm32/livepatch.c
+++ b/xen/arch/arm/arm32/livepatch.c
@@ -9,7 +9,6 @@
 #include <xen/livepatch.h>
 
 #include <asm/page.h>
-#include <asm/livepatch.h>
 
 void arch_livepatch_apply(const struct livepatch_func *func,
                           struct livepatch_fstate *state)
diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatch.c
index 6efe4ec770d4..01e6db94be67 100644
--- a/xen/arch/arm/arm64/livepatch.c
+++ b/xen/arch/arm/arm64/livepatch.c
@@ -13,7 +13,6 @@
 #include <asm/bitops.h>
 #include <asm/byteorder.h>
 #include <asm/insn.h>
-#include <asm/livepatch.h>
 
 void arch_livepatch_apply(const struct livepatch_func *func,
                           struct livepatch_fstate *state)
diff --git a/xen/arch/arm/livepatch.c b/xen/arch/arm/livepatch.c
index 3805b2974663..2fbb7bce60bb 100644
--- a/xen/arch/arm/livepatch.c
+++ b/xen/arch/arm/livepatch.c
@@ -11,7 +11,6 @@
 #include <xen/vmap.h>
 
 #include <asm/cpufeature.h>
-#include <asm/livepatch.h>
 
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index be40f625d206..bdca355dc6cc 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -17,7 +17,6 @@
 #include <asm/endbr.h>
 #include <asm/fixmap.h>
 #include <asm/nmi.h>
-#include <asm/livepatch.h>
 #include <asm/setup.h>
 
 static bool has_active_waitqueue(const struct vm_event_domain *ved)
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index d074a5bebecc..c1e76ef55404 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -14,12 +14,14 @@ struct xen_sysctl_livepatch_op;
 #include <xen/elfstructs.h>
 #include <xen/errno.h> /* For -ENOSYS or -EOVERFLOW */
 
-#include <public/sysctl.h> /* For LIVEPATCH_OPAQUE_SIZE */
+#include <public/sysctl.h>
 
 #ifdef CONFIG_LIVEPATCH
 
 #include <xen/lib.h>
 
+#include <asm/livepatch.h>
+
 /*
  * We use alternative and exception table code - which by default are __init
  * only, however we need them during runtime. These macros allows us to build
@@ -93,8 +95,6 @@ int arch_livepatch_secure(const void *va, unsigned int pages, enum va_type types
 
 void arch_livepatch_init(void);
 
-#include <public/sysctl.h> /* For struct livepatch_func. */
-#include <asm/livepatch.h>
 int arch_livepatch_verify_func(const struct livepatch_func *func);
 
 static inline
@@ -143,7 +143,7 @@ struct payload;
 int revert_payload(struct payload *data);
 void revert_payload_tail(struct payload *data);
 
-#else
+#else /* !CONFIG_LIVEPATCH */
 
 /*
  * If not compiling with Live Patch certain functionality should stay as
@@ -165,7 +165,7 @@ static inline bool is_patch(const void *addr)
 {
     return 0;
 }
-#endif /* CONFIG_LIVEPATCH */
+#endif /* !CONFIG_LIVEPATCH */
 
 #endif /* __XEN_LIVEPATCH_H__ */
 
-- 
2.39.5


