Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D0773D841
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 09:11:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555339.867044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDgN4-0006Ma-WE; Mon, 26 Jun 2023 07:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555339.867044; Mon, 26 Jun 2023 07:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDgN4-0006K3-Sx; Mon, 26 Jun 2023 07:10:46 +0000
Received: by outflank-mailman (input) for mailman id 555339;
 Mon, 26 Jun 2023 07:10:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDgN2-0006Jx-Hu
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 07:10:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDgN1-0001NG-VM; Mon, 26 Jun 2023 07:10:43 +0000
Received: from [193.85.242.128] (helo=[192.168.148.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDgN1-0003Tq-PB; Mon, 26 Jun 2023 07:10:43 +0000
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
	bh=0IoRZ8EeuelEdknPZn5rOg0nLTbd9JLAnP4fYyxlVB4=; b=I3qBdkBVOY0f9IoU7J1cIq3CKL
	tOXTMYuECfdOrR7tdmNHdNZhwmd6fzwpFLRiYEx+DblW1P8rBA1XaKRU4piMULMQvoseDl7hHkg8a
	2Ia3b6lpDkaJz7G/bgqj1ds99mSEsAOr3W96bQB4ppDzneHhowFN+Mm2BjGX2+SQtFYY=;
Message-ID: <90c07118-a028-2abc-8252-f9807a2e99f1@xen.org>
Date: Mon, 26 Jun 2023 08:10:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 1/9] xen/arm: Check Xen size when linking
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-2-julien@xen.org>
 <AS8PR08MB799128C9EFC82CBA0151B2009226A@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB799128C9EFC82CBA0151B2009226A@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/06/2023 07:15, Henry Wang wrote:
> Hi Julien,

Hi Henry,


>> -----Original Message-----
>> Subject: [PATCH 1/9] xen/arm: Check Xen size when linking
>>
>> The linker will happily link Xen if it is bigger than what we can handle
>> (e.g 2MB). This will result to unexpected failure after boot.
> 
> I found this a little bit misleading because when I looked for
> XEN_VIRT_SIZE, I am having:
> 
> #define XEN_VIRT_SIZE           _AT(vaddr_t, MB(8))

I think you looked at the tree with my series applied because patch #9 
will bump the reserved size. The value in the commit message match the 
current value in staging.

[...]

>> This unexpected failure can be prevented by forbidding linking if Xen is
>> bigger than the area we reversed.
> 
> I am not sure this is a typo: s/reversed/reserved/, but I find the current
> sentence a little bit hard to understand.

It is a typo. I will fix it.

> 
>>
>> Signed-off-by: Julien Grall <julien@xen.org>
> 
> Both comment above can be fixed on commit, so:
> 
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> 
> I've also tested this patch on top of today's staging by our internal CI,
> and I don't see any build error there, hence also:
> 
> Tested-by: Henry Wang <Henry.Wang@arm.com>

Thanks!

Cheers,

-- 
Julien Grall

