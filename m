Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254A4401C5B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 15:36:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179918.326366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEn3-0000Bo-DA; Mon, 06 Sep 2021 13:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179918.326366; Mon, 06 Sep 2021 13:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEn3-000090-9o; Mon, 06 Sep 2021 13:36:01 +0000
Received: by outflank-mailman (input) for mailman id 179918;
 Mon, 06 Sep 2021 13:35:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNEn1-00008u-Il
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 13:35:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNEmz-0004ro-ES; Mon, 06 Sep 2021 13:35:57 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNEmz-0005KV-8I; Mon, 06 Sep 2021 13:35:57 +0000
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
	bh=DuwvLpcFkRjxKrXDfwsHp4QlfklE89rlmF3HveJUEkA=; b=KxnoRDPGQjSREn2uBbVJS9rOn3
	dzXKq1ngXnj3mM1rJbT1VSiwt0XruhakkC770maae9aWNXJW33RkOC/a+JH4DNZN7J8QY9BzSvRnd
	F8CJnvzqYUGjFU2TVhetf8jyRLJpofcHeJkCnIs2LiiGGoQWLsYnIBY7qzQ//ubpSjK8=;
Subject: Re: [PATCH 3/9] gnttab: fold recurring is_iomem_page()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
 <06eeea76-adf8-4f40-eced-57db1526eba8@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cb4f6360-4d80-be4a-e631-553b00b06a29@xen.org>
Date: Mon, 6 Sep 2021 14:35:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <06eeea76-adf8-4f40-eced-57db1526eba8@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/08/2021 11:12, Jan Beulich wrote:
> In all cases call the function just once instead of up to four times, at

extra NIT: It is more like two because there is a else in 
gnttab_release_mappings() :)

> the same time avoiding to store a dangling pointer in a local variable.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

> 
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c

[...]

Everything below looks a duplicate. Might be an issue in your tools?

> In all cases call the function just once instead of up to four times, at
> the same time avoiding to store a dangling pointer in a local variable.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -1587,11 +1587,11 @@ unmap_common_complete(struct gnttab_unma
>       else
>           status = &status_entry(rgt, op->ref);
>   
> -    pg = mfn_to_page(op->mfn);
> +    pg = !is_iomem_page(act->mfn) ? mfn_to_page(op->mfn) : NULL;
>   
>       if ( op->done & GNTMAP_device_map )
>       {
> -        if ( !is_iomem_page(act->mfn) )
> +        if ( pg )
>           {
>               if ( op->done & GNTMAP_readonly )
>                   put_page(pg);
> @@ -1608,7 +1608,7 @@ unmap_common_complete(struct gnttab_unma
>   
>       if ( op->done & GNTMAP_host_map )
>       {
> -        if ( !is_iomem_page(op->mfn) )
> +        if ( pg )
>           {
>               if ( gnttab_host_mapping_get_page_type(op->done & GNTMAP_readonly,
>                                                      ld, rd) )
> @@ -3778,7 +3778,7 @@ int gnttab_release_mappings(struct domai
>           else
>               status = &status_entry(rgt, ref);
>   
> -        pg = mfn_to_page(act->mfn);
> +        pg = !is_iomem_page(act->mfn) ? mfn_to_page(act->mfn) : NULL;
>   
>           if ( map->flags & GNTMAP_readonly )
>           {
> @@ -3786,7 +3786,7 @@ int gnttab_release_mappings(struct domai
>               {
>                   BUG_ON(!(act->pin & GNTPIN_devr_mask));
>                   act->pin -= GNTPIN_devr_inc;
> -                if ( !is_iomem_page(act->mfn) )
> +                if ( pg )
>                       put_page(pg);
>               }
>   
> @@ -3794,8 +3794,7 @@ int gnttab_release_mappings(struct domai
>               {
>                   BUG_ON(!(act->pin & GNTPIN_hstr_mask));
>                   act->pin -= GNTPIN_hstr_inc;
> -                if ( gnttab_release_host_mappings(d) &&
> -                     !is_iomem_page(act->mfn) )
> +                if ( pg && gnttab_release_host_mappings(d) )
>                       put_page(pg);
>               }
>           }
> @@ -3805,7 +3804,7 @@ int gnttab_release_mappings(struct domai
>               {
>                   BUG_ON(!(act->pin & GNTPIN_devw_mask));
>                   act->pin -= GNTPIN_devw_inc;
> -                if ( !is_iomem_page(act->mfn) )
> +                if ( pg )
>                       put_page_and_type(pg);
>               }
>   
> @@ -3813,8 +3812,7 @@ int gnttab_release_mappings(struct domai
>               {
>                   BUG_ON(!(act->pin & GNTPIN_hstw_mask));
>                   act->pin -= GNTPIN_hstw_inc;
> -                if ( gnttab_release_host_mappings(d) &&
> -                     !is_iomem_page(act->mfn) )
> +                if ( pg && gnttab_release_host_mappings(d) )
>                   {
>                       if ( gnttab_host_mapping_get_page_type(false, d, rd) )
>                           put_page_type(pg);
> 

-- 
Julien Grall

