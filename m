Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1D979006D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 18:03:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594652.928050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc6bI-0005Wd-Ja; Fri, 01 Sep 2023 16:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594652.928050; Fri, 01 Sep 2023 16:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc6bI-0005TF-Fd; Fri, 01 Sep 2023 16:02:24 +0000
Received: by outflank-mailman (input) for mailman id 594652;
 Fri, 01 Sep 2023 16:02:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bo8w=ER=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qc6bG-0005E0-PI
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 16:02:22 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee616c88-48e0-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 18:02:20 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fe15bfb1adso3710101e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 Sep 2023 09:02:20 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d23-20020ac25457000000b0050097974ec8sm685782lfn.216.2023.09.01.09.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 09:02:19 -0700 (PDT)
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
X-Inumbo-ID: ee616c88-48e0-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693584140; x=1694188940; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZExcTC6l7icIOR2qrAEQ8pDFYYgMv3JXQMxkelpXgsM=;
        b=WsmQx6I3i3ZXkaDeXw6ybYjH5AFYpTosQjjTzOcrqt5AXpwwlUZRiVtSKI6sdM9Vc0
         ZGlkGVSwp0X5iWMz/X1FmojT3hy4g6rcsAO1PX51t8TwYugTnb/ZtncGsPNI3OttcMwX
         OgMVlMVRDfkhRqw32Bt7TAt91GUcaDQZzWls7kbzHTmgEn9gfneRYY8zj0+od4fLvcoh
         XL18uFeNw+Opc4mhmWv2B1t3xVq5Ifmo6K/3Q+qdHckMtvFY/MfGfBDy5HrX0MJ/sOzo
         fSY+RQ9yOoa85IFndIMHY+yJ8ynvmkZqQ1036VoxlUj/S1NHTzUF+YvygF+JLhjOcdX+
         bkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693584140; x=1694188940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZExcTC6l7icIOR2qrAEQ8pDFYYgMv3JXQMxkelpXgsM=;
        b=FBZjY6+ykNHRt/qWSOE32WjJEaVAPbxW/6Y11Z4XH3/38hILOX40Is+jKVmln/f/7n
         fPjFhU7ppSG+OrNHwd6T8TbneKMuMPcI9MerLKpqHr+5xQWcTvBt63X+G8+h3yq9BvnL
         ZpkUXD+nmiQGR5SsVhUDkFK2rkL3eQMQie2zlTTB34LU+Jh/j5iFS7jTWjXVpV0dPLM5
         65ye/OJ2wNWPsgCaiHANl7L6f8LVfMAAlSd8HhhFMTZPTqM9DU1fXg/x5/aOBMi7hDYa
         LJsyMDO9ECZi4PHNL0HaIhnP3Tp58nllEH49m+mx96EmbXhHIZfh02nv6lAXuNnQT1Lo
         UEBg==
X-Gm-Message-State: AOJu0YwUQypy5uVUerCnCxj0Fs6Je71+DMRbcVlVA6WH4fn9HpDx7tsA
	TqKP6NHsbnQgmwvVNSYo2VOdcpIu76I=
X-Google-Smtp-Source: AGHT+IHrE1tkN7tOKvQW/xBdmqZlTj8BSvl8duyv6UMkZFwwT6vATlSAS/rvWs8AAArj4GHZZruweg==
X-Received: by 2002:a19:8c09:0:b0:500:9d6c:913e with SMTP id o9-20020a198c09000000b005009d6c913emr1838417lfd.52.1693584139348;
        Fri, 01 Sep 2023 09:02:19 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 1/2] xen: asm-generic support
Date: Fri,  1 Sep 2023 19:02:14 +0300
Message-ID: <96b2a4ff48578b7b105581529d2aa6bebd8ad622.1693583721.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1693583721.git.oleksii.kurochko@gmail.com>
References: <cover.1693583721.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some headers are shared between individual architectures or are empty.
To avoid duplication of these headers, asm-generic is introduced.

With the following patch, an architecture uses generic headers
mentioned in the file arch/$(ARCH)/include/asm/Kbuild.

To use a generic header is needed to add to
arch/$(ARCH)/include/asm/Kbuild :
        generic-y += <name-of-header-file.h>

For each mentioned header in arch/$(ARCH)/include/asm/Kbuild,
kbuild will generate the necessary wrapper in
arch/$(ARCH)/include/generated/asm.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/Makefile                      | 10 +++++++++-
 xen/arch/arm/include/asm/Kbuild   |  1 +
 xen/arch/ppc/include/asm/Kbuild   |  1 +
 xen/arch/riscv/include/asm/Kbuild |  1 +
 xen/arch/x86/include/asm/Kbuild   |  1 +
 xen/scripts/Makefile.asm-generic  | 23 +++++++++++++++++++++++
 6 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/include/asm/Kbuild
 create mode 100644 xen/arch/ppc/include/asm/Kbuild
 create mode 100644 xen/arch/riscv/include/asm/Kbuild
 create mode 100644 xen/arch/x86/include/asm/Kbuild
 create mode 100644 xen/scripts/Makefile.asm-generic

diff --git a/xen/Makefile b/xen/Makefile
index f57e5a596c..698d6ddeb8 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -438,6 +438,7 @@ ifdef building_out_of_srctree
 endif
 CFLAGS += -I$(srctree)/include
 CFLAGS += -I$(srctree)/arch/$(SRCARCH)/include
+CFLAGS += -I$(srctree)/arch/$(SRCARCH)/include/generated
 
 # Note that link order matters!
 ALL_OBJS-y                := common/built_in.o
@@ -580,6 +581,7 @@ _clean:
 	rm -f $(TARGET).efi $(TARGET).efi.map $(TARGET).efi.elf $(TARGET).efi.stripped
 	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
 	rm -f .banner .allconfig.tmp include/xen/compile.h
+	rm -rf arch/*/include/generated
 
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
diff --git a/xen/arch/arm/include/asm/Kbuild b/xen/arch/arm/include/asm/Kbuild
new file mode 100644
index 0000000000..a4e40e534e
--- /dev/null
+++ b/xen/arch/arm/include/asm/Kbuild
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0-only
diff --git a/xen/arch/ppc/include/asm/Kbuild b/xen/arch/ppc/include/asm/Kbuild
new file mode 100644
index 0000000000..a4e40e534e
--- /dev/null
+++ b/xen/arch/ppc/include/asm/Kbuild
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0-only
diff --git a/xen/arch/riscv/include/asm/Kbuild b/xen/arch/riscv/include/asm/Kbuild
new file mode 100644
index 0000000000..a4e40e534e
--- /dev/null
+++ b/xen/arch/riscv/include/asm/Kbuild
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0-only
diff --git a/xen/arch/x86/include/asm/Kbuild b/xen/arch/x86/include/asm/Kbuild
new file mode 100644
index 0000000000..a4e40e534e
--- /dev/null
+++ b/xen/arch/x86/include/asm/Kbuild
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0-only
diff --git a/xen/scripts/Makefile.asm-generic b/xen/scripts/Makefile.asm-generic
new file mode 100644
index 0000000000..0aac3f50b8
--- /dev/null
+++ b/xen/scripts/Makefile.asm-generic
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0
+# include/asm-generic contains a lot of files that are used
+# verbatim by several architectures.
+#
+# This Makefile reads the file arch/$(SRCARCH)/include/asm/Kbuild
+# and for each file listed in this file with generic-y creates
+# a small wrapper file in $(obj) (arch/$(SRCARCH)/include/generated/asm)
+
+kbuild-file := $(srctree)/arch/$(SRCARCH)/include/asm/Kbuild
+include $(kbuild-file)
+
+include scripts/Kbuild.include
+
+# Create output directory if not already present
+_dummy := $(shell [ -d $(obj) ] || mkdir -p $(obj))
+
+quiet_cmd_wrap = WRAP    $@
+cmd_wrap = echo "\#include <asm-generic/$*.h>" >$@
+
+all: $(patsubst %, $(obj)/%, $(generic-y))
+
+$(obj)/%.h:
+	$(call cmd,wrap)
-- 
2.41.0


