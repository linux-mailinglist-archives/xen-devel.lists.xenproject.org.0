Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10F8797146
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 11:35:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597190.931386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeBPN-0007KO-Ho; Thu, 07 Sep 2023 09:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597190.931386; Thu, 07 Sep 2023 09:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeBPN-0007Hu-E2; Thu, 07 Sep 2023 09:34:41 +0000
Received: by outflank-mailman (input) for mailman id 597190;
 Thu, 07 Sep 2023 09:34:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tY2=EX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qeBPL-0007Hd-Tm
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 09:34:39 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c37af6bf-4d61-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 11:34:38 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2bc63e0d8cdso12453951fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Sep 2023 02:34:38 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 u19-20020a2e9b13000000b002ba586d27a2sm3797539lji.26.2023.09.07.02.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 02:34:37 -0700 (PDT)
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
X-Inumbo-ID: c37af6bf-4d61-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694079278; x=1694684078; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gQDS+2q9j6P1P0VGN498BuOasLAENJ8DpX2SBjl0NQ=;
        b=MmJarW4GZxAAXffFio8hZRbjxDwPYFwKvA7J2UFszlYNK05/R9c8SORF3YkllR9JyF
         ul40dFc77rZ75Ihx4eV86H3dP1gIXN4u0eKRuZeXv57me8xgKVTqH7Qv0pKmaat3548h
         VLEXjk988Xab8eFnvxFdkeENaVoJmR1q3eXcK/vdZRkUMkZ9knO9StXxV8LAbiYZ11G9
         sNIKINZsDTBR6xkgwxb8NZpKoAt+UUrntKh3rS0XiKcVX0YhJVw2pUgrzbkdi4UXaLW8
         MHni5tRUwGIRDfxYU6QCf81ayJ7Di1YHfJ2e/rbhTIIPswoyLoxPZpZSmS8k8hhFeY2p
         HHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694079278; x=1694684078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gQDS+2q9j6P1P0VGN498BuOasLAENJ8DpX2SBjl0NQ=;
        b=dEHtJiyGViySR0qLOS8UrxuPxaIzeNV5ODqDlFm0cxm0X6PyM1MNEa2Lj7K+b2L/qe
         XNRErDc4FRm+dkjpjSullgBcDU8U5174UcrxbdBVGh4QzSIEtMXx7QXnt/sJgPdqJokT
         iCpsvG/AvSDIqK8PgXtr7M3VDbx3TH0ZdBVsdNb6NTmC8QfkAVisArOsR6dPGDfHZqz5
         M6MVj6WXGVjVBv9QffZiFVQj0DLGNojKXgWIiev6WGZn1PHgs8EwmMwb1i0oy8840kq8
         KkxaQSotWPrDL3sOfiGmiE9iwFJlxtS8XvLmaEDYE5GnyOxSag7SYHMq2aj1N5A+HOJZ
         mbBw==
X-Gm-Message-State: AOJu0YxaMZVNSU6fSwmG+Qyax+gS9DNO1rMpzIlaBnmea/O2mJ0m+P6o
	ZyWfh3M+kl4nyjnr/hVeDRtFwTM8l8s=
X-Google-Smtp-Source: AGHT+IE51XLN3ECMA0/v2VHMescjleO17Ms3znwQWPwiGOGZIb5UMsId6Q/sMuweHjPl6aNLw9biLg==
X-Received: by 2002:a2e:3e1a:0:b0:2bc:eb95:15c7 with SMTP id l26-20020a2e3e1a000000b002bceb9515c7mr3882138lja.49.1694079277492;
        Thu, 07 Sep 2023 02:34:37 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 1/2] xen: asm-generic support
Date: Thu,  7 Sep 2023 12:32:56 +0300
Message-ID: <cf5f446915bd5c8980beda22718efff32678e16b.1694078544.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694078544.git.oleksii.kurochko@gmail.com>
References: <cover.1694078544.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some headers are shared between individual architectures or are empty.
To avoid duplication of these headers, asm-generic is introduced.

With the following patch, an architecture uses generic headers
mentioned in the file arch/$(ARCH)/include/asm/Makefile

To use a generic header is needed to add to
arch/$(ARCH)/include/asm/Makefile :
        generic-y += <name-of-header-file.h>

For each mentioned header in arch/$(ARCH)/include/asm/Makefile,
the necessary wrapper in arch/$(ARCH)/include/generated/asm will be
generated.

As the base Makefile.asm-generic from Linux kernel was taken.
( 06c2afb862f9da8 "Linux 6.5-rc1" ).

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - introduce $(asm-generic) macro in Kbuild.include.
 - move "asm-generic" after the rule "__distclean".
---
Changes in V5:
 - Update the commit message
 - Update SPDX license in Makefile.
 - Remove code related to UML
 - Include $(src)/Makefile instead of $(kbuild-file) 
 - Update comment message in Makefile.asm-generic
 - Update .gitignore
 - Update path to generated headers in CFLAGS.
 - Use the latest version of Linux's Makefile.asm-generic
---
Changes in V4:
 - introduce asm-generic support
 - update commit message
---
Changes in V3:
 - Rename stubs dir to asm-generic
---
Changes in V2:
 - Nothing changed.
---
 .gitignore                       |  1 +
 xen/Makefile                     |  9 +++++-
 xen/scripts/Kbuild.include       |  6 ++++
 xen/scripts/Makefile.asm-generic | 53 ++++++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 xen/scripts/Makefile.asm-generic

diff --git a/.gitignore b/.gitignore
index 50273adb8d..287166f8fc 100644
--- a/.gitignore
+++ b/.gitignore
@@ -267,6 +267,7 @@ xen/arch/*/efi/efi.h
 xen/arch/*/efi/pe.c
 xen/arch/*/efi/runtime.c
 xen/arch/*/include/asm/asm-offsets.h
+xen/arch/*/include/generated
 xen/build-dir-cppcheck/
 xen/common/config_data.S
 xen/common/config.gz
diff --git a/xen/Makefile b/xen/Makefile
index f57e5a596c..2dc5e3526d 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -438,6 +438,7 @@ ifdef building_out_of_srctree
 endif
 CFLAGS += -I$(srctree)/include
 CFLAGS += -I$(srctree)/arch/$(SRCARCH)/include
+CFLAGS += -I$(objtree)/arch/$(SRCARCH)/include/generated
 
 # Note that link order matters!
 ALL_OBJS-y                := common/built_in.o
@@ -580,16 +581,22 @@ _clean:
 	rm -f $(TARGET).efi $(TARGET).efi.map $(TARGET).efi.elf $(TARGET).efi.stripped
 	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
 	rm -f .banner .allconfig.tmp include/xen/compile.h
+	rm -rf $(objtree)/arch/*/include/generated
 
 .PHONY: _distclean
 _distclean: clean
 	rm -f tags TAGS cscope.files cscope.in.out cscope.out cscope.po.out GTAGS GPATH GRTAGS GSYMS .config source
 
+# Support for using generic headers in asm-generic
+PHONY += asm-generic
+asm-generic:
+	$(Q)$(MAKE) $(asm-generic)=arch/$(SRCARCH)/include/generated/asm
+
 $(TARGET).gz: $(TARGET)
 	gzip -n -f -9 < $< > $@.new
 	mv $@.new $@
 
-$(TARGET): outputmakefile FORCE
+$(TARGET): outputmakefile asm-generic FORCE
 	$(Q)$(MAKE) $(build)=tools
 	$(Q)$(MAKE) $(build)=. include/xen/compile.h
 	$(Q)$(MAKE) $(build)=include all
diff --git a/xen/scripts/Kbuild.include b/xen/scripts/Kbuild.include
index 785a32c32e..c2bd8498e1 100644
--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -91,6 +91,12 @@ cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || e
 
 clang-ifversion = $(shell [ $(CONFIG_CLANG_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
 
+###
+# Shorthand for $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.asm-generic obj
+# Usage:
+# $(Q)$(MAKE) $(asm-generic)=dir
+asm-generic := -f $(srctree)/scripts/Makefile.asm-generic obj
+
 ###
 # Shorthand for $(Q)$(MAKE) -f scripts/Makefile.build obj=
 # Usage:
diff --git a/xen/scripts/Makefile.asm-generic b/xen/scripts/Makefile.asm-generic
new file mode 100644
index 0000000000..92a3a741c5
--- /dev/null
+++ b/xen/scripts/Makefile.asm-generic
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# include/asm-generic contains a lot of files that are used
+# verbatim by several architectures.
+#
+# This Makefile reads the file arch/$(SRCARCH)/include/asm/Makefile
+# and for each file listed in this file with generic-y creates
+# a small wrapper file in arch/$(SRCARCH)/include/generated/asm.
+
+PHONY := all
+all:
+
+src := $(subst /generated,,$(obj))
+
+include $(srctree)/scripts/Kbuild.include
+-include $(src)/Makefile
+
+redundant := $(filter $(mandatory-y) $(generated-y), $(generic-y))
+redundant += $(foreach f, $(generic-y), $(if $(wildcard $(srctree)/$(src)/$(f)),$(f)))
+redundant := $(sort $(redundant))
+$(if $(redundant),\
+	$(warning redundant generic-y found in $(src)/Kbuild: $(redundant)))
+
+# If arch does not implement mandatory headers, fallback to asm-generic ones.
+mandatory-y := $(filter-out $(generated-y), $(mandatory-y))
+generic-y   += $(foreach f, $(mandatory-y), $(if $(wildcard $(srctree)/$(src)/$(f)),,$(f)))
+
+generic-y   := $(addprefix $(obj)/, $(generic-y))
+generated-y := $(addprefix $(obj)/, $(generated-y))
+
+# Remove stale wrappers when the corresponding files are removed from generic-y
+old-headers := $(wildcard $(obj)/*.h)
+unwanted    := $(filter-out $(generic-y) $(generated-y),$(old-headers))
+
+quiet_cmd_wrap = WRAP    $@
+      cmd_wrap = echo "\#include <asm-generic/$*.h>" > $@
+
+quiet_cmd_remove = REMOVE  $(unwanted)
+      cmd_remove = rm -f $(unwanted)
+
+all: $(generic-y)
+	$(if $(unwanted),$(call cmd,remove))
+	@:
+
+$(obj)/%.h:
+	$(call cmd,wrap)
+
+# Create output directory. Skip it if at least one old header exists
+# since we know the output directory already exists.
+ifeq ($(old-headers),)
+$(shell mkdir -p $(obj))
+endif
+
+.PHONY: $(PHONY)
-- 
2.41.0


