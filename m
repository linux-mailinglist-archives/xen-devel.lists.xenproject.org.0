Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03353333611
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 07:58:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95866.180985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJsng-0005Tg-Ny; Wed, 10 Mar 2021 06:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95866.180985; Wed, 10 Mar 2021 06:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJsng-0005TH-Kx; Wed, 10 Mar 2021 06:58:32 +0000
Received: by outflank-mailman (input) for mailman id 95866;
 Wed, 10 Mar 2021 06:58:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iqsa=II=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lJsnf-0005TC-JS
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 06:58:31 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c791f107-32bc-41e3-8be2-94aaaaebfb2e;
 Wed, 10 Mar 2021 06:58:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D07111FB;
 Tue,  9 Mar 2021 22:58:29 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.15.227])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F14873F70D;
 Tue,  9 Mar 2021 22:58:27 -0800 (PST)
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
X-Inumbo-ID: c791f107-32bc-41e3-8be2-94aaaaebfb2e
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	bertrand.marquis@arm.com
Subject: [PATCH v4] arm: Add Kconfig entry to select CONFIG_DTB_FILE
Date: Wed, 10 Mar 2021 07:58:03 +0100
Message-Id: <20210310065803.348-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently in order to link existing DTB into Xen image
we need to either specify option CONFIG_DTB_FILE on the
command line or manually add it into .config.
Add Kconfig entry: CONFIG_DTB_FILE to be able to
provide the path to DTB we want to embed into Xen image.
If no path provided - the dtb will not be embedded.

Remove the line: AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
as it is not needed since Kconfig will define it in a header
with all the other config options.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/Makefile | 5 ++---
 xen/common/Kconfig    | 8 ++++++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 16e6523e2c..46e6a95fec 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -68,9 +68,8 @@ extra-y += $(TARGET_SUBARCH)/head.o
 
 #obj-bin-y += ....o
 
-ifdef CONFIG_DTB_FILE
+ifneq ($(CONFIG_DTB_FILE),"")
 obj-y += dtb.o
-AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
 endif
 
 ALL_OBJS := $(TARGET_SUBARCH)/head.o $(ALL_OBJS)
@@ -137,7 +136,7 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
 xen.lds: xen.lds.S
 	$(CPP) -P $(a_flags) -MQ $@ -o $@ $<
 
-dtb.o: $(CONFIG_DTB_FILE)
+dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
 
 .PHONY: clean
 clean::
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index eb953d171e..a27836bf47 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -400,6 +400,14 @@ config DOM0_MEM
 
 	  Leave empty if you are not sure what to specify.
 
+config DTB_FILE
+	string "Absolute path to device tree blob"
+	depends on HAS_DEVICE_TREE
+	---help---
+	  When using a bootloader that has no device tree support or when there
+	  is no bootloader at all, use this option to specify the absolute path
+	  to a device tree that will be linked directly inside Xen binary.
+
 config TRACEBUFFER
 	bool "Enable tracing infrastructure" if EXPERT
 	default y
-- 
2.29.0


