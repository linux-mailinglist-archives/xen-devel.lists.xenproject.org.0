Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA5DB3A3C4
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:11:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099207.1453217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHt-0004oQ-5Y; Thu, 28 Aug 2025 15:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099207.1453217; Thu, 28 Aug 2025 15:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHt-0004lt-0c; Thu, 28 Aug 2025 15:11:41 +0000
Received: by outflank-mailman (input) for mailman id 1099207;
 Thu, 28 Aug 2025 15:11:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureCc-00035A-5l
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:06:14 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 894594af-8420-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 17:06:12 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45a1b05fe23so6562535e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:06:12 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:06:10 -0700 (PDT)
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
X-Inumbo-ID: 894594af-8420-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393571; x=1756998371; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlSs33LyasAlNvUysj+jB74IjU0ubI6AuvZz0rNj+kg=;
        b=cm4HMhPFdlqTCjzXMqvEOl8+j7BieUIA96bpN5uxoD7N4Ky8scLcHiJac0KxDqUhOT
         YZZ2aYlbfcAHIQso5jzkYAZ+pN9fPwVLFNG+HxMfiBUVXo8gzWcns1UcYqIvx5kGja18
         twgkbUjC4fcFBgchMasqV67C3Dv/FX2+1zqZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393571; x=1756998371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlSs33LyasAlNvUysj+jB74IjU0ubI6AuvZz0rNj+kg=;
        b=I+Pwdf07tU3zHCv1UAjiDFiI20BHmeyduaU46znW5q4bA6JCgz8Cv4xkuWKDjZQcDu
         ZFhW6o6v8Omr+FGS2+tkvDTL3uWtY4rMCwztOMc3jd5WMiPrVl9Obn/reTwpMcZx0fdS
         trExLS9FN1Yyyt4clJ6A0BwqDxSyfAzrHemjWcOgpthuY4ihG976zpIvsfCNi7Yblo3E
         hlf17bqhmsKX6rYJjRDAswfLiXFtVfoHG6IKQjwSOYJWc1b/+aUoWmKhwQPYSkXevTRZ
         N41pDkz1Gebfb9xL4oRQTIJtZN6pJSmbBXhD60rDXGWEWQcfr5nSYzXxEpujkb5h3scd
         bZzg==
X-Gm-Message-State: AOJu0YwZD/9wSVPnuPFY0lrfMvcZP2eL0qlYCHSL+AzPUwwQDhLi9B05
	qGoycxo1liOMibGQgN/tK0ngxikzubdBnpKOahsao9s5vEWq6XKWRJRJEVyaWk0f+ZFoqniCXAc
	kB/7a
X-Gm-Gg: ASbGncvWmTEs5U+vKGn9v6FSu3EDCGiIwqENPUbUss+o5dYrkfvLp7W9M2CaHhZQkGQ
	0/nw2TDLzZ6TjZhc5F7EYswysyHhkGj7VMdD+lSOSDEDZRou3hzinl8iZuiEwjwh1sQNudKTGhY
	dnG+m2Mh5P06PEB3LaTsHdvX7jkurQwMEEARDavUW6yxL6a4HEymsrtrgS/Rp2Uh6cqJxmXaeLn
	voyRnrPbEZOOXp/alcdN/wQ6Is9jZMkch4A3jF8czIudTOgBzRXpHmnW0JjWGVpf8rDLHy0pQvp
	GSuYLlHEDFXAHSVQQw+0SBxXnoUfzUdcIjTw7DeE5XK4PZWnH2qqME0OKcoaQ2uxKAJBpXNQXmK
	aw5S5VAuYICh/OAVXOtvK+hjPaijbuNEOqZl9IFFpALMl50bVUD2fVoNYfjgwkr9IklC4CZZdhl
	3c3Vfw1UERSz0=
X-Google-Smtp-Source: AGHT+IFAX/vmHjMJ8gCNh990nkuEzkfpCXYnyMoxCc0laDfZpJMLkpKrX3A0hZU27T5NEi99fqCP+A==
X-Received: by 2002:a05:600c:1f83:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-45b517adfacmr197222375e9.9.1756393571177;
        Thu, 28 Aug 2025 08:06:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 12/23] x86/fsgsbase: Make gskern accesses safe under FRED
Date: Thu, 28 Aug 2025 16:03:58 +0100
Message-Id: <20250828150409.901315-13-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Under FRED, the SWAPGS instructions is disallowed.  Therefore we must use the
MSR path instead.

read_registers() is in the show_registers() path, so this allows Xen to render
it's current state without suffering #UD (and recursing until the stack guard
page is hit).

All hardware with FRED is expected to have some kind of non-serialising access
to these registers.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Broken out of subsequent patch.  Rebased over MSR cleanup.

In principle, the following can also be used for read_registers()

    diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
    index 5799770a2f71..0b0fdf2c5ac4 100644
    --- a/xen/arch/x86/traps.c
    +++ b/xen/arch/x86/traps.c
    @@ -125,16 +125,21 @@ static void read_registers(struct extra_state *state)
         state->cr3 = read_cr3();
         state->cr4 = read_cr4();

    -    if ( !(state->cr4 & X86_CR4_FRED) && (state->cr4 & X86_CR4_FSGSBASE) )
    +    if ( state->cr4 & X86_CR4_FSGSBASE )
         {
             state->fsb = __rdfsbase();
             state->gsb = __rdgsbase();
    +
    +        if ( state->cr4 & X86_CR4_FRED )
    +            goto gskern_fred;
    +
             state->gss = __rdgskern();
         }
         else
         {
             state->fsb = rdmsr(MSR_FS_BASE);
             state->gsb = rdmsr(MSR_GS_BASE);
    +    gskern_fred:
             state->gss = rdmsr(MSR_SHADOW_GS_BASE);
         }

but I'm not sure that it's a good enough improvement to warrant the
complexity.
---
 xen/arch/x86/include/asm/fsgsbase.h | 8 ++++++--
 xen/arch/x86/traps.c                | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/fsgsbase.h b/xen/arch/x86/include/asm/fsgsbase.h
index 24862a6bfea7..5faa3a324332 100644
--- a/xen/arch/x86/include/asm/fsgsbase.h
+++ b/xen/arch/x86/include/asm/fsgsbase.h
@@ -79,7 +79,9 @@ static inline unsigned long read_gs_base(void)
 
 static inline unsigned long read_gs_shadow(void)
 {
-    if ( read_cr4() & X86_CR4_FSGSBASE )
+    unsigned long cr4 = read_cr4();
+
+    if ( !(cr4 & X86_CR4_FRED) && (cr4 & X86_CR4_FSGSBASE) )
         return __rdgs_shadow();
     else
         return rdmsr(MSR_SHADOW_GS_BASE);
@@ -103,7 +105,9 @@ static inline void write_gs_base(unsigned long base)
 
 static inline void write_gs_shadow(unsigned long base)
 {
-    if ( read_cr4() & X86_CR4_FSGSBASE )
+    unsigned long cr4 = read_cr4();
+
+    if ( !(cr4 & X86_CR4_FRED) && (cr4 & X86_CR4_FSGSBASE) )
         __wrgs_shadow(base);
     else
         wrmsrns(MSR_SHADOW_GS_BASE, base);
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index c11d72d47027..66308e7c9edf 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -118,7 +118,7 @@ static void read_registers(struct extra_state *state)
     state->cr3 = read_cr3();
     state->cr4 = read_cr4();
 
-    if ( state->cr4 & X86_CR4_FSGSBASE )
+    if ( !(state->cr4 & X86_CR4_FRED) && (state->cr4 & X86_CR4_FSGSBASE) )
     {
         state->fsb = __rdfsbase();
         state->gsb = __rdgsbase();
-- 
2.39.5


