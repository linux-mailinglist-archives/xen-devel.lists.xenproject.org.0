Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D790E9C859F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 10:08:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836111.1251995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBVpu-000484-Ns; Thu, 14 Nov 2024 09:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836111.1251995; Thu, 14 Nov 2024 09:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBVpu-00044V-Hw; Thu, 14 Nov 2024 09:08:22 +0000
Received: by outflank-mailman (input) for mailman id 836111;
 Thu, 14 Nov 2024 09:08:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3TDs=SJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBVpt-0003tk-Pf
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 09:08:21 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc9d80ba-a267-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 10:08:17 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5ceca7df7f0so468790a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 01:08:17 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e046ea8sm38491166b.169.2024.11.14.01.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 01:08:15 -0800 (PST)
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
X-Inumbo-ID: fc9d80ba-a267-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmYiLCJoZWxvIjoibWFpbC1lZDEteDUyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZjOWQ4MGJhLWEyNjctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTc1Mjk3LjcxNjc2Niwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731575296; x=1732180096; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPcMAabrjMxXLzNlIxXI3pmZoQh/gJoevsrq3c7pfN4=;
        b=jHCUyN4x8yhMoVTsJWOWiP9jfcijEywN6/dVMzPrWL0L2BrQzlI0YZC6C5t1nxiL4C
         R+7W2Ii2YtXYED3UezeNnU2xyeg2dDqymxmTqYS68u+7uoTjlJdYdEK5n8uFHZRHGUY6
         /uuenoYoFp9UGBiFrzLW/C936TOWyj+n3sunE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731575296; x=1732180096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPcMAabrjMxXLzNlIxXI3pmZoQh/gJoevsrq3c7pfN4=;
        b=QSqgjBKkylqe2zCVOooBfhQkHczhqIItbWmEU1DoK0PltWJLJdw30UybQnU65CLwRc
         VUoQFR0reVzJs7Kj43saZcUHfHlcDiNvffs+u5VAh/hqR/cX+9S+dIzHMeoreAx9xU+h
         2tRSgwwTHUP2MGj8WLHirbpKsKgtPcNzo3C+mJBB5uBpqX6WpUC6XyeRJ+cwFRuU6Nqn
         NA/QjuT/z78yFJPDzbJywg1005tWUOegoTxGj02kNoPtYD6jRwNV+rgI43pspWRzHVt3
         KmkEvH6djhYAFr1nxb3gTWdCHFC7E58p3qnicXci4Hy/i9Smttd917dBBNfuDEpL+2rm
         JxZQ==
X-Gm-Message-State: AOJu0YzHgx/U8SomRoxd5v/MiSNyYbMrKLf1iITMqwn56G6Eo+hlfoWO
	3UvxzM6ZupFg0yq0t9x+TB3mQt1ccRYcblVq6l2n7IxM7TBkJnj418Nxkz0GGSkXn9PhNPi7jlB
	y
X-Google-Smtp-Source: AGHT+IGL1hgngSJhiaGN7kLlQHVTA0tzCERHg8yCMTy5XByqaeol0QpunyKjkA32e1rU3DGdydI5rA==
X-Received: by 2002:a17:907:97cd:b0:a77:c95e:9b1c with SMTP id a640c23a62f3a-aa20cd3be2amr113412166b.27.1731575296237;
        Thu, 14 Nov 2024 01:08:16 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v2 2/4] x86/trampoline: Simplify the wakeup_stack checks
Date: Thu, 14 Nov 2024 09:08:08 +0000
Message-Id: <20241114090810.1961175-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241114090810.1961175-1-andrew.cooper3@citrix.com>
References: <20241114090810.1961175-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

By checking that the permanent trampoline fits within 1k (at the time of
writing, it's 0x229 bytes), we can simplify the wakeup_stack handling.

Move the setup into wakeup.S, because it's rather out of place in
trampoline.S, and change it to a local symbol.

Drop wakeup_stack_start and WAKEUP_STACK_MIN entirely.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>

v2:
 * New
---
 xen/arch/x86/boot/trampoline.S    | 5 -----
 xen/arch/x86/boot/wakeup.S        | 8 +++++---
 xen/arch/x86/include/asm/config.h | 2 --
 xen/arch/x86/xen.lds.S            | 7 ++++---
 4 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index 55e4a3e402f7..924bda37c1b7 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -156,11 +156,6 @@ GLOBAL(trampoline_xen_phys_start)
 GLOBAL(trampoline_cpu_started)
         .byte   0
 
-/* The first page of trampoline is permanent, the rest boot-time only. */
-/* Reuse the boot trampoline on the 1st trampoline page as stack for wakeup. */
-        .equ    wakeup_stack, trampoline_start + PAGE_SIZE
-        .global wakeup_stack
-
 LABEL(trampoline_perm_end, 0)
 
 /* From here on early boot only. */
diff --git a/xen/arch/x86/boot/wakeup.S b/xen/arch/x86/boot/wakeup.S
index df5ea2445739..d53f92b02463 100644
--- a/xen/arch/x86/boot/wakeup.S
+++ b/xen/arch/x86/boot/wakeup.S
@@ -1,5 +1,10 @@
         .code16
 
+/* The first page of trampoline is permanent, the rest boot-time only. */
+/* Reuse the boot logic on the first trampoline page as stack for wakeup. */
+        .equ    wakeup_stack, trampoline_start + PAGE_SIZE
+        .local  wakeup_stack
+
 #define wakesym(sym) (sym - wakeup_start)
 
 /*
@@ -166,6 +171,3 @@ wakeup_64:
         /* Jump to high mappings and the higher-level wakeup code. */
         movabs  $s3_resume, %rbx
         jmp     *%rbx
-
-/* Stack for wakeup: rest of first trampoline page. */
-ENTRY(wakeup_stack_start)
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index f8a5a4913b07..84696e0a7db5 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -53,8 +53,6 @@
 
 #define TRAMPOLINE_STACK_SPACE  PAGE_SIZE
 #define TRAMPOLINE_SPACE        (KB(64) - TRAMPOLINE_STACK_SPACE)
-#define WAKEUP_STACK_MIN        3072
-
 #define MBI_SPACE_MIN           (2 * PAGE_SIZE)
 
 /* Primary stack is restricted to 8kB by guard pages. */
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 221fc2ef3f35..224b46771d0c 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -413,11 +413,12 @@ ASSERT(!SIZEOF(.rela),     "leftover relocations")
 /*
  * The permanent trampoline resides in a single 4k page.  Placement logic
  * takes care to ensure that trampoline_phys is page aligned.
+ *
+ * The wakeup stack wants to reside in the same page and wants to be at least
+ * 3k in size, so make sure the text/data fits in 1k.
  */
-ASSERT((trampoline_perm_end - trampoline_start) <= PAGE_SIZE,
+ASSERT((trampoline_perm_end - trampoline_start) <= 1024,
        "Permentant trampoline too large")
 
 ASSERT((trampoline_end - trampoline_start) < TRAMPOLINE_SPACE - MBI_SPACE_MIN,
     "not enough room for trampoline and mbi data")
-ASSERT((wakeup_stack - wakeup_stack_start) >= WAKEUP_STACK_MIN,
-    "wakeup stack too small")
-- 
2.39.5


