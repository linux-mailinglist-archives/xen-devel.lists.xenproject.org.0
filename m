Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D39A63F0A6F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 19:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168309.307309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGPbl-0000BI-57; Wed, 18 Aug 2021 17:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168309.307309; Wed, 18 Aug 2021 17:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGPbl-00008I-1r; Wed, 18 Aug 2021 17:44:09 +0000
Received: by outflank-mailman (input) for mailman id 168309;
 Wed, 18 Aug 2021 17:44:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mGPbj-000087-Bu
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 17:44:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGPbi-0003Le-Da; Wed, 18 Aug 2021 17:44:06 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGPbi-0005aj-7b; Wed, 18 Aug 2021 17:44:06 +0000
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
	bh=YoNlUY16dNm1GnnafYf/lC9oVVK3TE2+/iKkczJfa9E=; b=5lPej/4Q/BaRiep+8ceXEjIN7q
	ZtA9xjb+Wojb7STyaoAFSSNmVkDyHXbRkSn4DGpoBWSHutifQDAxcwYSOtr9gS3XPnhm1GE9SJR6d
	LpLFmH6N+2LDUAM1TvC+nHBei9Kut+cXql1Gfz/ye/xsAfCVdxVEwfqR5dX/PM/Ne3PQ=;
Subject: Re: [PATCH] Arm: relax iomem_access_permitted() check
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <a26e91df-7c49-5903-6228-821d92c4902c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <adfdc3f6-5801-8387-6400-393f2536c6cd@xen.org>
Date: Wed, 18 Aug 2021 18:44:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a26e91df-7c49-5903-6228-821d92c4902c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 18/08/2021 08:52, Jan Beulich wrote:
> Ranges checked by iomem_access_permitted() are inclusive; to permit a
> mapping there's no need for access to also have been granted for the
> subsequent page.

Good catch! OOI, how did you find it?

> 
> Fixes: 80f9c3167084 ("xen/arm: acpi: Map MMIO on fault in stage-2 page table for the hardware domain")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1893,7 +1893,7 @@ static bool try_map_mmio(gfn_t gfn)
>           return false;
>   
>       /* The hardware domain can only map permitted MMIO regions */
> -    if ( !iomem_access_permitted(d, mfn_x(mfn), mfn_x(mfn) + 1) )
> +    if ( !iomem_access_permitted(d, mfn_x(mfn), mfn_x(mfn)) )
>           return false;
>   
>       return !map_regions_p2mt(d, gfn, 1, mfn, p2m_mmio_direct_c);
> 

-- 
Julien Grall

