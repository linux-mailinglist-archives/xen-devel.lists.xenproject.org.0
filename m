Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CA56E813C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 20:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523727.814052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppCVh-0000RK-4b; Wed, 19 Apr 2023 18:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523727.814052; Wed, 19 Apr 2023 18:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppCVh-0000O1-1f; Wed, 19 Apr 2023 18:26:29 +0000
Received: by outflank-mailman (input) for mailman id 523727;
 Wed, 19 Apr 2023 18:26:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ppCVf-0000Ns-H6
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 18:26:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ppCVe-0004uY-Rp; Wed, 19 Apr 2023 18:26:26 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.29.18]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ppCVe-0008AF-Ka; Wed, 19 Apr 2023 18:26:26 +0000
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
	bh=NTxGG+Wi2y1G3NRuaUPx296WWyqbtUW6lIoscbs5XIw=; b=NlGya7ac/zgDkKuwWugGlzMGGt
	wZSpJb8ozd/gR+pM5ybRL1rvlGCTQaba7mltRje2t5zCDjgBzuJM74Z6JiDKxFosS3ylyB+vaQ0+4
	9kqOFpvda1bjB6XvGUeHm4fEVtZEOlkpLeHsKihj1u408PlThBLEv0fM9VRAMUU6/8n8=;
Message-ID: <32060944-324d-4c38-ad60-69553ab5a6be@xen.org>
Date: Wed, 19 Apr 2023 19:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] xen/arm: fix unitialized use warning
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230414185714.292881-1-stewart.hildebrand@amd.com>
 <20230414185714.292881-4-stewart.hildebrand@amd.com>
 <5fb567c5-1e82-a048-1cfe-f6f69e0b5ebc@xen.org>
 <3833c906-8d88-d35d-b9dd-b70d5f7a9fa7@amd.com>
 <b779a5cf-1421-086b-f7f3-188fcb9af3db@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b779a5cf-1421-086b-f7f3-188fcb9af3db@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stewart,

On 17/04/2023 03:08, Stewart Hildebrand wrote:
> On 4/16/23 22:03, Stewart Hildebrand wrote:
>> On 4/16/23 08:53, Julien Grall wrote:
>>> Hi Stewart,
>>
>> Hi Julien,
>>
>>> On 14/04/2023 19:57, Stewart Hildebrand wrote:
>>>> When building the hypervisor with -Og, we encounter the following error:
>>>
>>> Is this with GCC 12 as well?
>>
>> Yes. If my memory serves me correctly this particular one occurs with both GCC 11 and 12.

Thanks. I will update the commit message to mention it.

>>
>>>> arch/arm/domain_build.c: In function ‘make_cpus_node’:
>>>> arch/arm/domain_build.c:2040:12: error: ‘clock_valid’ may be used uninitialized [-Werror=maybe-uninitialized]
>>>>    2040 |         if ( clock_valid )
>>>>         |            ^
>>>> arch/arm/domain_build.c:1947:10: note: ‘clock_valid’ was declared here
>>>>    1947 |     bool clock_valid;
>>>>         |          ^~~~~~~~~~~
>>>> cc1: all warnings being treated as errors
>>>>
>>>> Fix it by initializing the variable.
>>>>
>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>> ---
>>>> See previous discussion here
>>>> https://lists.xenproject.org/archives/html/xen-devel/2022-10/msg00741.html
>>>> ---
>>>>    xen/arch/arm/domain_build.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>> index 4f9d4f9d8867..18b350734a8e 100644
>>>> --- a/xen/arch/arm/domain_build.c
>>>> +++ b/xen/arch/arm/domain_build.c
>>>> @@ -1944,7 +1944,7 @@ static int __init make_cpus_node(const struct domain *d, void *fdt)
>>>>        /* Placeholder for cpu@ + a 32-bit hexadecimal number + \0 */
>>>>        char buf[13];
>>>>        u32 clock_frequency;
>>>> -    bool clock_valid;
>>>> +    bool clock_valid = false;
>>>
>>> NIT: I would add "Keep the compiler happy with -Og"
>>>
>>> I am happy to add it while committing if you agree.
>>
>> Yes, please do. Thanks.
> 
> One more thing, there is a typo in the subject, if you are willing to correct it while committing. s/unitialized/uninitialized/

Sure. I will do that.

Cheers,

-- 
Julien Grall

