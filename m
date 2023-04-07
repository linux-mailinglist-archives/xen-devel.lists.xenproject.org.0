Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9356DAFE2
	for <lists+xen-devel@lfdr.de>; Fri,  7 Apr 2023 17:49:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519066.806228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkoKV-0001xt-Uh; Fri, 07 Apr 2023 15:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519066.806228; Fri, 07 Apr 2023 15:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkoKV-0001tG-P3; Fri, 07 Apr 2023 15:48:47 +0000
Received: by outflank-mailman (input) for mailman id 519066;
 Fri, 07 Apr 2023 15:48:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aVqb=76=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pkoKU-0001rF-LK
 for xen-devel@lists.xenproject.org; Fri, 07 Apr 2023 15:48:46 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad953bc0-d55b-11ed-85db-49a42c6b2330;
 Fri, 07 Apr 2023 17:48:45 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id s20so23593292ljp.7
 for <xen-devel@lists.xenproject.org>; Fri, 07 Apr 2023 08:48:45 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 v12-20020a2e9f4c000000b00295a583a20bsm874765ljk.74.2023.04.07.08.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 08:48:44 -0700 (PDT)
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
X-Inumbo-ID: ad953bc0-d55b-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680882524; x=1683474524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bvofdso7h4C0wbCuGQpq+8NVtokRUIZ6ky3V3PNneG0=;
        b=UDjqnxv9yR2iTme8IfxrqJoKtTT30hQa3MiTyTzUHwl68nl1Pg/RDJfQve/u477hyf
         lkcy8haZp0tzhaVuLFKsyA1honQArutrJbWZz954UQQqOpeE7WQ/eO8dJoHJh2OP78oA
         p43yE+1vK+VNYdcRlgMOimU+ZWNBeUqBTXgbrjzcAVRBZUu1CCU/5thirqS7DOILUpow
         ABKPjWDmFHYBhcH8HCYvQBZwvv1Vxyk1hd0sehTQBcsv2Dckr2aQqwkVZBoRCri/f9ma
         3kyCh2nskDtgpRY+A+KbKJLHMr7MWfb9GSvh67L1+MgwBfQWZMWfL7By8YkqeKPctRGc
         pdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680882524; x=1683474524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bvofdso7h4C0wbCuGQpq+8NVtokRUIZ6ky3V3PNneG0=;
        b=vDRAlXCCUkc4Te2ROzUpdVqAMmxUbtj2FvPGyDoXytQMoFHn2IXHjgb6eTGr/4tNZw
         n28C77aQf85vyYZEJy6+t/ZRpMDlvwHY0dVstkXlwI4UDe1N04mPaYEQDrltc2/gILvq
         mfVU/LS5jypSWnYsOoeJJKfirECK4aS17UQw+/LzRGvs8X6wX6gftsUbXG0djpU6bIGm
         T+apnjLgCmRC+Gkt6Pd5LJbC2aVoVofuTYcuYWPrpW3r5b6TjBLkZuujblKTpFsiVwSV
         Ec8pYSy48pDUQM2MMTM76/HdW13hWWWBhy+ocRrwAiCHV3UCPtLUJPbZg04GLQQJRIhk
         0o7Q==
X-Gm-Message-State: AAQBX9cmEqj/nKBrvoqLHy8RtBWYN81iq9jdSo+u3D2MM8R/uzuJ10d/
	F3+/bkSF+RH3i2q7Jo0zi4gOHBBP6UE=
X-Google-Smtp-Source: AKy350bLe1FW59P/4vvlykz2DGsyUiixloBEybTWDJDX7QqQWSCeG7bP8ED/tSCAql+uRecHRGgN5w==
X-Received: by 2002:a2e:9214:0:b0:29c:9223:2f5e with SMTP id k20-20020a2e9214000000b0029c92232f5emr750160ljg.48.1680882524338;
        Fri, 07 Apr 2023 08:48:44 -0700 (PDT)
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
Subject: [PATCH v4 2/3] xen/riscv: setup initial pagetables
Date: Fri,  7 Apr 2023 18:48:38 +0300
Message-Id: <2cbb70c8b29713f1faf235b4a90722d78bf258eb.1680882176.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680882176.git.oleksii.kurochko@gmail.com>
References: <cover.1680882176.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch does two thing:
1. Setup initial pagetables.
2. Enable MMU which end up with code in
   cont_after_mmu_is_enabled()

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - Nothing changed. Only rebase
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


