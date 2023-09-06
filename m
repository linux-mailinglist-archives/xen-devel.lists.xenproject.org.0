Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A12627943DD
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 21:45:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596798.930846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdyRx-00076A-Hx; Wed, 06 Sep 2023 19:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596798.930846; Wed, 06 Sep 2023 19:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdyRx-000741-Eo; Wed, 06 Sep 2023 19:44:29 +0000
Received: by outflank-mailman (input) for mailman id 596798;
 Wed, 06 Sep 2023 19:44:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UMkA=EW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qdyRw-00073p-04
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 19:44:28 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c96a7b75-4ced-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 21:44:26 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so4081461fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Sep 2023 12:44:26 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 x26-20020a19e01a000000b00500d1f67be9sm2895825lfg.43.2023.09.06.12.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 12:44:25 -0700 (PDT)
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
X-Inumbo-ID: c96a7b75-4ced-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694029466; x=1694634266; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ag/DXDi9KifLSP4rHOgHN27smY2BH4uwqsjc5RshQu8=;
        b=DTCANIPzBrdRsaspw5WQWEgsJFjDyWRtD4S5xVKvVHFEAbfYA+wes74iAlbc4Y3SxX
         Ry80UFoTT2BQxX4yzKPvqCMKUyNAVkburTWTNFubKct/IyxlFzXRGNQK2VDpaHd4Zktr
         t5w3iVm6D7IMAcFm3pJMUSndljcv0TXnBZn2CBnY1QX669MkOKVaDDt1SZ7Hwj3F8mfw
         gANZNeLtEzuhiES/nH60j+kaA3CStuC2LnBrCFbfRN38Bo0jRo9Z6O9TNtMJgBQp23Vs
         bQ4D2+ZgW3vlaIEHim+OLQEg+mvsfgGi85rysu7b+pfBdrxP5eMjzRkSZIVBUxewQHw9
         v2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694029466; x=1694634266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ag/DXDi9KifLSP4rHOgHN27smY2BH4uwqsjc5RshQu8=;
        b=JSP81xAwAIuqpLZU1lApvt1+5pz5d0vwGw4idjybdMQZvFeJY1z9Jay+UsByWSX3SP
         Jif3C4P6Mgm3pLx4/Ud3A+t2A3yFLIkEs2h+abXkVD5Z9fT0QtvSLzRAlvBfEYrP+0CG
         hcqrzfPS9rhLrdYx/coEoaA9+wZ1aVdHSpdHQBHBFWvjDJ8Ep2/KRMJTnqEoPKEyO5Aw
         GAJF+8nt43CxpqhDY/mCLKeEeNJ80/TaglJ9SDoDjdZWSRFw+CHsrqbSRb2It7zK/PRK
         Cc6G/OOBaXT0swgMlnlPBnyRsL/R1wEmApDt9w6txV/JG8Zyn9sL+ZOsdqDLB4L/lZJ8
         p+WA==
X-Gm-Message-State: AOJu0Ywyzv+b/MtcfaJaw3BogZvkwfPRmS/U0lpBc45VrbKg9cBWIcKz
	3vBVjLkRG2ldJ0dZJsmxXah0Wzl9dL4=
X-Google-Smtp-Source: AGHT+IGRBht1lhtK1OMEEj50GvHmT1e0A5rPXLll/lZSMCg4cF0DLQelAHhqMmAgHD3dgz2EPb0iCA==
X-Received: by 2002:ac2:4ecc:0:b0:4f8:586a:8af6 with SMTP id p12-20020ac24ecc000000b004f8586a8af6mr2935163lfr.4.1694029465722;
        Wed, 06 Sep 2023 12:44:25 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 1/2] xen: asm-generic support
Date: Wed,  6 Sep 2023 22:44:21 +0300
Message-ID: <f5a959bf4a28f2c77e7330b4c441e2628acfa7d4.1694024884.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694024884.git.oleksii.kurochko@gmail.com>
References: <cover.1694024884.git.oleksii.kurochko@gmail.com>
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
 xen/Makefile                     | 10 +++++-
 xen/scripts/Makefile.asm-generic | 53 ++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 1 deletion(-)
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
index f57e5a596c..a86b64303d 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -438,6 +438,7 @@ ifdef building_out_of_srctree
 endif
 CFLAGS += -I$(srctree)/include
 CFLAGS += -I$(srctree)/arch/$(SRCARCH)/include
+CFLAGS += -I$(objtree)/arch/$(SRCARCH)/include/generated
 
 # Note that link order matters!
 ALL_OBJS-y                := common/built_in.o
@@ -580,6 +581,7 @@ _clean:
 	rm -f $(TARGET).efi $(TARGET).efi.map $(TARGET).efi.elf $(TARGET).efi.stripped
 	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
 	rm -f .banner .allconfig.tmp include/xen/compile.h
+	rm -rf $(objtree)/arch/*/include/generated
 
 .PHONY: _distclean
 _distclean: clean
@@ -589,7 +591,7 @@ $(TARGET).gz: $(TARGET)
 	gzip -n -f -9 < $< > $@.new
 	mv $@.new $@
 
-$(TARGET): outputmakefile FORCE
+$(TARGET): outputmakefile asm-generic FORCE
 	$(Q)$(MAKE) $(build)=tools
 	$(Q)$(MAKE) $(build)=. include/xen/compile.h
 	$(Q)$(MAKE) $(build)=include all
@@ -667,6 +669,12 @@ endif # need-sub-make
 PHONY += FORCE
 FORCE:
 
+# Support for using generic headers in asm-generic
+PHONY += asm-generic
+asm-generic:
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.asm-generic \
+	            obj=arch/$(SRCARCH)/include/generated/asm
+
 # Declare the contents of the PHONY variable as phony.  We keep that
 # information in a variable so we can use it in if_changed and friends.
 .PHONY: $(PHONY)
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


