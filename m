Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9536838C7
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 22:37:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487887.755658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMyJP-0006em-3t; Tue, 31 Jan 2023 21:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487887.755658; Tue, 31 Jan 2023 21:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMyJP-0006cC-0q; Tue, 31 Jan 2023 21:37:07 +0000
Received: by outflank-mailman (input) for mailman id 487887;
 Tue, 31 Jan 2023 21:37:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMyJN-0006c4-If
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 21:37:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMyJL-0006OL-OV; Tue, 31 Jan 2023 21:37:03 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMyJL-000617-Jn; Tue, 31 Jan 2023 21:37:03 +0000
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
	bh=FQ77lcTKP5qh6yHnnUUY7njqMx15MTXjgWNuwt5iTtk=; b=uBptGxq9/LkKdhyYiWx2GwtIKU
	K1SLf/IJxxQ+2QeCD9kwMOLKQyblwjtiIqdw9Y+DYNQiXHLfjOtbsXa07+6Gd7xMFoEwaYdjWlWQf
	NhU4geigxQdXvVmt5z/IXQDGowqybJjlhj7uTqTGqlnC8ds69TpUHUfyku5UZck7Td2o=;
Message-ID: <7a4a26a5-6a11-3893-b727-e3c8e68ceef6@xen.org>
Date: Tue, 31 Jan 2023 21:37:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 05/22] x86/srat: vmap the pages for acpi_slit
To: Jan Beulich <jbeulich@suse.com>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Julien Grall <jgrall@amazon.com>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-6-julien@xen.org>
 <ca02a313-0fa2-8041-3e8f-d467c3e99fb6@suse.com>
 <965e3faa-472d-9a79-83ca-fef57cda81c5@xen.org>
 <41de340c-b5ad-6c30-816f-1ce1ddc98069@xen.org>
 <d645ef07-f30b-ff6b-ffc0-7ef76da63285@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d645ef07-f30b-ff6b-ffc0-7ef76da63285@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 31/01/2023 09:11, Jan Beulich wrote:
> On 30.01.2023 20:27, Julien Grall wrote:
>> Hi Jan,
>>
>> On 23/12/2022 11:31, Julien Grall wrote:
>>> On 20/12/2022 15:30, Jan Beulich wrote:
>>>> On 16.12.2022 12:48, Julien Grall wrote:
>>>>> From: Hongyan Xia <hongyxia@amazon.com>
>>>>>
>>>>> This avoids the assumption that boot pages are in the direct map.
>>>>>
>>>>> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> However, ...
>>>>
>>>>> --- a/xen/arch/x86/srat.c
>>>>> +++ b/xen/arch/x86/srat.c
>>>>> @@ -139,7 +139,8 @@ void __init acpi_numa_slit_init(struct
>>>>> acpi_table_slit *slit)
>>>>>            return;
>>>>>        }
>>>>>        mfn = alloc_boot_pages(PFN_UP(slit->header.length), 1);
>>>>> -    acpi_slit = mfn_to_virt(mfn_x(mfn));
>>>>> +    acpi_slit = vmap_contig_pages(mfn, PFN_UP(slit->header.length));
>>>>
>>>> ... with the increased use of vmap space the VA range used will need
>>>> growing. And that's perhaps better done ahead of time than late.
>>>
>>> I will have a look to increase the vmap().
>>
>> I have started to look at this. The current size of VMAP is 64GB.
>>
>> At least in the setup I have I didn't see any particular issue with the
>> existing size of the vmap. Looking through the history, the last time it
>> was bumped by one of your commit (see b0581b9214d2) but it is not clear
>> what was the setup.
>>
>> Given I don't have a setup where the VMAP is exhausted it is not clear
>> to me what would be an acceptable bump.
>>
>> AFAICT, in PML4 slot 261, we still have 62GB reserved for future. So I
>> was thinking to add an extra 32GB which would bring the VMAP to 96GB.
>> This is just a number that doesn't use all the reserved space but still
>> a power of two.
>>
>> Are you fine with that?
> 
> Hmm. Leaving aside that 96Gb isn't a power of two, my comment saying
> "ahead of time" was under the (wrong, as it now looks) impression that
> the goal of your series was to truly do away with the directmap.

Yes, the directmap is still present with this series. There are more 
work to completely remove the vmap() (see the cover letter for some 
details) and would prefer if this is separated from this series.


> I was
> therefore expecting a much larger bump in size, perhaps moving the
> vmap area into space presently occupied by the directmap. IOW for the
> time being, with no _significant_ increase of space consumption, we
> may well be fine with the 64Gb range.

Ok. I will keep it in mind if I am working completely removing the 
directmap.

Cheers,

-- 
Julien Grall

