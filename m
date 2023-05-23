Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B167070E20A
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 18:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538615.838727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1VAf-0007AV-DV; Tue, 23 May 2023 16:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538615.838727; Tue, 23 May 2023 16:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1VAf-00078g-AR; Tue, 23 May 2023 16:47:37 +0000
Received: by outflank-mailman (input) for mailman id 538615;
 Tue, 23 May 2023 16:47:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuGZ=BM=citrix.com=prvs=5000a0748=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q1V2Y-0006Dr-O2
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 16:39:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58185c51-f988-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 18:39:12 +0200 (CEST)
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
X-Inumbo-ID: 58185c51-f988-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684859952;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M4sHTi4LXEAqx1EAv6HnupNoWKrhWbjNFEYPRFSBd30=;
  b=FXqQmfhChlxuws1lESkt8GOLKq5qPnLTRoXombK+s/Fbth5Q4gQVeEMh
   QrMXI+dz7XHobgG4QX3YHRdR2CTLXlKrtF7/KbGleNLtbofhdiC7S+fP5
   T+RQrui7D0yafb/mZTaqta+w0qEKKe1W29oTBaB3olWFrfOblWc8tKi9f
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109422966
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:0b29w6zc/W3WM3pV9YB6t+ffxirEfRIJ4+MujC+fZmUNrF6WrkVWn
 GcWXGrSOPyDYmKketp2bYmwo04HuZHUx4QwGQtq+CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRjP6sT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXwUr
 O03Miw9VBK8rNq847ehdOdeu9t2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwNzxrC/
 DOYoQwVBDk0d9q8kySizU6TudfTpjn4U6wKTqeRo6sCbFq7mTVIVUx+uUGAiea9ol6zXZRYM
 UN80jE1saE4+UivT9/8dx61uniJulgbQdU4O+c38h2Xw6zYpQOQHHEZTyVpYcYj8sQxQFQC6
 FiNmN/4AC11h5ecQ3md67S8oCu7PG4eKmpqTS0ZSQoI5fHzrYd1iQjAJv5zHajwgtDrFDXYx
 zGRsDN4l7gVldQM1aiw4RbAmT3EjprDQxMx5w7Xdnm49Q4/b4mgD7FE8nCCs6wGdtzACADc4
 j5dwZP2AP0y4Y+liXbUUcoXAIGT5cmuCDf/hERREasc6GH4k5K8Rrx47DZ7LUZvF88Lfz71f
 UPe0T9sCI9v0GiCNvEuPd/oYyg+5e25TIm+CKiIBjZbSsIpHDJr6h2CcqJ5M4rFtEE32Z8yN
 p6AGSpHJSZLUP83pNZaqgp07FPK+szc7TmLLXwY5079uVZ7WJJyYeltDbd2RrplhJ5oWS2Mm
 zqlC+OEyg9ETMr1aTTN/IgYIDgidCZrWc+m85AMJ7fbfmKK/V3N7NeIm9scl3FNxfwJxo8kA
 FnmMqOn9LYPrSKecljbApySQLjuQYx+vRoGAMDYBn7xgyJLSd/2vM8im24fIeFPGBpLkaQlE
 JHouqyoXpxyd9gw029FN8ii89QyJUjDaMDnF3PNXQXTtqVIH2ThkuIItCO2rUHi0gLfWRMCn
 oCd
IronPort-HdrOrdr: A9a23:xSa81KwvOvR54IamfYmiKrPwT71zdoMgy1knxilNoH1uEvBw8v
 rEoB1173LJYVoqMk3I+urgBED/exzhHPdOiOEs1NyZMDUO1lHHEL1f
X-Talos-CUID: 9a23:+LDj4WwHUmK7At+y8MC1BgUJQJk0XWfB/E3SHGSAA0VsUoObe2KPrfY=
X-Talos-MUID: 9a23:bP208AmVrVf/tWaddmyDdnpMd8FLubqJN3wyrq0agNOHPgJoYS202WE=
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="109422966"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 12/15] build: avoid Config.mk's CFLAGS
Date: Tue, 23 May 2023 17:38:08 +0100
Message-ID: <20230523163811.30792-13-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523163811.30792-1-anthony.perard@citrix.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The variable $(CFLAGS) is too often set in the environment,
especially when building a package for a distribution. Often, those
CFLAGS are intended to be use to build user spaces binaries, not a
kernel. This mean packager needs to takes extra steps to build Xen by
overriding the CFLAGS provided by the package build environment.

With this patch, we avoid using the variable $(CFLAGS). Also, the
hypervisor's build system have complete control over which CFLAGS are
used.

No change intended to XEN_CFLAGS used, beside some flags which may be
in a different order on the command line.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    There's still $(EXTRA_CFLAGS_XEN_CORE) which allows to add more CFLAGS
    if someone building Xen needs to add more CFLAGS to the hypervisor
    build.

 xen/Makefile         | 11 ++++++++++-
 xen/arch/arm/arch.mk |  4 ++++
 xen/arch/x86/arch.mk |  2 ++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index b3bffe8c6f..4dc3acf2a6 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -259,7 +259,16 @@ export KBUILD_DEFCONFIG := $(ARCH)_defconfig
 export XEN_TREEWIDE_CFLAGS := $(CFLAGS)
 
 XEN_AFLAGS =
-XEN_CFLAGS = $(CFLAGS)
+XEN_CFLAGS =
+ifeq ($(XEN_OS),SunOS)
+    XEN_CFLAGS +=  -Wa,--divide -D_POSIX_C_SOURCE=200112L -D__EXTENSIONS__
+endif
+XEN_CFLAGS += -fno-strict-aliasing
+XEN_CFLAGS += -std=gnu99
+XEN_CFLAGS += -Wall -Wstrict-prototypes
+$(call cc-option-add,XEN_CFLAGS,CC,-Wdeclaration-after-statement)
+$(call cc-option-add,XEN_CFLAGS,CC,-Wno-unused-but-set-variable)
+$(call cc-option-add,XEN_CFLAGS,CC,-Wno-unused-local-typedefs)
 
 # CLANG_FLAGS needs to be calculated before calling Kconfig
 ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index 300b8bf7ae..0478fadde2 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -1,6 +1,10 @@
 ########################################
 # arm-specific definitions
 
+ifeq ($(XEN_TARGET_ARCH),arm32)
+    XEN_CFLAGS += -marm
+endif
+
 $(call cc-options-add,XEN_CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,XEN_CFLAGS,CC,-Wnested-externs)
 
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 5df3cf6bc3..fc3b1dc922 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -1,6 +1,8 @@
 ########################################
 # x86-specific definitions
 
+XEN_CFLAGS += -m64
+
 export XEN_IMG_OFFSET := 0x200000
 
 XEN_CFLAGS += -I$(srctree)/arch/x86/include/asm/mach-generic
-- 
Anthony PERARD


