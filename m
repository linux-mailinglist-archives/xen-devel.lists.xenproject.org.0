Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB96369D184
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 17:41:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498235.769063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU9Dw-0006Yt-Mp; Mon, 20 Feb 2023 16:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498235.769063; Mon, 20 Feb 2023 16:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU9Dw-0006Vo-K3; Mon, 20 Feb 2023 16:41:08 +0000
Received: by outflank-mailman (input) for mailman id 498235;
 Mon, 20 Feb 2023 16:41:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NJGl=6Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pU9Dv-0006Vi-U0
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 16:41:07 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f4e76e2-b13d-11ed-933d-83870f6b2ba8;
 Mon, 20 Feb 2023 17:41:06 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id f16so1709196ljq.10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 08:41:06 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a2e6a08000000b002934d555783sm65798ljc.6.2023.02.20.08.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 08:41:05 -0800 (PST)
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
X-Inumbo-ID: 5f4e76e2-b13d-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IiEn/Rcm1MU1Cyz/bLiQ58eQG40sQBxNpXMLCDni3G4=;
        b=F9/K41sVEDsZPYf6mDjjHOcxm/puT6B1iAnP9m9qhoX2w17zGAIA/ueuSzAWDs9XbK
         T9GRlhCCo1r0CMzu74E632JDKkcqpDgX1R+LTplu6DGWUhm+51toYcOux7g6vdHiIozL
         +fLUIrBMlLTSwoxzA+WhAgcW1W31az00w7sLLkmqApCE4udLpYu86QRuhsEscn9YjR1v
         UFxPQq5V2JnZXgQOObYH86a+86FwON2u4DbWLnCptYvzISpZUP6RfT15+zoO/i9VP1ck
         BX85ygqaiDUIcTlyqsLCVv65g3AuvolFpISqzKl3L009DncaIeIE/G0GUp20bPXAD+fu
         XaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IiEn/Rcm1MU1Cyz/bLiQ58eQG40sQBxNpXMLCDni3G4=;
        b=G1VeZ6iYv/7lIhshDy3yC1F3ZflCjUgHruSWv9eszoTIJgdLPonBcEXOqLRwdN1cEz
         fWPu15ClF7mROVOOm+ZCaI5aZWN+5lO6eXDupzN1sPOkRKi0H6nazBQSMM0iIvRKgvEe
         b0sfwzxAHCLSDKX0aliBCpPTnrO+KlIKZY6EJLIMZCkjyncOz2dauTRCyg+7Zg2155Np
         7tflkdE/IPc57bTdyMUyDcoG0biiS5zm8jusYb41vXYqmCZyQPz03KdxHnoeE2qszaFO
         yJhiSrPr4cSygfgpZcY59/cAmmkiBo79auXMVGZsCcGGl4IyEXlQv25ibJXcDu6GujRQ
         3Szw==
X-Gm-Message-State: AO0yUKUjQUVur+8YD6RcZNxi7BJeyCuoDpVdqMOMExNDFEriUDoND5QV
	d+aeMM6s1UKdPQ5JXTvbeIuQO4n+94M=
X-Google-Smtp-Source: AK7set+HzUhRBLgzeYobI5sPALQGFvy3w4VEajoAXRLuwNu1zqLtvzT1A22pd9yPsZTcPu9/deSU4A==
X-Received: by 2002:a2e:a1c7:0:b0:293:6037:9850 with SMTP id c7-20020a2ea1c7000000b0029360379850mr722019ljm.51.1676911266074;
        Mon, 20 Feb 2023 08:41:06 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/4] introduce generic implementation of macros from bug.h
Date: Mon, 20 Feb 2023 18:40:56 +0200
Message-Id: <cover.1676909088.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A large part of the content of the bug.h is repeated among all
architectures (especially x86 and RISCV have the same implementation), so it
was created a new config CONFIG_GENERIC_BUG_FRAME which is used to
introduce generic implementation of do_bug_frame() and move x86's <asm/bug.h>
to <xen/common/...> with the following changes:
  * Add inclusion of arch-specific header <asm/bug.h>
  * Rename the guard and remove x86 specific changes
  * Wrap macros BUG_FRAME/run_in_exception_handler/WARN/BUG/assert_failed/etc
    into #ifndef "BUG_FRAME/run_in_exception_handler/WARN/BUG/assert_failed/etc"
    thereby each architecture can override the generic implementation of macros.
  * Add #if{n}def __ASSEMBLY__ ... #endif
  * Introduce BUG_FRAME_STRUCTURE define to be able to change the structure of bug
    frame
  * Introduce BUG_INSTR and MODIFIER to make _ASM_BUGFRAME_TEXT reusable between x86 and
    RISC-V.
  * Make macros related to bug frame structure more generic.

For ARM only common parts were removed from <asm/bug.h> and re-use generic
do_bug_frame() for ARM.

RISC-V will be switched to use <xen/bug.h> and in the future, it will use common
the version of do_bug_frame() when xen/common will work for RISC-V.

---
Changes in V2:
  * Update cover letter.
  * Switch to x86 implementation as generic as it is more compact ( at least from the point of view of bug frame structure).
  * Put [PATCH v1 4/4] xen: change <asm/bug.h> to <xen/bug.h> as second patch,
    update the patch to change all <asm/bug.h> to <xen/bug.h> among the whole project
    to not break compilation.
  * Rename CONFIG_GENERIC_DO_BUG_FRAME to CONFIG_GENERIC_BUG_FRAME.
  * Change the macro bug_loc(b) to avoid the need for a cast:
    #define bug_loc(b) ((unsigned long)(b) + (b)->loc_disp)
  * Rename BUG_FRAME_STUFF to BUG_FRAME_STRUCT
  * Make macros related to bug frame structure more generic.
  * Rename bug_file() in ARM implementation to bug_ptr() as generic do_bug_frame() uses
    bug_ptr().
  * Introduce BUG_INSTR and MODIFIER to make _ASM_BUGFRAME_TEXT reusable between x86 and
    RISC-V.
  * Rework do_invalid_op() in x86 ( re-use handle_bug_frame() and find_bug_frame() )
---
Oleksii Kurochko (4):
  xen: introduce CONFIG_GENERIC_BUG_FRAME
  xen: change <asm/bug.h> to <xen/bug.h>
  xen/arm: switch ARM to use generic implementation of bug.h
  xen/x86: switch x86 to use generic implemetation of bug.h

 xen/arch/arm/Kconfig                 |   1 +
 xen/arch/arm/include/asm/bug.h       |  32 +-----
 xen/arch/arm/include/asm/div64.h     |   2 +-
 xen/arch/arm/include/asm/traps.h     |   2 -
 xen/arch/arm/traps.c                 |  79 -------------
 xen/arch/arm/vgic/vgic-v2.c          |   2 +-
 xen/arch/arm/vgic/vgic.c             |   2 +-
 xen/arch/x86/Kconfig                 |   1 +
 xen/arch/x86/acpi/cpufreq/cpufreq.c  |   2 +-
 xen/arch/x86/include/asm/asm_defns.h |   2 +-
 xen/arch/x86/include/asm/bug.h       |  88 +--------------
 xen/arch/x86/traps.c                 |  81 +++-----------
 xen/common/Kconfig                   |   3 +
 xen/common/Makefile                  |   1 +
 xen/common/bug.c                     | 113 +++++++++++++++++++
 xen/drivers/cpufreq/cpufreq.c        |   2 +-
 xen/include/xen/bug.h                | 161 +++++++++++++++++++++++++++
 xen/include/xen/lib.h                |   2 +-
 18 files changed, 306 insertions(+), 270 deletions(-)
 create mode 100644 xen/common/bug.c
 create mode 100644 xen/include/xen/bug.h

-- 
2.39.0


