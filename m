Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C208C5C29
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 22:18:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721730.1125355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6yai-0003K6-HQ; Tue, 14 May 2024 20:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721730.1125355; Tue, 14 May 2024 20:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6yai-0003IS-Dr; Tue, 14 May 2024 20:17:40 +0000
Received: by outflank-mailman (input) for mailman id 721730;
 Tue, 14 May 2024 20:17:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uMtz=MR=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s6yag-0002pc-OM
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 20:17:38 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 022e98eb-122f-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 22:17:38 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-34db6a29998so4736553f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 13:17:38 -0700 (PDT)
Received: from gmail.com ([213.0.35.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baacfdesm14649479f8f.73.2024.05.14.13.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 13:17:35 -0700 (PDT)
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
X-Inumbo-ID: 022e98eb-122f-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715717857; x=1716322657; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QODbdNtYx//N7B7NxU/Urb2ggSQNvaYVgLtnma262hw=;
        b=b2WRmEMnJ5/HYPe/Vsnn8Cv6P4ryc4vRfepLZBSToq5QtgBHliENdzTiEmFF5dMfB4
         hxNT1JZB4w6OFiV48WZegb7CpSoLlXx6r4WiVKmaud5XRYt+tPsP2nm4a1FtMTY9AYRd
         1wXFa3/6fivvuzmA7UJUbJ97wlKzCAuv1JIvkZwkLouq0AK/ZbZRGfekM+GeYbQxwK2D
         tq3/W6Ly2ctc1SDYqDD6boePr7rMLy/xsjbHAIi3U8sztKJMnyVZFYL8j/3diN5QxSJ5
         mIkPmrtbAyKcIGsvGbz45+cAYsX0bwT4ZpyumqHKf9VXWyHmGUlHFi5VAdxYtyHjgMUa
         t0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715717857; x=1716322657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QODbdNtYx//N7B7NxU/Urb2ggSQNvaYVgLtnma262hw=;
        b=wbu74hm/zIy4SOlhGW5mTzqiBCwskaejVyvrp3YAjPhrK/dfj74bOZpgjqdDZwjKHN
         LRDuisvGVN8sWFsvVjwevHq3tqv79Rn6CbpvLFSXxEi+6spqKGuwDQFPXEtRXWLxadwl
         IKyc/ILX5CCdolzow/RrTx+wi2tOJiDLkSIHOpCIEIkDYFyQsyY/sZhHPeL8TEp5idUq
         mFSovniqwQ1VIxB4JGO8JkUon9D8o1+ZZwGlvifpDqqNh7GakXicTTIDY0TaeQEZ4JJK
         AHAZpmLM99AsrOw+xC6BzIQDy0tdMwHC8fXXNaesyVelYnaW4o7YXcZdTTsvJZeLp1Qp
         9ZBw==
X-Gm-Message-State: AOJu0YxeRBLwApF6CvqmPQNUMdsDSS00fWMP47ACO4VxcrO2HfpQ3sju
	jJlPbedZlXkvVY/1uXPsYEohtZqnEynia3xkWA21YoW5VzcL6jQz7INpDUAy2dE=
X-Google-Smtp-Source: AGHT+IHpd7msz+LqA1MbybkOFxoKsVL/RYXHvO49nMw1p4/Qd434paujy0JPmUhMPHj+Sv1rXxQIhg==
X-Received: by 2002:a5d:58ce:0:b0:343:dc46:bb4b with SMTP id ffacd0b85a97d-3504aa62e41mr9383601f8f.59.1715717856670;
        Tue, 14 May 2024 13:17:36 -0700 (PDT)
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
Subject: [PATCH v4 2/9] xen/arm64: smc: Add missing code symbol annotations
Date: Sat,  4 May 2024 13:55:07 +0200
Message-Id: <20240504115514.1063509-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240504115514.1063509-1-edgar.iglesias@gmail.com>
References: <20240504115514.1063509-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Use the generic xen/linkage.h macros to annotate code symbols
and add missing annotations.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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


