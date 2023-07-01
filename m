Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA96B74459E
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 02:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557671.871271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFOWn-00018H-MN; Sat, 01 Jul 2023 00:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557671.871271; Sat, 01 Jul 2023 00:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFOWn-000161-El; Sat, 01 Jul 2023 00:31:53 +0000
Received: by outflank-mailman (input) for mailman id 557671;
 Sat, 01 Jul 2023 00:31:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypVN=CT=gmail.com=christopher.w.clark.io@srs-se1.protection.inumbo.net>)
 id 1qFOWl-0007yB-9M
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 00:31:51 +0000
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [2001:4860:4864:20::31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab2fcc9f-17a6-11ee-b237-6b7b168915f2;
 Sat, 01 Jul 2023 02:31:50 +0200 (CEST)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1b0156a1c49so2153119fac.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Jun 2023 17:31:50 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83]) by smtp.gmail.com with ESMTPSA id
 s68-20020a632c47000000b0055b61cd99a1sm1824296pgs.81.2023.06.30.17.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 17:31:48 -0700 (PDT)
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
X-Inumbo-ID: ab2fcc9f-17a6-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688171508; x=1690763508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0U+LCev7aRUe6kzgwNY1PJd28KyRT3ussnezbfZRMiA=;
        b=WV+aJ1zVjq4nXbKPyve69zH6JoluUFgsXQ5zQkMXcB2gh0mkT3mMnKBgSwybZpyzla
         jz0D5iwm/fIfnp1y0vMlFyN2W64XDxHa8OCwuKwCSNZV9N22ACjvKBfz98txPImUb88z
         JYcqXFqcGCJM5LNpzRMBe1pSvD1kKEXulmDgIjnjCxwRV48RgP7CcQonF5yUB1MhPvZF
         EjQVnESOoVXDThQ9H148u0UULZB6DO37JfHnRgFkgbEbykyvqnnoxp5d9NIv6tuOZLnT
         VVr74xNXIplbDpbObtcZPEk/gCfqoRnuSwHRP5HG7tE8lBwxytN+STeILwOg9+UCeY9G
         WExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688171508; x=1690763508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0U+LCev7aRUe6kzgwNY1PJd28KyRT3ussnezbfZRMiA=;
        b=FpFC3LGawWmZMiPWcWoBen4PLZTgTLVeaMwnU1qnx4ZXJTKn1AvmgJF9wdyQ9GXDg9
         kBVPX5AaiJDFQCfgVKXWFok859htOEe1zvIg2QNLMyEBaTmUTfiqSFlZdYHd/tvPx8sY
         wfcpn6xsozoyDzoaDxiUe5+0pWo5EWV7IWyoyrsKfQTL2fNky8RaghsEpTcNFi0/+jCi
         KRsM3ZYYS9INRL1rSK9vXuqCXwSsObRVRAtrDtXHew/O0AOBqyFpJSL1JdpUMVqmmWG3
         qyWyyxuobhN+GiNWu5dzxYEwag7Y8PwGOI5fJdddc9EbuEM3TLPIgVhf7eSTlmM5aGUZ
         uCmA==
X-Gm-Message-State: ABy/qLatbhEfMEIVUkEWREUZNSvJtzs0+qGhEeobA0vT3V3tztWodjYc
	ox0YsjrAhtVvOE/BwvJdi+SCtwYlvmk=
X-Google-Smtp-Source: APBJJlF3sIquE7SEmuOVCL336/ZZA3DJYpw9wCSH58nhp6htUSRqmBAs9VrAM0wy0VnaimSdTk7oBw==
X-Received: by 2002:a05:6870:ac26:b0:1ad:5634:750b with SMTP id kw38-20020a056870ac2600b001ad5634750bmr4621178oab.13.1688171508647;
        Fri, 30 Jun 2023 17:31:48 -0700 (PDT)
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
Subject: [PATCH 07/11] x86 boot: define paddr_t and add macros for typedefing struct pointers
Date: Fri, 30 Jun 2023 17:31:28 -0700
Message-Id: <20230701003132.2210306-8-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230701003132.2210306-1-christopher.w.clark@gmail.com>
References: <20230701003132.2210306-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pointer fields within structs need to be defined as fixed size types in
the x86 boot build environment. Using a typedef for the field type
rather than a struct pointer type enables the type definition to
be changed in the 32-bit boot build and the main hypervisor build,
allowing for a single common structure definition and a common header file.

Introduces DEFINE_STRUCT_PTR_TYPE which will generate typedefs with a
_ptr_t suffix for pointers to the specified struct. This is then used
in <xen/bootinfo.h>

The 32-bit behaviour is obtained by inclusion of "defs.h" first with a
check for such an existing definition on the <xen/types.h> version.

paddr_t is used in <xen/bootinfo.h> so a definition is added here to
the x86 boot environment defs.h header.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

New in v2 of series
---
 xen/arch/x86/boot/defs.h            | 5 +++++
 xen/arch/x86/include/asm/bootinfo.h | 2 ++
 xen/include/xen/bootinfo.h          | 7 ++++---
 xen/include/xen/types.h             | 5 +++++
 4 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/boot/defs.h b/xen/arch/x86/boot/defs.h
index f9840044ec..867df6d18d 100644
--- a/xen/arch/x86/boot/defs.h
+++ b/xen/arch/x86/boot/defs.h
@@ -60,4 +60,9 @@ typedef u64 uint64_t;
 #define U16_MAX		((u16)(~0U))
 #define UINT_MAX	(~0U)
 
+typedef unsigned long long paddr_t;
+
+#define DEFINE_STRUCT_PTR_TYPE(struct_name) \
+    typedef uint64_t struct_name ## _ptr_t;
+
 #endif /* __BOOT_DEFS_H__ */
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 30c27980e0..8d1261503d 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -6,6 +6,7 @@ struct arch_bootmodule {
     uint32_t flags;
     unsigned headroom;
 };
+DEFINE_STRUCT_PTR_TYPE(arch_bootmodule);
 
 struct arch_boot_info {
     uint32_t flags;
@@ -19,6 +20,7 @@ struct arch_boot_info {
     uint32_t mmap_length;
     paddr_t mmap_addr;
 };
+DEFINE_STRUCT_PTR_TYPE(arch_boot_info);
 
 struct __packed mb_memmap {
     uint32_t size;
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index 2f4284a91f..8ee3ee36e9 100644
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
     char *cmdline;
 
     unsigned int nr_mods;
-    struct boot_module *mods;
+    boot_module_ptr_t mods;
 
-    struct arch_boot_info *arch;
+    arch_boot_info_ptr_t arch;
 };
 
 #endif
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index 6aba80500a..78a2079619 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -71,4 +71,9 @@ typedef bool bool_t;
 #define test_and_set_bool(b)   xchg(&(b), true)
 #define test_and_clear_bool(b) xchg(&(b), false)
 
+#ifndef DEFINE_STRUCT_PTR_TYPE
+#define DEFINE_STRUCT_PTR_TYPE(struct_name) \
+    typedef struct struct_name * struct_name ## _ptr_t;
+#endif
+
 #endif /* __TYPES_H__ */
-- 
2.25.1


