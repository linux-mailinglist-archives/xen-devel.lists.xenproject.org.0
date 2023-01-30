Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151BD681D94
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 23:01:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487243.754820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMcCv-0004Bp-Hl; Mon, 30 Jan 2023 22:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487243.754820; Mon, 30 Jan 2023 22:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMcCv-00049b-ER; Mon, 30 Jan 2023 22:00:57 +0000
Received: by outflank-mailman (input) for mailman id 487243;
 Mon, 30 Jan 2023 22:00:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMcCu-00049V-L6
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 22:00:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMcCu-0005vY-4S; Mon, 30 Jan 2023 22:00:56 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMcCt-0005Gh-W1; Mon, 30 Jan 2023 22:00:56 +0000
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
	bh=jjcpx6AWEawApwDcid0vR0p+UgxMH54KD33PMXpnhuA=; b=b0P44Oo6aLOOw7UwsdYXCIADr4
	55JCJiR9b9814goJ5jcRYGa+4/8pokOtqmvoQqDkXsWmJ4GKO4fS6ufh0uLrZOzY2hQjmGIzIP/2f
	taOiQ0KQ4OsKvYqL6z3WQQ75NLpHwy3nAccPIoS/OvdEASU/FwQICv0ZiDSLsFXprcyM=;
Message-ID: <7f663e3a-1f1c-91ad-728a-ea29414e4ba7@xen.org>
Date: Mon, 30 Jan 2023 22:00:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v2 09/11] xen/arm: Introduce ARM_PA_32 to support 32 bit
 physical address
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-10-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230117174358.15344-10-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/01/2023 17:43, Ayan Kumar Halder wrote:
> diff --git a/xen/arch/arm/include/asm/types.h b/xen/arch/arm/include/asm/types.h
> index 083acbd151..f9595b9098 100644
> --- a/xen/arch/arm/include/asm/types.h
> +++ b/xen/arch/arm/include/asm/types.h
> @@ -37,9 +37,16 @@ typedef signed long long s64;
>   typedef unsigned long long u64;
>   typedef u32 vaddr_t;
>   #define PRIvaddr PRIx32
> +#if defined(CONFIG_ARM_PA_32)
> +typedef u32 paddr_t;
> +#define INVALID_PADDR (~0UL)
> +#define PADDR_SHIFT BITS_PER_LONG
You define PADDR_SHIFT but don't seem to use it. Is it intended?

> +#define PRIpaddr PRIx32
> +#else
>   typedef u64 paddr_t;
>   #define INVALID_PADDR (~0ULL)
>   #define PRIpaddr "016llx"
> +#endif
>   typedef u32 register_t;
>   #define PRIregister "08x"
>   #elif defined (CONFIG_ARM_64)

Cheers,

-- 
Julien Grall

