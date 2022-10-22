Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53252608E45
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 17:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428413.678552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGmu-00046Z-8v; Sat, 22 Oct 2022 15:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428413.678552; Sat, 22 Oct 2022 15:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGmu-000446-4v; Sat, 22 Oct 2022 15:51:52 +0000
Received: by outflank-mailman (input) for mailman id 428413;
 Sat, 22 Oct 2022 15:51:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U686=2X=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1omGmr-000237-Vd
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 15:51:50 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fdc77bb-5221-11ed-8fd0-01056ac49cbb;
 Sat, 22 Oct 2022 17:51:48 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id r14so16373436edc.7
 for <xen-devel@lists.xenproject.org>; Sat, 22 Oct 2022 08:51:48 -0700 (PDT)
Received: from carlo-ubuntu.home (62-11-205-162.dialup.tiscali.it.
 [62.11.205.162]) by smtp.gmail.com with ESMTPSA id
 z61-20020a509e43000000b00461816beef9sm894623ede.14.2022.10.22.08.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:51:47 -0700 (PDT)
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
X-Inumbo-ID: 6fdc77bb-5221-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CIJ7divhUZIF+Qnvd1Yc7OiBLngKxwy0fDcbHW1K4I=;
        b=bekSxZNXaB5EPog/MFSBYw65rHFpFZbEwHZNfxoGEjS6gxoEIRWu19yT+PZNGELIJ4
         xpF7je+WIHIPIGcV2LP3zO3L7O7e6l8Z7qyfCLNqq74i7X8B0U1+DLGGhzojcqdSisBL
         2ZrlhXCoqovBjr0nnw8bSSnsxjlXnxZU+uNMC6EM8W9qvcWks8mrbX5C0PsjrPBZv9g3
         GnG/OnRWmCeRIwtmQmts6kudaiPb7HEHa6L2CoUfALvPe9+JGGDqv2UyHMfWsdvSaBwp
         f22JwHITKgKLtVvD+fbvABX604gHpTA5KE6bObc+gJ58esYS0gxIP+2gohyHmT3QSfwG
         GDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CIJ7divhUZIF+Qnvd1Yc7OiBLngKxwy0fDcbHW1K4I=;
        b=KlCpTpGT6aOj8/h268cz3dadUW+t7ue+7xlLYVZR5+LFlUTZp7z0eWhpR0MEIbusU6
         4JOPgflE7ttQCs207n3J821f3Nn9zUUXvBfpnijzqFyY1ilUmSEbrMyTqgRNmVvcC2y4
         z7ZkklimPsVG4fXkZj5WUiu69Wi3OtXXTpHCmbsJ6vTX0mAjcvZDUNKYHxuYtat7qMcl
         qb+GBNn9tjXErzmE9nYYvY9HbE/pBUEtP38Vnl3h1f85EVzZ3vNZXEdM2SYPeRMXE9Nh
         r1fGzNrH1wIVafhkjUfFrK1UWhLqfm5iLpAi5n4QTZ7zaDxqPG3ioGytIJJJwz40k7xw
         bZCw==
X-Gm-Message-State: ACrzQf1XgLwa+OeTzY6S6RoV085RyeGhvPl6SvRgEKfreYIoWDAYZP0c
	Icd0iyCgCuIASDlRdAO94IDfUBcInmxz8w==
X-Google-Smtp-Source: AMsMyM50hk0OxRgELBNWkoU6ZbKGwa3xx//p0nYsglz1A0zAss4XsD2nGCLTYRlYITflNQS7oGe5DQ==
X-Received: by 2002:a17:906:ef8c:b0:78d:46b7:6847 with SMTP id ze12-20020a170906ef8c00b0078d46b76847mr20078591ejb.241.1666453907785;
        Sat, 22 Oct 2022 08:51:47 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@unimore.it,
	andrea.bastoni@minervasys.tech,
	lucmiccio@gmail.com,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v3 7/9] Revert "xen/arm: Remove unused BOOT_RELOC_VIRT_START"
Date: Sat, 22 Oct 2022 17:51:18 +0200
Message-Id: <20221022155120.7000-8-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 0c18fb76323bfb13615b6f13c98767face2d8097.

Cache coloring support for Xen needs to relocate Xen code and data in a new
colored physical space. The BOOT_RELOC_VIRT_START will be used as the
virtual base address for a temporary mapping to this new space.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v3:
- new revert because the commit reverted was introduced after v2
---
 xen/arch/arm/include/asm/config.h | 4 +++-
 xen/arch/arm/mm.c                 | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 0fefed1b8a..ca6f775668 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -77,7 +77,8 @@
  *   2M -   4M   Xen text, data, bss
  *   4M -   6M   Fixmap: special-purpose 4K mapping slots
  *   6M -  10M   Early boot mapping of FDT
- *   10M - 12M   Livepatch vmap (if compiled in)
+ *   10M - 12M   Early relocation address (used when relocating Xen)
+ *               and later for livepatch vmap (if compiled in)
  *
  * ARM32 layout:
  *   0  -  12M   <COMMON>
@@ -113,6 +114,7 @@
 #define BOOT_FDT_VIRT_START    _AT(vaddr_t,0x00600000)
 #define BOOT_FDT_VIRT_SIZE     _AT(vaddr_t, MB(4))
 
+#define BOOT_RELOC_VIRT_START  _AT(vaddr_t,0x00a00000)
 #ifdef CONFIG_LIVEPATCH
 #define LIVEPATCH_VMAP_START   _AT(vaddr_t,0x00a00000)
 #define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 6ccffeaea5..a81b8f9286 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -154,6 +154,7 @@ static void __init __maybe_unused build_assertions(void)
     /* 2MB aligned regions */
     BUILD_BUG_ON(XEN_VIRT_START & ~SECOND_MASK);
     BUILD_BUG_ON(FIXMAP_ADDR(0) & ~SECOND_MASK);
+    BUILD_BUG_ON(BOOT_RELOC_VIRT_START & ~SECOND_MASK);
     /* 1GB aligned regions */
 #ifdef CONFIG_ARM_32
     BUILD_BUG_ON(XENHEAP_VIRT_START & ~FIRST_MASK);
-- 
2.34.1


