Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DA85B0407
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 14:35:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401579.643435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuH5-0001ek-Pq; Wed, 07 Sep 2022 12:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401579.643435; Wed, 07 Sep 2022 12:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuH5-0001cG-Ml; Wed, 07 Sep 2022 12:35:23 +0000
Received: by outflank-mailman (input) for mailman id 401579;
 Wed, 07 Sep 2022 12:35:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVuH4-0001c8-J9
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 12:35:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVuH4-0005G0-Cv; Wed, 07 Sep 2022 12:35:22 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVuH4-0000bV-6b; Wed, 07 Sep 2022 12:35:22 +0000
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
	bh=uJURFiF+ya9SSecU5Nuy/v5o1AGWslNu+Lqq4gT5p2I=; b=pudTC2UyJ9SLG/ykkkQawPpdBn
	ycJSzEfsoYh+tdnCm4S5/tmOhGmrqRJuhkJKOXuf5jLB5F9s/t3GfQsx6XEI2qILyzd5bL4rRNOa3
	pi+AGv7Jg/uJwMENS1yHRn8/7HT9lhJsi81PGRtMC90I65Zw8OeK8f2lFmPfU/iTBi5o=;
Message-ID: <fbf0061c-f909-274c-ebcd-64270073a5e9@xen.org>
Date: Wed, 7 Sep 2022 13:35:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Penny Zheng <Penny.Zheng@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
 <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
 <AS8PR08MB799186FB3046AD59C9F8BBE892419@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <43B994EE-81DE-445A-B31F-477148E5465D@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <43B994EE-81DE-445A-B31F-477148E5465D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/09/2022 13:12, Bertrand Marquis wrote:
> Hi,

Hi Bertrand,

>> On 7 Sep 2022, at 12:48, Henry Wang <Henry.Wang@arm.com> wrote:
>>
>> Hi Julien,
>>
>>> -----Original Message-----
>>> From: Julien Grall <julien@xen.org>
>>> Subject: Re: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
>>>
>>> Hi Henry,
>>>
>>> While reviewing the binding sent by Penny I noticed some inconsistency
>>> with the one you introduced. See below.
>>>
>>> On 07/09/2022 09:36, Henry Wang wrote:
>>>> +- xen,static-heap
>>>> +
>>>> +    Property under the top-level "chosen" node. It specifies the address
>>>> +    and size of Xen static heap memory. Note that at least a 64KB
>>>> +    alignment is required.
>>>> +
>>>> +- #xen,static-heap-address-cells and #xen,static-heap-size-cells
>>>> +
>>>> +    Specify the number of cells used for the address and size of the
>>>> +    "xen,static-heap" property under "chosen".
>>>> +
>>>> +Below is an example on how to specify the static heap in device tree:
>>>> +
>>>> +    / {
>>>> +        chosen {
>>>> +            #xen,static-heap-address-cells = <0x2>;
>>>> +            #xen,static-heap-size-cells = <0x2>;
>>>
>>> Your binding, is introduce #xen,static-heap-{address, size}-cells
>>> whereas Penny's one is using #{address, size}-cells even if the property
>>> is not "reg".
>>>
>>> I would like some consistency in the way we define bindings. Looking at
>>> the tree, we already seem to have introduced
>>> #xen-static-mem-address-cells. So maybe we should follow your approach?
>>>
>>> That said, I am wondering whether we should just use one set of property
>>> name.
> 
> The more I dig, the less I find a use case where we could need different values here.

This is what I thought as well..

> Maybe just:
> #xen,address-cells = <2>
> #xen,size-cells = <2>
> Could be enough. If some parameter needs a different value it could introduce a specific name.

I think '#xen,...' is ambiguous because it doesn't tell you whether it 
applies to the memory range or interrupt range. So I would got with

> 
> Or maybe just memory-address-cells and memory-size-cells if we see a possibility to require a different value for an other address or size.

"#xen,memory-*".

That said, any reason to not reuse #address-cells and #size-cells here?

Cheers,

-- 
Julien Grall

