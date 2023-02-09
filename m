Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF2C69064E
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 12:16:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492337.761840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ4t7-0000j1-25; Thu, 09 Feb 2023 11:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492337.761840; Thu, 09 Feb 2023 11:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ4t6-0000ft-V8; Thu, 09 Feb 2023 11:14:48 +0000
Received: by outflank-mailman (input) for mailman id 492337;
 Thu, 09 Feb 2023 11:14:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQ4t5-0000fn-1A
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 11:14:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQ4t4-0001d6-77; Thu, 09 Feb 2023 11:14:46 +0000
Received: from [54.239.6.186] (helo=[192.168.16.230])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQ4t3-0005dm-Uz; Thu, 09 Feb 2023 11:14:46 +0000
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
	bh=0zkqc/e7rF276KWQ2dyibDzBtDXzSZp2UNgONOSp1ts=; b=m+4Ya6y3Hwn8MWzGm7K71eeKdr
	cF3U8nVSBfoKT7IPx78l40eN6GSNSMaOS/+L4UR/LzbqR1vv3pAFvxcxBzaO8zzFdYzShRuqijBSP
	nj9RsQG02jvvq1wdpH+dcZX0YznAnSoKkeSAhfNdD1BlR0vjM4H34UAg9D3o4Fxvn/5M=;
Message-ID: <967734ca-4792-6b39-07c9-c850815a289c@xen.org>
Date: Thu, 9 Feb 2023 11:14:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v2 32/40] xen/mpu: implement MPU version of ioremap_xxx
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-33-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230113052914.3845596-33-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/01/2023 05:29, Penny Zheng wrote:
> Function ioremap_xxx is normally being used to remap device address ranges
> in MMU system during device driver initialization.
> 
> However, in MPU system, virtual translation is not supported and
> device memory layout is statically configured in Device Tree, and being mapped
> at very early stage.
> So here we only add a check to verify this assumption.
> 
> But for tolerating a few cases where the function is called to map for
> temporary copy and paste, like ioremap_wc in kernel image loading, the
> region attribute mismatch will be treated as warning than error.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/include/asm/arm64/mpu.h |  1 +
>   xen/arch/arm/include/asm/mm.h        | 16 ++++-
>   xen/arch/arm/include/asm/mm_mpu.h    |  2 +
>   xen/arch/arm/mm_mpu.c                | 88 ++++++++++++++++++++++++----
>   xen/include/xen/vmap.h               | 12 ++++
>   5 files changed, 106 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index 8e8679bc82..b4e50a9a0e 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -82,6 +82,7 @@
>   #define REGION_HYPERVISOR_BOOT    (REGION_HYPERVISOR_RW|_REGION_BOOTONLY)
>   #define REGION_HYPERVISOR_SWITCH  (REGION_HYPERVISOR_RW|_REGION_SWITCH)
>   #define REGION_HYPERVISOR_NOCACHE (_REGION_DEVICE|MT_DEVICE_nGnRE|_REGION_SWITCH)
> +#define REGION_HYPERVISOR_WC      (_REGION_DEVICE|MT_NORMAL_NC)
>   
>   #define INVALID_REGION            (~0UL)
>   
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 7969ec9f98..fa44cfc50d 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -14,6 +14,10 @@
>   # error "unknown ARM variant"
>   #endif
>   
> +#if defined(CONFIG_HAS_MPU)
> +# include <asm/arm64/mpu.h>
> +#endif
> +
>   /* Align Xen to a 2 MiB boundary. */
>   #define XEN_PADDR_ALIGN (1 << 21)
>   
> @@ -198,19 +202,25 @@ extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
>   /* map a physical range in virtual memory */
>   void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int attributes);
>   
> +#ifndef CONFIG_HAS_MPU
> +#define DEFINE_ATTRIBUTE(var)   (PAGE_##var)
> +#else
> +#define DEFINE_ATTRIBUTE(var)   (REGION_##var)
> +#endif
The macro implies that part of the naming would be common between the 
MPU and MMU code. So I think it would be better if the full name is the 
shared.

My preference would be to go with PAGE_* as this is used for both x86 
and MMU arm. I think the naming would still be OK on the MPU because, 
AFAICT, you still map at a page granularity (or aligned to).

Cheers,

-- 
Julien Grall

