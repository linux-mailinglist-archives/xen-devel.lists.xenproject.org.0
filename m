Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3D9857CCE
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 13:40:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682186.1061275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raxV2-0006qJ-GW; Fri, 16 Feb 2024 12:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682186.1061275; Fri, 16 Feb 2024 12:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raxV2-0006pQ-Az; Fri, 16 Feb 2024 12:39:28 +0000
Received: by outflank-mailman (input) for mailman id 682186;
 Fri, 16 Feb 2024 12:39:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=acXU=JZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raxV0-0006oJ-FQ
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 12:39:26 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6abd6fc5-ccc8-11ee-8a4f-1f161083a0e0;
 Fri, 16 Feb 2024 13:39:25 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a3d01a9a9a2so184695566b.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2024 04:39:25 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lj8-20020a170907188800b00a3db1734b92sm1121608ejc.43.2024.02.16.04.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 04:39:23 -0800 (PST)
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
X-Inumbo-ID: 6abd6fc5-ccc8-11ee-8a4f-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708087164; x=1708691964; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ix0GNJqsQY7P5B/iyQn8vNTQQD332oz4c2RQO4AEM3c=;
        b=FHxtpXhMfDDQRPM5OaH+TxT1r4tIxNHpeAP5dlDfKqBb2IHlusXfQGgZKhpYnzSHMS
         lVs8JJgW1DXRjRlP+QpsqeVMFmHTLPu4IinCUYnH5+3+uzaezD+muNAo8EL6iNGn1gyy
         hDOd1Vfgebfjxix3XBqzbA7wi90I9qrTeXNzzwEHiiKypL0c+eY/gxNBm01DZwuQjsoT
         RNB8fQnfyaHWY+L3K4JdTqlQdkH+1q1Yh7fyPTJzzaU1TJnuCzSCCOPqJK/dRRMWn2Sv
         sm4IQbhdhZBBjryIcdvDRCOqc1BvuBT8hFMG0yViARRXn76mn11IQDC0wb/z2tbZ32Jo
         rq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708087164; x=1708691964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ix0GNJqsQY7P5B/iyQn8vNTQQD332oz4c2RQO4AEM3c=;
        b=UT9KyguENxAsYVDYD2ntITVK5gM9XpRtbuAPyUAjlLIcfBSyBhL3hbumLTAvhXlrfd
         izD3WMySnj0eBOeXYoJftmnCGYJ8SXtEmDKUwmqxzYRjBCdBosD9t7eOIUj37XqzQ74F
         uVypA+FGEvzbV7VoXVKU7NVCRe0VlA+zIKTXMLN11Fmd23Xkwt9mWxzkME1CDmBhbcOX
         ATbxFQf/I7Gv6HTE9IO4bBw3B5qkOJYNxLIEVL+MVXs0Y2Fc3hzZxNSjjGpJkDYEE23j
         CAyCaynuswsj5wQy/fGzaAACpKBOW2HvVBCi8iNpNc8r9pxXMvh6ctp5NelR+T444W+p
         ByIQ==
X-Gm-Message-State: AOJu0YwqMsHKtxwlSkSaqrSrBA7iTjhdogrDfx4Avvz6BWi3PxmXbjkh
	MMRYt7D1iKflPGeRSA4HzCjzgMshm2lA+4WFFHU2VNjaXiIOjBiPpAZwdd2U
X-Google-Smtp-Source: AGHT+IGPCybVo7NkOXXjlMcCpidXhjfdiZDGsbEWe65qPa/TuwavZOpceHWpFx4lMGwHkbrbWL+fFQ==
X-Received: by 2002:a17:906:1718:b0:a3c:e81a:9c35 with SMTP id c24-20020a170906171800b00a3ce81a9c35mr3534774eje.73.1708087163512;
        Fri, 16 Feb 2024 04:39:23 -0800 (PST)
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
	Wei Liu <wl@xen.org>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v9 0/7]  Introduce generic headers
Date: Fri, 16 Feb 2024 13:39:12 +0100
Message-ID: <cover.1708086091.git.oleksii.kurochko@gmail.com>
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
Changes in V9:
 - Drop the patch "[PATCH v8 1/7] automation: ensure values in EXTRA_FIXED_RANDCONFIG
   are separated by new line" as better solution was suggested.
 - introduce new follow-up patch for "xen/asm-generic: introduce generic device.h"
   ( it can be merged with patches 4,5 of this patch series ).
 - All other changes please find in revision log to a patch.
---
Changes in V8:
 - Add Acked-by Acked-by: Tamas K Lengyel <tamas@tklengyel.com> for patches:
    [PATCH v7 4/7] xen/asm-generic: ifdef inclusion of <asm/mem_access.h>
    [PATCH v7 3/7] xen/asm-generic: introduce stub header monitor.h
 - Update the commit messages for patches:
    [PATCH v7 5/7] xen/asm-generic: introduce generic device.h
    [PATCH v7 6/7] xen/arm: switch Arm to use asm-generic/device.h
 - Drop #ifdef HAS_PCI in asm-generic/device.h to be consistent with other pci-related
   things in the header.
 - Code styles fixes.    
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
  automation: introduce fixed randconfig for RISC-V
  xen/asm-generic: introduce stub header monitor.h
  xen/asm-generic: ifdef inclusion of <asm/mem_access.h>
  xen/asm-generic: introduce generic device.h
  xen/arm: switch Arm to use asm-generic/device.h
  xen/ppc: switch PPC to use asm-generic/device.h
  xen/asm-generic: fold struct devarch into struct dev

 automation/gitlab-ci/build.yaml               |  14 ++-
 xen/arch/arm/device.c                         |   5 +
 xen/arch/arm/domain_build.c                   |   2 +-
 xen/arch/arm/gic-v2.c                         |   4 +-
 xen/arch/arm/gic-v3.c                         |   6 +-
 xen/arch/arm/gic.c                            |   4 +-
 xen/arch/arm/include/asm/Makefile             |   1 +
 xen/arch/arm/include/asm/monitor.h            |  25 +---
 xen/arch/arm/p2m.c                            |   1 +
 xen/arch/arm/traps.c                          |   1 +
 xen/arch/arm/xen.lds.S                        |   2 +
 xen/arch/ppc/configs/ppc64_defconfig          |   1 +
 xen/arch/ppc/include/asm/Makefile             |   1 +
 xen/arch/ppc/include/asm/device.h             |  53 --------
 xen/arch/ppc/include/asm/mem_access.h         |   5 -
 xen/arch/ppc/include/asm/monitor.h            |  28 +----
 xen/arch/ppc/stubs.c                          |   8 --
 xen/arch/riscv/configs/tiny64_defconfig       |   1 +
 xen/drivers/passthrough/arm/smmu.c            |  12 +-
 .../asm => include/asm-generic}/device.h      | 113 ++++++++++--------
 xen/include/asm-generic/monitor.h             |  64 ++++++++++
 xen/include/xen/mem_access.h                  |   2 +
 22 files changed, 170 insertions(+), 183 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/device.h
 delete mode 100644 xen/arch/ppc/include/asm/mem_access.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/device.h (70%)
 create mode 100644 xen/include/asm-generic/monitor.h

-- 
2.43.0


