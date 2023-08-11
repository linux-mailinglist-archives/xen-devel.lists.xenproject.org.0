Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB8A77918A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 16:14:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582462.912249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUSt2-0008Ua-Oe; Fri, 11 Aug 2023 14:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582462.912249; Fri, 11 Aug 2023 14:13:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUSt2-0008SM-Ld; Fri, 11 Aug 2023 14:13:08 +0000
Received: by outflank-mailman (input) for mailman id 582462;
 Fri, 11 Aug 2023 14:13:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qUSt0-0008SF-Sv
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 14:13:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qUSt0-0004Y6-1k; Fri, 11 Aug 2023 14:13:06 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.207.66]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qUSsz-0003BX-SO; Fri, 11 Aug 2023 14:13:06 +0000
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
	bh=iv5/JRLPzEYNBJqB0oFUqOb1iJF/oBEMbvWX73DBqdo=; b=6hnrnWW0eWmo9nyJhRVlZM34x/
	BJQe+j4Hsst75XsERXANbs+Kx/uVqKs01mXjp31EAMRGYgO7zo2bCvzP56fV3hGN1maj9FQwsOwQm
	H+VFv9jbYDMi8FAb+fa2w7BCd6i6Rn0r6GRkMojv1wTnxQPeubGgxMTUZOSi1FaZqBL4=;
Message-ID: <10ba4d0b-d5c1-4d86-bed3-9628203e3dac@xen.org>
Date: Fri, 11 Aug 2023 15:13:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] xen/arm: Add asm/domain.h include to kernel.h
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230808080010.3858575-1-luca.fancellu@arm.com>
 <20230808080010.3858575-3-luca.fancellu@arm.com>
 <b9d88e5a-91d1-43b7-becd-8a742698e1c8@xen.org>
 <3C46ADAD-477D-46BB-BCCB-81C3198517E5@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3C46ADAD-477D-46BB-BCCB-81C3198517E5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 11/08/2023 14:40, Luca Fancellu wrote:
> 
> 
>> On 11 Aug 2023, at 13:56, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 08/08/2023 09:00, Luca Fancellu wrote:
>>> Add asm/domain.h that is defining the type 'enum domain_type', it
>>> is needed on arm64 build where this type is used for a member of
>>> the structure kernel_info.
>>
>> I read "needed" as in it Xen build is broken. But AFAIK, this is more a latent issue if someone else want to include the header. Is that correct?
> 
> Yes correct
> 
>>
>> If so, how about:
>>
>> The 'enum domain_type' is defined by 'asm/domain.h' which is not included (directly or indirectly) by 'asm/kernel.h'.
>>
>> This currently doesn't break the compilation because asm/domain.h will included by the user of 'kernel.h'. But it would be better to avoid relying on it. So add the include in 'asm/domain.h'.
> 
> Yeah much better, should I push a v2?

No. I can deal with it on commit.

> 
>>
>>> Fixes: 66e994a5e74f ("xen: arm64: add guest type to domain field.")
>>
>> While we aim to have header self-contained, this has never been a guarantee in Xen. So I would argue this is not a fix in the sense it someone would want to ingest it in there tree.
> 
> Ok I see, I thought it could be linked to the issue about sorting headers that led to build breakage, but I’ve

I am probably missing something here. Which issue are you referring to? 
Is it a follow-up patch that will sort headers?

> not investigated further so I would be ok to drop the Fixes:

Cheers,

-- 
Julien Grall

