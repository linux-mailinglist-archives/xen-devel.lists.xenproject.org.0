Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE9B786B2E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 11:10:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589848.921895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ6M5-0003Sh-1e; Thu, 24 Aug 2023 09:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589848.921895; Thu, 24 Aug 2023 09:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ6M4-0003Qy-V8; Thu, 24 Aug 2023 09:10:16 +0000
Received: by outflank-mailman (input) for mailman id 589848;
 Thu, 24 Aug 2023 09:10:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qZ6M3-0003Qs-LJ
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 09:10:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZ6M3-00089H-2E; Thu, 24 Aug 2023 09:10:15 +0000
Received: from [15.248.3.1] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZ6M2-00077X-SN; Thu, 24 Aug 2023 09:10:14 +0000
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
	bh=TnVNdBRX1cZ7qOIMm6fs+LzFp3SCoDFVSuuB+HxGGjM=; b=pfX6u1WkksIxdzJDgXXSrl2ddI
	qfmd5JlfdyX79quNZrU5+aWHvKXNvmHtjUzh8SoI/Mkj8z5jBv5dnFRExgpyupfwNXP5zc63dbrK1
	02hFw077jL2nQ9lfT3gpoGz8XdYR72dGSKt/34w9O5QlPmHr0sdpP9G3XrpQVX0ZJJcc=;
Message-ID: <7d216ef6-398c-4086-8a7a-33e80dcacda7@xen.org>
Date: Thu, 24 Aug 2023 10:10:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Handle empty grant table region in
 find_unallocated_memory()
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230824090640.25338-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230824090640.25338-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/08/2023 10:06, Michal Orzel wrote:
> When creating dom0 with grant table support disabled in Xen and no IOMMU,
> the following assert is triggered (debug build):
> "Assertion 's <= e' failed at common/rangeset.c:189"

A partial stack trace would have been handy. This help the reader to 
understand how you came to the conclusion that the issue was in 
find_unallocated_memory().

> 
> This is because find_unallocated_memory() (used to find memory holes
> for extended regions) calls rangeset_remove_range() for an empty
> grant table region. Fix it by checking if the size of region is not 0.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

The change itself looks fine. So with the stack trace add:

Reviewed-by: Julien Grall <jgrall@amazon.com>

> ---
>   xen/arch/arm/domain_build.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 54bf5623c889..2e899458acdf 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1633,14 +1633,18 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>       }
>   
>       /* Remove grant table region */
> -    start = kinfo->gnttab_start;
> -    end = kinfo->gnttab_start + kinfo->gnttab_size;
> -    res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start), PFN_DOWN(end - 1));
> -    if ( res )
> +    if ( kinfo->gnttab_size )
>       {
> -        printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
> -               start, end);
> -        goto out;
> +        start = kinfo->gnttab_start;
> +        end = kinfo->gnttab_start + kinfo->gnttab_size;
> +        res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
> +                                    PFN_DOWN(end - 1));
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
> +                   start, end);
> +            goto out;
> +        }
>       }
>   
>       start = 0;

Cheers,

-- 
Julien Grall

