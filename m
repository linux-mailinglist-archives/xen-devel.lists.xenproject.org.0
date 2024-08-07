Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF9594A8EF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 15:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773499.1183939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbh1x-0005Hv-9z; Wed, 07 Aug 2024 13:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773499.1183939; Wed, 07 Aug 2024 13:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbh1x-0005Cw-5S; Wed, 07 Aug 2024 13:48:45 +0000
Received: by outflank-mailman (input) for mailman id 773499;
 Wed, 07 Aug 2024 13:48:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nE80=PG=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sbh1v-0005AI-E9
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 13:48:43 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c22c20e7-54c3-11ef-bc04-fd08da9f4363;
 Wed, 07 Aug 2024 15:48:42 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f040733086so21372121fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2024 06:48:42 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b83960f353sm7017710a12.15.2024.08.07.06.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 06:48:41 -0700 (PDT)
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
X-Inumbo-ID: c22c20e7-54c3-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723038522; x=1723643322; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGRtbIN13o/ciUAaf4wEJGcURp+ZlWP4onOzPdvMd2A=;
        b=SAn7ebwph8UNrja7FvAiOECzqlzt6tqo+Kb27CoM7xC2pLtT7vd1pglkORw2k9WBIo
         xiBMu1+Vp9I0vVTkS4Bjl7ApzaYErat9ef6BdvdlPjQwVLeI9K9Q1uzOYxQAxoJVG/Dv
         sBt1gLWOZx/GGFszfi0Wx0wKpnnrKn4OnP7qY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723038522; x=1723643322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGRtbIN13o/ciUAaf4wEJGcURp+ZlWP4onOzPdvMd2A=;
        b=A7yfaBTUO4ApVZIL5hspa9zqwggSJ/EPLhTkX3F4fXtSOlWkuy17WhMIjjkgVwP6PK
         LaszW4E42LY/NfpJz+/OqYbbpQ7rMS4IdMGQk98Hbq6JUqDsF7MWf7DrdXIyU4tqGjtv
         Splzsd6dM7EoOQEpclxb6D8aMjPx5SSbU7eKcpfbpyk7uD/OzioI82qg5g7KEnpBu/We
         /QNnDURLtSIwaUvP2pdS0fJJSjALZfInox4dGGl5KdwtOeYOxKQ0eLc9n426b2+DBSSs
         56g1a/r4vO6WAsE4Zdyv7eFLpwOUTH5cGMU/dpsHQAMkN9+ee04DVnrEKX153R637US+
         9CiQ==
X-Gm-Message-State: AOJu0YxBhMM4QwmXuQxEZ0JSgneienu/S2xTBhRR/LLGmagsBEfGFnVR
	zp5rUhe0EU807tNczkNZlOvfg41d2KQE2Pcbs8pHLPexWReX2nf7riSDY/clvzjP+BkHwltb4SS
	d
X-Google-Smtp-Source: AGHT+IG1l8Rjqon1YH1RNx/xfW2NajRmcQ+83qN/XAymq6z2D6oNRyKPWQ/aF56UUdD0Gabg4msoyA==
X-Received: by 2002:a2e:9bc5:0:b0:2f0:1fd5:2f29 with SMTP id 38308e7fff4ca-2f15aaa6099mr129936081fa.19.1723038521707;
        Wed, 07 Aug 2024 06:48:41 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/5] x86: Fix early output messages in case of EFI
Date: Wed,  7 Aug 2024 14:48:16 +0100
Message-ID: <20240807134819.8987-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If code is loaded by EFI the loader will relocate the image
under 4GB. This cause offsets in x86 code generated by
sym_offs(SYMBOL) to be relocated too (basically they won't be
offsets from image base). In order to get real offset the
formulae "sym_offs(SYMBOL) - sym_offs(__image_base__)" is
used instead.
Also, in some case %esi register (that should point to
__image_base__ addresss) is not set so compute in all cases.
Code tested forcing failures in the code.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/head.S | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index f027ff45fd..296f76146a 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -188,8 +188,27 @@ early_error: /* Here to improve the disassembly. */
         xor     %edi,%edi                       # No VGA text buffer
         jmp     .Lprint_err
 .Lget_vtb:
-        mov     sym_esi(vga_text_buffer), %edi
+        mov     $sym_offs(vga_text_buffer), %edi
 .Lprint_err:
+        mov     $sym_offs(__image_base__), %ebx
+
+        /* compute base, relocation or not */
+        call    1f
+1:
+        pop     %esi
+        subl    $sym_offs(1b), %esi
+        addl    %ebx, %esi
+
+        /* adjust offset and load */
+        test    %edi, %edi
+        jz      1f
+        subl    %ebx, %edi
+        movl    (%edi,%esi,1), %edi
+1:
+
+        /* adjust message offset */
+        subl    %ebx, %ecx
+
         add     %ecx, %esi     # Add string offset to relocation base.
         # NOTE: No further use of sym_esi() till the end of the "function"!
 1:
-- 
2.45.2


