Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92B4979E89
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 11:36:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799358.1209348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq89V-0006eQ-GX; Mon, 16 Sep 2024 09:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799358.1209348; Mon, 16 Sep 2024 09:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq89V-0006cX-DS; Mon, 16 Sep 2024 09:36:13 +0000
Received: by outflank-mailman (input) for mailman id 799358;
 Mon, 16 Sep 2024 09:36:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wse+=QO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sq89T-0006cR-IA
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 09:36:11 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 197fc584-740f-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 11:36:07 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5365a9574b6so4178740e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 02:36:07 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f151esm290601466b.48.2024.09.16.02.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 02:36:06 -0700 (PDT)
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
X-Inumbo-ID: 197fc584-740f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726479366; x=1727084166; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9bE42e2WU1qA3/ulfwKxHcEQXPKSFg8WdkO8Fij57Ts=;
        b=dZJY9RI6hKDGHQwoacOUc04uu92k73q/lR1Xw3zc+uHahxeEozsA3LILLZbFlovYQL
         ShrMVBYts45aK77tfBJfwyBG/CAa2yivmRS0P5OWq7N4dL7HGy0uyzFoUvp4QEt1XZYT
         KUO8/jbHQm8ndZmB+eooN1S88zsfMfUvTwQy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726479366; x=1727084166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bE42e2WU1qA3/ulfwKxHcEQXPKSFg8WdkO8Fij57Ts=;
        b=KXZ8aDxbY/WuzobcxnSvAxg0VxQBF7KXkOBPvOuCWsUhePpU55umoEspO3/PAlMXxg
         3FyAMhz2moCAMVbT/t5TlSFanTSY9QojwvpVPmz/hqwi21a4+xNhIr47OGXbNQtyT1IY
         93A7d57dXF5Zz3ttcJwV/foTeGUZIa7sT+XdaHrxWMdy9jnGkb0m8Q3UzVSukRqDIYp+
         4TcjhTTGKfJkLCpsBoX2j32pHpo+yfAUDSv2ON+Y1zFAbxH+1WDNTFeB5wVvszliSAr8
         6JJCtAatuh1HM1sLtzSKxjmDQRORLReH0mGH+yv+HGcyuXuVVM4+ZKFuMznFFNC4/T2R
         Z7BQ==
X-Gm-Message-State: AOJu0YyEp9X22IEuSEW4rm26EELXchSfzvjQ39687jYI6DrN9HbYCjYo
	53GdxoECCLEDhmbrGpOV2Dd+2qzW+bICQPxaQTs7sX1uWzG/LJ2gEVC8Vc0MoZvFnyUh5McYm9r
	O
X-Google-Smtp-Source: AGHT+IFAxPvKYA8p89qSHmIiGM/nOzhEUAxWuTZhfgZMfPTiw66KbLx8kawnugSguy1N65fA15LGXQ==
X-Received: by 2002:a05:6512:a8e:b0:52c:e17c:cd7b with SMTP id 2adb3069b0e04-5367fed250bmr6682338e87.22.1726479366392;
        Mon, 16 Sep 2024 02:36:06 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen/efi: efibind: Fix typo in comment
Date: Mon, 16 Sep 2024 10:35:57 +0100
Message-Id: <20240916093557.67850-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

expresion -> expression

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/include/asm/x86_64/efibind.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/x86_64/efibind.h b/xen/arch/x86/include/asm/x86_64/efibind.h
index 28bc18c24b..b29342c61c 100644
--- a/xen/arch/x86/include/asm/x86_64/efibind.h
+++ b/xen/arch/x86/include/asm/x86_64/efibind.h
@@ -176,7 +176,7 @@ typedef uint64_t   UINTN;
     #elif __clang__ || __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4)
         #define EFIAPI __attribute__((__ms_abi__))  // Force Microsoft ABI
     #else
-        #define EFIAPI          // Substitute expresion to force C calling convention
+        #define EFIAPI          // Substitute expression to force C calling convention
     #endif
 #endif
 
-- 
2.34.1


