Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B81096233C
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 11:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784561.1193953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjEqc-0005Mr-Oj; Wed, 28 Aug 2024 09:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784561.1193953; Wed, 28 Aug 2024 09:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjEqc-0005KD-LF; Wed, 28 Aug 2024 09:20:14 +0000
Received: by outflank-mailman (input) for mailman id 784561;
 Wed, 28 Aug 2024 09:20:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rm2h=P3=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sjEqb-0003rJ-So
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 09:20:13 +0000
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [2607:f8b0:4864:20::82a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9ea46e9-651e-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 11:20:12 +0200 (CEST)
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-456768fb0a6so813951cf.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 02:20:12 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c162d21710sm63763296d6.11.2024.08.28.02.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 02:20:10 -0700 (PDT)
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
X-Inumbo-ID: b9ea46e9-651e-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724836811; x=1725441611; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JSvtCmO9jAkp0KnDfC0SlX5scV2vhq50nOcVowwJtE=;
        b=eCGnQkJWObvfewn799KREz1s3pjIqYVJxzkmhma20q6vB7IboFZMsXwTYhpRxpEF5S
         k0qLsdX3EDjidTYTkdSc4VrchIr9p5GyJ+j8OkQ9jXVK/fCzM96bG6dMHLYq7KLPhesu
         VKfGqLS/3CMQJdgV3IpHVHwnrBMO3MppEQ+RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724836811; x=1725441611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JSvtCmO9jAkp0KnDfC0SlX5scV2vhq50nOcVowwJtE=;
        b=G1F3egVCV4X0K6JNyeMz1RdciyGIW3yXQGtrBh1h9ergkJ6NHbFro/sQCD2NS3eXti
         eEkFlkU8qv0r06cl52dsYHAB177rARPU0MeLH9WR0Xm6Yxx0Nhwt2d+OG0jirMyINKIA
         7dJvNlk4IiaKYrQ16EfQXkg1riaMWXMJ0nZfUX6LKlh6mhaGXSHaJKDIIMht6zbdAu0K
         VCP+mryNg6gw91iCggQuukq3EcneWNs65C/Lbzn82XhMgv/Ln6ANv7RMWtSvItMtGsat
         ow7tCGnEbhAFb356OVh037ynaFYg+ioLHvtBpKogSPHKqPSwI3K/658jVuTeAcZktyZH
         Vjxw==
X-Gm-Message-State: AOJu0Yx1YS6GHEYLbj4tNVl5GAB01tizOCU/WERx3TzxwPCwnRw+Qil4
	Rny94bAYFQqln4QlP1XEZf5UU6fKIITbhhN7IRU1rjNsYQKHnBg4cVkg6ITpFZ3zbBsO/7IcLuD
	h
X-Google-Smtp-Source: AGHT+IE5mp8V1Sj6xT5ZqXrshqa1ZdKt2HKcZZ8KJuKayVeJWYDbIBov1bGRqRh6mk8q5R28JWO/RQ==
X-Received: by 2002:a05:6214:2b82:b0:6b7:4712:c878 with SMTP id 6a1803df08f44-6c16dcbcb08mr191690446d6.41.1724836810614;
        Wed, 28 Aug 2024 02:20:10 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/2] x86/boot: Avoid relocations in trampoline code to virtual addresses
Date: Wed, 28 Aug 2024 10:19:54 +0100
Message-ID: <20240828091956.127760-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240828091956.127760-1-frediano.ziglio@cloud.com>
References: <20240828091956.127760-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add virt_addr macro to make more clear the address we want and making
symbol search easier.
We don't generate direct absolute symbols to virtual addresses to avoid
linker warnings.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/trampoline.S | 3 ++-
 xen/arch/x86/boot/wakeup.S     | 2 +-
 xen/arch/x86/xen.lds.S         | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index 3a6eb942a7..02c713af91 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -40,6 +40,7 @@
         .popsection
 
 #define phys_addr(sym) sym ## _PA
+#define virt_addr(sym) (sym ## _PA + __XEN_VIRT_START)
 
 /* Start of the permanent trampoline code. */
 
@@ -120,7 +121,7 @@ trampoline_protmode_entry:
         .code64
 start64:
         /* Jump to high mappings. */
-        movabs  $__high_start, %rdi
+        movabs  $virt_addr(__high_start), %rdi
         jmpq    *%rdi
 
 #include "video.h"
diff --git a/xen/arch/x86/boot/wakeup.S b/xen/arch/x86/boot/wakeup.S
index ae4dd5eb40..5ac8ba1fb6 100644
--- a/xen/arch/x86/boot/wakeup.S
+++ b/xen/arch/x86/boot/wakeup.S
@@ -156,7 +156,7 @@ wakeup_32:
         .code64
 wakeup_64:
         /* Jump to high mappings and the higher-level wakeup code. */
-        movabs  $s3_resume, %rbx
+        movabs  $virt_addr(s3_resume), %rbx
         jmp     *%rbx
 
 bogus_saved_magic:
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 5cfbd2524a..b200606278 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -77,6 +77,8 @@ SECTIONS
   DEFINE_PA_ADDRESS(start);
   DEFINE_PA_ADDRESS(saved_magic);
   DEFINE_PA_ADDRESS(idle_pg_table);
+  DEFINE_PA_ADDRESS(__high_start);
+  DEFINE_PA_ADDRESS(s3_resume);
 
   . = __XEN_VIRT_START + XEN_IMG_OFFSET;
   _start = .;
-- 
2.46.0


