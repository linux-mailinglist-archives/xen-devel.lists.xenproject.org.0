Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAACDABF7F3
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 16:36:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991969.1375750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHkYV-0007pw-5k; Wed, 21 May 2025 14:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991969.1375750; Wed, 21 May 2025 14:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHkYV-0007nm-1b; Wed, 21 May 2025 14:36:27 +0000
Received: by outflank-mailman (input) for mailman id 991969;
 Wed, 21 May 2025 14:36:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iqa2=YF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uHkYT-0007GP-Ar
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 14:36:25 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8df4325-3650-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 16:36:25 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so55696815e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 07:36:24 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f381420fsm70544975e9.32.2025.05.21.07.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 07:36:23 -0700 (PDT)
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
X-Inumbo-ID: f8df4325-3650-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747838184; x=1748442984; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1aU84GzIfkbPB3TPQ9rGHiXLRhubXlVpWyNiYxWgMW4=;
        b=IB9flyvqUziOFWQgWP+oO1zQLkhvF4pRc2RsVbJ8GAH/c4A2Vxpgs7urLMIHbRplIL
         kaYvLOk4/C3kxLx9r0TrrJ57/+don8PY00B1BZG2UFUq9vdyNK9eEUthQ0AdEQnvz3fF
         eG8daHD/IPWIFGF4T9hx0ZzWeXfJeTqtEWL34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747838184; x=1748442984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1aU84GzIfkbPB3TPQ9rGHiXLRhubXlVpWyNiYxWgMW4=;
        b=Z5Tdrb+Ap+RQ/rkgvggXk1aGcLYDEXr3o9Xr9bxVKpOTW6vw2eQrcB/2kAu0HdYjQ7
         ae2x18TvQHQ8EcVgHapGxSJyJ3rLWIh3pXGrbCiw3DmvroDgUN5JGEYhh85WUqe5TqZF
         7msAzv58u4hsIx922kgkQvFvSTIm/QCvB2qtYIDq/sM64INr3Uw3ZMKjohqb+4qwwLBA
         5hs82XRJhlqpI0MvVxbZ9a4W2WP8EkLGjHkmM8++0Kc1xCJ2CWSXeQ4CV6n2+eHF/w7L
         W0i+Nkf8XjZ1Eovon25vq4/XUP7SgoQlh6bSzzCkOXIP5OW/CF4KePgG1/BikbvScGnf
         o3fg==
X-Gm-Message-State: AOJu0YwChV/G1SdjsxWEVHWPJIHY2qXBs8XjB1brYynhJ6yBhDZfdtYo
	6uEfzKVSTdnvRYE8+5NXGHFSmtMjWGVKxWCtLUtxtljXgx4wCnjz7qj5HZgZwtJI3mlc/blKnEb
	5gr0M
X-Gm-Gg: ASbGnctpGrT6pjMQ2lObzZpvAGgyUT6A9RiE4whSiYi6ADSQ2kNCtkXxNM6kfANNus+
	eOa1zxjK2IHlvT8C+Qu4VgJtG3cqJzEAbE5iThl1c7PfRAJsXPLqSTTZekcvmLH0b8A9F7M6YOO
	poLPqja/gFF03u9VsrJb5yBPNLKPFjknCum6EWOGYJEmE5oH+VHwtK3d4klaOj3KqYP/lK/VFXN
	z/lcTy1x58T5SO+b2LXslrHurA6bC43BuRvE4kpSVVXiTKaE1cfbi4KE4PkEocg7yrxswvq2R9+
	0+yZGPLtu5JtYWB/1bJTRNCc674cA3Qku+FeiMF9vLhKIkA6I2UlEvh0NhcqHtuuAD5PqVfLMOa
	lWoLFdUL3nzMgW1R9QFIXMQX/
X-Google-Smtp-Source: AGHT+IG4EUJcIrigNhEqNd8W8muA6o5VvT/ltWGgX5+hKTDDaByzkLX7rOV58sHStEpmKmag6ycwmw==
X-Received: by 2002:a05:600c:c05:b0:440:94a2:95b8 with SMTP id 5b1f17b1804b1-442feffc03dmr239976495e9.16.1747838184133;
        Wed, 21 May 2025 07:36:24 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/xstate: Rework xsetbv() to use asm goto()
Date: Wed, 21 May 2025 15:36:22 +0100
Message-Id: <20250521143622.311566-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Switch to using a mnemonic, and asm_inline as there's EXTABLE metadata.

Update the types, and adjust parameter names.  The name xfeatures is specific
to xcr0, so rename to val to be more generic, even if there isn't another
writeable xcr yet.

No functional change.

Resolves: https://gitlab.com/xen-project/xen/-/work_items/212
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/xstate.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 3d249518a1b7..e8e218caed36 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -40,21 +40,22 @@ static DEFINE_PER_CPU(uint64_t, xcr0);
 /* Because XCR0 is cached for each CPU, xsetbv() is not exposed. Users should 
  * use set_xcr0() instead.
  */
-static inline bool xsetbv(u32 index, u64 xfeatures)
+static inline bool xsetbv(uint32_t xcr, uint64_t val)
 {
-    u32 hi = xfeatures >> 32;
-    u32 lo = (u32)xfeatures;
-
-    asm volatile ( "1: .byte 0x0f,0x01,0xd1\n"
-                   "3:                     \n"
-                   ".section .fixup,\"ax\" \n"
-                   "2: xor %0,%0           \n"
-                   "   jmp 3b              \n"
-                   ".previous              \n"
-                   _ASM_EXTABLE(1b, 2b)
-                   : "+a" (lo)
-                   : "c" (index), "d" (hi));
-    return lo != 0;
+    uint32_t hi = val >> 32, lo = val;
+
+    asm_inline goto (
+        "1: xsetbv\n\t"
+        _ASM_EXTABLE(1b, %l[fault])
+        :
+        : "a" (lo), "c" (xcr), "d" (hi)
+        :
+        : fault );
+
+    return true;
+
+ fault:
+    return false;
 }
 
 bool set_xcr0(u64 xfeatures)
-- 
2.39.5


