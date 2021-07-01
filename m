Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262613B9322
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148818.275149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxZm-0005ge-Bd; Thu, 01 Jul 2021 14:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148818.275149; Thu, 01 Jul 2021 14:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxZl-0005at-QP; Thu, 01 Jul 2021 14:21:57 +0000
Received: by outflank-mailman (input) for mailman id 148818;
 Thu, 01 Jul 2021 14:21:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxQE-0005tj-2W
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:12:06 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e185f9f-3ef5-4d01-9e93-0151a4543101;
 Thu, 01 Jul 2021 14:10:54 +0000 (UTC)
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
X-Inumbo-ID: 3e185f9f-3ef5-4d01-9e93-0151a4543101
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eij+P9eDuvxcdz2BMz8URUEWDz4oxMoXS30U0EZ+aiI=;
  b=PrzDv+PO8Jqkr8w9iAZHblqYaVAR+qK6k+WRdqr7uLSg2MYSgmX1PmJC
   /sgUYjMEKwCAW4KZvxyGjJZYheyGFSyU4FEP8oh0GwU6iesrw0Uk6mZ/P
   uLIbyhbbnYfoxofiv/SD9KQ6DI7Geo+jFt9qnj4frOjW9My+WPe2mPKC3
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2hiLc/rv5YZvB7xMScsNK+RP/DATlm5u6nfbHqoWNzyv1NQyIIuaanwfVS39WtqpwOYZNQ8+2a
 RvpZzFe3OTjhWGav6qmSOnFL8xyZ7ScmeY6WWzMYVpkPhGTdeSLk+gk4lFPYrCRotosrCWGXSe
 7pBW1G+btqkPQyeCg1XfZfMWD191C4rG1P4D0YVxNcrCL2AoKP54WH/GW7pXVkBSvJjejxXB0i
 oHhzFYY7X3ocHEc+VfgeJKzVtNt8vm7Qf24tNrFzZSZ7iOg4WgxbFr5nPykBOgvmf/T2ud2paL
 IqA=
X-SBRS: 5.1
X-MesageID: 47384421
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9LtKtq7leBdzp6fg6APXwDLXdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBOPZqAEIcBeOlNK1u5
 0AT0B/YueAcGSTj6zBkXWF+wBL+qj5zEiq792usUuEVWtRGsZdB58SMHfhLqVxLjM2Y6YRJd
 6nyedsgSGvQngTZtTTPAh+YwCSz+e77a4PeHQ9dmYa1DU=
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47384421"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [XEN PATCH v6 21/31] build: set XEN_BUILD_EFI earlier
Date: Thu, 1 Jul 2021 15:10:01 +0100
Message-ID: <20210701141011.785641-22-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We are going to need the variable XEN_BUILD_EFI earlier.

This early check is using "try-run" to allow to have a temporary
output file in case it is needed for $(CC) to build the *.c file.

The "efi/check.o" file is still needed in "arch/x86/Makefile" so the
check is currently duplicated.

This patch imports the macro "try-run" from Linux v5.12.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/arch/x86/Makefile      |  2 +-
 xen/arch/x86/arch.mk       |  5 +++++
 xen/scripts/Kbuild.include | 17 +++++++++++++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index bb446a1b928d..d3e38e4e9f02 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -126,7 +126,7 @@ $(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
 ifneq ($(efi-y),)
 
 # Check if the compiler supports the MS ABI.
-export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
+XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 
 # Check if the linker supports PE.
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 9f5fade39e91..5a4a1704636f 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -60,5 +60,10 @@ ifeq ($(CONFIG_UBSAN),y)
 $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
 endif
 
+ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
+# Check if the compiler supports the MS ABI.
+export XEN_BUILD_EFI := $(call try-run,$(CC) $(CFLAGS) -c arch/x86/efi/check.c -o "$$TMPO",y)
+endif
+
 # Set up the assembler include path properly for older toolchains.
 CFLAGS += -Wa,-I$(BASEDIR)/include
diff --git a/xen/scripts/Kbuild.include b/xen/scripts/Kbuild.include
index 838c9440f35e..5fe13a7c5abd 100644
--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -57,6 +57,23 @@ define filechk
 	fi
 endef
 
+# output directory for tests below
+TMPOUT = .tmp_$$$$
+
+# try-run
+# Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
+# Exit code chooses option. "$$TMP" serves as a temporary file and is
+# automatically cleaned up.
+try-run = $(shell set -e;		\
+	TMP=$(TMPOUT)/tmp;		\
+	TMPO=$(TMPOUT)/tmp.o;		\
+	mkdir -p $(TMPOUT);		\
+	trap "rm -rf $(TMPOUT)" EXIT;	\
+	if ($(1)) >/dev/null 2>&1;	\
+	then echo "$(2)";		\
+	else echo "$(3)";		\
+	fi)
+
 # as-insn: Check whether assembler supports an instruction.
 # Usage: cflags-y += $(call as-insn,CC FLAGS,"insn",option-yes,option-no)
 as-insn = $(if $(shell echo 'void _(void) { asm volatile ( $(2) ); }' \
-- 
Anthony PERARD


