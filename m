Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0CE8B9FB4
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 19:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716038.1118087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2aU4-0001LO-ER; Thu, 02 May 2024 17:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716038.1118087; Thu, 02 May 2024 17:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2aU4-0001Ee-8R; Thu, 02 May 2024 17:44:40 +0000
Received: by outflank-mailman (input) for mailman id 716038;
 Thu, 02 May 2024 17:44:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1TOG=MF=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s2aU3-0000pj-F2
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 17:44:39 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a47c8a4e-08ab-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 19:44:36 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2df848f9325so71748051fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 10:44:36 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a05651c102900b002e1c8a2f3d1sm255777ljm.75.2024.05.02.10.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 10:44:33 -0700 (PDT)
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
X-Inumbo-ID: a47c8a4e-08ab-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714671875; x=1715276675; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqCCbbv/MtZy1u/M+ApEL4BOvMHDwRPRM9TWyEa/hOE=;
        b=ShDznb8ZXMke04ud9GgP268RqFmqpicyjjeFqxLdcPFFroLKAnl/MG7k2Pe1tta7T6
         NhmBWCqVEuXMcU+MciNCyhMTruqHKftZtnPI7qOuybUUvyoo3q4u4osSqFh9099eRFeQ
         9m4syWN8qgtAr+m7Ueji4n5t0y34oHIaawQZHmg7rCiY15+dOCccBb1FFFlDn544xKUj
         OP0V6dCHqD4O0Q/BnR5DtpFZc7tUjqXoQshkd+1LJU71NILiOc/raHEdIWcMxTC4oe8L
         SeR4aP5++Td/YKfiB/DDLZL9Gly2lftjg36cP7pfX19FjiG5K3T1B0OaS13YzWftlqnS
         L92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714671875; x=1715276675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqCCbbv/MtZy1u/M+ApEL4BOvMHDwRPRM9TWyEa/hOE=;
        b=plq8uEax6Vj6u2i65cpzwwhZqyOKBcTlWqvbYpKz5Y8qkzHEfPmLFWqfxzZUkncbxb
         olNdaGcEWagoyhqbdonjGyhoUl+9jpTH73AQvAe39zUHQw0jxLUPH6i5mxgdBzXBZBUd
         V7ywN4JcQpcFx/oGxh9+vhZKNpblLT3HMZsro+U9epAEnK8K55NIfNNYhINl2sC0jsKD
         oXKkbwcbG9PI95KJGYlbAna17rj/IRXeIXWbia3UO982MfVd/cR/m8fjHFB0rupUAISN
         5G7kHuLCYw9aaVN3q/9xjWl6jr0XOWOd1+eHHVcMReilUp2ZzamK64oFQ5IC+WtMmmGW
         0Z3w==
X-Gm-Message-State: AOJu0YzBzcmQ7wTX9WUg06rYXMDFNW3PNGkrCkcJqb8lf6grvzWVgipE
	unPKF5Aiti4f8lMNgfU2U1qVAyIZtjtxP8MJPcuPwMsAhQ8Gc0eNKYGsmVSZ
X-Google-Smtp-Source: AGHT+IGkgN8FO7nnrbF/W+13whQheJUvKQ/jtMk8hAv9qCI/Rb7h3opgGgtUjVjZnTDJ5j/cjNhTUw==
X-Received: by 2002:a2e:7204:0:b0:2df:7824:7d32 with SMTP id n4-20020a2e7204000000b002df78247d32mr248943ljc.50.1714671875373;
        Thu, 02 May 2024 10:44:35 -0700 (PDT)
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
Subject: [PATCH v3 3/9] xen/arm64: sve: Add missing code symbol annotations
Date: Wed,  1 May 2024 05:54:42 +0200
Message-Id: <20240501035448.964625-4-edgar.iglesias@gmail.com>
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
 xen/arch/arm/arm64/sve-asm.S | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/arm64/sve-asm.S b/xen/arch/arm/arm64/sve-asm.S
index 59dbefbbb2..2d8b895f07 100644
--- a/xen/arch/arm/arm64/sve-asm.S
+++ b/xen/arch/arm/arm64/sve-asm.S
@@ -161,9 +161,10 @@
 .endm
 
 /* Gets the current vector register size in bytes */
-GLOBAL(sve_get_hw_vl)
+FUNC(sve_get_hw_vl)
     _sve_rdvl 0, 1
     ret
+END(sve_get_hw_vl)
 
 /*
  * Save the SVE context
@@ -172,9 +173,10 @@ GLOBAL(sve_get_hw_vl)
  * x1 - pointer to buffer for P0-15
  * x2 - Save FFR if non-zero
  */
-GLOBAL(sve_save_ctx)
+FUNC(sve_save_ctx)
     sve_save 0, 1, x2
     ret
+END(sve_save_ctx)
 
 /*
  * Load the SVE context
@@ -183,9 +185,10 @@ GLOBAL(sve_save_ctx)
  * x1 - pointer to buffer for P0-15
  * x2 - Restore FFR if non-zero
  */
-GLOBAL(sve_load_ctx)
+FUNC(sve_load_ctx)
     sve_load 0, 1, x2
     ret
+END(sve_load_ctx)
 
 /*
  * Local variables:
-- 
2.40.1


