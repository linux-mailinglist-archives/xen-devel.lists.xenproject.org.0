Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8B7330A96
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 10:53:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94754.178404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCZF-0005mj-2A; Mon, 08 Mar 2021 09:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94754.178404; Mon, 08 Mar 2021 09:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCZE-0005mK-VW; Mon, 08 Mar 2021 09:52:48 +0000
Received: by outflank-mailman (input) for mailman id 94754;
 Mon, 08 Mar 2021 09:52:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NN5v=IG=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lJCZD-0005mF-Lu
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:52:47 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d4367ea2-e658-49a7-9027-44d7a24a04d6;
 Mon, 08 Mar 2021 09:52:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50F7D31B;
 Mon,  8 Mar 2021 01:52:45 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.16.174])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E98D3F73C;
 Mon,  8 Mar 2021 01:52:43 -0800 (PST)
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
X-Inumbo-ID: d4367ea2-e658-49a7-9027-44d7a24a04d6
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
	bertrand.marquis@arm.com,
	wei.chen@arm.com
Subject: [PATCH] arm: Add Kconfig entry to select CONFIG_DTB_FILE
Date: Mon,  8 Mar 2021 10:52:33 +0100
Message-Id: <20210308095233.13329-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently in order to link existing DTB into Xen image
we need to either specify option CONFIG_DTB_FILE on the
command line or manually add it into .config.
Add Kconfig entries: CONFIG_LINK_DTB and CONFIG_DTB_FILE
to be able to select this option and provide the path to
DTB we want to embed into Xen image.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/Makefile |  2 --
 xen/common/Kconfig    | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 16e6523e2c..104422960a 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -137,8 +137,6 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
 xen.lds: xen.lds.S
 	$(CPP) -P $(a_flags) -MQ $@ -o $@ $<
 
-dtb.o: $(CONFIG_DTB_FILE)
-
 .PHONY: clean
 clean::
 	rm -f asm-offsets.s xen.lds
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index eb953d171e..c032079c7e 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -400,6 +400,20 @@ config DOM0_MEM
 
 	  Leave empty if you are not sure what to specify.
 
+config LINK_DTB
+	bool "Link DTB into Xen image"
+	depends on ARM
+	default n
+
+config DTB_FILE
+	string "Absolute path to device tree blob"
+	default ""
+	depends on LINK_DTB
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


