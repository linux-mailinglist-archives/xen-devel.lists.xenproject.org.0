Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5061A64710A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 14:52:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457167.715029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3HJA-0006jH-K0; Thu, 08 Dec 2022 13:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457167.715029; Thu, 08 Dec 2022 13:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3HJA-0006gw-HD; Thu, 08 Dec 2022 13:51:28 +0000
Received: by outflank-mailman (input) for mailman id 457167;
 Thu, 08 Dec 2022 13:51:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p3HJ9-0006gq-13
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 13:51:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p3HJ8-0001e5-HY; Thu, 08 Dec 2022 13:51:26 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.4.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p3HJ8-0001XB-AS; Thu, 08 Dec 2022 13:51:26 +0000
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
	bh=s8WjPK8bHy2BeyGoRcNtlQxqgFn3sSpuUyxXFETH8jc=; b=yaaX6ty8idMYzWRjthjCiROpH0
	oIZI7ZpFLVpGXrgbiFob2i+uQvcgRAEIyFpSoLBkMV6cSajYOQyDD2atjBRUlYspH2XaoCSjcTl2v
	F4G/VeK0p1K4BmaNT3GwnkYucDd5EoMjWVtB4jb/seK1udjeNo5e+Na7k/dGGD2IV+YE=;
Message-ID: <1ad3ee8c-991f-6e15-255f-ccc24dd5b84f@xen.org>
Date: Thu, 8 Dec 2022 13:51:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [XEN v1] xen/Arm: Probe the entry point address of an uImage
 correctly
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20221208124929.55268-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221208124929.55268-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Title extra NIT: I have seen it multiple time and so far refrain to say 
it. Please use 'arm' rather than 'Arm'. This is for consistency in the 
way we name the subsystem in the title.

On 08/12/2022 12:49, Ayan Kumar Halder wrote:
> Currently, kernel_uimage_probe() does not set info->zimage.start. As a
> result, it contains the default value (ie 0). This causes,
> kernel_zimage_place() to treat the binary (contained within uImage) as
> position independent executable. Thus, it loads it at an incorrect address.
> 
> The correct approach would be to read "uimage.ep" and set
> info->zimage.start. This will ensure that the binary is loaded at the
> correct address.

In non-statically allocated setup, a user doesn't know where the memory 
for dom0/domU will be allocated.

So I think this was correct to ignore the address. In fact, I am worry 
that...

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> I uncovered this issue while loading Zephyr as a dom0less domU with Xen on
> R52 FVP. Zephyr builds with static device tree. Thus, the load address is
> always fixed.
> 
>   xen/arch/arm/kernel.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 2556a45c38..e4e8c67669 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -222,6 +222,8 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>       if ( len > size - sizeof(uimage) )
>           return -EINVAL;
>   
> +    info->zimage.start = be32_to_cpu(uimage.ep);
... this will now ended up to break anyone that may have set an address 
but didn't care where it should be loaded.

I also understand your use case but now, we have contradictory 
approaches. I am not entirely sure how we can solve it. We may have to 
break those users (Cc some folks that may use it). But we should figure 
out what is the alternative for them.

If we decide to break those users, then this should be documented in the 
commit message and in docs/misc/arm/booting.txt (which interestingly 
didn't mention uImage).

Cheers,

-- 
Julien Grall

