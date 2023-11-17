Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F13C87EF28D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 13:25:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635109.990857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xtv-0000bf-3m; Fri, 17 Nov 2023 12:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635109.990857; Fri, 17 Nov 2023 12:24:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xtv-0000Zs-0Q; Fri, 17 Nov 2023 12:24:47 +0000
Received: by outflank-mailman (input) for mailman id 635109;
 Fri, 17 Nov 2023 12:24:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c3wv=G6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3xtt-0000ZQ-6q
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 12:24:45 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49dc74ed-8544-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 13:24:43 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50aa2abfcfcso185063e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 04:24:43 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a18-20020ac25e72000000b005094d95e8bcsm209811lfr.218.2023.11.17.04.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 04:24:42 -0800 (PST)
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
X-Inumbo-ID: 49dc74ed-8544-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700223883; x=1700828683; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nEK/5CWCOKvkykZwhirxz5Twp8fKDStvoJBOuDmiptA=;
        b=QrG7CtaGU4FR83/jTnZyNXfnT3g5HNxnU52ADOENRX3vSMqU2YR+plyANF9h+/yfct
         aFEfjPzMNy41XWY95OGhpuRH9Y6dZ0OOVfJbo3rwAH7bGZfmjPjMVutht84kRJ2SXAU0
         FrYCkAOppbrZx6mRO+7H81HTDycbfaeRjFGVbxv3iMjnqG9ZZitfGFsdjloz/evXtA7O
         0xkIrtvqdaqUXQmadt/0f/CG0F3US8uRNkYiukMzM7enB5ngrAz41UHkh1c8Su+OiyIb
         gA3ch0GRm+L7uUYEkLQbOlraFvJKnrZOVZkJtr1TwsO5S3uUEUEqxlWhj1P2E3t9hlzj
         K6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700223883; x=1700828683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nEK/5CWCOKvkykZwhirxz5Twp8fKDStvoJBOuDmiptA=;
        b=T41Kwoc0g2S8YhDVkfFTTDbSdmXPGCP05vqlQP8nXM0x/sdWiu8qeNV+Ow9NniCiVJ
         BmS+QpnTjoA165YD9mwXtlJ0FOpXIFJuHZH0EiHcI6wzXYeiYlVKOG95LG32Ny3NN8ix
         yas9TeQPxlaLCbNp24KRODmX5sUMNgP+3N3rX+Sm0iU+R95cnPc4atR0oeM72qAKoALI
         b2F2L7I3/Vo+AlwpV8/0DuQTG5K3D7jw0xsRpwYnjzil681vzAjtzY7flTPhDBGi3aM5
         k9mB6T/UP7zOvq21pUIXArxQjKfCtpbANB6FLUAlHj0/cLlGqYVF705uPEFWqHlj2QGy
         af5A==
X-Gm-Message-State: AOJu0YxgtJ+rClBDtIwP/+I8OIHEyBha01H7a2Es7rTLkiC+ihVIME53
	PugKwS3Ksy+RJh/Rh6iMio4wwqjrKd8=
X-Google-Smtp-Source: AGHT+IHOuNktIBIEt4L3teGIkTQxDWH/LXLdYlAxd9FBW9b5cM/8yImWrpnHelh5ZB6am2l/w66Dqg==
X-Received: by 2002:a05:6512:3994:b0:506:899d:1989 with SMTP id j20-20020a056512399400b00506899d1989mr17375117lfu.44.1700223882449;
        Fri, 17 Nov 2023 04:24:42 -0800 (PST)
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
Subject: [PATCH v3 00/14] Introduce generic headers
Date: Fri, 17 Nov 2023 14:24:24 +0200
Message-ID: <cover.1700221559.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
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

[1] https://lore.kernel.org/xen-devel/cover.1694543103.git.sanastasio@raptorengineering.com/
[2] https://lore.kernel.org/xen-devel/cover.1692181079.git.oleksii.kurochko@gmail.com/
[3] https://lore.kernel.org/xen-devel/3d55bce44bd6ab9973cbe0ea2fc136cc44d35df2.1698759633.git.oleksii.kurochko@gmail.com/

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

 xen/arch/arm/domain_build.c                   |   1 +
 xen/arch/arm/include/asm/Makefile             |   7 +
 xen/arch/arm/include/asm/altp2m.h             |  39 -----
 xen/arch/arm/include/asm/current.h            |   3 +
 xen/arch/arm/include/asm/paging.h             |  16 --
 xen/arch/arm/include/asm/random.h             |   9 --
 xen/arch/arm/p2m.c                            |   1 +
 xen/arch/arm/traps.c                          |   1 +
 xen/arch/ppc/include/asm/Makefile             |  10 ++
 xen/arch/ppc/include/asm/altp2m.h             |  25 ---
 xen/arch/ppc/include/asm/current.h            |   6 +
 xen/arch/ppc/include/asm/div64.h              |  14 --
 xen/arch/ppc/include/asm/grant_table.h        |   5 -
 xen/arch/ppc/include/asm/hardirq.h            |  19 ---
 xen/arch/ppc/include/asm/hypercall.h          |   5 -
 xen/arch/ppc/include/asm/iocap.h              |   8 -
 xen/arch/ppc/include/asm/mem_access.h         |   5 -
 xen/arch/ppc/include/asm/monitor.h            |  43 -----
 xen/arch/ppc/include/asm/numa.h               |  26 ----
 xen/arch/ppc/include/asm/paging.h             |   7 -
 xen/arch/ppc/include/asm/percpu.h             |  24 ---
 xen/arch/ppc/include/asm/random.h             |   9 --
 xen/arch/x86/include/asm/Makefile             |   3 +
 xen/arch/x86/include/asm/current.h            |   2 +
 xen/arch/x86/include/asm/div64.h              |  14 --
 xen/arch/x86/include/asm/percpu.h             |  22 ---
 xen/include/asm-generic/altp2m.h              |  34 ++++
 xen/include/asm-generic/device.h              | 147 ++++++++++++++++++
 xen/include/asm-generic/div64.h               |  27 ++++
 .../asm => include/asm-generic}/hardirq.h     |   8 +-
 xen/include/asm-generic/hypercall.h           |  18 +++
 .../asm => include/asm-generic}/iocap.h       |   7 +-
 xen/include/asm-generic/monitor.h             |  63 ++++++++
 .../asm => include/asm-generic}/numa.h        |  13 +-
 xen/include/asm-generic/paging.h              |  19 +++
 .../asm => include/asm-generic}/percpu.h      |  18 ++-
 xen/include/asm-generic/random.h              |  20 +++
 xen/include/asm-generic/softirq.h             |  17 ++
 xen/include/xen/grant_table.h                 |   3 +
 xen/include/xen/mem_access.h                  |   2 +
 xen/include/xen/percpu.h                      |   4 +-
 41 files changed, 414 insertions(+), 310 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/altp2m.h
 delete mode 100644 xen/arch/arm/include/asm/paging.h
 delete mode 100644 xen/arch/arm/include/asm/random.h
 delete mode 100644 xen/arch/ppc/include/asm/altp2m.h
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
 create mode 100644 xen/arch/x86/include/asm/Makefile
 delete mode 100644 xen/arch/x86/include/asm/div64.h
 delete mode 100644 xen/arch/x86/include/asm/percpu.h
 create mode 100644 xen/include/asm-generic/altp2m.h
 create mode 100644 xen/include/asm-generic/device.h
 create mode 100644 xen/include/asm-generic/div64.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/hardirq.h (79%)
 create mode 100644 xen/include/asm-generic/hypercall.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/iocap.h (60%)
 create mode 100644 xen/include/asm-generic/monitor.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/numa.h (75%)
 create mode 100644 xen/include/asm-generic/paging.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/percpu.h (57%)
 create mode 100644 xen/include/asm-generic/random.h
 create mode 100644 xen/include/asm-generic/softirq.h

-- 
2.41.0


