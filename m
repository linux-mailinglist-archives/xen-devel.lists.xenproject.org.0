Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3278387496
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 11:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128959.242074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1live5-0001j1-Fz; Tue, 18 May 2021 09:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128959.242074; Tue, 18 May 2021 09:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1live5-0001hA-Ch; Tue, 18 May 2021 09:04:09 +0000
Received: by outflank-mailman (input) for mailman id 128959;
 Tue, 18 May 2021 09:04:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1live4-0001h4-0O
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 09:04:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1live3-0007GX-RW; Tue, 18 May 2021 09:04:07 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1live3-00038h-Lk; Tue, 18 May 2021 09:04:07 +0000
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
	bh=frunRnsuH7x4tQCoV4Rb9XfJ5xUVTaEMUkxJWXIDpjA=; b=XSVItL0WRhGaUGuwEyYdXDoPZ+
	ik8kpqt4Z7XwNjrjkg7124BylMYzr61/J6u2gMW3A02TYwlrH7e4K20juuLZn6LOjvwlHgVca9P53
	3lrqiL7gk+bXT1hYIZ2CQyZHucx4lZTiYzIrQ56FEYI200ezQu3DUAH3VLzTR8vic5EA=;
Subject: Re: [PATCH 02/10] xen/arm: handle static memory in
 dt_unreserved_regions
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-3-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <eb262284-fd02-f5a7-be45-69f11bbca7d6@xen.org>
Date: Tue, 18 May 2021 10:04:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518052113.725808-3-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 18/05/2021 06:21, Penny Zheng wrote:
> static memory regions overlap with memory nodes. The
> overlapping memory is reserved-memory and should be
> handled accordingly:
> dt_unreserved_regions should skip these regions the
> same way they are already skipping mem-reserved regions.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/setup.c | 39 +++++++++++++++++++++++++++++++++------
>   1 file changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 00aad1c194..444dbbd676 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -201,7 +201,7 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
>                                            void (*cb)(paddr_t, paddr_t),
>                                            int first)
>   {
> -    int i, nr = fdt_num_mem_rsv(device_tree_flattened);
> +    int i, nr_reserved, nr_static, nr = fdt_num_mem_rsv(device_tree_flattened);
>   
>       for ( i = first; i < nr ; i++ )
>       {
> @@ -222,18 +222,45 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
>       }
>   
>       /*
> -     * i is the current bootmodule we are evaluating across all possible
> -     * kinds.
> +     * i is the current reserved RAM banks we are evaluating across all
> +     * possible kinds.
>        *
>        * When retrieving the corresponding reserved-memory addresses
>        * below, we need to index the bootinfo.reserved_mem bank starting
>        * from 0, and only counting the reserved-memory modules. Hence,
>        * we need to use i - nr.
>        */
> -    for ( ; i - nr < bootinfo.reserved_mem.nr_banks; i++ )
> +    i = i - nr;
> +    nr_reserved = bootinfo.reserved_mem.nr_banks;
> +    for ( ; i < nr_reserved; i++ )
>       {
> -        paddr_t r_s = bootinfo.reserved_mem.bank[i - nr].start;
> -        paddr_t r_e = r_s + bootinfo.reserved_mem.bank[i - nr].size;
> +        paddr_t r_s = bootinfo.reserved_mem.bank[i].start;
> +        paddr_t r_e = r_s + bootinfo.reserved_mem.bank[i].size;
> +
> +        if ( s < r_e && r_s < e )
> +        {
> +            dt_unreserved_regions(r_e, e, cb, i + 1);
> +            dt_unreserved_regions(s, r_s, cb, i + 1);
> +            return;
> +        }
> +    }
> +
> +    /*
> +     * i is the current reserved RAM banks we are evaluating across all
> +     * possible kinds.
> +     *
> +     * When retrieving the corresponding static-memory bank address
> +     * below, we need to index the bootinfo.static_mem starting
> +     * from 0, and only counting the static-memory bank. Hence,
> +     * we need to use i - nr_reserved.
> +     */
> +
> +    i = i - nr_reserved;
> +    nr_static = bootinfo.static_mem.nr_banks;
> +    for ( ; i < nr_static; i++ )
> +    {
> +        paddr_t r_s = bootinfo.static_mem.bank[i].start; > +        paddr_t r_e = r_s + bootinfo.static_mem.bank[i].size;

This is the 3rd loop we are adding in dt_unreserved_regions(). Each loop 
are doing pretty much the same thing except with a different array. I'd 
like to avoid the new loop if possible.

As mentionned in patch#1, the static memory is another kind of reserved 
memory. So could we describe the static memory using the reserved-memory?

>   
>           if ( s < r_e && r_s < e )
>           {
> 

Cheers,

-- 
Julien Grall

