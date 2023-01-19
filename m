Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AB8673B88
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 15:20:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481164.745886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVmA-0008I1-UR; Thu, 19 Jan 2023 14:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481164.745886; Thu, 19 Jan 2023 14:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVmA-0008G9-Rr; Thu, 19 Jan 2023 14:20:22 +0000
Received: by outflank-mailman (input) for mailman id 481164;
 Thu, 19 Jan 2023 14:20:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pIVmA-0008G3-Bb
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 14:20:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIVmA-0004Ju-2f; Thu, 19 Jan 2023 14:20:22 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.13.107]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIVm9-0006jp-SJ; Thu, 19 Jan 2023 14:20:22 +0000
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
	bh=amZswHTQjsYeHewrevFLzhZrNwSS5O/8T/WGMeSpCI0=; b=2oJX94asqNNDyDZeCWivruVNr7
	+Dad3hiYB+qLnn8BM2WvIoWC38ECoBsOLotUiGkSZwO+zhP7kcHJWxOq/DrDvbu5WmWVP81EsY6EH
	J7TDtYY4gkFfYfCtWaSc3HDQI+4uHqI5/JezEUeg3QBgH7euLSlDL5PMeI3SI0zTW9AE=;
Message-ID: <f42681d3-c08f-24bd-8f10-aa53930081b0@xen.org>
Date: Thu, 19 Jan 2023 14:20:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 10/40] xen/arm: split MMU and MPU config files from
 config.h
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-11-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230113052914.3845596-11-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/01/2023 05:28, Penny Zheng wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> Xen defines some global configuration macros for Arm in
> config.h. We still want to use it for Armv8-R systems, but
> there are some address related macros that are defined for
> MMU systems. These macros will not be used by MPU systems,
> Adding ifdefery with CONFIG_HAS_MPU to gate these macros
> will result in a messy and hard-to-read/maintain code.
> 
> So we keep some common definitions still in config.h, but
> move virtual address related definitions to a new file -
> config_mmu.h. And use a new file config_mpu.h to store
> definitions for MPU systems. To avoid spreading #ifdef
> everywhere, we keep the same definition names for MPU
> systems, like XEN_VIRT_START and HYPERVISOR_VIRT_START,
> but the definition contents are MPU specific.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v1 -> v2:
> 1. Remove duplicated FIXMAP definitions from config_mmu.h
> ---
>   xen/arch/arm/include/asm/config.h     | 103 +++--------------------
>   xen/arch/arm/include/asm/config_mmu.h | 112 ++++++++++++++++++++++++++
>   xen/arch/arm/include/asm/config_mpu.h |  25 ++++++

I think this patch wants to be split in two. So we keep code movement 
separate from the introduction of new feature (e.g. MPU).

Furthermore, I think it would be better to name the new header layout_* 
(or similar).

Lastly, you are going to introduce several file with _mmu or _mpu. I 
would rather prefer if we create directory instead.


>   3 files changed, 147 insertions(+), 93 deletions(-)
>   create mode 100644 xen/arch/arm/include/asm/config_mmu.h
>   create mode 100644 xen/arch/arm/include/asm/config_mpu.h
> 
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
> index 25a625ff08..86d8142959 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -48,6 +48,12 @@
>   
>   #define INVALID_VCPU_ID MAX_VIRT_CPUS
>   
> +/* Used for calculating PDX */

I am not entirely sure to understand the purpose of this comment.

> +#ifdef CONFIG_ARM_64
> +#define FRAMETABLE_SIZE        GB(32)
> +#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
> +#endif
> +

Why do you only keep the 64-bit version in config.h?

However... the frametable size is limited by the space we reserve in the 
virtual address space. This would not be the case for the MPU.

So having the limit in common seems a bit odd. In fact, I think we 
should look at getting rid of the limit for the MPU.

[...]

> diff --git a/xen/arch/arm/include/asm/config_mmu.h b/xen/arch/arm/include/asm/config_mmu.h
> new file mode 100644
> index 0000000000..c12ff25cf4
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/config_mmu.h
> @@ -0,0 +1,112 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/******************************************************************************
> + * config_mmu.h
> + *
> + * A Linux-style configuration list, only can be included by config.h

Why do you need to restrict where this is included? And if you really 
need it, then you should check it.

Cheers,

-- 
Julien Grall

