Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD806AE557
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 16:50:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507546.781192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZaD-0002mw-Vq; Tue, 07 Mar 2023 15:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507546.781192; Tue, 07 Mar 2023 15:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZaD-0002kV-S2; Tue, 07 Mar 2023 15:50:33 +0000
Received: by outflank-mailman (input) for mailman id 507546;
 Tue, 07 Mar 2023 15:50:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zeiT=67=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pZZaD-0002jw-1e
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 15:50:33 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca6146e2-bcff-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 16:50:31 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so7485200wmq.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 07:50:31 -0800 (PST)
Received: from fedora.. (46.204.108.143.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.143]) by smtp.gmail.com with ESMTPSA id
 k7-20020a05600c080700b003e21ba8684dsm13450744wmp.26.2023.03.07.07.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 07:50:30 -0800 (PST)
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
X-Inumbo-ID: ca6146e2-bcff-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678204231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bnB1aZaY7P8UfKi/fBAr6UHnPYe28EIMyjO3e+ApO3E=;
        b=QIQfQy+e/iL2iA134seJdQERAm8gDCGPbOYKqiZ6h5cLbOwFxZcgLhCDSO7Iitnyo6
         GaRF7zFXbCZfxbNZFgjYA1pirnK7pkRPdjgr9DImjTY0xFjOkWlRTVeZgAxcB8kWetx+
         dZeaP0seXskVz4uwdceViIGWx5GPQXbIVBGK+GV3VjszPKcvsI+ww/UkiAMcBAHK9R9/
         iBufRECJlgiX4NDEl821hKMLDytqoEB51qCSSPnJd2w0xrsmctg5xMzFmkb6lu78kDUl
         +L6e9XgOkI+j2Ni8dUHdnTOT6uyI3EOxbg0dZ+RLcaDdqXj7Qh6LAVB6LSXzHrgoK2tg
         swRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678204231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnB1aZaY7P8UfKi/fBAr6UHnPYe28EIMyjO3e+ApO3E=;
        b=r72YL5uxYIEZz7nUjBsQl3mfNXnnamBS/is6/kFCc1pbZaQEGIi+XMfhxhUbFenmAY
         Z6v/nKefmbmTNQ+VwT10OkErBswzQKt6rtri1OWsRH5yI+4ILsqdKTUNPkU23IQH0GPT
         4AP6ff2jOpd1DsPloLvRIXEIhhSN6DlQoxWzzvn82eSvX1cJDF3qoFOc1tIujJXquVv2
         pFA6uKD2eaEeSLmHojT+cZvu0djK1SU01YHX9SinyJGbA8PcxchuuwEFJ83noeMpnBpz
         ow+EZEo2SFhB8K3j2v7D9cjzu5D93cc2lpGIy+wObXr+3Hspg1QWYaEuQDWIgbvpCkhv
         dzxg==
X-Gm-Message-State: AO0yUKWKtlKkEQrs73VJMF/41/1Z8Apv4+Vhf6EhX1Gig9kutJbTdTxC
	bNO6TkiLwP/QudXmJ5KIEOJf9LsqjCU=
X-Google-Smtp-Source: AK7set9IE33OOv834JE/nb5ExdhDOaStPtVFptQQ5xcSF7rponQhtj5DoqPhJxB73Tqg2Sz6xVVlyw==
X-Received: by 2002:a05:600c:1c20:b0:3eb:3945:d3f9 with SMTP id j32-20020a05600c1c2000b003eb3945d3f9mr13755504wms.4.1678204230969;
        Tue, 07 Mar 2023 07:50:30 -0800 (PST)
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
Subject: [PATCH v6 0/4] [PATCH v5 0/4] introduce generic implementation of macros from bug.h
Date: Tue,  7 Mar 2023 17:50:22 +0200
Message-Id: <cover.1678202233.git.oleksii.kurochko@gmail.com>
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
  * Introduce BUG_INSTR and BUG_ASM_CONST to make _ASM_BUGFRAME_TEXT reusable between
    architectures
  * Introduce BUG_DEBUGGER_TRAP_FATAL to hide details about TRAP_invalid_op for specific
    architecture
  * Introduce BUILD_BUG_ON_LINE_WIDTH(line) to make more generic BUG_FRAME macros
  * Make macros related to bug frame structure more generic.

RISC-V will be switched to use <xen/bug.h> and in the future, it will use common
the version of do_bug_frame() when xen/common will work for RISC-V.

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

Oleksii Kurochko (4):
  xen: introduce CONFIG_GENERIC_BUG_FRAME
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
 xen/arch/x86/acpi/cpufreq/cpufreq.c  |   2 +-
 xen/arch/x86/include/asm/asm_defns.h |   2 +-
 xen/arch/x86/include/asm/bug.h       |  84 +-------------
 xen/arch/x86/traps.c                 |  81 ++------------
 xen/common/Kconfig                   |   3 +
 xen/common/Makefile                  |   1 +
 xen/common/bug.c                     | 104 ++++++++++++++++++
 xen/drivers/cpufreq/cpufreq.c        |   2 +-
 xen/include/xen/bug.h                | 158 +++++++++++++++++++++++++++
 xen/include/xen/lib.h                |   2 +-
 21 files changed, 291 insertions(+), 333 deletions(-)
 create mode 100644 xen/common/bug.c
 create mode 100644 xen/include/xen/bug.h

-- 
2.39.0


