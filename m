Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95164A7A180
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 13:01:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936461.1337697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IIv-0003Np-9C; Thu, 03 Apr 2025 11:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936461.1337697; Thu, 03 Apr 2025 11:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IIv-0003LN-5J; Thu, 03 Apr 2025 11:00:13 +0000
Received: by outflank-mailman (input) for mailman id 936461;
 Thu, 03 Apr 2025 11:00:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JbNy=WV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0IIu-0003LH-GR
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 11:00:12 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd660fdd-107a-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 13:00:06 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso4620315e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 04:00:06 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1692ba4sm18302915e9.16.2025.04.03.04.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 04:00:05 -0700 (PDT)
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
X-Inumbo-ID: cd660fdd-107a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743678006; x=1744282806; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=08NszHezCOETcMiXOyrzLaeHkX918KHLikx4QSFS/rU=;
        b=EogBNckk10AFC6jtUmOc+2t4ucpdPzSQfUGlQ/tmOajscxb233kpleHmb8iIySFx3e
         +4GMC971bjrtU1GNIhYNxXSXTrjqJcRU9Fk42eWFwwu9AdVzniOQYEQmzR45UfJMjKqx
         qAKgH4q7/YoFQIoKRErF124kwSaX/NunHLdew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743678006; x=1744282806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=08NszHezCOETcMiXOyrzLaeHkX918KHLikx4QSFS/rU=;
        b=UVLW1c8gh7Adk4KEQOMEyeaEm4K9NlclkO6Jlw8Ym1pCetDBNmvj4ybAP7xaOsowPY
         XA+bPVA3t1gH5vKzWDaLE4KK0zxV0/KGinXOca6Z8MiNe/6OcbROX/yZOcWam+BMxPBc
         HfPfzGO1ls4hykn1IhXklvfYs91iThmT54qlqFrZ7Ph4kgVwmV1qdu8DzQQg0H8LYRft
         JdCzhH16868g71EZmC0Q5oM2rzLTfQ7oiETDIOOL9eFyaPabZNtj3RTdHilocaTIFAzc
         36dQGXDV1FgNSwQsZO7wc9rDSz0zAQZrG3kC8zSbdbjTa4LhccreJ3eraIftuAOnrNev
         8Jog==
X-Gm-Message-State: AOJu0YwbOBn6Mt8ikDjqLeDcYIAU8asq/zGPMZmW0JBzrn5xVgWCVmKd
	ji9WN/XPAmLWSHA833lRIPPDAoKtVnt5Iyr2NsNGw0LOiRwgt6CvhNncykw19Gkp4/NhdpVhiKm
	NVFg=
X-Gm-Gg: ASbGncv2SU+Xh/OPIp8EZgs20JIem2R8xBp7QYkEejLa1lihmj0NvsPgEBehEzm7Cij
	je5GY0xfZNLHtDLtaT7v42KarAAV52hhUYs8V1l5fK5Xo/RbeCCA8R371KkWVCuq6a3b29MYl77
	e8UvL+ONtJ0U0L4rmgW5GJwyoUOWrgSWW82GhlFBN53mgRp7uyWb0oj538oyfBZon1pNoWB/b99
	y2HnKvu0E5m1wJTIPP97mmHLYvAdUytHd91lgPCDF6j56SMnmTWdF1Y3aEMOLEr/5MBXc9CLFVD
	UBSwVt78x6J0t4eLxIPXlgw4GlU9t+s3VmAOd6txgIUNAgoLEZPUiulPoFtDtBYiwBce1YYreZ7
	9FmAPvVbdWXIFjD+uq72kwx2+VZGf
X-Google-Smtp-Source: AGHT+IF48VQh9DG8vVnIIJIFW2/gfFQBVofNPlg6Nu2o+qvbGc42nX+p+3lzniXif1vJnYON1IhApw==
X-Received: by 2002:a05:600c:314f:b0:43d:53c:1ad6 with SMTP id 5b1f17b1804b1-43ec14d8015mr19152055e9.26.1743678005954;
        Thu, 03 Apr 2025 04:00:05 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] xen/link: Drop .fixup section from non-x86 architectures
Date: Thu,  3 Apr 2025 12:00:03 +0100
Message-Id: <20250403110003.1461522-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The fixup section is only used by x86, and we're working to remove it there
too.  Logic in the fixup section is unconnected to it's origin site, and
interferes with backtraces/etc.

Remove the section from the architectures which don't use it.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
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
---
 xen/arch/arm/xen.lds.S   | 1 -
 xen/arch/ppc/xen.lds.S   | 1 -
 xen/arch/riscv/xen.lds.S | 1 -
 3 files changed, 3 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 86a6e311cfc5..ae1903246f69 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -45,7 +45,6 @@ SECTIONS
        *(.text.*)
 #endif
 
-       *(.fixup)
        *(.gnu.warning)
        _etext = .;             /* End of text section */
   } :text = 0x9090
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 3f2a7676ec96..1366e2819eed 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -38,7 +38,6 @@ SECTIONS
         *(.text.*)
 #endif
 
-        *(.fixup)
         *(.gnu.warning)
         . = ALIGN(POINTER_ALIGN);
         _etext = .;             /* End of text section */
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index dffc6ae11913..818aa4366949 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -33,7 +33,6 @@ SECTIONS
         *(.text.ident)
         _ident_end = .;
 
-        *(.fixup)
         *(.gnu.warning)
         . = ALIGN(POINTER_ALIGN);
         _etext = .;             /* End of text section */

base-commit: ae5fd39be98c6219a302045aec7c25bdafa81781
-- 
2.39.5


