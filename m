Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9472FD6DD
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 18:28:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71665.128512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2HGZ-0003AM-9Y; Wed, 20 Jan 2021 17:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71665.128512; Wed, 20 Jan 2021 17:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2HGZ-0003A0-6S; Wed, 20 Jan 2021 17:27:35 +0000
Received: by outflank-mailman (input) for mailman id 71665;
 Wed, 20 Jan 2021 17:27:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2HGX-00039v-GT
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:27:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2HGX-0005tp-89; Wed, 20 Jan 2021 17:27:33 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2HGX-0006iC-0w; Wed, 20 Jan 2021 17:27:33 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=XYHiNZs0DJdxwfF6uOhhQ91NwpnqVutMeOE9Bk0JEBg=; b=Wqk+oL+TV3Sicyw3WAPJiYiSU7
	t8VHF9pqHr6Aa0lGzxBZgMNug4ZYwR0/LnxKct899AXfFZ8oDOIN31bHHFNeJJJqajhWi63yEEtvu
	QWSJEqmeGoIogQ2SIXuJpeUx0g+l563sCThfiLdqJfhDUFT5RuNm2ORluyoItcsI9sk8=;
Subject: Re: [PATCH v2 2/2] xen/arm: Add defensive barrier in get_cycles for
 Arm64
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Penny Zheng <Penny.Zheng@arm.com>, Jiamei Xie <Jiamei.Xie@arm.com>,
 nd <nd@arm.com>
References: <20210108062126.2335873-1-wei.chen@arm.com>
 <20210108062126.2335873-2-wei.chen@arm.com>
 <c6de687f-2836-ec44-7d24-b088bfa10378@xen.org>
 <AM0PR08MB3747AE4B6F16FCB255D44D2C9EAD0@AM0PR08MB3747.eurprd08.prod.outlook.com>
 <e7943b76-a0b8-fac6-d743-47b0cd42f7ad@xen.org>
 <AM0PR08MB374768761C5A1A22480F27829EA80@AM0PR08MB3747.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d6af0731-7a9b-7a15-ae94-5dde84903724@xen.org>
Date: Wed, 20 Jan 2021 17:27:31 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <AM0PR08MB374768761C5A1A22480F27829EA80@AM0PR08MB3747.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 14/01/2021 00:18, Wei Chen wrote:
>>> I think
>>> if we introduce an empty helper for Arm32, we can reduce the other
>>> chunk inside get_cycles. In addition, if we need to do the same work
>>> for Arm32 in the future, we may not need to modify get_cycles.
>> I don't really follow this. I wasn't asking about
>> read_cntpct_enforce_ordering(). Instead I was asking about
>> read_cntpct_stable() which looks like you just split get_cycles().
>>
>> This change looks completely unrelated to the purpose of this series. I
>> am not going to ask to split it, but I think this should be explained in
>> the commit message.
>>
> 
> Yes, I forgot to explain this changes in the commit message.
> 
> When I was trying to add read_cntpct_enforce_ordering into get_cycles,
> there were three ways I can do:
> 1. Add read_cntpct_enforce_ordering to the end of each branch
> 2. Add a new cycles_t variable and record value of each branch. Using
>      the function end as unique return point. And then we can add
>      read_cntpct_enforce_ordering to the end of get_cycles.
> 3. Don't touch the get_cycles function body, just rename it and create
>      another helper named get_cycles to include original function and
>      read_cntpct_enforce_ordering
> 
> Personally, I prefer the #3, so I changed the function like this.

I agree. Thanks for the explanation! In which case:

Reviewed-by: Julien Grall <jgrall@amazon.com>


> 
> How about adding the explanation in the end of commit message like this:
> "
> .... If this is done in Linux it will need to be also done in Xen.
> 
> To avoid adding read_cntpct_enforce_ordering everywhere, we introduced
> a new helper read_cntpct_stable to replace original get_cycles, and turn
> get_cycles to a wrapper which we can add read_cntpct_enforce_ordering
> easily.
> "

I have updated the commit message and committed the patch.

Thanks for your contribution.

Cheers,

-- 
Julien Grall

