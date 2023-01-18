Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2246719C4
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 11:56:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480480.744918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI66t-00051P-5B; Wed, 18 Jan 2023 10:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480480.744918; Wed, 18 Jan 2023 10:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI66t-0004yi-1o; Wed, 18 Jan 2023 10:56:03 +0000
Received: by outflank-mailman (input) for mailman id 480480;
 Wed, 18 Jan 2023 10:56:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pI66r-0004yc-ER
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 10:56:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pI66q-0006Fp-Tt; Wed, 18 Jan 2023 10:56:00 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.8.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pI66q-0008E8-Lo; Wed, 18 Jan 2023 10:56:00 +0000
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
	bh=3j5m5JxERhhVzNmVeMej3DrFFiOJFVdBz8bH3tUI1FQ=; b=AgxW6RPKVhtQaEFM0BukrG5zyp
	G1UDnifF/75TzI+fBXbW/XoFsC4pe3vAnvZITyVfuD2w6BQAOFlamOu0NELiqdDn2FU5Z9Rrsm0dn
	fD1wI9SQk2KRaCRn7VZiEN3fjrnKPPA/xCPM6MY+nLAwRGBwdO5XhdJkkKAASMaXLnjg=;
Message-ID: <a5560a16-60d8-dc75-994e-c8719721bf74@xen.org>
Date: Wed, 18 Jan 2023 10:55:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 07/40] xen/arm64: add .text.idmap for Xen identity map
 sections
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-8-Penny.Zheng@arm.com>
 <4b817b65-f558-b4df-c7fd-242a04e59a59@xen.org>
 <PAXPR08MB742061C5E8ED73BD43FEF9599EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <PAXPR08MB742061C5E8ED73BD43FEF9599EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/01/2023 02:18, Wei Chen wrote:
> Hi Julien,

Hi Wei,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2023年1月18日 7:46
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v2 07/40] xen/arm64: add .text.idmap for Xen identity
>> map sections
>>
>> Hi,
>>
>> On 13/01/2023 05:28, Penny Zheng wrote:
>>> From: Wei Chen <wei.chen@arm.com>
>>>
>>> Only the first 4KB of Xen image will be mapped as identity
>>> (PA == VA). At the moment, Xen guarantees this by having
>>> everything that needs to be used in the identity mapping
>>> in head.S before _end_boot and checking at link time if this
>>> fits in 4KB.
>>>
>>> In previous patch, we have moved the MMU code outside of
>>> head.S. Although we have added .text.header to the new file
>>> to guarantee all identity map code still in the first 4KB.
>>> However, the order of these two files on this 4KB depends
>>> on the build tools. Currently, we use the build tools to
>>> process the order of objs in the Makefile to ensure that
>>> head.S must be at the top. But if you change to another build
>>> tools, it may not be the same result.
>>
>> Right, so this is fixing a bug you introduced in the previous patch. We
>> should really avoid introducing (latent) regression in a series. So
>> please re-order the patches.
>>
> 
> Ok.
> 
>>>
>>> In this patch we introduce .text.idmap to head_mmu.S, and
>>> add this section after .text.header. to ensure code of
>>> head_mmu.S after the code of header.S.
>>>
>>> After this, we will still include some code that does not
>>> belong to identity map before _end_boot. Because we have
>>> moved _end_boot to head_mmu.S.
>>
>> I dislike this approach because you are expecting that only head_mmu.S
>> will be part of .text.idmap. If it is not, everything could blow up again.
>>
> 
> I agree.
> 
>> That said, if you look at staging, you will notice that now _end_boot is
>> defined in the linker script to avoid any issue.
>>
> 
> Sorry, I am not quite clear about this comment. The _end_boot of original
> staging branch is defined in head.S. And I am not quite sure how this
> _end_boot solve multiple files contain idmap code.

If you look at the latest staging, there is a commit (229ebd517b9d) that 
now define _end_boot in the linker script.

The .text.idmap section can be added before the definition of _end_boot.

> 
> Cheers,
> Wei Chen
> 
>>> That means all code in head.S
>>> will be included before _end_boot. In this patch, we also
>>> added .text flag in the place of original _end_boot in head.S.
>>> All the code after .text in head.S will not be included in
>>> identity map section.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> ---
>>> v1 -> v2:
>>> 1. New patch.
>>> ---
>>>    xen/arch/arm/arm64/head.S     | 6 ++++++
>>>    xen/arch/arm/arm64/head_mmu.S | 2 +-
>>>    xen/arch/arm/xen.lds.S        | 1 +
>>>    3 files changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>>> index 5cfa47279b..782bd1f94c 100644
>>> --- a/xen/arch/arm/arm64/head.S
>>> +++ b/xen/arch/arm/arm64/head.S
>>> @@ -466,6 +466,12 @@ fail:   PRINT("- Boot failed -\r\n")
>>>            b     1b
>>>    ENDPROC(fail)
>>>
>>> +/*
>>> + * For the code that do not need in indentity map section,
>>> + * we put them back to normal .text section
>>> + */
>>> +.section .text, "ax", %progbits
>>> +
>>
>> I would argue that puts wants to be part of the idmap.
>>
> 
> I am ok to move puts to idmap. But from the original head.S, puts is
> placed after _end_boot, and from the xen.ld.S, we can see idmap is
> area is the section of "_end_boot - start". 

The original position of _end_boot is wrong. It didn't take into account 
the literal pool (there are at the end of the unit). So they would be 
past _end_boot.

> The reason of moving puts
> to idmap is because we're using it in idmap?

I guess it depends of what idmap really mean here. If you only interpret 
as the MMU is on and VA == PA. Then not yet (I was thinking to introduce 
a few calls).

If you also include the MMU off. Then yes.

Also, in the context of cache coloring, we will need to have a 
trampoline for cache coloring. So it would be better to keep everything 
close together as it is easier to copy.

Cheers,

-- 
Julien Grall

