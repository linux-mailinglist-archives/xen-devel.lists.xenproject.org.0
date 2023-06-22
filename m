Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C086E73A513
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 17:32:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553681.864384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMIc-0001kA-N5; Thu, 22 Jun 2023 15:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553681.864384; Thu, 22 Jun 2023 15:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMIc-0001iK-Je; Thu, 22 Jun 2023 15:32:42 +0000
Received: by outflank-mailman (input) for mailman id 553681;
 Thu, 22 Jun 2023 15:32:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQdr=CK=citrix.com=prvs=530e6dbed=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qCMIb-0001iC-2o
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 15:32:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 036c8ead-1112-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 17:32:38 +0200 (CEST)
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
X-Inumbo-ID: 036c8ead-1112-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687447958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1lTKcVu/gYpVx0+6nqaYJrrG/G7Xsm897hhlwGEvekQ=;
  b=XKqIbffQRSwwDQ3LX9ztP6fA8kSJjLjhWOCRX3T1H5a0ftj1Vy+PQagw
   XQH8pl2CmayniuO8l5inH4ckcnT3zQMOkEow9Y4itz/MF2UWvGURfGsel
   NXJ+O39C6IkEfh2MnzT3oUuQ1X3Yk5NeNiN85bDA4PTVeR3exV3SyucLl
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113786839
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:iuv7Iqw9tACFTZ9OvF16t+fzxirEfRIJ4+MujC+fZmUNrF6WrkVUn
 GtKDG/QOareMWbyfYogaoq2ox9XsZOAm4IyGwM6qyAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRgP6oT4DcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KX9r7
 PZAJSAfVA6CjsSG0vG3evFnmNt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwMxRnI+
 DKdrgwVBDkDLMCU8RqOwkiLi+qVgQr2ZtNCJYaRo6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0WdNWH/cr9QKlxa/d4gLfDW8BJhZDYtE7sM49RRQxy
 0SE2djuAFRHsqCRSH+b3qeZq3W1Iyd9BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdpsLxMSH9x
 XaNtidWulkIpZdVjePhpwmB2m/y4MGTFWbZ+zk7QEq7yxpzPIO1dba26FH93eQDILaBRUee6
 S1sd9el0AweMX2cvHXTELpWQuH3u6bt3C702gA2QcR4n9i50zv6JN0LvmkjTKt8GpxcEQIFd
 nM/ru+4CHV7GHKxJZF6bIuqYyjB5fixTI+1Phw4gzcnX3SQSONk1Hs0DaJo9zqx+HXAaIlmU
 XthTe6iDGwBFYNsxyesSuEW3NcDn35umjiMH8qrl0n8gNJygUJ5r59fazNiichjtsu5TPj9q
 Y4DZ6NmNT0BOAEBXsUn2dFKdg1bRZTKLZv3t9ZWZoa+zvlOQQkc5wvq6ep5IeRNxv0F/tokC
 1nhAie0PnKj3yyYQehLA1g/AI7SsWFX9CllYXdyYgb0ghDOo++Htc8iSnf+RpF/nMQL8BK+Z
 6BtlxmoahiXdgn6xg==
IronPort-HdrOrdr: A9a23:srkU0qNIso4HTcBcTsejsMiBIKoaSvp037Eqv3ofdfUzSL3+qy
 nOpoVj6faaslcssR0b9OxofZPwI080lqQFhbX5X43DYOCOggLBR+tfBMnZsljd8kXFh4hgPM
 xbHZSWZuedMbEDt7eY3DWF
X-Talos-CUID: 9a23:Ou4dWG76goH/ttDC2Nss6msNEJgoYm/n0nbZBX+qSmpZULaLVgrF
X-Talos-MUID: 9a23:3JLYBQY5lFTaaeBTrifwjwlCP/dSxKmrUlwknKtX6/i/HHkl
X-IronPort-AV: E=Sophos;i="6.01,149,1684814400"; 
   d="scan'208";a="113786839"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v2 1/5] build: define ARCH and SRCARCH later
Date: Thu, 22 Jun 2023 16:30:01 +0100
Message-ID: <20230622153005.31604-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230622153005.31604-1-anthony.perard@citrix.com>
References: <20230622153005.31604-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Defining ARCH and SRCARCH later in xen/Makefile allows to switch to
immediate evaluation variable type.

ARCH and SRCARCH depends on value defined in Config.mk and aren't used
TARGET_SUBARCH or TARGET_ARCH, and not before it's needed in a
sub-make or a rule.

This will help reduce the number of times the shell rune is been
run.

With GNU make 4.4, the number of execution of the command present in
these $(shell ) increased greatly. This is probably because as of make
4.4, exported variable are also added to the environment of $(shell )
construct.

Also, `make -d` shows a lot of these:
    Makefile:39: not recursively expanding SRCARCH to export to shell function
    Makefile:38: not recursively expanding ARCH to export to shell function

Reported-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Tested-by: Jason Andryuk <jandryuk@gmail.com>
---

Notes:
    v2:
    - change quoting style
    - change identation

 xen/Makefile | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index e89fc461fc..78d176f04e 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -35,12 +35,6 @@ MAKEFLAGS += -rR
 
 EFI_MOUNTPOINT ?= $(BOOT_DIR)/efi
 
-ARCH=$(XEN_TARGET_ARCH)
-SRCARCH=$(shell echo $(ARCH) | \
-          sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
-              -e s'/riscv.*/riscv/g')
-export ARCH SRCARCH
-
 # Allow someone to change their config file
 export KCONFIG_CONFIG ?= .config
 
@@ -241,6 +235,13 @@ include scripts/Kbuild.include
 include $(XEN_ROOT)/Config.mk
 
 # Set ARCH/SUBARCH appropriately.
+
+ARCH := $(XEN_TARGET_ARCH)
+SRCARCH := $(shell echo $(ARCH) | \
+    sed -e 's/x86.*/x86/' -e 's/arm\(32\|64\)/arm/g' \
+        -e 's/riscv.*/riscv/g')
+export ARCH SRCARCH
+
 export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
 export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
                             sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
-- 
Anthony PERARD


