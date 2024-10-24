Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A88399AE89E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 16:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825350.1239589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3ynr-0005B9-S5; Thu, 24 Oct 2024 14:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825350.1239589; Thu, 24 Oct 2024 14:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3ynr-00057H-Ly; Thu, 24 Oct 2024 14:27:07 +0000
Received: by outflank-mailman (input) for mailman id 825350;
 Thu, 24 Oct 2024 14:27:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd6X=RU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3ynq-00048L-FE
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 14:27:06 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b4e705e-9214-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 16:27:06 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5cb72918bddso1308115a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 07:27:05 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c6b4e4sm5707409a12.61.2024.10.24.07.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 07:27:04 -0700 (PDT)
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
X-Inumbo-ID: 0b4e705e-9214-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729780025; x=1730384825; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26Kd1CZ5EW/rvd6sicVOHZnpVwSK6DqF92g9LkP2sKY=;
        b=LN+agBkzDbFDIvYPJbL2oCjm+JIKTvqpG7orGYGYkm67zySfejSgGW632EavNqqYkt
         Ytk9NBc8n6/aFFwBFlcOa3n8GFcQW9JfzkAPDnWpDkmc8xFcXzyKd0xs+50+1p5CQXaQ
         Cj5jOhqRIbo4izFyf2QTm1f4AuA3sCRI7mD8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729780025; x=1730384825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26Kd1CZ5EW/rvd6sicVOHZnpVwSK6DqF92g9LkP2sKY=;
        b=EaPW3NBA7lrBk80fh2Tt/ywLThLahF0ip5ue1a2f0NSb2kXMIZwbqO35gEw9bZBAlv
         +eXexfpMEfaeK5o9JuBFndlvWfXbH9cBor3BFJCR2JxTbfFAfT0zmeoakp4lqebnb7hc
         Ue9y5Z0t4OXkuYuvQ4uwcKMSsvL2rSr79iUH2enOfBFpkj2k1UF3fCJ8OPDuQrf8Cin8
         cYDkNgdQvv85jxzh4YkuKKvGvlzuuf6EJhhDz6WK8ZGbSO2hd8pOAkhGmsILfTQYePfu
         IcRa91VuEGwUHphGjvQbthSVovrDOLvHiOQejPto+/fI0NaoREtWaYsr19MwmwNRX5P9
         mdDg==
X-Gm-Message-State: AOJu0YxKGDBx8GKnn9EPVcfdbbR0LfPLDVoqo4B0MyGogqPiWdTo/rRj
	NSHmmBFXKct/ogG4hJxGhbfRdyke+eyZCHR8lCLQuxFdXw2BiWeVjeP+DodhzUn+s1KmL8VBBMR
	J
X-Google-Smtp-Source: AGHT+IHeJl50mZDISF1NQ6MLFe8fQzTOtXWRCvcbgTukvJ7hfs09TarAKjqp3QVYBzCgBU1kJbcCyw==
X-Received: by 2002:a05:6402:254d:b0:5c9:4281:4515 with SMTP id 4fb4d7f45d1cf-5cb8acb7b0amr5833462a12.17.1729780024768;
        Thu, 24 Oct 2024 07:27:04 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 5/5] x86/boot: Drop the mbi and mod pointers in __start_xen()
Date: Thu, 24 Oct 2024 15:26:54 +0100
Message-Id: <20241024142654.989980-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241024142654.989980-1-andrew.cooper3@citrix.com>
References: <20241024142654.989980-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We can't drop them fully yet, but we can limit their scope to almost nothing,
which serves the same purpose.

This removes the ability to accidentally reintroduce buggy uses of
__va(mbi->mods_addr).

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

v7.5:
 * New
---
 xen/arch/x86/setup.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 5413e1c71be6..511cf5b97909 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1026,8 +1026,6 @@ void asmlinkage __init noreturn __start_xen(void)
     struct cpu_info *info = get_cpu_info(), *bsp_info;
     unsigned int initrdidx, num_parked = 0;
     struct boot_info *bi;
-    multiboot_info_t *mbi;
-    module_t *mod;
     unsigned long nr_pages, raw_max_page, modules_headroom, module_map[1];
     int i, j, e820_warn = 0, bytes = 0;
     unsigned long eb_start, eb_end;
@@ -1063,16 +1061,22 @@ void asmlinkage __init noreturn __start_xen(void)
 
     if ( pvh_boot )
     {
+        multiboot_info_t *mbi;
+        module_t *mod;
+
         pvh_init(&mbi, &mod);
         /*
          * mbi and mod are regular pointers to .initdata.  These remain valid
          * across move_xen().
          */
+
+        bi = multiboot_fill_boot_info(mbi, mod);
     }
     else
     {
-        mbi = __va(multiboot_ptr);
-        mod = __va(mbi->mods_addr);
+        multiboot_info_t *mbi = __va(multiboot_ptr);
+
+        bi = multiboot_fill_boot_info(mbi, __va(mbi->mods_addr));
 
         /*
          * For MB1/2, mbi and mod are directmap pointers into the trampoline.
@@ -1085,12 +1089,8 @@ void asmlinkage __init noreturn __start_xen(void)
         ASSERT(multiboot_ptr < MB(1) || xen_phys_start);
     }
 
-    bi = multiboot_fill_boot_info(mbi, mod);
     bi->module_map = module_map; /* Temporary */
 
-    /* Use bi-> instead */
-#define mbi DO_NOT_USE
-
     /* Parse the command-line options. */
     if ( (kextra = strstr(bi->cmdline, " -- ")) != NULL )
     {
-- 
2.39.5


