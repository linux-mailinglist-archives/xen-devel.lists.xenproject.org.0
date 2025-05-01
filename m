Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8760EAA5933
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 02:55:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974002.1361995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAICu-0004U6-BG; Thu, 01 May 2025 00:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974002.1361995; Thu, 01 May 2025 00:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAICu-0004RY-88; Thu, 01 May 2025 00:55:20 +0000
Received: by outflank-mailman (input) for mailman id 974002;
 Thu, 01 May 2025 00:55:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iHxF=XR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uAICs-0004RS-NS
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 00:55:18 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec44c2b1-2626-11f0-9eb4-5ba50f476ded;
 Thu, 01 May 2025 02:55:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 520BD4A10E;
 Thu,  1 May 2025 00:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239F4C4CEE7;
 Thu,  1 May 2025 00:55:04 +0000 (UTC)
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
X-Inumbo-ID: ec44c2b1-2626-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746060905;
	bh=0iSut6SScykJykpwZeueBQXI4fW87kdwDUpgetlYg+c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Y5Rv1kpjzeUNvEHPhznO1l5SJ64/5S2g0DGv5mMWEusM5vTYzNF8ncOcxi4ekYktB
	 LlMD55SlWA3/PQP+iXs0Si7DDB22Ta6db+x2BUWNI6+MEVST1BebLCQTyZ+Vz6OaoU
	 OYHMavlEgPGaFhxMfqbjAiAcjY53lYTq6LUWjcIIDTOenm3sIg0sydwbjHT15wmR1R
	 5gNK9ewo2nIl2ZwccNJ5OaJVVXqJKkF/1+dHuvC2dVZ6d8oXoLJJ6ygMuKlV4K4JOv
	 k9ZKa0Noq6Hsgs3xrZXBIQ4oV23+HW52A03BRWcT0XogmPZ+3HIjXOeBA8pyl2eh3t
	 cDIqfUv0O1u7Q==
Date: Wed, 30 Apr 2025 17:55:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 0/8] Move parts of Arm's Dom0less to common code
In-Reply-To: <cover.1744626032.git.oleksii.kurochko@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2504301754320.3879245@ubuntu-linux-20-04-desktop>
References: <cover.1744626032.git.oleksii.kurochko@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

The patch series needs to be rebased. Actually, I couldn't find a
baseline where to apply patch #2 successfully

On Mon, 14 Apr 2025, Oleksii Kurochko wrote:
> Some parts of Arm's Dom0less solution could be moved to common code as they are
> not truly Arm-specific.
> 
> Most of the code is moved as is, with only minor changes introduced to provide
> abstractions that hide Arm-specific details, while maintaining functional
> equivalence with original Arm's code.
> 
> There are several open questions:
> 1. Probably, the introduced headers currently placed in asm-generic should
>    instead reside in the xen/include folder.
> 2. Perhaps the introduced *.c files should always be placed elsewhere. They
>    have been put in device-tree common as they somewhat depend on device tree
>    functionality.
> 3. The u64 and u32 types are widely used in the code where device tree
>    functionality is implemented because these types are used in device tree
>    function arguments.
>    Should this be reworked to use uint32_t and uint64_t instead? If so, will it
>    also be necessary to change the type of variables passed to dt-related
>    functions, or should the argument types of device tree functions be updated
>    too? For example:
>    ```
>     u64 mem;
>     ...
>     rc = dt_property_read_u64(node, "memory", &mem);
>    ```
>    where dt_property_read_u64 is declared as:
>      bool dt_property_read_u64(... , u64 *out_value);
> 4. Instead of providing init_intc_phandle() (see the patch: [1]), perhaps it
>    would be better to add a for loop in domain_handle_dtb_bootmodule()?
>    Something like:
>    ```
>     bool is_intc_phandle_inited = false;
>     for ( unsigned int i = 0; i < ARRAY_SIZE(intc_names_array); i++ )
>     {
>         if ( dt_node_cmp(name, intc_names_array[i]) == 0 )
>         {
>             uint32_t phandle_intc = fdt_get_phandle(pfdt, node_next);
> 
>             if ( phandle_intc != 0 )
>                 kinfo->phandle_intc = phandle_intc;
> 
>             is_intc_phandle_inited = true;
>             break;
>         }
>     }
> 
>     if ( is_intc_phandle_inited ) continue;
>   ```
> 
> [1]] [PATCH v1 9/9] xen/common: dom0less: introduce common dom0less-build.c
> 
> ---
> Changes in v2:
> - Update cover letter message.
> - Rebase on top of the current staging.
> - Drop patches:
>    - asm-generic: move Arm's static-memory.h to asm-generic
>    - asm-generic: move Arm's static-shmem.h to asm-generic
>   as in the nearest future there is no real users of STATIC_MEMORY and
>   STATIC_SHMEM.
> - Add new cleanup patch:
>   [PATCH v2 1/8] xen/arm: drop declaration of handle_device_interrupts()
> - All other changes are patch specific. Please check them seprately for each
>   patch
> ---
> 
> Oleksii Kurochko (8):
>   xen/arm: drop declaration of handle_device_interrupts()
>   xen/common: dom0less: make some parts of Arm's CONFIG_DOM0LESS common
>   asm-generic: move parts of Arm's asm/kernel.h to common code
>   arm/static-shmem.h: drop inclusion of asm/setup.h
>   asm-generic: move some parts of Arm's domain_build.h to common
>   xen/common: dom0less: introduce common kernel.c
>   xen/common: dom0less: introduce common domain-build.c
>   xen/common: dom0less: introduce common dom0less-build.c
> 
>  xen/arch/arm/Kconfig                      |  10 +-
>  xen/arch/arm/acpi/domain_build.c          |   4 +-
>  xen/arch/arm/dom0less-build.c             | 997 +++-------------------
>  xen/arch/arm/domain_build.c               | 411 +--------
>  xen/arch/arm/include/asm/Makefile         |   1 +
>  xen/arch/arm/include/asm/dom0less-build.h |  32 -
>  xen/arch/arm/include/asm/domain_build.h   |  31 +-
>  xen/arch/arm/include/asm/kernel.h         | 126 +--
>  xen/arch/arm/include/asm/static-memory.h  |   2 +-
>  xen/arch/arm/include/asm/static-shmem.h   |   2 +-
>  xen/arch/arm/kernel.c                     | 234 +----
>  xen/arch/arm/static-memory.c              |   1 +
>  xen/arch/arm/static-shmem.c               |   3 +-
>  xen/common/Kconfig                        |  19 +
>  xen/common/device-tree/Makefile           |   3 +
>  xen/common/device-tree/dom0less-build.c   | 891 +++++++++++++++++++
>  xen/common/device-tree/domain-build.c     | 404 +++++++++
>  xen/common/device-tree/dt-overlay.c       |   4 +-
>  xen/common/device-tree/kernel.c           | 242 ++++++
>  xen/include/asm-generic/dom0less-build.h  |  82 ++
>  xen/include/xen/fdt-domain-build.h        |  77 ++
>  xen/include/xen/fdt-kernel.h              | 146 ++++
>  22 files changed, 2013 insertions(+), 1709 deletions(-)
>  delete mode 100644 xen/arch/arm/include/asm/dom0less-build.h
>  create mode 100644 xen/common/device-tree/dom0less-build.c
>  create mode 100644 xen/common/device-tree/domain-build.c
>  create mode 100644 xen/common/device-tree/kernel.c
>  create mode 100644 xen/include/asm-generic/dom0less-build.h
>  create mode 100644 xen/include/xen/fdt-domain-build.h
>  create mode 100644 xen/include/xen/fdt-kernel.h
> 
> -- 
> 2.49.0
> 

