Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B49B6BBABE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 18:22:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510151.787353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcUp1-0004wI-SZ; Wed, 15 Mar 2023 17:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510151.787353; Wed, 15 Mar 2023 17:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcUp1-0004sv-Pe; Wed, 15 Mar 2023 17:21:55 +0000
Received: by outflank-mailman (input) for mailman id 510151;
 Wed, 15 Mar 2023 17:21:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ux93=7H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcUp0-0004sk-4F
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 17:21:54 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e091bba2-c355-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 18:21:52 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id w9so7610264edc.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Mar 2023 10:21:52 -0700 (PDT)
Received: from fedora.. (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 d20-20020a50cd54000000b004fd1ee3f723sm2736315edj.67.2023.03.15.10.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:21:51 -0700 (PDT)
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
X-Inumbo-ID: e091bba2-c355-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678900912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DWZ9HzxY+mvUoIfZ7y1hWxMaSr9d5d0I8xwdOw7t7yY=;
        b=Zs3OPi0o6KtUUpScvIXhlVCqx5O+ENhKsiVWjmWEN7hAlzakoJQmCxV5wrkN7ibJT9
         rFLNUHwBc1berdyY4Zm4FssTEDT3lN01bQ6HdruIKB0Of42O94udpy3FyfgPQvwZc0as
         2T/hT7Z0pHzpyinw3wt18/txH7B+gobbawGExvKe+cXZyoObCGc5aF6VyssjaTmVTOQ0
         cteeiPGvjdzUkPExUP1Mf5H0xu2K6YTVyhIqyopW/VetDwsnuSgc35c8HYM2+QsPHFXe
         ThZOgCcBTiwgJHeZBi61PwsDkHXm5CVEPjhkLcYbR9KxPFDGZbPnhjHyEeRGOEzCD0Fw
         i8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678900912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWZ9HzxY+mvUoIfZ7y1hWxMaSr9d5d0I8xwdOw7t7yY=;
        b=iOyYVNKeWh+XX0tWGMdIEf9CZT7HMNyphp0j5igb51/x39x0NT2jJ45qEpdjPiUiXq
         QYKDbXOej9NIi7mmwL092EINZ9Kwr92/bO/wITc1A6rzgV4nhnU3VlljHZHfhHH3pZre
         TJ0GdECYWYzJJ8zDqW9P7GgZLreUifL8Dh+QUp0X9zjR3lXxwZd6lOIXmtBXhVSpfJUZ
         Z/0YRendT6vE9VUOqJtmBgKGS2OHfIfLSchrge2TJ9R/0+KdyqIOjlSuSxn6pgLgOnqs
         AQnTsycKsPcy3Y0uhAaNAn96RHhcaxMVKu10jeG7EXjdJ4RJ/Ew4VSPsnNrxCm5GcK6n
         YUBA==
X-Gm-Message-State: AO0yUKVwUbw8tQwzg62ne/KY2NbwvLQ1/IaQbz4LZ5aUEElMqwTSSCyf
	cAy8hlYuDTRpFAxasuvTnBfdLZhX7x4=
X-Google-Smtp-Source: AK7set/pFSYmKuwIdt1gxd/QE8PPD/KwP7rMg5mHyKgluw9YD5f5UILsmHsPlilTIChmgDgdOJwwpA==
X-Received: by 2002:aa7:c052:0:b0:4fd:29e6:701b with SMTP id k18-20020aa7c052000000b004fd29e6701bmr3217773edo.38.1678900911822;
        Wed, 15 Mar 2023 10:21:51 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v8 0/5] introduce generic implementation of macros from bug.h
Date: Wed, 15 Mar 2023 19:21:42 +0200
Message-Id: <cover.1678900513.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
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
  * Introduce BUG_INSTR and BUG_ASM_CONST to make _ASM_BUGFRAME_TEXT reusable between
    architectures
  * Introduce BUG_DEBUGGER_TRAP_FATAL to hide details about TRAP_invalid_op for specific
    architecture
  * Introduce BUILD_BUG_ON_LINE_WIDTH(line) to make more generic BUG_FRAME macros
  * Make macros related to bug frame structure more generic.

RISC-V will be switched to use <xen/bug.h> and in the future, it will use common
the version of do_bug_frame() when xen/common will work for RISC-V.

---
Changes in V8:
 * move  BUILD_BUG_ON_LINE_WIDTH(line) to "ifndef BUG_FRAME_STRUCT" and add #elif for
   "ifndef BUG_FRAME_STRUCT" to define stub for BUILD_BUG_ON_LINE_WIDTH.
 * move <xen/debuger.h> from <asm/bug.h> to <common/bug.c> to fix compilation issue
   ( more details in the changes to the patch [xen/x86: switch x86 to use generic
     implemetation of bug.h] ).
 * remove <asm/bug.h> from <x86/acpi/cpufreq/cpufreq.c> and
   <drivers/cpufreq/cpufreq.c> as nothing from <xen/bug.h> are used in
   <*/cpufreq.c>
 * Rebase the patch series on the top of the latest staging: it was a merge conflict
   inisde x86/Kconfig.
---
Changes in V7:
 * Introduce new patch to clean up ARM's <asm/bug.h> from unused defines: 
   BUG_DISP_WIDTH, BUG_LINE_LO_WIDTH, BUG_LINE_HI_WIDTH
 * fix addressed code style.
 * Remove '#include <xen/debugger.h>' from bug.c. it should be a part
	 of <asm/bug.h>.
 * move BUILD_BUG_ON_LINE_WIDTH to '#ifndef BUG_FRAME_STRUCT' and define
	 dummy BUILD_BUG_ON_LINE_WIDTH when BUG_FRAME_STRUCT is defined.
 * remove update prototype of 'void (*fn)(const struct cpu_user_regs *)' to
	 'void (*fn)(struct cpu_user_regs *)'.
 * add code to to make sure the type used in run_in_exception_handler()
	 matches the one used here.
 * Remove #undef {BUG_DISP_WIDTH, BUG_LINE_LO_WIDTH, BUG_LINE_HI_WIDTH} from
	 ARM and x86:
	 - for ARM was created separate patch where the defines are removed as
	   unused.
	 - for x86, the defines were removed now not to produce #undef of them to remove
     them again in the following-up patch
 * make eip 'const void *' in x86's do_invalid_op() 
 * change [eip = (unsigned char *)eip + sizeof(bug_insn);] to [eip += sizeof(bug_insn);]
 * add '#include <xen/debugger.h>' to x86's <asm/bug.h>
---
Changes in V6:
 * Update the cover letter message: add information that BUG_DEBUGGER_TRAP_FATAL() and
   BUILD_BUG_ON_LINE_WIDTH().
 * Introduce BUILD_BUG_ON_LINE_WIDTH(line) to make more generic BUG_FRAME macros.
 * fix addressed code style
 * change -EINVAL to -ENOENT in case when bug_frame wasn't found in generic do_bug_frame().
 * change all 'return id' to 'break' inside switch/case of do_bug_frame().
 * move up "#ifndef __ASSEMBLY__" to include BUG_DEBUGGER_TRAP_FATAL.
 * update the comment of BUG_ASM_CONST.
 * Introduce BUILD_BUG_ON_LINE_WIDTH(line) to make more generic BUG_FRAME macros
 * remove #ifndef BUG_FRAME_STRUCT around BUG_DISP_WIDTH, BUG_LINE_LO_WIDTH as it is
   required to be defined before <asm/bug.h> as it is used by x86's <asm/bug.h> when
   the header is included in assembly code.
 * add undef of BUG_DISP_WIDTH, BUG_LINE_LO_WIDTH for ARM & x86
   as they were introduced unconditionally in <xen/bug.h>.
 * update the type of eip to 'void *' in do_invalid_op() for x86
 * fix the logic of do_invalid_op() for x86
 * move macros BUG_DEBUGGER_TRAP_FATAL under #ifndef __ASSEMBLY__ as
	 it is not necessary to be in assembly code for x86.

---
Changes in V5:
 * Update the cover letter message as the patch, on which the patch series
   is based, has been merged to staging.
 * Remove "#ifdef BUG_FN_REG..." from generic do_bug_frame() as ARM will
   use generic implementation fully.
---
Changes in V4:
 * Introduce and use generic BUG_DEBUGGER_TRAP_FATAL(regs) mnacros which is used to deal with
   debugger_trap_fatal(TRAP_invalid_op, regs) where TRAP_invalid_op is x86-specific.
 * Add comment what do_bug_frame() returns.
 * Do refactoring of do_bug_frame():
     * invert the condition 'if ( region )' in do_bug_frame() to reduce the indention.
		 * change type of variable i from 'unsigned int' to 'size_t' as it  is compared with
		   n_bugs which has type 'size_t'
 * Remove '#include <xen/stringify.h>' from <xen/bug.h> as it doesn't need any more after switch to
   x86 implementation.
 * Remove '#include <xen/errno.h>' as it isn't needed any more
 * Move bug_*() macros inside '#ifndef BUG_FRAME_STRUCT'
 * Add <xen/lib.h> to fix compile issue with BUILD_ON()...
 * Add documentation for BUG_ASM_CONST.
 * Defines BUG_DISP_WIDTH, BUG_LINE_LO_WIDTH, BUG_LINE_HI_WIDTH were moved into
   "ifndef BUG_FRAME_STRUCT" in <xen/bug.h> as they are specific for 'struct bug_frame' and so should
   co-exist together. So the defines were back to <asm/bug.h> until BUG_FRAME_STRUCT will be defined in
	 <asm/bug.h>.
 * Switch ARM implementation to generic one
 * Remove BUG_FN_REG from arm{16,32}/bug.h as it isn't needed after switch to generic implementation
 * Back comment /* !__ASSEMBLY__ */ for #else case in <asm/bug.h>
 * Remove changes related to x86/.../asm/debuger.h as do_bug_frame() prototype was updated and cpu_user_regs
	 isn't const any more.

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

Oleksii Kurochko (5):
  xen: introduce CONFIG_GENERIC_BUG_FRAME
  xen/arm: remove unused defines in <asm/bug.h>
  xen: change <asm/bug.h> to <xen/bug.h>
  xen/arm: switch ARM to use generic implementation of bug.h
  xen/x86: switch x86 to use generic implemetation of bug.h

 xen/arch/arm/Kconfig                 |   1 +
 xen/arch/arm/arm32/traps.c           |   2 +-
 xen/arch/arm/include/asm/arm32/bug.h |   2 -
 xen/arch/arm/include/asm/arm64/bug.h |   2 -
 xen/arch/arm/include/asm/bug.h       |  88 +--------------
 xen/arch/arm/include/asm/div64.h     |   2 +-
 xen/arch/arm/include/asm/traps.h     |   2 -
 xen/arch/arm/traps.c                 |  81 +-------------
 xen/arch/arm/vgic/vgic-v2.c          |   2 +-
 xen/arch/arm/vgic/vgic.c             |   2 +-
 xen/arch/x86/Kconfig                 |   1 +
 xen/arch/x86/acpi/cpufreq/cpufreq.c  |   1 -
 xen/arch/x86/include/asm/asm_defns.h |   2 +-
 xen/arch/x86/include/asm/bug.h       |  84 +-------------
 xen/arch/x86/traps.c                 |  81 ++------------
 xen/common/Kconfig                   |   3 +
 xen/common/Makefile                  |   1 +
 xen/common/bug.c                     | 108 ++++++++++++++++++
 xen/drivers/cpufreq/cpufreq.c        |   1 -
 xen/include/xen/bug.h                | 161 +++++++++++++++++++++++++++
 xen/include/xen/lib.h                |   2 +-
 21 files changed, 296 insertions(+), 333 deletions(-)
 create mode 100644 xen/common/bug.c
 create mode 100644 xen/include/xen/bug.h

-- 
2.39.2


