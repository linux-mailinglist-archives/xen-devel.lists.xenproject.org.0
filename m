Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E2B6CABB6
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 19:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515391.798216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgqT5-00051O-Gc; Mon, 27 Mar 2023 17:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515391.798216; Mon, 27 Mar 2023 17:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgqT5-0004yz-C1; Mon, 27 Mar 2023 17:17:15 +0000
Received: by outflank-mailman (input) for mailman id 515391;
 Mon, 27 Mar 2023 17:17:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16zh=7T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pgqT3-0004VI-Tg
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 17:17:14 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22431cc7-ccc3-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 19:16:39 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id s20so9825911ljp.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Mar 2023 10:17:10 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a4-20020a2e9804000000b002a03f9ffecesm2463322ljj.89.2023.03.27.10.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 10:17:09 -0700 (PDT)
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
X-Inumbo-ID: 22431cc7-ccc3-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679937429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqsmroTuXUg+LgDnuSVJ1/S+aZdNxi6zAwGnWTYpKyM=;
        b=XEia3EuGQ0AchgPYH+GkGRmCkE1J0jYSyen/zqRSGbbVTMfLc6aPHVaVn2G/hjtLLF
         5I+hXSzKm+wB33gaVFm/32kXd8+g9bjGl/DE30fqdoi/Opou9f6k6d4D/R54v9eusQqB
         zUo+2NUUAm8YZo2O2suExGan1BaKG4T6sVKWXWFwU61ux/SvstcVAFR0Rqbpo6nEzohK
         N4a45vYpaz7/bLyMRCmlGcShRVKDlODPRgJKPcBv/6ScSM8gnP25u/uL8gMAeN1awT9x
         X6qoKFvX/3TzgqLbmfvvvHb1p/LLjvtCs92yk+OpxuKCnPB6lAoJl+wocNme4tVTU7Tm
         gX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679937429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqsmroTuXUg+LgDnuSVJ1/S+aZdNxi6zAwGnWTYpKyM=;
        b=CZfzVLIYSXKO+mCW9z64Aub31IiceuDgtcEaYPKoF7YzKAzqErcAIGM64/Qg/xhX6+
         /OIgJBaVxX7at85G/jNjA8O4p/4fKIw4POgtyX9vM/tuDZLGtbHLc12z3I5G+QS27fbq
         4nXYg8WRG4YEVF9V9zBowAjJwStLlzgg+ShO2vWR19JFvHaxPyF/Q6fSmG7ZW77WOiE2
         kdS6O8hagXOc5v5CnWv1FzO3i7j8UOxIElOCRQVg93Jppx7hA3Oipy1ZNXJ3NIaLZGFB
         z4Q8r5E0cwLszS5FrGJ5rgSmbc6kDIBv/s57edQY9GN97FXQ97r9TmPQx9mnkeZAH6s6
         RzSQ==
X-Gm-Message-State: AAQBX9cBnHX5reA7DW0fFgHN99WsU0C5R84CxjL2dBoZMuTDLjSTP1HL
	sifgF8DxoTkpvQRcfgUtI75+zz3JXJ19ig==
X-Google-Smtp-Source: AKy350abs7PbOM7g5y4Uu3KOLm+im98z8jetRJJvq/oXnyscuj3xWb2hohyM4dd4GIIfsgaT7BdFAA==
X-Received: by 2002:a2e:985a:0:b0:298:9fb5:9f20 with SMTP id e26-20020a2e985a000000b002989fb59f20mr4315654ljj.26.1679937429424;
        Mon, 27 Mar 2023 10:17:09 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 2/3] xen/riscv: setup initial pagetables
Date: Mon, 27 Mar 2023 20:17:04 +0300
Message-Id: <9bdc3c2e8c11209761f068eb5562c2bde017e248.1679934166.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1679934166.git.oleksii.kurochko@gmail.com>
References: <cover.1679934166.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch does two thing:
1. Setup initial pagetables.
2. Enable MMU which end up with code in
   cont_after_mmu_is_enabled()

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - update the commit message that MMU is also enabled here
 - remove early_printk("All set up\n") as it was moved to
   cont_after_mmu_is_enabled() function after MMU is enabled.
---
Changes in V2:
 * Update the commit message
---
 xen/arch/riscv/setup.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 315804aa87..cf5dc5824e 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -21,7 +21,10 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 {
     early_printk("Hello from C env\n");
 
-    early_printk("All set up\n");
+    setup_initial_pagetables();
+
+    enable_mmu();
+
     for ( ;; )
         asm volatile ("wfi");
 
-- 
2.39.2


