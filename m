Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C2896C170
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 16:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790439.1200205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrRS-0001VC-Ri; Wed, 04 Sep 2024 14:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790439.1200205; Wed, 04 Sep 2024 14:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrRS-0001Oa-Kk; Wed, 04 Sep 2024 14:57:06 +0000
Received: by outflank-mailman (input) for mailman id 790439;
 Wed, 04 Sep 2024 14:57:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S0IR=QC=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1slrRR-0001Be-GL
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 14:57:05 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f27429ad-6acd-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 16:57:04 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f3f0bdbcd9so11667211fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 07:57:04 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc56c501sm18862a12.52.2024.09.04.07.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 07:57:02 -0700 (PDT)
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
X-Inumbo-ID: f27429ad-6acd-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725461823; x=1726066623; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aixdLmcSOvSmo9UZ0i0ndwW8Hy8syPJyL13PWBC58Eg=;
        b=RF6usNQQkbxwvb6ngz5sgV0W/85wGGtgGBuXgpCI8zfIL5a4CV2y0QbvQNQ/stwsMD
         mohkViH8HykxmPzNx8Lqmqfso5kFJ49cmaaFqKtNzpt+WWF0UWOAFyUHPwwAv7DdtjqF
         qAUxJPHihjfdWnxicG5BrpLbhGYaBk8CnZ6/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461823; x=1726066623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aixdLmcSOvSmo9UZ0i0ndwW8Hy8syPJyL13PWBC58Eg=;
        b=Ufx+JsoBNY1ELBA/AwAkEoHpc9gCsSYfY21cW90zz9TcBp2+H2WbBf+B0EaxY2qvLy
         nMA13XsCIgG1nZRYz0WArdtcEShUzaTox2FYTT+Ll0C1FjnZ8Tk17izs+R9DPR2UtfX3
         wwjTVEQHfXZapZiN1AP2xTZ3prRd83mON30mCX2PEzqW2o1+OyZZv8mPGbcb/gjfIIBf
         PEs7upTkRQHf7/2o43/Bz/CenVPpixm7d7ZSK3MlMxzgnt1TakGrcqR8fZZm1z4Wc7Ru
         Qm1eLB2hg/8hA2eoGm+nSqBb562sJNSq5MnGJJ7aZNt1VVYl9/TR7fA+QnDQGZL83n0V
         gvqQ==
X-Gm-Message-State: AOJu0YwHt9bOLwyEJE+iw89z73NNNSywQH2U7HdisX9edARdfnx0xvMw
	lM3YzzETZIeXNvETqYmltIBvorGvhGrfT+lSxqg7Xw+oJtrqQgzoP6Oyv2EQX3Ebb2YYerkTF2/
	W
X-Google-Smtp-Source: AGHT+IHXHNW9AqsbZTsyY2+70qJQwGzsG+S49/O6eTtN3lb3Ja72QQLn8iCRoVFCorUIZP9TuJH1qQ==
X-Received: by 2002:a2e:be13:0:b0:2f4:f255:4fc1 with SMTP id 38308e7fff4ca-2f651d6044bmr22475931fa.11.1725461823224;
        Wed, 04 Sep 2024 07:57:03 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [RFC 3/5] Reuse code to relocate trampoline
Date: Wed,  4 Sep 2024 15:56:46 +0100
Message-ID: <20240904145648.33707-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904145648.33707-1-frediano.ziglio@cloud.com>
References: <20240904145648.33707-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 xen/arch/x86/boot/Makefile             |  6 +++---
 xen/arch/x86/boot/build32.lds.S        |  4 ++++
 xen/arch/x86/boot/head.S               | 24 ++--------------------
 xen/arch/x86/boot/reloc-trampoline.c   | 28 ++++++++++++++++++++++++++
 xen/arch/x86/boot/reloc-trampoline64.c |  1 +
 xen/arch/x86/efi/efi-boot.h            | 15 ++------------
 6 files changed, 40 insertions(+), 38 deletions(-)
 create mode 100644 xen/arch/x86/boot/reloc-trampoline.c
 create mode 120000 xen/arch/x86/boot/reloc-trampoline64.c

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index ed8d55866d..42fd1721de 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,6 +1,6 @@
-obj-bin-y += head.o cbundle.o
+obj-bin-y += head.o cbundle.o reloc-trampoline64.o
 
-head-bin-objs := cmdline.o reloc.o
+head-bin-objs := cmdline.o reloc.o reloc-trampoline.o
 
 nocov-y   += $(head-bin-objs)
 noubsan-y += $(head-bin-objs)
@@ -43,7 +43,7 @@ $(obj)/cbundle.o: $(head-bin-objs) $(obj)/build32.other.lds $(obj)/build32.final
 	$(PYTHON) $(srctree)/tools/make_output \
 		--script $(obj)/build32.final.lds \
 		--bin1 $@.1.bin --bin2 $@.2.bin \
-		--map $(obj)/cbundle.map --exports cmdline_parse_early,reloc \
+		--map $(obj)/cbundle.map --exports cmdline_parse_early,reloc,reloc_trampoline32 \
 		--section-header '.section .init.text, "ax", @progbits' \
 		--output $(obj)/cbundle.s
 	$(CC) -c $(obj)/cbundle.s -o $@.tmp
diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.lds.S
index 87d2a589b5..0b7341edeb 100644
--- a/xen/arch/x86/boot/build32.lds.S
+++ b/xen/arch/x86/boot/build32.lds.S
@@ -43,6 +43,10 @@ SECTIONS
          * Potentially they should be all variables. */
         DECLARE_IMPORT(__base_relocs_start);
         DECLARE_IMPORT(__base_relocs_end);
+        DECLARE_IMPORT(__trampoline_rel_start);
+        DECLARE_IMPORT(__trampoline_rel_stop);
+        DECLARE_IMPORT(__trampoline_seg_start);
+        DECLARE_IMPORT(__trampoline_seg_stop);
         . = . + GAP;
         *(.text)
         *(.text.*)
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 791a1fee80..8e35f2a791 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -817,28 +817,8 @@ trampoline_setup:
         mov     %edx, sym_offs(l1_bootmap)(%esi, %ecx, 8)
 
         /* Apply relocations to bootstrap trampoline. */
-        mov     sym_esi(trampoline_phys), %edx
-        lea     sym_esi(__trampoline_rel_start), %edi
-        lea     sym_esi(__trampoline_rel_stop), %ecx
-1:
-        mov     (%edi), %eax
-        add     %edx, (%edi, %eax)
-        add     $4,%edi
-
-        cmp     %ecx, %edi
-        jb      1b
-
-        /* Patch in the trampoline segment. */
-        shr     $4,%edx
-        lea     sym_esi(__trampoline_seg_start), %edi
-        lea     sym_esi(__trampoline_seg_stop), %ecx
-1:
-        mov     (%edi), %eax
-        mov     %dx, (%edi, %eax)
-        add     $4,%edi
-
-        cmp     %ecx, %edi
-        jb      1b
+        mov     sym_esi(trampoline_phys), %eax
+        call    reloc_trampoline32
 
         /* Do not parse command line on EFI platform here. */
         cmpb    $0, sym_esi(efi_platform)
diff --git a/xen/arch/x86/boot/reloc-trampoline.c b/xen/arch/x86/boot/reloc-trampoline.c
new file mode 100644
index 0000000000..2a48890483
--- /dev/null
+++ b/xen/arch/x86/boot/reloc-trampoline.c
@@ -0,0 +1,28 @@
+
+#include <xen/stdint.h>
+
+#pragma GCC visibility push(hidden)
+extern const int32_t __trampoline_rel_start[], __trampoline_rel_stop[];
+extern const int32_t __trampoline_seg_start[], __trampoline_seg_stop[];
+#pragma GCC visibility pop
+
+#if defined(__i386__)
+void reloc_trampoline32(unsigned long phys)
+#elif defined (__x86_64__)
+void reloc_trampoline64(unsigned long phys)
+#else
+#error Unknow architecture
+#endif
+{
+    const int32_t *trampoline_ptr;
+
+    /* Apply relocations to trampoline. */
+    for ( trampoline_ptr = __trampoline_rel_start;
+          trampoline_ptr < __trampoline_rel_stop;
+          ++trampoline_ptr )
+        *(uint32_t *)(*trampoline_ptr + (long)trampoline_ptr) += phys;
+    for ( trampoline_ptr = __trampoline_seg_start;
+          trampoline_ptr < __trampoline_seg_stop;
+          ++trampoline_ptr )
+        *(uint16_t *)(*trampoline_ptr + (long)trampoline_ptr) = phys >> 4;
+}
diff --git a/xen/arch/x86/boot/reloc-trampoline64.c b/xen/arch/x86/boot/reloc-trampoline64.c
new file mode 120000
index 0000000000..20d6dfae1a
--- /dev/null
+++ b/xen/arch/x86/boot/reloc-trampoline64.c
@@ -0,0 +1 @@
+reloc-trampoline.c
\ No newline at end of file
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index f282358435..87a7f8abcf 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -101,27 +101,16 @@ static void __init efi_arch_relocate_image(unsigned long delta)
     }
 }
 
-extern const s32 __trampoline_rel_start[], __trampoline_rel_stop[];
-extern const s32 __trampoline_seg_start[], __trampoline_seg_stop[];
+void reloc_trampoline64(unsigned long phys);
 
 static void __init relocate_trampoline(unsigned long phys)
 {
-    const s32 *trampoline_ptr;
-
     trampoline_phys = phys;
 
     if ( !efi_enabled(EFI_LOADER) )
         return;
 
-    /* Apply relocations to trampoline. */
-    for ( trampoline_ptr = __trampoline_rel_start;
-          trampoline_ptr < __trampoline_rel_stop;
-          ++trampoline_ptr )
-        *(u32 *)(*trampoline_ptr + (long)trampoline_ptr) += phys;
-    for ( trampoline_ptr = __trampoline_seg_start;
-          trampoline_ptr < __trampoline_seg_stop;
-          ++trampoline_ptr )
-        *(u16 *)(*trampoline_ptr + (long)trampoline_ptr) = phys >> 4;
+    reloc_trampoline64(phys);
 }
 
 static void __init place_string(u32 *addr, const char *s)
-- 
2.46.0


