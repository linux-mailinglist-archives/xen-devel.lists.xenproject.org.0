Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8C73F5CB3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:02:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171044.312315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUC4-00067c-Gj; Tue, 24 Aug 2021 11:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171044.312315; Tue, 24 Aug 2021 11:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUC4-0005x9-8O; Tue, 24 Aug 2021 11:02:12 +0000
Received: by outflank-mailman (input) for mailman id 171044;
 Tue, 24 Aug 2021 11:02:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU3o-0001EC-Dm
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:53:40 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68f546d2-c207-4731-818d-fce33251a239;
 Tue, 24 Aug 2021 10:52:00 +0000 (UTC)
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
X-Inumbo-ID: 68f546d2-c207-4731-818d-fce33251a239
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eL+L/g0OFbmcLBVeQHSISwMI5xPrpz9PQZVTlfTI3z8=;
  b=Jgi6/5Y2vKTDWTOhRfLRlCXGw//4q0Z4lDgMgAkafGQPBaB0FTTs86UZ
   ot6eLHeSsKN3dYQA9zCQoBM5Z2Vi5JTvs2w5J6iu5DX5AGw9i5mWKOH20
   IUuVyyAjiGPPwD+AWEhJRVtbZQTeZLhrldGLE11XtzJ36SzPnWI3/s6dP
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: aNYs++s88y0oUPr7KFWX8745FZRW9raGVnJRewvDoxXdGKdZY9Qh2m5uk7XPCfn1uh8FSHxFSP
 lbpWviy8UUjWqLpY/EYTOGrSlVGftFyF1L+9cBCo/j3s0VHO2aEP1R3HdCK5I+CIleukBoqRU/
 OPrLjjnR457CVBMgGFc+vEJIBqwVrvGIn8RP5ylVxdaWEzlEcOTG1ln0+tWyoo25qwdgmas6VD
 bRi2H/CC4oXC23TTqqUsqJqQ3yu0tqfAnt/QfJeh7WxgMHPx4YLLKk9Y1Md5VuIPp69PmFgxgO
 DCoTdw3twKRyOrHyEUg5/xGy
X-SBRS: 5.1
X-MesageID: 51130784
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:vD1lU6v/1S1IbKQAjDDIC7yE7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpHnJYVcqKQkdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyIMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51130784"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [XEN PATCH v7 35/51] build: Add headers path to CFLAGS once for all archs
Date: Tue, 24 Aug 2021 11:50:22 +0100
Message-ID: <20210824105038.1257926-36-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This just remove duplication.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile           | 3 +++
 xen/arch/arm/arch.mk   | 3 ---
 xen/arch/riscv/arch.mk | 2 --
 xen/arch/x86/arch.mk   | 2 --
 4 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 8381ffd5d168..28854d6cb29f 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -293,6 +293,9 @@ CFLAGS += -flto
 LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin LLVMgold.so
 endif
 
+CFLAGS += -I$(srctree)/include
+CFLAGS += -I$(srctree)/arch/$(TARGET_ARCH)/include
+
 # Note that link order matters!
 ALL_OBJS-y                := common/built_in.o
 ALL_OBJS-y                += drivers/built_in.o
diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index 4e3f7014305e..094b67072304 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -1,9 +1,6 @@
 ########################################
 # arm-specific definitions
 
-CFLAGS += -I$(srctree)/include
-CFLAGS += -I$(srctree)/arch/$(TARGET_ARCH)/include
-
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
 
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 694ba053ceab..ae8fe9dec730 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -11,5 +11,3 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
 # -mcmodel=medlow would force Xen into the lower half.
 
 CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
-CFLAGS += -I$(srctree)/include
-CFLAGS += -I$(srctree)/arch/$(TARGET_ARCH)/include
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 8bbf3e18e410..53b48ded28de 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -3,8 +3,6 @@
 
 export XEN_IMG_OFFSET := 0x200000
 
-CFLAGS += -I$(srctree)/include
-CFLAGS += -I$(srctree)/arch/$(TARGET_ARCH)/include
 CFLAGS += -I$(srctree)/arch/x86/include/asm/mach-generic
 CFLAGS += -I$(srctree)/arch/x86/include/asm/mach-default
 CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFFSET)
-- 
Anthony PERARD


