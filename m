Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39310B3F0DE
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 00:10:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105407.1456409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjU-0007Kg-SE; Mon, 01 Sep 2025 22:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105407.1456409; Mon, 01 Sep 2025 22:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjU-0007FB-Fc; Mon, 01 Sep 2025 22:10:36 +0000
Received: by outflank-mailman (input) for mailman id 1105407;
 Mon, 01 Sep 2025 22:10:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPXY=3M=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utCjS-00055o-NV
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 22:10:34 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a98470c-8780-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 00:10:33 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-55f7a34fb35so1270886e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 15:10:33 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608279307asm123038e87.75.2025.09.01.15.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 15:10:31 -0700 (PDT)
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
X-Inumbo-ID: 7a98470c-8780-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756764632; x=1757369432; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Seeyes3vY54fd1iXGBX0pVpgCs7BHM5X3gEx1tAo94Y=;
        b=BK6ECKdm0QAJkSxTS9j1iOvns+W8+lf78lpJaGTdVEsmKOhtKnQcqUfC9vpK/znma6
         f2e/+0xZtY+g3ixFop3ISP6P30XFNziscIDRemlk2sW2vIK8VBDUC4vOwNl6uknzHw1y
         /pJ3y6Q1MfDRqPDR5ZvB9vS6wXw1BfRpmDrz/HkrH5Qf2JdIlXGJrLxN1KooSjwqF2u5
         D1BqWJxKkUAVXhzyHsEta9d/WapEfkWYCDvRho01qr48nia3kKFqIFCtaQ5peWrCg75h
         wJTWs2UKCCS3z3sMoCVhNkKuA4OHWI/HQUc8gKm4Ey+G4TlNWXRM5fWbEARi48UpZ2nq
         n2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756764632; x=1757369432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Seeyes3vY54fd1iXGBX0pVpgCs7BHM5X3gEx1tAo94Y=;
        b=mkPNlY7UVqcraRGSq9VmjqswVpZNWZpRWMfNDGDoBactoGcXYPrLVSf7TIQv6+9rMX
         puhEe4M8QvsHH2abmvQ7lMWtdUCvO920DWXzW+bgmYo8YjtaV9YxQM7CwgOOdlS4gryy
         YuMs+U+9XRz/3Zqw8WoGMxsk6wYvoJpMSB7/ypKll5cWFrUtD0lbGkyTllNRMlSt3ERr
         afIh0NqXWfK1k7taR+YE4FzG08QyISd1qg9v1WTBYC0xBXBQZuyOSCCkEnfw79uzJ5mn
         wSusw6RkZKwGjyxRF69tQSGRGOH8gb2Ic7YgFR3KzDsSkq1Aos4mjylJq7aCOf0tUKV2
         Cw0Q==
X-Gm-Message-State: AOJu0YyKyLzdhP1zTt++TWi4CDyVrp2NmEnh91ggPQSSDCWx5El8rRor
	2mMbRDKSqLYZ3ePjo7/B+M0AuRTk5Aqs5bbgJOuWikqx9ZRS+mzifPI3gjHFUhqa
X-Gm-Gg: ASbGncuYWVxgRzsQQYEJsB1yljoJ2IIoNydfHSCCA+eQ8NBT5xR3taAZX1aUAwqPLjA
	NYAbBQMrpNDvE0Bg85vBaFGARIyOWAJAKps/o2Pa4DmrsC1BkL7H+0IuaYlzju5V9yNs/SPAn6e
	ARQT27PIWwoDAfezLR7tYlQSIdKDo4qLn9sxwOSiHvY36CwxthGh79vQ4tZbUZZNISUAKCykNKq
	CCeRnCSOrvwRFs0yhqgOVjlLuQXHKa+12GYNZfs9Hov56l2w6yR0v7ULGhuCAk3YlUF3BKP1/sw
	TWhR3iE0vlUy6zP/YQzvuggyHtSt5w/Tn4whPMHVt0PsSZsIsKfp1GZSCXvvJ4j42FjhjK2+Ei5
	mUzEfE5iA8okyvaxf49AxpzqAhj+w7+mH488CtYAQkYrippCr1hvQJmUzGVJ/n9TlvdO61P33
X-Google-Smtp-Source: AGHT+IH5uEVLs+KWjRNFUSLQfbCaJILBg0f9f4JMQd0Q0IH2Ub2fAbgyI59Wkme8wRbZraFL+Nofsw==
X-Received: by 2002:a05:6512:6512:b0:55f:391b:54df with SMTP id 2adb3069b0e04-55f70955022mr2152500e87.47.1756764632215;
        Mon, 01 Sep 2025 15:10:32 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v6 09/13] xen/arm: Resume memory management on Xen resume
Date: Tue,  2 Sep 2025 01:10:13 +0300
Message-ID: <a120a97c79f3ae174b3b6649c889efbb8afcd9ae.1756763487.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756763487.git.mykola_kvach@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
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
Changes in v6:
- moved changes related to set_init_ttbr to commit that implements
  system_suspend call

Changes in v4:
- Drop unnecessary DAIF masking; interrupts are already masked on resume
- Remove leftover TLB flush instructions; flushing is done in enable_mmu
- Avoid setting x19 in hyp_resume; not needed
- Replace prepare_secondary_mm with set_init_ttbr; call it from system_suspend

Changes in v3:
- Update commit message for clarity
- Replace create_page_tables, enable_mmu, and mmu_init_secondary_cpu
  with enable_secondary_cpu_mm
- Move prepare_secondary_mm to start_xen to avoid crash
- Add early UART init during resume

Changes in v2:
- Move hyp_resume to head.S to keep resume logic together
- Simplify hyp_resume using existing helpers: check_cpu_mode, cpu_init,
  create_page_tables, enable_mmu
---
 xen/arch/arm/arm64/head.S | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 3522c497c5..596e960152 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -564,6 +564,22 @@ END(efi_xen_start)
 #ifdef CONFIG_SYSTEM_SUSPEND
 
 FUNC(hyp_resume)
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
         b .
 END(hyp_resume)
 
-- 
2.48.1


