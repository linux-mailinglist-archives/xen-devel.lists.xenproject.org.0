Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF6E8B9FB5
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 19:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716037.1118081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2aU4-0001Eh-3K; Thu, 02 May 2024 17:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716037.1118081; Thu, 02 May 2024 17:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2aU3-00017F-W4; Thu, 02 May 2024 17:44:39 +0000
Received: by outflank-mailman (input) for mailman id 716037;
 Thu, 02 May 2024 17:44:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1TOG=MF=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s2aU2-0000pj-Es
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 17:44:38 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a36e0f3b-08ab-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 19:44:34 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2dfb4ea2bbfso69869821fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 10:44:34 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a2e3604000000b002d2697570fcsm253313lja.93.2024.05.02.10.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 10:44:32 -0700 (PDT)
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
X-Inumbo-ID: a36e0f3b-08ab-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714671873; x=1715276673; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtRPbe4p6iFUf2UKoVIr28035yPnYXOsQI6g0x3mrLU=;
        b=JomZM2ux1OzpCWzWiG00OEmQZLN3V5K61CrnzRfvqC26sHdNO4K1zSDiSLSUukYL6X
         HTAXQd+f7JrAUQEn8OdI4nA42NzvKPZai5pbPRRNVBx1poe8JvPICPNXVtSyJUU0iGpk
         3c1G+GZSMOZANj7JqaSimmiFxF9VMxThvwxDG1j9XJTKtM9yWfq0GPdtj6AH63dbHhNx
         xCkIkXFCcxaYLKCfxcjBBBdhDo6994xo7AV0k3PF6TykHg/F/6T5kb5cZ1q47U4SxlLl
         E6RmkyLNIntc3pjUKuaWKjlq2OumpCQ6xd92dqpWgZtJOV927+5emL/4U6zn+WffErMp
         OuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714671873; x=1715276673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtRPbe4p6iFUf2UKoVIr28035yPnYXOsQI6g0x3mrLU=;
        b=S82WvfzrWMFI71NJSgbm4a/E4X7imhdv4GWUnqMljbD4skkhJobm4cKhA5JFwJWmYg
         WqGL8/MFZHlvIqNGRha8rrVI9VN6YDGQetOIFhFvUwKdQh2QZpbfY4DRAnx64p2facr1
         Ddun5uQRYVp2s/50j6tLQHwPCr5tusk0yJHCnWcfek4WzNmUj4+Q+VZaTj2Nwt0hvjvY
         84tHwWqBAPMXKvxlVd4tGP29dFWgQQGhBFMn7pVjTV1+861mXBIvHnpBw6Buubd0Ec+c
         XUSMDydBP/DEpcpQOoB51mkURAL2ePsZBhi4EYVDp5J6QM0tidQeZ8BYkqCTIywQz2/R
         +gQw==
X-Gm-Message-State: AOJu0YwUoesOQpDDXdlSDxE+F2x5eNL7XJzq909tS1Tep8EIC/rQHiCL
	y5ALW74CQwqVmwOCKSXMkAEivqNSJmgTNetHtadvj746IdxoumUyiY2rU0LA
X-Google-Smtp-Source: AGHT+IEaRjAESGjBXQiqOoLjVWNKmHhiuq1qWVhA9bmKTCAhITIMcXRmoAp2jGz9dptYpYFF/Z2ZTA==
X-Received: by 2002:a2e:3510:0:b0:2d9:eb66:6d39 with SMTP id z16-20020a2e3510000000b002d9eb666d39mr295242ljz.19.1714671873212;
        Thu, 02 May 2024 10:44:33 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com
Subject: [PATCH v3 2/9] xen/arm64: smc: Add missing code symbol annotations
Date: Wed,  1 May 2024 05:54:41 +0200
Message-Id: <20240501035448.964625-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501035448.964625-1-edgar.iglesias@gmail.com>
References: <20240501035448.964625-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Use the generic xen/linkage.h macros to annotate code symbols
and add missing annotations.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 xen/arch/arm/arm64/smc.S | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/arm64/smc.S b/xen/arch/arm/arm64/smc.S
index fc6b676e2e..68b05e8ddd 100644
--- a/xen/arch/arm/arm64/smc.S
+++ b/xen/arch/arm/arm64/smc.S
@@ -19,7 +19,7 @@
  *                          register_t a6, register_t a7,
  *                          struct arm_smccc_res *res)
  */
-ENTRY(__arm_smccc_1_0_smc)
+FUNC(__arm_smccc_1_0_smc)
         smc     #0
         ldr     x4, [sp]
         cbz     x4, 1f          /* No need to store the result */
@@ -27,12 +27,13 @@ ENTRY(__arm_smccc_1_0_smc)
         stp     x2, x3, [x4, #SMCCC_RES_a2]
 1:
         ret
+END(__arm_smccc_1_0_smc)
 
 /*
  * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
  *                        struct arm_smccc_1_2_regs *res)
  */
-ENTRY(arm_smccc_1_2_smc)
+FUNC(arm_smccc_1_2_smc)
     /* Save `res` and free a GPR that won't be clobbered by SMC call */
     stp     x1, x19, [sp, #-16]!
 
@@ -69,3 +70,4 @@ ENTRY(arm_smccc_1_2_smc)
     /* Restore original x19 */
     ldp     xzr, x19, [sp], #16
     ret
+END(arm_smccc_1_2_smc)
-- 
2.40.1


