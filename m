Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BD37447A6
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 09:19:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557778.871459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFUso-0008Ah-Ry; Sat, 01 Jul 2023 07:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557778.871459; Sat, 01 Jul 2023 07:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFUso-00085r-KP; Sat, 01 Jul 2023 07:19:02 +0000
Received: by outflank-mailman (input) for mailman id 557778;
 Sat, 01 Jul 2023 07:19:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypVN=CT=gmail.com=christopher.w.clark.io@srs-se1.protection.inumbo.net>)
 id 1qFUsm-0006No-Mf
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 07:19:00 +0000
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [2607:f8b0:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b9c26ca-17df-11ee-8611-37d641c3527e;
 Sat, 01 Jul 2023 09:18:59 +0200 (CEST)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3a3373211a1so1922940b6e.0
 for <xen-devel@lists.xenproject.org>; Sat, 01 Jul 2023 00:18:58 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83]) by smtp.gmail.com with ESMTPSA id
 s19-20020aa78d53000000b00673e652985bsm4108866pfe.118.2023.07.01.00.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 00:18:56 -0700 (PDT)
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
X-Inumbo-ID: 8b9c26ca-17df-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688195937; x=1690787937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6Cu78312/uyuTtWf3JY9jjpC+4RgagbuKLSP43QOoI=;
        b=UPbuVkZz1oAK/2LyG2d2Jw8INSlnXa/NlmFvB4kRqCC2gVqMidnQRphhgxR0TSHT+3
         0s32mnwZ5C2MiyRI81PFiG2f3X7YsruBzmry+l2xRuxLJooDABjPUd+qXphVLrAW/B+y
         6xxLai7iGBBcCRX9fk/IIKGyDalggyofNzF//yvHePzXSplMvL5ZaLhzY/JrPkWjxaqX
         D6SRMilMh4UjMDBVz35siAbBdhGqP/ThyZryTLkDquTjEDgVeLyQU2nu+7oabv4Fmg4k
         02BmtpWmfzce0nwrfyeA5AltLslsexA90Qc7lLM01L0VCpHq2WUAfmBo/Jp4+3M2gjMV
         Vmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688195937; x=1690787937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S6Cu78312/uyuTtWf3JY9jjpC+4RgagbuKLSP43QOoI=;
        b=RdSZPZBDpO2eSdqIUe7ETNoJ3aJ+B7n2f/NGW5SeC3KXHpcE/hC6pq6f92V+ZifejX
         ZiGjER0sfM9QcOuAZjlP0lGTGyGLh+uk3/VDk9o+KB4BL7qDl/mbpWVv+UYHkL23DSpv
         HWPtPmsDf9G9qKmj/CnrOiHUIG6qRBQ2zAEeI43J+DTj/T8J5x/zfGc76aYJYyHnxQpb
         WXqQB5D1Qn604Wf5+o+F0eo9xFaR4WfLtp0pPJvKLwdT5Hyzjfht7rFFjUaVWCTTILAH
         fRwYVSoOMIe3nbqfv4XgpSKkFP0O3gel7hpViWsq+IVfU4EVM1W+e8rRWMFIYupBJ4GY
         BODA==
X-Gm-Message-State: AC+VfDw80XbqQGGoPB5ca8mtmc4/RHNjaWUeNCbB5xMoKJ/ADRIkMSb5
	hJ8Gu2lhOLUkRVrrGiTiw4vtxwV2fqk=
X-Google-Smtp-Source: ACHHUZ5bs2jo7O3BDp2NAaVYCHQcw/ounbIgX+But52KUkZXfA77A5ZAv/5/HHJcZPqmWMwDeEj4RQ==
X-Received: by 2002:a05:6808:1917:b0:3a0:6949:c884 with SMTP id bf23-20020a056808191700b003a06949c884mr6924756oib.34.1688195937374;
        Sat, 01 Jul 2023 00:18:57 -0700 (PDT)
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
Subject: [PATCH 07/10] x86 boot: define paddr_t and add macros for typedefing struct pointers
Date: Sat,  1 Jul 2023 00:18:32 -0700
Message-Id: <20230701071835.41599-8-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230701071835.41599-1-christopher.w.clark@gmail.com>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pointer fields within structs need to be defined as fixed size types in
the x86 boot build environment. Using a typedef for the field type
rather than a struct pointer type enables the type definition to
be changed in the 32-bit boot build and the main hypervisor build,
allowing for a single common structure definition and a common header file.

Introduces DEFINE_STRUCT_PTR_TYPE and DEFINE_PTR_TYPE which will
generate typedefs with a _ptr_t suffix for pointers to the specified
type. This is then used in <xen/bootinfo.h> for pointers within structs
as preparation for using these headers in the x86 boot build.

The 32-bit behaviour is obtained by inclusion of "defs.h" first with a
check for such an existing definition on the <xen/types.h> version.

paddr_t is used in <xen/bootinfo.h> so a definition is added here to
the x86 boot environment defs.h header.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

---
Changes since v2: This is two v2 patches merged into one for v3.
Changes since v1: New in v2 of series.

 xen/arch/x86/boot/defs.h            |  9 +++++++++
 xen/arch/x86/include/asm/bootinfo.h |  4 +++-
 xen/include/xen/bootinfo.h          |  9 +++++----
 xen/include/xen/types.h             | 11 +++++++++++
 4 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/boot/defs.h b/xen/arch/x86/boot/defs.h
index f9840044ec..bc0f1b5cf8 100644
--- a/xen/arch/x86/boot/defs.h
+++ b/xen/arch/x86/boot/defs.h
@@ -60,4 +60,13 @@ typedef u64 uint64_t;
 #define U16_MAX		((u16)(~0U))
 #define UINT_MAX	(~0U)
 
+typedef unsigned long long paddr_t;
+
+#define DEFINE_STRUCT_PTR_TYPE(struct_name) \
+    typedef uint64_t struct_name ## _ptr_t;
+
+#define DEFINE_PTR_TYPE(type) \
+    typedef uint64_t type ## _ptr_t;
+DEFINE_PTR_TYPE(char);
+
 #endif /* __BOOT_DEFS_H__ */
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 30c27980e0..989fb7a1da 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -6,6 +6,7 @@ struct arch_bootmodule {
     uint32_t flags;
     unsigned headroom;
 };
+DEFINE_STRUCT_PTR_TYPE(arch_bootmodule);
 
 struct arch_boot_info {
     uint32_t flags;
@@ -14,11 +15,12 @@ struct arch_boot_info {
 #define BOOTINFO_FLAG_X86_MEMMAP       1U << 6
 #define BOOTINFO_FLAG_X86_LOADERNAME   1U << 9
 
-    char *boot_loader_name;
+    char_ptr_t boot_loader_name;
 
     uint32_t mmap_length;
     paddr_t mmap_addr;
 };
+DEFINE_STRUCT_PTR_TYPE(arch_boot_info);
 
 struct __packed mb_memmap {
     uint32_t size;
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index 2f4284a91f..8389da4f72 100644
--- a/xen/include/xen/bootinfo.h
+++ b/xen/include/xen/bootinfo.h
@@ -35,17 +35,18 @@ struct boot_module {
     mfn_t mfn;
     size_t size;
 
-    struct arch_bootmodule *arch;
+    arch_bootmodule_ptr_t arch;
     struct boot_string string;
 };
+DEFINE_STRUCT_PTR_TYPE(boot_module);
 
 struct boot_info {
-    char *cmdline;
+    char_ptr_t cmdline;
 
     unsigned int nr_mods;
-    struct boot_module *mods;
+    boot_module_ptr_t mods;
 
-    struct arch_boot_info *arch;
+    arch_boot_info_ptr_t arch;
 };
 
 #endif
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index 6aba80500a..e807ffe255 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -71,4 +71,15 @@ typedef bool bool_t;
 #define test_and_set_bool(b)   xchg(&(b), true)
 #define test_and_clear_bool(b) xchg(&(b), false)
 
+#ifndef DEFINE_STRUCT_PTR_TYPE
+#define DEFINE_STRUCT_PTR_TYPE(struct_name) \
+    typedef struct struct_name * struct_name ## _ptr_t;
+#endif
+
+#ifndef DEFINE_PTR_TYPE
+#define DEFINE_PTR_TYPE(type) \
+    typedef type * type ## _ptr_t;
+DEFINE_PTR_TYPE(char);
+#endif
+
 #endif /* __TYPES_H__ */
-- 
2.25.1


