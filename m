Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5C483DDC0
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 16:42:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672089.1045755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOLO-0002o1-GG; Fri, 26 Jan 2024 15:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672089.1045755; Fri, 26 Jan 2024 15:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOLO-0002lc-Dc; Fri, 26 Jan 2024 15:42:14 +0000
Received: by outflank-mailman (input) for mailman id 672089;
 Fri, 26 Jan 2024 15:42:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DqdW=JE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rTOLM-0002k9-Tj
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 15:42:12 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78b3e608-bc61-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 16:42:11 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-51025cafb51so798371e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 07:42:11 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 q5-20020ac25105000000b0050e7ec49881sm208351lfb.21.2024.01.26.07.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 07:42:10 -0800 (PST)
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
X-Inumbo-ID: 78b3e608-bc61-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706283731; x=1706888531; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NVBkI04VCHtY+BjWYOuLlcsihydzSeVqGac1GglpNUk=;
        b=HSpOc6ffqh0GL+CgEcqfQF9YhLAdrUhUhnWmFrjdBQEoQjuStJYaro1TISd7vyVw54
         dmCWbT26oDiyxhOYfi1XAhNNzeAQ+y8VadYcwlpcNWNCVPsnCWqBll014IS9pvam4Aq2
         FHAYfAXx7g9DpjQCA4kZmq1nkhZX9PZU45iGdd4e4ReOAantPg6twKnTLVup1B+n5pKO
         FlnT3QxCpw733nVXmUsj4D4qmIdueS1nFlw/S00+CpVAzTkIoWKv05meX2yt/quXzpjr
         HF77NCN+82IwqaBe0ChckmgBq0NclkLnfCTytm8LNr2FFh18KddonLtGfwLwdmTnDbs3
         YXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706283731; x=1706888531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVBkI04VCHtY+BjWYOuLlcsihydzSeVqGac1GglpNUk=;
        b=uCl+dOsTwEi5pxbX0N7La1jMYeSr8T2/cby25JEhX/6PQ7ETehlnBfNEaM2B7wlxm2
         ExMfAXoJ170B4EIJUie+MIHMOsAbFlhW9yniKtShxi+Wm3aZw5X1D5X0GzzUhCMCpBOF
         E3fv/A/uZ7d0s4E8DJGuVBSL/arLCPBDQKaJwcje9vh5iKLCigbxKeEewwze4ZxWceeA
         TtxwYS19SNVDq0To71XMOfo4fPJns4T4hzONV0xwpYHHVN8BLVyw2bn1Kg2n/DpNeGKK
         5o62uQeyAVRIxhdg2AR/70RHmMptgpy7XT4s2D7sx5xlcPyzWlIsAgMPej6nG3cMjd+6
         BD4g==
X-Gm-Message-State: AOJu0YxkVIFLbGCw/CPqiSDmovPST//wJeK2UDpylG8G8JC/XRgv08RV
	K7hPXW2vy0x7IoMObhOFoU/3ZNrBpm/vUM+E13pqdc19RcLJFGPzQO24VlAS
X-Google-Smtp-Source: AGHT+IH6B7uxFwctX6Ms1Hjoj3ZpOH+Arws05ZOYwWPBS1Cf4jUxNqO1vxEZM29T7iz1HGGGGoDkvA==
X-Received: by 2002:a05:6512:e99:b0:50e:6032:984b with SMTP id bi25-20020a0565120e9900b0050e6032984bmr1096838lfb.110.1706283730958;
        Fri, 26 Jan 2024 07:42:10 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 0/7] Introduce generic headers
Date: Fri, 26 Jan 2024 17:42:00 +0200
Message-ID: <cover.1706281994.git.oleksii.kurochko@gmail.com>
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
Changes in V7:
 - The following patches were dropped because of rebasing as they were merged
   to staging:
   - [PATCH v6 3/9] xen/asm-generic: introduce generic div64.h header
   - [PATCH v6 6/9] xen/asm-generic: introduce stub header softirq.h
   - [PATCH v6 7/9] xen: ifdef inclusion of <asm/grant_table.h> in <xen/grant_table.h>
   - [PATCH v6 8/9] xen/asm-generic: ifdef inclusion of <asm/mem_access.h>
- [PATCH v6 5/9] xen/asm-generic: introduce stub header numa.h was dropped becaus of
  the patch: "[PATCH v2] NUMA: no need for asm/numa.h when !NUMA"
- Drop definition of arch_monitor_domctl_event for PPC.
- define arch_monitor_domctl_event in asm-generic/monitor.h.
- Add "define HAS_ARCH_MONITOR_DOMCTL_EVENT" in arm/.../monitor.h as it has arch
  specific implementation.
- keeping DEVICE_PCI_HOSTBRIDGE available for every build based on the reply:
    https://lore.kernel.org/xen-devel/926a5c12-7f02-42ec-92a8-1c82d060c710@xen.org/
- add comment above enum device_type.h with explanation about DEV_TYPE_MAX.        
- drop #ifdef HAS_PCI around "(device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE))" in ARM code.
- separate patch  "[PATCH v6 9/9] xen/asm-generic: introduce generic device.h" into 3 patches.
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
Oleksii Kurochko (7):
  automation: ensure values in EXTRA_FIXED_RANDCONFIG are separated by
    new line
  automation: introduce fixed randconfig for RISC-V
  xen/asm-generic: introduce stub header monitor.h
  xen/asm-generic: ifdef inclusion of <asm/mem_access.h>
  xen/asm-generic: introduce generic device.h
  xen/arm: switch Arm to use asm-generic/device.h
  xen/ppc: switch PPC to use asm-generic/device.h

 automation/gitlab-ci/build.yaml               |   8 +-
 .../gitlab-ci/riscv-fixed-randconfig.yaml     |   7 +
 automation/scripts/build                      |   6 +-
 xen/arch/arm/device.c                         |   5 +
 xen/arch/arm/domain_build.c                   |   2 +-
 xen/arch/arm/gic-v2.c                         |   4 +-
 xen/arch/arm/gic-v3.c                         |   6 +-
 xen/arch/arm/gic.c                            |   4 +-
 xen/arch/arm/include/asm/Makefile             |   1 +
 xen/arch/arm/include/asm/monitor.h            |  25 +---
 xen/arch/arm/p2m.c                            |   1 +
 xen/arch/arm/traps.c                          |   1 +
 xen/arch/ppc/configs/ppc64_defconfig          |   1 +
 xen/arch/ppc/include/asm/Makefile             |   1 +
 xen/arch/ppc/include/asm/device.h             |  53 --------
 xen/arch/ppc/include/asm/mem_access.h         |   5 -
 xen/arch/ppc/include/asm/monitor.h            |  28 +---
 xen/arch/ppc/stubs.c                          |   8 --
 xen/arch/riscv/configs/tiny64_defconfig       |   1 +
 .../asm => include/asm-generic}/device.h      | 128 ++++++++++++------
 xen/include/asm-generic/monitor.h             |  64 +++++++++
 xen/include/xen/mem_access.h                  |   2 +
 22 files changed, 186 insertions(+), 175 deletions(-)
 create mode 100644 automation/gitlab-ci/riscv-fixed-randconfig.yaml
 delete mode 100644 xen/arch/ppc/include/asm/device.h
 delete mode 100644 xen/arch/ppc/include/asm/mem_access.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/device.h (76%)
 create mode 100644 xen/include/asm-generic/monitor.h

-- 
2.43.0


