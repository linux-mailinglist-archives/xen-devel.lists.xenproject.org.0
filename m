Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFC1A3BCBB
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 12:26:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892719.1301678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkiDe-0002Jn-EC; Wed, 19 Feb 2025 11:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892719.1301678; Wed, 19 Feb 2025 11:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkiDe-0002HY-AT; Wed, 19 Feb 2025 11:26:22 +0000
Received: by outflank-mailman (input) for mailman id 892719;
 Wed, 19 Feb 2025 11:26:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tkiDc-0002HM-Uk
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 11:26:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tkiDc-00Aaz8-2s;
 Wed, 19 Feb 2025 11:26:20 +0000
Received: from [15.248.2.31] (helo=[10.24.66.255])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tkiDc-002BaC-1R;
 Wed, 19 Feb 2025 11:26:20 +0000
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
	bh=Ci9+HGzMXUzriplpDcYHAYbyeBuKtbSfgEdIGkMHWd4=; b=fknpaftzZICcgDdN0uPB9GEyI3
	1IUfvhacdEmkNpIi2MqW5RW5hZYGvGZ/CWaWv1CceKtfI7c+HiGWqW953LqI5iCVPkoqMKN/I33HZ
	/TqoJSFds9zh7zOUg1ZTYJoax1UWdUCTygCilpiHGu7fw/WnodTTmTln7VQFkBng3OQ4=;
Message-ID: <59c39a3b-5e55-4282-9d0a-71ea1f728761@xen.org>
Date: Wed, 19 Feb 2025 11:26:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/arm: fix iomem_ranges cfg in
 map_range_to_domain()
Content-Language: en-GB
To: Grygorii Strashko <gragst.linux@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20250218112253.3136505-1-grygorii_strashko@epam.com>
 <20250218112253.3136505-3-grygorii_strashko@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250218112253.3136505-3-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Grygorii,

On 18/02/2025 11:22, Grygorii Strashko wrote:
> Now the following code in map_range_to_domain()
> 
>   res = rangeset_add_range(mr_data->iomem_ranges,
>                            paddr_to_pfn(addr),
>                            paddr_to_pfn_aligned(addr + len - 1));
>   where
>    paddr_to_pfn_aligned(paddr) defined as paddr_to_pfn(PAGE_ALIGN(paddr))
> 
> calculates the iomem range end address by rounding it up to the next Xen
> page with incorrect assumption that iomem range end address passed to
> rangeset_add_range() is exclusive, while it is expected to be inclusive.
> 
> For example, if requested range is [00e6140000:00e6141004] then it expected
> to add [e6140:e6141] range (num_pages=2) to the mr_data->iomem_ranges
> rangeset, but will add [e6140:e6142] (num_pages=3) instead.
> 
> To fix it, drop PAGE_ALIGN() from the iomem range end address calculation
> formula and just use paddr_to_pfn(addr + len - 1).
> 
> Fixes: 57d4d7d4e8f3b (arm/asm/setup.h: Update struct map_range_data to add
> rangeset.")
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


