Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 919F38FC5F3
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 10:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735592.1141708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sElrP-00054h-8e; Wed, 05 Jun 2024 08:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735592.1141708; Wed, 05 Jun 2024 08:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sElrP-00052P-5e; Wed, 05 Jun 2024 08:19:07 +0000
Received: by outflank-mailman (input) for mailman id 735592;
 Wed, 05 Jun 2024 08:19:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sElrN-00052J-NR
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2024 08:19:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sElrN-0001uP-1H; Wed, 05 Jun 2024 08:19:05 +0000
Received: from [62.28.225.65] (helo=[172.20.145.71])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sElrM-0002Ts-Nj; Wed, 05 Jun 2024 08:19:04 +0000
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
	bh=MDIY5unLBtzxabn8imTAvrRC/Hn4le7laRl0/9ir/Y8=; b=TqoG1zig/zIOs5HBPjVJIzn+Sz
	NShcZ3v1niR8sMasQUGZ9W9bX8rAwUdW9FVs6iKNExFvJ5Wo9LcXRV7RC+4VfEaoXrhQg3vNGm9yD
	PTTEzrMx/1d6lYEA77/OfQRRqh5+mxjls4qLL5H1vvgtkDnRWEPDbS7SY9hqeLts3SAs=;
Message-ID: <a4a3987f-f22b-4e14-b38f-51335c821bad@xen.org>
Date: Wed, 5 Jun 2024 09:19:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] arm: dom0less: add TEE support
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240531174915.1679443-1-volodymyr_babchuk@epam.com>
 <9e62b5d9-9c80-4f7c-9cc6-3b863f0c90ad@xen.org> <87tti8x6oj.fsf@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <87tti8x6oj.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

On 04/06/2024 12:56, Volodymyr Babchuk wrote:
> 
> Hi Julien,
> 
> Julien Grall <julien@xen.org> writes:
> 
>> Hi Volodymyr,
>>
>> On 31/05/2024 18:49, Volodymyr Babchuk wrote:
>>> Extend TEE mediator interface with two functions :
>>>    - tee_get_type_from_dts() returns TEE type based on input string
>>>    - tee_make_dtb_node() creates a DTB entry for the selected
>>>      TEE mediator
>>> Use those new functions to parse "xen,tee" DTS property for dom0less
>>> guests and enable appropriate TEE mediator.
> [...]
> 
>>> +
>>> +    A string property that describes what TEE mediator should be enabled
>>> +    for the domain. Possible property values are:
>>> +
>>> +    - "none" (or missing property value)
>>> +    No TEE will be available in the VM.
>>> +
>>> +    - "OP-TEE"
>>> +    VM will have access to the OP-TEE using classic OP-TEE SMC interface.
>>> +
>>> +    - "FF-A"
>>> +    VM will have access to a TEE using generic FF-A interface.
>>
>> I understand why you chose those name, but it also means we are using
>> different name in XL and Dom0less. I would rather prefer if they are
>> the same.
>>
> 
> Well, my first idea was to introduce additional "const char *dts_name"
> for a TEE mediator description. But it seems redundant. I can rename
> existing mediators so their names will correspond to names used by libxl.

The field name is only used for printing. So I think it would be ok to 
rename the values.

It would also be good to update the comment on top of the definition of 
the field "name" so it is clear the name will be used by dom0less.

Cheers,

-- 
Julien Grall

