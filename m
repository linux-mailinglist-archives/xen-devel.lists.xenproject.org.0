Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE68AEC40D
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jun 2025 04:09:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028059.1402321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVKze-0006s6-71; Sat, 28 Jun 2025 02:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028059.1402321; Sat, 28 Jun 2025 02:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVKze-0006p1-0a; Sat, 28 Jun 2025 02:08:38 +0000
Received: by outflank-mailman (input) for mailman id 1028059;
 Sat, 28 Jun 2025 02:08:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5KOk=ZL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uVKzc-0006ov-Rr
 for xen-devel@lists.xenproject.org; Sat, 28 Jun 2025 02:08:36 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cafaa8f5-53c4-11f0-a310-13f23c93f187;
 Sat, 28 Jun 2025 04:08:33 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D3972A45F97;
 Sat, 28 Jun 2025 02:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBECC4CEE3;
 Sat, 28 Jun 2025 02:08:30 +0000 (UTC)
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
X-Inumbo-ID: cafaa8f5-53c4-11f0-a310-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751076512;
	bh=mSpEq7rwbGmSwmxK6coN/ZhS7y7yVxYpe19dp62IYrk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LMBZOLUeSxlzHd7BAne8ddPrfdGZ7LiFvl64II1Clt0kuKl3K/vQ9wqHW1guYoIPf
	 s0KJeFsLKwNlMfhEeOQ43jB18lsPv4ntl/xTnMUttE3eWrRbgfqSZQytcIss2yxWwt
	 tSn2lM9bnh7mdT5Wb/dRRoynaw+vDBSMza/pwbUueZ/BAaEm04HXm2evbFEdk+SLN6
	 XbknH2F0g8tOsNwvuJ4uOO30lU4XcARNUNKz8CUh/O+IR1ZyV39FqAUSsh8/wR5iWF
	 TquYX/y630c5Pxrg0v5pf2egTupRiqNtFtkRnwIiF468zDvkie6LqO5fhd0X0pyeUg
	 e1WvwRkf2TesA==
Date: Fri, 27 Jun 2025 19:08:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Community Manager <community.manager@xenproject.org>, 
    sstabellini@kernel.org
Subject: Re: [PATCH v2 0/8] pdx: introduce a new compression algorithm
In-Reply-To: <20250620111130.29057-1-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2506271905350.862517@ubuntu-linux-20-04-desktop>
References: <20250620111130.29057-1-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Roger,

We have an ARM board with the following memory layout:

0x0-0x80000000, 0, 2G
0x800000000,0x880000000, 32GB, 2G
0x50000000000-0x50080000000 5T, 2GB 
0x60000000000-0x60080000000 6T, 2GB 
0x70000000000-0x70080000000 7T, 2GB 

It looks like your PDX series is exactly what we need.  However, I tried
to use it and it doesn't seem to be hooked properly on ARM yet. I spent
some time trying to fix it but I was unsuccessful.

As far as I can tell the following functions need to be adjusted but I
am not sure the list is comprehensive:

xen/arch/arm/include/asm/mmu/mm.h:maddr_to_virt
xen/arch/arm/mmu/mm.c:setup_frametable_mappings
xen/arch/arm/setup.c:init_pdx

Cheers,

Stefano

On Fri, 20 Jun 2025, Roger Pau Monne wrote:
> Hello,
> 
> This series implements a new PDX compression algorithm to cope with the
> spare memory maps found on the Intel Sapphire/Granite Rapids.
> 
> Patches 1 to 7 prepare the existing code to make it easier to introduce
> a new PDX compression, including generalizing the initialization and
> setup functions and adding a unit test for PDX compression.
> 
> Patch 8 introduce the new compression.  The new compression is only
> enabled by default on x86, other architectures are left with their
> previous defaults.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (8):
>   x86/pdx: simplify calculation of domain struct allocation boundary
>   kconfig: turn PDX compression into a choice
>   pdx: provide a unified set of unit functions
>   pdx: introduce command line compression toggle
>   pdx: allow per-arch optimization of PDX conversion helpers
>   test/pdx: add PDX compression unit tests
>   pdx: move some helpers in preparation for new compression
>   pdx: introduce a new compression algorithm based on region offsets
> 
>  CHANGELOG.md                           |   3 +
>  docs/misc/xen-command-line.pandoc      |   9 +
>  tools/tests/Makefile                   |   1 +
>  tools/tests/pdx/.gitignore             |   3 +
>  tools/tests/pdx/Makefile               |  49 ++++
>  tools/tests/pdx/harness.h              |  99 +++++++
>  tools/tests/pdx/test-pdx.c             | 224 +++++++++++++++
>  xen/arch/arm/include/asm/Makefile      |   1 +
>  xen/arch/arm/setup.c                   |  34 +--
>  xen/arch/ppc/include/asm/Makefile      |   1 +
>  xen/arch/riscv/include/asm/Makefile    |   1 +
>  xen/arch/x86/domain.c                  |  40 +--
>  xen/arch/x86/include/asm/cpufeatures.h |   1 +
>  xen/arch/x86/include/asm/pdx.h         |  75 +++++
>  xen/arch/x86/srat.c                    |  30 +-
>  xen/common/Kconfig                     |  37 ++-
>  xen/common/pdx.c                       | 379 ++++++++++++++++++++++---
>  xen/include/asm-generic/pdx.h          |  24 ++
>  xen/include/xen/pdx.h                  | 201 +++++++++----
>  19 files changed, 1056 insertions(+), 156 deletions(-)
>  create mode 100644 tools/tests/pdx/.gitignore
>  create mode 100644 tools/tests/pdx/Makefile
>  create mode 100644 tools/tests/pdx/harness.h
>  create mode 100644 tools/tests/pdx/test-pdx.c
>  create mode 100644 xen/arch/x86/include/asm/pdx.h
>  create mode 100644 xen/include/asm-generic/pdx.h
> 
> -- 
> 2.49.0
> 

