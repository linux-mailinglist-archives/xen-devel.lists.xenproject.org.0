Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC599CB6F1A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 19:46:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184555.1507041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfu-0005Oo-36; Thu, 11 Dec 2025 18:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184555.1507041; Thu, 11 Dec 2025 18:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlft-0005GH-UN; Thu, 11 Dec 2025 18:46:01 +0000
Received: by outflank-mailman (input) for mailman id 1184555;
 Thu, 11 Dec 2025 18:45:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWGN=6R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vTlfr-0003I8-Of
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 18:45:59 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a24f9c8a-d6c1-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 19:45:59 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-640c6577120so745990a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 10:45:59 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-4.as6723.net. [185.5.253.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5d0b0dsm345870466b.67.2025.12.11.10.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 10:45:57 -0800 (PST)
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
X-Inumbo-ID: a24f9c8a-d6c1-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765478758; x=1766083558; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wn2YE/N1073l2aBvkRQ/5nSVLZsSRqqVHeilL+wTO7s=;
        b=U2K1rrkP8HrRAsKbYGydTyb4MHfxJJMX2vqC62fUA0rEjBSDoPe3hP/Lw2ysqUn+Pb
         vlP/MgWQTsYAivoBfIP+3Ly25bW4QKD0aCoA1hkzFcoWLBcDkFZUaPRrk6Ufajo04is8
         C2N0MyubzOkCVMIaTe1d/PDGIRm9CGJOu6/vlRRGKRIoJeBwZkh3sz6hLc4q89q825SO
         h3IOjKDisWq/jutw+glsa8IZ14MB89eEsHOWdeh+BY1K4EKMUP5he1NgUCe0VcCQ80fk
         apgqG7RtiMb4b8wtKMp8R9SjiG8oHr6lA3dC5LmhPi7xbuHRugRbWdJ17E9BMc5F9nLe
         RggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765478758; x=1766083558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wn2YE/N1073l2aBvkRQ/5nSVLZsSRqqVHeilL+wTO7s=;
        b=UxIW7P/YKIBLnJhn8cSehbj0mdQPpNy3B0O87EDoLMq5ngMYFloL65ZHcefuDP+Nri
         VFOBAqpjj6IdREzODk8FA4gxG9yVRlmbttv2AZB1ToH47tU97Z2cpiCBcokUP7q+jEWG
         qgm4oBAczrweZ0W7KkSOX2XJmXcZvcIeOaVcsw9QMDWJOAm6PYS3yDWkSYINsSYZuV2G
         dseqCcHbzwI8Bm64TuOxp1VHmm84j172X9CT+2KwWXSy8ZO2r8wJCuuyBttEmTNZVUfa
         OTeVo/Z6kwgpdHsUbvn9MnDdSj4clA+gi2+RMH3a61D8zIPauSlt4dZmf6z4gJUIw81x
         Juvw==
X-Gm-Message-State: AOJu0YxJ/86zoUuTO2PEe7N5iI8tqDwFSfJAuOrOJCsZjDuWZXK3GUVc
	yYFMIsCo4SW9k8HsG75E4nHZrMG6G7ANv9/ahRtS23fAjSXmSFPh4DymvQoS5BW0
X-Gm-Gg: AY/fxX5n77E9gqy2P20dmhlv55tB6jVKiOW3Qd6ewAkanOvgTy8frZbRaozvctTySaq
	zNHsEviaQyUvhngx+WhmGKm0ZZAVmjl40xyikW0KQsnOCMvxDSzwH+xploUKo8YgeyUgKKLwvxV
	R+Din+y/82CVd/75h50eYSjOP3dW8Hp3S3dN6jk1POO8DkjC7+QxCAOcAm+x9yUdLXskYu+952M
	9TwFlkgWIAkniooDbM1sUxKiQwHYfLQNzBGGPjmhFKEGReU7WUJCn7XWTKcPl9KtIIHCJjXf/He
	JTTYjPpvTpPGR2wV8brVRC6SMS4+ZbhjOYIK7oVvlref0b+guzIdEx5GaGNpFIMiCCjZnDLkKnR
	GM2svAZNONoEi80W8f7kycSO2uG2cDqfinKxprSgu1AhlL+Y5+8+dufx7ggr/JryoL+Pjvx2WrQ
	obrZjFQWQ+pyeJK9nY5DoGCEFnp4iXynvoXSC6zJ1l
X-Google-Smtp-Source: AGHT+IG/6t+gwx01s3fl4EBu4KpU0cbUis+6SFVAgfqdG0pLbcu3Q3IeGyxpzSPn7jghoibq6b4loQ==
X-Received: by 2002:a17:907:7f04:b0:b7a:2ba7:18be with SMTP id a640c23a62f3a-b7ce84cc764mr748318866b.62.1765478758172;
        Thu, 11 Dec 2025 10:45:58 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: [PATCH v7 09/12] xen/arm: Resume memory management on Xen resume
Date: Thu, 11 Dec 2025 20:43:33 +0200
Message-ID: <b6c823f9c6a678018ab8790c419b8462838115d5.1765472890.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765472890.git.mykola_kvach@epam.com>
References: <cover.1765472890.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

The MMU must be enabled during the resume path before restoring context,
as virtual addresses are used to access the saved context data.

This patch adds MMU setup during resume by reusing the existing
enable_secondary_cpu_mm function, which enables data cache and the MMU.
Before the MMU is enabled, the content of TTBR0_EL2 is changed to point
to init_ttbr (page tables used at runtime).

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v7:
- no functional changes, just moved commit
---
 xen/arch/arm/arm64/head.S | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 72c7b24498..596e960152 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -561,6 +561,30 @@ END(efi_xen_start)
 
 #endif /* CONFIG_ARM_EFI */
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+FUNC(hyp_resume)
+        /* Initialize the UART if earlyprintk has been enabled. */
+#ifdef CONFIG_EARLY_PRINTK
+        bl    init_uart
+#endif
+        PRINT_ID("- Xen resuming -\r\n")
+
+        bl    check_cpu_mode
+        bl    cpu_init
+
+        ldr   x0, =start
+        adr   x20, start             /* x20 := paddr (start) */
+        sub   x20, x20, x0           /* x20 := phys-offset */
+        ldr   lr, =mmu_resumed
+        b     enable_secondary_cpu_mm
+
+mmu_resumed:
+        b .
+END(hyp_resume)
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /*
  * Local variables:
  * mode: ASM
-- 
2.43.0


