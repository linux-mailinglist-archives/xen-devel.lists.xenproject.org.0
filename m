Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9E3AD6D0C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 12:07:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012750.1391257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeq3-0004J3-K4; Thu, 12 Jun 2025 10:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012750.1391257; Thu, 12 Jun 2025 10:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeq3-0004HT-Gi; Thu, 12 Jun 2025 10:07:15 +0000
Received: by outflank-mailman (input) for mailman id 1012750;
 Thu, 12 Jun 2025 10:07:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iZHf=Y3=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uPeq2-0004EN-ET
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 10:07:14 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0338948b-4775-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 12:07:14 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-450ce3a2dd5so6622725e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 03:07:14 -0700 (PDT)
Received: from localhost.localdomain (188.226.6.51.dyn.plus.net.
 [51.6.226.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e2354fbsm15346475e9.15.2025.06.12.03.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 03:07:12 -0700 (PDT)
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
X-Inumbo-ID: 0338948b-4775-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1749722833; x=1750327633; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bUko4TzvIlHQks/LPst4s4YFTFwvXxHrUO/t6ns3ywA=;
        b=Fu5lkdhoeNGWv0BJ44XQUr+AWKRirliCHxKrrguKSho607KL+p82t7deUN1pIS2o2d
         6RtYeQ3LifhmqBkxNOovhxj7OmFMnP3NANHOpId3GtEu/cQpQGkPfYSvj9QtGhnEKirz
         vm3SlbvB9Y5Tzrfj7aiHzBkKM8IN+8CJlf8U0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749722833; x=1750327633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bUko4TzvIlHQks/LPst4s4YFTFwvXxHrUO/t6ns3ywA=;
        b=wRq0hRWO+z8FI07ZH5XGHRYpboDBJFN7Px9nrsMtL7tqnPs2AWVTIQCCJ0xFsv+BTp
         6Mg9+gSSeczE+EpmRFFvUVUekGeXoLsoWU8eu7CsWiUrrhs0CXtjp++T1z5qhp3cl7Oc
         zyH4uNHivFCQsq3BpDjy45SZCna6oi17PvotslS+4RdXWFp9APM803MJR8Aeko8Wn88J
         2Uxnn1A4YzxKYBsugxEBeMy59wbhzYxOz2z8rtdToJ04Ts5dXHkd5ZT+stnq5E/+lR3S
         hfGO4FbrgumqlPGOxwoG5HtNt2VGjzHPSP3qFdo/C7jlgxrCv2HvkdSlL3pXMc21ToVd
         dwpA==
X-Gm-Message-State: AOJu0Yx6mrCktyPJiYDuhe7bhqeVtVklrtx89TxJuFLHEK+HIersK11H
	u0kE6mNlkPD6xTW/R23YXcjp9dale7SdQciDMMpGHWg09nptlLmvJjxWs1iHOluvzLGb0sQIaUy
	BSeEJ10I=
X-Gm-Gg: ASbGnct16mgXvi2iG/XCGcHfCZExuuxxf1xNOwiFLpC1RSEZuhlGnbu6yvUmVbp5sXR
	itN9hjP89oa1Qyy+SrN8rH89cl3zX3OmQRWChaVUPRBou7HfW9QRT8jU3Pm0dQQGEp23IHKYguq
	zKOyXWu4nQ/o+wWve/RnUBhL0LG1oWhOn/9bk7Uc7lw4rXGetiVjA/QD4d4Nvhf0dgWND+WzCzA
	ijpET2Os28qGLDID6se7nqkSUzqPZpscpxwxuDNsxn6yW6iSsqEs3IvJeULC3LPVk8+gMmZOEVx
	31XlqNxZROnMbUil8S3wgHL+R6bg19/x8sOROdtVlc9/2Iq7HozeMjCxQIuDGlhiLAYnfM0JIQI
	h53/+YP6NwcZdTbK6OEEWDIOxCXznCw==
X-Google-Smtp-Source: AGHT+IGNe8PRN8RpZpUO8SDjWIaT9c4E5wW6Vm1JyH4OneUxjJ8Tc1IakSSjhXpqj66KcXSnKZlxng==
X-Received: by 2002:a05:600c:6385:b0:450:cea0:1781 with SMTP id 5b1f17b1804b1-4532d33de4bmr25336035e9.16.1749722833094;
        Thu, 12 Jun 2025 03:07:13 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] xen: Strip xen.efi by default
Date: Thu, 12 Jun 2025 11:07:03 +0100
Message-ID: <20250612100705.21988-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For xen.gz file we strip all symbols and have an additional
xen-syms file version with all symbols.
Make xen.efi more coherent stripping all symbols too.
xen.efi.elf can be used for debugging.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v1:
- avoid leaving target if some command fails
---
 docs/misc/efi.pandoc  |  8 +-------
 xen/Kconfig.debug     |  9 ++-------
 xen/Makefile          | 19 -------------------
 xen/arch/x86/Makefile |  8 +++++---
 4 files changed, 8 insertions(+), 36 deletions(-)

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
index ce724a9daa..e0ebc8c73e 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -232,14 +232,16 @@ endif
 	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
 	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
-	      $(note_file_option) -o $@
-	$(NM) -pa --format=sysv $@ \
+	      $(note_file_option) -o $@.tmp
+	$(NM) -pa --format=sysv $@.tmp \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
 ifeq ($(CONFIG_DEBUG_INFO),y)
-	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
+	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@.tmp $@.elf
+	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) $@.tmp
 endif
 	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
+	mv -f $@.tmp $@
 ifeq ($(CONFIG_XEN_IBT),y)
 	$(SHELL) $(srctree)/tools/check-endbr.sh $@
 endif
-- 
2.43.0


