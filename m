Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3617974F0B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 11:51:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796340.1205876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soK07-0007mZ-0G; Wed, 11 Sep 2024 09:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796340.1205876; Wed, 11 Sep 2024 09:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soK06-0007jR-Ts; Wed, 11 Sep 2024 09:51:02 +0000
Received: by outflank-mailman (input) for mailman id 796340;
 Wed, 11 Sep 2024 09:51:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2J2y=QJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1soK05-0007jL-Bh
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 09:51:01 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58e1f48b-7023-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 11:50:59 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c27067b81aso6809513a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 02:50:59 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd8ce50sm5230439a12.84.2024.09.11.02.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 02:50:57 -0700 (PDT)
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
X-Inumbo-ID: 58e1f48b-7023-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726048258; x=1726653058; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SGjcSEWnTf8j6d1PRjFei/7dBDzMVLwgykQbvZKMqHk=;
        b=hBzb1FOcV+Qd+ON1p3ioc6jEGpyEeHJaeLSVP4CWYaGQY2JdJwMy2D6vWGqBBmpOSw
         2uFavXtzlRRi+AYDihgmcBxxs9XLZ7qZ1FKXOkzgZGZLYGlSFLnHVXmsg7x1DPHjP6Oa
         A6PDty42Uwpxn+h5ZQP6hyByFVJtF60S8InSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726048258; x=1726653058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGjcSEWnTf8j6d1PRjFei/7dBDzMVLwgykQbvZKMqHk=;
        b=T6ZZTOCHcAyRF2d37PgX3PgnD284JLW24TRLuLkfgPgF3APJXkfmB4jjmWuSyKT8Fl
         rpCbxiCCWgnWlTYYtanITo4+jDCa+muz17x0r+Z2pimPwi8BJV1bt36qIY0ELHdTCRMz
         1iDexIWl0xbYkAbPai4wP2bqXr7M7f8zq4BNxypRzVHJw8XT4Upum4TU2xotEZQ1q4HP
         e520xKr2MPKKelJ0NKyg8+J0Om6XEeYasWGVvcd38GsUkZSUPL85uL1PhQLHlkoMbp7v
         jcf85II2X5gHEXnR+338pdSa2pL6tB108vF/KDxTNMc79ynXbsWk2b+7lSZR/T7SyLlj
         owvA==
X-Gm-Message-State: AOJu0Yztj6ihJuZYx8Ib2ZIodQtmaQEu3/f5fOoeNJHAyJW1tbY+YWDC
	A2da30kbVA945qp9V23I9EISPcGgBIbCLJJjLVEdRIARZ6WD+F+TS+g8U0LfrHCDaNRJtA8Rf/u
	H
X-Google-Smtp-Source: AGHT+IE7cvHYhmjVCtBQGcWR6mlj0yLPU5oa9Zd/n6GGIzEdUdiat6wKNvJ5x9qOX2MMoK2DVBYCqg==
X-Received: by 2002:a05:6402:40c5:b0:5c2:6311:8445 with SMTP id 4fb4d7f45d1cf-5c3eabfede6mr9782407a12.2.1726048257961;
        Wed, 11 Sep 2024 02:50:57 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86: Put trampoline in separate .init.trampoline section
Date: Wed, 11 Sep 2024 10:50:48 +0100
Message-Id: <20240911095048.25555-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change put the trampoline in a separate, not executable section.
The trampoline contains a mix of code and data (data which
is modified from C code during early start so must be writable).
This is in preparation for W^X patch in order to satisfy UEFI CA
memory mitigation requirements.
At the moment .init.text and .init.data in EFI mode are put together
so they will be in the same final section as before this patch.
Putting in a separate section (even in final executables) allows
to easily disassembly that section.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since last version:
- use completely separate section even on final executables
  (suggested by Jan Beulich).
---
 xen/arch/x86/boot/head.S | 6 ++++--
 xen/arch/x86/xen.lds.S   | 5 +++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 12bbb97f33..61b7b8894c 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -882,8 +882,10 @@ cmdline_parse_early:
 reloc:
         .incbin "reloc.bin"
 
+#include "x86_64.S"
+
+        .section .init.trampoline, "aw", @progbits
+        .align 4
 ENTRY(trampoline_start)
 #include "trampoline.S"
 ENTRY(trampoline_end)
-
-#include "x86_64.S"
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index d48de67cfd..390870e463 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -269,6 +269,11 @@ SECTIONS
        __ctors_end = .;
   } PHDR(text)
 
+  . = ALIGN(PAGE_SIZE);
+  DECL_SECTION(.init.trampoline) {
+       *(.init.trampoline)
+  } PHDR(text)
+
 #ifndef EFI
   /*
    * With --orphan-sections=warn (or =error) we need to handle certain linker
-- 
2.34.1


