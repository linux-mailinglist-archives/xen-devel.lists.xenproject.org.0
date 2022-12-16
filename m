Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F5E64E914
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 11:05:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464330.722692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p67Zx-0004my-DP; Fri, 16 Dec 2022 10:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464330.722692; Fri, 16 Dec 2022 10:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p67Zx-0004k0-A7; Fri, 16 Dec 2022 10:04:33 +0000
Received: by outflank-mailman (input) for mailman id 464330;
 Fri, 16 Dec 2022 10:04:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p67Zw-0004ju-70
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 10:04:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p67Zv-0007w3-NT; Fri, 16 Dec 2022 10:04:31 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.4.243]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p67Zv-0000h3-HU; Fri, 16 Dec 2022 10:04:31 +0000
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
	bh=AKF/SuYE5mujofCwTxwLAhT9KjJGMlae7XjN+W4mDlY=; b=65tMgvOQyywdenZYPO+e4DJSO4
	pTA06xcCJY0ldhmpBrk+niSNH2HKfIHh9i89U7GbliaPWNc6ijBlfoKQ2VjYtRAufYLGU1NyXaUFX
	ooba7DtIdbB5sX75+BCXq8bgAIJ6ahc8LcIvd2OXNBGsf+s2XuaeKxKmptMkVqeD/648=;
Message-ID: <2d467e95-ccb9-80b7-5747-1665153c5d03@xen.org>
Date: Fri, 16 Dec 2022 10:04:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [XEN v1 6/9] xen/arm: Use 'u64' to represent 'unsigned long long'
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
 <20221215193245.48314-7-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221215193245.48314-7-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Title: Please be more specific about the component you are modifying.

I.e:

xen/arm: domain_build: Replace use of paddr_t in find_domU_holes()

So it is clear this is no a tree-wide change.

On 15/12/2022 19:32, Ayan Kumar Halder wrote:
> bankbase, banksize and bankend are used to hold values of type
> 'unsigned long long'. Thus, one should use 'u64' instead of 'paddr_t'

To me it sounds like the code should use 'unsigned long long' rather 
than 'paddr_t' or 'u64'.

Also, please replace any reference of u64 to uint64_t. (The same remark 
apply for u32 below).

> (which may be either u64 or u32 depending on the architecture).

That's not yet correct. So please add something like 'in the future'...

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/domain_build.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index c537514a52..e968b9812d 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1741,9 +1741,9 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>                                     struct meminfo *ext_regions)
>   {
>       unsigned int i;
> -    paddr_t bankend;
> -    const paddr_t bankbase[] = GUEST_RAM_BANK_BASES;
> -    const paddr_t banksize[] = GUEST_RAM_BANK_SIZES;
> +    uint64_t bankend;
> +    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
> +    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
>       int res = -ENOENT;
>   
>       for ( i = 0; i < GUEST_RAM_BANKS; i++ )

Cheers,

-- 
Julien Grall

