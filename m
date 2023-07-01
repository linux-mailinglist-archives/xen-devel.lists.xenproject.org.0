Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B75D7447A0
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 09:19:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557770.871393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFUsf-0006Q8-VP; Sat, 01 Jul 2023 07:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557770.871393; Sat, 01 Jul 2023 07:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFUsf-0006O0-R0; Sat, 01 Jul 2023 07:18:53 +0000
Received: by outflank-mailman (input) for mailman id 557770;
 Sat, 01 Jul 2023 07:18:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypVN=CT=gmail.com=christopher.w.clark.io@srs-se1.protection.inumbo.net>)
 id 1qFUse-0006No-R6
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 07:18:52 +0000
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [2607:f8b0:4864:20::c36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8623aaef-17df-11ee-8611-37d641c3527e;
 Sat, 01 Jul 2023 09:18:50 +0200 (CEST)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-563531a3ad2so1819281eaf.3
 for <xen-devel@lists.xenproject.org>; Sat, 01 Jul 2023 00:18:49 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83]) by smtp.gmail.com with ESMTPSA id
 s19-20020aa78d53000000b00673e652985bsm4108866pfe.118.2023.07.01.00.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 00:18:47 -0700 (PDT)
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
X-Inumbo-ID: 8623aaef-17df-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688195928; x=1690787928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ABSe8iUEZJrWKb2OGgC8wK/SkYDq99binlaKCeSYzIU=;
        b=lzDAWFNXAQOVO2xfQSt/4scS4ox7fLA2WYLopAAQyu/0x9yO3TMIKfYk1isEqBDxG+
         zAZwPl4QnUrB5XT0dYkbbbSz+zED0N4B5iCihUu74p4q/XjU+aoHfhK850G7IB+idx5y
         ycwOGoGsq3FVMH2FD01k8IOjqq98IRDxRL1tHVPAAGPh1NSvERdyzwmbkouvbhA/iRfw
         hnXOITwbA9P9xf7wSZL8K4YRQAC+u+w/xzHF7C6SxOL9a9macuKeUxw94m6oBtkjjUpW
         XQNmpH5CeK7AVckC43dzWerbEmnvvmEUipEw26YuWX2ejnozPG48YDDmJA+Hi/qEpzmJ
         wyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688195928; x=1690787928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABSe8iUEZJrWKb2OGgC8wK/SkYDq99binlaKCeSYzIU=;
        b=Rpx3z3PMqA3hp2gPh4zERRwV1plJGjSKzTWMKEhQ6iJoTJ0Yvis+7mQoh2Xr2BDx61
         cjJbPIzwPWOKTxXuBkxvf0pyiYZluQ8PYozTBXuRktUZMrE55F3Zi4TL/EHgw9qQ1lNr
         YYwf1y06CUjK8LWbg8CKP+adqBGAQTsIUvDmUtVn5IvNh5KPnJI04xYhtSDxy3Qz/ZZB
         oPrXiu6RB7WFpqbtmCPwpqDku/gWvmKSWjfWv7Uy9HHni0Ol9PijYBJCnEEqwNuqnutr
         hqb0HlKf2wmgpq5P6CT+3yYoITwnpj9Rlb0yya2fgyxGFATMUNkU1y+DMi+yo0LzOIj6
         L94w==
X-Gm-Message-State: AC+VfDzCH0rM4vYNEVtgGXM2mWn+DRDlRqQpFc0nVTZb+ygZYOTU8zVI
	/P/K4/fv68qnc+FyXzp+RLZxWm6/X4s=
X-Google-Smtp-Source: ACHHUZ7uNpUH3+0thdIcpaMcrhVT8/LT4Op1Q5q6vaj1qAHh+k3kW0aBcpmrEciR+eMfvZAes1MNNw==
X-Received: by 2002:a05:6808:114d:b0:3a1:dfa0:7e18 with SMTP id u13-20020a056808114d00b003a1dfa07e18mr6835840oiu.25.1688195928151;
        Sat, 01 Jul 2023 00:18:48 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
	stefano.stabellini@amd.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rich Persaud <persaur@gmail.com>
Subject: [PATCH 00/10] v3: Boot modules for Hyperlaunch
Date: Sat,  1 Jul 2023 00:18:25 -0700
Message-Id: <20230701071835.41599-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a v3 series of work for Hyperlaunch for the Xen hypervisor,
an update to v2 and implementing a subset of the v1 series and functionality,
with changes made to address the community feedback provided on the patches.
Changes since the earlier versions of the series are described below.

The patches in this series are primarily derived from patches 2-4 of the
v1 full series, in a series of smaller patches for ease of review.

Thanks to AMD for supporting this work.

Documentation on Hyperlaunch:
https://wiki.xenproject.org/wiki/Hyperlaunch

v1 Hyperlaunch patch series:
https://lists.xenproject.org/archives/html/xen-devel/2022-07/msg00345.html

thanks

Christopher

Changes since v2:
- combined v2 patches 7 and 8 for common review
- rebased the v2 series onto the current tip of staging (sorry)
- fixed the placement of the patch changelogs
- provided the changes description in the cover letter

Changes since v1:
- the v2 and v3 series implement functionality from v1 patches 2-4
    - v2 series objective is to enable efficient patch review in support
      of merging the functionality into the hypervisor. It implements a
      subset of the v1 series, incorporating changes from community
      feedback.
- the bootstrap map is made accessible early in the v2 series via both
  multiboot and boot module arguments until later in the series where
  multiboot use is retired. This allows for incremental conversion across
  several patches from multiboot to boot modules.
- the 32-bit x86 boot environment header is removed, and changes are
  made to allow the new common bootinfo headers to be used instead.
- Arm and RISC-V architecture bootinfo headers are added to ensure that
  builds on those architectures can complete correctly.
- The KConfig patch to set the maximum number of boot modules allowed
  is not included in this series, replaced with a static maximum define.

Christopher Clark (10):
  x86 setup: move x86 boot module counting into a new boot_info struct
  x86 setup: per-arch bootmodule structure, headroom field
  x86 setup: change bootstrap map to accept new boot module structures
  x86 setup: porting dom0 construction logic to boot module structures
  xsm: switch XSM init to boot info structures
  x86 setup, microcode: switch to the new bootinfo structures
  x86 boot: define paddr_t and add macros for typedefing struct pointers
  x86, arm, riscv: add per-arch bootinfo headers
  arm setup: use common integer-typed bootmod definition
  x86 setup: refactor efi, pvh and multiboot entrypoints to new boot
    info

 xen/arch/arm/efi/efi-boot.h               |   6 +
 xen/arch/arm/include/asm/bootinfo.h       |  20 ++
 xen/arch/arm/include/asm/setup.h          |  11 +-
 xen/arch/riscv/include/asm/bootinfo.h     |  20 ++
 xen/arch/x86/boot/defs.h                  |  10 +
 xen/arch/x86/boot/reloc.c                 | 192 ++++++++++++------
 xen/arch/x86/bzimage.c                    |  10 +-
 xen/arch/x86/cpu/microcode/core.c         | 149 ++++++++------
 xen/arch/x86/dom0_build.c                 |  10 +-
 xen/arch/x86/efi/efi-boot.h               |  95 +++++----
 xen/arch/x86/guest/xen/pvh-boot.c         |  65 ++++--
 xen/arch/x86/hvm/dom0_build.c             |  44 ++--
 xen/arch/x86/include/asm/boot.h           |  55 +++++
 xen/arch/x86/include/asm/bootinfo.h       |  47 +++++
 xen/arch/x86/include/asm/bzimage.h        |   2 +-
 xen/arch/x86/include/asm/dom0_build.h     |  13 +-
 xen/arch/x86/include/asm/guest/pvh-boot.h |   6 +-
 xen/arch/x86/include/asm/microcode.h      |   7 +-
 xen/arch/x86/include/asm/setup.h          |   7 +-
 xen/arch/x86/pv/dom0_build.c              |  32 +--
 xen/arch/x86/setup.c                      | 232 ++++++++++++----------
 xen/common/efi/boot.c                     |   4 +-
 xen/include/xen/bootinfo.h                |  62 ++++++
 xen/include/xen/types.h                   |  11 +
 xen/include/xsm/xsm.h                     |  28 +--
 xen/xsm/xsm_core.c                        |  47 +++--
 xen/xsm/xsm_policy.c                      |  58 +++---
 27 files changed, 821 insertions(+), 422 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/bootinfo.h
 create mode 100644 xen/arch/riscv/include/asm/bootinfo.h
 create mode 100644 xen/arch/x86/include/asm/boot.h
 create mode 100644 xen/arch/x86/include/asm/bootinfo.h
 create mode 100644 xen/include/xen/bootinfo.h

-- 
2.25.1


