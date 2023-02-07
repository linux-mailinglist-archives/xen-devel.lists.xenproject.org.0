Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFC768DC08
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 15:47:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491187.760194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFM-0004WQ-D8; Tue, 07 Feb 2023 14:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491187.760194; Tue, 07 Feb 2023 14:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFM-0004OG-98; Tue, 07 Feb 2023 14:47:00 +0000
Received: by outflank-mailman (input) for mailman id 491187;
 Tue, 07 Feb 2023 14:46:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPPFL-0004Hz-At
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 14:46:59 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4469773f-a6f6-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 15:46:56 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id i5so6624533wrc.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 06:46:56 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.109.85.nat.umts.dynamic.t-mobile.pl. [46.204.109.85])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b002c3e94cb757sm5269743wrw.117.2023.02.07.06.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:46:54 -0800 (PST)
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
X-Inumbo-ID: 4469773f-a6f6-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeKlKQYE7Ni0q7sa33oNWy1hbogFwzoa9jmFgKxuPpg=;
        b=YpY2gkWaM3zV8ZLTipnSRbsaciGgxykBKswjqXD9rs2M08Yb1xKF6N1rIUKI+Sntjh
         6aVlI3f+2gm0ojcPul6HrkhnAT7tWT27pOvcCVYNaDSss2iCzKZB5DGP/051Y2HEfJtj
         DJqT6LGFHO0thy6tJ8+stYjgNiyIYiYiIFA7AGR7XjLboitoQ7P2EVPMzVJBKNfburEU
         2jszF0t51cHIwGp2+hPLJPElczd8ErI+Ku/ZqwLVQmqJAAcE1abNtruM87VMjSOQ80M7
         eXF2ItubuoPHMjeSYT/1eLGFBoqRX1HQUe9cv8f1aOXPnUehZDYvH0S3GAyQTuwp5zh+
         J8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeKlKQYE7Ni0q7sa33oNWy1hbogFwzoa9jmFgKxuPpg=;
        b=tGnd0o1x0B86yZXaX15ycYFaUQYp2B4lN1XeDWoCOqgZHvCkbVTCFUhrorHnVDCvTb
         jrYXkXXcfnptRfuQ0iXpr/n32J9aIQBGFpx6tgIOFRWIqlHfcFyfUNyl7FkVT7e+dmki
         e4D9FK2Z2nE92F6GRFnyVGqK18Rl4sRcXJWdjr86TeSJQciYk+7Fim3JfTTKyk+qsxiQ
         3WJN5TKIkS0AlcodGq13W6LmH+rzD7aG9zVJLjVMSUBuNruCoXZyn8aEgKghlW0RLXx5
         byZPproVVI27alvyGp+vCGPSJju2+JaFB1MXtg76JsHU96tPt0AMGV9UXE9qWn6DeA/+
         7W3g==
X-Gm-Message-State: AO0yUKX+i+ePB3eGe044AXsocn+FBSIxLrj801G1DijZk4ifUqul71Ml
	ChjbxXaiSHzbdoVXvW7LasSZQjqyFZA=
X-Google-Smtp-Source: AK7set9Gs824FluQ0oqE09fWcuFr5+gOFbrFPP88qJeejCuF+aPWckC5o5p1oW14I1IaA5jbIhq5Sw==
X-Received: by 2002:a5d:488b:0:b0:2bf:e533:315a with SMTP id g11-20020a5d488b000000b002bfe533315amr2837644wrq.62.1675781215205;
        Tue, 07 Feb 2023 06:46:55 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 01/14] xen/riscv: change ISA to r64G
Date: Tue,  7 Feb 2023 16:46:36 +0200
Message-Id: <e06d34508e1a1abef8e6bf93868652b78ae0c8a2.1675779308.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675779308.git.oleksii.kurochko@gmail.com>
References: <cover.1675779308.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Work with some registers requires csr command which is part of
Zicsr.

Also ISA was changed from r64ima to r64g where G is represented the
“IMAFDZicsr Zifencei” base and extensions so basically it is the same
as it was before plus additional extensions we will need in the
nearest future.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V3:
  - Change the name of config RISCV_ISA_RV64IMA to RISCV_ISA_RV64G as
    instructions from Zicsr and Zifencei extensions aren't part of I
	extension any more.
---
Changes in V2:
  - Nothing changed
---
 xen/arch/riscv/Kconfig | 14 +++++++++-----
 xen/arch/riscv/arch.mk |  2 +-
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 468e250c86..f382b36f6c 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -19,15 +19,19 @@ menu "ISA Selection"
 
 choice
 	prompt "Base ISA"
-	default RISCV_ISA_RV64IMA if RISCV_64
+	default RISCV_ISA_RV64G if RISCV_64
 	help
 	  This selects the base ISA extensions that Xen will target.
 
-config RISCV_ISA_RV64IMA
-	bool "RV64IMA"
+config RISCV_ISA_RV64G
+	bool "RV64G"
 	help
-	  Use the RV64I base ISA, plus the "M" and "A" extensions
-	  for integer multiply/divide and atomic instructions, respectively.
+	  Use the RV64I base ISA, plus
+	  "M" for multiply/divide,
+	  "A" for atomic instructions,
+	  “F”/"D" for  {single/double}-precision floating-point instructions,
+	  "Zicsr" for control and status register access,
+	  "Zifencei" for instruction-fetch fence.
 
 endchoice
 
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 012dc677c3..45fe858ee0 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -3,7 +3,7 @@
 
 CFLAGS-$(CONFIG_RISCV_64) += -mabi=lp64
 
-riscv-march-$(CONFIG_RISCV_ISA_RV64IMA) := rv64ima
+riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
 riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
 
 # Note that -mcmodel=medany is used so that Xen can be mapped
-- 
2.39.0


