Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8B287A9F3
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:03:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692493.1079693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQ8n-0004Qm-Qv; Wed, 13 Mar 2024 15:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692493.1079693; Wed, 13 Mar 2024 15:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQ8n-0004NQ-Nj; Wed, 13 Mar 2024 15:03:37 +0000
Received: by outflank-mailman (input) for mailman id 692493;
 Wed, 13 Mar 2024 15:03:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwto=KT=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rkQ8m-0003t5-Km
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:03:36 +0000
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [2607:f8b0:4864:20::834])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd576bb4-e14a-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 16:03:35 +0100 (CET)
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-42f0df98361so31246061cf.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 08:03:36 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 s9-20020ac85ec9000000b0042ef4b5f4fbsm4930034qtx.38.2024.03.13.08.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 08:03:33 -0700 (PDT)
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
X-Inumbo-ID: dd576bb4-e14a-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710342214; x=1710947014; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ms+OeqOZX4404kFqNdRZ2zfEW4WAGHmhK2r80eh4xas=;
        b=UHYa7BABn5ne2EdclbcNl7t1JLBOk66YsiJeVxsRa4PmKy3hU2/jJ3iRpfAIRGbvET
         t2kfxaBm92gQSJSqwpm/v/i2IMOrA/IH7i0zptMrGLAU8S9IYhCypSWJUD0xy4LrXfJq
         dRkpD/UdihRfml3uEyjsGsMcsPeacomP3+lMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710342214; x=1710947014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ms+OeqOZX4404kFqNdRZ2zfEW4WAGHmhK2r80eh4xas=;
        b=kfDcW6F4xCtAV+fkZonEYO/1rQZPfMPY4a9HcReSDIQwjpHoUEKbRDIEQXph0CU52F
         hlJkoyXanKKPTbXTcP6kCsgpyfxs7CrMaj9UHStCSBJgpuERglrJ9fAmQU7QGezSpzY4
         Pc2QhZNGNu51PCk57YhBtonu0fl2kyzkVHYAw04riYgRgs//gffP3Z0+kG8qV9hv5Qwl
         zxE4il/w2PpCsrZ9ZFf21wywTq8YViKeI0lZpPOsjrTu32ym/ew9cpXPaZ++Yi5mqR03
         loJlcN3iL3vrfgoOAiHI6Ft1ye+faKlByISlo6Eo1UbD4sXUZVd5j6xAq4rAynuKBUYk
         Ws9A==
X-Gm-Message-State: AOJu0YxltmYtELxr24DRls3QoO4N5+iYN5YenbrRXrcO72uhuQf0w3ez
	GGP1iS+XpYMMBoM99R5sMNmNFhYbCAIQyfbYyA3NrHkb3QxBsgNFUcxqOcJYFrFhRIKntrK1kxC
	98LX6
X-Google-Smtp-Source: AGHT+IGD5WDqlGcDnqTFuq88+hJrcAzyIpQImYLYjVAc/i0xiKxZ/uOtj6CH1d9E36pCo1ma3X619A==
X-Received: by 2002:ac8:5f84:0:b0:42e:eb34:5ba5 with SMTP id j4-20020ac85f84000000b0042eeb345ba5mr3769978qta.28.1710342214086;
        Wed, 13 Mar 2024 08:03:34 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/4] x86: Add support for building a multiboot2 PE binary
Date: Wed, 13 Mar 2024 15:04:37 +0000
Message-ID: <20240313150439.791213-3-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240313150439.791213-1-ross.lagerwall@citrix.com>
References: <20240313150439.791213-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new config option, CONFIG_MULTIBOOT_PE, that when set changes
xen.gz to be a compressed PE binary instead of a compressed ELF binary.
This requires use with a multiboot2 loader that supports the PE load
type.

Using this option allows the binary to be signed and verified by Shim.
This means the same xen.gz can then be used for BIOS boot, UEFI Boot and
UEFI boot with Secure Boot verification (all with the convenience of
GRUB2 as a bootloader).

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/Makefile             |  1 +
 xen/arch/x86/Kconfig     |  6 +++++
 xen/arch/x86/Makefile    | 48 ++++++++++++++++++++++++++++++++++++++++
 xen/arch/x86/boot/head.S | 33 +++++++++++++++++++++++++++
 4 files changed, 88 insertions(+)

diff --git a/xen/Makefile b/xen/Makefile
index 21832d640225..c9461c9778cc 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -581,6 +581,7 @@ _clean:
 		-o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET)-syms $(TARGET)-syms.map
 	rm -f $(TARGET).efi $(TARGET).efi.map $(TARGET).efi.elf $(TARGET).efi.stripped
+	rm -f $(TARGET).elf $(TARGET).map
 	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
 	rm -f .banner .allconfig.tmp include/xen/compile.h
 	rm -rf $(objtree)/arch/*/include/generated
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 1acdffc51c22..2d8f6e687e58 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -348,6 +348,12 @@ config REQUIRE_NX
 	  was unavailable. However, if enabled, Xen will no longer boot on
 	  any CPU which is lacking NX support.
 
+config MULTIBOOT_PE
+	bool "Build the multiboot binary as PE"
+	help
+	  Build the multiboot xen.gz binary as a PE binary rather than ELF.
+	  This allows it to be signed and verified when using Secure Boot
+	  with Shim and a bootloader.
 endmenu
 
 source "common/Kconfig"
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 26d87405297b..e26b1cb35036 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -123,6 +123,53 @@ syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --error-dup
 
 orphan-handling-$(call ld-option,--orphan-handling=warn) += --orphan-handling=warn
 
+ifeq ($(CONFIG_MULTIBOOT_PE),y)
+ifneq ($(XEN_BUILD_PE),y)
+$(TARGET): FORCE
+	rm -f $@
+	echo 'PE build not supported'
+else
+$(TARGET): VIRT_BASE = 0x$(shell $(NM) $(obj)/efi/relocs-dummy.o | sed -n 's, A VIRT_START$$,,p')
+$(TARGET): $(objtree)/prelink.o $(note_file) $(obj)/efi.lds \
+           $(obj)/efi/relocs-dummy.o $(obj)/efi/set-coff-flags $(TARGET)-syms $(efi-y)
+ifeq ($(CONFIG_DEBUG_INFO),y)
+	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
+endif
+	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) --disable-reloc-section \
+	      -T $(obj)/efi.lds -N $< $(relocs-dummy) \
+	      $(objtree)/common/symbols-dummy.o $(note_file_option) \
+	      -o $(dot-target).$(VIRT_BASE).0
+	$(NM) -pa --format=sysv $(dot-target).$(VIRT_BASE).0 \
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+		> $(dot-target).0s.S
+	$(MAKE) $(build)=$(@D) .$(@F).0s.o
+	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) --disable-reloc-section \
+	      -T $(obj)/efi.lds -N $< $(dot-target).0s.o $(note_file_option) \
+	      -o $(dot-target).$(VIRT_BASE).1
+	$(NM) -pa --format=sysv $(dot-target).$(VIRT_BASE).1 \
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+		> $(dot-target).1s.S
+	$(MAKE) $(build)=$(@D) .$(@F).1s.o
+	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) --disable-reloc-section \
+	      -T $(obj)/efi.lds -N $< $(dot-target).1s.o $(orphan-handling-y) \
+	      $(note_file_option) -o $@.tmp
+	od -t x4 -N 8192 $@.tmp  | grep 1badb002 > /dev/null || \
+		{ echo "No Multiboot1 header found" >&2; false; }
+	od -t x4 -N 32768 $@.tmp | grep e85250d6 > /dev/null || \
+		{ echo "No Multiboot2 header found" >&2; false; }
+	mv $@.tmp $(TARGET)
+	$(NM) -pa --format=sysv $@ \
+		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
+		> $@.map
+ifeq ($(CONFIG_DEBUG_INFO),y)
+	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
+endif
+	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
+ifeq ($(CONFIG_XEN_IBT),y)
+	$(SHELL) $(srctree)/tools/check-endbr.sh $@
+endif
+endif
+else
 $(TARGET): TMP = $(dot-target).elf32
 $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
 	$(obj)/boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET) \
@@ -132,6 +179,7 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
 	od -t x4 -N 32768 $(TMP) | grep e85250d6 > /dev/null || \
 		{ echo "No Multiboot2 header found" >&2; false; }
 	mv $(TMP) $(TARGET)
+endif
 
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 015023915a72..84dc8b76b61d 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -44,6 +44,25 @@
 .Lmb2ht_init_end\@:
         .endm
 
+        .macro mb2ht_qargs arg:req, args:vararg
+        .quad \arg
+        .ifnb \args
+        mb2ht_args \args
+        .endif
+        .endm
+
+        .macro mb2ht_qinit type:req, req:req, args:vararg
+        .balign MULTIBOOT2_TAG_ALIGN, 0xc2 /* Avoid padding with long nops. */
+.Lmb2ht_init_start\@:
+        .short \type
+        .short \req
+        .long .Lmb2ht_init_end\@ - .Lmb2ht_init_start\@
+        .ifnb \args
+        mb2ht_qargs \args
+        .endif
+.Lmb2ht_init_end\@:
+        .endm
+
 ENTRY(start)
         jmp     __start
 
@@ -90,8 +109,14 @@ multiboot2_header:
                    0x200000, /* Load address alignment (2 MiB). */ \
                    MULTIBOOT2_LOAD_PREFERENCE_HIGH
 
+        /* Load type */
+#ifdef CONFIG_MULTIBOOT_PE
+        mb2ht_init MB2_HT(LOAD_TYPE), MB2_HT(OPTIONAL), \
+                   MULTIBOOT2_LOAD_TYPE_PE
+#else
         mb2ht_init MB2_HT(LOAD_TYPE), MB2_HT(OPTIONAL), \
                    MULTIBOOT2_LOAD_TYPE_ELF
+#endif
 
         /* Console flags tag. */
         mb2ht_init MB2_HT(CONSOLE_FLAGS), MB2_HT(OPTIONAL), \
@@ -107,8 +132,16 @@ multiboot2_header:
         mb2ht_init MB2_HT(EFI_BS), MB2_HT(OPTIONAL)
 
         /* EFI64 Multiboot2 entry point. */
+#ifdef CONFIG_MULTIBOOT_PE
+        mb2ht_qinit MB2_HT(ENTRY_ADDRESS_EFI64), MB2_HT(OPTIONAL), \
+                   __efi64_mb2_start
+
+        mb2ht_qinit MB2_HT(ENTRY_ADDRESS), MB2_HT(OPTIONAL), \
+                   start
+#else
         mb2ht_init MB2_HT(ENTRY_ADDRESS_EFI64), MB2_HT(OPTIONAL), \
                    sym_offs(__efi64_mb2_start)
+#endif
 
         /* Multiboot2 header end tag. */
         mb2ht_init MB2_HT(END), MB2_HT(REQUIRED)
-- 
2.43.0


