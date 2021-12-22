Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CC947CEDE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 10:10:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250693.431726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzxcz-0008Pg-92; Wed, 22 Dec 2021 09:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250693.431726; Wed, 22 Dec 2021 09:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzxcz-0008Ng-65; Wed, 22 Dec 2021 09:09:41 +0000
Received: by outflank-mailman (input) for mailman id 250693;
 Wed, 22 Dec 2021 08:38:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HSO0=RH=gmail.com=gengdongjiu1@srs-se1.protection.inumbo.net>)
 id 1mzx8r-00055O-Cs
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 08:38:33 +0000
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [2607:f8b0:4864:20::642])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ade7283-6302-11ec-bb0b-79c175774b5d;
 Wed, 22 Dec 2021 09:38:32 +0100 (CET)
Received: by mail-pl1-x642.google.com with SMTP id n16so1380257plc.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Dec 2021 00:38:32 -0800 (PST)
Received: from localhost.localdomain ([47.89.83.13])
 by smtp.gmail.com with ESMTPSA id 32sm1377284pgs.48.2021.12.22.00.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 00:38:30 -0800 (PST)
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
X-Inumbo-ID: 8ade7283-6302-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r+Y4oDBebTJunMFfsfrwKUoks23+cOhygHJOQ1hwjZw=;
        b=QkXn3cyvW79kGx18NXBMBe0pdQ5WGOLwcyUGDg+8gSefcsrMJGidd3ezM3EiGXEVxW
         r0CLk5n7nzm8QhSQqT5WuZjUw8UxwiG70QMQoU3u5/YDocG2QBNRgrVRAfGlduHz7n11
         +z2yS92SIqD2BMxlg3f8okziGZlZi/ZXRzoytMjxi3xWeZg1EwlAiIWIx1guR51PxOIX
         1ORX3yYDsP4E91FCJUzNJFasxlYG3K4NN4IdjGDucyGDbkoiHwdE630HWEpVWAAKKSRl
         IuaH+C/8hsH+GTHViCDBGCs+B6i/2/rB/E+nNIdxGBOxLNz6V0SUW4r9KfjmvOQlspHg
         i8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r+Y4oDBebTJunMFfsfrwKUoks23+cOhygHJOQ1hwjZw=;
        b=hCbjSqsxolcN8JUcoLygGD5Q+G3eCurr1WR1IuZNPVTOy67Iw+exM0fcH6e0gPUr+T
         sUvTW40ewN5yJGC/HmL8v8Cjb8NQ64IIQGofiVG+gorb12OcUW8fbdSbu61bDegpgwAt
         8Z2hGYgN9DHjW9gCL+88fS7GIDAy5sk3eLm7Wd4If1uThJI6pZZrnOPCqw9rWSwDUFd1
         xKG7ABtxvIPLD1qcR1184jyu5UjkzIsylnpP4GmtjeCXhJQQBtAWLEPj6CqrtloJnRlx
         Z4/efRPAGynzKkpxy0cLWh6ZulZz2kKwSUvVHsvCEge2dRbjmN462QhK/dHICVQZP54e
         gbMQ==
X-Gm-Message-State: AOAM530rURC98wxu9mLx8rZeHrpdumQ85EGk+FMfGaH6wGeLA0EYhRnF
	EFkSXFID/2fkYl1r9LzFe5M=
X-Google-Smtp-Source: ABdhPJzSPTCsEGF8LPYtPakp2++8JxLmw7tyryXUNkFEkC13jnjfGVcLlW+CFQ+0eb2eCO2n6d0PlA==
X-Received: by 2002:a17:902:8214:b0:142:61cf:7be with SMTP id x20-20020a170902821400b0014261cf07bemr1935778pln.0.1640162310765;
        Wed, 22 Dec 2021 00:38:30 -0800 (PST)
From: Dongjiu Geng <gengdongjiu1@gmail.com>
To: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	bertrand.marquis@arm.com,
	xen-devel@lists.xenproject.org
Cc: gengdongjiu1@gmail.com
Subject: [PATCH] xen/arm: fix the build error for GIC
Date: Wed, 22 Dec 2021 16:38:25 +0800
Message-Id: <20211222083825.2918045-1-gengdongjiu1@gmail.com>
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
 xen/arch/arm/platforms/Kconfig | 1 -
 1 file changed, 1 deletion(-)

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


