Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E219BBB85A7
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:54:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136893.1473359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oes-00061V-LR; Fri, 03 Oct 2025 22:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136893.1473359; Fri, 03 Oct 2025 22:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oes-0005ww-Fp; Fri, 03 Oct 2025 22:53:50 +0000
Received: by outflank-mailman (input) for mailman id 1136893;
 Fri, 03 Oct 2025 22:53:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4oeq-0004mF-Ui
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:53:48 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2c2b48f-a0ab-11f0-9d14-b5c5bf9af7f9;
 Sat, 04 Oct 2025 00:53:48 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42420c7de22so1631147f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:53:48 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:53:47 -0700 (PDT)
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
X-Inumbo-ID: d2c2b48f-a0ab-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532028; x=1760136828; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQIXxtqR5XkQfZx+k/l76E9CNQJSUSvnIl72OdWgL5Q=;
        b=q2cHapUWMbFWui3JKptQSJlK7KxRikVwuqCHuLYBJjp/57Sxm8U2oxC1WTjYMsCRoM
         AY4ExFVLsDfbATcf6Q68o6KMI6MiPlnBttGJvDUW14zehA4Prc1XVpoNDdQi+7HDk1w0
         ZLmKxzL6b1u3m+Gt6f+x1XX9AOEWqYS2EnVLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532028; x=1760136828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQIXxtqR5XkQfZx+k/l76E9CNQJSUSvnIl72OdWgL5Q=;
        b=ZOeZIdFKYlUTG1VeVnOQ8qbI6DLcUnTbHjZwnA35uzTdOYeu09E3PrOrJ6H1JOtWdg
         BU8KLkQ7pwCtW1z8NJzSMZIVp3PCuuAKTsflHtu0rlqIKuuQSKL1KVWq4sWHuXKnVRzb
         5TAjvDCMZocxFIkwisVCqXMCy6rbzo7dnNPKEokQibgcynXdMzeG11+pPL4wtto0CFx8
         OiJJiTGNfy5Kj1E87J9xA3/RjYlNWyFov6w64SBUgYX7OlJc1zmDMp98/MNWMRR7EaW3
         IHzScUNdY1cyUnATPdtvGC2ns0qGxt33ip+MbHP9kxq6FLlk6cgXiiLV67L7uDy0mdjj
         zung==
X-Gm-Message-State: AOJu0YxedHjISKtZjwEayK9sEC52yK9Jpc1FxjEJrraZfy1WPc/uzYKh
	QbSQYDIuA3RuBML3lAqDNgti+9zwh6+fzx17nJtCBXX3MeCBX6LWFCo6HYMgGkA/pJibRJ8SA16
	3aHY4ImXZlg==
X-Gm-Gg: ASbGnctI2lak1wp2Re0OFSZwaEi7MoZf5dzWwD2G3zS84D3IWohrY8EgYmbymiKVk4c
	3CzTKz+QlB9lKhhX9QmTOajT7bWlO27Y4ekkAHPX1aBdQJmrCugqNf9o59EZL1Etxr6VMhVdznE
	sLZxmFo8ajnqNVLLLMtUaQoUUUMOiDDrszjo1TreDWA1dyMPXPiZvuI87CUQgFEOC5gVuuYfgUp
	md5odtYay+yNjrkv9i2kZ3ivgyQv5Nr+Rsdf/z8rvp6vXGM09AS4knLhQhHwzv/U6ykvWSW53Jv
	4AxXCvKaSCUc3v/Ez2vqkJ9zMgEA1Cc8enriwjqO4JCtH7NA4edpts1J2FwnaosSYSctoipIsZp
	3iNDAAT3jplxuueTb5VOQc0yBZgD1bG1U6pq5Q1CBGPG/NUpxxOR6hl8smGTPrmlLvmURvvHZNZ
	oiyOKlRHLnYR9/va9+MnhH
X-Google-Smtp-Source: AGHT+IEAxLmgwgQ4C3244RCBELilekwp3BnZPeUStuZhMVhFE4xU0Rx/JhXlC9p6+Hns9oQEMIDE/A==
X-Received: by 2002:a05:6000:2890:b0:405:8ef9:ee6e with SMTP id ffacd0b85a97d-4256713743fmr3442385f8f.25.1759532027752;
        Fri, 03 Oct 2025 15:53:47 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 06/22] x86/boot: Use RSTORSSP to establish SSP
Date: Fri,  3 Oct 2025 23:53:18 +0100
Message-Id: <20251003225334.2123667-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Under FRED, SETSSBSY is disallowed, and we want to be setting up FRED prior to
setting up shadow stacks.  As we still need Supervisor Tokens in IDT mode, we
need mode-specific logic to establish SSP.

In FRED mode, write a Restore Token, RSTORSSP it, and discard the resulting
Previous-SSP token.

No change outside of FRED mode.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v3:
 * Adjust the comment in reinit_bsp_stack().

v2:
 * Some logic moved into prior patch.
---
 xen/arch/x86/boot/x86_64.S | 23 +++++++++++++++++++++--
 xen/arch/x86/setup.c       | 25 ++++++++++++++++++++++++-
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index 11a7e9d3bd23..9705d03f849c 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -53,17 +53,21 @@ ENTRY(__high_start)
         mov     %rcx, STACK_CPUINFO_FIELD(cr4)(%r15)
         mov     %rcx, %cr4
 
-        /* WARNING! call/ret now fatal (iff SHSTK) until SETSSBSY loads SSP */
+        /* WARNING! CALL/RET now fatal (iff SHSTK) until SETSSBSY/RSTORSSP loads SSP */
 
 #if defined(CONFIG_XEN_SHSTK)
         test    $CET_SHSTK_EN, %al
         jz      .L_ap_cet_done
 
-        /* Derive the supervisor token address from %rsp. */
+        /* Derive the token address from %rsp. */
         mov     %rsp, %rdx
         and     $~(STACK_SIZE - 1), %rdx
         or      $(PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8, %rdx
 
+        /* Establishing SSP differs between IDT or FRED mode. */
+        bt      $32 /* ilog2(X86_CR4_FRED) */, %rcx
+        jc      .L_fred_shstk
+
         /*
          * Write a new Supervisor Token.  It doesn't matter the first time a
          * CPU boots, but for S3 resume or hotplug this clears the busy bit so
@@ -71,6 +75,21 @@ ENTRY(__high_start)
          */
         wrssq   %rdx, (%rdx)
         setssbsy
+        jmp     .L_ap_cet_done
+
+.L_fred_shstk:
+
+        /*
+         * Write a Restore Token, value: &token + 8 + 64BIT (bit 0) at the
+         * base of the shstk (which isn't in use yet).
+         */
+        lea     9(%rdx), %rdi
+        wrssq   %rdi, (%rdx)
+        rstorssp (%rdx)
+
+        /* Discard the Previous-SSP Token from the shstk. */
+        mov     $2, %edx
+        incsspd %edx
 
 #endif /* CONFIG_XEN_SHSTK */
 .L_ap_cet_done:
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 872a8c63f94a..44da5efa1d20 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -49,6 +49,7 @@
 #include <asm/prot-key.h>
 #include <asm/pv/domain.h>
 #include <asm/setup.h>
+#include <asm/shstk.h>
 #include <asm/smp.h>
 #include <asm/spec_ctrl.h>
 #include <asm/stubs.h>
@@ -908,7 +909,29 @@ static void __init noreturn reinit_bsp_stack(void)
     if ( cpu_has_xen_shstk )
     {
         wrmsrl(MSR_S_CET, xen_msr_s_cet_value());
-        asm volatile ("setssbsy" ::: "memory");
+
+        /*
+         * IDT and FRED differ by a Supervisor Token on the shadow stack.
+         *
+         * In IDT mode, we use SETSSBSY (itself using MSR_PL0_SSP, configured
+         * previously) to mark the Supervisor Token as Busy.  In FRED mode,
+         * there is no token, so we need to create a temporary Restore Token
+         * to establish SSP.
+         */
+        if ( opt_fred )
+        {
+            unsigned long *token =
+                (void *)stack + (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8;
+
+            wrss((unsigned long)token + 9, token);
+            asm volatile ( "rstorssp %0" : "+m" (*token) );
+            /*
+             * We need to discard the resulting Previous-SSP Token, but
+             * reset_stack_and_jump() will do that for us.
+             */
+        }
+        else
+            asm volatile ( "setssbsy" ::: "memory" );
     }
 
     reset_stack_and_jump(init_done);
-- 
2.39.5


