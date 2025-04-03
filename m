Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B44A7A8F2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 19:58:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937030.1338109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Op8-0001WE-N0; Thu, 03 Apr 2025 17:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937030.1338109; Thu, 03 Apr 2025 17:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Op8-0001Te-K1; Thu, 03 Apr 2025 17:57:54 +0000
Received: by outflank-mailman (input) for mailman id 937030;
 Thu, 03 Apr 2025 17:57:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JbNy=WV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0Op7-0001TY-Q0
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 17:57:53 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 274ae536-10b5-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 19:57:48 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so8308105e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 10:57:48 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec16a3aefsm28059365e9.21.2025.04.03.10.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 10:57:46 -0700 (PDT)
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
X-Inumbo-ID: 274ae536-10b5-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743703067; x=1744307867; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QMLfFfEVVO6Pdzym9UcJtEbdmrCa6bNJDvfvnZ9B4rs=;
        b=jYDdcba7n6rKBREApevDsBg4hGk89e6bYmNHE35tiWq5T2QPkB4d0rhSD3uDBakRB5
         Izb6oyjDnsPVaNJoc+uEFvbV1Ky9V6c6lUffcBLaJS/521Dh/4nmjCSfAxoZmun7S4wo
         FiDGADVaMuccBBJN41Q1d1PTThUpIJ2L4alrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743703067; x=1744307867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QMLfFfEVVO6Pdzym9UcJtEbdmrCa6bNJDvfvnZ9B4rs=;
        b=SdTIu/wNliK4BBp45Lk+/l1EwITn8bu6llY4Y7+EQ2FTRyhyZtorhn3g2YOo5oCBU1
         Ixxe95z6S7JU9MRaOMEhsA9IuACRfmIf3HClYMXMvjVUq7FmRCieS9YBvPaL3cXPD0XI
         Hnp6BMRQbUU4oUrOqmz3njFfU7osnlgSTnVVR6RxsQ2UWmSDQAwpTVUmCvDj20UTa7Jm
         qHKgp8JCYNNWdtZGeFuk0CQ6SW/o0XXlsXiFhFQ38WpQZVEpiPfKjme9wh8Y31rMAHje
         YGsDcGwQqtLRJ0VR3PB8hFF+6RedoHOnut8/OJMtWLe1dBU0naoW9iUOPvRsS+ns7Ykd
         corg==
X-Gm-Message-State: AOJu0YzZVAqMTFtX3MiBn7guaUcmrxRDI6gV6QxHL/fpShNJNDrH9jnM
	N0upu0sBdNHRAG664p6kjahbyz5OpWgErqE84P90FgoBU2cpgM9k1D2s6snlB7IoWXTMFlLDqw/
	s7gg=
X-Gm-Gg: ASbGncuk14rruRzT8EHaizpUeo+cQjJW27xzrwQFTnU6xpuRCbEnG7rgr7cCcYjsLZa
	dVitqWqCf0GJvEjZLtjgqf+0mbv6zgXNJTZBNjEqrCMgJJFbrZNYBKQLaauRqNEIoDOQS/J6Ro3
	Es8VbvJP3ljZT0uqzmjYYOYC7+0XrADfC4AaqJsWAdTgJPKoPXA3FNGF7kZZvC0hWya6EsdQlS5
	PafxIE5tTKuffa9iikZOnHb1LX0Xt71PgaMy49qzZPsTUZFB1UpzzK8GxGYw5h+Zda7R3oGRnOP
	ZS3D0jLUEfCMSKnHzC+TjaT/qf/B/DbdQC0IfWRJmeM21DWcNyXhA24i97oQk6/6YoF8VsVXCVU
	5UQ1QuTX2JwNkvsZPQw==
X-Google-Smtp-Source: AGHT+IGfwMp+56Qs1OEYK4UnorKSjvuglUgtfooOg4rsz6ozzUVwuSjlcQgNtunhGdOYmxeFSyNEdw==
X-Received: by 2002:a05:600c:348b:b0:43b:b756:f0a9 with SMTP id 5b1f17b1804b1-43ecf85dd6bmr663715e9.11.1743703067501;
        Thu, 03 Apr 2025 10:57:47 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/amd: Convert wrmsr_amd_safe() to use asm goto()
Date: Thu,  3 Apr 2025 18:57:44 +0100
Message-Id: <20250403175744.1538469-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bloat-o-meter reports:

  add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-29 (-29)
  Function                                     old     new   delta
  _probe_mask_msr                               99      94      -5
  init_amd                                    2418    2394     -24

but that's because .fixup doesn't contain sized/typed symbols.  This also
drops two "mov -EFAULT, %reg; jmp ...;" sequences too.  The net saving is -50.

wrmsr_amd_safe()'s return value is only checked against 0 (if at all), and
because of this, the compiler can now avoid manifesting 0/-EFAULT entirely,
and the %[fault] label simply lands on the right basic block.

Convert to Xen style while rewriting.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Slightly RFC.  We use -EIO elsewhere for this purpose, and nothing in this
logic cares.

I was pleasently surprised by the manifestation of -EFAULT going away
entirely.  I expect converting wrmsr_safe() is going to be far greater win.

Converting rdmsr_amd_safe() (and friends) is going to be much harder, because
they have outputs, which GCCs before this year cannot do safely (there was a
serious bug, found and backported).

I think I'm going to port Linux's CC_HAS_ASM_GOTO_OUTPUT infrastructure, so we
can at least provide a better wrapper on new-enough toolchains.
---
 xen/arch/x86/cpu/amd.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 597b0f073d55..ce4e1df71064 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -74,21 +74,19 @@ static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 }
 
 static inline int wrmsr_amd_safe(unsigned int msr, unsigned int lo,
-				 unsigned int hi)
+                                 unsigned int hi)
 {
-	int err;
+    asm goto ( "1: wrmsr\n\t"
+               _ASM_EXTABLE(1b, %l[fault])
+               :
+               : "c" (msr), "a" (lo), "d" (hi), "D" (0x9c5a203a)
+               :
+               : fault );
 
-	asm volatile("1: wrmsr\n2:\n"
-		     ".section .fixup,\"ax\"\n"
-		     "3: movl %6,%0\n"
-		     "   jmp 2b\n"
-		     ".previous\n"
-		     _ASM_EXTABLE(1b, 3b)
-		     : "=r" (err)
-		     : "c" (msr), "a" (lo), "d" (hi), "D" (0x9c5a203a),
-		       "0" (0), "i" (-EFAULT));
+    return 0;
 
-	return err;
+ fault:
+    return -EFAULT;
 }
 
 static void wrmsr_amd(unsigned int msr, uint64_t val)
-- 
2.39.5


