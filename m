Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64163B1EF78
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:23:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075036.1437604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcr-0001Mm-0K; Fri, 08 Aug 2025 20:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075036.1437604; Fri, 08 Aug 2025 20:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcq-0000zr-3C; Fri, 08 Aug 2025 20:23:40 +0000
Received: by outflank-mailman (input) for mailman id 1075036;
 Fri, 08 Aug 2025 20:23:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTck-0005tW-VP
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:34 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ed307b4-7495-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 22:23:34 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b8de6f7556so1395818f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:34 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:32 -0700 (PDT)
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
X-Inumbo-ID: 8ed307b4-7495-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684613; x=1755289413; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtfP7bNe0+lt/InVx7VRHyBE0nSzZYZ5UWpR2AJnNEw=;
        b=qTMWSBT4XKNjjisltoqSLZHvY5M+XUlcF5f86W4LqJ22wXxWOw30fDt16+ZtnZ0Tgo
         fBat6Axv3AoUfqa5rxe66TD/5tRDWIgxKuvjXVlNb/4s0P+tRq9T8ct1wqHPfxObRRo9
         g4CED3Qn9c1hxSqVUX1nSByV/MKusSVQz5FDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684613; x=1755289413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtfP7bNe0+lt/InVx7VRHyBE0nSzZYZ5UWpR2AJnNEw=;
        b=DXq3i8lkSNRwcfsRuagYCLhdq5el9f1YtX/Llx3IWryg4UXvwVnP5qjIulAetT0ImZ
         oxpTxavTMirvbYU5LDWJdhbpcjSderWX5NyjNRtuvnAn5vrozQk+NdfyQwRMdthzMxVo
         bP6PDdA1cOKKazFNIN2orcYPHoqKFUxX/R7af7BbLBKGTYC9mr8vVfYJJ8+n8R/1UXA9
         q5tBmYG4pWLOd0zgHtOloZiBbPjT0cEvGzeZnAnPaUKg8OhOcvR2hvZZMfzGkZBIbfZw
         KPCFAJN9i0DhTzdE4o26wxs6sx03gskwHzD8TCBKDxOXEOK/tRjat4INOmuJFpxghjXX
         satQ==
X-Gm-Message-State: AOJu0Yw4f2Mx5Fz+SkI0cw5CkaPZKHBYjyKc6QRjsCSk9+f89UgGMMey
	tU/jdyxGisUON3jyF4ZzpAO6MlWbi6ndZx0Rq0niQ+4fbbi9YdnDPHahu1bi5wETlAMuzEffi40
	yJZ7V5Qs=
X-Gm-Gg: ASbGnctUsWfqJoGn65p6xBl1kz3oC3q2fwksvZr2H+DT5anIIMvfcW2+GhzcY/vlp3V
	xOSWVZlKZHCFKJhuPpV5UYGLpdksghHhXmHUWOW907EYLn1Q5ZKXnDLKz9ButKcD5gvhzaWh+kU
	6RAIgiqIYU85AAYE5LWaHlLyygPOeGZ2J8HAdRdT7z1lSp1JsLDYveXlQB4QeOZ2KddbqjBvw0P
	uKJ//WDE4VmhaSts8lD4rZXqWTj5z2RhAUmQsBpoO+hwNQbcyHegxElfrBUdHwhLG+/yoYwLtRb
	2wza7h9jHi6UBrwd+RHAApgJeyRXxV/1e/L4FubQqRzDPMfRkHAtc5DZxNttd4ChkYtkqeEXU9L
	qKxjiwhsjtgzw2x0JxrZEHQYp+9Dgqa1LoU/2AHyax1OgBT2tU6ih2bhdnRV+htOKNk9sT0Lwo5
	4k
X-Google-Smtp-Source: AGHT+IFaijqglVcsIvXxaBiwyvcNEApIzhSD/6AHb8eHwAkK1ZQiMPNf+3Iqf593eESX8CsZDqQWtQ==
X-Received: by 2002:a05:6000:1449:b0:3b7:8d70:ed05 with SMTP id ffacd0b85a97d-3b900929b4cmr3639173f8f.5.1754684613507;
        Fri, 08 Aug 2025 13:23:33 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 18/22] x86/traps: Set MSR_PL0_SSP in load_system_tables()
Date: Fri,  8 Aug 2025 21:23:10 +0100
Message-Id: <20250808202314.1045968-19-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
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
---
 xen/arch/x86/acpi/wakeup_prot.S |  9 ---------
 xen/arch/x86/boot/x86_64.S      | 12 +++---------
 xen/arch/x86/traps-setup.c      |  2 ++
 3 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/acpi/wakeup_prot.S b/xen/arch/x86/acpi/wakeup_prot.S
index 6ddc4011d8b6..c800cd28a7c9 100644
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
index 631ea2f8236e..ebb91d5e3f60 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -65,17 +65,11 @@ ENTRY(__high_start)
         or      $(PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8, %rdx
 
         /*
-         * Write a new supervisor token.  Doesn't matter on boot, but for S3
-         * resume this clears the busy bit.
+         * Write a new Supervisor Token.  It doesn't matter the first time a
+         * CPU boots, but for S3 resume or CPU hot re-add, this clears the
+         * busy bit.
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
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index 3b5e4969a375..c4825fc1b11a 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -96,6 +96,7 @@ static void load_system_tables(void)
     {
         volatile uint64_t *ist_ssp = tss_page->ist_ssp;
         unsigned long
+            ssp = stack_top + (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8,
             mce_ssp = stack_top + (IST_MCE * IST_SHSTK_SIZE) - 8,
             nmi_ssp = stack_top + (IST_NMI * IST_SHSTK_SIZE) - 8,
             db_ssp  = stack_top + (IST_DB  * IST_SHSTK_SIZE) - 8,
@@ -122,6 +123,7 @@ static void load_system_tables(void)
         }
 
         wrmsrns(MSR_ISST, (unsigned long)ist_ssp);
+        wrmsrns(MSR_PL0_SSP, (unsigned long)ssp);
     }
 
     _set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
-- 
2.39.5


