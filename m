Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 457166A7D7F
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 10:21:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504738.777086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXf79-0007o2-HD; Thu, 02 Mar 2023 09:20:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504738.777086; Thu, 02 Mar 2023 09:20:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXf79-0007m6-EI; Thu, 02 Mar 2023 09:20:39 +0000
Received: by outflank-mailman (input) for mailman id 504738;
 Thu, 02 Mar 2023 09:20:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5rfr=62=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXf77-0007lq-Nu
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 09:20:37 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c51ecd1-b8db-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 10:20:34 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id h3so16866670lja.12
 for <xen-devel@lists.xenproject.org>; Thu, 02 Mar 2023 01:20:34 -0800 (PST)
Received: from fedora.. (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 g7-20020a2eb5c7000000b002946be8475esm2018442ljn.135.2023.03.02.01.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 01:20:32 -0800 (PST)
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
X-Inumbo-ID: 7c51ecd1-b8db-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677748833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0f5cV2uw6HaMEMZa/XjoT427b94bmO91+3UBySL88d8=;
        b=nsSxTlipcgYZrC6T43xJ8cmmRtaQGYbhQDlHKnOHiBcu5VPb85nIvSPoHHMfNYucox
         tiZCh8H6lWxlIw+r7HV9SQ1FLNFSnWTz/KDrfJPagPDljMMYeV3NMn+CJ1yXnn3huFWT
         ep1Crph+gr5EJ9d+4Jo6QRrHHnFoy4GCSV5y6Q91QuOTLDqwu7DarzlQoOrf59nQwEte
         wJUApYCrixGErrp1e7bge2Zusn1TLZ0ZqgP7SMrGIF9W3C63uCN2yEG3+i+JFmuopJ5e
         o3cxh9uHK5+KzrMUiwpmPwPEILlvmwOwAeoaLrko6vJlLIYo5TTo0BsL6Zp7a+cz8Xpy
         z3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677748833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0f5cV2uw6HaMEMZa/XjoT427b94bmO91+3UBySL88d8=;
        b=w2FHnGcUFNyA/drIDtTRJ4RGUPt0vkRWtodG17m2K7myhgmYfZAZ8+EbxRIbUNLHLj
         wwR92hSmOblVB+8kKQY+Wu5FzW8Tc1g0TFEWV8OyN6ZHSjLg8sKroFPOJYxfPffzwWZl
         qR07KPrCNKR3n+LZajLinS9MnW5YhQ9sWspYXPZQfXGwqdpNIgdt+52NmHi+kBvWrEjD
         PCp982qch7EoUhmGZkncdyWP+bHVfP3WbOmSKFXysAAGF8MfmW7vSiXaAdhbhBph94ju
         LiR4YWLhsvFG+WYlsKDp0QL+Sgc0D0PgyRfKGXqOCEF0P4gcVkFpHEEXivf24DRnEnQG
         i+WQ==
X-Gm-Message-State: AO0yUKVKd9fHsG/2+HoP8olUzo4FmCp0IEFhkQIeqHv/45el/JDwYOYl
	lIEzCNhLqwbF8aX/0lZW3u5mzHI1bj8=
X-Google-Smtp-Source: AK7set9CF+7DjWYSvJUZXMLS28wZ14vOFuv08owtM+Lh13GoMmyHOpi07eEcjYl++QLzHts4xp7sKQ==
X-Received: by 2002:a2e:c42:0:b0:293:1b3e:985f with SMTP id o2-20020a2e0c42000000b002931b3e985fmr2475789ljd.24.1677748833313;
        Thu, 02 Mar 2023 01:20:33 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 0/4] introduce generic implementation of macros from bug.h
Date: Thu,  2 Mar 2023 11:20:24 +0200
Message-Id: <cover.1677747527.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series is based on the patch [1].

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
  * Make macros related to bug frame structure more generic.

RISC-V will be switched to use <xen/bug.h> and in the future, it will use common
the version of do_bug_frame() when xen/common will work for RISC-V.

[1]: https://lore.kernel.org/xen-devel/74973920d8722df3ce533979314564f331acf16e.1677687247.git.oleksii.kurochko@gmail.com/

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
 xen/common/bug.c                     | 103 +++++++++++++++++
 xen/drivers/cpufreq/cpufreq.c        |   2 +-
 xen/include/xen/bug.h                | 158 +++++++++++++++++++++++++++
 xen/include/xen/lib.h                |   2 +-
 21 files changed, 289 insertions(+), 334 deletions(-)
 create mode 100644 xen/common/bug.c
 create mode 100644 xen/include/xen/bug.h

-- 
2.39.0


