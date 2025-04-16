Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF70A8B822
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 14:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955902.1349469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51U5-0008Bk-TQ; Wed, 16 Apr 2025 12:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955902.1349469; Wed, 16 Apr 2025 12:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51U5-00088J-Pt; Wed, 16 Apr 2025 12:03:17 +0000
Received: by outflank-mailman (input) for mailman id 955902;
 Wed, 16 Apr 2025 12:03:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TmO=XC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u51QD-0006At-Pz
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 11:59:17 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39220158-1aba-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 13:59:17 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39c1efc457bso4465626f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 04:59:17 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b5a9846sm18761905e9.35.2025.04.16.04.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 04:59:16 -0700 (PDT)
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
X-Inumbo-ID: 39220158-1aba-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744804757; x=1745409557; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtrQ08vcHfYRasMYCjK/xM3GJiF3ZHsvoc0qya/h/70=;
        b=VsVXyqb3Ps2KtJsWO5M86WiQXiTXkuoRs1fnfIH3fuf87KobcLFvr6T5Xw4wqZmvp8
         1O2oAAXfOOGtZa4HbsI40O4RHDdVQCI709oa3ovimO43v+IHd470XHnV+pRvmiIv/FNY
         KGmBDblbNYXCzwUyh9rzxPn66eN47WBFia3GM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744804757; x=1745409557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtrQ08vcHfYRasMYCjK/xM3GJiF3ZHsvoc0qya/h/70=;
        b=eSU2qwBpCPiS1yyk/ym82sZ71HRdPIrvRk6qcGUqu6nQj57E1IXzTJXe0Hc/er+DMJ
         GLJ1DWawuROKUZqqn8wUy5MVrl/xHyresjYAzRBVJhD2yREq/7Qt6iHFHD7CnVsMYSLi
         20PZ7vi2kxf35Zg7L5Wjbgu1M19Grd1OrL+uc9AaxWCSh3xsd4jRPuRC5trPFKlUWYL8
         RXNjQa3T9BN2+1brF3Z0RzQd1Od+aQkL9uM4KUHgamvHEfYZemDpfQTxz5Jf+SVK5731
         59ctH2WYkgkIS3PtL9srkRYKElXsu6xbFAQX3TLmVEjSwkEZFPgPJJlViVLYLloesfo7
         jazg==
X-Gm-Message-State: AOJu0YzWmulo4lW7gOJcfmU/AeROlJyYsp7CW+n1lnPQ0EtgNHRiqjmK
	svUpevDEyFGEdiV0bxFvu/TlexQRDGRzzAXZsbdor8d6VMJPr+RjJfphuIlAyD1yQczBj09gacI
	PRQ4=
X-Gm-Gg: ASbGncsYCF5XL6u9EE5PCtflQgk2tVsGnwxBINYyVYB7r46XVhYx4ETktpVMS1XW1Sg
	LgT3c5JVYLRwN8B+rnexDLSWwK1YObi9GpFva2NRAzGIXPwkBRhwHo0mEXOxXrcJHCNNG5e2m8U
	eTfewfkxHTRU70jrRLv0yHGeviNPtE2NaShrB9bSYbX8h+dp9HCQfXnbQNpkCedpi3gwwR6iRVj
	0q5cLdHFCbmKUaEcSD05sLcvSrH9nMibs9q0WeHuKgSQw7hOjvxriNAkeAbR+2vDlQYfxk3s3za
	LT/HXU/cnzjIdtnHzT/ZrGBV22N8NLrPeKcxwrAjpYPeLwBmor5X2XHI8FB0+VXrRJCuTSx4CzR
	4fDQigbbZBu0Cwg==
X-Google-Smtp-Source: AGHT+IGAljI6COUgiVd+L0rn0qcHYo5Qkthxd3Ys4ZnL52R1Jl/DYNHycJiAt96f/f3f4Ff1pETQZg==
X-Received: by 2002:a5d:6daf:0:b0:39c:13fa:80b with SMTP id ffacd0b85a97d-39ee5b130acmr1390455f8f.12.1744804756651;
        Wed, 16 Apr 2025 04:59:16 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Lin Liu <lin.liu@citrix.com>
Subject: [PATCH v6 14/15] riscv: Remove asm/byteorder.h
Date: Wed, 16 Apr 2025 12:58:59 +0100
Message-Id: <20250416115900.2491661-15-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the common code moved fully onto xen/byteorder.h, clean up the dregs.

The use of byteorder.h in io.h appears to have been copy&paste from ARM.  It's
not needed, but macros and types are.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Lin Liu <lin.liu@citrix.com>

v5:
 * New
---
 xen/arch/riscv/include/asm/byteorder.h | 14 --------------
 xen/arch/riscv/include/asm/io.h        |  3 ++-
 2 files changed, 2 insertions(+), 15 deletions(-)
 delete mode 100644 xen/arch/riscv/include/asm/byteorder.h

diff --git a/xen/arch/riscv/include/asm/byteorder.h b/xen/arch/riscv/include/asm/byteorder.h
deleted file mode 100644
index a32bca02df38..000000000000
--- a/xen/arch/riscv/include/asm/byteorder.h
+++ /dev/null
@@ -1,14 +0,0 @@
-#ifndef ASM__RISCV__BYTEORDER_H
-#define ASM__RISCV__BYTEORDER_H
-
-#include <xen/byteorder.h>
-
-#endif /* ASM__RISCV__BYTEORDER_H */
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/riscv/include/asm/io.h b/xen/arch/riscv/include/asm/io.h
index 55f329dde321..8bab4ffa0390 100644
--- a/xen/arch/riscv/include/asm/io.h
+++ b/xen/arch/riscv/include/asm/io.h
@@ -38,7 +38,8 @@
 #ifndef ASM__RISCV__IO_H
 #define ASM__RISCV__IO_H
 
-#include <asm/byteorder.h>
+#include <xen/macros.h>
+#include <xen/types.h>
 
 /*
  * The RISC-V ISA doesn't yet specify how to query or modify PMAs, so we can't
-- 
2.39.5


