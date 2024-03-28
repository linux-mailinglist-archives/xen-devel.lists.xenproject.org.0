Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3808902AB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:09:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698948.1091230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprNQ-0007pO-0B; Thu, 28 Mar 2024 15:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698948.1091230; Thu, 28 Mar 2024 15:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprNP-0007mS-T1; Thu, 28 Mar 2024 15:09:11 +0000
Received: by outflank-mailman (input) for mailman id 698948;
 Thu, 28 Mar 2024 15:09:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jyVg=LC=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rprNN-0007WX-NS
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:09:09 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f6a6a98-ed15-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 16:09:07 +0100 (CET)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-6969388c36fso5311286d6.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:09:07 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4-20020a0562140d0400b00690bfb6aac7sm722826qvh.51.2024.03.28.08.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 08:09:05 -0700 (PDT)
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
X-Inumbo-ID: 1f6a6a98-ed15-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711638546; x=1712243346; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqdKROOU2Tlw2FDdDoeLuuSjku12CQCqlFzulfX+afo=;
        b=ZrVpU/BQshHpnUpgBn7Kv/mpBmSiTdinC1aVzL5BIUrvM3hWgtFudij8JmXK+Tj+9O
         g3/ZB9837th6Mf5BSh8BSSUFqT6bcqUd5/KPOSbMPkDf1T1/CyQjYo2H3Wve9P1qkrqt
         xxaEKEg80/+uKezrabJuQaUY3/opOBKRKxDhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711638546; x=1712243346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqdKROOU2Tlw2FDdDoeLuuSjku12CQCqlFzulfX+afo=;
        b=ma6+GuUqvQUyF0+ABwllHSRwT4Diteu2PvmkrUYvM+FzF/Q8WrGiDncByfAZihib96
         W7RJJdXpfGuTS9mhkcFSk3XeQAPlda9uD4pZ5aGfT8HSjRtcJYehCKX8PIj8MILPKcVX
         IYfg5wgzRY0dL3Gt7ElPLIRJEH8vBd4EbKT3spM2kLVBIawE2uOXVFOCQaBT2mXajRy+
         rw6SqOU0hsGu7T9oC4nsT2T2c1epPvcrIm+CkxWDu66wHJ6pAam3JS67mKRTp/HI0B4H
         QcoaukPbtk6ZlC8ChBYouB1J8/0LG5g5hqKueogzdD+HhCbTxyeLsK53rSQp19A8qZE4
         OeoQ==
X-Gm-Message-State: AOJu0Yx9rAxIi7WQfUIfmsbb6lEq9CXwtaEyOk6bEX83F03MNCTY/Cbo
	04TYPxmmKK4Nbiq0Ybzi9PWGl8fZtJtFDcGf6kr6rBNHJB+3Oz6saLvgwouYe8ntPgFGDrtjrja
	pSQ==
X-Google-Smtp-Source: AGHT+IFpeHGSFFVyn1zivBjiDehFXmszTc/WGV7pU0cGNLf/3VWGT+299hCsGHmLBOQrPDisuwMuWg==
X-Received: by 2002:a0c:e0c4:0:b0:696:8525:5c3b with SMTP id x4-20020a0ce0c4000000b0069685255c3bmr3094885qvk.40.1711638546301;
        Thu, 28 Mar 2024 08:09:06 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/2] x86: Add support for building a multiboot2 PE binary
Date: Thu, 28 Mar 2024 15:11:05 +0000
Message-ID: <20240328151106.1451104-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240328151106.1451104-1-ross.lagerwall@citrix.com>
References: <20240328151106.1451104-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In addition to building xen.efi and xen.gz, build xen-mbi.exe. The
latter is a PE binary that can be used with a multiboot2 loader that
supports loading PE binaries.

Using this option allows the binary to be signed and verified by Shim.
This means the same xen-mbi.exe binary can then be used for BIOS boot,
UEFI Boot and UEFI boot with Secure Boot verification (all with the
convenience of GRUB2 as a bootloader).

The new binary is created by modifying xen.efi:
* Relocations are stripped since they are not needed.
* The image base address is set to 0 since it must necessarily be below
  4 GiB and the loader will relocate it anyway.
* The PE entry point is set to the multiboot2 entry point rather than
  the normal EFI entry point. This is only relevant for BIOS boot since
  for EFI boot the entry point is specified via a multiboot2 tag.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 .gitignore                        |  2 +
 xen/Makefile                      |  1 +
 xen/arch/x86/Makefile             | 16 ++++++-
 xen/arch/x86/efi/modify-mbi-exe.c | 77 +++++++++++++++++++++++++++++++
 4 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/x86/efi/modify-mbi-exe.c

diff --git a/.gitignore b/.gitignore
index d8b57e32f888..e61acd574b44 100644
--- a/.gitignore
+++ b/.gitignore
@@ -256,6 +256,7 @@ xen/arch/x86/boot/*.lnk
 xen/arch/x86/efi.lds
 xen/arch/x86/efi/check.efi
 xen/arch/x86/efi/mkreloc
+xen/arch/x86/efi/modify-mbi-exe
 xen/arch/x86/include/asm/asm-macros.h
 xen/arch/*/xen.lds
 xen/arch/*/efi/boot.c
@@ -304,6 +305,7 @@ xen/suppression-list.txt
 xen/xen-syms
 xen/xen-syms.map
 xen/xen.*
+xen/xen-mbi.*
 LibVNCServer*
 
 tools/qemu-xen-dir-remote
diff --git a/xen/Makefile b/xen/Makefile
index 21832d640225..1955e1d687df 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -581,6 +581,7 @@ _clean:
 		-o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET)-syms $(TARGET)-syms.map
 	rm -f $(TARGET).efi $(TARGET).efi.map $(TARGET).efi.elf $(TARGET).efi.stripped
+	rm -f $(TARGET)-mbi.exe
 	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
 	rm -f .banner .allconfig.tmp include/xen/compile.h
 	rm -rf $(objtree)/arch/*/include/generated
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 26d87405297b..5b6b8911f1f8 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -86,6 +86,7 @@ extra-y += xen.lds
 
 hostprogs-y += boot/mkelf32
 hostprogs-y += efi/mkreloc
+hostprogs-y += efi/modify-mbi-exe
 
 # Allows usercopy.c to include itself
 $(obj)/usercopy.o: CFLAGS-y += -iquote .
@@ -96,7 +97,7 @@ endif
 
 efi-y := $(shell if [ ! -r $(objtree)/include/xen/compile.h -o \
                       -O $(objtree)/include/xen/compile.h ]; then \
-                         echo '$(TARGET).efi'; fi) \
+                         echo '$(TARGET).efi $(TARGET)-mbi.exe'; fi) \
          $(space)
 efi-$(CONFIG_PV_SHIM_EXCLUSIVE) :=
 
@@ -123,6 +124,19 @@ syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --error-dup
 
 orphan-handling-$(call ld-option,--orphan-handling=warn) += --orphan-handling=warn
 
+ifeq ($(XEN_BUILD_PE),y)
+$(TARGET)-mbi.exe: $(TARGET).efi $(obj)/efi/modify-mbi-exe
+	$(OBJCOPY) --remove-section=.reloc $< $@.tmp
+	$(obj)/efi/modify-mbi-exe $@.tmp
+	$(OBJCOPY) --set-start=0x$$($(NM) -pa $@.tmp | awk '/T start$$/{print $$1}') $@.tmp $@.tmp2
+	mv $@.tmp2 $@
+	rm -f $@.tmp
+else
+$(TARGET)-mb.exe: FORCE
+	rm -f $@
+	echo 'PE build not supported'
+endif
+
 $(TARGET): TMP = $(dot-target).elf32
 $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
 	$(obj)/boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET) \
diff --git a/xen/arch/x86/efi/modify-mbi-exe.c b/xen/arch/x86/efi/modify-mbi-exe.c
new file mode 100644
index 000000000000..57af382cab4d
--- /dev/null
+++ b/xen/arch/x86/efi/modify-mbi-exe.c
@@ -0,0 +1,77 @@
+#include <stdio.h>
+#include <stdint.h>
+#include <unistd.h>
+#include <fcntl.h>
+
+struct mz_hdr {
+    uint16_t signature;
+#define MZ_SIGNATURE 0x5a4d
+    uint16_t last_page_size;
+    uint16_t page_count;
+    uint16_t relocation_count;
+    uint16_t header_paras;
+    uint16_t min_paras;
+    uint16_t max_paras;
+    uint16_t entry_ss;
+    uint16_t entry_sp;
+    uint16_t checksum;
+    uint16_t entry_ip;
+    uint16_t entry_cs;
+    uint16_t relocations;
+    uint16_t overlay;
+    uint8_t reserved[32];
+    uint32_t extended_header_base;
+};
+
+struct coff_hdr {
+    uint32_t signature;
+    uint16_t cpu;
+    uint16_t section_count;
+    int32_t timestamp;
+    uint32_t symbols_file_offset;
+    uint32_t symbol_count;
+    uint16_t opt_hdr_size;
+    uint16_t flags;
+};
+
+#define IMAGE_BASE_OFFSET 48
+#define NEW_IMAGE_BASE 0x0
+
+int main(int argc, char **argv)
+{
+    int fd;
+    struct mz_hdr mz_hdr;
+    const uint64_t base_addr = NEW_IMAGE_BASE;
+
+    if ( argc != 2 )
+    {
+        fprintf(stderr, "usage: %s <image>\n", argv[0]);
+        return 1;
+    }
+
+    fd = open(argv[1], O_RDWR);
+    if ( fd < 0 ||
+         read(fd, &mz_hdr, sizeof(mz_hdr)) != sizeof(mz_hdr) )
+    {
+        perror(argv[1]);
+        return 2;
+    }
+
+    if ( mz_hdr.signature != MZ_SIGNATURE ||
+         !mz_hdr.extended_header_base )
+    {
+        fprintf(stderr, "%s: Wrong DOS file format\n", argv[1]);
+        return 2;
+    }
+
+    if ( lseek(fd, mz_hdr.extended_header_base + IMAGE_BASE_OFFSET, SEEK_SET) < 0 ||
+         write(fd, &base_addr, sizeof(base_addr)) != sizeof(base_addr) )
+    {
+        perror(argv[1]);
+        return 3;
+    }
+
+    close(fd);
+
+    return 0;
+}
-- 
2.43.0


