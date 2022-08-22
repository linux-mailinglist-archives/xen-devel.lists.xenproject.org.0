Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBAF59BB1C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 10:10:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391214.628932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ2VQ-00010k-9J; Mon, 22 Aug 2022 08:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391214.628932; Mon, 22 Aug 2022 08:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ2VQ-0000y0-6h; Mon, 22 Aug 2022 08:09:56 +0000
Received: by outflank-mailman (input) for mailman id 391214;
 Mon, 22 Aug 2022 08:09:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oQ2VO-0000xe-JN
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 08:09:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQ2VO-00061k-Ac; Mon, 22 Aug 2022 08:09:54 +0000
Received: from [54.239.6.185] (helo=[192.168.10.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQ2VO-0007Kc-3s; Mon, 22 Aug 2022 08:09:54 +0000
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
	bh=sj4Hc/SiVf5WxtnkO1z/WmRh642zoD+5JWZIohLATI0=; b=msZ8f77TgZxjvlYPGsK6+iZqCh
	p3nwsboJtsNqWqTPEnLtHwy5kiv5ypy8dHYXuFblmLSNaEgfxAEVPi0HStLn7fKoGosV6iQnvEUq0
	+2qqkSv0FjV0b1w3RpAkRSK3YH9RHL5Zwv3hfeUeqvxE0+Ph83BLWp4OUQhH3mwc2qNk=;
Message-ID: <c2e2686d-c75b-bf53-b717-adcdd0d7107e@xen.org>
Date: Mon, 22 Aug 2022 09:09:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH] arm/domain: fix comment for arch_set_info_guest
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen development discussion <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220805130800.16387-1-luca.fancellu@arm.com>
 <047c108c-524c-27f9-2326-c015093990ce@xen.org>
 <F8BBA0E8-73F3-447B-AB3C-20F7B4F353D1@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <F8BBA0E8-73F3-447B-AB3C-20F7B4F353D1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 22/08/2022 07:56, Luca Fancellu wrote:
> 
> 
>> On 5 Aug 2022, at 18:35, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 05/08/2022 14:08, Luca Fancellu wrote:
>>> The function arch_set_info_guest is not reached anymore through
>>> VCPUOP_initialise on arm, update the comment.
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> Changes in v2:
>>>   - rephrased comment to not list caller functions (Julien)
>>> ---
>>>   xen/arch/arm/domain.c | 5 ++---
>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>> index 2cd481979cf1..9db8a37a089c 100644
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -885,9 +885,8 @@ static int is_guest_pv64_psr(uint64_t psr)
>>>   #endif
>>>     /*
>>> - * Initialise VCPU state. The context can be supplied by either the
>>> - * toolstack (XEN_DOMCTL_setvcpucontext) or the guest
>>> - * (VCPUOP_initialise) and therefore must be properly validated.
>>> + * Initialise vCPU state. The context may be supplied by an external entity, so
>>> + * we need to validate it
>>
>> NIT: Missing a full stop. This can be added on commit.
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Hi Julien,
> 
> Any plan to commit this one? Not an important change, just asking so that I can remove it
> from my watch list.

Sorry for the delay. It is now pushed.

Cheers,

-- 
Julien Grall

