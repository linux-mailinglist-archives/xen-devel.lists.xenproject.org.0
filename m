Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 626347FA21E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:14:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642117.1001295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMg-0005ZV-Ta; Mon, 27 Nov 2023 14:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642117.1001295; Mon, 27 Nov 2023 14:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMg-0005XK-Qv; Mon, 27 Nov 2023 14:13:34 +0000
Received: by outflank-mailman (input) for mailman id 642117;
 Mon, 27 Nov 2023 14:13:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+WV=HI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7cMf-0005XE-1D
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:13:33 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25041995-8d2f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 15:13:31 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5094cb3a036so5767495e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 06:13:31 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 x29-20020ac259dd000000b00507b869b068sm1494100lfn.302.2023.11.27.06.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 06:13:30 -0800 (PST)
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
X-Inumbo-ID: 25041995-8d2f-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701094411; x=1701699211; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XAsoAAzEY3uwUk91ZdsbSK4UNtVB/IpfbbALLJMh+3w=;
        b=mBwlmc1DsUj6AAqcoZ06fqpZ8IYrnBIV5zBYY4YSQBOXLRfufbncEaKeYeL8EBmuGV
         MIsocwnlY672DMiT1PPGG6xnRPaNwEiCaM6zOsocv9AmwlxLeMHdLAF4i0Zn08ba1jRg
         QPvLxhZt8/opXHqxNEGb6aFVjPSuXEW6Py+d9dbLRTK81Jr9Pu7Aha1547fDgOLZ+jVW
         IS7384s4AkSetxun9XFKOzB73LkJRFdD05EXNs7wp1xv5E2p8mpo3TMRz7UepHofpo+o
         bNhAkjW/SOyEp2KoWer7zfbKm0Wbwdzzd3PMAGoNM6f9Y+w6MmnLJLelcLWYltQb3ul8
         jDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094411; x=1701699211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XAsoAAzEY3uwUk91ZdsbSK4UNtVB/IpfbbALLJMh+3w=;
        b=rnAumTPFDOd/O+iq9cYpwMWDe2st4qfjqcKeaGTbeQ2VFzLaxy5FuZpQxS5FGexj3R
         jwlCED1VFw0/mtjqVfHRKxmqj2fBQ/J7lStAyHSXbewTY2EnYkwc49FnE/ODU3Tgj+bZ
         Oeu5AoKaWxIHS2hvnhLxyppo2g63jSuaCDwyfk+yUFDvnn0d+rxq8vn6kP2UTIzetGip
         J4HbDeziE6idCJutucqeonak1NOAKet3kaMH1+TpP1wr/qWuq/6USQZ60R9EGH+jui0i
         w4jODLqb1iEKyD4EFzBxi/4RB7m5mXq+fjmn3vqvOAz+TOSEFAtGyWPu6Ty68yuQqnlI
         Qo0A==
X-Gm-Message-State: AOJu0Yweir72nEYkBUNt6kVG+CnYV4NXrN0drFymN/IlXbvU+SAdDzTG
	CBMj0sKXBu8eE5ZWFi/tvphWZff5s2RBvQ==
X-Google-Smtp-Source: AGHT+IGhrgOeyEXelJDSekysLRtyy97vSLB2q3Nq7QHR16RDovymZotL8e0hMLjgONLgvQxAjR8XVA==
X-Received: by 2002:a19:f505:0:b0:507:9a49:3f23 with SMTP id j5-20020a19f505000000b005079a493f23mr7486380lfb.18.1701094410719;
        Mon, 27 Nov 2023 06:13:30 -0800 (PST)
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
Subject: [PATCH v4 00/14]  Introduce generic headers
Date: Mon, 27 Nov 2023 16:13:13 +0200
Message-ID: <cover.1701093907.git.oleksii.kurochko@gmail.com>
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

Patch related to delay.h [3] was sent separately.

This patch series is a pre-requisite for "Enable build of full Xen for RISC-V" [4].

[1] https://lore.kernel.org/xen-devel/cover.1694543103.git.sanastasio@raptorengineering.com/
[2] https://lore.kernel.org/xen-devel/cover.1692181079.git.oleksii.kurochko@gmail.com/
[3] https://lore.kernel.org/xen-devel/3d55bce44bd6ab9973cbe0ea2fc136cc44d35df2.1698759633.git.oleksii.kurochko@gmail.com/
[4] https://lore.kernel.org/xen-devel/cover.1700761381.git.oleksii.kurochko@gmail.com/

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

Oleksii Kurochko (14):
  xen/asm-generic: introduce stub header paging.h
  xen/asm-generic: introduce generic device.h
  xen/asm-generic: introduce generic hypercall.h
  xen/asm-generic: introduce generic header iocap.h
  xen/asm-generic: introduce stub header <asm/random.h>
  xen/asm-generic: introduce generic header percpu.h
  xen/asm-generic: introduce generalized hardirq.h
  xen/asm-generic: introduce generic div64.h header
  xen/asm-generic: introduce generic header altp2m.h
  xen/asm-generic: introduce stub header monitor.h
  xen/asm-generic: introduce stub header numa.h
  xen/asm-generic: introduce stub header softirq.h
  xen: ifdef inclusion of <asm/grant_table.h> in <xen/grant_table.h>
  xen/asm-generic: ifdef inclusion of <asm/mem_access.h>

 xen/arch/arm/device.c                         |  15 ++-
 xen/arch/arm/domain_build.c                   |   3 +-
 xen/arch/arm/gic-v2.c                         |   4 +-
 xen/arch/arm/gic-v3.c                         |   6 +-
 xen/arch/arm/gic.c                            |   4 +-
 xen/arch/arm/include/asm/Makefile             |   9 ++
 xen/arch/arm/include/asm/altp2m.h             |  39 ------
 xen/arch/arm/include/asm/current.h            |   3 +
 xen/arch/arm/include/asm/div64.h              |   8 +-
 xen/arch/arm/include/asm/paging.h             |  16 ---
 xen/arch/arm/include/asm/random.h             |   9 --
 xen/arch/arm/p2m.c                            |   1 +
 xen/arch/arm/traps.c                          |   1 +
 xen/arch/ppc/include/asm/Makefile             |  12 ++
 xen/arch/ppc/include/asm/altp2m.h             |  25 ----
 xen/arch/ppc/include/asm/current.h            |   6 +
 xen/arch/ppc/include/asm/device.h             |  53 --------
 xen/arch/ppc/include/asm/div64.h              |  14 --
 xen/arch/ppc/include/asm/grant_table.h        |   5 -
 xen/arch/ppc/include/asm/hardirq.h            |  19 ---
 xen/arch/ppc/include/asm/hypercall.h          |   5 -
 xen/arch/ppc/include/asm/iocap.h              |   8 --
 xen/arch/ppc/include/asm/irq.h                |   4 +
 xen/arch/ppc/include/asm/mem_access.h         |   5 -
 xen/arch/ppc/include/asm/monitor.h            |  43 ------
 xen/arch/ppc/include/asm/numa.h               |  26 ----
 xen/arch/ppc/include/asm/paging.h             |   7 -
 xen/arch/ppc/include/asm/percpu.h             |  24 ----
 xen/arch/ppc/include/asm/random.h             |   9 --
 xen/arch/ppc/include/asm/softirq.h            |   8 --
 xen/arch/x86/include/asm/Makefile             |   3 +
 xen/arch/x86/include/asm/current.h            |   2 +
 xen/arch/x86/include/asm/div64.h              |  14 --
 xen/arch/x86/include/asm/percpu.h             |  22 ---
 xen/include/asm-generic/altp2m.h              |  34 +++++
 .../asm => include/asm-generic}/device.h      | 125 +++++++++++-------
 xen/include/asm-generic/div64.h               |  27 ++++
 .../asm => include/asm-generic}/hardirq.h     |   8 +-
 xen/include/asm-generic/hypercall.h           |  18 +++
 .../asm => include/asm-generic}/iocap.h       |   7 +-
 xen/include/asm-generic/monitor.h             |  62 +++++++++
 .../asm => include/asm-generic}/numa.h        |  14 +-
 xen/include/asm-generic/paging.h              |  19 +++
 .../asm => include/asm-generic}/percpu.h      |  18 ++-
 xen/include/asm-generic/random.h              |  19 +++
 .../asm => include/asm-generic}/softirq.h     |   7 +-
 xen/include/headers++.chk.new                 |   0
 xen/include/xen/grant_table.h                 |   3 +
 xen/include/xen/mem_access.h                  |   2 +
 xen/include/xen/percpu.h                      |   4 +-
 50 files changed, 362 insertions(+), 437 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/altp2m.h
 delete mode 100644 xen/arch/arm/include/asm/paging.h
 delete mode 100644 xen/arch/arm/include/asm/random.h
 delete mode 100644 xen/arch/ppc/include/asm/altp2m.h
 delete mode 100644 xen/arch/ppc/include/asm/device.h
 delete mode 100644 xen/arch/ppc/include/asm/div64.h
 delete mode 100644 xen/arch/ppc/include/asm/grant_table.h
 delete mode 100644 xen/arch/ppc/include/asm/hardirq.h
 delete mode 100644 xen/arch/ppc/include/asm/hypercall.h
 delete mode 100644 xen/arch/ppc/include/asm/iocap.h
 delete mode 100644 xen/arch/ppc/include/asm/mem_access.h
 delete mode 100644 xen/arch/ppc/include/asm/monitor.h
 delete mode 100644 xen/arch/ppc/include/asm/numa.h
 delete mode 100644 xen/arch/ppc/include/asm/paging.h
 delete mode 100644 xen/arch/ppc/include/asm/percpu.h
 delete mode 100644 xen/arch/ppc/include/asm/random.h
 delete mode 100644 xen/arch/ppc/include/asm/softirq.h
 create mode 100644 xen/arch/x86/include/asm/Makefile
 delete mode 100644 xen/arch/x86/include/asm/div64.h
 delete mode 100644 xen/arch/x86/include/asm/percpu.h
 create mode 100644 xen/include/asm-generic/altp2m.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/device.h (79%)
 create mode 100644 xen/include/asm-generic/div64.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/hardirq.h (79%)
 create mode 100644 xen/include/asm-generic/hypercall.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/iocap.h (60%)
 create mode 100644 xen/include/asm-generic/monitor.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/numa.h (76%)
 create mode 100644 xen/include/asm-generic/paging.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/percpu.h (57%)
 create mode 100644 xen/include/asm-generic/random.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/softirq.h (56%)
 create mode 100644 xen/include/headers++.chk.new

-- 
2.43.0


