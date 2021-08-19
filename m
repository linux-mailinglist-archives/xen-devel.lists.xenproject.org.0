Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CF83F1F59
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 19:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169016.308722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGm6b-0006JR-Cy; Thu, 19 Aug 2021 17:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169016.308722; Thu, 19 Aug 2021 17:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGm6b-0006He-9t; Thu, 19 Aug 2021 17:45:29 +0000
Received: by outflank-mailman (input) for mailman id 169016;
 Thu, 19 Aug 2021 17:45:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mGm6Z-0006HU-UC
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 17:45:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGm6Z-0005ji-0h; Thu, 19 Aug 2021 17:45:27 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGm6Y-00024s-Qu; Thu, 19 Aug 2021 17:45:26 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=pFqZsKzhb4YIaKYTWTcRbXcuZAxZ3s9MrUcpkenNgOk=; b=NMpmFVQ4EsIwamewRPW2Jh1TQq
	LoRLPwcpNZtganDMOwJg0LC6CMRlQv6/puWZe5as+j9cz3WIYX6yCAI2963qmQf9/K6ckdbIXjl0/
	cuAedUIDN3j6GO0F2A547B/yL0r6iZMriPb3xcz8TXn4D7VX3WLJHgyzgylEu3PSFr8I=;
Subject: Re: [XEN RFC PATCH 21/40] xen/arm: introduce device_tree_numa as a
 switch for device tree NUMA
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-22-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c83a7bcc-7d74-c01c-e91a-eeb11dd348d1@xen.org>
Date: Thu, 19 Aug 2021 18:45:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-22-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:24, Wei Chen wrote:
> Like acpi_numa in x86 as a switch for ACPI based NUMA, we introduce
> device_tree_numa as a switch for Arm device tree based NUMA. When
> NUMA information in device tree is invalid, this switch will be set
> to -1, then NUMA support for Arm will be disabled, even if user set
> numa_off=0.

The hypervisor will never use both ACPI and DT at runtime. In fact...

> 
> Keep using bad_srat and srat_disabled functions name, because we will
> reuse node_covers_memory and acpi_scan_nodes code for Arm.

... given that both functions will be called from the common code, it 
will be a lot more difficult to add ACPI afterwards.

So I think we should either rename acpi_numa to something more generic 
(maybe fw_numa) or convert numa_off to a tri-state.

This will allow to have the code mostly common.

> These
> functions are using these two API names. And, as device tree can be
> treated as one kind of static resource table. So we keep these two
> function names.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/Makefile           |  1 +
>   xen/arch/arm/numa_device_tree.c | 35 +++++++++++++++++++++++++++++++++
>   xen/include/asm-arm/numa.h      |  2 ++
>   3 files changed, 38 insertions(+)
>   create mode 100644 xen/arch/arm/numa_device_tree.c
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 6e3fb8033e..13e1549be0 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -36,6 +36,7 @@ obj-y += mem_access.o
>   obj-y += mm.o
>   obj-y += monitor.o
>   obj-$(CONFIG_NUMA) += numa.o
> +obj-$(CONFIG_DEVICE_TREE_NUMA) += numa_device_tree.o
>   obj-y += p2m.o
>   obj-y += percpu.o
>   obj-y += platform.o
> diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
> new file mode 100644
> index 0000000000..1c74ad135d
> --- /dev/null
> +++ b/xen/arch/arm/numa_device_tree.c
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Arm Architecture support layer for NUMA.
> + *
> + * Copyright (C) 2021 Arm Ltd
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
> + */
> +#include <xen/init.h>
> +#include <xen/nodemask.h>
> +#include <xen/numa.h>
> +
> +s8 device_tree_numa = 0;
> +
> +int srat_disabled(void)

You export this one and ...

> +void __init bad_srat(void)

... this one without providing in a prototype.

Looking at the rest of the series... they will be turned static in the 
next patch (#21) but then re-exported in patch #33.

In general, we should refrain to modify code that was added in the same 
patch unless it is not possible for split reason (e.g code clean-up and 
then code movement).

In this case, the helpers should be exported from now.

> +{
> +    printk(KERN_ERR "DT: NUMA information is not used.\n");
> +    device_tree_numa = -1;
> +}
> diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
> index 559b028a01..756ad82d07 100644
> --- a/xen/include/asm-arm/numa.h
> +++ b/xen/include/asm-arm/numa.h
> @@ -23,6 +23,8 @@ typedef u8 nodeid_t;
>   #define NUMA_LOCAL_DISTANCE     10
>   #define NUMA_REMOTE_DISTANCE    20
>   
> +extern s8 device_tree_numa;
> +
>   extern void numa_init(bool acpi_off);
>   extern void numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance);
>   
> 

Cheers,

-- 
Julien Grall

