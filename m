Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C00155368A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 17:45:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353305.580247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3g34-000703-IW; Tue, 21 Jun 2022 15:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353305.580247; Tue, 21 Jun 2022 15:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3g34-0006wb-F5; Tue, 21 Jun 2022 15:44:14 +0000
Received: by outflank-mailman (input) for mailman id 353305;
 Tue, 21 Jun 2022 15:44:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wIjP=W4=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o3g32-0006h7-SU
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 15:44:12 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff24ab11-f178-11ec-b725-ed86ccbb4733;
 Tue, 21 Jun 2022 17:44:12 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id o7so28401502eja.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jun 2022 08:44:12 -0700 (PDT)
Received: from uni.. (adsl-190.37.6.169.tellas.gr. [37.6.169.190])
 by smtp.googlemail.com with ESMTPSA id
 q16-20020a056402033000b0043564320274sm10090705edw.19.2022.06.21.08.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 08:44:10 -0700 (PDT)
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
X-Inumbo-ID: ff24ab11-f178-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LrkB1fU20QvlNrcfiWTsM7um/FmclqwQ8isYFawF1LU=;
        b=bCFA5QY7DfLHY3/8Oe/yq77T5aHUuablw6uGDGGcZ3r856P/ZF6tMbZ1CfHC52XlOW
         U5k2uNbRoghYkzcMabIMSLS8MihBzB72QXiFlIFq7PUNyCPrrGzB5WBmCT7ex/G20bVU
         qeE+rLGaG753EucfFRIGQam/2jHp4TBwn2+tVYVcEn6QcCeNpHuMAigLbEtEn/DGthEm
         Eo+j5zNZsnJ5e9W9GqQTznZ/DxUA/H26jZVWjzzig4npsfhzSCzik2MdQ/Dh78BqqDWP
         JmhBP8osCAODYCk9Cwtqo3P91ty2WB2HOh7F4ym9ArEe+E170ZHJG2HjdijCAOdKO7Qn
         m7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LrkB1fU20QvlNrcfiWTsM7um/FmclqwQ8isYFawF1LU=;
        b=GswjVCPL33ITtaZ0AQmD9MScXu6e3kKwF5HzbRWYTjEX/buVVTPr23sgytDOo1oRmP
         kQwpLqcuy6169gWP7opUBK279TomvpAtAZRfxAY5AJQn8GYbtU2kNs0b+h3EcPCl/Lkj
         fzLOY27A5y1GZHksnXwJwlM1jbYKILGJpIUGzDRsxYN+LDUlO04z3pqrr7kS49oTwpuw
         qvWjQdQJcmfDQ8567lubHy61OuCJ4kClPRm/x0SDWCDDVHSkyX+iuTRVhNvJtNU048DH
         XiXCjbYJFKCk7GsJrfwOwdgUdQqEODDchtj5BnkvpvIXHNnfeGSe2t4HjPh0j+aLQheu
         QzAQ==
X-Gm-Message-State: AJIora+OI1ecHhF+9qkupQRMCJw8bxBmHFBg9Repb/1iru9MjhP5mJrd
	ZWjK7saITFqjYVCQujiZn0XdhnAs+us=
X-Google-Smtp-Source: AGRyM1tbIFBPp38itQ0rLLYjoQQrzfd1A81yW71wh8tUtMFxr1jPzTtguP95LUoeyEnWWDyTFkmP8g==
X-Received: by 2002:a17:907:72d6:b0:722:e59a:72f4 with SMTP id du22-20020a17090772d600b00722e59a72f4mr2968623ejc.158.1655826251590;
        Tue, 21 Jun 2022 08:44:11 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/2] xen/arm: vtimer: Remove duplicate header
Date: Tue, 21 Jun 2022 18:44:02 +0300
Message-Id: <20220621154402.482857-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220621154402.482857-1-burzalodowa@gmail.com>
References: <20220621154402.482857-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header file <asm/regs.h> is already included above and can be removed here.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/arm/vtimer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
index 5f26463354..6b78fea77d 100644
--- a/xen/arch/arm/vtimer.c
+++ b/xen/arch/arm/vtimer.c
@@ -30,7 +30,6 @@
 #include <asm/vgic.h>
 #include <asm/vreg.h>
 #include <asm/vtimer.h>
-#include <asm/regs.h>
 
 /*
  * Check if regs is allowed access, user_gate is tail end of a
-- 
2.34.1


