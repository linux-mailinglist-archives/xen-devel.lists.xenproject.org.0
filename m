Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AED087E7F1
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 12:05:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694592.1083478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmAnb-0008U1-0E; Mon, 18 Mar 2024 11:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694592.1083478; Mon, 18 Mar 2024 11:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmAna-0008Ro-Sd; Mon, 18 Mar 2024 11:04:58 +0000
Received: by outflank-mailman (input) for mailman id 694592;
 Mon, 18 Mar 2024 11:04:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=we9v=KY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmAnZ-0007RX-3u
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 11:04:57 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a40b7b6-e517-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 12:04:55 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a466a1f9ea0so300097766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 04:04:55 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f22-20020aa7d856000000b0056b818544a9sm324882eds.90.2024.03.18.04.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 04:04:53 -0700 (PDT)
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
X-Inumbo-ID: 5a40b7b6-e517-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710759894; x=1711364694; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlCKlDfbOhZKV1J2ps7ot3moOOwpsbpj+o2HtA/2dsQ=;
        b=Ip1clXr2Dhfpc+rr4dbYtc7lovnNLe3WxpJ/Has1xw/8Iu2izlozTgwB5ldJyW6hdw
         a6+sJRyZ3Pi1MznlWCwvb7XETM2gY3PHZsQBAM+ZqSTmBY1G4XfYDNJU7wnreoHKXCuw
         7SMkB/Qpbcm/kqN/7wKds6DgmMTgEoV6Jpk70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710759894; x=1711364694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LlCKlDfbOhZKV1J2ps7ot3moOOwpsbpj+o2HtA/2dsQ=;
        b=ZDKQde2GfKr6andkXfVUTcwhSaVc8nM5sr+TslgI89dbZjH6eAhdgrjVQXxkve9qsS
         dMY5HsfFuKwfvxLFApMzY0hwH9NrX5vGENiRDvAExKdbp79lVHl/bokwjIfmIQIq0c+D
         vwE4rhMWYfPiaex4Sumu+vqPIuotxUlIl/utlYp7dwhaWOCdF+8xPy4gD7mkfAItVBzs
         of8vlsWFvDJDy2I1/wtxQEcgnMJIT+YOhj1WN2XlyOEsDMBcUp/L9ObGzY5ZVYyNhf67
         +A4rKBUFT7ynn63iIJ1U+Esb6gIUiPg1xuJlJrCSY3gFK5GT2pZEKUxstKhWdfknYw+D
         iu2w==
X-Gm-Message-State: AOJu0YzKqyKgECnof3HJaal2SYkZNs1Uo4ob3vI1i6Ifw/RbizBfs0cA
	3yrS0qB9nKrVW30kYnisoOJ0igr0sfxZfB5PSgIReTejIoT+Z31DEH3n9wfbRhKY+uRYXb7As/Z
	J
X-Google-Smtp-Source: AGHT+IHMJ6j/otP77lTUgBDpwoiX+lsd05gj3mtFFuAjMNu82dHTyGRpN770FaBUz6STDrp4ntfLlQ==
X-Received: by 2002:a05:6402:1d34:b0:568:29f8:1d79 with SMTP id dh20-20020a0564021d3400b0056829f81d79mr4412379edb.38.1710759894351;
        Mon, 18 Mar 2024 04:04:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 4/4] xen/virtual-region: Drop setup_virtual_regions()
Date: Mon, 18 Mar 2024 11:04:42 +0000
Message-Id: <20240318110442.3653997-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240318110442.3653997-1-andrew.cooper3@citrix.com>
References: <20240318110442.3653997-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All other actions it used to perform have been converted to build-time
initialisation.  The extable setup can done at build time too.

This is one fewer setup step required to get exceptions working.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/arm/setup.c             |  1 -
 xen/arch/x86/setup.c             |  2 --
 xen/common/virtual_region.c      | 17 ++++++++++-------
 xen/include/xen/virtual_region.h |  2 --
 4 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 424744ad5e1a..b9a7f61f73ef 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -719,7 +719,6 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
     percpu_init_areas();
     set_processor_id(0); /* needed early, for smp_processor_id() */
 
-    setup_virtual_regions(NULL, NULL);
     /* Initialize traps early allow us to get backtrace when an error occurred */
     init_traps();
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a21984b1ccd8..801f5ca01a26 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1014,8 +1014,6 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     smp_prepare_boot_cpu();
     sort_exception_tables();
 
-    setup_virtual_regions(__start___ex_table, __stop___ex_table);
-
     /* Full exception support from here on in. */
 
     rdmsrl(MSR_EFER, this_cpu(efer));
diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
index ad39bb74e15c..5322766ac765 100644
--- a/xen/common/virtual_region.c
+++ b/xen/common/virtual_region.c
@@ -39,6 +39,11 @@ static struct virtual_region core = {
         { __start_bug_frames_2, __stop_bug_frames_2 },
         { __start_bug_frames_3, __stop_bug_frames_3 },
     },
+
+#ifdef CONFIG_X86
+    .ex = __start___ex_table,
+    .ex_end = __stop___ex_table,
+#endif
 };
 
 /* Becomes irrelevant when __init sections are cleared. */
@@ -57,6 +62,11 @@ static struct virtual_region core_init __initdata = {
         { __start_bug_frames_2, __stop_bug_frames_2 },
         { __start_bug_frames_3, __stop_bug_frames_3 },
     },
+
+#ifdef CONFIG_X86
+    .ex = __start___ex_table,
+    .ex_end = __stop___ex_table,
+#endif
 };
 
 /*
@@ -168,13 +178,6 @@ void __init unregister_init_virtual_region(void)
     remove_virtual_region(&core_init);
 }
 
-void __init setup_virtual_regions(const struct exception_table_entry *start,
-                                  const struct exception_table_entry *end)
-{
-    core_init.ex = core.ex = start;
-    core_init.ex_end = core.ex_end = end;
-}
-
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/virtual_region.h b/xen/include/xen/virtual_region.h
index c8a90e3ef26d..2c4deaaa2889 100644
--- a/xen/include/xen/virtual_region.h
+++ b/xen/include/xen/virtual_region.h
@@ -37,8 +37,6 @@ struct virtual_region
 };
 
 const struct virtual_region *find_text_region(unsigned long addr);
-void setup_virtual_regions(const struct exception_table_entry *start,
-                           const struct exception_table_entry *end);
 void unregister_init_virtual_region(void);
 void register_virtual_region(struct virtual_region *r);
 void unregister_virtual_region(struct virtual_region *r);
-- 
2.30.2


