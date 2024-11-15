Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7EA9CDFA3
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 14:12:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837559.1253478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBw7e-0006wz-Qf; Fri, 15 Nov 2024 13:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837559.1253478; Fri, 15 Nov 2024 13:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBw7e-0006vD-NF; Fri, 15 Nov 2024 13:12:26 +0000
Received: by outflank-mailman (input) for mailman id 837559;
 Fri, 15 Nov 2024 13:12:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=54cC=SK=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tBw7d-0006v7-NS
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 13:12:25 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3caa92d4-a353-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 14:12:18 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1731676331374533.8444273076053;
 Fri, 15 Nov 2024 05:12:11 -0800 (PST)
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
X-Inumbo-ID: 3caa92d4-a353-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNjYWE5MmQ0LWEzNTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjc2MzM4LjU1MzA0OSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1731676333; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GURaKX9TbQCxXCz4zQA1JpYXkv/rhXUBIarIR4mx6aK+Ohikddbq42ItlesIGmg35SNbFxnpl6EFJAlg8NiXLfYlhdEsf7miNCZyEElPNdhNFAGzpHwJ/TywaJE3YKp7L+QBKBcaHJly131VxEMNaEZIumCzksCEYcyVqGCWAE4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731676333; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6eD0GANhMW65OxnZGKtnn1yU3IMtPRuxspq20ihsKkI=; 
	b=leEfTHnIm7p0FaJUVIGc7vsJg+32mzjYdt0RRXXTcLFVMsNabWT9zDm5I2pbZi9M6J8rVfl/sO68huSn8YgYJNG4sVWHrfqBxIzrsaC/N3RC5MT1Ky1/4xBnhZOEmIkOvxlWVhSRMRdkw1HavH7MAsr8sEjJhO0GkOn7yuezmRk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731676333;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=6eD0GANhMW65OxnZGKtnn1yU3IMtPRuxspq20ihsKkI=;
	b=Wzn1UrBAJooIXeRKcXTRKuV7q9wHp+UY5xReWzhJAWkeGefj3Tv4FHqpj2mUbcGN
	4ZeX4doUmfwHCVgCs6sxYIj2z+kahi4jGQM6kn1WSg9F/8W35P0y9j7UFrm0dg4M505
	xd3uofNuh0eHJagb4kkt86AQuxpHLk/4yXz3KcWs=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com
Subject: [PATCH v9 0/6] Boot modules for Hyperlaunch
Date: Fri, 15 Nov 2024 08:11:58 -0500
Message-Id: <20241115131204.32135-1-dpsmith@apertussolutions.com>
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

Lastly it should be noted that this series builds/relies upon Andy Cooper's
"x86/ucode: Fix module-handling use-after-free's" series.

Documentation on Hyperlaunch:
https://wiki.xenproject.org/wiki/Hyperlaunch

Original Hyperlaunch v1 patch series:
https://lists.xenproject.org/archives/html/xen-devel/2022-07/msg00345.html

V/r,
Daniel P. Smith

Changes since v8:
- moved commit 'convert domain construction to use boot info' forward
- reworked the remove module commit
- addressed a few code style comments

Changes since v7:
- patches re-organized with some collapsing into others

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

Daniel P. Smith (6):
  x86/boot: convert domain construction to use boot info
  x86/boot: introduce module release
  x86/boot: add start and size fields to struct boot_module
  x86/boot: introduce boot domain
  x86/boot: introduce domid field to struct boot_domain
  x86/boot: add cmdline to struct boot_domain

 xen/arch/x86/cpu/microcode/core.c     |   8 +-
 xen/arch/x86/dom0_build.c             |  10 +-
 xen/arch/x86/hvm/dom0_build.c         |  41 +++---
 xen/arch/x86/include/asm/bootdomain.h |  35 +++++
 xen/arch/x86/include/asm/bootinfo.h   |  13 +-
 xen/arch/x86/include/asm/dom0_build.h |  13 +-
 xen/arch/x86/include/asm/setup.h      |  13 +-
 xen/arch/x86/pv/dom0_build.c          |  80 +++++------
 xen/arch/x86/setup.c                  | 188 +++++++++++++++-----------
 xen/xsm/xsm_policy.c                  |   2 +-
 10 files changed, 239 insertions(+), 164 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/bootdomain.h

-- 
2.30.2


