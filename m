Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6DEB3A3AB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:11:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099162.1453116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHM-00088k-1S; Thu, 28 Aug 2025 15:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099162.1453116; Thu, 28 Aug 2025 15:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHL-00086F-Rg; Thu, 28 Aug 2025 15:11:07 +0000
Received: by outflank-mailman (input) for mailman id 1099162;
 Thu, 28 Aug 2025 15:11:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureCL-0003MD-IN
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:05:57 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ffa07de-8420-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 17:05:57 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45b7c01a708so2680865e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:05:57 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:05:54 -0700 (PDT)
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
X-Inumbo-ID: 7ffa07de-8420-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393556; x=1756998356; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKpIj9bqUmtKs7mXRO2v3eu13OoXBJj1yRgQ0Bu+CNs=;
        b=trub9oXRG40USDNfmQe/S66OHDB/eL2/AdSHiO0BJ81ZsJa1M9stVE+rxy6n5QFPpA
         wB/ctM8Lw0y8pn/ZRQEafPp4J3RueBqTkguDGwDNE+wV3Gac6QfxpAx4yUdlY3RJrveY
         DwwztRonCaF1VWxUWFGZq9RFV/j/H0Pdp/xns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393556; x=1756998356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKpIj9bqUmtKs7mXRO2v3eu13OoXBJj1yRgQ0Bu+CNs=;
        b=Cb/PoqLnBWQsx7uMz29SBGkmlTJ3O8jP4reb1/rVgjciE5t8STYufRA/9uB5EK/5zV
         gJA7jA8WOegTfc8873qk8PVVjROBQ9Yq0aXpg+BpBZdXeHuPjutWM4e7AWScMNu04yTj
         DCJrw1NbgFuttXmpZMaWT8aid7KSNPkD8rqJt0B2Kn+CAP46+wwVmhsh1Uv0LFGqN1G2
         WbLoxw08BNosiNnnLw58pZJQG2ZVGQ1g8ToUy0fyqUI0NXmNHJrSm36aeePHQQfLx2NA
         edRnViuk3/ZXKgsFv4JLFMiqz3VQERjMaTXtWlRBl2kFTPXfIhmXx86aKrNvITgR0cZT
         2cbQ==
X-Gm-Message-State: AOJu0YypJEMHWje6dwu5oPG0QysFKbU7XJ4EPCP5fd3Z/LUgj4yWHSAt
	vwJTJ20TbuiPA/FdcNRPJM2zUBwgd/ElWrqnTvdJ3zvlPv+d2vrdxXQpXRY6mX7SuKulGLrTAw5
	Lzf1g
X-Gm-Gg: ASbGncuWJ/dZ6VCm0keJrN4/q2WNYjEECCNcuJ1dhbsjXxf33FVtqS3ZObzf10fFdQD
	l0nXHbpPNBo53SaBGWEKLxJpDC7gg+XLNKBCzQYb5O/K9k6jzAS3chlb/xo6hHJ865tu/Ukrvta
	ku62xX/q/8wsuj8V2ctK0lTOVaWUzXzAY/zqG7BncuEKmV7osTe+qAKSQEEsclQEVHZj7Ev4Tey
	f9/3mhItojWn2RE1gJ+EKVN6kw8GjvIDQvOYr/AS6ug9dHcbAh5EIpbaDYA0DUWWZ3HB29s/U2q
	JN9W/5WcJ3MQ7wessJFolxb6GQ5af+CcuZaLHy4FYlxRIzSnRdpB7EHPuwFw1THdDAvPNzJwOPd
	ctoc0TZ4tnrNa4rJtFLeSAVYCODUrPjx4vRVzoPZ+1ihkRHfkUNYIZdO6L7Agw6t+Djw9+TUU7F
	9FRIseR4gxTCY=
X-Google-Smtp-Source: AGHT+IGjwOZvhe7pZAV6rD1bE2ftxSOuC7NqPE5eevsN4MS/YuWHjsfoJ8djoBPtoThYs1Bxl8p3aQ==
X-Received: by 2002:a05:600c:1f0d:b0:458:bbed:a812 with SMTP id 5b1f17b1804b1-45b517b961cmr216033595e9.17.1756393556209;
        Thu, 28 Aug 2025 08:05:56 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 07/23] x86/boot: Use RSTORSSP to establish SSP
Date: Thu, 28 Aug 2025 16:03:53 +0100
Message-Id: <20250828150409.901315-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
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
index a810bdf6d352..73799fcc684c 100644
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
+         * IDT and FRED differ by a Supervisor Token on the shadow stack, and
+         * therefore by the value in MSR_PL0_SSP.
+         *
+         * In IDT mode, we use SETSSBSY to mark the Supervisor Token as busy.
+         * In FRED mode, there is no token, so we need to create a temporary
+         * Restore Token to establish SSP.
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


