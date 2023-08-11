Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B34277791C7
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 16:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582474.912269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUT5K-0002F1-6K; Fri, 11 Aug 2023 14:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582474.912269; Fri, 11 Aug 2023 14:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUT5K-0002CL-2F; Fri, 11 Aug 2023 14:25:50 +0000
Received: by outflank-mailman (input) for mailman id 582474;
 Fri, 11 Aug 2023 14:25:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qUT5I-0002CF-5W
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 14:25:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qUT5H-0004vG-GE; Fri, 11 Aug 2023 14:25:47 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.207.66]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qUT5H-0003iG-Ai; Fri, 11 Aug 2023 14:25:47 +0000
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
	bh=SPsgltvDA8z/JJONlXDL9LYdMxxYlziR+D6/oBYEwgA=; b=ei7vSTzUJ9ZFk7a6TE8uIUfz8C
	viWv2V/mXaIR4o3SG1KsOmku2+Uiwa82azMS7tIigrv8sJvxdrkcK+Hlu2NVeXePU5DwODLRMJLcT
	8M6rEHywWBtE6WJRADlY0Or0AXUSU/T+jgVWjZhqCcwCPoMPCzChB/5b6MqyYr0o0m+Q=;
Message-ID: <50bfd7e1-2e5b-468e-aa25-6f9fae302ba2@xen.org>
Date: Fri, 11 Aug 2023 15:25:45 +0100
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
 <10ba4d0b-d5c1-4d86-bed3-9628203e3dac@xen.org>
 <019B593E-D59A-4C45-8C7C-BD9F19C8B2A6@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <019B593E-D59A-4C45-8C7C-BD9F19C8B2A6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/08/2023 15:22, Luca Fancellu wrote:
>> On 11 Aug 2023, at 15:13, Julien Grall <julien@xen.org> wrote:
>> On 11/08/2023 14:40, Luca Fancellu wrote:
>>>> On 11 Aug 2023, at 13:56, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi Luca,
>>>>
>>>> On 08/08/2023 09:00, Luca Fancellu wrote:
>>>>> Add asm/domain.h that is defining the type 'enum domain_type', it
>>>>> is needed on arm64 build where this type is used for a member of
>>>>> the structure kernel_info.
>>>>
>>>> I read "needed" as in it Xen build is broken. But AFAIK, this is more a latent issue if someone else want to include the header. Is that correct?
>>> Yes correct
>>>>
>>>> If so, how about:
>>>>
>>>> The 'enum domain_type' is defined by 'asm/domain.h' which is not included (directly or indirectly) by 'asm/kernel.h'.
>>>>
>>>> This currently doesn't break the compilation because asm/domain.h will included by the user of 'kernel.h'. But it would be better to avoid relying on it. So add the include in 'asm/domain.h'.
>>> Yeah much better, should I push a v2?
>>
>> No. I can deal with it on commit.
> 
> Ok thank you for doing that
> 
>>
>>>>
>>>>> Fixes: 66e994a5e74f ("xen: arm64: add guest type to domain field.")
>>>>
>>>> While we aim to have header self-contained, this has never been a guarantee in Xen. So I would argue this is not a fix in the sense it someone would want to ingest it in there tree.
>>> Ok I see, I thought it could be linked to the issue about sorting headers that led to build breakage, but I’ve
>>
>> I am probably missing something here. Which issue are you referring to? Is it a follow-up patch that will sort headers?
> 
> It’s an issue I’ve faced when trying to sort automatically the include using clang-format, I’ve seen issues building domain_build.c after sorting the headers in the way we expect from coding style, I thought was related to some headers not being self-contained.

Ah I understand now. Usually, we would batch the re-ordering and the 
additional include in the same patch because they are tightly coupled 
together and it is easier to confirm it is necessary.

Anyway, this one is easy, so I am happy to commit this one in advance.

Cheers,

-- 
Julien Grall

