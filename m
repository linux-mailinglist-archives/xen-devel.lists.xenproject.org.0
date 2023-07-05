Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A18C74803D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 10:57:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558849.873297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyJy-0006nA-AY; Wed, 05 Jul 2023 08:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558849.873297; Wed, 05 Jul 2023 08:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyJy-0006lj-7i; Wed, 05 Jul 2023 08:57:10 +0000
Received: by outflank-mailman (input) for mailman id 558849;
 Wed, 05 Jul 2023 08:57:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGyJx-0006ld-5T
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 08:57:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGyJv-0002PD-Tz; Wed, 05 Jul 2023 08:57:07 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGyJv-0004Dk-Ml; Wed, 05 Jul 2023 08:57:07 +0000
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
	bh=C7Wx+OvRT57vH8OmMmUDvyBzeLaEHIugBf5phm/IHPo=; b=u0eLEYe6oyRuGuvPO1t9I3A9ey
	fZv6+dNuXTR0LDftDs7rLoo69wIMq1cydKV8Kv7AHnx7jHU3ZxZ64VWPG705AQA8QtUNLQ4ktECsE
	aUL6Poc1WhR+P4TTrs0+8ha+alvLgIuWl1YkS3dMd7GPWUbc1V5pZWEY854KZN/VUX2o=;
Message-ID: <24a0c426-0030-a35f-0178-fb0551fb1f35@xen.org>
Date: Wed, 5 Jul 2023 09:57:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v3 2/3] xen/drivers/passthrough/arm/smmu-v3.c: fix
 violations of MISRA C:2012 Rule 3.1
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <cover.1688032865.git.nicola.vetrini@bugseng.com>
 <8a8d5ed47f24791d3927345fafed07023a8b0b76.1688032865.git.nicola.vetrini@bugseng.com>
 <55390224-89CC-44E9-95B1-BBA491BBFEF3@arm.com>
 <3a192d6a-4a4d-b798-c205-ebc0a2302c50@suse.com>
 <B53B7ADE-56F0-45D1-992B-BCC9B29C82AB@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <B53B7ADE-56F0-45D1-992B-BCC9B29C82AB@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Rahul,

On 05/07/2023 09:40, Rahul Singh wrote:
>> On 4 Jul 2023, at 4:51 pm, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 29.06.2023 16:52, Luca Fancellu wrote:
>>>
>>>
>>>> On 29 Jun 2023, at 11:06, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
>>>>
>>>> In the file `xen/drivers/passthrough/arm/smmu-v3.c' there are a few occurrences
>>>
>>> here you use a different character to enclose the file path (` vs ‘) may I suggest to
>>> use only (‘)?
>>>
>>>> of nested '//' character sequences inside C-style comment blocks, which violate
>>>> Rule 3.1.
>>>>
>>>> The patch aims to resolve those by replacing the nested comments with
>>>> equivalent constructs that do not violate the rule.
>>>>
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>
>>> You are missing the “---“ here, meaning that the lines below are part of the
>>> commit message and I’m sure you don’t want that.
>>>
>>> Also here, may I suggest to use this commit title instead?
>>> “xen/arm: smmuv3: Fix violations of MISRA C:2012 Rule 3.1”
>>
>> Just to mention it: Personally I'm averse to such double subject prefixes.
>> Why would (here) "xen/smmuv3: " not be sufficient (and entirely unambiguous)?
> 
> With the changes suggested above.

There are conflicting suggestions about the title. So it is not clear to 
me which one you are referring to.

I will assume you were happy either way and so picked Luca's proposal 
and committed.

> 
> Acked-by: Rahul Singh <rahul.singh@arm.com>
> 
> Regards,
> Rahul
> 
> 

-- 
Julien Grall

