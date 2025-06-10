Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F84BAD3356
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 12:13:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010661.1388818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOvyQ-0001sw-L0; Tue, 10 Jun 2025 10:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010661.1388818; Tue, 10 Jun 2025 10:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOvyQ-0001qz-HE; Tue, 10 Jun 2025 10:12:54 +0000
Received: by outflank-mailman (input) for mailman id 1010661;
 Tue, 10 Jun 2025 10:12:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FKd0=YZ=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1uOvyO-0001qs-Pm
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 10:12:52 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7701616b-45e3-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 12:12:50 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-450cfb6a794so33979105e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 03:12:50 -0700 (PDT)
Received: from localhost.localdomain (188.226.6.51.dyn.plus.net.
 [51.6.226.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45213709686sm137066145e9.23.2025.06.10.03.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 03:12:49 -0700 (PDT)
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
X-Inumbo-ID: 7701616b-45e3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749550370; x=1750155170; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XelYdTZNWda+2F9NGJi8mxW1Fq92OkooZLmF3hYL8Dk=;
        b=VYSxk9xrs3IYp5zJgklcmGul2zYgh4NLFc924XUENSZax3fbEQLhxivS2n9Ywx/CLI
         Cd76U5CnHvpXYi+UPjUF6FG3oF07+9PZjzDIsaOHn+HhEILFins3Z4MZfQzssZYxXCWs
         5X29K59s1vpNMYF8ZnL4RcdCXZE1bDiMrdCW+mkPnRtI5pjuITVLbbx3bYNMPHsvSqPE
         QIF6gs5Lt+prFFA+LyuNm5Dd2b/rStt4cYMY1mXWntjzYbIErLxYsds7QDm0Nb47/25I
         2M4/bnwH3HIePt5/YELNPunv2++7P/g63Xm5bfNMvRGS9+ACcCcWr20GM+9e6cD8V2bL
         sxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749550370; x=1750155170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XelYdTZNWda+2F9NGJi8mxW1Fq92OkooZLmF3hYL8Dk=;
        b=uWyVQk4NEElOaMV/okYcs1wg+3zwd6c5bAwEwDAYT/eYiZuwxVXvPIHhZ/XU9KG7on
         iEpmx1cNiYAJu2uyBd490I9eU6qSpH4TcVLtZFTJ65oPxoQsGgDlS2zVGyjqeOxLrgvt
         Yk1VtVQiAHM3kEZG2InTUDqc5IgNx44S2IXC9S/j/LmsZhvCCWH/MgKF19CtjuP64U88
         QnTmIwLQBS7LsgD6i9lyRcrqNweTIEkuZLC5VrzElwNZt12m0JFMCkc0RBiVMg0xIMTp
         c9gF/9FIH78Wyy4ClfTbU7oqRsyTHFWi0eChprady8JkN7NDRlnrj05FSpJ+VxvcO4oI
         fRiQ==
X-Gm-Message-State: AOJu0YzZfRYbLHERk4JQiDFJpivHqv4Bd7dlGwaKpzgAWDUyl93d1vs8
	PDCLPI7cXE7aSlpmD/wK2bibBp0OTMYqLfcvWx2j4GdMWPuGuq+czSl2TiMIb1f4
X-Gm-Gg: ASbGncu74zV9oo3d2Pk+aR8LlKPtKNo333Cv1KIEPreJilCulKHeYdK40aHfyK2+JIt
	W8sX/Jtp+C2mElzO4g0XeKKh8J08pJ0KSCgvfAwYwq7mlsFMj2q6hx0dYftHgp0DIVrdB88fwCX
	62zo/+a1UqrDIlKfFwn0Hh7JalFTXFyjOHcc8WwUPUCTsbHDRCqp8QgzuHWmVXpbA5dZ16T1ps0
	JwLy/61eijdfJiryjtij+uh6137dE3CxYlb1lySy0Q1b9wyKflbSXcZeYRj4lWzTh6qpqZPPcnK
	gN3TUFsMSyxsxpbpldejIp8bn8Rkr2pR7DIIaS5iVg4OH7EcYyvGDF/dGoUBXOnuX+uiwLDIPsy
	d1PBgLg8liku1ksZszKA6d7VlGcuUEYk=
X-Google-Smtp-Source: AGHT+IFidtGkkIAHlMh7sKk3uc+NT0X+ECpEPn5k3a2CU0xUMCzdMkB3BLdjl1nED04TsM1UztkTiA==
X-Received: by 2002:a05:600c:64c6:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-4531de0093emr18729805e9.11.1749550369654;
        Tue, 10 Jun 2025 03:12:49 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <freddy77@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen: Strip xen.efi by default
Date: Tue, 10 Jun 2025 11:12:25 +0100
Message-ID: <20250610101228.24460-1-freddy77@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For xen.gz file we strip all symbols and have an additional
xen-syms file version with all symbols.
Make xen.efi more coherent stripping all symbols too.
xen.efi.elf can be used for debugging.

Signed-off-by: Frediano Ziglio <freddy77@gmail.com>
---
 docs/misc/efi.pandoc  |  8 +-------
 xen/Kconfig.debug     |  9 ++-------
 xen/Makefile          | 19 -------------------
 xen/arch/x86/Makefile |  1 +
 4 files changed, 4 insertions(+), 33 deletions(-)

diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
index 11c1ac3346..c66b18a66b 100644
--- a/docs/misc/efi.pandoc
+++ b/docs/misc/efi.pandoc
@@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot modules are found.
 Once built, `make install-xen` will place the resulting binary directly into
 the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
 `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot/efi` not
-match your system). When built with debug info, the binary can be quite large.
-Setting `INSTALL_EFI_STRIP=1` in the environment will cause it to be stripped
-of debug info in the process of installing. `INSTALL_EFI_STRIP` can also be set
-to any combination of options suitable to pass to `strip`, in case the default
-ones don't do. The xen.efi binary will also be installed in `/usr/lib64/efi/`,
-unless `EFI_DIR` is set in the environment to override this default. This
-binary will not be stripped in the process.
+match your system).
 
 The binary itself will require a configuration file (names with the `.efi`
 extension of the binary's name replaced by `.cfg`, and - until an existing
diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index d14093017e..cafbb1236c 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -147,12 +147,7 @@ config DEBUG_INFO
 	  Say Y here if you want to build Xen with debug information. This
 	  information is needed e.g. for doing crash dump analysis of the
 	  hypervisor via the "crash" tool.
-	  Saying Y will increase the size of the xen-syms and xen.efi
-	  binaries. In case the space on the EFI boot partition is rather
-	  limited, you may want to install a stripped variant of xen.efi in
-	  the EFI boot partition (look for "INSTALL_EFI_STRIP" in
-	  docs/misc/efi.pandoc for more information - when not using
-	  "make install-xen" for installing xen.efi, stripping needs to be
-	  done outside the Xen build environment).
+	  Saying Y will increase the size of the xen-syms and xen.efi.elf
+	  binaries.
 
 endmenu
diff --git a/xen/Makefile b/xen/Makefile
index 8fc4e042ff..664c4ea7b8 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -488,22 +488,6 @@ endif
 .PHONY: _build
 _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
 
-# Strip
-#
-# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped before it
-# is installed. If INSTALL_EFI_STRIP is '1', then the default option(s) below
-# will be used. Otherwise, INSTALL_EFI_STRIP value will be used as the
-# option(s) to the strip command.
-ifdef INSTALL_EFI_STRIP
-
-ifeq ($(INSTALL_EFI_STRIP),1)
-efi-strip-opt := --strip-debug --keep-file-symbols
-else
-efi-strip-opt := $(INSTALL_EFI_STRIP)
-endif
-
-endif
-
 .PHONY: _install
 _install: D=$(DESTDIR)
 _install: T=$(notdir $(TARGET))
@@ -530,9 +514,6 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
 		if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
-			$(if $(efi-strip-opt), \
-			     $(STRIP) $(efi-strip-opt) -p -o $(TARGET).efi.stripped $(TARGET).efi && \
-			     $(INSTALL_DATA) $(TARGET).efi.stripped $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
 			$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
 		elif [ "$(D)" = "$(patsubst $(shell cd $(XEN_ROOT) && pwd)/%,%,$(D))" ]; then \
 			echo 'EFI installation only partially done (EFI_VENDOR not set)' >&2; \
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index ce724a9daa..725bcef340 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -238,6 +238,7 @@ endif
 		> $@.map
 ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
+	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) $@
 endif
 	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
 ifeq ($(CONFIG_XEN_IBT),y)
-- 
2.43.0


