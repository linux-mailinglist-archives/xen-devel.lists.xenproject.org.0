Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 747EE9A5839
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822874.1236764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gZ9-00075m-Ij; Mon, 21 Oct 2024 00:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822874.1236764; Mon, 21 Oct 2024 00:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gZ9-00073E-FC; Mon, 21 Oct 2024 00:46:35 +0000
Received: by outflank-mailman (input) for mailman id 822874;
 Mon, 21 Oct 2024 00:46:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gZ7-000738-V9
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:46:34 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8b7dc3a-8f45-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 02:46:30 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471583597702.4571296580966;
 Sun, 20 Oct 2024 17:46:23 -0700 (PDT)
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
X-Inumbo-ID: e8b7dc3a-8f45-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729471586; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pt/pMRLNqxz9OQWUyhscFHFkNhO+OLokPYwk6W77YIvK/be4S98COrBnv7DxU/HNp5quW55OPL9Wy0jIIF4zdcwDqXuAT9StoTehOAXnNUjGVrpfgB7+m1DtaKXBQa4w17wlQCTIp2esYfNlttGAtk6rsYhPntK7iVdsBhJ0qsM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471586; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IXGQnwVFs2+KINA9++STIo8SbSGKr1Zxrx/G0Z6oXIg=; 
	b=b89YqUcjOjByfLKp0tn2WKdzf7K/b+pcrfnCuEkt4/ehMjj6RVrwlEO4MR5q3kLZEu+IwRiSzybyVNsx516tQG39M6UyoBFfsbuw/2P6yk5sJaCqk9qN2Dg1qYqTeZhW4mL0/U855YumQ9GOWATUZ3exEpCpsVtF6jQFYtfVNrY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471586;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=IXGQnwVFs2+KINA9++STIo8SbSGKr1Zxrx/G0Z6oXIg=;
	b=GZrB+XF9VPrWwCrZjUWTSyIDgADm8DL8UTZf+EA50wquD4wwKAG9tHI6DVGneHhX
	aKHbvqf8QZ7WNFAhgtWQujkR5HFOtRO6Vqo0dAMYuiYWaIZ+STcqf/EUmoKkEzmgbDC
	KK37P8TB9VCCnrr0x902tRTgCsMz7NnKRhaWGMUA=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com
Subject: [PATCH v7 00/38] Boot modules for Hyperlaunch
Date: Sun, 20 Oct 2024 20:45:35 -0400
Message-Id: <20241021004613.18793-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The Boot Modules for Hyperlaunch series is an effort to split out preliminary
changes necessary for the introduction of the Hyperlaunch domain builder
logic. These preliminary changes revolve around introducing the struct
boot_module and struct boot_domain structures. This includes converting the
dom0 construction path to use these structures. These abstractions lay the
groundwork to transform and extend the dom0 construction logic into a limited,
but general domain builder.

The splitting of Hyperlaunch into a set of series are twofold, to reduce the
effort in reviewing a much larger series, and to reduce the effort in handling
the knock-on effects to the construction logic from requested review changes.

Much thanks to AMD for supporting this work.

Documentation on Hyperlaunch:
https://wiki.xenproject.org/wiki/Hyperlaunch

Original Hyperlaunch v1 patch series:
https://lists.xenproject.org/archives/html/xen-devel/2022-07/msg00345.html

V/r,
Daniel P. Smith

Changes since v6:
- Dropped patches that were merged from v5
- patch 8 title and commit message rewritten
- boot module interator patch merged with xsm patch, its first use
- incorporated review requests
- made additional style optimizations as a result of review requests

Changes since v5:
- switched to per patch change logs
- incorporated review requests

Changes since v4:
- added requested inline code comments
- moved instance of struct boot_info to unit level and extern'ed
- array of struct boot_module moved into struct boot_info
- renamed function to multiboot_fill_bootinfo, now returns *struct boot_info
- multiboot_fill_bootinfo changed to take multiboot_info_t addr as param
- added missing guard that checked there were multiboot1/2 modules passed
- renmaed struct elements per the review
- fixed errant commit messages per the review
- corrected coding style per review
- attempted to repalce all open codings of page/addr translations touched 
- unified use of `bi` as var name for pointer ref to struct boot_info
- when appropriate, ensure variables where typed, eg size_t, paddr_t, etc.
- dropped all uses of "a = b = c"

Changes since v3:
- reduced scope to x86 only
- broke changes into a smaller chunks with a linear progression
- concerns about deconflicting with Arm deferred
- conversion from mb1 to boot modules no longer attempted at entry points
- the temporary conversion function is now the permenant means to convert
- incorporated suggestion from Andy Cooper for handling bootstrap_map

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

Daniel P. Smith (38):
  x86/boot: introduce struct boot_module
  x86/boot: convert consider_modules to struct boot_module
  x86/boot: move headroom to boot modules
  x86/boot: convert mod refs to boot_module mod
  x86/boot: introduce boot module types
  x86/boot: introduce boot module flags
  x86/boot: add start and size fields to struct boot_module
  x86/boot: populate boot module for xen entry
  x86/boot: transition relocation calculations to struct boot_module
  x86/boot: introduce consumed flag for struct boot_module
  x86/boot: convert microcode loading to consume struct boot_info
  x86/boot: convert late microcode loading to struct boot_module
  x86/boot: use consumed boot module flag for microcode
  x86/boot: convert xsm policy loading to struct boot_module
  x86/boot: convert ramdisk locating to struct boot_module
  x86/boot: remove module_map usage from microcode loading
  x86/boot: remove module_map usage from xsm policy loading
  x86/boot: remove module_map usage by ramdisk loading
  x86/boot: convert create_dom0 to use boot info
  x86/boot: convert construct_dom0 to use struct boot_module
  x86/boot: relocate kextra into boot info
  x86/boot: add cmdline to struct boot_module
  x86/boot: convert dom0_construct_pv image param to struct boot_module
  x86/boot: convert dom0_construct_pv initrd param to struct boot_module
  x86/boot: convert dom0_construct_pvh to struct boot_module
  x86/boot: convert pvh_load_kernel to struct boot_module
  x86/boot: convert initial_images to struct boot_module
  x86/boot: drop the use of initial_images unit global
  x86/boot: remove usage of mod_end by discard_initial_images
  x86/boot: remove remaining module_t references
  x86/boot: remove mod from struct boot_module
  x86/boot: introduce boot domain
  x86/boot: introduce domid field to struct boot_domain
  x86/boot: add cmdline to struct boot_domain
  x86/boot: add struct domain to struct boot_domain
  x86/boot: convert construct_dom0 to struct boot_domain
  x86/boot: convert dom0_construct_pv to struct boot_domain
  x86/boot: convert dom0_construct_pvh to struct boot_domain

 xen/arch/x86/cpu/microcode/core.c     |  83 ++++------
 xen/arch/x86/dom0_build.c             |  10 +-
 xen/arch/x86/hvm/dom0_build.c         |  32 ++--
 xen/arch/x86/include/asm/bootdomain.h |  37 +++++
 xen/arch/x86/include/asm/bootinfo.h   | 104 +++++++++++-
 xen/arch/x86/include/asm/dom0_build.h |  11 +-
 xen/arch/x86/include/asm/microcode.h  |  12 +-
 xen/arch/x86/include/asm/setup.h      |   9 +-
 xen/arch/x86/pv/dom0_build.c          |  54 +++---
 xen/arch/x86/setup.c                  | 226 ++++++++++++++++----------
 xen/include/xsm/xsm.h                 |  14 +-
 xen/xsm/xsm_core.c                    |  19 ++-
 xen/xsm/xsm_policy.c                  |  20 +--
 13 files changed, 398 insertions(+), 233 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/bootdomain.h

-- 
2.30.2


