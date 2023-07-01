Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AD4744598
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 02:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557674.871291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFOWp-0001f7-JM; Sat, 01 Jul 2023 00:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557674.871291; Sat, 01 Jul 2023 00:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFOWp-0001Yr-8W; Sat, 01 Jul 2023 00:31:55 +0000
Received: by outflank-mailman (input) for mailman id 557674;
 Sat, 01 Jul 2023 00:31:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypVN=CT=gmail.com=christopher.w.clark.io@srs-se1.protection.inumbo.net>)
 id 1qFOWn-0007yM-5t
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 00:31:53 +0000
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [2607:f8b0:4864:20::b34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abc9c57b-17a6-11ee-8611-37d641c3527e;
 Sat, 01 Jul 2023 02:31:51 +0200 (CEST)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-c2cf4e61bc6so2479592276.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Jun 2023 17:31:51 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83]) by smtp.gmail.com with ESMTPSA id
 s68-20020a632c47000000b0055b61cd99a1sm1824296pgs.81.2023.06.30.17.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 17:31:49 -0700 (PDT)
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
X-Inumbo-ID: abc9c57b-17a6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688171510; x=1690763510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goxmEkry0U1HLmMVQmvP8Gde9Okz3AzqGSy+FqLUKTI=;
        b=RlFU8aKTsmTkSL803ovUEfnOumnnC/JpNxk55d3A7YSbtFDeqvpjZ6/eL3TunyDqWh
         zaWgXHHrtXf8xX0sgRwwabeQE86Cm9/vsUzKHuqIQ/XbSMJRM2zm/aSRzGCL/Qz54s12
         bkP/KZqdfw8A7X9ZEQyg6pf90WWkKh3x1f89t7X/jio6qN17ae7jXrFtJYnGzvaEgzut
         B9zrWTvWQYTmA8r23TnpcqdP7KjWBrVOAwyjMRDIw0XruQen8xsrU/HRQt2WoN2QN4/P
         zGdzzWbBLixZFiF19BmePZ3k55LeGaLKxtAr3d8EjmWqAPSZSIXnotYHZsgOc/94ocNl
         1igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688171510; x=1690763510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=goxmEkry0U1HLmMVQmvP8Gde9Okz3AzqGSy+FqLUKTI=;
        b=VfHNBX/5Ahf/xpFhLFcUItScY4OaFWNI9I1W7tRaF7S9ugIAZvk1L7P36L0PridW9G
         XhOGxNrqwmev6pjJoiQTsrb0c7MvT1QLtprsDZqmbHEPfomevyJkvkObXy4QtZBZ7s6w
         qM7RC+3TDcSkzaTu3SuIDSzEiNxblgDu3Hfzsn7FdN4Dt4fS+ZCMxR4rUUA/hnV6k8Cq
         obRXYSwrlFo1C3CeXNpSnH+vHBQDcoA923KrTFovqr9lwHoxQpeODSkr+zm1jsfzFChG
         L1rMeiJd1+sTxIVnR5psQwu0j3xaMreRRdk+ojGLs8+YnnFvSYHPGO/eqLBplHAFmJ0H
         rNGQ==
X-Gm-Message-State: ABy/qLYRi9b026y8iWCQPKiYlF7HgRoQH9miSGZwQQoEYQIMQRviKgW0
	5VoI+iOWRbhvjW+XN9nthYDMJQuzyr8=
X-Google-Smtp-Source: APBJJlEARNWgLjZpa74rQHLaxgPV1NZ3cvoIaJB/ZTsURcawLd8v/B1Kpv9K2P83VDZePWvxDNRJ0w==
X-Received: by 2002:a25:cb4e:0:b0:c1e:a1b8:1667 with SMTP id b75-20020a25cb4e000000b00c1ea1b81667mr4227415ybg.22.1688171509994;
        Fri, 30 Jun 2023 17:31:49 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
	stefano.stabellini@amd.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rich Persaud <persaur@gmail.com>
Subject: [PATCH 08/11] types, x86 boot: define DEFINE_PTR_TYPE and char_ptr_t
Date: Fri, 30 Jun 2023 17:31:29 -0700
Message-Id: <20230701003132.2210306-9-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230701003132.2210306-1-christopher.w.clark@gmail.com>
References: <20230701003132.2210306-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pointer fields within structs need to be defined as fixed size types in
the x86 boot build environment. Using a typedef for the field type
enables the definition to be changed in the 32-bit boot build and
the main hypervisor build, allowing for a single common structure
definition and a common header file.

Add a macro for defining pointer types for fields and use this macro for
pointers to chars in <xen/bootinfo.h> and <asm/bootinfo.h> as
preparation for using these headers in the x86 boot build.

The 32-bit behaviour is obtained by inclusion of "defs.h" first with a
check for such an existing definition on the <xen/types.h> version.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

New in v2
---
 xen/arch/x86/boot/defs.h            | 4 ++++
 xen/arch/x86/include/asm/bootinfo.h | 2 +-
 xen/include/xen/bootinfo.h          | 2 +-
 xen/include/xen/types.h             | 6 ++++++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/boot/defs.h b/xen/arch/x86/boot/defs.h
index 867df6d18d..bc0f1b5cf8 100644
--- a/xen/arch/x86/boot/defs.h
+++ b/xen/arch/x86/boot/defs.h
@@ -65,4 +65,8 @@ typedef unsigned long long paddr_t;
 #define DEFINE_STRUCT_PTR_TYPE(struct_name) \
     typedef uint64_t struct_name ## _ptr_t;
 
+#define DEFINE_PTR_TYPE(type) \
+    typedef uint64_t type ## _ptr_t;
+DEFINE_PTR_TYPE(char);
+
 #endif /* __BOOT_DEFS_H__ */
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 8d1261503d..989fb7a1da 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -15,7 +15,7 @@ struct arch_boot_info {
 #define BOOTINFO_FLAG_X86_MEMMAP       1U << 6
 #define BOOTINFO_FLAG_X86_LOADERNAME   1U << 9
 
-    char *boot_loader_name;
+    char_ptr_t boot_loader_name;
 
     uint32_t mmap_length;
     paddr_t mmap_addr;
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index 8ee3ee36e9..8389da4f72 100644
--- a/xen/include/xen/bootinfo.h
+++ b/xen/include/xen/bootinfo.h
@@ -41,7 +41,7 @@ struct boot_module {
 DEFINE_STRUCT_PTR_TYPE(boot_module);
 
 struct boot_info {
-    char *cmdline;
+    char_ptr_t cmdline;
 
     unsigned int nr_mods;
     boot_module_ptr_t mods;
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index 78a2079619..e807ffe255 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -76,4 +76,10 @@ typedef bool bool_t;
     typedef struct struct_name * struct_name ## _ptr_t;
 #endif
 
+#ifndef DEFINE_PTR_TYPE
+#define DEFINE_PTR_TYPE(type) \
+    typedef type * type ## _ptr_t;
+DEFINE_PTR_TYPE(char);
+#endif
+
 #endif /* __TYPES_H__ */
-- 
2.25.1


