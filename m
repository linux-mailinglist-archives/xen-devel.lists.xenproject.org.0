Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B6745DB96
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:48:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231316.400380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6Z-00035D-Uo; Thu, 25 Nov 2021 13:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231316.400380; Thu, 25 Nov 2021 13:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6Z-0002oB-EG; Thu, 25 Nov 2021 13:48:03 +0000
Received: by outflank-mailman (input) for mailman id 231316;
 Thu, 25 Nov 2021 13:47:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0M-00076i-E7
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:38 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 685bd498-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:41:36 +0100 (CET)
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
X-Inumbo-ID: 685bd498-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dp4DeV5YFxptZKOsxSf8G7BcD3VPnKgmN4ccZ4WdFIE=;
  b=SrCxHYmj/Azw1jVXQJXNoCkKaEAKsponODLiAWj5MOL0hAtGtD6Yhxge
   yUsyvEvkhanIuN7XqWLa0tG9a+ZefTzBdPMj6WUdKDrdoDG+uuGR8lIdr
   MO0E6EkSANwu7g57R+/E06ilPpu7N65KHNN6J4k8tMLqI6l3S+X5nSVbz
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 65FyAc2QaZf80z0IP+7V+OqHfQxS3gpEUnILkrUaqgFeyDu9J2j6LpaUX3OmQr4hCQeBmSjeMf
 1v6IVZTyRhrE4I1iyj1hP6kaUv94twgCV3yTTw8FALMvkE7STZ5kbD+QR+vjfTW7qc+idusKxI
 qWoO4r1tGEK4wWz+/n4hOwje9HSz3FVkvprrL5HnyyzmdlLZaQOsc3GgZiPrY0kdqwGR9qM/v9
 su1QQTFfTO9JIZr4tu/KDio7K3dyxgvcj9cG30735QIt/jq/5OJF0ZUrPZvnhkv13SQfrLZG9S
 Qci5qQeWYWFyQIvKdA+BYcEC
X-SBRS: 5.1
X-MesageID: 58637853
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sxZrBqzXniqew4e9E2Z6t+dLwCrEfRIJ4+MujC+fZmUNrF6WrkVSz
 2pJWDiAM/uKNDOnc4hwao6zpkJSv8eByN9hGVY/qSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrRk2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt8pJ1
 fUOu63ociMoO4viyNU0f0RfHggraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY25AQRqmOO
 pFxhTxHaBDxPgJTPlAsJLVgpeKIt2TGbiNGtwfAzUYwyzeKl1EguFT3C/Lfd8aWX8xTkgCdr
 3jf4mXiKhgAMZqUzj/t2kyrgujDjCbqQrU4Hbez9uNpqFCLz2lVAxoTPXOxpvOzm0OlW9ZSL
 kUS0iUrpKk2skesS7HVVBq+pnmGshcCWsF4HOgz6QXLwa3Riy6QAmkfUjdAcpoorsYwTj0x/
 kCFlJXiAjkHmKKRYWKQ8PGTtzzaESofIHIGZCQEZRAY+NSlq4Y25jrfQ9AmHKOrg9ndHTDr3
 yvMvCU4n68Uj8MAy+O851+vqzOzpLDZQwgt/ALVU2m5qARja+aNfJe04FLW6fJBKoexTVSbu
 nUA3c+E44gmD4yJlSGLaPUAGveu/fntDdHHqQcxRd97rW3roiP9O9ALiN1jGKt3Gtw8ZB+qb
 n6LgidQ4bl9bEqDQfJwbqvkXqzG0pPcPdjiU/nVaP9HbZ5waBKL8UlSWKKA44z+uBNyyP9iY
 P93Ze7pVC9HUvo/kFJaUs9Eiedzrh3S018/UnwSI/6P9bOFLECYRr4eWLdlRrBotfjUyOk5H
 js2Cidr9/m9eLGhCsU02dRKRbzvEZTcLcqrw/G7jsbZfmJb9JgJUpc9O48JdY1/hLhynezV5
 Hy7UUIw4AOh3iKYdlTaOiE5NuKHsXNDQZUTZ3JEALpV8yJ7PdbHAFk3K/PbgoXLBMQ8lKUpH
 pHpiu2LA+hVSySvxtjuRcKVkWCWTzzy3VjmF3P8OFAXJsc8LySUqo6MVla+r0EmU3vo3fbSV
 pX9j2s3t7JYHF88ZCsXAdryp26MUY81xLgvAhCWe4YLIy0BMuFCckTMsxP+GOlUQT2r+9dQ/
 1/PafvBjeWS8YIz7vfTgqWI89WgH+dkRxIIFGjH97emcyLd+zP7k4NHVe+JexHbVX/1p/r+N
 bkEkamkPa1VhktOvqp9D61vkfA06ezwquII1Q9jBnjKMQimU+syPnmc0MBTnaRR3bsF6xCuU
 0eC94ACa7WEMc/oCnALIw8hYrjR3P0YgGCKv/80PF/79Gl8+7/eCRdeOByFiSp8KrppMdx6n
 bd96ZBOswHm00gkKNeLiCxQ5l+gFH1YXvV1rIweDa/qlhEvlgNIb6vDB3Kk+5qIcdhNbBUne
 2fGmKrYir1A7UPeaH5vR2PV1O9QiJlS6hBHyFgOewaAltbf36Jl2RRQ9XI8TxhPzwUB2OV2Y
 zA5O0pwLKSI3jFpmMkcADz8R1AfXEWUqh7r1l8EtGzFVE35BGXCIVo0NfuJ4E1EoXlXeSJW/
 e3AxWvoOdowkBodAsfmtZZZlsHe
IronPort-HdrOrdr: A9a23:g3Pg06outmdlW0nrZbPZbmIaV5oTeYIsimQD101hICG8cqSj+f
 xG+85rsyMc6QxhIE3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaTN5DNB7PoSjjPWLz9Z+qjkzJyV
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58637853"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [XEN PATCH v8 20/47] build: add headers path to CFLAGS once for all archs
Date: Thu, 25 Nov 2021 13:39:39 +0000
Message-ID: <20211125134006.1076646-21-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This just remove duplication.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/Makefile           | 3 +++
 xen/arch/arm/arch.mk   | 3 ---
 xen/arch/riscv/arch.mk | 2 --
 xen/arch/x86/arch.mk   | 2 --
 4 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 06d5e4fd61c1..efd7538099f3 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -312,6 +312,9 @@ CFLAGS += -flto
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
index 5152de343082..1ba488d645c0 100644
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


