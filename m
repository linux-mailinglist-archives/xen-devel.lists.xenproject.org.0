Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A18C8014C8
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 21:48:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645737.1007999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9AQr-0007GV-RV; Fri, 01 Dec 2023 20:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645737.1007999; Fri, 01 Dec 2023 20:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9AQr-0007ER-O9; Fri, 01 Dec 2023 20:48:17 +0000
Received: by outflank-mailman (input) for mailman id 645737;
 Fri, 01 Dec 2023 20:48:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yVFl=HM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r9AQq-0007Cg-6V
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 20:48:16 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2db8375-908a-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 21:48:15 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c9b5c12898so32468871fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 12:48:15 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 i18-20020a2ea372000000b002c6ed7e546esm511142ljn.124.2023.12.01.12.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 12:48:13 -0800 (PST)
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
X-Inumbo-ID: f2db8375-908a-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701463694; x=1702068494; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MqJ/uO0Md37RBsPopiP5cQEJm40LrqWs0MJlj9zt0vs=;
        b=BtHFfofFq8MIYvdb1PN1e97mRe20pjM5uw6sFUIFpqsOeCGxW5lGcWqGr1OtG9cGIG
         T/+49nIxe4+q7Hf2v+DImKpA1n8T4d+5EIl35+NbG/SZg5PDaDnalbrlttDLdUHtrX+v
         YW4f6Bc+DigFiMiHyFn4CEgxiPSIkd61H+kRFw/0J6ieWtRA0HUlFHkxuPEZkGblfX+/
         zrSZ2YBeSJtPD5AEFnHxkQ8A3xpglPdTV9hAD6joWUwmbD+F+4zchsBYidxVLb6gTCmt
         2KSKg4xdnSWxPtrvLWdnsIZEERXW551fiBUQo/DD85EkFZSDzcjhlcgNBAPFSZonhH6T
         VEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701463694; x=1702068494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqJ/uO0Md37RBsPopiP5cQEJm40LrqWs0MJlj9zt0vs=;
        b=uwPmRe1n0BMDpPWRtsIpCe6T6sBkdYZ4rPIbaz+WEs54wh7oJvemWcB5oXmQqdX2jD
         ZQKQQ2vfGKB/V92CKSNu0qXpIaAdVJ6ptYL80w8FZwYbpeyVXPxuEoxxr5aeXjN58t6r
         DPEAjlSIkobma5R6tUAhefwprBM05QG/A2em7e4Qvs8IV05rAVQVyRGWrblt7/1CdPUB
         1nVc8PijPKRG8p2+Q5aAChJKOFB7C0dm/HAPgZlYvqaBlb8QkWaU2Rag7cWbc0lZ74vV
         6Vfhzi0WWoDD2osyVbqIhv32S/ElICRmaskIQYJ7mSOJuuiOpysu8+iOw/kYbxOBLxnY
         L64g==
X-Gm-Message-State: AOJu0Yzis1tJsDBgeszrho49SDp5r961QVhzNJYme5U47SBBh/0JH5dr
	xyk9VFt84R5/COvSQ9/3AvphDJdiI8GR7g==
X-Google-Smtp-Source: AGHT+IE73nT7gn6xZH/ptiC3DU6xw9vAmh3fNOX7mVYMrxdIkS67sCmCTNh83eXU0/Vcfd2MIlucMQ==
X-Received: by 2002:a2e:8257:0:b0:2c5:56b:cbd1 with SMTP id j23-20020a2e8257000000b002c5056bcbd1mr1159689ljh.10.1701463693884;
        Fri, 01 Dec 2023 12:48:13 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
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
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v5 0/7] Introduce generic headers
Date: Fri,  1 Dec 2023 22:48:03 +0200
Message-ID: <cover.1701453087.git.oleksii.kurochko@gmail.com>
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
  xen/asm-generic: introduce generic div64.h header
  xen/asm-generic: introduce stub header monitor.h
  xen/asm-generic: introduce stub header numa.h
  xen/asm-generic: introduce stub header softirq.h
  xen: ifdef inclusion of <asm/grant_table.h> in <xen/grant_table.h>
  xen/asm-generic: ifdef inclusion of <asm/mem_access.h>
  xen/asm-generic: introduce generic device.h

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
 xen/arch/ppc/include/asm/Makefile             |   4 +
 xen/arch/ppc/include/asm/device.h             |  53 --------
 xen/arch/ppc/include/asm/div64.h              |  14 --
 xen/arch/ppc/include/asm/grant_table.h        |   5 -
 xen/arch/ppc/include/asm/mem_access.h         |   5 -
 xen/arch/ppc/include/asm/monitor.h            |  28 +---
 xen/arch/ppc/include/asm/numa.h               |  26 ----
 xen/arch/ppc/include/asm/softirq.h            |   8 --
 xen/arch/x86/include/asm/Makefile             |   1 +
 xen/arch/x86/include/asm/div64.h              |  14 --
 xen/common/Kconfig                            |   3 +-
 .../asm => include/asm-generic}/device.h      | 125 +++++++++++-------
 xen/include/asm-generic/div64.h               |  27 ++++
 xen/include/asm-generic/monitor.h             |  57 ++++++++
 .../asm => include/asm-generic}/numa.h        |  16 ++-
 .../asm => include/asm-generic}/softirq.h     |   7 +-
 xen/include/xen/grant_table.h                 |   3 +
 xen/include/xen/mem_access.h                  |   2 +
 28 files changed, 219 insertions(+), 252 deletions(-)
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


