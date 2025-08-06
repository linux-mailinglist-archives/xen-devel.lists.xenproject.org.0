Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C66CFB1C267
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 10:48:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071467.1434909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujZoc-0007g7-Hd; Wed, 06 Aug 2025 08:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071467.1434909; Wed, 06 Aug 2025 08:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujZoc-0007eM-EX; Wed, 06 Aug 2025 08:48:06 +0000
Received: by outflank-mailman (input) for mailman id 1071467;
 Wed, 06 Aug 2025 08:48:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ujZob-0007eG-Cb
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 08:48:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ujZoa-004N02-24;
 Wed, 06 Aug 2025 08:48:04 +0000
Received: from [15.248.3.95] (helo=[10.24.67.219])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ujZoa-006h07-1L;
 Wed, 06 Aug 2025 08:48:04 +0000
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
	bh=M6PvuqvXz/6ABB1gSm81kTqZeDu/E6K5yov6LNNWdME=; b=1x46Tfw+krHgLK9d4I11eMKoLY
	l0GiBSEcK2Ff6rkzEugAjWLIoXGBTvFN53y/i7UM1JzJQsY0C7QTK/1rZWKmFkWP58mGBuyJjxCr4
	dYpLuwJNey7t9sbLV+N7bwB5kwhIM6siovyaIvzYOV29X1xfFnwgDelEXu+UuV3PYVss=;
Message-ID: <72f0d4bd-65b6-4904-8fd6-b714058923b2@xen.org>
Date: Wed, 6 Aug 2025 09:48:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/dom0less: arm: fix hwdom 1:1 low memory allocation
Content-Language: en-GB
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Denis Mukhin <dmukhin@ford.com>, Jason Andryuk <jason.andryuk@amd.com>
References: <20250805190017.209711-1-grygorii_strashko@epam.com>
 <5807ed03-7db2-4ce6-9acf-c4d515fbd293@xen.org>
 <5a33ddf2-716e-4fca-8764-760dec9944ce@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5a33ddf2-716e-4fca-8764-760dec9944ce@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Grygorii,

On 06/08/2025 09:19, Grygorii Strashko wrote:
> Hi Julien,
> 
> On 06.08.25 00:07, Julien Grall wrote:
>> Hi Grygorii,
>>
>> On 05/08/2025 20:00, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Call stack for dom0less hwdom case (1:1) memory:
>>> create_domUs
>>> |-construct_domU
>>>    |-construct_hwdom()
>>>      |-allocate_memory_11()
>>>
>>> And allocate_memory_11() uses "dom0_mem" as:
>>> min_low_order =
>>>    get_order_from_bytes(min_t(paddr_t, dom0_mem, MB(128)));
>>>
>>> In case of dom0less boot the "dom0_mem" is not used and defaulted to 0,
>>
>>  From docs/mics/xen-command-linux.pandoc:
>>
>> ---
>>
>> ### dom0_mem (ARM)
>>  > `= <size>`
>>
>> Set the amount of memory for the initial domain (dom0). It must be
>> greater than zero. This parameter is required.
>>
>> ---
>>
>> If dom0_mem is effectively optional, then shouldn't the doc be updated?
> 
> No. I think doc is correct because when regular Dom0(hwdom)(initial domain)
> is created code goes through regular Dom0 path and "dom0_mem" is 
> accounted for.

I understand this is used when dom0 is not described in the device tree.
The crucial part in your sentence is "when", to me this indicates a 
condition. Whereas the current wording in xen-command-linux is using 
"required" with no condition. So a reader can rightfully think the 
parameter is also used in dom0less and have to be specified.

So I think the wording needs to be tweaked to something like "This 
parameter is required (and only used) when the initial domain is not 
described in the Device-Tree."

Although, "required" might still be too strict because it looks like we 
would provide a configuration for dom0_mem if it is not set.

Cheers,

-- 
Julien Grall


