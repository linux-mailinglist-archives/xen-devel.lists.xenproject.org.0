Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D1E2EF190
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 12:46:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63379.112542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxqDN-0004FN-8J; Fri, 08 Jan 2021 11:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63379.112542; Fri, 08 Jan 2021 11:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxqDN-0004Ey-4x; Fri, 08 Jan 2021 11:45:57 +0000
Received: by outflank-mailman (input) for mailman id 63379;
 Fri, 08 Jan 2021 11:45:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kxqDL-0004Et-Fx
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 11:45:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kxqDL-0007PE-57; Fri, 08 Jan 2021 11:45:55 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kxqDK-0007aT-U5; Fri, 08 Jan 2021 11:45:55 +0000
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
	bh=0wGrbrrgZt77XRum3fRarThI2NxqARgFJHuFu/MVQnw=; b=TmQYGP3OhtFII5ThcJus40QlW7
	gJGBqv407f9a5EsLpBuV9+UaHvEtmMf+ykkLL2Hcx6hL4cTOiylEaDXIE9ncw0eEV/9/Uo6jqWE3r
	tirtSkYxRSY+Wc8W9catsIgZJbL6odF7VDY15m07xJGDX8un80cNmCFdd24kclh5s24I=;
Subject: Re: [PATCH v2] xen/arm: Using unsigned long for arm64 MPIDR mask
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Penny.Zheng@arm.com, Jiamei.Xie@arm.com,
 nd@arm.com
References: <20210108062953.2335932-1-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a11a8270-68ab-066f-7799-511e72869e95@xen.org>
Date: Fri, 8 Jan 2021 11:45:52 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108062953.2335932-1-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

How about the following title:

"xen/arm: Don't ignore the affinity level 3 in the MPIDR"

On 08/01/2021 06:29, Wei Chen wrote:
> Currently, Xen is using UINT32 for MPIDR mask to retrieve
> affinity[0,1,2,3] values for MPIDR_EL1 register. The value
> of MPIDR_EL1 is 64-bit unsigned long. > The 32-bit unsinged

s/unsinged/unsigned/

> integer will do unsigned extend while doing some operations
> with 64-bit unsigned integer. This can lead to unexpected
> result in some use cases.
> 
> For example, in gicv3_send_sgi_list of GICv3 driver:
> uint64_t cluster_id = cpu_logical_map(cpu) & ~MPIDR_AFF0_MASK;
> 
> When MPIDR_AFF0_MASK is 0xFFU, compiler output:
>      f7c: 92785c16 and x22, x0, #0xffffff00
> When MPIDR_AFF0_MASK is 0xFFUL, compiler output:
>      f88: 9278dc75 and x21, x3, #0xffffffffffffff00
> 
> If cpu_logical_map(cpu) = 0x100000000UL and MPIDR_AFF0_MASK is
> 0xFFU, the cluster_id returns 0. But the expected value should
> be 0x100000000.
> 
> So, in this patch, we force aarch64 to use unsigned long
> as MPIDR mask to avoid such unexpected results.

How about the following commit message:

"Currently, Xen is considering that all the affinity bits are defined 
below 32-bit. However, Arm64 define a 3rd level affinity in bits 32-39.

The function gicv3_send_sgi_list in the GICv3 driver will compute the 
cluser using the following code:

uint64_t cluster_id = cpu_logical_map(cpu) & ~MPIDR_AFF0_MASK;

Because MPIDR_AFF0_MASK is defined as a 32-bit value, we will miss out 
the 3rd level affinity. As a consequence, the IPI would not be sent to 
the correct vCPU.

This particular error can be solved by switching MPIDR_AFF0_MASK to use 
unsigned long. However, take the opportunity to switch all the MPIDR_* 
define to use unsigned long to avoid anymore issue.
"

I can update the commit message while committing if you are happy with it.

Cheers,

> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>


> ---
> v1 -> v2:
> 1. Remove inaccurate descriptions
> 2. Update example description
>   
> ---
>   xen/include/asm-arm/processor.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/processor.h
> index 87c8136022..5c1768cdec 100644
> --- a/xen/include/asm-arm/processor.h
> +++ b/xen/include/asm-arm/processor.h
> @@ -75,11 +75,11 @@
> 
>   /* MPIDR Multiprocessor Affinity Register */
>   #define _MPIDR_UP           (30)
> -#define MPIDR_UP            (_AC(1,U) << _MPIDR_UP)
> +#define MPIDR_UP            (_AC(1,UL) << _MPIDR_UP)
>   #define _MPIDR_SMP          (31)
> -#define MPIDR_SMP           (_AC(1,U) << _MPIDR_SMP)
> +#define MPIDR_SMP           (_AC(1,UL) << _MPIDR_SMP)
>   #define MPIDR_AFF0_SHIFT    (0)
> -#define MPIDR_AFF0_MASK     (_AC(0xff,U) << MPIDR_AFF0_SHIFT)
> +#define MPIDR_AFF0_MASK     (_AC(0xff,UL) << MPIDR_AFF0_SHIFT)
>   #ifdef CONFIG_ARM_64
>   #define MPIDR_HWID_MASK     _AC(0xff00ffffff,UL)
>   #else
> --
> 2.25.1
> 

-- 
Julien Grall

