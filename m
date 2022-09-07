Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B435B0299
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 13:15:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401317.643159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVt1Y-0003V4-AV; Wed, 07 Sep 2022 11:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401317.643159; Wed, 07 Sep 2022 11:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVt1Y-0003TH-7J; Wed, 07 Sep 2022 11:15:16 +0000
Received: by outflank-mailman (input) for mailman id 401317;
 Wed, 07 Sep 2022 11:15:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVt1X-0003T9-2W
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 11:15:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVt1W-0003jL-P4; Wed, 07 Sep 2022 11:15:14 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVt1W-00059P-Hz; Wed, 07 Sep 2022 11:15:14 +0000
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
	bh=jZWXRwyI8Dp3QWLaXCzyLmSVwoQGad1to+F9DsgPWNc=; b=eSMGHFMfCEQOhpRekUwfSl+HnA
	eyRa+PE8vcy/udMdr309p5PiKTCzxAEI4aV09++KIDGkkyhqflu91rPzSXcLrcAZzQ0/DFEHTQ/uP
	TO6vNKj3lP9nAyWl9aRAfDMN8bVXSEBi3Jrv0mgZcQHnq3ascR+3FuBc7ERhiOFrKdT0=;
Message-ID: <28aa7040-af9e-eda7-ee04-60c71019e91c@xen.org>
Date: Wed, 7 Sep 2022 12:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v3 3/4] xen/arm: mm: Rename xenheap_* variable to
 directmap_*
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-4-Henry.Wang@arm.com>
 <9234b0da-01c6-dafc-8e62-c7e497f8f146@xen.org>
 <AS8PR08MB799170866BCA3237738B4DE992419@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <df7ce48f-097e-e30e-aefb-9aec253492a1@xen.org>
 <AS8PR08MB7991F77F461EC0C254E8B90092419@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991F77F461EC0C254E8B90092419@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/09/2022 12:09, Henry Wang wrote:
> Hi Julien,

Hi Henry,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>>>>> @@ -609,7 +609,7 @@ void __init setup_xenheap_mappings(unsigned
>>>> long base_mfn,
>>>>
>>>> I think the function also want to be renamed to match the code below.
>>>
>>> Hmmm, renaming the name to "setup_directmap_mappings" would
>>> somehow lead me to think of we are getting rid of the name "xenheap"
>>> completely in the code, which seems a little bit scary to me...
>>>
>>> But I just checked there is a comment
>>> "/* Set up the xenheap: up to 1GB of contiguous, always-mapped
>> memory."
>>> above the function and the declaration so I guess we are fine?
>>
>> We are not getting rid of "xenheap". In fact the common code will
>> continue to use the concept.
> 
> Ack.
> 
>>
>> What we make clear is this function is not only here to map the xenheap
>> but other memory (e.g. static domain memory on arm64).
> 
> In that case I think the comment in function declaration (attached below)
> ```
> /* Set up the xenheap: up to 1GB of contiguous, always-mapped memory.
>   * Base must be 32MB aligned and size a multiple of 32MB. */
> extern void setup_xenheap_mappings(unsigned long base_mfn, unsigned long nr_mfns);
> ```
> would also need changes, as I think it only refers to the Arm32.
> 
> How about
> /*
>   * For Arm32, set up the xenheap: up to 1GB of contiguous,
>   * always-mapped memory. Base must be 32MB aligned and size
>   * a multiple of 32MB.
>   * For Arm64, set up the directmap area of memory.

One remark. I would say: "map the region in the directmap area"

Cheers,

-- 
Julien Grall

