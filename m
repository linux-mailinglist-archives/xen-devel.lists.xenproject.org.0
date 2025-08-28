Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 366CAB3A3C2
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:11:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099204.1453203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHp-00043d-N9; Thu, 28 Aug 2025 15:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099204.1453203; Thu, 28 Aug 2025 15:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHp-000406-Dm; Thu, 28 Aug 2025 15:11:37 +0000
Received: by outflank-mailman (input) for mailman id 1099204;
 Thu, 28 Aug 2025 15:11:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureCJ-00035A-4T
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:05:55 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ddc10b7-8420-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 17:05:53 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3ceb9c3d98cso215222f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:05:53 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:05:46 -0700 (PDT)
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
X-Inumbo-ID: 7ddc10b7-8420-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393553; x=1756998353; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vizQ3VHS0of9WutZZfkzSTT2z1DRqiDuoluptA3qSA=;
        b=nkIBD8WGDj7dnhIH2NU5aTkt5cnbxTARO4bB1Dc32UPMDohSm5oG/e4mqvzzshOSOY
         93qIIt5JU8JUSHe6CLm2v2Q4yZDHyJFNnm8muy0t91ETNfImgdp+xy75Wa4BXo5FJ7FS
         y6Ai1iVHQb4yDKETHoiUaT5o8s+4IL20mq0mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393553; x=1756998353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vizQ3VHS0of9WutZZfkzSTT2z1DRqiDuoluptA3qSA=;
        b=Ct41BrvE8Ix+Ana7WdNvah+4rHvr4tdcpy6WITHIrJ5K6dgXc2ihHHBEhivCzRus+5
         5IExWjo76E3nEwrdOjohfWW8gPvCx7x7luFoM7GHUn7Z70DqARBkplWnE7gN62j6jF2B
         kXyz4SYvod6NZFMDPmilFS7JwSvsCt+7deYMWo8Lnpe8Ex+dEEtemj3QD7C8AjHR87A8
         aYzy67WoBtmzqviVzjzSWOo3mysI8BA4wcJGQi1pt5f38LEElulCvnTtKRhKKXWrjW3j
         FcAcCffOk6v7qLzwzsHP7kuqfsHDMUx2ARkw0QP02BwJx66XbeqNMubMFQWQijXsStPz
         IaJA==
X-Gm-Message-State: AOJu0YxBvgx86LLYsBwl6uzrFnkj9SWSftase+1C8INSyybew/C80ga2
	uJqNpPFMYfvaxQCqHYG61hJdLGm0SnxEIo2rsdHU2x2dG8yRqS9U5w7Cq/dw3nYNidjL4QrQ8rC
	87fbr
X-Gm-Gg: ASbGncv6F7NVEAiZh2a7rhQ3QBDFpASarTkz3h5ukLUayfnRZfD7xCEwVXVO2m9xyMd
	Oo0/V7kVxTBEaP/lt6+0MlMmk0z2cBoBw4/5BinpvL/zES0mVoHMNdEIrP1SecOi9ofIeXOOflG
	S+5/iZfHEYocS9MUkhcbCTt+fdAcCiBQFXa4rq5Dv3iHZBrLDPq663WXfuBM/FKqchJ9+wS6eF/
	5yHXNHPG+6qpMsy02aLti+UOzVvzo6JNaJB0bsI7cKYSi168hQQgMix5qPEAXoXh3WJ232zKyLP
	JUjiAR8CE+BgAHONM3gj7d4g2dBgky6gMZOvzQqoh4Pv+xy51bRW2dt4nK6DENtpYvwrGAKTIvN
	GgP5/z9w4n3TjdCYaNunzyHlA2oVPDkjryisy/zpEd5qHevlw0hCQEYBIU3t0B79Zb5EVnuynff
	ukqrqRu6lTcdk=
X-Google-Smtp-Source: AGHT+IH4TSYOu4ulE2SxpWCdHmHAm0UgFrckax4DFki9Vf47jObf43Xdd6Kpzocq1jeZJDmlPW+QhA==
X-Received: by 2002:a05:6000:2709:b0:3cd:5815:68d4 with SMTP id ffacd0b85a97d-3cd58156b71mr2638060f8f.57.1756393552645;
        Thu, 28 Aug 2025 08:05:52 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 06/23] x86/traps: Set MSR_PL0_SSP in load_system_tables()
Date: Thu, 28 Aug 2025 16:03:52 +0100
Message-Id: <20250828150409.901315-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

FRED and IDT differ by a Supervisor Token on the base of the shstk.  This
means that the value they load into MSR_PL0_SSP differs by 8.

s3_resume() in particular has logic which is otherwise invariant of FRED mode,
and must not clobber a FRED MSR_PL0_SSP with an IDT one.

This also simplifies the AP path too.  Updating reinit_bsp_stack() is deferred
until later.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Extend comment about clearing the busy bit.
 * Move reinit_bsp_stack() hunk into this patch.
---
 xen/arch/x86/acpi/wakeup_prot.S |  9 ---------
 xen/arch/x86/boot/x86_64.S      | 12 +++---------
 xen/arch/x86/setup.c            |  2 --
 xen/arch/x86/traps-setup.c      |  2 ++
 4 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/acpi/wakeup_prot.S b/xen/arch/x86/acpi/wakeup_prot.S
index fceb4ca353f7..ba0bd77806b8 100644
--- a/xen/arch/x86/acpi/wakeup_prot.S
+++ b/xen/arch/x86/acpi/wakeup_prot.S
@@ -104,15 +104,6 @@ LABEL(s3_resume)
          */
         mov     saved_ssp(%rip), %rdi
 
-        /* Calculate MSR_PL0_SSP from SSP. */
-        mov     $MSR_PL0_SSP, %ecx
-        mov     %rdi, %rdx
-        shr     $32, %rdx
-        mov     %edi, %eax
-        and     $~(STACK_SIZE - 1), %eax
-        or      $(PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8, %eax
-        wrmsr
-
         /*
          * A Restore Token's value is &token + 8 + 64BIT (bit 0).
          * We want to put this on the shstk at SSP - 8.
diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index 3a5ad2764448..11a7e9d3bd23 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -65,17 +65,11 @@ ENTRY(__high_start)
         or      $(PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8, %rdx
 
         /*
-         * Write a new supervisor token.  Doesn't matter on boot, but for S3
-         * resume this clears the busy bit.
+         * Write a new Supervisor Token.  It doesn't matter the first time a
+         * CPU boots, but for S3 resume or hotplug this clears the busy bit so
+         * SETSSBSY can set it again.
          */
         wrssq   %rdx, (%rdx)
-
-        /* Point MSR_PL0_SSP at the token. */
-        mov     $MSR_PL0_SSP, %ecx
-        mov     %edx, %eax
-        shr     $32, %rdx
-        wrmsr
-
         setssbsy
 
 #endif /* CONFIG_XEN_SHSTK */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6c81841426a4..a810bdf6d352 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -907,8 +907,6 @@ static void __init noreturn reinit_bsp_stack(void)
 
     if ( cpu_has_xen_shstk )
     {
-        wrmsrl(MSR_PL0_SSP,
-               (unsigned long)stack + (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8);
         wrmsrl(MSR_S_CET, xen_msr_s_cet_value());
         asm volatile ("setssbsy" ::: "memory");
     }
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index 6e2af58ba0a5..d77be8f83921 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -92,6 +92,7 @@ static void load_system_tables(void)
     {
         volatile uint64_t *ist_ssp = tss_page->ist_ssp;
         unsigned long
+            ssp = stack_top + (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8,
             mce_ssp = stack_top + (IST_MCE * IST_SHSTK_SIZE) - 8,
             nmi_ssp = stack_top + (IST_NMI * IST_SHSTK_SIZE) - 8,
             db_ssp  = stack_top + (IST_DB  * IST_SHSTK_SIZE) - 8,
@@ -118,6 +119,7 @@ static void load_system_tables(void)
         }
 
         wrmsrns(MSR_ISST, (unsigned long)ist_ssp);
+        wrmsrns(MSR_PL0_SSP, (unsigned long)ssp);
     }
 
     _set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
-- 
2.39.5


