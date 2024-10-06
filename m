Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B59A9921C7
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811317.1223869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZ8s-00054M-0D; Sun, 06 Oct 2024 21:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811317.1223869; Sun, 06 Oct 2024 21:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZ8r-00051K-To; Sun, 06 Oct 2024 21:50:17 +0000
Received: by outflank-mailman (input) for mailman id 811317;
 Sun, 06 Oct 2024 21:50:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZ8q-00051E-Hs
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:50:16 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5a93ec1-842c-11ef-99a2-01e77a169b0f;
 Sun, 06 Oct 2024 23:50:12 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251403835311.62403873473215;
 Sun, 6 Oct 2024 14:50:03 -0700 (PDT)
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
X-Inumbo-ID: f5a93ec1-842c-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728251406; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iot5QQK2prrqA6AMiS2JZGfX/WuL0dJitFPe1g1A60NiueMf2EhsAbGBE1Fqu60wm4838/ijnKeRNFdQMjTdUcUzPUZZg1CDX+GaT6mlkET4q4Uf8+xu5Uj0mTNieGmgawBrO7E3zGIJp/iDiptQ4yqvK823gqlXeetLJ62jbic=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251406; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=522wIIyZ7Ak4tket530K/cJQ4Q6ozBp9XhRContCJQg=; 
	b=an18MrzH70ZsFA7V80sFt3AAuAtdNYTDdoBs5YQutF/ihxMPYpSr3NarO17qaG1MsqrGdNORplgD+HkExrVJ5vlvbvv5vNJAifCV7KM/76K6BWHHw/LU62DoI1sYxdlhTaJOnddeVLngcsvE+kD1NJQL9w1Uh44w+ZVjl5fJ/Aw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251406;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=522wIIyZ7Ak4tket530K/cJQ4Q6ozBp9XhRContCJQg=;
	b=SsEAsj1tCSLo5raBSWqDbO1kvr2KDoJYrSkTFHBXN4C7DgNayz1JqeOmvXwG6/Ul
	kaoE0fdRWxI+aJESw8R2h/nFFOncJjr0AEcDY9+7BQRxLBNj8dfxQ1qBop74BBalpAn
	ypsmDx+mMFOOkGf1L41hWcpyae31TT3sEkFwMJbg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com
Subject: [PATCH v5 00/44] Boot modules for Hyperlaunch
Date: Sun,  6 Oct 2024 17:49:11 -0400
Message-Id: <20241006214956.24339-1-dpsmith@apertussolutions.com>
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

Andrew Cooper (1):
  x86/boot: split bootstrap_map_addr() out of bootstrap_map()

Christopher Clark (1):
  x86/boot: move x86 boot module counting into a new boot_info struct

Daniel P. Smith (42):
  x86/boot: move boot loader name to boot info
  x86/boot: move cmdline to boot info
  x86/boot: move mmap info to boot info
  x86/boot: introduce struct boot_module
  x86/boot: convert consider_modules to struct boot_module
  x86/boot: move headroom to boot modules
  x86/boot: convert setup.c mod refs to early_mod
  x86/boot: introduce boot module types
  x86/boot: introduce boot module flags
  x86/boot: add start and size fields to struct boot_module
  x86/boot: update struct boot_module on module relocation
  x86/boot: transition relocation calculations to struct boot_module
  x86/boot: introduce boot module interator
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
  x86/boot: remove remaining early_mod references
  x86/boot: remove mod from struct boot_module
  x86/boot: introduce boot domain
  x86/boot: introduce domid field to struct boot_domain
  x86/boot: add cmdline to struct boot_domain
  x86/boot: add struct domain to struct boot_domain
  x86/boot: convert construct_dom0 to struct boot_domain
  x86/boot: convert dom0_construct_pv to struct boot_domain
  x86/boot: convert dom0_construct_pvh to struct boot_domain

 xen/arch/x86/cpu/microcode/core.c     |  78 +++----
 xen/arch/x86/dom0_build.c             |  21 +-
 xen/arch/x86/hvm/dom0_build.c         |  55 +++--
 xen/arch/x86/include/asm/bootdomain.h |  37 +++
 xen/arch/x86/include/asm/bootinfo.h   |  91 ++++++++
 xen/arch/x86/include/asm/dom0_build.h |  11 +-
 xen/arch/x86/include/asm/microcode.h  |  12 +-
 xen/arch/x86/include/asm/setup.h      |  11 +-
 xen/arch/x86/pv/dom0_build.c          |  54 ++---
 xen/arch/x86/setup.c                  | 321 ++++++++++++++++----------
 xen/include/xsm/xsm.h                 |  14 +-
 xen/xsm/xsm_core.c                    |  15 +-
 xen/xsm/xsm_policy.c                  |  18 +-
 13 files changed, 461 insertions(+), 277 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/bootdomain.h
 create mode 100644 xen/arch/x86/include/asm/bootinfo.h

-- 
2.30.2


