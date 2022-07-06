Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0739D5693D2
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 23:06:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362516.592556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CCw-0003Jl-H4; Wed, 06 Jul 2022 21:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362516.592556; Wed, 06 Jul 2022 21:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CCw-0003Hl-E9; Wed, 06 Jul 2022 21:05:14 +0000
Received: by outflank-mailman (input) for mailman id 362516;
 Wed, 06 Jul 2022 21:05:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJEZ=XL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o9CCu-0003HV-5d
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 21:05:12 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50096e6b-fd6f-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 23:05:09 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1657141502311577.7833419610672;
 Wed, 6 Jul 2022 14:05:02 -0700 (PDT)
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
X-Inumbo-ID: 50096e6b-fd6f-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1657141504; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kyW+l8tpmRu4KURI7nguDCk1XU6ruJVxwuNPOeI/B+gCqnkW/GiJTvQX8GSXd4WAEA4oJPjiKC0gD06SBD9qTHai6fHj8l34A6Hv/EZ1xmYtfs0+0LWFERFtMTTldceRYQixHfTDbdwXDxq6WWNFdifVa+366NJKL0beP7AemLk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657141504; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=nTRkkvW+5JHPNvq9pdfiGGHPPr03Uu0sr0CrPi6JF7M=; 
	b=K9a1cZ5KGyN5DnbS7w+VuzBqzxZHC2FHO2VDwVYmFPSubUxn/lAmc9nHmAF4fddPayVCZhpy6yOsqEOZ5SvL4jfvmYUTULRmF3F56+bqUh+3fimdPx/Ej+YkO10djHt2fP8s7GsTJcL5/R31/lsSVgnVU/ypYnpBgz7cZNDQQOg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657141504;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=nTRkkvW+5JHPNvq9pdfiGGHPPr03Uu0sr0CrPi6JF7M=;
	b=cr8yHJ0R4w31Lljh61DPi2DMAYp8maiL4tr/1kDp8EFfN5YaGgTWLgqSwFpDdO5Z
	U8D5xFhZkEFw2rQux2xmf7HIfKicI9a8VtYhoFwUy2C/DR6OGYJPCxQbvS6RTu7F3XM
	NGe0EHyHhDehDYekByjQKiINFxWBgnCnkUUxyQmE=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io
Subject: [PATCH v1 00/18] Hyperlaunch
Date: Wed,  6 Jul 2022 17:04:35 -0400
Message-Id: <20220706210454.30096-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This work being submitted in this series was made possible with a great thanks
to Star Lab Cop ration and their generous funding of this project.

The patch series is based on the existing xsm series for starting the idle
domain privileged. After that, the first four commits were previously submitted
as an RFC and expanded by an additional commit to refactor xen commandline
handling. The remaining preliminary patches are FDT refactoring and a doc
update. From there is where the series begins to  morph x86 arch to support
building multiple domains at boot.

This series has been fairly well tested using qemu with a multiboot1 bootoader
and under EFI + GRUB multiboot2 boot. While there are likely some rough spots
remaining in the series, it is at a point now where the series should be reviewed,
exercised, and tested for consideration into tree.

Information, including docuemntation, meeting minutes, presentations, and past
series postings can be found on the Xen wiki:

https://wiki.xenproject.org/wiki/Hyperlaunch

Daniel P. Smith (18):
  kconfig: allow configuration of maximum modules
  introduction of generalized boot info
  x86: adopt new boot info structures
  x86: refactor entrypoints to new boot info
  x86: refactor xen cmdline into general framework
  fdt: make fdt handling reusable across arch
  docs: update hyperlaunch device tree documentation
  kconfig: introduce domain builder config option
  x86: introduce abstractions for domain builder
  x86: introduce the domain builder
  x86: initial conversion to domain builder
  x86: convert dom0 creation to domain builder
  x86: generalize physmap logic
  x86: generalize vcpu for domain building
  x86: rework domain page allocation
  x86: add pv multidomain construction
  builder: introduce domain builder hypfs tree
  tools: introduce example late pv helper

 .gitignore                                    |   1 +
 .../designs/launch/hyperlaunch-devicetree.rst | 497 +++++++++++-------
 tools/helpers/Makefile                        |  11 +
 tools/helpers/builder-hypfs.c                 | 253 +++++++++
 tools/helpers/hypfs-helpers.h                 |   9 +
 tools/helpers/late-init-pv.c                  | 287 ++++++++++
 tools/helpers/late-init-pv.h                  |  29 +
 tools/helpers/xs-helpers.c                    | 117 +++++
 tools/helpers/xs-helpers.h                    |  27 +
 xen/arch/Kconfig                              |  12 +
 xen/arch/arm/bootfdt.c                        | 115 +---
 xen/arch/arm/include/asm/setup.h              |   5 +-
 xen/arch/x86/Makefile                         |   1 +
 xen/arch/x86/boot/boot_info32.h               |  97 ++++
 xen/arch/x86/boot/defs.h                      |  17 +-
 xen/arch/x86/boot/reloc.c                     | 187 +++++--
 xen/arch/x86/bzimage.c                        |  18 +-
 xen/arch/x86/cpu/microcode/core.c             | 133 +++--
 xen/arch/x86/dom0_build.c                     | 129 +----
 xen/arch/x86/domain_builder.c                 | 284 ++++++++++
 xen/arch/x86/efi/efi-boot.h                   |  96 ++--
 xen/arch/x86/guest/xen/pvh-boot.c             |  64 ++-
 xen/arch/x86/hvm/dom0_build.c                 |  62 +--
 xen/arch/x86/include/asm/bootdomain.h         |  30 ++
 xen/arch/x86/include/asm/bootinfo.h           |  99 ++++
 xen/arch/x86/include/asm/bzimage.h            |   5 +-
 xen/arch/x86/include/asm/dom0_build.h         |  27 +-
 xen/arch/x86/include/asm/guest/pvh-boot.h     |   6 +-
 xen/arch/x86/include/asm/setup.h              |  18 +-
 xen/arch/x86/pv/Makefile                      |   2 +-
 .../x86/pv/{dom0_build.c => domain_builder.c} | 141 ++---
 xen/arch/x86/pv/shim.c                        |   4 +-
 xen/arch/x86/setup.c                          | 392 ++++++--------
 xen/common/Kconfig                            |   5 +
 xen/common/Makefile                           |   4 +-
 xen/common/domain-builder/Kconfig             |  36 ++
 xen/common/domain-builder/Makefile            |   3 +
 xen/common/domain-builder/core.c              | 207 ++++++++
 xen/common/domain-builder/fdt.c               | 295 +++++++++++
 xen/common/domain-builder/fdt.h               |   7 +
 xen/common/domain-builder/hypfs.c             | 193 +++++++
 xen/common/efi/boot.c                         |   4 +-
 xen/common/fdt.c                              | 131 +++++
 xen/common/sched/core.c                       |  25 +-
 xen/include/xen/bootdomain.h                  |  58 ++
 xen/include/xen/bootinfo.h                    | 132 +++++
 xen/include/xen/device_tree.h                 |  50 +-
 xen/include/xen/domain_builder.h              |  88 ++++
 xen/include/xen/fdt.h                         |  79 +++
 xen/include/xen/sched.h                       |   3 +-
 xen/include/xsm/xsm.h                         |  26 +-
 xen/xsm/xsm_core.c                            |  43 +-
 xen/xsm/xsm_policy.c                          |  56 +-
 53 files changed, 3544 insertions(+), 1076 deletions(-)
 create mode 100644 tools/helpers/builder-hypfs.c
 create mode 100644 tools/helpers/hypfs-helpers.h
 create mode 100644 tools/helpers/late-init-pv.c
 create mode 100644 tools/helpers/late-init-pv.h
 create mode 100644 tools/helpers/xs-helpers.c
 create mode 100644 tools/helpers/xs-helpers.h
 create mode 100644 xen/arch/x86/boot/boot_info32.h
 create mode 100644 xen/arch/x86/domain_builder.c
 create mode 100644 xen/arch/x86/include/asm/bootdomain.h
 create mode 100644 xen/arch/x86/include/asm/bootinfo.h
 rename xen/arch/x86/pv/{dom0_build.c => domain_builder.c} (88%)
 create mode 100644 xen/common/domain-builder/Kconfig
 create mode 100644 xen/common/domain-builder/Makefile
 create mode 100644 xen/common/domain-builder/core.c
 create mode 100644 xen/common/domain-builder/fdt.c
 create mode 100644 xen/common/domain-builder/fdt.h
 create mode 100644 xen/common/domain-builder/hypfs.c
 create mode 100644 xen/common/fdt.c
 create mode 100644 xen/include/xen/bootdomain.h
 create mode 100644 xen/include/xen/bootinfo.h
 create mode 100644 xen/include/xen/domain_builder.h
 create mode 100644 xen/include/xen/fdt.h

-- 
2.20.1


