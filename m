Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BDC987C54
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 02:58:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805950.1217210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stzIe-0000OF-Si; Fri, 27 Sep 2024 00:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805950.1217210; Fri, 27 Sep 2024 00:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stzIe-0000MG-Ow; Fri, 27 Sep 2024 00:57:36 +0000
Received: by outflank-mailman (input) for mailman id 805950;
 Fri, 27 Sep 2024 00:57:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n09u=QZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1stzId-0000Kv-4A
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 00:57:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 788479b7-7c6b-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 02:57:30 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EC4125C5604;
 Fri, 27 Sep 2024 00:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C75C4CEC5;
 Fri, 27 Sep 2024 00:57:25 +0000 (UTC)
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
X-Inumbo-ID: 788479b7-7c6b-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727398648;
	bh=Tts7T4i0Dm82cK0EBbtUx7s/kD79HdGE55yGaNFfAYk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RQOM444hMhzrdAn5/CnAAvW5FS8NkacjaQMtgfVMPlmN4OWj6IwVX7JJArODxzazY
	 oYY+QjJdKDXZwk5jQAxZksSrMoUQJxFYDtrgBzZZ1k1QPjXhWVGYBzFfRJDBNw34/E
	 Jj//asCtOCslfLl9psS6Gv5R/ounhmBQ7FvfPlTQpG4vLkrHoV2OR2L5fpJazZkAA2
	 4PxJP3UednRQ/esKNajHj4oaWjvXIX1zU2ehC/aB/446NxwIyUi7AV/PKTR1cGtVYa
	 fYcz6EUvkZlB+WALn6KzA8cZjtd/o9eJjE8c01LB3VDBbNuHbcqAsaHQqdsjJEQ+aQ
	 ewGImcf1hv6yA==
Date: Thu, 26 Sep 2024 17:57:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Frediano Ziglio <frediano.ziglio@cloud.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Ross Lagerwall <ross.lagerwall@citrix.com>, 
    Tamas K Lengyel <tamas@tklengyel.com>, 
    Alexandru Isaila <aisaila@bitdefender.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Elena Ufimtseva <elena.ufimtseva@oracle.com>, Paul Durrant <paul@xen.org>, 
    Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, 
    George Dunlap <gwd@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] Update deprecated SPDX license identifiers
In-Reply-To: <20240926095133.483619-1-frediano.ziglio@cloud.com>
Message-ID: <alpine.DEB.2.22.394.2409261756260.1293902@ubuntu-linux-20-04-desktop>
References: <20240926095133.483619-1-frediano.ziglio@cloud.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Sep 2024, Frediano Ziglio wrote:
> As specified in LICENSES/GPL-2.0:
> - GPL-2.0 -> GPL-2.0-only;
> - GPL-2.0+ -> GPL-2.0-or-later.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  CODING_STYLE                                 | 2 +-
>  xen/arch/arm/alternative.c                   | 2 +-
>  xen/arch/arm/arm32/mmu/mm.c                  | 2 +-
>  xen/arch/arm/arm64/mmu/mm.c                  | 2 +-
>  xen/arch/arm/cpuerrata.c                     | 2 +-
>  xen/arch/arm/cpufeature.c                    | 2 +-
>  xen/arch/arm/dm.c                            | 2 +-
>  xen/arch/arm/domain_build.c                  | 2 +-
>  xen/arch/arm/domctl.c                        | 2 +-
>  xen/arch/arm/early_printk.c                  | 2 +-
>  xen/arch/arm/gic-v3-its.c                    | 2 +-
>  xen/arch/arm/gic-v3-lpi.c                    | 2 +-
>  xen/arch/arm/guest_atomics.c                 | 2 +-
>  xen/arch/arm/guest_walk.c                    | 2 +-
>  xen/arch/arm/guestcopy.c                     | 2 +-
>  xen/arch/arm/hvm.c                           | 2 +-
>  xen/arch/arm/include/asm/nospec.h            | 2 +-
>  xen/arch/arm/ioreq.c                         | 2 +-
>  xen/arch/arm/kernel.c                        | 2 +-
>  xen/arch/arm/livepatch.c                     | 2 +-
>  xen/arch/arm/mem_access.c                    | 2 +-
>  xen/arch/arm/mmu/p2m.c                       | 2 +-
>  xen/arch/arm/monitor.c                       | 2 +-
>  xen/arch/arm/p2m.c                           | 2 +-
>  xen/arch/arm/percpu.c                        | 2 +-
>  xen/arch/arm/physdev.c                       | 2 +-
>  xen/arch/arm/platform_hypercall.c            | 2 +-
>  xen/arch/arm/shutdown.c                      | 2 +-
>  xen/arch/arm/smp.c                           | 2 +-
>  xen/arch/arm/sysctl.c                        | 2 +-
>  xen/arch/arm/vgic-v3-its.c                   | 2 +-
>  xen/arch/arm/vm_event.c                      | 2 +-
>  xen/arch/arm/vpl011.c                        | 2 +-
>  xen/arch/arm/vsmc.c                          | 2 +-
>  xen/arch/riscv/early_printk.c                | 2 +-
>  xen/arch/riscv/include/asm/acpi.h            | 2 +-
>  xen/arch/riscv/include/asm/bitops.h          | 2 +-
>  xen/arch/riscv/include/asm/bug.h             | 2 +-
>  xen/arch/riscv/include/asm/cache.h           | 2 +-
>  xen/arch/riscv/include/asm/string.h          | 2 +-
>  xen/arch/x86/cpu/mcheck/intel-nonfatal.c     | 2 +-
>  xen/arch/x86/debug.c                         | 2 +-
>  xen/arch/x86/hvm/svm/nestedhvm.h             | 2 +-
>  xen/arch/x86/hvm/svm/svm.h                   | 2 +-
>  xen/arch/x86/include/asm/gdbsx.h             | 2 +-
>  xen/arch/x86/include/asm/guest/hyperv-tlfs.h | 2 +-
>  xen/arch/x86/include/asm/intel-family.h      | 2 +-
>  xen/arch/x86/include/asm/nospec.h            | 2 +-
>  xen/arch/x86/include/asm/prot-key.h          | 2 +-
>  xen/common/device-tree/bootfdt.c             | 2 +-
>  xen/common/sched/boot-cpupool.c              | 2 +-
>  xen/include/asm-generic/atomic-ops.h         | 2 +-
>  xen/include/asm-generic/monitor.h            | 2 +-
>  xen/include/xen/alternative-call.h           | 2 +-
>  xen/include/xen/nospec.h                     | 2 +-
>  xen/include/xen/unaligned.h                  | 2 +-
>  xen/tools/kconfig/expr.h                     | 2 +-
>  xen/tools/kconfig/images.h                   | 2 +-
>  xen/tools/kconfig/lexer.l                    | 2 +-
>  xen/tools/kconfig/list.h                     | 2 +-
>  xen/tools/kconfig/lkc.h                      | 2 +-
>  xen/tools/kconfig/lkc_proto.h                | 2 +-
>  xen/tools/kconfig/lxdialog/checklist.c       | 2 +-
>  xen/tools/kconfig/lxdialog/dialog.h          | 2 +-
>  xen/tools/kconfig/lxdialog/inputbox.c        | 2 +-
>  xen/tools/kconfig/lxdialog/menubox.c         | 2 +-
>  xen/tools/kconfig/lxdialog/textbox.c         | 2 +-
>  xen/tools/kconfig/lxdialog/util.c            | 2 +-
>  xen/tools/kconfig/lxdialog/yesno.c           | 2 +-
>  xen/tools/kconfig/nconf.h                    | 2 +-
>  xen/tools/kconfig/parser.y                   | 2 +-
>  xen/tools/kconfig/qconf.h                    | 2 +-
>  72 files changed, 72 insertions(+), 72 deletions(-)
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index 7f6e9ad065..f6632d6900 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -20,7 +20,7 @@ SPDX
>  New files should start with a single-line SPDX comment to express the
>  license, e.g.:
>  
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  
>  See LICENSES/ for a list of licenses and SPDX tags currently used.
>  
> diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
> index c56caba010..d99b507093 100644
> --- a/xen/arch/arm/alternative.c
> +++ b/xen/arch/arm/alternative.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * alternative runtime patching
>   * inspired by the x86 version
> diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
> index 30a7aa1e8e..063611412b 100644
> --- a/xen/arch/arm/arm32/mmu/mm.c
> +++ b/xen/arch/arm/arm32/mmu/mm.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  
>  #include <xen/init.h>
>  #include <xen/lib.h>
> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
> index 0de4f3c079..671eaadbc1 100644
> --- a/xen/arch/arm/arm64/mmu/mm.c
> +++ b/xen/arch/arm/arm64/mmu/mm.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  
>  #include <xen/init.h>
>  #include <xen/mm.h>
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index afd0605922..eef9c0ea0e 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #include <xen/cpu.h>
>  #include <xen/cpumask.h>
>  #include <xen/init.h>
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index b45dbe3c66..1a80738571 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * Contains CPU feature definitions
>   *
> diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
> index 5569efa121..773a0a2592 100644
> --- a/xen/arch/arm/dm.c
> +++ b/xen/arch/arm/dm.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * Copyright (c) 2019 Arm ltd.
>   */
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 669970c86f..2c30792de8 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #include <xen/init.h>
>  #include <xen/compile.h>
>  #include <xen/lib.h>
> diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
> index 12a12ee781..9d047065ba 100644
> --- a/xen/arch/arm/domctl.c
> +++ b/xen/arch/arm/domctl.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /******************************************************************************
>   * Arch-specific domctl.c
>   *
> diff --git a/xen/arch/arm/early_printk.c b/xen/arch/arm/early_printk.c
> index 03cbe0fb88..9c54f77c78 100644
> --- a/xen/arch/arm/early_printk.c
> +++ b/xen/arch/arm/early_printk.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * printk() for use before the final page tables are setup.
>   *
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 55bed3fe87..5fd83af25a 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * xen/arch/arm/gic-v3-its.c
>   *
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index eb0a5535e4..de4b0eb4a4 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * xen/arch/arm/gic-v3-lpi.c
>   *
> diff --git a/xen/arch/arm/guest_atomics.c b/xen/arch/arm/guest_atomics.c
> index 6ba77f082d..678b57d197 100644
> --- a/xen/arch/arm/guest_atomics.c
> +++ b/xen/arch/arm/guest_atomics.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * arch/arm/guest_atomics.c
>   */
> diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
> index 2f7d3a0da7..09fe486598 100644
> --- a/xen/arch/arm/guest_walk.c
> +++ b/xen/arch/arm/guest_walk.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * Guest page table walk
>   * Copyright (c) 2017 Sergej Proskurin <proskurin@sec.in.tum.de>
> diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
> index 6716b03561..497e785ec4 100644
> --- a/xen/arch/arm/guestcopy.c
> +++ b/xen/arch/arm/guestcopy.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #include <xen/domain_page.h>
>  #include <xen/guest_access.h>
>  #include <xen/lib.h>
> diff --git a/xen/arch/arm/hvm.c b/xen/arch/arm/hvm.c
> index 0989309fea..86e49bf474 100644
> --- a/xen/arch/arm/hvm.c
> +++ b/xen/arch/arm/hvm.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * arch/arm/hvm.c
>   *
> diff --git a/xen/arch/arm/include/asm/nospec.h b/xen/arch/arm/include/asm/nospec.h
> index efac51fc03..9c70eed605 100644
> --- a/xen/arch/arm/include/asm/nospec.h
> +++ b/xen/arch/arm/include/asm/nospec.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /* Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved. */
>  
>  #ifndef _ASM_ARM_NOSPEC_H
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> index 2e829d2e7f..b4211f0159 100644
> --- a/xen/arch/arm/ioreq.c
> +++ b/xen/arch/arm/ioreq.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * arm/ioreq.c: hardware virtual machine I/O emulation
>   *
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 674388fa11..669d143cee 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * Kernel image loading.
>   *
> diff --git a/xen/arch/arm/livepatch.c b/xen/arch/arm/livepatch.c
> index bbca1e5a5e..037746d952 100644
> --- a/xen/arch/arm/livepatch.c
> +++ b/xen/arch/arm/livepatch.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   *  Copyright (C) 2016 Citrix Systems R&D Ltd.
>   */
> diff --git a/xen/arch/arm/mem_access.c b/xen/arch/arm/mem_access.c
> index 31db846354..0ec3462364 100644
> --- a/xen/arch/arm/mem_access.c
> +++ b/xen/arch/arm/mem_access.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * arch/arm/mem_access.c
>   *
> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> index 1725cca649..bfa312cc8a 100644
> --- a/xen/arch/arm/mmu/p2m.c
> +++ b/xen/arch/arm/mmu/p2m.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #include <xen/cpu.h>
>  #include <xen/domain_page.h>
>  #include <xen/ioreq.h>
> diff --git a/xen/arch/arm/monitor.c b/xen/arch/arm/monitor.c
> index 6c93a9e993..49f5df8513 100644
> --- a/xen/arch/arm/monitor.c
> +++ b/xen/arch/arm/monitor.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * arch/arm/monitor.c
>   *
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 2465c266e9..65b70955e3 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #include <xen/iocap.h>
>  #include <xen/lib.h>
>  #include <xen/sched.h>
> diff --git a/xen/arch/arm/percpu.c b/xen/arch/arm/percpu.c
> index 87fe960330..124e7463f7 100644
> --- a/xen/arch/arm/percpu.c
> +++ b/xen/arch/arm/percpu.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #include <xen/percpu.h>
>  #include <xen/cpu.h>
>  #include <xen/init.h>
> diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
> index 7b1682ee10..d63a8bf5ae 100644
> --- a/xen/arch/arm/physdev.c
> +++ b/xen/arch/arm/physdev.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /******************************************************************************
>   * Arch-specific physdev.c
>   *
> diff --git a/xen/arch/arm/platform_hypercall.c b/xen/arch/arm/platform_hypercall.c
> index fde4bc3e58..ac55622426 100644
> --- a/xen/arch/arm/platform_hypercall.c
> +++ b/xen/arch/arm/platform_hypercall.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /******************************************************************************
>   * platform_hypercall.c
>   *
> diff --git a/xen/arch/arm/shutdown.c b/xen/arch/arm/shutdown.c
> index 205a5e7f8c..c9778e5786 100644
> --- a/xen/arch/arm/shutdown.c
> +++ b/xen/arch/arm/shutdown.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #include <xen/console.h>
>  #include <xen/cpu.h>
>  #include <xen/delay.h>
> diff --git a/xen/arch/arm/smp.c b/xen/arch/arm/smp.c
> index bb65a08fc1..c11bba93ad 100644
> --- a/xen/arch/arm/smp.c
> +++ b/xen/arch/arm/smp.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #include <xen/mm.h>
>  #include <asm/system.h>
>  #include <asm/smp.h>
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index 5cda0dc674..32cab4feff 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /******************************************************************************
>   * Arch-specific sysctl.c
>   *
> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
> index 70b5aeb822..c65c1dbf52 100644
> --- a/xen/arch/arm/vgic-v3-its.c
> +++ b/xen/arch/arm/vgic-v3-its.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * xen/arch/arm/vgic-v3-its.c
>   *
> diff --git a/xen/arch/arm/vm_event.c b/xen/arch/arm/vm_event.c
> index ccfd25bbbc..31812d9da3 100644
> --- a/xen/arch/arm/vm_event.c
> +++ b/xen/arch/arm/vm_event.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * arch/arm/vm_event.c
>   *
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index 7856b4b5f5..1fc3114cce 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * arch/arm/vpl011.c
>   *
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index 7f2f5eb9ce..f679cced7f 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * xen/arch/arm/vsmc.c
>   *
> diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.c
> index 610c814f54..634141354c 100644
> --- a/xen/arch/riscv/early_printk.c
> +++ b/xen/arch/riscv/early_printk.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * RISC-V early printk using SBI
>   *
> diff --git a/xen/arch/riscv/include/asm/acpi.h b/xen/arch/riscv/include/asm/acpi.h
> index 3aef993d81..fdfdcbb4eb 100644
> --- a/xen/arch/riscv/include/asm/acpi.h
> +++ b/xen/arch/riscv/include/asm/acpi.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  
>  #ifndef __ASM_RISCV_ACPI_H
>  #define __ASM_RISCV_ACPI_H
> diff --git a/xen/arch/riscv/include/asm/bitops.h b/xen/arch/riscv/include/asm/bitops.h
> index 7f7af3fda1..c2ca6521f4 100644
> --- a/xen/arch/riscv/include/asm/bitops.h
> +++ b/xen/arch/riscv/include/asm/bitops.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /* Copyright (C) 2012 Regents of the University of California */
>  
>  #ifndef _ASM_RISCV_BITOPS_H
> diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
> index e3d41f411a..f394a58387 100644
> --- a/xen/arch/riscv/include/asm/bug.h
> +++ b/xen/arch/riscv/include/asm/bug.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * Copyright (C) 2012 Regents of the University of California
>   * Copyright (C) 2021-2023 Vates
> diff --git a/xen/arch/riscv/include/asm/cache.h b/xen/arch/riscv/include/asm/cache.h
> index 69573eb051..c327b72155 100644
> --- a/xen/arch/riscv/include/asm/cache.h
> +++ b/xen/arch/riscv/include/asm/cache.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  
>  #ifndef _ASM_RISCV_CACHE_H
>  #define _ASM_RISCV_CACHE_H
> diff --git a/xen/arch/riscv/include/asm/string.h b/xen/arch/riscv/include/asm/string.h
> index a26ba8f5c6..22aa714a45 100644
> --- a/xen/arch/riscv/include/asm/string.h
> +++ b/xen/arch/riscv/include/asm/string.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  
>  #ifndef _ASM_RISCV_STRING_H
>  #define _ASM_RISCV_STRING_H
> diff --git a/xen/arch/x86/cpu/mcheck/intel-nonfatal.c b/xen/arch/x86/cpu/mcheck/intel-nonfatal.c
> index 092a828812..607c0f88c9 100644
> --- a/xen/arch/x86/cpu/mcheck/intel-nonfatal.c
> +++ b/xen/arch/x86/cpu/mcheck/intel-nonfatal.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * Non Fatal Machine Check Exception Reporting
>   * (C) Copyright 2002 Dave Jones. <davej@codemonkey.org.uk>
> diff --git a/xen/arch/x86/debug.c b/xen/arch/x86/debug.c
> index b10f1f12b6..e99e663ba5 100644
> --- a/xen/arch/x86/debug.c
> +++ b/xen/arch/x86/debug.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * Copyright (C) 2023 XenServer.
>   */
> diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
> index 43245e13de..9bfed5ffd7 100644
> --- a/xen/arch/x86/hvm/svm/nestedhvm.h
> +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * nestedsvm.h: Nested Virtualization
>   *
> diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
> index 8dbf37ff49..beeaaab4f7 100644
> --- a/xen/arch/x86/hvm/svm/svm.h
> +++ b/xen/arch/x86/hvm/svm/svm.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * svm.h: SVM Architecture related definitions
>   *
> diff --git a/xen/arch/x86/include/asm/gdbsx.h b/xen/arch/x86/include/asm/gdbsx.h
> index e906be9ea3..6315a7cfeb 100644
> --- a/xen/arch/x86/include/asm/gdbsx.h
> +++ b/xen/arch/x86/include/asm/gdbsx.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #ifndef __X86_GDBX_H__
>  #define __X86_GDBX_H__
>  
> diff --git a/xen/arch/x86/include/asm/guest/hyperv-tlfs.h b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
> index a6915ad731..79cfc90dd8 100644
> --- a/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
> +++ b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  
>  /*
>   * This file contains definitions from Hyper-V Hypervisor Top-Level Functional
> diff --git a/xen/arch/x86/include/asm/intel-family.h b/xen/arch/x86/include/asm/intel-family.h
> index d44dd3f69f..ab20cce124 100644
> --- a/xen/arch/x86/include/asm/intel-family.h
> +++ b/xen/arch/x86/include/asm/intel-family.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #ifndef _ASM_X86_INTEL_FAMILY_H
>  #define _ASM_X86_INTEL_FAMILY_H
>  
> diff --git a/xen/arch/x86/include/asm/nospec.h b/xen/arch/x86/include/asm/nospec.h
> index e058a3bb0e..150e78e884 100644
> --- a/xen/arch/x86/include/asm/nospec.h
> +++ b/xen/arch/x86/include/asm/nospec.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /* Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved. */
>  
>  #ifndef _ASM_X86_NOSPEC_H
> diff --git a/xen/arch/x86/include/asm/prot-key.h b/xen/arch/x86/include/asm/prot-key.h
> index 0dcd31b7ea..0cbecc2df4 100644
> --- a/xen/arch/x86/include/asm/prot-key.h
> +++ b/xen/arch/x86/include/asm/prot-key.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * Copyright (c) 2021-2022 Citrix Systems Ltd.
>   */
> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
> index 911a630e7d..927f59c64b 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * Early Device Tree
>   *
> diff --git a/xen/common/sched/boot-cpupool.c b/xen/common/sched/boot-cpupool.c
> index feeac3b704..641f3495cb 100644
> --- a/xen/common/sched/boot-cpupool.c
> +++ b/xen/common/sched/boot-cpupool.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * xen/common/boot_cpupools.c
>   *
> diff --git a/xen/include/asm-generic/atomic-ops.h b/xen/include/asm-generic/atomic-ops.h
> index 98dd907942..769583b766 100644
> --- a/xen/include/asm-generic/atomic-ops.h
> +++ b/xen/include/asm-generic/atomic-ops.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * The header provides default implementations for every xen/atomic.h-provided
>   * forward inline declaration that can be synthesized from other atomic
> diff --git a/xen/include/asm-generic/monitor.h b/xen/include/asm-generic/monitor.h
> index 1ade289099..cad2b6ff24 100644
> --- a/xen/include/asm-generic/monitor.h
> +++ b/xen/include/asm-generic/monitor.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * include/asm-generic/monitor.h
>   *
> diff --git a/xen/include/xen/alternative-call.h b/xen/include/xen/alternative-call.h
> index 10f7d7637e..62672b7324 100644
> --- a/xen/include/xen/alternative-call.h
> +++ b/xen/include/xen/alternative-call.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #ifndef XEN_ALTERNATIVE_CALL
>  #define XEN_ALTERNATIVE_CALL
>  
> diff --git a/xen/include/xen/nospec.h b/xen/include/xen/nospec.h
> index 828dbd4e0a..c8167a8a24 100644
> --- a/xen/include/xen/nospec.h
> +++ b/xen/include/xen/nospec.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /* Copyright(c) 2018 Linus Torvalds. All rights reserved. */
>  /* Copyright(c) 2018 Alexei Starovoitov. All rights reserved. */
>  /* Copyright(c) 2018 Intel Corporation. All rights reserved. */
> diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
> index d9bb599e65..8c8b08338b 100644
> --- a/xen/include/xen/unaligned.h
> +++ b/xen/include/xen/unaligned.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #ifndef __XEN_UNALIGNED_H__
>  #define __XEN_UNALIGNED_H__
>  
> diff --git a/xen/tools/kconfig/expr.h b/xen/tools/kconfig/expr.h
> index 017843c9a4..fd08add33f 100644
> --- a/xen/tools/kconfig/expr.h
> +++ b/xen/tools/kconfig/expr.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
>   */
> diff --git a/xen/tools/kconfig/images.h b/xen/tools/kconfig/images.h
> index d8ff614bd0..565466511d 100644
> --- a/xen/tools/kconfig/images.h
> +++ b/xen/tools/kconfig/images.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
>   */
> diff --git a/xen/tools/kconfig/lexer.l b/xen/tools/kconfig/lexer.l
> index 4b7339ff4c..1e57543900 100644
> --- a/xen/tools/kconfig/lexer.l
> +++ b/xen/tools/kconfig/lexer.l
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
>   */
> diff --git a/xen/tools/kconfig/list.h b/xen/tools/kconfig/list.h
> index 45cb237ab7..979cd516d6 100644
> --- a/xen/tools/kconfig/list.h
> +++ b/xen/tools/kconfig/list.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #ifndef LIST_H
>  #define LIST_H
>  
> diff --git a/xen/tools/kconfig/lkc.h b/xen/tools/kconfig/lkc.h
> index 4fb16f3166..18282e7b0b 100644
> --- a/xen/tools/kconfig/lkc.h
> +++ b/xen/tools/kconfig/lkc.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
>   */
> diff --git a/xen/tools/kconfig/lkc_proto.h b/xen/tools/kconfig/lkc_proto.h
> index f9ab98238a..7598a2ef20 100644
> --- a/xen/tools/kconfig/lkc_proto.h
> +++ b/xen/tools/kconfig/lkc_proto.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #include <stdarg.h>
>  
>  /* confdata.c */
> diff --git a/xen/tools/kconfig/lxdialog/checklist.c b/xen/tools/kconfig/lxdialog/checklist.c
> index fd161cfff1..29960ed000 100644
> --- a/xen/tools/kconfig/lxdialog/checklist.c
> +++ b/xen/tools/kconfig/lxdialog/checklist.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   *  checklist.c -- implements the checklist box
>   *
> diff --git a/xen/tools/kconfig/lxdialog/dialog.h b/xen/tools/kconfig/lxdialog/dialog.h
> index 68b565e3c4..3930d93a4a 100644
> --- a/xen/tools/kconfig/lxdialog/dialog.h
> +++ b/xen/tools/kconfig/lxdialog/dialog.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0+ */
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>  /*
>   *  dialog.h -- common declarations for all dialog modules
>   *
> diff --git a/xen/tools/kconfig/lxdialog/inputbox.c b/xen/tools/kconfig/lxdialog/inputbox.c
> index 1dcfb288ee..b8b6f15779 100644
> --- a/xen/tools/kconfig/lxdialog/inputbox.c
> +++ b/xen/tools/kconfig/lxdialog/inputbox.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   *  inputbox.c -- implements the input box
>   *
> diff --git a/xen/tools/kconfig/lxdialog/menubox.c b/xen/tools/kconfig/lxdialog/menubox.c
> index 58c2f8afe5..4287745566 100644
> --- a/xen/tools/kconfig/lxdialog/menubox.c
> +++ b/xen/tools/kconfig/lxdialog/menubox.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   *  menubox.c -- implements the menu box
>   *
> diff --git a/xen/tools/kconfig/lxdialog/textbox.c b/xen/tools/kconfig/lxdialog/textbox.c
> index 4e339b1266..b5987735b0 100644
> --- a/xen/tools/kconfig/lxdialog/textbox.c
> +++ b/xen/tools/kconfig/lxdialog/textbox.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   *  textbox.c -- implements the text box
>   *
> diff --git a/xen/tools/kconfig/lxdialog/util.c b/xen/tools/kconfig/lxdialog/util.c
> index 1b490d4af0..0de2b05352 100644
> --- a/xen/tools/kconfig/lxdialog/util.c
> +++ b/xen/tools/kconfig/lxdialog/util.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   *  util.c
>   *
> diff --git a/xen/tools/kconfig/lxdialog/yesno.c b/xen/tools/kconfig/lxdialog/yesno.c
> index bcaac9b7ba..ff1db42b3d 100644
> --- a/xen/tools/kconfig/lxdialog/yesno.c
> +++ b/xen/tools/kconfig/lxdialog/yesno.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   *  yesno.c -- implements the yes/no box
>   *
> diff --git a/xen/tools/kconfig/nconf.h b/xen/tools/kconfig/nconf.h
> index fa5245eb93..eab138b30d 100644
> --- a/xen/tools/kconfig/nconf.h
> +++ b/xen/tools/kconfig/nconf.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * Copyright (C) 2008 Nir Tzachar <nir.tzachar@gmail.com>
>   *
> diff --git a/xen/tools/kconfig/parser.y b/xen/tools/kconfig/parser.y
> index 822fc89fc8..5bac26bd91 100644
> --- a/xen/tools/kconfig/parser.y
> +++ b/xen/tools/kconfig/parser.y
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
>   */
> diff --git a/xen/tools/kconfig/qconf.h b/xen/tools/kconfig/qconf.h
> index 45bfe9b2b9..61ecd5bdab 100644
> --- a/xen/tools/kconfig/qconf.h
> +++ b/xen/tools/kconfig/qconf.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
>   */
> -- 
> 2.34.1
> 

