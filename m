Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8116A1B68
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 12:31:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500921.772470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWIG-0004an-Nx; Fri, 24 Feb 2023 11:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500921.772470; Fri, 24 Feb 2023 11:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWIG-0004Yw-LG; Fri, 24 Feb 2023 11:31:16 +0000
Received: by outflank-mailman (input) for mailman id 500921;
 Fri, 24 Feb 2023 11:31:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVWIE-0004Yi-Sx
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 11:31:14 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdf422ee-b436-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 12:31:12 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id z5so13859786ljc.8
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 03:31:12 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 v19-20020a2ea613000000b00295a815e555sm92682ljp.134.2023.02.24.03.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 03:31:11 -0800 (PST)
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
X-Inumbo-ID: bdf422ee-b436-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QplnGM5/2JJSuu65J297m5fTZ0hr6VBvMaS6u6b5al8=;
        b=R09VBqlWdgu5NmfjE+AsXmpsTVJFQMBjJf0qv4nbKyrt2JeB7trdVGVrCwgl0UdJaG
         BDRveJ73bpu863lRmFe1S+n+/tZ5BrgBGzZIY3qGRJ5kuFHqyPA7/G+L5Hpw4bRfsslw
         R3u9QPJOVU0XgEYIsCs2zJMWt2mF9esAnciXVMe5PyRuK/iuX+x4BgWQsCHwYbrXwyE3
         ty0hL2NAxsaXeYtILXU0l4Fl6sYT2IA+tfr9Zu03oMevvfxCagkKk6eYgoeDMiYxpcQN
         AvuITXNWm54gsrUdO9EQyvOFRKZSOZRD+0nphxWqIPSry33JMbe48L5/9LvLzh23fBvs
         IGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QplnGM5/2JJSuu65J297m5fTZ0hr6VBvMaS6u6b5al8=;
        b=Uw7gPb9p1VHg+qn4DQiQBMsSk68NbdsE56Hj1BnfdddZbriOcScItuZIaZZ24GmFQ/
         DoPGm77zF56uDBm0Y4ZYawmdbykdAPE+q+8hwWn8KRMG1ySNFriRuVF3eqh/cbOEnZ0c
         BtEJdpSxVMMk3nO5GMsg2vDgPryCtCv8LjHdKpPP1rtIZ6pJkZEGBLvyYQVUKZyvacpd
         LCUsyqd7UWg8pV6nHWmwHj3ws2uJC3LHkkLrU1k8ZoCq4e7vDjy+alb9QhUTPMrii8Zg
         wnXP5no4Pn/NybDXcGg2DYdkhStld3HSoNn1KntLhH9LYin4cxkDIZci+cs6hg55OmGY
         LCuQ==
X-Gm-Message-State: AO0yUKXgu7UxCrFNyN6L4AyLnQ62CCc6oJzEgmOOGI9MoNtFg8MHohWx
	ul3oYphXw3Pt1owpvHqjPNAqsUinoX0=
X-Google-Smtp-Source: AK7set8jUvkC0ZZ2lbSC7fNzE0jcUQD0QxrOCoBA/PRfDHi1oKBX8hXV+ij73Q0gJvC5M5E5ZjlZMg==
X-Received: by 2002:a05:651c:2123:b0:295:a1bc:33ca with SMTP id a35-20020a05651c212300b00295a1bc33camr2372187ljq.6.1677238271975;
        Fri, 24 Feb 2023 03:31:11 -0800 (PST)
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
Subject: [PATCH v3 0/4] introduce generic implementation of macros from bug.h
Date: Fri, 24 Feb 2023 13:31:03 +0200
Message-Id: <cover.1677233393.git.oleksii.kurochko@gmail.com>
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
Changes in V3:
 * Nothing was done with the comment in <xen/bug.h> before run_in_exception_handler
   but I think it can be changed during the merge.
 * Add debugger_trap_fatal() to do_bug_frame(). It simplifies usage of
   do_bug_frame() for x86 so making handle_bug_frame() and find_bug_frame()
   not needed anymore.
 * Update do_bug_frame() to return -EINVAL if something goes wrong; otherwise
   id of bug_frame
 * Update _ASM_BUGFRAME_TEXT to make it more portable.
 * Drop unnecessary comments.
 * Update patch 2 not to break compilation: move some parts from patches 3 and 4
   to patch 2
 * As prototype and what do_bug_frame() returns was changed so patch 3 and 4
   was updated to use a new version of do_bug_frame
 * Change debugger_trap_fatal() prototype for x86 to align with prototype in
   <xen/debugger.h>
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
 xen/arch/arm/arm32/traps.c           |   2 +-
 xen/arch/arm/include/asm/bug.h       |  34 +-----
 xen/arch/arm/include/asm/div64.h     |   2 +-
 xen/arch/arm/include/asm/traps.h     |   2 -
 xen/arch/arm/traps.c                 |  81 +--------------
 xen/arch/arm/vgic/vgic-v2.c          |   2 +-
 xen/arch/arm/vgic/vgic.c             |   2 +-
 xen/arch/x86/Kconfig                 |   1 +
 xen/arch/x86/acpi/cpufreq/cpufreq.c  |   2 +-
 xen/arch/x86/include/asm/asm_defns.h |   2 +-
 xen/arch/x86/include/asm/bug.h       |  88 +---------------
 xen/arch/x86/include/asm/debugger.h  |   4 +-
 xen/arch/x86/traps.c                 |  81 ++-------------
 xen/common/Kconfig                   |   3 +
 xen/common/Makefile                  |   1 +
 xen/common/bug.c                     | 109 +++++++++++++++++++
 xen/drivers/cpufreq/cpufreq.c        |   2 +-
 xen/include/xen/bug.h                | 150 +++++++++++++++++++++++++++
 xen/include/xen/lib.h                |   2 +-
 20 files changed, 291 insertions(+), 280 deletions(-)
 create mode 100644 xen/common/bug.c
 create mode 100644 xen/include/xen/bug.h

-- 
2.39.0


