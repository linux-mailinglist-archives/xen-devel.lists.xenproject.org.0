Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F74442A70
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 10:33:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219852.380885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhq9y-0000mz-Kj; Tue, 02 Nov 2021 09:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219852.380885; Tue, 02 Nov 2021 09:32:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhq9y-0000l6-Hk; Tue, 02 Nov 2021 09:32:50 +0000
Received: by outflank-mailman (input) for mailman id 219852;
 Tue, 02 Nov 2021 09:32:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mhq9x-0000ku-HF
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 09:32:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mhq9u-0001eN-UW; Tue, 02 Nov 2021 09:32:46 +0000
Received: from [54.239.6.184] (helo=[192.168.7.68])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mhq9u-0007WS-O6; Tue, 02 Nov 2021 09:32:46 +0000
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
	bh=QFUH8Ot7Lw0F47LxOeZKGrzE5Nfbq0gLhq4KNdoXGhI=; b=CD4G+Q9PWpYX9tPkDn+BU7K0X9
	EYgvnNqJsY9KI9J/na3hBssYPTgfFLc8SgkQzb2dfru5Z/t/kEALj0IPeZtSqrOzqQmiNeugvZjKj
	gwREely2gYTbgw6XcVgZvTaBmHDimnGyHDpIX7tp37HQ71cj/yeWu5kc6ObCn4GeCQ1M=;
Message-ID: <61c76ed6-e9f2-f4ec-608c-d84bd0e73258@xen.org>
Date: Tue, 2 Nov 2021 09:32:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers [and
 2 more messages]
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <iwj@xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20211027082533.1406015-1-andr2000@gmail.com>
 <cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
 <d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
 <65886734-7333-4469-fcc1-6916db708f13@xen.org>
 <b6bb02b6-6358-b5e0-1b80-7819aadabe10@epam.com>
 <6d8f1061-7aec-2c1a-aaf4-c30440c2797a@xen.org>
 <38da2edd-06a2-63d0-51ad-1284272c8da5@epam.com>
 <a74b52fb-6514-4187-17fe-b63236efa0ce@xen.org>
 <24954.51153.588540.850154@mariner.uk.xensource.com>
 <d7e4ae66-f648-e18e-79c8-fae6eb896f00@xen.org>
 <YXkU+DKYmvwo+kak@Air-de-Roger>
 <0bbe4d1d-421d-e816-42aa-f43581902a02@epam.com>
 <24953.34635.645112.279110@mariner.uk.xensource.com>
 <24959.49313.936961.936820@mariner.uk.xensource.com>
 <alpine.DEB.2.21.2111011402320.20134@sstabellini-ThinkPad-T480s>
 <a14ce7fd-c3d0-0777-f0c9-5f7fad901452@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a14ce7fd-c3d0-0777-f0c9-5f7fad901452@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 02/11/2021 07:16, Oleksandr Andrushchenko wrote:
> 
> 
> On 01.11.21 23:06, Stefano Stabellini wrote:
>> On Mon, 1 Nov 2021, Ian Jackson wrote:
>>> Julien Grall writes ("Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers"):
>>>> On 28/10/2021 16:54, Ian Jackson wrote:
>>>>> There are a number of patches that I'm getting CC'd on related to ARM
>>>>> and vpci (according to the Subject).  Are these targeted for 4.16 ?
>>>>> Most of them don't have 4.16 Subject tags.
>>>> Oleksandr wants this patch to be included for 4.16 but forgot to tag it
>>>> properly.
>>> Oh yes.  However,
>>>
>>> 1. I also wrote this:
>>>
>>>>> I am finding it difficult to see the wood for the trees.
>>>>> It would be really helpful if these vpci fixes were collected
>>>>> together into a series.
>>> Can someone please confirm whether this is the only vpci-related patch
>>> that ought to be on my radar for 4.16 ?
>>>
>>> 2. I have not had a reply to my question on Wednesday in
>>> <24953.34635.645112.279110@mariner.uk.xensource.com>:
>>>
>>>     Um, can you explain what the practical impact is of not taking this
>>>     patch for 4.16 ?  As I understand it vpci for ARM is non-functional in
>>>     4.16 and this is not expected to change ?  So there would be no
>>>     benefit to users, and taking the patch would add small but nonzero
>>>     risk ?
>>>
>>> I need this information to decide whether a release-ack is
>>> appropriate.
>>>
>>> Note that we are in code freeze so all patches, including bugfixes,
>>> need my ack.
>> Hi Ian,
>>
>> This patch [1] is a straightforward 2 lines fix for vpci on ARM.  There
>> is no risk for the release as the source file affected only builds when
>> CONFIG_HAS_VPCI is enabled, and it is currently disabled on ARM.
>>
>> At the same time, as we know vpci is not complete in 4.16 anyway, so the
>> counter argument is that we don't need to fix it.
>>
>> Given how trivial the fix is, and that it cannot break the build or
>> runtime, I would take it.
> Thank you,
> I can re-send the patch with the updated commit message (Julien),
> but I still have no R-b's for the patch, so not sure if it is worth it

I can't speak for the others. In my case, I didn't give my reviewed-by 
because the commit message needs to be updated. If you resend, I will 
have another look.

Cheers,

-- 
Julien Grall

