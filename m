Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 161EF654FBF
	for <lists+xen-devel@lfdr.de>; Fri, 23 Dec 2022 12:32:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468922.728137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8gGd-0006cN-Ja; Fri, 23 Dec 2022 11:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468922.728137; Fri, 23 Dec 2022 11:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8gGd-0006Zj-Gp; Fri, 23 Dec 2022 11:31:11 +0000
Received: by outflank-mailman (input) for mailman id 468922;
 Fri, 23 Dec 2022 11:31:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p8gGc-0006Zd-7p
 for xen-devel@lists.xenproject.org; Fri, 23 Dec 2022 11:31:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p8gGZ-0002q0-FS; Fri, 23 Dec 2022 11:31:07 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.3.230]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p8gGZ-0000Yu-7t; Fri, 23 Dec 2022 11:31:07 +0000
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
	bh=OU2iTC+poI4DnGlpFAvFZ9OP7ZgB6pw6Ls0YXBPEM5g=; b=uZ3718xJt37jkJQx7af2NdTFKz
	CEcMVGAr5NWgid/k+rHquvAKmMgaUDGXQ0Cm2wCUj91Hd6vJF5+9d+xg+OHHdr2hf+Y/iJSGfQ2+t
	ieiatn01Z5Rk3P0Amhuv/vsFQiril9nBsEvvzx/+lyA6HkN5GBvKabQ6JySSTpsqrXEk=;
Message-ID: <965e3faa-472d-9a79-83ca-fef57cda81c5@xen.org>
Date: Fri, 23 Dec 2022 11:31:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 05/22] x86/srat: vmap the pages for acpi_slit
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Julien Grall <jgrall@amazon.com>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-6-julien@xen.org>
 <ca02a313-0fa2-8041-3e8f-d467c3e99fb6@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ca02a313-0fa2-8041-3e8f-d467c3e99fb6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 20/12/2022 15:30, Jan Beulich wrote:
> On 16.12.2022 12:48, Julien Grall wrote:
>> From: Hongyan Xia <hongyxia@amazon.com>
>>
>> This avoids the assumption that boot pages are in the direct map.
>>
>> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> However, ...
> 
>> --- a/xen/arch/x86/srat.c
>> +++ b/xen/arch/x86/srat.c
>> @@ -139,7 +139,8 @@ void __init acpi_numa_slit_init(struct acpi_table_slit *slit)
>>   		return;
>>   	}
>>   	mfn = alloc_boot_pages(PFN_UP(slit->header.length), 1);
>> -	acpi_slit = mfn_to_virt(mfn_x(mfn));
>> +	acpi_slit = vmap_contig_pages(mfn, PFN_UP(slit->header.length));
> 
> ... with the increased use of vmap space the VA range used will need
> growing. And that's perhaps better done ahead of time than late.

I will have a look to increase the vmap().

> 
>> +	BUG_ON(!acpi_slit);
> 
> Similarly relevant for the earlier patch: It would be nice if boot
> failure for optional things like NUMA data could be avoided.

If you can't map (or allocate the memory), then you are probably in a 
very bad situation because both should really not fail at boot.

So I think this is correct to crash early because the admin will be able 
to look what went wrong. Otherwise, it may be missed in the noise.

>  But I
> understand this is somewhat orthogonal to this series (the more that
> alloc_boot_pages() itself is also affected). Yet not entirely so,
> since previously there was no mapping failure possible here.

See above. I don't see the problem of adding a potential mapping failure 
here and before.

Cheers,

-- 
Julien Grall

