Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 959B8805D64
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 19:33:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648226.1012413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAaDo-0005Nj-Ie; Tue, 05 Dec 2023 18:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648226.1012413; Tue, 05 Dec 2023 18:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAaDo-0005L4-Ef; Tue, 05 Dec 2023 18:32:40 +0000
Received: by outflank-mailman (input) for mailman id 648226;
 Tue, 05 Dec 2023 18:32:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rAaDn-0005IJ-1z
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 18:32:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAaDl-0004HJ-5h; Tue, 05 Dec 2023 18:32:37 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAaDk-0007ET-R5; Tue, 05 Dec 2023 18:32:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=uV43mf2udG/DKrLzWvUqnyy/HVgeQgGqI+W4eOCsXJw=; b=LKh0sx
	sHE6cNKM67g37yCo95EFnPrHubUyePnWej1yO+5H0JYXGlj33f2vPqTFvhd6eZhX1ZvasWLDdYoBg
	WLIf3ZXZ7esW8uO9cjNvt5ErKzu6Evbm1CWWdoRsUbVg3PiF6SqpA0k0oRXlgN44q01u9An8f80DN
	37dyoVmwb6U=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] Only compile the hypervisor with -Wdeclaration-after-statement
Date: Tue,  5 Dec 2023 18:32:26 +0000
Message-Id: <20231205183226.26636-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Right now, all tools and hypervisor will be complied with the option
-Wdeclaration-after-statement. While most of the code in the hypervisor
is controlled by us, for tools we may import external libraries.

The build will fail if one of them are using the construct we are
trying to prevent. This is the case when building against Python 3.12
and Yocto:

| In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/Python.h:44,
|                  from xen/lowlevel/xc/xc.c:8:
| /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h: In function 'Py_SIZE':
| /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h:233:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
|   233 |     PyVarObject *var_ob = _PyVarObject_CAST(ob);
|       |     ^~~~~~~~~~~
| In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/Python.h:53:
| /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h: In function '_PyLong_CompactValue':
| /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h:121:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
|   121 |     Py_ssize_t sign = 1 - (op->long_value.lv_tag & _PyLong_SIGN_MASK);
|       |     ^~~~~~~~~~
| cc1: all warnings being treated as errors

Looking at the tools directory, a fair few directory already add
-Wno-declaration-after-statement to inhibit the default behavior.

We have always build the hypervisor with the flag, so for now remove
only the flag for anything but the hypervisor. We can decide at later
time whether we want to relax.

Also remove the -Wno-declaration-after-statement in some subdirectory
as the flag is now unnecessary.

Part of the commit message was take from Alexander's first proposal:

Link: https://lore.kernel.org/xen-devel/20231128174729.3880113-1-alex@linutronix.de/
Reported-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---

I think the decision to remove the flag for the hypervisor is a separate
discussion. Personally I am on the fence.

We could also re-enable the flags to some of the tools directory
if wanted. I chose the most convenience approach for now.
---
 Config.mk                   | 2 --
 stubdom/Makefile            | 2 +-
 stubdom/vtpmmgr/Makefile    | 2 +-
 tools/libs/light/Makefile   | 3 +--
 tools/libs/util/Makefile    | 3 +--
 tools/tests/depriv/Makefile | 2 --
 tools/xl/Makefile           | 3 +--
 xen/Makefile                | 1 +
 8 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/Config.mk b/Config.mk
index 2c43702958eb..7e67b91de293 100644
--- a/Config.mk
+++ b/Config.mk
@@ -177,8 +177,6 @@ CFLAGS += -std=gnu99
 
 CFLAGS += -Wall -Wstrict-prototypes
 
-$(call cc-option-add,HOSTCFLAGS,HOSTCC,-Wdeclaration-after-statement)
-$(call cc-option-add,CFLAGS,CC,-Wdeclaration-after-statement)
 $(call cc-option-add,CFLAGS,CC,-Wno-unused-but-set-variable)
 $(call cc-option-add,CFLAGS,CC,-Wno-unused-local-typedefs)
 
diff --git a/stubdom/Makefile b/stubdom/Makefile
index 71c9b2200e68..8c503c2bf8de 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -245,7 +245,7 @@ tpm_emulator-$(XEN_TARGET_ARCH): tpm_emulator-$(TPMEMU_VERSION).tar.gz
 	patch -d $@ -p1 < vtpm-command-duration.patch
 	patch -d $@ -p1 < vtpm-tpm_bn_t-addr.patch
 	mkdir $@/build
-	cd $@/build; CC=${CC} $(CMAKE) .. -DCMAKE_C_FLAGS:STRING="-std=c99 -DTPM_NO_EXTERN $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) -Wno-declaration-after-statement"
+	cd $@/build; CC=${CC} $(CMAKE) .. -DCMAKE_C_FLAGS:STRING="-std=c99 -DTPM_NO_EXTERN $(TARGET_CPPFLAGS) $(TARGET_CFLAGS)"
 	touch $@
 
 TPMEMU_STAMPFILE=$(CROSS_ROOT)/$(GNU_TARGET_ARCH)-xen-elf/lib/libtpm.a
diff --git a/stubdom/vtpmmgr/Makefile b/stubdom/vtpmmgr/Makefile
index 6dae034a0778..c29bb498381c 100644
--- a/stubdom/vtpmmgr/Makefile
+++ b/stubdom/vtpmmgr/Makefile
@@ -17,7 +17,7 @@ OBJS += vtpm_disk.o disk_tpm.o disk_io.o disk_crypto.o disk_read.o disk_write.o
 OBJS += mgmt_authority.o
 
 CFLAGS+=-Werror -Iutil -Icrypto -Itcs
-CFLAGS+=-Wno-declaration-after-statement -Wno-unused-label
+CFLAGS+=-Wno-unused-label
 
 build: $(TARGET)
 $(TARGET): $(OBJS)
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index ba4c1b79336f..37e4d1670986 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -38,8 +38,7 @@ vpath static_tables.c $(ACPI_PATH)/
 
 OBJS-$(CONFIG_X86) += $(ACPI_OBJS)
 
-CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
-	-Wno-declaration-after-statement -Wformat-nonliteral
+CFLAGS += -Wno-format-zero-length -Wmissing-declarations -Wformat-nonliteral
 
 CFLAGS-$(CONFIG_X86) += -DCONFIG_PCI_SUPP_LEGACY_IRQ
 
diff --git a/tools/libs/util/Makefile b/tools/libs/util/Makefile
index c3b21875dcd8..936ec90a3153 100644
--- a/tools/libs/util/Makefile
+++ b/tools/libs/util/Makefile
@@ -9,8 +9,7 @@ OBJS-y += libxlu_disk.o
 OBJS-y += libxlu_vif.o
 OBJS-y += libxlu_pci.o
 
-CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
-	-Wno-declaration-after-statement -Wformat-nonliteral
+CFLAGS += -Wno-format-zero-length -Wmissing-declarations -Wformat-nonliteral
 CFLAGS += $(CFLAGS_libxenctrl)
 
 CFLAGS += $(PTHREAD_CFLAGS)
diff --git a/tools/tests/depriv/Makefile b/tools/tests/depriv/Makefile
index 7d9e3b01bbd4..5404a12f4780 100644
--- a/tools/tests/depriv/Makefile
+++ b/tools/tests/depriv/Makefile
@@ -1,8 +1,6 @@
 XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS += -Wno-declaration-after-statement
-
 CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(CFLAGS_libxenctrl)
 CFLAGS += $(CFLAGS_libxencall)
diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index 5f7aa5f46c87..d742e96a5b3e 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -5,8 +5,7 @@
 XEN_ROOT = $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
-	-Wno-declaration-after-statement -Wformat-nonliteral
+CFLAGS += -Wno-format-zero-length -Wmissing-declarations -Wformat-nonliteral
 CFLAGS += -fPIC
 
 CFLAGS += $(PTHREAD_CFLAGS)
diff --git a/xen/Makefile b/xen/Makefile
index ca571103c868..360fb6dcae57 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -393,6 +393,7 @@ CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) += -ffunction-sections -fdata-sections
 
 CFLAGS += -nostdinc -fno-builtin -fno-common
 CFLAGS += -Werror -Wredundant-decls -Wwrite-strings -Wno-pointer-arith
+$(call cc-option-add,CFLAGS,CC,-Wdeclaration-after-statement)
 $(call cc-option-add,CFLAGS,CC,-Wvla)
 CFLAGS += -pipe -D__XEN__ -include $(srctree)/include/xen/config.h
 CFLAGS-$(CONFIG_DEBUG_INFO) += -g
-- 
2.40.1


