Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB3F68D70B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 13:42:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491070.760033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPNIZ-00016P-CR; Tue, 07 Feb 2023 12:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491070.760033; Tue, 07 Feb 2023 12:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPNIZ-00013z-8j; Tue, 07 Feb 2023 12:42:11 +0000
Received: by outflank-mailman (input) for mailman id 491070;
 Tue, 07 Feb 2023 12:42:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPNIX-0000om-Ci
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 12:42:09 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d245e328-a6e4-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 13:42:03 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id ba1so9357274wrb.5
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 04:42:03 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.109.85.nat.umts.dynamic.t-mobile.pl. [46.204.109.85])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a056000114300b002c3f9404c45sm19632wrx.7.2023.02.07.04.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 04:42:01 -0800 (PST)
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
X-Inumbo-ID: d245e328-a6e4-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9BypUrC3yR5z7zzlODmq7D0VqGCfJ2/AlymTxYrt8pY=;
        b=R3Tvr+99ZU06QKypC3id2r5wsF06P+PsX6PKY3hRwv/drAQtzhmJbuc6RYIQWkWupZ
         sWq0Cq5HJKTWpAWW801TFELTCcXMl+SivU2KWGD+VbZKL5ftL8s/HW9peTzgGUCZyxXN
         4C+Dnw6tdpiGbSJLpkrKC7B0Lx0xFPhog9jM+MAZ66ZhCopDfFgMusF1xCbk+h0JOito
         R7PLbwtjRGOxJ7bYP5ox/p3W5Rs4+5Uh+0a1hN+GPR8uKvUiTIJ+AiRn62LFTiRRZkFm
         JpXOnpkgvp/m/93FEXwl9utF2hU9ArMyMygNi4RGOmkMBZDdTox4L3E0wn4xJry1xi4x
         8pKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BypUrC3yR5z7zzlODmq7D0VqGCfJ2/AlymTxYrt8pY=;
        b=tn6bAuanDccV6dSjRMrqq/aa1hI3NIfYF5VEk3L9B07Wsa7VfZKEhywClrlsi98WbL
         7J3w2dlxHOyITgjnVu74LyYVDtFNN1sXiSZrIiKRzNOQSuJWqudOxyqwBPbwr+hhNLg4
         qlyHSW6Lqviru0ueUm6uILZUzFXBLtls+V8cNkA+GgO6xIuzLCLxkvyBUXuJkl5fsAW6
         AR96D2Jir0jHc951sC4rxJj4yXn0c3ZrZUFKdYwt19YhgfZszx3pCNegPust+LiDU8Tp
         boPYqrZiznytsETJbA2j5MIsrfAVLY2fqdN6RWpndppH85VtNliMjMNQJ/SZjcA5joNq
         NVgA==
X-Gm-Message-State: AO0yUKVnq9/VsINJBvQV5m42NL+4y9mAL8E0Er2zegjj8ekwBWKU/UzV
	VGq2cSb0SdgrGLCZ/sestWTROhVCCC4=
X-Google-Smtp-Source: AK7set/u06FmZEfg0nblYrdSBPAbZVNB2dQAoq6pdwEDdPceH4WxNlLqqJ++GEcTI58D3OAlurynVQ==
X-Received: by 2002:a5d:58ec:0:b0:2ab:78e2:864e with SMTP id f12-20020a5d58ec000000b002ab78e2864emr2639532wrd.19.1675773722211;
        Tue, 07 Feb 2023 04:42:02 -0800 (PST)
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
	Connor Davis <connojdavis@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v9 0/2] Basic early_printk and smoke test implementation
Date: Tue,  7 Feb 2023 14:41:51 +0200
Message-Id: <cover.1675772422.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series introduces the following:
- the minimal set of headers and changes inside them.
- SBI (RISC-V Supervisor Binary Interface) things necessary for basic
  early_printk implementation.
- things needed to set up the stack.
- early_printk() function to print only strings.
- RISC-V smoke test which checks if  "Hello from C env" message is
  present in serial.tmp

The patch series is rebased on top of the patch "include/types: move
stddef.h-kind types to common header" [1]

[1] https://lore.kernel.org/xen-devel/5a0a9e2a-c116-21b5-8081-db75fe4178d7@suse.com/

---
Changes in V9:
 - Bring "cmodel=medany" check back to be sure that C function is safe to be called
   in early boot when MMU is off as 
---
Changes in V8:
 - Set "needs: archlinux-current-gcc-riscv64-debug" in test.yaml
   for RISCV job as CONFIG_EARLY_PRINTK is available only when
   CONFIG_DEBUG is available.
---
Changes in V7:
 - Fix dependecy for qemu-smoke-riscv64-gcc job
---
Changes in V6:
 - Rename container name in test.yaml for .qemu-riscv64.
---
Changes in V5:
  - Nothing changed
---
Changes in V4:
  - Nothing changed
---
Changes in V3:
  - Nothing changed
  - All mentioned comments by Stefano in Xen mailing list will be
    fixed as a separate patch out of this patch series.
---

Oleksii Kurochko (2):
  xen/riscv: introduce early_printk basic stuff
  automation: add RISC-V smoke test

 automation/gitlab-ci/test.yaml            | 20 ++++++++++++++
 automation/scripts/qemu-smoke-riscv64.sh  | 20 ++++++++++++++
 xen/arch/riscv/Kconfig.debug              |  5 ++++
 xen/arch/riscv/Makefile                   |  1 +
 xen/arch/riscv/early_printk.c             | 33 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/early_printk.h | 12 +++++++++
 xen/arch/riscv/setup.c                    |  4 +++
 7 files changed, 95 insertions(+)
 create mode 100755 automation/scripts/qemu-smoke-riscv64.sh
 create mode 100644 xen/arch/riscv/early_printk.c
 create mode 100644 xen/arch/riscv/include/asm/early_printk.h

-- 
2.39.0


