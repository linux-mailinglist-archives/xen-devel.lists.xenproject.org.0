Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D6F923C52
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 13:24:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752359.1160563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObc7-0001rr-2K; Tue, 02 Jul 2024 11:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752359.1160563; Tue, 02 Jul 2024 11:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObc6-0001ov-Uy; Tue, 02 Jul 2024 11:23:58 +0000
Received: by outflank-mailman (input) for mailman id 752359;
 Tue, 02 Jul 2024 11:23:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Tas=OC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sObc6-0001m7-45
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 11:23:58 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91c2d0fe-3865-11ef-aaf1-7f3abd7486c0;
 Tue, 02 Jul 2024 13:23:56 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ec61eeed8eso50369231fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 04:23:56 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5161fb73sm16149981fa.33.2024.07.02.04.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 04:23:54 -0700 (PDT)
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
X-Inumbo-ID: 91c2d0fe-3865-11ef-aaf1-7f3abd7486c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719919435; x=1720524235; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0kvZbIwg1P0mhVOPWpS762W5yQg7NFjtIVmRuw6584=;
        b=Le+N02QphNp+Hx8OufdExGBj9V7pWqGKf7IlKXmnZbr9kwBIbiKqyJWfE/t59W7zrt
         zvkrsnfCpekcnwajcSJFMwRbBEISca8+QxZwOGaU803ebO+rpu8ZavSuoTOtmnEt1GDI
         gCAy61J3vdIenWDvcOf8pEXMqcKN0NO0wt+SHfexZcf1cNixkyyZ2VSJHtc1THwXL74/
         Ybd2VJY2vYo9086ofHjougrEGa5fH9n0EuC6VrfmSIrEZYypAchEomwTHuaSL9HF864E
         kYf+IepKOROmp6XjzcWGG2YjzrEKIHcua9TVxTmLtXusmyTiSY1n0PJA8S8SH9Ze/kfh
         ylHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719919435; x=1720524235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0kvZbIwg1P0mhVOPWpS762W5yQg7NFjtIVmRuw6584=;
        b=tE8eBbjObEFVClUk/lir69mWw4nWQguIPB0GmNUTktm8vFEBkRQ+HmL9gv6LSegk8h
         RltxdQ0+15oBE8erMZmrEbR8W7rNsUIPsBxI2e/FV7P5qezTm9cAwMD6IUcU0+OQaNFz
         l6YYeGawaosCNA+J2aDwtTXKAaVLTRdqlHBOu5xaxG3EPMDV7qGcofG54xn3YQ/9U0xt
         34X04taHmLShxagHyemalZ3hKT5MtqUidpuPahmnOQabOH2U3x7E8/wQUQ0VxemxfTZa
         FTy08GIIl7Mmw8fnwe5+53ebxX5CjPr6UedD04cpS0xVpA0b/iXqXBkTHkZ5Ho8YuRhq
         ct6A==
X-Gm-Message-State: AOJu0Yyqe1SpJZrqxPqCLDj0mqLxBmcBImnsl6dU+geY0QYlsxyXaTCv
	atE7qpEqszrY0C8DJxhTW/Xft4mr1Bk5vG1S6zsbo/1OMyNldqDk7w8iFiFx
X-Google-Smtp-Source: AGHT+IFziYw3KhCffJR57gsm6MaJhnTZA0BJrtpkAe2mBdjSNoxtUVxNMMYxY/bGE0g8qR5naBzYMA==
X-Received: by 2002:a2e:a548:0:b0:2ec:6639:120a with SMTP id 38308e7fff4ca-2ee5e33a582mr60578951fa.10.1719919435018;
        Tue, 02 Jul 2024 04:23:55 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 1/5] xen/riscv: use printk() instead of early_printk()
Date: Tue,  2 Jul 2024 13:23:46 +0200
Message-ID: <22c78705e4559a049e72950dc311513f1c15e489.1719918148.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719918148.git.oleksii.kurochko@gmail.com>
References: <cover.1719918148.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As common code is available it is better to use printk() instead
of early_printk().

Also the printing of "Hello from RISC-V world" is dropped as
it is useless and "All set up is enough".

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/setup.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 8bb5bdb2ae..e3cb0866d5 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -23,9 +23,7 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 {
     remove_identity_mapping();
 
-    early_printk("Hello from C env\n");
-
-    early_printk("All set up\n");
+    printk("All set up\n");
 
     for ( ;; )
         asm volatile ("wfi");
-- 
2.45.2


