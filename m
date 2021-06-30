Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3109D3B87E5
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 19:45:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148214.273895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyeG5-0000E9-Km; Wed, 30 Jun 2021 17:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148214.273895; Wed, 30 Jun 2021 17:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyeG5-0000CB-GG; Wed, 30 Jun 2021 17:44:21 +0000
Received: by outflank-mailman (input) for mailman id 148214;
 Wed, 30 Jun 2021 17:44:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lyeG3-0000C5-OJ
 for xen-devel@lists.xenproject.org; Wed, 30 Jun 2021 17:44:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyeG2-0002Ss-Mo; Wed, 30 Jun 2021 17:44:18 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyeG2-0004uz-Ex; Wed, 30 Jun 2021 17:44:18 +0000
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
	bh=kctGUokibAu8Zy2yd9F68eAYEDcyIIZZQYgRFk7raSU=; b=twU2abxlPox1MulXLnWvygR7+P
	0Kl3P4JAqsDG3ZVBLh10g2oQqhfjzERJ35Y4Ajg6TBq/WfDJ/I11RW44A2cYhnOwuTcrseDkY92rX
	CsQebu0djS0s3xJjfgz5hKncQfV4jzTWWICyfSHH3XJraypZ448Iinb2xHK2HOmJZLuI=;
Subject: Re: [PATCH 2/9] xen/arm: introduce PGC_reserved
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-3-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1f1c1567-1a53-3b6a-2868-b7673d9180b3@xen.org>
Date: Wed, 30 Jun 2021 18:44:16 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210607024318.3988467-3-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 07/06/2021 03:43, Penny Zheng wrote:
> In order to differentiate pages of static memory, from those allocated from
> heap, this patch introduces a new page flag PGC_reserved to tell.

I would prefer if this patch is folded in the patch first using it. This 
will be easier to understand how this flag will be used.

Cheers,

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> changes v2:
> - remove unused reserved field in struct page_info
> - remove unused helper page_get_reserved_owner and page_set_reserved_owner
> ---
>   xen/include/asm-arm/mm.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
> index 0b7de3102e..7034fae1b6 100644
> --- a/xen/include/asm-arm/mm.h
> +++ b/xen/include/asm-arm/mm.h
> @@ -108,6 +108,9 @@ struct page_info
>     /* Page is Xen heap? */
>   #define _PGC_xen_heap     PG_shift(2)
>   #define PGC_xen_heap      PG_mask(1, 2)
> +  /* Page is reserved */
> +#define _PGC_reserved     PG_shift(3)
> +#define PGC_reserved      PG_mask(1, 3)
>   /* ... */
>   /* Page is broken? */
>   #define _PGC_broken       PG_shift(7)
> 

-- 
Julien Grall

