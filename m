Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EF8AADBB9
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 11:43:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978419.1365242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCbJ6-0006nQ-R3; Wed, 07 May 2025 09:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978419.1365242; Wed, 07 May 2025 09:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCbJ6-0006kg-Mp; Wed, 07 May 2025 09:43:16 +0000
Received: by outflank-mailman (input) for mailman id 978419;
 Wed, 07 May 2025 09:43:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zCvR=XX=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1uCbJ4-00062T-OT
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 09:43:14 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b132f369-2b27-11f0-9ffb-bf95429c2676;
 Wed, 07 May 2025 11:43:12 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39c1ef4ae3aso467418f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 May 2025 02:43:12 -0700 (PDT)
Received: from localhost.localdomain (172.74.6.51.dyn.plus.net. [51.6.74.172])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b16f00sm16051290f8f.84.2025.05.07.02.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 02:43:10 -0700 (PDT)
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
X-Inumbo-ID: b132f369-2b27-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746610992; x=1747215792; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvgGQEXxmwdDOq95Q9FxVo61JDyQYafFqqrzIkZ3gxA=;
        b=GJUr5YVICfDhbq8NYkdyET4oegEDXH7eSo9zI9dnFl7pZAb4F68qD/vXSEb2L/0KTy
         hkhWbVs/RObjs5QdSbHjHzbOUa0YKJ53C/0VOA321KXRXFq5TUCJnxiTtyFGBcXyd8Ay
         ThxENbMAA3yp0o9XJqLRw7Wd7eZKKDJFVFCHU7w3KcWI4iZPo0SOTHiU5LQxLlTgyEQX
         3tcl767J6cNXaGLIFULQfpYWRK1RrwrSMXmDWbICaMPkRiuhgj87rIC1Qec+Se8kmp5k
         jcDXQpmA3IHYGDQUq064Yby7r54E2wqfnW1LCh8jvhVgwd7uGQZaGgyjwsJaNlsGR8nw
         4Ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746610992; x=1747215792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvgGQEXxmwdDOq95Q9FxVo61JDyQYafFqqrzIkZ3gxA=;
        b=qXdUOJDQ3YYCxpVXS85CLsHL33vYRPrrVCBgzHicXAI8AQSjPnCYVxoQo2D/1PXRbI
         EQwswBHh7c1fdi6lU1D2EB8crLGskXb2YRRBWBRaYMU8vOdQFEylqo0MkPmSkUXOENzg
         OT3ulniwDGONNuorGLNWd/ui5UabthCTn6AboccxSoHV5hh0/sfTsUpbfAv84v8svD7L
         4ZXU3sFYzwMOP2UHQ5WdHsaPILTT4NZUyLGStUMVlB/bUdpg+QX5Rgrhbr+iIcZDcfiB
         V1+NEfcl6FXctIBcmcPSDYSK1FT84C51AjGs7pAqpSdYREWrqbQqAgmACV/OlzNMAlOH
         UHRQ==
X-Gm-Message-State: AOJu0YxAh7qopIC92o70V929Lef03LtvyqQcbD8l1tYk3W1vB9xy89r9
	1WeTNv7xRHoEbZPUbdcgu2EkUViaNXQSP6zSRK0Q/meKKPmQ0j8lNT7FUz85NGY=
X-Gm-Gg: ASbGncvA3+Q8rRzAfrUes+tTXyUc7h7gplBHKdtBc8zOc1tWRUH3c0hly5DKsMUJu6p
	jgdO4haYXuoJgLziLq5iiyxVxqRJXnjiHS2oW5kqhvzMlIUsuXHuaTkW1A0WMyMcrKrf4IDuH1I
	8FAx2SmnKy1nkx7v0HfVunFyS7eRey6nVfFxVQEphs2W30pZZUeVgq2skIbid2sPWQAsarCBGvG
	sIUl2KVykSsGRk1DDG8iBjVCfG+rwXPSYOQS+xyl4TG4D6affQxZxp8mMaQbnWKmaZ2DL34d+ur
	zokA+9fi+Pl43UKUoKdq4kw0h+QFdJhs/zLNeDLY5hKTvhFZZArmIRg9QoaZGH5/mJmFBmAb
X-Google-Smtp-Source: AGHT+IG03r2HP1/gVZCiODuvJ0+xqiZYzO8vzfAdMNoeAaGrDhDDyDdYFGV8qSz1Qjj4fx9nzwU9/w==
X-Received: by 2002:a5d:5885:0:b0:3a0:9dda:c2e2 with SMTP id ffacd0b85a97d-3a0b53eb0b8mr2170979f8f.22.1746610991521;
        Wed, 07 May 2025 02:43:11 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Subject: [PATCH v2 3/4] kexec: Implement new EFI load types
Date: Wed,  7 May 2025 10:42:48 +0100
Message-ID: <20250507094253.10395-4-freddy77@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507094253.10395-1-freddy77@gmail.com>
References: <20250507094253.10395-1-freddy77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Lagerwall <ross.lagerwall@citrix.com>

Add two new EFI load types for kexec. These load types are suitable for use
when Secure Boot is enabled.

When these load types are used, the caller should not pass purgatory as one of
the kexec segments. Instead, Xen will prepare and supply purgatory itself.

Preparing purgatory involves loading it, applying relocations, and calculating
and embedding the checksums of the segments.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
---
 xen/arch/arm/Makefile       |   1 +
 xen/arch/arm/kexec.c        |  27 ++
 xen/arch/x86/Makefile       |   1 +
 xen/arch/x86/bzimage.c      |  40 +--
 xen/arch/x86/kexec.c        | 125 +++++++
 xen/common/Kconfig          |   1 +
 xen/common/kexec.c          |  10 +
 xen/common/kimage.c         | 632 +++++++++++++++++++++++++++++++++++-
 xen/include/public/kexec.h  |  23 +-
 xen/include/xen/kimage.h    |  42 +++
 xen/include/xen/x86-linux.h |  62 ++++
 11 files changed, 908 insertions(+), 56 deletions(-)
 create mode 100644 xen/arch/arm/kexec.c
 create mode 100644 xen/arch/x86/kexec.c
 create mode 100644 xen/include/xen/x86-linux.h

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 129a109d6e..0e652d9594 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -36,6 +36,7 @@ obj-y += io.o
 obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
 obj-y += irq.o
 obj-y += kernel.init.o
+obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
 obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
 obj-$(CONFIG_VM_EVENT) += mem_access.o
diff --git a/xen/arch/arm/kexec.c b/xen/arch/arm/kexec.c
new file mode 100644
index 0000000000..f8847e16e0
--- /dev/null
+++ b/xen/arch/arm/kexec.c
@@ -0,0 +1,27 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-only
+ * Copyright (c) 2025, Cloud Software Group
+ */
+
+#include <xen/types.h>
+#include <xen/errno.h>
+#include <xen/elfstructs.h>
+#include <xen/kimage.h>
+
+int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
+                                     Elf_Shdr *section, const Elf_Shdr *relsec,
+                                     const Elf_Shdr *symtabsec)
+{
+    return -ENOSYS;
+}
+
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index b3ee871ba1..6b11364150 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -42,6 +42,7 @@ obj-y += hypercall.o
 obj-y += i387.o
 obj-y += i8259.o
 obj-y += io_apic.o
+obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_LIVEPATCH) += alternative.o livepatch.o
 obj-y += msi.o
 obj-y += msr.o
diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
index 66f648f311..f4d5b584cb 100644
--- a/xen/arch/x86/bzimage.c
+++ b/xen/arch/x86/bzimage.c
@@ -6,6 +6,7 @@
 #include <xen/gunzip.h>
 #include <xen/decompress.h>
 #include <xen/libelf.h>
+#include <xen/x86-linux.h>
 #include <asm/bzimage.h>
 
 static __init unsigned long output_length(void *image, unsigned long image_len)
@@ -13,45 +14,6 @@ static __init unsigned long output_length(void *image, unsigned long image_len)
     return *(uint32_t *)(image + image_len - 4);
 }
 
-struct __packed setup_header {
-        uint8_t         _pad0[0x1f1];           /* skip uninteresting stuff */
-        uint8_t         setup_sects;
-        uint16_t        root_flags;
-        uint32_t        syssize;
-        uint16_t        ram_size;
-        uint16_t        vid_mode;
-        uint16_t        root_dev;
-        uint16_t        boot_flag;
-        uint16_t        jump;
-        uint32_t        header;
-#define HDR_MAGIC               "HdrS"
-#define HDR_MAGIC_SZ    4
-        uint16_t        version;
-#define VERSION(h,l)    (((h)<<8) | (l))
-        uint32_t        realmode_swtch;
-        uint16_t        start_sys;
-        uint16_t        kernel_version;
-        uint8_t         type_of_loader;
-        uint8_t         loadflags;
-        uint16_t        setup_move_size;
-        uint32_t        code32_start;
-        uint32_t        ramdisk_image;
-        uint32_t        ramdisk_size;
-        uint32_t        bootsect_kludge;
-        uint16_t        heap_end_ptr;
-        uint16_t        _pad1;
-        uint32_t        cmd_line_ptr;
-        uint32_t        initrd_addr_max;
-        uint32_t        kernel_alignment;
-        uint8_t         relocatable_kernel;
-        uint8_t         _pad2[3];
-        uint32_t        cmdline_size;
-        uint32_t        hardware_subarch;
-        uint64_t        hardware_subarch_data;
-        uint32_t        payload_offset;
-        uint32_t        payload_length;
-    };
-
 static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
 {
     if ( len < sizeof(struct setup_header) )
diff --git a/xen/arch/x86/kexec.c b/xen/arch/x86/kexec.c
new file mode 100644
index 0000000000..5ce70af06d
--- /dev/null
+++ b/xen/arch/x86/kexec.c
@@ -0,0 +1,125 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-only
+ * Copyright (c) 2025, Cloud Software Group
+ *
+ * Parts have been derived from Linux's arch/x86/kernel/machine_kexec_64.c
+ */
+
+#include <xen/types.h>
+#include <xen/errno.h>
+#include <xen/elfstructs.h>
+#include <xen/kimage.h>
+
+int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
+                                     Elf_Shdr *section, const Elf_Shdr *relsec,
+                                     const Elf_Shdr *symtabsec)
+{
+    unsigned int i;
+    Elf64_Rela *rel;
+    Elf64_Sym *sym;
+    void *location;
+    unsigned long address, sec_base, value;
+    const char *strtab, *name, *shstrtab;
+    const Elf_Shdr *sechdrs;
+    const Elf_Ehdr *ehdr = (const Elf_Ehdr *)kexec_purgatory;
+
+    /* String & section header string table */
+    sechdrs = (void *)ehdr + ehdr->e_shoff;
+    strtab = (char *)ehdr + sechdrs[symtabsec->sh_link].sh_offset;
+    shstrtab = (char *)ehdr + sechdrs[ehdr->e_shstrndx].sh_offset;
+
+    rel = (void *)ehdr + relsec->sh_offset;
+
+    dprintk(XENLOG_DEBUG, "Applying relocate section %s to %u\n",
+            shstrtab + relsec->sh_name, relsec->sh_info);
+
+    for ( i = 0; i < relsec->sh_size / sizeof(*rel); i++) {
+
+        /*
+         * rel[i].r_offset contains byte offset from beginning
+         * of section to the storage unit affected.
+         *
+         * This is location to update. This is temporary buffer
+         * where section is currently loaded. This will finally be
+         * loaded to a different address later, pointed to by
+         * ->sh_addr. kimage_purgatory_move takes care of moving it
+         */
+        location = pi->buffer;
+        location += section->sh_offset;
+        location += rel[i].r_offset;
+
+        /* Final address of the location */
+        address = section->sh_addr + rel[i].r_offset;
+
+        /*
+         * rel[i].r_info contains information about symbol table index
+         * w.r.t which relocation must be made and type of relocation
+         * to apply. ELF64_R_SYM() and ELF64_R_TYPE() macros get
+         * these respectively.
+         */
+        sym = (void *)ehdr + symtabsec->sh_offset;
+        sym += ELF64_R_SYM(rel[i].r_info);
+
+        if ( sym->st_name )
+            name = strtab + sym->st_name;
+        else
+            name = shstrtab + sechdrs[sym->st_shndx].sh_name;
+
+        dprintk(XENLOG_DEBUG, "Symbol: %s info: %02x shndx: %02x value=%lx size: %lx\n",
+                name, sym->st_info, sym->st_shndx, sym->st_value,
+                sym->st_size);
+
+        if ( sym->st_shndx == SHN_UNDEF ) {
+            printk("Undefined symbol: %s\n", name);
+            return -ENOEXEC;
+        }
+
+        if ( sym->st_shndx == SHN_COMMON ) {
+            printk("symbol '%s' in common section\n", name);
+            return -ENOEXEC;
+        }
+
+        if ( sym->st_shndx == SHN_ABS )
+            sec_base = 0;
+        else if ( sym->st_shndx >= ehdr->e_shnum ) {
+            printk("Invalid section %d for symbol %s\n",
+                    sym->st_shndx, name);
+            return -ENOEXEC;
+        } else
+            sec_base = pi->sechdrs[sym->st_shndx].sh_addr;
+
+        value = sym->st_value;
+        value += sec_base;
+        value += rel[i].r_addend;
+
+        switch ( ELF64_R_TYPE(rel[i].r_info) ) {
+            case R_X86_64_NONE:
+                break;
+            case R_X86_64_64:
+                *(u64 *)location = value;
+                break;
+            case R_X86_64_PC32:
+            case R_X86_64_PLT32:
+                value -= (u64)address;
+                *(u32 *)location = value;
+                break;
+            default:
+                printk("Unknown rela relocation: %lu\n",
+                        ELF64_R_TYPE(rel[i].r_info));
+                return -ENOEXEC;
+        }
+    }
+
+    return 0;
+}
+
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 4bec78c6f2..674c2bace1 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -318,6 +318,7 @@ config KEXEC
 	bool "kexec support"
 	default y
 	depends on HAS_KEXEC
+	select CRYPTO
 	help
 	  Allows a running Xen hypervisor to be replaced with another OS
 	  without rebooting. This is primarily used to execute a crash
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 84fe8c3597..158f8da6fd 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -1132,6 +1132,16 @@ static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
     if ( ret < 0 )
         goto error;
 
+    if ( load.type == KEXEC_TYPE_DEFAULT_EFI ||
+         load.type == KEXEC_TYPE_CRASH_EFI )
+    {
+        ret = kimage_setup_purgatory(kimage, load.parameters);
+        if (ret)
+            return ret;
+    }
+
+    kimage_terminate(kimage);
+
     ret = kexec_load_slot(kimage);
     if ( ret < 0 )
         goto error;
diff --git a/xen/common/kimage.c b/xen/common/kimage.c
index 9961eac187..212f5bd068 100644
--- a/xen/common/kimage.c
+++ b/xen/common/kimage.c
@@ -19,10 +19,23 @@
 #include <xen/guest_access.h>
 #include <xen/mm.h>
 #include <xen/kexec.h>
+#include <xen/x86-linux.h>
 #include <xen/kimage.h>
+#include <xen/elfstructs.h>
+#include <xen/sha2.h>
+#include <xen/lib.h>
 
 #include <asm/page.h>
 
+#define KIMAGE_SHA256_REGIONS 16
+
+typedef struct
+{
+    uint64_t start;
+    uint64_t len;
+}
+sha256_region_t;
+
 /*
  * When kexec transitions to the new kernel there is a one-to-one
  * mapping between physical and virtual addresses.  On processors
@@ -214,17 +227,12 @@ static int kimage_normal_alloc(struct kexec_image **rimage, paddr_t entry,
                            KEXEC_TYPE_DEFAULT);
 }
 
-static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
-                              unsigned long nr_segments,
-                              xen_kexec_segment_t *segments)
+static int do_kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
+                                 unsigned long nr_segments,
+                                 xen_kexec_segment_t *segments)
 {
     unsigned long i;
 
-    /* Verify we have a valid entry point */
-    if ( (entry < kexec_crash_area.start)
-         || (entry > kexec_crash_area.start + kexec_crash_area.size))
-        return -EADDRNOTAVAIL;
-
     /*
      * Verify we have good destination addresses.  Normally
      * the caller is responsible for making certain we don't
@@ -254,6 +262,25 @@ static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
                            KEXEC_TYPE_CRASH);
 }
 
+static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
+                              unsigned long nr_segments,
+                              xen_kexec_segment_t *segments)
+{
+    /* Verify we have a valid entry point */
+    if ( (entry < kexec_crash_area.start)
+         || (entry > kexec_crash_area.start + kexec_crash_area.size))
+        return -EADDRNOTAVAIL;
+
+    return do_kimage_crash_alloc(rimage, entry, nr_segments, segments);
+}
+
+static int kimage_crash_alloc_efi(struct kexec_image **rimage, paddr_t entry,
+                                  unsigned long nr_segments,
+                                  xen_kexec_segment_t *segments)
+{
+    return do_kimage_crash_alloc(rimage, entry, nr_segments, segments);
+}
+
 static int kimage_is_destination_range(struct kexec_image *image,
                                        paddr_t start,
                                        paddr_t end)
@@ -476,7 +503,7 @@ static void kimage_free_extra_pages(struct kexec_image *image)
     kimage_free_page_list(&image->unusable_pages);
 }
 
-static void kimage_terminate(struct kexec_image *image)
+void kimage_terminate(struct kexec_image *image)
 {
     kimage_entry_t *entries;
 
@@ -542,6 +569,8 @@ void kimage_free(struct kexec_image *image)
     kimage_free_all_entries(image);
     kimage_free_page_list(&image->control_pages);
     xfree(image->segments);
+    xfree(image->pi.buffer);
+    xfree(image->pi.sechdrs);
     xfree(image);
 }
 
@@ -748,7 +777,8 @@ static int kimage_load_crash_segment(struct kexec_image *image,
         if ( !dest_va )
             return -EINVAL;
 
-        ret = copy_from_guest_offset(dest_va, segment->buf.h, src_offset, schunk);
+        ret = copy_from_guest_offset(dest_va, segment->buf.h,
+                                     src_offset, schunk);
         memset(dest_va + schunk, 0, dchunk - schunk);
 
         unmap_domain_page(dest_va);
@@ -764,7 +794,8 @@ static int kimage_load_crash_segment(struct kexec_image *image,
     return 0;
 }
 
-static int kimage_load_segment(struct kexec_image *image, xen_kexec_segment_t *segment)
+static int kimage_load_segment(struct kexec_image *image,
+                               xen_kexec_segment_t *segment)
 {
     int result = -ENOMEM;
     paddr_t addr;
@@ -802,11 +833,16 @@ int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
     switch( type )
     {
     case KEXEC_TYPE_DEFAULT:
+    case KEXEC_TYPE_DEFAULT_EFI:
         result = kimage_normal_alloc(rimage, entry_maddr, nr_segments, segment);
         break;
     case KEXEC_TYPE_CRASH:
         result = kimage_crash_alloc(rimage, entry_maddr, nr_segments, segment);
         break;
+    case KEXEC_TYPE_CRASH_EFI:
+        result = kimage_crash_alloc_efi(rimage, entry_maddr,
+                                        nr_segments, segment);
+        break;
     default:
         result = -EINVAL;
         break;
@@ -829,7 +865,6 @@ int kimage_load_segments(struct kexec_image *image)
         if ( result < 0 )
             return result;
     }
-    kimage_terminate(image);
     return 0;
 }
 
@@ -938,6 +973,579 @@ done:
     return ret;
 }
 
+static int kimage_purgatory_alloc(struct kexec_image *image)
+{
+    const Elf_Ehdr *ehdr = (const Elf_Ehdr *)kexec_purgatory;
+    const Elf_Shdr *sechdrs;
+    unsigned long bss_align;
+    unsigned long bss_sz;
+    unsigned long align;
+    int i;
+    struct purgatory_info *pi = &image->pi;
+
+    dprintk(XENLOG_DEBUG, "purgatory_alloc 0x%lx 0x%lx %u\n",
+            (unsigned long)kexec_purgatory, (unsigned long)ehdr,
+            kexec_purgatory_size);
+
+    sechdrs = (void *)ehdr + ehdr->e_shoff;
+    pi->buf_align = bss_align = 1;
+    pi->bufsz = bss_sz = 0;
+
+    for ( i = 0; i < ehdr->e_shnum; i++ ) {
+        if ( !(sechdrs[i].sh_flags & SHF_ALLOC) )
+            continue;
+
+        align = sechdrs[i].sh_addralign;
+        if ( sechdrs[i].sh_type != SHT_NOBITS ) {
+            if ( pi->buf_align < align )
+                pi->buf_align = align;
+            pi->bufsz = ROUNDUP(pi->bufsz, align);
+            pi->bufsz += sechdrs[i].sh_size;
+        } else {
+            if ( bss_align < align )
+                bss_align = align;
+            bss_sz = ROUNDUP(bss_sz, align);
+            bss_sz += sechdrs[i].sh_size;
+        }
+    }
+    pi->bufsz = ROUNDUP(pi->bufsz, bss_align);
+    pi->memsz = pi->bufsz + bss_sz;
+    if ( pi->buf_align < bss_align )
+        pi->buf_align = bss_align;
+
+    pi->buffer = xzalloc_bytes(pi->bufsz);
+    if ( !pi->buffer )
+        return -ENOMEM;
+
+    return 0;
+}
+
+static int kimage_purgatory_copy(struct kexec_image *image)
+{
+    unsigned long bss_addr;
+    unsigned long offset;
+    unsigned long align;
+    size_t sechdrs_size;
+    Elf_Shdr *sechdrs;
+    int i;
+    struct purgatory_info *pi = &image->pi;
+    const Elf_Ehdr *ehdr = (const Elf_Ehdr *)kexec_purgatory;
+    const char *shstrtab;
+
+    /*
+     * The section headers in kexec_purgatory are read-only. In order to
+     * have them modifiable make a temporary copy.
+     */
+    sechdrs_size = sizeof(Elf_Shdr) * ehdr->e_shnum;
+    sechdrs = xmalloc_bytes(sechdrs_size);
+    if ( !sechdrs )
+        return -ENOMEM;
+
+    memcpy(sechdrs, (void *)ehdr + ehdr->e_shoff, sechdrs_size);
+    pi->sechdrs = sechdrs;
+
+    shstrtab = (char *)ehdr + sechdrs[ehdr->e_shstrndx].sh_offset;
+
+    offset = 0;
+    bss_addr = pi->dest + pi->bufsz;
+    image->entry_maddr = ehdr->e_entry;
+
+    for ( i = 0; i < ehdr->e_shnum; i++ ) {
+        if ( !(sechdrs[i].sh_flags & SHF_ALLOC) )
+            continue;
+
+        align = sechdrs[i].sh_addralign;
+        if ( sechdrs[i].sh_type == SHT_NOBITS ) {
+            bss_addr = ROUNDUP(bss_addr, align);
+            sechdrs[i].sh_addr = bss_addr;
+            bss_addr += sechdrs[i].sh_size;
+            continue;
+        }
+
+        offset = ROUNDUP(offset, align);
+
+        if ( sechdrs[i].sh_flags & SHF_EXECINSTR &&
+                ehdr->e_entry >= sechdrs[i].sh_addr &&
+                ehdr->e_entry < (sechdrs[i].sh_addr + sechdrs[i].sh_size) ) {
+            BUG_ON(image->entry_maddr != ehdr->e_entry);
+            image->entry_maddr -= sechdrs[i].sh_addr;
+            image->entry_maddr += pi->dest + offset;
+        }
+
+        memcpy(pi->buffer + offset,
+               (void *)ehdr + sechdrs[i].sh_offset,
+               sechdrs[i].sh_size);
+
+        sechdrs[i].sh_addr = pi->dest + offset;
+        sechdrs[i].sh_offset = offset;
+        offset += sechdrs[i].sh_size;
+
+        dprintk(XENLOG_DEBUG, "Load %s at 0x%08lx\n",
+                shstrtab + sechdrs[i].sh_name, sechdrs[i].sh_addr);
+    }
+
+    dprintk(XENLOG_DEBUG, "image entry maddr 0x%lx\n", image->entry_maddr);
+
+    return 0;
+}
+
+static int kimage_purgatory_apply_relocations(struct kexec_image *image)
+{
+    const Elf_Ehdr *ehdr = (const Elf_Ehdr *)kexec_purgatory;
+    int i, ret;
+    struct purgatory_info *pi = &image->pi;
+    const Elf_Shdr *sechdrs;
+
+    sechdrs = (void *)ehdr + ehdr->e_shoff;
+
+    for ( i = 0; i < ehdr->e_shnum; i++ ) {
+        const Elf_Shdr *relsec;
+        const Elf_Shdr *symtab;
+        Elf_Shdr *section;
+
+        relsec = sechdrs + i;
+
+        if ( relsec->sh_type != SHT_RELA &&
+                relsec->sh_type != SHT_REL )
+            continue;
+
+        /*
+         * For section of type SHT_RELA/SHT_REL,
+         * ->sh_link contains section header index of associated
+         * symbol table. And ->sh_info contains section header
+         * index of section to which relocations apply.
+         */
+        if ( relsec->sh_info >= ehdr->e_shnum ||
+                relsec->sh_link >= ehdr->e_shnum )
+            return -ENOEXEC;
+
+        section = pi->sechdrs + relsec->sh_info;
+        symtab = sechdrs + relsec->sh_link;
+
+        if ( !(section->sh_flags & SHF_ALLOC) )
+            continue;
+
+        /*
+         * symtab->sh_link contain section header index of associated
+         * string table.
+         */
+        if ( symtab->sh_link >= ehdr->e_shnum )
+            /* Invalid section number? */
+            continue;
+
+        /*
+         * Respective architecture needs to provide support for applying
+         * relocations of type SHT_RELA.
+         */
+        if ( relsec->sh_type == SHT_RELA )
+            ret = arch_kexec_apply_relocations_add(pi, section,
+                    relsec, symtab);
+        else if ( relsec->sh_type == SHT_REL )
+            ret = -ENOEXEC;
+        if ( ret )
+            return ret;
+    }
+
+    return 0;
+}
+
+static const Elf_Sym *kimage_purgatory_find_symbol(const char *name)
+{
+    const Elf_Shdr *sechdrs;
+    const Elf_Ehdr *ehdr = (const Elf_Ehdr *)kexec_purgatory;
+    const Elf_Sym *syms;
+    const char *strtab;
+    int i, k;
+
+    sechdrs = (void *)ehdr + ehdr->e_shoff;
+
+    for ( i = 0; i < ehdr->e_shnum; i++ ) {
+        if ( sechdrs[i].sh_type != SHT_SYMTAB )
+            continue;
+
+        if ( sechdrs[i].sh_link >= ehdr->e_shnum )
+            /* Invalid strtab section number */
+            continue;
+
+        strtab = (void *)ehdr + sechdrs[sechdrs[i].sh_link].sh_offset;
+        syms = (void *)ehdr + sechdrs[i].sh_offset;
+
+        /* Go through symbols for a match */
+        for ( k = 0; k < sechdrs[i].sh_size/sizeof(Elf_Sym); k++ ) {
+            if ( ELF_ST_BIND(syms[k].st_info) != STB_GLOBAL )
+                continue;
+
+            if ( strcmp(strtab + syms[k].st_name, name) != 0 )
+                continue;
+
+            if ( syms[k].st_shndx == SHN_UNDEF ||
+                    syms[k].st_shndx >= ehdr->e_shnum ) {
+                printk("Symbol: %s has bad section index %d.\n",
+                        name, syms[k].st_shndx);
+                return NULL;
+            }
+
+            /* Found the symbol we are looking for */
+            return &syms[k];
+        }
+    }
+
+    return NULL;
+}
+
+static int kimage_purgatory_get_symbol_addr(struct kexec_image *image,
+                                            const char *name, void **addr)
+{
+    struct purgatory_info *pi = &image->pi;
+    const Elf_Sym *sym;
+    Elf_Shdr *sechdr;
+
+    sym = kimage_purgatory_find_symbol(name);
+    if ( !sym )
+        return -EINVAL;
+
+    sechdr = &pi->sechdrs[sym->st_shndx];
+
+    /*
+     * Update addr with the address where symbol will finally be loaded after
+     * kimage_purgatory_move()
+     */
+    *addr = (void *)(sechdr->sh_addr + sym->st_value);
+    return 0;
+}
+
+/*
+ * Get or set value of a symbol. If "get_value" is true, symbol value is
+ * returned in buf otherwise symbol value is set based on value in buf.
+ */
+static int kimage_purgatory_get_set_symbol(struct kexec_image *image, const char *name,
+				   void *buf, unsigned int size, bool get_value)
+{
+    struct purgatory_info *pi = &image->pi;
+    const Elf_Sym *sym;
+    Elf_Shdr *sec;
+    char *sym_buf;
+
+    sym = kimage_purgatory_find_symbol(name);
+    if ( !sym )
+        return -EINVAL;
+
+    if ( sym->st_size != size ) {
+        printk("symbol %s size mismatch: expected %lu actual %u\n",
+                name, (unsigned long)sym->st_size, size);
+        return -EINVAL;
+    }
+
+    sec = pi->sechdrs + sym->st_shndx;
+
+    if ( sec->sh_type == SHT_NOBITS ) {
+        printk("symbol %s is in a bss section. Cannot %s\n", name,
+                get_value ? "get" : "set");
+        return -EINVAL;
+    }
+
+    sym_buf = (char *)pi->buffer + sec->sh_offset + sym->st_value;
+
+    if ( get_value )
+        memcpy((void *)buf, sym_buf, size);
+    else
+        memcpy((void *)sym_buf, buf, size);
+
+    return 0;
+}
+
+static int kimage_purgatory_find_hole(struct kexec_image *image)
+{
+    paddr_t hole_start, hole_end, mstart, mend;
+    struct purgatory_info *pi = &image->pi;
+    unsigned long i;
+
+    pi->dest = 0;
+    hole_start = PAGE_ALIGN(image->next_crash_page);
+    hole_end = hole_start + pi->memsz;
+    while ( hole_end <= kexec_crash_area.start + kexec_crash_area.size )
+    {
+        /* See if the hole overlaps any of the segments. */
+        for ( i = 0; i < image->nr_segments; i++ )
+        {
+            mstart = image->segments[i].dest_maddr;
+            mend   = mstart + image->segments[i].dest_size;
+            if ( (hole_end > mstart) && (hole_start < mend) )
+            {
+                /* Advance the hole to the end of the segment. */
+                hole_start = PAGE_ALIGN(mend);
+                hole_end = hole_start + pi->memsz;
+                break;
+            }
+        }
+
+        /* If the hole doesn't overlap any segments I have found my hole! */
+        if ( i == image->nr_segments &&
+             hole_end <= kexec_crash_area.start + kexec_crash_area.size )
+        {
+            pi->dest = hole_start;
+            image->next_crash_page = PAGE_ALIGN(hole_end);
+            break;
+        }
+    }
+
+    return pi->dest;
+}
+
+/* Load purgatory as an ELF binary and relocate it. */
+static int kimage_load_purgatory_image(struct kexec_image *image)
+{
+    int ret;
+
+    ret = kimage_purgatory_alloc(image);
+    if ( ret )
+        return ret;
+
+    ret = kimage_purgatory_find_hole(image);
+    if ( !ret )
+        return -ENOMEM;
+
+    ret = kimage_purgatory_copy(image);
+    if ( ret )
+        return ret;
+
+    ret = kimage_purgatory_apply_relocations(image);
+    if ( ret )
+        return ret;
+
+    return 0;
+}
+
+/*
+ * Update the loaded purgatory with the digest and locations of the segments.
+ */
+static int kimage_purgatory_calc_one_digest(struct sha2_256_state *ctx,
+                                            struct kimage_segment *segment)
+{
+    paddr_t dest;
+    unsigned long sbytes;
+    unsigned int dest_offset;
+    int ret = 0;
+
+    sbytes = segment->buf_size;
+    dest = segment->dest_maddr + segment->dest_offset;
+    dest_offset = segment->dest_offset;
+
+    while ( sbytes )
+    {
+        unsigned long dest_mfn;
+        void *dest_va;
+        size_t schunk, dchunk;
+
+        dest_mfn = dest >> PAGE_SHIFT;
+
+        dchunk = PAGE_SIZE - dest_offset;
+        schunk = min(dchunk, sbytes);
+
+        dest_va = map_domain_page(_mfn(dest_mfn));
+        if ( !dest_va )
+            return -EINVAL;
+
+        sha2_256_update(ctx, dest_va + dest_offset, schunk);
+
+        unmap_domain_page(dest_va);
+        if ( ret )
+            return -EFAULT;
+
+        sbytes -= schunk;
+        dest += dchunk;
+        dest_offset = 0;
+    }
+    return 0;
+}
+
+static int kimage_purgatory_calc_digest(struct kexec_image *image)
+{
+    int ret;
+    sha256_region_t regions[KIMAGE_SHA256_REGIONS] = {{0}};
+    struct sha2_256_state ctx;
+    uint8_t digest[SHA2_256_DIGEST_SIZE];
+    unsigned int s;
+
+    if ( image->nr_segments > KIMAGE_SHA256_REGIONS )
+    {
+        dprintk(XENLOG_DEBUG, "More segments than allocated SHA256 regions\n");
+        return -E2BIG;
+    }
+
+
+    sha2_256_init(&ctx);
+
+    for ( s = 0; s < image->nr_segments; s++ ) {
+        ret = kimage_purgatory_calc_one_digest(&ctx, &image->segments[s]);
+        if ( ret )
+            return ret;
+
+        regions[s].start = image->segments[s].dest_maddr +
+                           image->segments[s].dest_offset;
+        regions[s].len = image->segments[s].buf_size;
+    }
+
+    sha2_256_final(&ctx, digest);
+
+    ret = kimage_purgatory_get_set_symbol(image, "sha256_regions",
+                                          regions, sizeof(regions), 0);
+    if ( ret )
+        return ret;
+
+    ret = kimage_purgatory_get_set_symbol(image, "sha256_digest",
+                                          &digest, sizeof(digest), 0);
+    if ( ret )
+        return ret;
+
+    return 0;
+}
+
+/*
+ * Find the entry point to the new kernel, we need to map the crash region into
+ * memory in order to read the kernel header.
+ */
+#define KERNEL_SEGMENT_IDX 0
+static uint64_t kimage_find_kernel_entry_maddr(struct kexec_image *image)
+{
+    uint64_t alignment_addr;
+    uint32_t alignment;
+    unsigned long dest_mfn;
+    void *dest_va;
+
+    alignment_addr = image->segments[KERNEL_SEGMENT_IDX].dest_maddr +
+                         image->segments[KERNEL_SEGMENT_IDX].dest_offset +
+                         offsetof(struct setup_header, kernel_alignment);
+
+    dest_mfn = alignment_addr >> PAGE_SHIFT;
+    dest_va = map_domain_page(_mfn(dest_mfn));
+    if ( !dest_va )
+        return -EINVAL;
+
+    alignment = *((uint32_t *) ((uint8_t *) dest_va +
+                                                PAGE_OFFSET(alignment_addr)));
+
+    unmap_domain_page(dest_va);
+
+    /*
+     * Ensure the kernel alignment is a valid LOAD_PHYSICAL_ADDR,
+     * which ranges from 0x200000 (2MiB) to 0x1000000 (16Mib) on 64-bit systems
+     * as defined in the kernel x86 Kconfig
+     */
+    if ( alignment % 0x200000 != 0 ||
+         alignment < 0x200000 ||
+         alignment > 0x1000000 )
+        return -EINVAL;
+
+    return ROUNDUP(image->segments[KERNEL_SEGMENT_IDX].dest_maddr +
+                       image->segments[KERNEL_SEGMENT_IDX].dest_offset,
+                   alignment) +
+                   0x200;
+}
+
+/*
+ * Configure purgatory with the register values that will be set before jumping
+ * into the new kernel.
+ */
+static int kimage_purgatory_set_register_block(struct kexec_image *image, uint64_t parameters)
+{
+    int ret;
+    uint64_t rip;
+    void *stack;
+
+    rip = kimage_find_kernel_entry_maddr(image);
+    if ( rip < 0 )
+        return -EINVAL;
+
+    ret = kimage_purgatory_get_symbol_addr(image, "stack_end", &stack);
+    BUG_ON(ret < 0);
+
+    /* Clear the registers */
+    memset(&image->regs, 0, sizeof(image->regs));
+
+    image->regs.rsp = (uint64_t)stack;
+    image->regs.rsi = parameters;  // Kernel parameters
+    image->regs.rip = rip;
+
+    return kimage_purgatory_get_set_symbol(image, "entry64_regs",
+                                           &image->regs, sizeof(image->regs),
+                                           0);
+}
+
+/*
+ * Move the loaded purgatory into its final destination as an additional kimage
+ * segment.
+ */
+static int kimage_purgatory_move(struct kexec_image *image)
+{
+    struct purgatory_info *pi = &image->pi;
+    paddr_t dest;
+    unsigned long sbytes;
+    unsigned long src_offset = 0;
+    int result = 0;
+    paddr_t addr;
+
+    sbytes = pi->bufsz;
+    dest = pi->dest;
+
+    while ( dest < (pi->dest + pi->memsz) )
+    {
+        unsigned long dest_mfn;
+        void *dest_va;
+        size_t schunk, dchunk;
+
+        dest_mfn = dest >> PAGE_SHIFT;
+
+        dchunk = PAGE_SIZE;
+        schunk = min(dchunk, sbytes);
+
+        dest_va = map_domain_page(_mfn(dest_mfn));
+        if ( !dest_va )
+            return -EINVAL;
+
+        memcpy(dest_va, pi->buffer + src_offset, schunk);
+        memset(dest_va + schunk, 0, dchunk - schunk);
+
+        unmap_domain_page(dest_va);
+
+        sbytes -= schunk;
+        dest += dchunk;
+        src_offset += schunk;
+    }
+
+    for ( addr = pi->dest & PAGE_MASK;
+          addr < pi->dest + pi->memsz; addr += PAGE_SIZE ) {
+        result = machine_kexec_add_page(image, addr, addr);
+        if ( result < 0 )
+            break;
+    }
+
+    return result;
+}
+
+int kimage_setup_purgatory(struct kexec_image *image, uint64_t parameters)
+{
+    int ret;
+
+    ret = kimage_load_purgatory_image(image);
+    if ( ret )
+        return ret;
+
+    ret = kimage_purgatory_calc_digest(image);
+    if ( ret )
+        return ret;
+
+    ret = kimage_purgatory_set_register_block(image, parameters);
+    if ( ret )
+        return ret;
+
+    ret = kimage_purgatory_move(image);
+    if ( ret )
+        return ret;
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/public/kexec.h b/xen/include/public/kexec.h
index 40d79e936b..9bc94c6fd6 100644
--- a/xen/include/public/kexec.h
+++ b/xen/include/public/kexec.h
@@ -56,15 +56,24 @@
 /*
  * Kexec supports two types of operation:
  * - kexec into a regular kernel, very similar to a standard reboot
- *   - KEXEC_TYPE_DEFAULT is used to specify this type
+ *   - KEXEC_TYPE_DEFAULT or KEXEC_TYPE_DEFAULT_EFI are used to specify
+ *     this type
+ *   - in case of KEXEC_TYPE_DEFAULT_EFI the first segment will
+ *     point to full kernel to load and entry point will point to
+ *     parameters
  * - kexec into a special "crash kernel", aka kexec-on-panic
- *   - KEXEC_TYPE_CRASH is used to specify this type
+ *   - KEXEC_TYPE_CRASH or KEXEC_TYPE_CRASH_EFI are used to specify this
+ *     type
+ *   - see above for differences between KEXEC_TYPE_CRASH and
+ *     KEXEC_TYPE_CRASH_EFI
  *   - parts of our system may be broken at kexec-on-panic time
  *     - the code should be kept as simple and self-contained as possible
  */
 
-#define KEXEC_TYPE_DEFAULT 0
-#define KEXEC_TYPE_CRASH   1
+#define KEXEC_TYPE_DEFAULT     0
+#define KEXEC_TYPE_CRASH       1
+#define KEXEC_TYPE_DEFAULT_EFI 2
+#define KEXEC_TYPE_CRASH_EFI   3
 
 
 /* The kexec implementation for Xen allows the user to load two
@@ -195,7 +204,11 @@ typedef struct xen_kexec_load {
         XEN_GUEST_HANDLE(xen_kexec_segment_t) h;
         uint64_t _pad;
     } segments;
-    uint64_t entry_maddr; /* image entry point machine address. */
+    /* image entry point machine address or parameters in case of EFI. */
+    union {
+        uint64_t entry_maddr;
+        uint64_t parameters;
+    };
 } xen_kexec_load_t;
 DEFINE_XEN_GUEST_HANDLE(xen_kexec_load_t);
 
diff --git a/xen/include/xen/kimage.h b/xen/include/xen/kimage.h
index 348f07f5c8..6626058f8b 100644
--- a/xen/include/xen/kimage.h
+++ b/xen/include/xen/kimage.h
@@ -11,12 +11,45 @@
 
 #include <xen/list.h>
 #include <xen/mm.h>
+#include <xen/elfstructs.h>
 #include <public/kexec.h>
 
 #define KEXEC_SEGMENT_MAX 16
 
+extern const char kexec_purgatory[];
+extern const unsigned int kexec_purgatory_size;
+
 typedef paddr_t kimage_entry_t;
 
+struct purgatory_info {
+    uint64_t dest;
+    void *buffer;
+    uint64_t bufsz;
+    uint64_t memsz;
+    uint64_t buf_align;
+    Elf_Shdr *sechdrs;
+};
+
+typedef struct xen_kexec_regs {
+        uint64_t rax;
+        uint64_t rbx;
+        uint64_t rcx;
+        uint64_t rdx;
+        uint64_t rsi;
+        uint64_t rdi;
+        uint64_t rsp;
+        uint64_t rbp;
+        uint64_t r8;
+        uint64_t r9;
+        uint64_t r10;
+        uint64_t r11;
+        uint64_t r12;
+        uint64_t r13;
+        uint64_t r14;
+        uint64_t r15;
+        uint64_t rip;
+} xen_kexec_regs_t;
+
 struct kexec_image {
     uint8_t type;
     uint16_t arch;
@@ -37,6 +70,9 @@ struct kexec_image {
 
     /* Address of next control page to allocate for crash kernels. */
     paddr_t next_crash_page;
+
+    struct purgatory_info pi;
+    xen_kexec_regs_t regs;
 };
 
 int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
@@ -52,6 +88,12 @@ mfn_t kimage_entry_mfn(kimage_entry_t *entry, bool compat);
 unsigned long kimage_entry_ind(kimage_entry_t *entry, bool compat);
 int kimage_build_ind(struct kexec_image *image, mfn_t ind_mfn,
                      bool compat);
+int kimage_setup_purgatory(struct kexec_image *image, uint64_t parameters);
+void kimage_terminate(struct kexec_image *image);
+
+int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
+                                     Elf_Shdr *section, const Elf_Shdr *relsec,
+                                     const Elf_Shdr *symtabsec);
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/xen/include/xen/x86-linux.h b/xen/include/xen/x86-linux.h
new file mode 100644
index 0000000000..940d830323
--- /dev/null
+++ b/xen/include/xen/x86-linux.h
@@ -0,0 +1,62 @@
+/*
+ * This file was extracted from x86-linux.h in kexec-tools
+ *
+ * Copyright (C) 2003-2010  Eric Biederman (ebiederm@xmission.com)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation (version 2 of the License).
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+#ifndef X86_LINUX_H
+#define X86_LINUX_H
+
+struct __packed setup_header {
+    uint8_t         _pad0[0x1f1];           /* skip uninteresting stuff */
+    uint8_t         setup_sects;
+    uint16_t        root_flags;
+    uint32_t        syssize;
+    uint16_t        ram_size;
+    uint16_t        vid_mode;
+    uint16_t        root_dev;
+    uint16_t        boot_flag;
+    uint16_t        jump;
+    uint32_t        header;
+#define HDR_MAGIC               "HdrS"
+#define HDR_MAGIC_SZ    4
+    uint16_t        version;
+#define VERSION(h,l)    (((h)<<8) | (l))
+    uint32_t        realmode_swtch;
+    uint16_t        start_sys;
+    uint16_t        kernel_version;
+    uint8_t         type_of_loader;
+    uint8_t         loadflags;
+    uint16_t        setup_move_size;
+    uint32_t        code32_start;
+    uint32_t        ramdisk_image;
+    uint32_t        ramdisk_size;
+    uint32_t        bootsect_kludge;
+    uint16_t        heap_end_ptr;
+    uint16_t        _pad1;
+    uint32_t        cmd_line_ptr;
+    uint32_t        initrd_addr_max;
+    uint32_t        kernel_alignment;
+    uint8_t         relocatable_kernel;
+    uint8_t         _pad2[3];
+    uint32_t        cmdline_size;
+    uint32_t        hardware_subarch;
+    uint64_t        hardware_subarch_data;
+    uint32_t        payload_offset;
+    uint32_t        payload_length;
+};
+
+#endif /* X86_LINUX_H */
-- 
2.43.0


