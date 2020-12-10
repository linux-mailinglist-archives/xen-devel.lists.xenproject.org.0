Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F352D5872
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 11:44:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49054.86777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knJQ2-0003Gh-L6; Thu, 10 Dec 2020 10:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49054.86777; Thu, 10 Dec 2020 10:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knJQ2-0003GI-Ht; Thu, 10 Dec 2020 10:43:30 +0000
Received: by outflank-mailman (input) for mailman id 49054;
 Thu, 10 Dec 2020 10:43:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gO0O=FO=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1knJQ0-0003GD-IB
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 10:43:28 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4ad526f4-b2db-4788-94e3-8b8c52186b02;
 Thu, 10 Dec 2020 10:43:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49C9C30E;
 Thu, 10 Dec 2020 02:43:26 -0800 (PST)
Received: from localhost.localdomain (unknown [10.57.62.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AFDC3F718;
 Thu, 10 Dec 2020 02:43:24 -0800 (PST)
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
X-Inumbo-ID: 4ad526f4-b2db-4788-94e3-8b8c52186b02
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/arm: Add workaround for Cortex-A53 erratum #843419
Date: Thu, 10 Dec 2020 10:42:58 +0000
Message-Id: <20201210104258.111-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

On the Cortex A53, when executing in AArch64 state, a load or store instruction
which uses the result of an ADRP instruction as a base register, or which uses
a base register written by an instruction immediately after an ADRP to the
same register, might access an incorrect address.

The workaround is to enable the linker flag --fix-cortex-a53-843419
if present, to check and fix the affected sequence. Otherwise print a warning
that Xen may be susceptible to this errata

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/misc/arm/silicon-errata.txt |  1 +
 xen/arch/arm/Kconfig             | 19 +++++++++++++++++++
 xen/arch/arm/Makefile            |  8 ++++++++
 xen/scripts/Kbuild.include       | 12 ++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
index 27bf957ebf..1925d8fd4e 100644
--- a/docs/misc/arm/silicon-errata.txt
+++ b/docs/misc/arm/silicon-errata.txt
@@ -45,6 +45,7 @@ stable hypervisors.
 | ARM            | Cortex-A53      | #827319         | ARM64_ERRATUM_827319    |
 | ARM            | Cortex-A53      | #824069         | ARM64_ERRATUM_824069    |
 | ARM            | Cortex-A53      | #819472         | ARM64_ERRATUM_819472    |
+| ARM            | Cortex-A53      | #843419         | ARM64_ERRATUM_843419    |
 | ARM            | Cortex-A55      | #1530923        | N/A                     |
 | ARM            | Cortex-A57      | #852523         | N/A                     |
 | ARM            | Cortex-A57      | #832075         | ARM64_ERRATUM_832075    |
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index f5b1bcda03..41bde2f401 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -186,6 +186,25 @@ config ARM64_ERRATUM_819472
 
 	  If unsure, say Y.
 
+config ARM64_ERRATUM_843419
+	bool "Cortex-A53: 843419: A load or store might access an incorrect address"
+	default y
+	depends on ARM_64
+	help
+	  This option adds an alternative code sequence to work around ARM
+	  erratum 843419 on Cortex-A53 parts up to r0p4.
+
+	  When executing in AArch64 state, a load or store instruction which uses
+	  the result of an ADRP instruction as a base register, or which uses a
+	  base register written by an instruction immediately after an ADRP to the
+	  same register, might access an incorrect address.
+
+	  The workaround enables the linker to check if the affected sequence is
+	  produced and it will fix it with an alternative not affected sequence
+	  that produce the same behavior.
+
+	  If unsure, say Y.
+
 config ARM64_ERRATUM_832075
 	bool "Cortex-A57: 832075: possible deadlock on mixing exclusive memory accesses with device loads"
 	default y
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 296c5e68bb..ad2d497c45 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -101,6 +101,14 @@ prelink.o: $(ALL_OBJS) FORCE
 	$(call if_changed,ld)
 endif
 
+ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
+    ifeq ($(call ld-option, --fix-cortex-a53-843419),n)
+        $(warning ld does not support --fix-cortex-a53-843419; xen may be susceptible to erratum)
+    else
+        XEN_LDFLAGS += --fix-cortex-a53-843419
+    endif
+endif
+
 targets += prelink.o
 
 $(TARGET)-syms: prelink.o xen.lds
diff --git a/xen/scripts/Kbuild.include b/xen/scripts/Kbuild.include
index e62eddc365..83c7e1457b 100644
--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -43,6 +43,18 @@ define as-option-add-closure
     endif
 endef
 
+# $(if-success,<command>,<then>,<else>)
+# Return <then> if <command> exits with 0, <else> otherwise.
+if-success = $(shell { $(1); } >/dev/null 2>&1 && echo "$(2)" || echo "$(3)")
+
+# $(success,<command>)
+# Return y if <command> exits with 0, n otherwise
+success = $(call if-success,$(1),y,n)
+
+# $(ld-option,<flag>)
+# Return y if the linker supports <flag>, n otherwise
+ld-option = $(call success,$(LD) -v $(1))
+
 # cc-ifversion
 # Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
 cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
-- 
2.17.1


