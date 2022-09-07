Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB465B01DC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 12:24:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401138.642851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsEV-0002Z1-Dx; Wed, 07 Sep 2022 10:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401138.642851; Wed, 07 Sep 2022 10:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsEV-0002WP-Aq; Wed, 07 Sep 2022 10:24:35 +0000
Received: by outflank-mailman (input) for mailman id 401138;
 Wed, 07 Sep 2022 10:24:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVsEU-0002WJ-GF
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 10:24:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVsEU-0002fr-8E; Wed, 07 Sep 2022 10:24:34 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVsEU-0002U1-1o; Wed, 07 Sep 2022 10:24:34 +0000
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
	bh=oKORNgA+Nm5iIvpKCgMtV8LicBlnWdaOYiu0Es2aCGA=; b=Rmqf1w05rxhesjGs0sIeRae0Cb
	GBBJYhMSSQHXnRvmJA9hxHSN0Kd5v3andKTjXJQs84gH0TzAmOdqSuBbU7DM3orHjrQcUEbBSOuVj
	XHGKqDZ7cOr6dg7htDrQauxR1I9B06Z8mBTkjqw+6x5oVAxmNGxiy/yahQ8dr2OAQmyo=;
Message-ID: <80aa7dad-1507-d132-3652-dc65ef999ff8@xen.org>
Date: Wed, 7 Sep 2022 11:24:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <penny.zheng@arm.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220907083643.20152-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 07/09/2022 09:36, Henry Wang wrote:
>   static int __init early_scan_node(const void *fdt,
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index b76a84e8f5..0741645014 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1038,9 +1038,11 @@ static int __init make_memory_node(const struct domain *d,
>       if ( mem->nr_banks == 0 )
>           return -ENOENT;
>   
> -    /* find first memory range not bound to a Xen domain */
> -    for ( i = 0; i < mem->nr_banks && mem->bank[i].xen_domain; i++ )
> +    /* find first memory range not bound to a Xen domain nor heap */

This comment could become stale if we are adding a new type. So how about:

/* find the first memory range that is reserved for device (or firmware) */

> +    for ( i = 0; i < mem->nr_banks &&
> +                 (mem->bank[i].type != MEMBANK_DEFAULT); i++ )
>           ;
> +
>       if ( i == mem->nr_banks )
>           return 0;
>   
> @@ -1062,7 +1064,7 @@ static int __init make_memory_node(const struct domain *d,
>           u64 start = mem->bank[i].start;
>           u64 size = mem->bank[i].size;
>   
> -        if ( mem->bank[i].xen_domain )
> +        if ( mem->bank[i].type == MEMBANK_STATIC_DOMAIN )
>               continue;
>   
>           dt_dprintk("  Bank %d: %#"PRIx64"->%#"PRIx64"\n",
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 5815ccf8c5..6bea15acff 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -22,11 +22,31 @@ typedef enum {
>       BOOTMOD_UNKNOWN
>   }  bootmodule_kind;
>   
> +enum membank_type {
> +    /*
> +     * The MEMBANK_DEFAULT type refers to either reserved memory for the
> +     * device (or firmware) or any memory that will be used by the allocator.

I realize the part of the 'or' is what I suggested. However, I wasn't 
correct here (sorry).

In the context of 'mem' this is referring to any RAM. The setup code 
will then find the list of the regions that doesn't overlap with the 
'reserved_mem' and then give the pages to the boot allocator (and 
subsequently the buddy allocator). Also...

> +     * The meaning depends on where the memory bank is actually used.

... this doesn't tell the reader which means applies where. So I would 
suggest the following:

The MEMBANK_DEFAULT type refers to either reserved memory for the 
device/firmware (when the bank is in 'reserved_mem') or any RAM (when 
the bank is in 'mem'

The rest of the code looks good to me. So once we settled on the two 
comments above:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

