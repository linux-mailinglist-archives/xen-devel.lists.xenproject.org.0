Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6A05AA98F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 10:12:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397431.638004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU1mK-0002lh-3d; Fri, 02 Sep 2022 08:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397431.638004; Fri, 02 Sep 2022 08:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU1mK-0002jN-0z; Fri, 02 Sep 2022 08:11:52 +0000
Received: by outflank-mailman (input) for mailman id 397431;
 Fri, 02 Sep 2022 08:11:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oU1mI-0002jH-73
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 08:11:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oU1mH-0001by-Se; Fri, 02 Sep 2022 08:11:49 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.18.194]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oU1mH-00032q-MF; Fri, 02 Sep 2022 08:11:49 +0000
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
	bh=BWnCXcECXEynU70t6lUAg5HZUVGqJS9CbB/kj6BmBSA=; b=dNYQBtF6Gq5XFNZMWJmaDYKhkG
	td9IMg3YzxOrufuy/oC0csc6ppngfOwOdXhq0eTtRcy3D17Nhs6GMfoBsonlNrNDW0by5XhwSm2xX
	owAX3aRvGtvNbnRJIhsXU1H2A/tR8+884LCNREuBadrH4kPVY4Ytg+NgwHicYxWN3E6Y=;
Message-ID: <3597a89f-98f6-d43a-4dd9-345b155e7216@xen.org>
Date: Fri, 2 Sep 2022 09:11:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <50bc7ce9-dc98-127b-d0db-40bf82929fc7@xen.org>
 <AS8PR08MB79913A96E64B31A02C985EB5927B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <b05106cc-09d8-9a9b-38e5-328cd8caff97@xen.org>
 <AS8PR08MB799161163796249F1AFC4C06927A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB799161163796249F1AFC4C06927A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/09/2022 04:30, Henry Wang wrote:
> Hi Julien,

Hi Henry,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>>>> This code is now becoming quite confusing to understanding. This loop is
>>>> meant to map the xenheap. If I follow your documentation, it would
>> mean
>>>> that only the reserved region should be mapped.
>>>
>>> Yes I think this is the same question that I raised in the scissors line of the
>>> commit message of this patch.
>>
>> Sorry I didn't notice the comment after the scissors line. This is the
>> same question :)
>>
>>> What I intend to do is still mapping the whole
>>> RAM because of the xenheap_* variables that you mentioned in...
>>>
>>>>
>>>> More confusingly, xenheap_* variables will cover the full RAM.
>>>
>>> ...here. But only adding the reserved region to the boot allocator so the
>>> reserved region can become the heap later on. I am wondering if we
>>> have a more clear way to do that, any suggestions?
>>
>> I think your code is correct. It only needs some renaming of the
>> existing variable (maybe to directmap_*?) to make clear the area is used
>> to access the RAM easily.
> 
> Thanks for the clarification. I checked the code and found the xenheap_*
> variables are:
> xenheap_virt_start, xenheap_virt_end, xenheap_mfn_start,
> xenheap_mfn_end, xenheap_base_pdx.
> 
> For clarification, do we need to change all of them to directmap_*?

Good question.

> 
> A pure renaming should be easy (and I guess also safe), but maybe I am
> overthinking because arm32 also uses xenheap_virt_end, xenheap_mfn_start
> and xenheap_mfn_end. These variables refer to the real xenheap, I am not
> sure renaming these would reduce the readability for arm32.

So on arm32, only the xenheap is direct mapped today. So I think it 
would be fine to switch the name to "directmap_*". For extra clarify we 
could add an alias for arm32 between "xenheap_*" and "directmap_*".

Cheers,

-- 
Julien Grall

