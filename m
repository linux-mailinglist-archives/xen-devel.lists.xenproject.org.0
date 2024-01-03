Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA0E823039
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jan 2024 16:11:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660964.1030662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rL2tA-00073b-Pc; Wed, 03 Jan 2024 15:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660964.1030662; Wed, 03 Jan 2024 15:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rL2tA-00071O-Mw; Wed, 03 Jan 2024 15:10:36 +0000
Received: by outflank-mailman (input) for mailman id 660964;
 Wed, 03 Jan 2024 15:10:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rL2t9-00071I-M9
 for xen-devel@lists.xenproject.org; Wed, 03 Jan 2024 15:10:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rL2t8-0001M8-Tu; Wed, 03 Jan 2024 15:10:34 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.6.12])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rL2t8-0002Jv-MA; Wed, 03 Jan 2024 15:10:34 +0000
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
	bh=z86yiwuWRdk7PWdIze4M68IkZGZ24eESYeRXBDOMy8E=; b=O5lGFMk+0EYL9nQcwTdMN9/cWF
	00Ox51XKqDnpfAigDlGB8QuFW3Kz4Zb5M5t7JNjGNwiqtimjeM3sWf177HnNJRiClIkSV2lMwcVDO
	f5XXGrO9IYp763luoMet1c1XmqWqJRLOvo8ZFX5ufyW0xY1YBZUohT2IwTeJtl6UJx/k=;
Message-ID: <a19d8964-733a-4037-bef6-3cdd79f56f13@xen.org>
Date: Wed, 3 Jan 2024 15:10:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/17] xen/arm: implement helpers to get and update
 NUMA status
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231120025431.14845-1-Henry.Wang@arm.com>
 <20231120025431.14845-3-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231120025431.14845-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 20/11/2023 02:54, Henry Wang wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> NUMA has one global and one implementation specific switches. For
> ACPI NUMA implementation, Xen has acpi_numa, so we introduce
> device_tree_numa for device tree NUMA implementation. And use
> enumerations to indicate init, off and on status.
> 
> arch_numa_disabled will get device_tree_numa status, but for
> arch_numa_setup we have not provided boot arguments to setup
> device_tree_numa. So we just return -EINVAL in this patch.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> v3 -> v6:
> - Rebase on top of staging without code changes.
> v2 -> v3:
> - Rename the first entry of enum dt_numa_status as DT_NUMA_DEFAULT.
> - Make enum dt_numa_status device_tree_numa as __ro_after_init and
> - assign it explicitly to DT_NUMA_DEFAULT.
> - Update the year in copyright to 2023.
> - Don't move the x86 numa_disabled() and make Arm's numa_disabled()
>    a static inline function for !CONFIG_NUMA.
> v1 -> v2:
> - Use arch_numa_disabled to replace numa_enable_with_firmware.
> - Introduce enumerations for device tree numa status.
> - Use common numa_disabled, drop Arm version numa_disabled.
> - Introduce arch_numa_setup for Arm.
> - Rename bad_srat to numa_bad.
> - Add numa_enable_with_firmware helper.
> - Add numa_disabled helper.
> - Refine commit message.
> ---
>   xen/arch/arm/include/asm/numa.h | 17 +++++++++++
>   xen/arch/arm/numa.c             | 50 +++++++++++++++++++++++++++++++++
>   2 files changed, 67 insertions(+)
>   create mode 100644 xen/arch/arm/numa.c
> 
> diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
> index 7d6ae36a19..83f60ad05b 100644
> --- a/xen/arch/arm/include/asm/numa.h
> +++ b/xen/arch/arm/include/asm/numa.h
> @@ -22,6 +22,8 @@ typedef u8 nodeid_t;
>    */
>   #define NR_NODE_MEMBLKS NR_MEM_BANKS
>   
> +extern bool numa_disabled(void);
> +
>   #else
>   
>   /* Fake one node for now. See also node_online_map. */
> @@ -39,6 +41,21 @@ extern mfn_t first_valid_mfn;
>   #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
>   #define __node_distance(a, b) (20)
>   
> +static inline bool numa_disabled(void)
> +{
> +    return true;
> +}
> +
> +static inline bool arch_numa_unavailable(void)
> +{
> +    return true;
> +}
> +
> +static inline bool arch_numa_broken(void)
> +{
> +    return true;
> +}
> +
>   #endif
>   
>   #define arch_want_default_dmazone() (false)
> diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
> new file mode 100644
> index 0000000000..eb5d0632cb
> --- /dev/null
> +++ b/xen/arch/arm/numa.c
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Please use GPL-2.0-only for the SPDX tag.

> +/*
> + * Arm Architecture support layer for NUMA.
> + *
> + * Copyright (C) 2023 Arm Ltd
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + *

You provided a SPDX tag, so the full license txt should not be added.

> + */
> +#include <xen/init.h>
> +#include <xen/numa.h>
> +
> +enum dt_numa_status {
> +    DT_NUMA_DEFAULT,
> +    DT_NUMA_ON,
> +    DT_NUMA_OFF,
> +};

NIT: I am guessing at some point we will want to support ACPI. So I 
would consider to remove dt/DT from the name. So we avoid some churn in 
the future.

> +
> +static enum dt_numa_status __ro_after_init device_tree_numa = DT_NUMA_DEFAULT;
> +
> +void __init numa_fw_bad(void)
> +{
> +    printk(KERN_ERR "NUMA: device tree numa info table not used.\n");

KERN_ERR is used for compatibility with Linux. Given this is a Xen file, 
then please use XENLOG_ERR.

Acked-by: Julien Grall <julien@xen.org>

Cheers,

-- 
Julien Grall

