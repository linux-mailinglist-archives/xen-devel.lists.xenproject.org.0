Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCA8253748
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 20:37:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kB0IE-00056y-WA; Wed, 26 Aug 2020 18:37:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vbNg=CE=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kB0ID-00056s-P7
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 18:37:05 +0000
X-Inumbo-ID: 25f2006b-cd7c-4901-9fcd-12155727a07a
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25f2006b-cd7c-4901-9fcd-12155727a07a;
 Wed, 26 Aug 2020 18:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject;
 bh=kUkyBsxfsXVa8SPa5VqhUW+oCBNr9RhlQZ25yU96oHY=; b=NXA45rbZj+VJapklnwdCe7DqQU
 j1UP2frqbboL+0Sa+pQ59hWY0ofyOTOZlwxOLs5GSjzBZ53y1Hk/JevI2f9LlqEwU/ko4WrLcPfa7
 Gg2drCyrTfg5RccKjlXY9wPuQzqLiTvFPW8BaNlb1NXeL/3FFiF7tm2+QaOLRy7fuGdg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kB0IB-0001to-KP; Wed, 26 Aug 2020 18:37:03 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kB0IB-0000uL-Bq; Wed, 26 Aug 2020 18:37:03 +0000
Subject: Re: [PATCH 2/2] arm/xen: Add misuse warning to virt_to_gfn
To: Simon Leiner <simon@leiner.me>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jgross@suse.com
References: <Aw: [Linux] [ARM] Granting memory obtained from the DMA API>
 <20200825093153.35500-1-simon@leiner.me>
 <20200825093153.35500-2-simon@leiner.me>
From: Julien Grall <julien@xen.org>
Message-ID: <eb1c9e1a-d8b5-cfd5-4575-3ae47f99ad44@xen.org>
Date: Wed, 26 Aug 2020 19:37:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825093153.35500-2-simon@leiner.me>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Simon,

On 25/08/2020 10:31, Simon Leiner wrote:
> As virt_to_gfn uses virt_to_phys, it will return invalid addresses when
> used with vmalloc'd addresses. This patch introduces a warning, when
> virt_to_gfn is used in this way.
> 
> Signed-off-by: Simon Leiner <simon@leiner.me>
> ---
>   include/xen/arm/page.h | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/xen/arm/page.h b/include/xen/arm/page.h
> index d7f6af50e200..b0d303b633d0 100644
> --- a/include/xen/arm/page.h
> +++ b/include/xen/arm/page.h
> @@ -76,7 +76,11 @@ static inline unsigned long bfn_to_pfn(unsigned long bfn)
>   #define bfn_to_local_pfn(bfn)	bfn_to_pfn(bfn)
>   
>   /* VIRT <-> GUEST conversion */
> -#define virt_to_gfn(v)		(pfn_to_gfn(virt_to_phys(v) >> XEN_PAGE_SHIFT))
> +#define virt_to_gfn(v)                                                         \
> +	({                                                                     \
> +		WARN_ON_ONCE(is_vmalloc_addr(v));                              \

virt_to_gfn() will usually be called from generic code. WARN_ON_ONCE() 
will only catch one instance and it means we would have to fix the first 
instance and then re-run to catch the others.

So I think we want to switch to WARN_ON() here.

Cheers,

-- 
Julien Grall

