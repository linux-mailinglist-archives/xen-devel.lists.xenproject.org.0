Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 466D19B2B34
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 10:19:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826294.1240493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Ltz-0005RQ-OX; Mon, 28 Oct 2024 09:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826294.1240493; Mon, 28 Oct 2024 09:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Ltz-0005Pq-JE; Mon, 28 Oct 2024 09:19:07 +0000
Received: by outflank-mailman (input) for mailman id 826294;
 Mon, 28 Oct 2024 09:19:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lrK=RY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5Ltx-0005MP-Ug
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 09:19:05 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acfaf3cf-950d-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 10:19:04 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5cb74434bc5so5277093a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 02:19:04 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f05deb6sm355961566b.88.2024.10.28.02.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 02:19:02 -0700 (PDT)
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
X-Inumbo-ID: acfaf3cf-950d-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730107143; x=1730711943; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNoXSVIzcbAquQH53qcOLIpudAiENFsvnljoElW6cME=;
        b=Ps+3zxOmsahkjibcjo7VWSd44EXXMC7M0x3s7qJM0shro+17nD0R/2brVocurhe7o8
         KrmbrHBKRR0wbjwtegl7+jB758D4rWIjG9ZoEx42cDaxEoaWGn6f7fbwoftM2/oiLF8c
         QgjCWjeYgTpfDmeXV3iWcOTKVRi5ZO04wdTI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107143; x=1730711943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNoXSVIzcbAquQH53qcOLIpudAiENFsvnljoElW6cME=;
        b=AmTENU3JS7FL1HJzq63Y+C5Hr4ItNYyaW305qH44A9el2qfq77FImBHkYboCuSjshW
         oRWK75mHR/A4NVg2Tm3+SSfw6Ci6eorDEKnZwZU6GRpj7XaHlH+VuyP4xfjvRavzD04d
         xNI5qOD3GyO688zQ+VLmEVSy+6pZcGln+LMk2VcfIo+K12e9ri2C2LukIrU1gil7C7u4
         Z+B85BMacwBH4vWqli2sycWMo2rac7FReN83xn/cdCgpJ7Q+S9HXoggf24BQcx9+kiIZ
         Y0fpm0WvCG+Te6xfmFZ5deoxwMCvZCs9hxb98fGKW8ccpzFoRNbREoPurrzpVdj5wGmR
         7qMA==
X-Gm-Message-State: AOJu0YzpijumNCkiCi0UcjFTTT9SHMMa9GDetPaeGRM+MIlALqDNPG8V
	FYT8o7jhfegDDuxTn/NWkRGk8wh5UU3VjiH4eomjDzQ22pMcIf3gEFxyOXWRofuNxfkPUV5fjY2
	9
X-Google-Smtp-Source: AGHT+IEzCQkQNqwke7Zikn3jgL4+v0prf1RFWQGjUMZAes/8amX7zz05t3Zw99Z0317ykL3aPf5Ewg==
X-Received: by 2002:a17:907:7e8e:b0:a9a:4aa3:728b with SMTP id a640c23a62f3a-a9de61eaa03mr611502666b.53.1730107143103;
        Mon, 28 Oct 2024 02:19:03 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 01/10] x86/ucode: Turn microcode_init_cache() into a presmp_initcall
Date: Mon, 28 Oct 2024 09:18:47 +0000
Message-Id: <20241028091856.2151603-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There's no need for microcode_init_cache() to be called exactly where it is in
__start_xen().  All that matters is it must be after xmalloc() is available
and before APs start up.

As a consequence, microcode_init_cache() runs a little later on boot now.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/cpu/microcode/core.c    | 4 +++-
 xen/arch/x86/include/asm/microcode.h | 1 -
 xen/arch/x86/setup.c                 | 2 --
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 8d916d891e6e..9a2cc631d2aa 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -819,8 +819,9 @@ static int __init early_update_cache(const void *data, size_t len)
     return rc;
 }
 
-int __init microcode_init_cache(struct boot_info *bi)
+static int __init cf_check microcode_init_cache(void)
 {
+    struct boot_info *bi = &xen_boot_info;
     int rc = 0;
 
     if ( !ucode_ops.apply_microcode )
@@ -838,6 +839,7 @@ int __init microcode_init_cache(struct boot_info *bi)
 
     return rc;
 }
+presmp_initcall(microcode_init_cache);
 
 /* BSP calls this function to parse ucode blob and then apply an update. */
 static int __init early_microcode_update_cpu(void)
diff --git a/xen/arch/x86/include/asm/microcode.h b/xen/arch/x86/include/asm/microcode.h
index a278773f8b5d..c62c131fd047 100644
--- a/xen/arch/x86/include/asm/microcode.h
+++ b/xen/arch/x86/include/asm/microcode.h
@@ -28,6 +28,5 @@ int microcode_update_one(void);
 
 struct boot_info;
 int early_microcode_init(struct boot_info *bi);
-int microcode_init_cache(struct boot_info *bi);
 
 #endif /* ASM_X86__MICROCODE_H */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 177f4024abca..5db57e1b1af2 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1952,8 +1952,6 @@ void asmlinkage __init noreturn __start_xen(void)
 
     timer_init();
 
-    microcode_init_cache(bi); /* Needs xmalloc() */
-
     tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */
 
     calculate_raw_cpu_policy(); /* Needs microcode.  No other dependenices. */
-- 
2.39.5


