Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93634689FF1
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 18:06:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489260.757609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNzVf-0002bo-5R; Fri, 03 Feb 2023 17:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489260.757609; Fri, 03 Feb 2023 17:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNzVf-0002ZY-0E; Fri, 03 Feb 2023 17:05:59 +0000
Received: by outflank-mailman (input) for mailman id 489260;
 Fri, 03 Feb 2023 17:05:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulaf=57=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pNzVd-0002ZN-D3
 for xen-devel@lists.xenproject.org; Fri, 03 Feb 2023 17:05:57 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0573246b-a3e5-11ed-933c-83870f6b2ba8;
 Fri, 03 Feb 2023 18:05:56 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id bg26so4392996wmb.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Feb 2023 09:05:55 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.104.21.nat.umts.dynamic.t-mobile.pl. [46.204.104.21])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a5d50d1000000b002bfe266d710sm2452191wrt.90.2023.02.03.09.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 09:05:54 -0800 (PST)
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
X-Inumbo-ID: 0573246b-a3e5-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IimoZA31WZ5/fT3KaPsuM531N6A6S9mjjpULZGwMFtI=;
        b=EnHEcRl/SiMTNJ3XOSSq4Va5Rg/3mB9yM3pnSvOgaNOwb75RWc3tDObC+yfjq9xBU7
         fqtAFRqezRNfy1ZgcCFK58nT4wG5kQcWH4n47tvGfEzky7pKM8UhCT98aLJR7GDnre4f
         NPXgGtZ9voY2dpBEG9uUargEqkKGzNWhSo3Uypl29xEVTS/VtOcCKV2u7H3u9eF+DUqL
         zGZPfGm6GPsfTleEKXR5PeGNFyWvSv7/7JaS4194i+zuxVSt+B+0IC74F2JZUU56y8j7
         +yFa4/RGDO/rhY94zZw4NKAT1XtW7pdW5tUrWYtDF65jTyrZQwfh+Xy1juRw9Mv0rEyM
         T6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IimoZA31WZ5/fT3KaPsuM531N6A6S9mjjpULZGwMFtI=;
        b=EKXSmgFx5SvOXqDUFbMEuNNhcXstxC3Ck1tmCo7pzZCJzeQ80xA92EJua0hHufxw72
         /YLZAch6I/Yx9DVD+GfJ2KL8FVf38G57LDzdltiEwKRjoBVls1K3tq+Z4Q2lEhHFfJAU
         VtARCscID4cHglkf2Np0iigP8DR9HLyCbWKlHnhLIqjDfx5WgWTUDmBlagFmYd5gVlcd
         8udqOXLKkcMxhGD1XhBB9iRSmicLCtC31KxN2RBeEB8fv46La/zht2toFErZEOzb5d1k
         7oL4SFlz+WzFyukmJLcEdfMF7T6lK4uFAcvfXMrHJS1L17aai4hWgm7CbckmzW21AcR+
         TWHQ==
X-Gm-Message-State: AO0yUKVD5m4eLsxOhKSFb/do8DaQl4An0KAQlcL+a5bu6BcfukON6g7e
	vbD36CVxXzZWIwifgCWV0Ie3KwXB0qo=
X-Google-Smtp-Source: AK7set/lZb0ZRrRuv9Avx1XZdUrh55fCyr3AYQmBrcCsMryCkQkQ+xZHERIuVvqh1ExFR+5ll0hEzQ==
X-Received: by 2002:a05:600c:4588:b0:3dd:f286:5ae9 with SMTP id r8-20020a05600c458800b003ddf2865ae9mr10490877wmo.9.1675443954637;
        Fri, 03 Feb 2023 09:05:54 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 0/4] introduce generic implementation of macros from bug.h
Date: Fri,  3 Feb 2023 19:05:46 +0200
Message-Id: <cover.1675441720.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A large part of the content of the bug.h is repeated among all
architectures (especially ARM and RISCV have the same implementation), so it
was created a new config CONFIG_GENERIC_BUG_FRAME which are used to
introduce generic implementation of do_bug_frame() and move ARM's <asm/bug.h>
to <xen/common/...> with the following changes:
    * add inclusion of arch-specific header <asm/bug.h>
    * rename the guard and remove ARM specific changes
    * wrap macros BUG_FRAME/run_in_exception_handler/WARN/BUG/assert_failed
      into #ifndef "BUG_FRAME/run_in_exception_handler/WARN/BUG/assert_failed"
      thereby each architecture can override generic implementation of macros.
    * add #ifdef __ASSEMBLY__ ... #endif
    * Update run_in_exception_handler() with:
        register void *fn_ asm(__stringify(BUG_FN_REG)) = (fn);
      to avoid:
        asm ("mv " __stringify(BUG_FN_REG) ", %0\n"

For x86 only common parts was removed from <asm/bug.h>.

RISC-V will be switched to use <xen/bug.h> and in the future, it will use common
the version of do_bug_frame() when xen/common will work for RISC-V.

Oleksii Kurochko (4):
  xen: introduce CONFIG_GENERIC_BUG_FRAME
  xen/arm: switch ARM to use generic implementation of bug.h
  xen/x86: switch x86 to use generic implemetation of bug.h
  xen: change <asm/bug.h> to <xen/bug.h>

 xen/arch/arm/Kconfig                 |   1 +
 xen/arch/arm/include/asm/bug.h       |  86 ------------------
 xen/arch/arm/include/asm/div64.h     |   2 +-
 xen/arch/arm/traps.c                 |  79 -----------------
 xen/arch/arm/vgic/vgic-v2.c          |   2 +-
 xen/arch/arm/vgic/vgic.c             |   2 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c  |   2 +-
 xen/arch/x86/include/asm/asm_defns.h |   2 +-
 xen/arch/x86/include/asm/bug.h       |  32 +------
 xen/common/Kconfig                   |   6 ++
 xen/common/Makefile                  |   1 +
 xen/common/bug.c                     |  88 +++++++++++++++++++
 xen/drivers/cpufreq/cpufreq.c        |   2 +-
 xen/include/xen/bug.h                | 127 +++++++++++++++++++++++++++
 xen/include/xen/lib.h                |   2 +-
 15 files changed, 232 insertions(+), 202 deletions(-)
 create mode 100644 xen/common/bug.c
 create mode 100644 xen/include/xen/bug.h

-- 
2.39.0


