Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E6F9C85A0
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 10:08:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836110.1251988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBVpu-00044R-EC; Thu, 14 Nov 2024 09:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836110.1251988; Thu, 14 Nov 2024 09:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBVpu-0003vr-As; Thu, 14 Nov 2024 09:08:22 +0000
Received: by outflank-mailman (input) for mailman id 836110;
 Thu, 14 Nov 2024 09:08:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3TDs=SJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBVps-0003tk-PZ
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 09:08:20 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb92da40-a267-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 10:08:15 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9ed49edd41so61997966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 01:08:15 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e046ea8sm38491166b.169.2024.11.14.01.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 01:08:13 -0800 (PST)
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
X-Inumbo-ID: fb92da40-a267-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzAiLCJoZWxvIjoibWFpbC1lajEteDYzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZiOTJkYTQwLWEyNjctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTc1Mjk1Ljk0NDMzOSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731575295; x=1732180095; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfpsIkdC3S7Mxflt2zA8gCdCUNbi3Zq3guME8F7/d90=;
        b=RUEQ1V1ABQ11VsQMihhsRit0snTzuSDOaeDSjdacXCCUkQA4oxi/EFJNDM4g3+fSwA
         9s4i9J/TCFnypX/nFf35jhaldAG30c9IjpdKsmJ2yMh9u9LyDzyT2VMKED+de2aXg/p5
         10VU9NSuvLc3kuS4wWj+fqfeGBj2AgVjMUH3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731575295; x=1732180095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfpsIkdC3S7Mxflt2zA8gCdCUNbi3Zq3guME8F7/d90=;
        b=jV+NLnnyY+AfYLihsP5iH7+SHrRIevHGTDURxqgJ5QFg4/fvS5ErvwH3E21fPz2LPV
         SrNykSWra3nifDZ4ZIfnzzN9xxeweD2g2NQbUp9153WH+h9xMe8JXcaV8urhycmrnRQO
         DEaH0v+IxgH85OhPMewhkwflTfeqIUkbc2HHtbs0CJmkXLxjHTTnUE4aVChmV+Z0WO4s
         UZevXTfGJJL3pmA2RA/i91qGesBuNzolMVtrBMt1leVdRzqL2Ih76NKjz62BAndJpmAD
         WUO6qPNMjJTEspV2wcxui2IdQqTC9AH1Ekj+G0qMpwmvRk/H6DgVuIakr3WSLKwu91Xz
         XoIQ==
X-Gm-Message-State: AOJu0Yy+Kzw6wconjMwnpHjonQdQn5v0Ry2ELyo3zcxgvYFJ30JOMgEX
	6ew5lIbCpvLZm+cJdugh2lfQ4FPAPw11jax/FAyTirYJJTX55IV6VXySBWbRvGtJUZply05v5/E
	p
X-Google-Smtp-Source: AGHT+IEcMV+usM6DD7OzaUcJ3UTsg023QCtvKHrHbKhHJyEa5pTLHcXjte/ND5KIDKEKQb8TGmE1bA==
X-Received: by 2002:a17:907:3e02:b0:a99:4261:e9f7 with SMTP id a640c23a62f3a-a9eefff12ddmr2107816666b.39.1731575294863;
        Thu, 14 Nov 2024 01:08:14 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v2 1/4] x86/trampoline: Check the size permanent trampoline at link time
Date: Thu, 14 Nov 2024 09:08:07 +0000
Message-Id: <20241114090810.1961175-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241114090810.1961175-1-andrew.cooper3@citrix.com>
References: <20241114090810.1961175-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a little safer than leaving it to hope.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>

v2:
 * New.
---
 xen/arch/x86/boot/trampoline.S | 2 ++
 xen/arch/x86/xen.lds.S         | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index b8ab0ffdcbb0..55e4a3e402f7 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -161,6 +161,8 @@ GLOBAL(trampoline_cpu_started)
         .equ    wakeup_stack, trampoline_start + PAGE_SIZE
         .global wakeup_stack
 
+LABEL(trampoline_perm_end, 0)
+
 /* From here on early boot only. */
 
         .code32
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 35693f6e3380..221fc2ef3f35 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -410,6 +410,13 @@ ASSERT(!SIZEOF(.plt),      ".plt non-empty")
 ASSERT(!SIZEOF(.rela),     "leftover relocations")
 #endif
 
+/*
+ * The permanent trampoline resides in a single 4k page.  Placement logic
+ * takes care to ensure that trampoline_phys is page aligned.
+ */
+ASSERT((trampoline_perm_end - trampoline_start) <= PAGE_SIZE,
+       "Permentant trampoline too large")
+
 ASSERT((trampoline_end - trampoline_start) < TRAMPOLINE_SPACE - MBI_SPACE_MIN,
     "not enough room for trampoline and mbi data")
 ASSERT((wakeup_stack - wakeup_stack_start) >= WAKEUP_STACK_MIN,
-- 
2.39.5


