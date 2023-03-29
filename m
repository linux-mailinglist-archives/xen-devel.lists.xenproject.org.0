Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8346CD7E6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 12:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516183.799901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phTOW-0007p2-J9; Wed, 29 Mar 2023 10:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516183.799901; Wed, 29 Mar 2023 10:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phTOW-0007m5-G4; Wed, 29 Mar 2023 10:51:08 +0000
Received: by outflank-mailman (input) for mailman id 516183;
 Wed, 29 Mar 2023 10:51:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO3W=7V=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1phTOV-0007lb-3x
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 10:51:07 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b2dba1f-ce1f-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 12:51:06 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id j11so19519507lfg.13
 for <xen-devel@lists.xenproject.org>; Wed, 29 Mar 2023 03:51:06 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j17-20020ac253b1000000b004eb0f6b7ccfsm1173572lfh.134.2023.03.29.03.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 03:50:35 -0700 (PDT)
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
X-Inumbo-ID: 9b2dba1f-ce1f-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680087065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+u+EjSKc1zL7CRLFsYSj29ghRtfcCrYUxraTQdJKBfY=;
        b=kYPrT74D7dvMWbGJOVvHwbUbJF8O5Yw0m76j5FmjhUhKdAqkz8PzI8IK2XfUz5gXSR
         Q211MqPmzF+lTDDEgnsgL9f/Cv9j/FDigEi67+pKB8CcyuGOIUbF/OEDko/yanNbxa9I
         JOCOtyK6Ie3rB8ctC7+d0ZMFx7mB24aP4p/lDAwTRhZenZdqdeGtrYvbXZe3Z64XzUJT
         +vZ25TDeIoV+ueFdBtdc481vkYV19dn7Z17uqtnM9hDs5N6tu/EGh5hNN819riteb661
         hvIezqIiGBKY/He7tbZvFxope0rH5c/kjbQvKa8S8N90wrIG9JR0KuHafvOHoTDcy8WB
         59fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680087065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+u+EjSKc1zL7CRLFsYSj29ghRtfcCrYUxraTQdJKBfY=;
        b=1xMonjbS/Ao2KcOqFTP8Yg+LDPSlR98b8PrLWMuHs7a2pf6Vs793UzcWTtmNfS/aX4
         darQcSUQskglhnz+ifF0W5Go/BYiyydpWvMs7bUxhFBKIPY3kzb4d0njhiCCAfAzdkBZ
         CDGjiXI4S4J0Mfhi6rtm1DZvbgjypUsJQWuvjUOMGjUoDDIP5diRgBmCQLvaDCSOOJVl
         JJjxmAg2pAl/R518Gz8NLxTciDzmOcQv3vvo+IH39rvvAjRO2bwfkYOtRgvQKlV1gqQq
         /B1+SffV3LY64t290WYKQpPPmPUWAfLfYbhRhCCehX4KRp/nVguJw1IxQfzspcOti33s
         Tt2g==
X-Gm-Message-State: AAQBX9dcFVKHHfmfs23FF8KzevSKRn3huHEPGe1SMoNjz8b1Qa9OuNrW
	1C2PMMzJcS4SXFBSZmUkRLdoTgh1Cwo=
X-Google-Smtp-Source: AKy350YQprT0tzDh9DRkST1ZbNOCHhTX8voTwPkZEbJvzlHmF6fRjAqXZTMkCLvpAIOMvXWOz88ahA==
X-Received: by 2002:ac2:4ac2:0:b0:4ea:f5dd:8aa1 with SMTP id m2-20020ac24ac2000000b004eaf5dd8aa1mr4797976lfp.18.1680087035304;
        Wed, 29 Mar 2023 03:50:35 -0700 (PDT)
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
Subject: [PATCH v9 0/5] introduce generic implementation of macros from bug.h
Date: Wed, 29 Mar 2023 13:50:27 +0300
Message-Id: <cover.1680086655.git.oleksii.kurochko@gmail.com>
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
Changes in V9:
  * rename BUILD_BUG_ON_LINE_WIDTH to BUG_CHECK_LINE_WIDTH
  * Remove <asm/processor.h> from <common/bug.c> as the patch were
    merged to staging which move all things used in <common/bug.c>
    from <asm/processor.h> to more proper headers.
  * add "struct cpu_user_regs" to <common/bug.c>.
  * add explanation why <xen/debugger.h> is included in <common/bug.c>
  * add additional explanation to <asm/bug.h> header	  
  * update descrption.
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
 xen/arch/arm/include/asm/bug.h       | 106 ++++--------------
 xen/arch/arm/include/asm/div64.h     |   2 +-
 xen/arch/arm/include/asm/traps.h     |   2 -
 xen/arch/arm/traps.c                 |  81 +-------------
 xen/arch/arm/vgic/vgic-v2.c          |   2 +-
 xen/arch/arm/vgic/vgic.c             |   2 +-
 xen/arch/x86/Kconfig                 |   1 +
 xen/arch/x86/acpi/cpufreq/cpufreq.c  |   1 -
 xen/arch/x86/include/asm/asm_defns.h |   2 +-
 xen/arch/x86/include/asm/bug.h       | 100 ++++-------------
 xen/arch/x86/traps.c                 |  81 ++------------
 xen/common/Kconfig                   |   3 +
 xen/common/Makefile                  |   1 +
 xen/common/bug.c                     | 126 +++++++++++++++++++++
 xen/drivers/cpufreq/cpufreq.c        |   1 -
 xen/include/xen/bug.h                | 161 +++++++++++++++++++++++++++
 xen/include/xen/lib.h                |   2 +-
 21 files changed, 349 insertions(+), 332 deletions(-)
 create mode 100644 xen/common/bug.c
 create mode 100644 xen/include/xen/bug.h

-- 
2.39.2


