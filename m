Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF38291875C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 18:29:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749269.1157303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVVk-0005zK-Tg; Wed, 26 Jun 2024 16:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749269.1157303; Wed, 26 Jun 2024 16:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVVk-0005u3-Ps; Wed, 26 Jun 2024 16:28:44 +0000
Received: by outflank-mailman (input) for mailman id 749269;
 Wed, 26 Jun 2024 16:28:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m54e=N4=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sMVVj-0005pK-0r
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 16:28:43 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25b93049-33d9-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 18:28:40 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a725d756d41so135752866b.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 09:28:40 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7291af7912sm42791866b.128.2024.06.26.09.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 09:28:39 -0700 (PDT)
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
X-Inumbo-ID: 25b93049-33d9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719419320; x=1720024120; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAI2lFL9v1i73OxDsNgyfceqLCFm8BlW5RHMtqw9d8k=;
        b=jgHGJ4ueZG/CuGnBJOPLAneSg22Rrabw8ZB/ZzjAOHEVM8hj2f4wtaRCED7JSl1Adm
         cB/2ZB5FT2uOP+mUFqx43Z07rXCoQS+l0ZTix6aFQXU5MjY2d6atVb7JiX9oEzmzIkAc
         9x3DSEJvPDDg293JWYdDO/3JyBsBr3Y8f8mnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719419320; x=1720024120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qAI2lFL9v1i73OxDsNgyfceqLCFm8BlW5RHMtqw9d8k=;
        b=m+Nya1iTFScW0Th2IxICSNG2r4vKDkBHm8zB/sAgdp3+WL650KQ6V+aKTUN0Ofpvx7
         8HUuHhh9Dqrgmi/HJPpib5q9emATwiJ5boG6PwWic9VjxwvuOk5Y6uctURLQkuO/8gL8
         4LCbfiDibhvIFQkMKQvfQkIwu5dUThjcsIDhgC+XwjETKp6+IhVkWDKReJ0U7Z4gC6dU
         Qze2Pn7cPlpzBcLHNVWoyqqhsLxMaTkcDFuFR6p7b4aZJBhT02tG/rLQcauB2KJfCURv
         7qFqIqgWGRoUSjqeJ/1JdBO7VdRFH35CQI/IIygHP9eYVySJMia4+syh0sxGAS87bLp6
         6NPg==
X-Gm-Message-State: AOJu0YyzWumUziGGYdJneE1PV+jm1zffnO7IcbBfspr001+mmYdHcY8G
	sGp/l0Sv/xsKS8/Y91szWqUvOtbWiM5Zc6qotaKWRXmox/fOiWuLaZjgP+697PpSIrLL2l3e8jV
	lKeg=
X-Google-Smtp-Source: AGHT+IFL3aOpcUv5tos2lUCPGjcF7zAXhjcAbWgKdPNXb/lpgRWr7CZAG92QA3pbaZvO3I1MjsZLLQ==
X-Received: by 2002:a17:907:d382:b0:a72:5d7f:dd4a with SMTP id a640c23a62f3a-a7296fa704emr8196066b.25.1719419319978;
        Wed, 26 Jun 2024 09:28:39 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for 4.19 v4 01/10] tools/hvmloader: Fix non-deterministic cpuid()
Date: Wed, 26 Jun 2024 17:28:28 +0100
Message-Id: <f8bfcfeca0a76f28703b164e1e65fb5919325b13.1719416329.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719416329.git.alejandro.vallejo@cloud.com>
References: <cover.1719416329.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hvmloader's cpuid() implementation deviates from Xen's in that the value passed
on ecx is unspecified. This means that when used on leaves that implement
subleaves it's unspecified which one you get; though it's more than likely an
invalid one.

Import Xen's implementation so there are no surprises.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
This is a fix for a latent bug. Should go into 4.19.

v4
  * New patch
---
 tools/firmware/hvmloader/util.c |  9 ---------
 tools/firmware/hvmloader/util.h | 27 ++++++++++++++++++++++++---
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index c34f077b38e3..d3b3f9038e64 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -267,15 +267,6 @@ memcmp(const void *s1, const void *s2, unsigned n)
     return 0;
 }
 
-void
-cpuid(uint32_t idx, uint32_t *eax, uint32_t *ebx, uint32_t *ecx, uint32_t *edx)
-{
-    asm volatile (
-        "cpuid"
-        : "=a" (*eax), "=b" (*ebx), "=c" (*ecx), "=d" (*edx)
-        : "0" (idx) );
-}
-
 static const char hex_digits[] = "0123456789abcdef";
 
 /* Write a two-character hex representation of 'byte' to digits[].
diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index deb823a892ef..3ad7c4f6d6a2 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -184,9 +184,30 @@ int uart_exists(uint16_t uart_base);
 int lpt_exists(uint16_t lpt_base);
 int hpet_exists(unsigned long hpet_base);
 
-/* Do cpuid instruction, with operation 'idx' */
-void cpuid(uint32_t idx, uint32_t *eax, uint32_t *ebx,
-           uint32_t *ecx, uint32_t *edx);
+/* Some CPUID calls want 'count' to be placed in ecx */
+static inline void cpuid_count(
+    uint32_t op,
+    uint32_t count,
+    uint32_t *eax,
+    uint32_t *ebx,
+    uint32_t *ecx,
+    uint32_t *edx)
+{
+    asm volatile ( "cpuid"
+          : "=a" (*eax), "=b" (*ebx), "=c" (*ecx), "=d" (*edx)
+          : "0" (op), "c" (count) );
+}
+
+/* Generic CPUID function (subleaf 0) */
+static inline void cpuid(
+    uint32_t leaf,
+    uint32_t *eax,
+    uint32_t *ebx,
+    uint32_t *ecx,
+    uint32_t *edx)
+{
+    cpuid_count(leaf, 0, eax, ebx, ecx, edx);
+}
 
 /* Read the TSC register. */
 static inline uint64_t rdtsc(void)
-- 
2.34.1


