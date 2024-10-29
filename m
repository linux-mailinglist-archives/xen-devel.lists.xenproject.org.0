Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EF89B46DA
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 11:30:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827211.1241791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5jUC-00083h-7a; Tue, 29 Oct 2024 10:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827211.1241791; Tue, 29 Oct 2024 10:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5jUC-0007zO-3m; Tue, 29 Oct 2024 10:30:04 +0000
Received: by outflank-mailman (input) for mailman id 827211;
 Tue, 29 Oct 2024 10:30:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WX/=RZ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t5jUA-0006t0-C2
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 10:30:02 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be2a9fa0-95e0-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 11:29:56 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a998a5ca499so700904066b.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 03:29:56 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1dfbc7e8sm458495466b.31.2024.10.29.03.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 03:29:55 -0700 (PDT)
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
X-Inumbo-ID: be2a9fa0-95e0-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmEiLCJoZWxvIjoibWFpbC1lajEteDYyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJlMmE5ZmEwLTk1ZTAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMTk3Nzk2LjkwNDE2MSwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730197796; x=1730802596; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/R9IwC5Rg/1YFlZU2XC6OhmnY2lp5++tA2yhEvcFGMk=;
        b=YebmN4NL4khk1ahRXKW8C1SUlM5ZZ3QMMN3ovjUJ2pAzcOK3gGTwqNl0S2XD3tp3lZ
         UjHU0uoltDQNKsFDEx1jqC8VEcjIL45DYz/WrUgqEFKbJe4yRpQFkP5FH7TgNUbSigrJ
         4z0cyQ+pU779D18fyEFH+r1h+J3eTy8ndPGFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730197796; x=1730802596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/R9IwC5Rg/1YFlZU2XC6OhmnY2lp5++tA2yhEvcFGMk=;
        b=L/eSYBCXjcWYPEUzLSvHFR6SbHQjfHG4EVdwMAvKh3G8qvDSmkCvAFHeOp35xYm7kr
         ZVw94bElRwdY77QG3jAT2AYzkGSz9voxiDXVJegElxxwDP5HcSCDmGRDKngIFe3EIjkR
         sNaLfErLrjVeszKlXbDq/ZXHlSeLkfsUGeUyxNryrzTyamt+12XtNADfw5j7MJJvoEQM
         aSoLYYxwJeSPOR8teSpJMrbJI8pzUTY0y9NVNDdy3tbO2heBkGsvb2EGL+IgaXlcLA8z
         y9FiRuAfTajcr5HlxQS6etEtp9t9KimtxY0X/h1T++A7jT56Ve4m7IPGXs6+pdFjRNRY
         Zcug==
X-Gm-Message-State: AOJu0Ywucd6dUAzd6cWFUbCG1bF6ol5Sa4zZESGS2aH2/qMSzaPa0Gze
	WraxDD4mK75wb1RGSPxdQf68PeFxPIq20ToKh1bmiI2SGHjLmU87ms1IV61r2EbhxzqIcqCx4EC
	5
X-Google-Smtp-Source: AGHT+IFtTmzbWe1tXihaQjdCkWDhmGLw61ux3klKpwQxC8yvZG9lx9DIE8RctK4biXZqWGvmoAxvbQ==
X-Received: by 2002:a17:907:96aa:b0:a8a:8cdb:83a7 with SMTP id a640c23a62f3a-a9de61eb56bmr1139022266b.54.1730197796145;
        Tue, 29 Oct 2024 03:29:56 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 5/5] x86/boot: Clarify comment
Date: Tue, 29 Oct 2024 10:29:42 +0000
Message-Id: <20241029102942.162912-6-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029102942.162912-1-frediano.ziglio@cloud.com>
References: <20241029102942.162912-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/reloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index e50e161b27..e725cfb6eb 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -65,7 +65,7 @@ typedef struct memctx {
     /*
      * Simple bump allocator.
      *
-     * It starts from the base of the trampoline and allocates downwards.
+     * It starts on top of space reserved for the trampoline and allocates downwards.
      */
     uint32_t ptr;
 } memctx;
-- 
2.34.1


