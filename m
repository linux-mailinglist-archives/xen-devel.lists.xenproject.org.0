Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7C96A9564
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 11:38:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505811.778763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2o5-0005m8-QS; Fri, 03 Mar 2023 10:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505811.778763; Fri, 03 Mar 2023 10:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2o5-0005kF-NW; Fri, 03 Mar 2023 10:38:33 +0000
Received: by outflank-mailman (input) for mailman id 505811;
 Fri, 03 Mar 2023 10:38:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y5Qx=63=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pY2o3-0005jk-SM
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 10:38:31 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89a0f0e9-b9af-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 11:38:29 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id r27so2954573lfe.10
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 02:38:29 -0800 (PST)
Received: from fedora.. (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 d11-20020ac25ecb000000b004cb3a55feacsm338760lfq.100.2023.03.03.02.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 02:38:28 -0800 (PST)
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
X-Inumbo-ID: 89a0f0e9-b9af-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677839909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uiytgQHe1E8d/UMkVIjPxK0tDNJ92VO/9rBdNtKmxd8=;
        b=pPe2CXF1or4QzKhTcIcvSWfu1qOTekwZ/Rg9iiQ2xCQA9Vx/XXdn+1YT2Z0bG0sEiO
         lb6+j2pcJH8vKPfK5ENBsgqSmW+ObB/5ARw+Y/NrTyqV6NotlSTD29uGX1FFzNfixCGT
         I5p4FKUAnSGTiNq1zZxFwLRrwUe/nk9t7MRh92kQd5+TMi+uN5f0gQvO/QuxczMIvUiD
         2e5pK5ASNhO149qEo6hkympdeGNpT/iVio2MAgW3eQyfEokehNQ50BdSa7rxiaWYUR5I
         Wcg++OhPjZraD0d9uVzmBG/ac92WywVAYNF23XXYv0GcQA0iRpq5CW8L5gkFQsSH3z8J
         M+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677839909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uiytgQHe1E8d/UMkVIjPxK0tDNJ92VO/9rBdNtKmxd8=;
        b=dmXSisgAzhnOBE3atwcCCEEutPQq6PCofnHBF6EIhRG0lCz4jbZVRJsTCcRtBI2iej
         z2/cTN9SDSqs5q3ib4yNTjFCkTyPj+gWjgojTkZjmS6qMuVZviSirYSLjJ5mDmdhKtdu
         BqyL4W1QRqUrUto4fSqMpzVmOyx0eQBQ0gGJCvfJ8hcBq/hWgxK4jJsQcozbeuHVhFkT
         LBVVzvRXcqJJTokVHH0R/8qD9zGN9Xslc6A2J0zq55BFh3o7CyMbbxd7hVtyKGtKbtxG
         vdGRoHXx6n7+8irLX1oqKQ9+8f7yPILTit0JJZE5JspjTrVfKNIJT5XsL2H5hjTt5qUD
         Tcvw==
X-Gm-Message-State: AO0yUKUlRbe7B4hgxubkkB78Kuylp1q0UisJl/8HLAhYjOwKhGJzMh8z
	E1H7dEnPH8vo6NwHv5RTgSwkRJS/9v4=
X-Google-Smtp-Source: AK7set+ZYE7d4Np9WXFoEczDsW+Kae79Q5XYegrdZYO3kIfg/TLmyh/GP6BIQf0AYuFNUKaGFXcNVQ==
X-Received: by 2002:ac2:528a:0:b0:4cc:a107:4227 with SMTP id q10-20020ac2528a000000b004cca1074227mr331863lfm.22.1677839909138;
        Fri, 03 Mar 2023 02:38:29 -0800 (PST)
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
Subject: [PATCH v5 0/4] introduce generic implementation of macros from bug.h
Date: Fri,  3 Mar 2023 12:38:21 +0200
Message-Id: <cover.1677839409.git.oleksii.kurochko@gmail.com>
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
  * Make macros related to bug frame structure more generic.

RISC-V will be switched to use <xen/bug.h> and in the future, it will use common
the version of do_bug_frame() when xen/common will work for RISC-V.

---
Changes in V5:
 * Update the cover letter message as the patch, on which the patch series
   is based, has been merged to staging
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
 xen/common/bug.c                     | 103 +++++++++++++++++
 xen/drivers/cpufreq/cpufreq.c        |   2 +-
 xen/include/xen/bug.h                | 158 +++++++++++++++++++++++++++
 xen/include/xen/lib.h                |   2 +-
 21 files changed, 289 insertions(+), 334 deletions(-)
 create mode 100644 xen/common/bug.c
 create mode 100644 xen/include/xen/bug.h

-- 
2.39.0


