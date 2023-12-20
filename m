Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 017D481A0C0
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 15:08:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657913.1027008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxFZ-0004oG-Se; Wed, 20 Dec 2023 14:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657913.1027008; Wed, 20 Dec 2023 14:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxFZ-0004kv-M1; Wed, 20 Dec 2023 14:08:41 +0000
Received: by outflank-mailman (input) for mailman id 657913;
 Wed, 20 Dec 2023 14:08:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RD2L=H7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFxFX-0004kf-GG
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 14:08:39 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44dd3d20-9f41-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 15:08:37 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2cc64629c16so52576921fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 06:08:37 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d19-20020a05651c089300b002cc83c337absm593892ljq.70.2023.12.20.06.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 06:08:35 -0800 (PST)
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
X-Inumbo-ID: 44dd3d20-9f41-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703081316; x=1703686116; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c0b7Jj9bXlxC/61yUeAc+z6kC4uXaUkzoELjy2trkrY=;
        b=mVgKFzltrrA+XEt9mgny73+M98xZy6MYn8HsxQMaWOPISWbfQ8HakmS45XbenWOhji
         FU1B3WTPHERn+fItq9ZW3aHKpcwcwBHp40Cka6vTKFPD+9czVE03LAb6VKp24xbC/ioG
         M3ukgMis07TM8ZXfHK8rhNSy1JlA9BVe1o3vINJOBm9qAEXSW7/9ZnjlCRE2++nFI10e
         g2K9R6TN6tHFbUW8pAKf4h4MBoD6U2Zu6H7+HtkkXySNnqf7a37am+9X7A+PdvgrdFi1
         wUYMrTwf8kzjDTUA1hphGeacKLU8VLXd3CryK8EueelEkBgj6P6O/1vGzDy0zXXMW6iM
         Aa2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703081316; x=1703686116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0b7Jj9bXlxC/61yUeAc+z6kC4uXaUkzoELjy2trkrY=;
        b=UemFn8LmURo4ASvK3+vxIt1Za7Szr7g7zxBLOC0rxPzvZTcH12bhtyAxFbuu8kdPDB
         NGxigeOwlAuJAtnZ/J6NleenGwe0+WOigHTGyYEUr88857h7OtKHjo5PeQIkuVw6nb6y
         B5yMHu3kl9dRVWT234pjLm/xoA+x9vmIUUaetVCN1e4FcRR0iFCw/zZn34cFwgzTWwvZ
         2gijmX2uFoIRoZktbylciXI2P+wr0IDoS1EfFjmUwakCMc9rQCaEreEa/LXgUi7eC4ou
         k2ZbkJ/VoBzfVY89hopFeNMxyTY7KdX8NkLpl24jY3TMo1xsPKgkbFFRtgKS5tHIG4KO
         de0g==
X-Gm-Message-State: AOJu0Yw8lnlfR/l4dI1aGFpxDt2MIYr97O+TBuHENbhOJxHyzCml47Zv
	10J72QdJ4XWHQS+khFRUaCBADhnlSuXYAA==
X-Google-Smtp-Source: AGHT+IHnNbNZ12xjOQsnTi0RMGxBmCMa1guxozh7Tcl9mJ41uGf2be1/65GijkqQmQCMGZu0CbKPcA==
X-Received: by 2002:a2e:a408:0:b0:2cc:6641:3edb with SMTP id p8-20020a2ea408000000b002cc66413edbmr3265056ljn.12.1703081315635;
        Wed, 20 Dec 2023 06:08:35 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v6 0/9] Introduce generic headers
Date: Wed, 20 Dec 2023 16:08:22 +0200
Message-ID: <cover.1703072575.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some headers are common between several architectures, so the current patch series
provide them.

Another one reason to have them as generic is a simplification of adding support
necessary to make a complete Xen build as it was/is being done in the patch series [1]
and [2].

Also, instead of providing generic/stub headers, it was used
"#ifdef CONFIG_* #include <asm/*.h> #endif" instead of providing empty headers.

This patch series is a pre-requisite for "Enable build of full Xen for RISC-V" [3].

[1] https://lore.kernel.org/xen-devel/cover.1694543103.git.sanastasio@raptorengineering.com/
[2] https://lore.kernel.org/xen-devel/cover.1692181079.git.oleksii.kurochko@gmail.com/
[3] https://lore.kernel.org/xen-devel/cover.1700761381.git.oleksii.kurochko@gmail.com/

---
Changes in V6:
 - Fix the build script to work properly with EXTRA_FIXED_RANDCONFIG.
 - Introduce separate randconfig yaml with fixed configs for RISC-V.
 - Disable CONFIG_GRANT_TABLE and CONFIG_MEM_ACCESS for PPC and RISC-V.
 - Remove change in Kconfig/common for CONFIG_GRANT_TABLE and CONFIG_MEM_ACCESS.
 - Rebase on top of the latest staging. 
---
Changes in V5:
 - Update the patch series message as patch related to delay.h was merged.
 - Rebase on top of staging because half of the patches of the patch series were
   merged to staging branch.
 - Add A-by for some of the patches.
 - Add "depends on X86 || Arm" for CONFIG_GRANT_TABLE and CONFIG_MEM_ACCESS to be
   sure it won't be turned on by randconfig in CI.
 - Partly switch Arm and PPC to asm-generic/monitor.h.
 - Some other minor changes
---
Changes in V4:
 - Update the cover letter message
 - Add Reviewed-by/Acked-by for patches:
    [PATCH v3 01/14] xen/asm-generic: introduce stub header paging.h
    [PATCH v3 03/14] xen/asm-generic: introduce generic hypercall.h
    [PATCH v3 04/14] xen/asm-generic: introduce generic header iocap.h
    [PATCH v3 05/14] xen/asm-generic: introduce stub header <asm/random.h>
    [PATCH v3 06/14] xen/asm-generic: introduce generic header percpu.h
    [PATCH v3 07/14] xen/asm-generic: introduce generalized hardirq.h
    [PATCH v3 08/14] xen/asm-generic: introduce generic div64.h header
    [PATCH v3 09/14] xen/asm-generic: introduce generic header altp2m.h
    [PATCH v3 10/14] xen/asm-generic: introduce stub header monitor.h
    [PATCH v3 11/14] xen/asm-generic: introduce stub header numa.h
    [PATCH v3 12/14] xen/asm-generic: introduce stub header softirq.h
 - Fix some code style and minor issues.
 - Use asm-generic version of device.h for Arm and PPC.
---
Changes in V3:
 - Update the commit message of the cover letter.
 - Drop the following patch as it can be arch-specific enough:
   * [PATCH v2 09/15] xen/asm-generic: introduce generic header smp.h
 - Drop correspondent arch specific headers and use asm-generic version of
   a header.
 - Back to the patch series patches:
   * xen: ifdef inclusion of <asm/grant_table.h> in <xen/grant_table.h>
   * xen/asm-generic: ifdef inclusion of <asm/mem_access.h>
---
Changes in V2:
 - Update the commit message of the cover letter.
 - Drop the following patches because they are arch-specific or was sent as a separate patch:
   - xen/asm-generic: introduce stub header event.h
	 - xen/asm-generic: introduce stub header spinlock.h
	 - [PATCH v1 03/29] xen/asm-generic: introduce stub header cpufeature.h
	 - [PATCH v1 07/29] xen/asm-generic: introduce stub header guest_atomics.h
	 - [PATCH v1 10/29] xen/asm-generic: introduce stub header iommu.h
	 - [PATCH v1 12/29] xen/asm-generic: introduce stub header pci.h because separate patch was sent [5]
	 - [PATCH v1 14/29] xen/asm-generic: introduce stub header setup.h
	 - [PATCH v1 15/29] xen/asm-generic: introduce stub header xenoprof.h because of [3].
	 - [PATCH v1 16/29] xen/asm-generic: introduce stub header flushtlb.h
	 - [PATCH v1 22/29] xen/asm-generic: introduce stub header delay.h because of [3]
	 - [PATCH v1 23/29] xen/asm-generic: introduce stub header domain.h
	 - [PATCH v1 24/29] xen/asm-generic: introduce stub header guest_access.h
	 - [PATCH v1 25/29] xen/asm-generic: introduce stub header irq.h ( probably not so generic as I expected, I'll back to it if it will be necessary in the future )
	 - [PATCH v1 28/29] xen/asm-generic: introduce stub header p2m.h ( probably not so generic as I expected, I'll back to it if it will be necessary in the future )
 - For the rest of the patches please look at changes for each patch separately.

 ---

Oleksii Kurochko (9):
  automation: ensure values in EXTRA_FIXED_RANDCONFIG are separated by
    new line
  automation: introduce fixed randconfig for RISC-V
  xen/asm-generic: introduce generic div64.h header
  xen/asm-generic: introduce stub header monitor.h
  xen/asm-generic: introduce stub header numa.h
  xen/asm-generic: introduce stub header softirq.h
  xen: ifdef inclusion of <asm/grant_table.h> in <xen/grant_table.h>
  xen/asm-generic: ifdef inclusion of <asm/mem_access.h>
  xen/asm-generic: introduce generic device.h

 automation/gitlab-ci/build.yaml               |   8 +-
 .../gitlab-ci/riscv-fixed-randconfig.yaml     |   7 +
 automation/scripts/build                      |   6 +-
 xen/arch/arm/device.c                         |  15 ++-
 xen/arch/arm/domain_build.c                   |   3 +-
 xen/arch/arm/gic-v2.c                         |   4 +-
 xen/arch/arm/gic-v3.c                         |   6 +-
 xen/arch/arm/gic.c                            |   4 +-
 xen/arch/arm/include/asm/Makefile             |   3 +
 xen/arch/arm/include/asm/div64.h              |   8 +-
 xen/arch/arm/include/asm/monitor.h            |  28 +---
 xen/arch/arm/p2m.c                            |   1 +
 xen/arch/arm/traps.c                          |   1 +
 xen/arch/ppc/configs/ppc64_defconfig          |   1 +
 xen/arch/ppc/include/asm/Makefile             |   4 +
 xen/arch/ppc/include/asm/device.h             |  53 --------
 xen/arch/ppc/include/asm/div64.h              |  14 --
 xen/arch/ppc/include/asm/grant_table.h        |   5 -
 xen/arch/ppc/include/asm/mem_access.h         |   5 -
 xen/arch/ppc/include/asm/monitor.h            |  28 +---
 xen/arch/ppc/include/asm/numa.h               |  26 ----
 xen/arch/ppc/include/asm/softirq.h            |   8 --
 xen/arch/riscv/configs/tiny64_defconfig       |   1 +
 xen/arch/x86/include/asm/Makefile             |   1 +
 xen/arch/x86/include/asm/div64.h              |  14 --
 .../asm => include/asm-generic}/device.h      | 125 +++++++++++-------
 xen/include/asm-generic/div64.h               |  27 ++++
 xen/include/asm-generic/monitor.h             |  57 ++++++++
 .../asm => include/asm-generic}/numa.h        |  16 ++-
 .../asm => include/asm-generic}/softirq.h     |   7 +-
 xen/include/xen/grant_table.h                 |   3 +
 xen/include/xen/mem_access.h                  |   2 +
 32 files changed, 234 insertions(+), 257 deletions(-)
 create mode 100644 automation/gitlab-ci/riscv-fixed-randconfig.yaml
 delete mode 100644 xen/arch/ppc/include/asm/device.h
 delete mode 100644 xen/arch/ppc/include/asm/div64.h
 delete mode 100644 xen/arch/ppc/include/asm/grant_table.h
 delete mode 100644 xen/arch/ppc/include/asm/mem_access.h
 delete mode 100644 xen/arch/ppc/include/asm/numa.h
 delete mode 100644 xen/arch/ppc/include/asm/softirq.h
 delete mode 100644 xen/arch/x86/include/asm/div64.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/device.h (79%)
 create mode 100644 xen/include/asm-generic/div64.h
 create mode 100644 xen/include/asm-generic/monitor.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/numa.h (67%)
 rename xen/{arch/arm/include/asm => include/asm-generic}/softirq.h (56%)

-- 
2.43.0


