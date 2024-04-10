Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE69389FFF4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 20:42:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703549.1099253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ructx-0003W4-PJ; Wed, 10 Apr 2024 18:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703549.1099253; Wed, 10 Apr 2024 18:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ructx-0003UA-LL; Wed, 10 Apr 2024 18:42:29 +0000
Received: by outflank-mailman (input) for mailman id 703549;
 Wed, 10 Apr 2024 18:42:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wftW=LP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ructw-0002iK-64
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 18:42:28 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13b4e167-f76a-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 20:42:26 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56e47843cc7so4513665a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 11:42:26 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 gv18-20020a170906f11200b00a4e1a9e1ab4sm7228404ejb.157.2024.04.10.11.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 11:42:24 -0700 (PDT)
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
X-Inumbo-ID: 13b4e167-f76a-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712774545; x=1713379345; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+pmAYkyO8mBQKZUy/WOmEI9YmJh2MHSDjUgBLRaceg=;
        b=JquiehXUbQH9CQFeM0NvNzwfFJgjDk0M53fxUk7DWyVUnONfzWFj7za+dxxIASbwK+
         ww68RlSdFfgSNJs+6ESzW59mKecNc6YzEn51A3Fef7weO5yqQMznlnaQTo1Y+OZjHVku
         oK+7Kb5ZWI2E46CbClLtbU92AFOKZttrm28+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712774545; x=1713379345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+pmAYkyO8mBQKZUy/WOmEI9YmJh2MHSDjUgBLRaceg=;
        b=CN+cMEvVMeUQ1XCVo3sJBJ4jAur3G3xpod6uUcKmO1l5QnogMZ0Cc1f9Q29lk2WMv2
         8sPNnFnM6a4zN7KjfLDZ7wQRuhoc4znYP2eNDmABxSRxjSuruCha/A09HmBOveg1w/eD
         ifNMDI6p2qeEXRZyb9CE+bLU4TDdBuLCM4896cSIvLin66BZKQKJAr7mKdFqd4oMutij
         xftWarA6fX5l89WLd3nJ91Y9uM5uKeYjgZfCouGZpETzSObB2r8GYMdG+L/QKSsJAnKy
         tU0aNl5RwvFY+HCvnLLOfwUAoyvlUGtu+xmChSNgMGPDfnzyoXrLtpP+8L5XiCtLVR0+
         Ypkw==
X-Gm-Message-State: AOJu0YzzUAoN90A1ysbck8oO0+j8yLqBTrDwaRZu61aGIx1iPvRXfoHr
	nkWU1nm3wvMdtHP7gOIU8SIKk/F7IxQTYDr/nW3p8QJUEmjQNlJSv1HMbr1PkGcRP2GT/h4QJgJ
	OqVU=
X-Google-Smtp-Source: AGHT+IFqjGHSfSQxb97+Z0xxY3mHpK1V/Kc7/GWcChZDG6kmo9ZVl3EdBpDQU8y8S2GWq9BRQrQ93Q==
X-Received: by 2002:a17:907:20ec:b0:a51:deec:483c with SMTP id rh12-20020a17090720ec00b00a51deec483cmr1915598ejb.6.1712774545655;
        Wed, 10 Apr 2024 11:42:25 -0700 (PDT)
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
Subject: [PATCH v2 4/4] xen/virtual-region: Drop setup_virtual_regions()
Date: Wed, 10 Apr 2024 19:42:17 +0100
Message-Id: <20240410184217.1482366-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240410184217.1482366-1-andrew.cooper3@citrix.com>
References: <20240410184217.1482366-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All other actions it used to perform have been converted to build-time
initialisation.  The extable setup can done at build time too.

This is one fewer setup step required to get exceptions working.

Take the opportunity to move 'core' into read_mostly, where it probably should
have lived all along.

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

v2:
 * Use CONFIG_HAS_EX_TABLE
---
 xen/arch/arm/setup.c             |  1 -
 xen/arch/x86/setup.c             |  2 --
 xen/common/virtual_region.c      | 19 +++++++++++--------
 xen/include/xen/virtual_region.h |  4 ++--
 4 files changed, 13 insertions(+), 13 deletions(-)

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
index ac983ddc6977..86cd8b999774 100644
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
index db3e0dc9fe74..0d0a3df0b669 100644
--- a/xen/common/virtual_region.c
+++ b/xen/common/virtual_region.c
@@ -25,7 +25,7 @@ static struct virtual_region core, core_init;
 #define LIST_ENTRY_CORE() { .next = &core_init.list,      .prev = &virtual_region_list }
 #define LIST_ENTRY_INIT() { .next = &virtual_region_list, .prev = &core.list }
 
-static struct virtual_region core = {
+static struct virtual_region core __read_mostly = {
     .list = LIST_ENTRY_CORE(),
     .text_start = _stext,
     .text_end = _etext,
@@ -38,6 +38,11 @@ static struct virtual_region core = {
         { __start_bug_frames_2, __stop_bug_frames_2 },
         { __start_bug_frames_3, __stop_bug_frames_3 },
     },
+
+#ifdef CONFIG_HAS_EX_TABLE
+    .ex = __start___ex_table,
+    .ex_end = __stop___ex_table,
+#endif
 };
 
 /* Becomes irrelevant when __init sections are cleared. */
@@ -52,6 +57,11 @@ static struct virtual_region core_init __initdata = {
         { __start_bug_frames_2, __stop_bug_frames_2 },
         { __start_bug_frames_3, __stop_bug_frames_3 },
     },
+
+#ifdef CONFIG_HAS_EX_TABLE
+    .ex = __start___ex_table,
+    .ex_end = __stop___ex_table,
+#endif
 };
 
 /*
@@ -160,13 +170,6 @@ void __init unregister_init_virtual_region(void)
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
index c8a90e3ef26d..a18dfb6fb05e 100644
--- a/xen/include/xen/virtual_region.h
+++ b/xen/include/xen/virtual_region.h
@@ -32,13 +32,13 @@ struct virtual_region
         const struct bug_frame *start, *stop; /* Pointers to array of bug frames. */
     } frame[BUGFRAME_NR];
 
+#ifdef CONFIG_HAS_EX_TABLE
     const struct exception_table_entry *ex;
     const struct exception_table_entry *ex_end;
+#endif
 };
 
 const struct virtual_region *find_text_region(unsigned long addr);
-void setup_virtual_regions(const struct exception_table_entry *start,
-                           const struct exception_table_entry *end);
 void unregister_init_virtual_region(void);
 void register_virtual_region(struct virtual_region *r);
 void unregister_virtual_region(struct virtual_region *r);
-- 
2.30.2


