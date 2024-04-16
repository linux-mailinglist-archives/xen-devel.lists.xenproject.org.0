Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D418A6679
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 10:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706753.1104111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rweWM-0006IM-6I; Tue, 16 Apr 2024 08:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706753.1104111; Tue, 16 Apr 2024 08:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rweWM-0006Fn-3f; Tue, 16 Apr 2024 08:50:30 +0000
Received: by outflank-mailman (input) for mailman id 706753;
 Tue, 16 Apr 2024 08:50:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rweWK-0006Fh-IX
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 08:50:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rweWJ-0003ZT-OE; Tue, 16 Apr 2024 08:50:27 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rweWJ-0004GF-GZ; Tue, 16 Apr 2024 08:50:27 +0000
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
	bh=zv7uB9leGcy68CdEaAep2QTSN5x5v3dBnlgv/QVy0g8=; b=xU60VTd+e/w8/kytWTWopaU9O2
	c/HgTpa5vJ2rqAVBQ4gYKbujIiby9/5eOUe/EFhnCFukg6EcYBCG6bSwjCAsXWwmANGm8K/DCiYYF
	d+PhOZKtjIxbjUKxa1CsUFi2ASZM1huJAnmk3KKAHub9y6LQuX74UjoFuOfnbiUamQcI=;
Message-ID: <74cfa4fe-2ee8-4700-be90-4227704f96d1@xen.org>
Date: Tue, 16 Apr 2024 09:50:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] xen/arm: List static shared memory regions as
 /memory nodes
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-14-luca.fancellu@arm.com>
 <7b09184a-111d-4a38-baec-53f01ec6ed03@xen.org>
 <39165767-26EA-4849-9C02-12393933139E@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <39165767-26EA-4849-9C02-12393933139E@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16/04/2024 07:27, Luca Fancellu wrote:
> Hi Julien,

Hi Luca,

> 
>> On 15 Apr 2024, at 19:41, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 09/04/2024 12:45, Luca Fancellu wrote:
>>> Currently Xen is not exporting the static shared memory regions
>>> to the device tree as /memory node, this commit is fixing this
>>> issue.
>>> The static shared memory banks can be part of the memory range
>>> available for the domain, so if they are overlapping with the
>>> normal memory banks, they need to be merged together in order
>>> to produce a /memory node with non overlapping ranges in 'reg'.
>>
>> Before reviewing the code in more details, I would like to understand a bit more the use case and whether it should be valid.
>>
>>  From my understanding, the case you are trying to prevent is the following setup:
>>   1. The Guest Physical region 0x0000 to 0x8000 is used for RAM
>>   2. The Guest Physical region 0x0000 to 0x4000 is used for static memory
> 
> So far, it was possible to map guest physical regions inside the memory range given to the guest,
> so the above configuration was allowed and the underlying host physical regions were of course
> different and enforced with checks. So I’m not trying to prevent this behaviour, however ...
> 
>>
>> The underlying Host Physical regions may be different. Xen doesn't guarantee in which order the regions will be mapped, So whether the overlapped region will point to the memory or the shared region is unknown (we don't guarantee the order of the mapping). So nothing good will happen to the guest.
> 
> ... now here I don’t understand if this was wrong from the beginning or not, shall we enforce also that
> guest physical regions for static shared memory are outside the memory given to the guest?

Nothing good will happen if you are trying to overwrite mappings. So I 
think this should be enforced. However, this is a more general problem. 
At the moment, this is pretty much as mess because you can overwrite any 
mapping (e.g. map MMIO on top of the RAM).

I think the easiest way to enforce is to do it in the P2M code like x86 
does for certain mappings.

Anyway, I don't think the problem should be solved here or by you (this 
is likely going to be a can of worms). For now, I would consider to 
simply drop the patches that are trying to do the merge.

Any thoughts?

Cheers,

-- 
Julien Grall

