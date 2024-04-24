Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1138B1221
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 20:23:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711606.1111680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzhGI-0002nV-LB; Wed, 24 Apr 2024 18:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711606.1111680; Wed, 24 Apr 2024 18:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzhGI-0002kt-Hz; Wed, 24 Apr 2024 18:22:30 +0000
Received: by outflank-mailman (input) for mailman id 711606;
 Wed, 24 Apr 2024 18:22:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rzhGH-0002kh-B7
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 18:22:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rzhGG-00080R-He; Wed, 24 Apr 2024 18:22:28 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rzhGG-0001i8-BE; Wed, 24 Apr 2024 18:22:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=IPEyM8OmXyPmMB3O/yIJxh0uIUAzEvYmgd8zMIP+n78=; b=C3tEJv13HBNYEc3Fet4U5KwOJH
	OoCj8nWBU1zhjhcrzQeApR4joUcQOC6p0LdWrF8H2qmKL8lZwj9snzlAh2+vG9zfJ70DiK4vi7hfD
	c4OdBIpx/witwWUVkEJpii3DB5n7VId9Uc1BLleBKPg+uT6rzAMhhyGKLlBygElTGR1g=;
Message-ID: <473659ca-208c-41dc-8edf-f032c0377e48@xen.org>
Date: Wed, 24 Apr 2024 19:22:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <cover.1712893887.git.sanastasio@raptorengineering.com>
 <451705505ff7f80ec66c78cc2830196fa6e4090c.1712893887.git.sanastasio@raptorengineering.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <451705505ff7f80ec66c78cc2830196fa6e4090c.1712893887.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Shawn,

On 12/04/2024 04:55, Shawn Anastasio wrote:
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> new file mode 100644
> index 0000000000..947bad979c
> --- /dev/null
> +++ b/xen/common/device-tree/Makefile
> @@ -0,0 +1 @@
> +obj-y += bootinfo.init.o
> diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
> new file mode 100644
> index 0000000000..914f876d29
> --- /dev/null
> +++ b/xen/common/device-tree/bootinfo.c
> @@ -0,0 +1,446 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Derived from $xen/arch/arm/setup.c.
> + *
> + * Early device tree parsing and bookkeeping routines.

Based on the discussion in v3, I think this is only containing 
bookkepping routines. So you probably want to remove "Early device tree 
parsing".

This would also make a bit clearer the difference bettwen bootfdt.c and 
bootinfo.c.

[...]

> +/*
> + * Populate the boot allocator.
> + * If a static heap was not provided by the admin, all the RAM but the
> + * following regions will be added:
> + *  - Modules (e.g., Xen, Kernel)
> + *  - Reserved regions
> + *  - Xenheap (CONFIG_SEPARATE_XENHEAP only)
> + * If a static heap was provided by the admin, populate the boot
> + * allocator with the corresponding regions only, but with Xenheap excluded
> + * on arm32.

Now this is moved in common code, I think we want to 
s/arm32/CONFIG_SEPARATE_XENHEAP/. This could be done on a follow-up commit.

[...]

> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> new file mode 100644
> index 0000000000..b0487bdbbd
> --- /dev/null
> +++ b/xen/include/xen/bootfdt.h
> @@ -0,0 +1,116 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __XEN_BOOTFDT_H__
> +#define __XEN_BOOTFDT_H__
> +
> +#include <xen/types.h>
> +
> +#define MIN_FDT_ALIGN 8
> +#define MAX_FDT_SIZE SZ_2M
> +
> +#define NR_MEM_BANKS 256
> +
> +#define MAX_MODULES 32 /* Current maximum useful modules */
> +
> +typedef enum {
> +    BOOTMOD_XEN,
> +    BOOTMOD_FDT,
> +    BOOTMOD_KERNEL,
> +    BOOTMOD_RAMDISK,
> +    BOOTMOD_XSM,
> +    BOOTMOD_GUEST_DTB,
> +    BOOTMOD_UNKNOWN
> +} bootmodule_kind;
> +
> +enum membank_type {
> +    /*
> +     * The MEMBANK_DEFAULT type refers to either reserved memory for the
> +     * device/firmware (when the bank is in 'reserved_mem') or any RAM (when
> +     * the bank is in 'mem').
> +     */
> +    MEMBANK_DEFAULT,
> +    /*
> +     * The MEMBANK_STATIC_DOMAIN type is used to indicate whether the memory
> +     * bank is bound to a static Xen domain. It is only valid when the bank
> +     * is in reserved_mem.
> +     */
> +    MEMBANK_STATIC_DOMAIN,
> +    /*
> +     * The MEMBANK_STATIC_HEAP type is used to indicate whether the memory
> +     * bank is reserved as static heap. It is only valid when the bank is
> +     * in reserved_mem.
> +     */
> +    MEMBANK_STATIC_HEAP,
> +};
> +
> +/* Indicates the maximum number of characters(\0 included) for shm_id */
> +#define MAX_SHM_ID_LENGTH 16
> +
> +struct membank {
> +    paddr_t start;
> +    paddr_t size;
> +    enum membank_type type;
> +#ifdef CONFIG_STATIC_SHM
> +    char shm_id[MAX_SHM_ID_LENGTH];
> +    unsigned int nr_shm_borrowers;
> +#endif
> +};
> +
> +struct meminfo {
> +    unsigned int nr_banks;
> +    struct membank bank[NR_MEM_BANKS];
> +};

I have just committed some code which is modifying membank/meminfo. I 
think this may need to be rebased. I have CCed the author of the series 
(Luca) who may be able to advise/help.

Cheers,

-- 
Julien Grall

