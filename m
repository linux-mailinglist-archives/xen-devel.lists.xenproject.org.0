Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD057358B3
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 15:35:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551090.860418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBF1x-00013f-Vp; Mon, 19 Jun 2023 13:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551090.860418; Mon, 19 Jun 2023 13:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBF1x-0000yo-Ri; Mon, 19 Jun 2023 13:34:53 +0000
Received: by outflank-mailman (input) for mailman id 551090;
 Mon, 19 Jun 2023 13:34:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AnRR=CH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qBF1x-0000wG-1x
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 13:34:53 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11b0e6fa-0ea6-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 15:34:51 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b45d7ec066so34793361fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jun 2023 06:34:51 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 f26-20020a2e9e9a000000b002adb0164258sm5222236ljk.112.2023.06.19.06.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 06:34:50 -0700 (PDT)
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
X-Inumbo-ID: 11b0e6fa-0ea6-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687181691; x=1689773691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lTrFI+N+q0Z5lbRmcu+HhnZnUn+lm1yJaD6BC834Oo=;
        b=V73menrMYIejLyOrY48lNf15BBv6m0sFtGu05lv7xJUI9BovrZW3KBh3AXwwgYyp7m
         LF2/ABbl+gVyRBfa03FG8X2pqxrKdc3XV/rtrrlbHAxnjyNPfFqv8IF8k1d22U/UMXRX
         OH4NnH6aaQ3/OFH39xPWN/UFjWiHcpu5Q6OS18kryhEb9HX4HAKw3biGZFUaiLZHuJED
         mOn0/2UUXAyvMOKfDsx8iIux8/MKWw1MDQAtDRufwTS3l2fOTX0hlcGx4tu2RBBDU2KG
         Q+xw6LlSnJ7NrNWAA4hvHPwqpauBrBFcfqYA5hEHxgH/PbfyB54xxqW9uRrEJfxYhoYc
         27QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687181691; x=1689773691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lTrFI+N+q0Z5lbRmcu+HhnZnUn+lm1yJaD6BC834Oo=;
        b=Q6xfkO2C7F1cmzgqwOsy3jYQBGLUBsbf302E5sy/2Qef/FoEdloQS6n8oYBdv9hN8C
         oP/9TJA2AdmlyRUhzAXeLeLOpSHob8CB9wcjeINRprSNTqG6WXjuHMthqqSsWHKVA4Fq
         9wvoCDhgiWcSZtqeF7YqDLeA7SfUy7W5SkPC4FgEJYh8llraiTUvFBF2MOT8W7/IqjFc
         iuKvmLjwMubO+3xLn+bS8JO3BJ2HGhRKZp+R1hSXue2qkEgnpUy1wO3c7ImraTLvC02S
         /8v3wZccO7cBJlC3bD/vBM2fXUpWA0HyEo/PcLfiqYhYU2rm2pnk/s3jgpqSv8tx4Sdy
         Uyrw==
X-Gm-Message-State: AC+VfDxaQCaqieBI4rSU4V7mha5ojQTWKLDRVT2kA+jiDEhdHz4X11qk
	ChKL+/Bqefw+6imfNz0RHgxqgdgfJn0=
X-Google-Smtp-Source: ACHHUZ4saqFSwNocDKLrVOYoNs2j5ihKl8gUgN/mzpc2AX/eZeCOxZXiZser47imprkK9HrWIZfi1Q==
X-Received: by 2002:a2e:9d1a:0:b0:2b4:7d45:7654 with SMTP id t26-20020a2e9d1a000000b002b47d457654mr671204lji.21.1687181690991;
        Mon, 19 Jun 2023 06:34:50 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 1/6] xen/riscv: add .sbss section to .bss
Date: Mon, 19 Jun 2023 16:34:42 +0300
Message-Id: <47f3fbdb6b808a4cad8491a607cf035491093655.1687178053.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687178053.git.oleksii.kurochko@gmail.com>
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sometimes variables are located in .sbss section but it won't
be mapped after MMU will be enabled.
To avoid MMU failures .sbss should be mapped

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V2:
  - add .sbss.*.
  - move .sbss* ahead of .bss*.
  - add Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 xen/arch/riscv/xen.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 878130f313..9064852173 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -149,7 +149,7 @@ SECTIONS
         *(.bss.percpu.read_mostly)
         . = ALIGN(SMP_CACHE_BYTES);
         __per_cpu_data_end = .;
-        *(.bss .bss.*)
+        *(.sbss .sbss.* .bss .bss.*)
         . = ALIGN(POINTER_ALIGN);
         __bss_end = .;
     } :text
-- 
2.40.1


