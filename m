Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6785F47EECA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 13:25:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251349.432633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0jd6-0001x4-Oo; Fri, 24 Dec 2021 12:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251349.432633; Fri, 24 Dec 2021 12:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0jd6-0001uw-Lu; Fri, 24 Dec 2021 12:25:00 +0000
Received: by outflank-mailman (input) for mailman id 251349;
 Fri, 24 Dec 2021 12:24:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4pHI=RJ=gmail.com=gengdongjiu1@srs-se1.protection.inumbo.net>)
 id 1n0jd5-0001uq-O8
 for xen-devel@lists.xenproject.org; Fri, 24 Dec 2021 12:24:59 +0000
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [2607:f8b0:4864:20::642])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81c583e6-64b4-11ec-9e60-abaf8a552007;
 Fri, 24 Dec 2021 13:24:58 +0100 (CET)
Received: by mail-pl1-x642.google.com with SMTP id n16so6573696plc.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Dec 2021 04:24:58 -0800 (PST)
Received: from localhost.localdomain ([47.89.83.13])
 by smtp.gmail.com with ESMTPSA id d21sm9532980pfv.45.2021.12.24.04.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 04:24:56 -0800 (PST)
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
X-Inumbo-ID: 81c583e6-64b4-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TN0/+3UDKz6bwilrMIlNZuNePKFZICf+qgZEEPafMWM=;
        b=kOQgMg2IyS/j4CZvJIAtntd/p+UMb3WooSvYDGy27G1rgF4ChdEPMaLjvgtnTRhEjF
         NtgpQvjAME3sNcw7fH1X1Y1gjtdy9IIsCLjSa75Pr3mDJ42J7p0n7tRF0H8obM3rtMho
         AIUeF8Na/+vmX0+CkFSFkxbcwNqm0V/zoTtG+jS8/wTLi7Qf2zCN/4hDqZf9glQmqA8o
         SJ4KQTPaHrfM+74M+m0i4ycqrRrVcrmN/oRh0nt+WChHZTFT87oyZlYcIYHrU5os3ViX
         1XUeuyN4BiMYxQgCQ0HHIeG7Z0KptdQR+ecPQD9fXuM3907cDAP7CwzU5S0x9kSWxORf
         xouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TN0/+3UDKz6bwilrMIlNZuNePKFZICf+qgZEEPafMWM=;
        b=kMQoEg4aLRdO4N3olXXdvOq6KFpPaaGKLC9M24DvVn3IbcTM6E6TAZxyUYNITJ9UWo
         E8j74RTCpHlpFIfRiDiWIY1sZkvQYqIdceNtYs6QAYwIpuuCw761lhC6X9FjVkHa1gq3
         27lDcEyo2kGddNVPoo9Bqg7RqccxSIhZS7szHNzqrzwqLXg1VuNlNmwzqhSYcwg2vshx
         OfsVLoVvCefwCAOqiRp3vsDF3/ev7FoaVkXaCUxGtAXZJONf/3KOeyPu34AlZKdvJl1t
         cbNsSqPSbEP95wlZ1GRUcPuRt7laVMfjkrDQ93UcAL5YTi7zKACFO3qYPuiwG49vcR4k
         NAiQ==
X-Gm-Message-State: AOAM531/hsuq5Vq992hvzbAgox6Fkgzdg0KpVxb5pF8icIieak9Rln4i
	BpmfAeXrxDyAM9QTsKFRRAk=
X-Google-Smtp-Source: ABdhPJzY/4Gmv1rLeXGyOEY1aD9/zkaXpC59+nRdF4AyIzbT6CvQnMN25Gfvhnzn/szRrCL2S9PIMg==
X-Received: by 2002:a17:90a:d195:: with SMTP id fu21mr7765690pjb.106.1640348697088;
        Fri, 24 Dec 2021 04:24:57 -0800 (PST)
From: Dongjiu Geng <gengdongjiu1@gmail.com>
To: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	bertrand.marquis@arm.com,
	xen-devel@lists.xenproject.org
Cc: gengdongjiu1@gmail.com
Subject: [PATCH v2] xen/arm: fix the build error for GIC on ARM64 QEMU Platform
Date: Fri, 24 Dec 2021 20:24:51 +0800
Message-Id: <20211224122451.1210382-1-gengdongjiu1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

when enable CONFIG_NEW_VGIC in ARM64 QEMU Platform, it will build failed.
so fix it and make it can select GICV2.

Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
---
$ make dist-xen XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j10
make -C xen install
make[1]: Entering directory '/home/workspace/gengdongjiu/old_machine/XEN/xen/xen'
make -f /home/workspace/gengdongjiu/old_machine/XEN/xen/xen/tools/kconfig/Makefile.kconfig ARCH=arm64 SRCARCH=arm HOSTCC="gcc" HOSTCXX="g++" syncconfig
make[2]: Entering directory '/home/workspace/gengdongjiu/old_machine/XEN/xen/xen'
gcc -Wp,-MD,tools/kconfig/.conf.o.d      -c -o tools/kconfig/conf.o tools/kconfig/conf.c
gcc -Wp,-MD,tools/kconfig/.confdata.o.d      -c -o tools/kconfig/confdata.o tools/kconfig/confdata.c
gcc -Wp,-MD,tools/kconfig/.expr.o.d      -c -o tools/kconfig/expr.o tools/kconfig/expr.c
flex -otools/kconfig/lexer.lex.c -L tools/kconfig/lexer.l
bison -o tools/kconfig/parser.tab.c --defines=tools/kconfig/parser.tab.h -t -l tools/kconfig/parser.y
gcc -Wp,-MD,tools/kconfig/.preprocess.o.d      -c -o tools/kconfig/preprocess.o tools/kconfig/preprocess.c
gcc -Wp,-MD,tools/kconfig/.symbol.o.d      -c -o tools/kconfig/symbol.o tools/kconfig/symbol.c
gcc -Wp,-MD,tools/kconfig/.lexer.lex.o.d     -I /home/workspace/gengdongjiu/old_machine/XEN/xen/xen/tools/kconfig -c -o tools/kconfig/lexer.lex.o tools/kconfig/lexer.lex.c
gcc -Wp,-MD,tools/kconfig/.parser.tab.o.d     -I /home/workspace/gengdongjiu/old_machine/XEN/xen/xen/tools/kconfig -c -o tools/kconfig/parser.tab.o tools/kconfig/parser.tab.c
gcc  -o tools/kconfig/conf tools/kconfig/conf.o tools/kconfig/confdata.o tools/kconfig/expr.o tools/kconfig/lexer.lex.o tools/kconfig/parser.tab.o tools/kconfig/preprocess.o tools/kconfig/symbol.o
tools/kconfig/conf  --syncconfig Kconfig

WARNING: unmet direct dependencies detected for GICV3
  Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
  Selected by [y]:
  - QEMU [=y] && <choice> && ARM_64 [=y]

WARNING: unmet direct dependencies detected for GICV3
  Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
  Selected by [y]:
  - QEMU [=y] && <choice> && ARM_64 [=y]

WARNING: unmet direct dependencies detected for GICV3
  Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
  Selected by [y]:
  - QEMU [=y] && <choice> && ARM_64 [=y]
make[2]: Leaving directory '/home/workspace/gengdongjiu/old_machine/XEN/xen/xen'
make -f Rules.mk _install
make[2]: Entering directory '/home/workspace/gengdongjiu/old_machine/XEN/xen/xen'
---
 xen/arch/arm/Kconfig           | 5 +++--
 xen/arch/arm/platforms/Kconfig | 1 -
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4..373c698018 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -35,7 +35,7 @@ config ACPI
 
 config GICV3
 	bool "GICv3 driver"
-	depends on ARM_64 && !NEW_VGIC
+	depends on ARM_64
 	default y
 	---help---
 
@@ -44,13 +44,14 @@ config GICV3
 
 config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
-        depends on GICV3 && !NEW_VGIC
+        depends on GICV3
 
 config HVM
         def_bool y
 
 config NEW_VGIC
 	bool "Use new VGIC implementation"
+	depends on !GICV3
 	---help---
 
 	This is an alternative implementation of the ARM GIC interrupt
diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
index c93a6b2756..6d3ee99456 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -15,7 +15,6 @@ config ALL_PLAT
 config QEMU
 	bool "QEMU aarch virt machine support"
 	depends on ARM_64
-	select GICV3
 	select HAS_PL011
 	---help---
 	Enable all the required drivers for QEMU aarch64 virt emulated
-- 
2.25.1


