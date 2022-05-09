Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E4951F9E8
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 12:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324367.546373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no0fz-0004c5-Uw; Mon, 09 May 2022 10:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324367.546373; Mon, 09 May 2022 10:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no0fz-0004Yb-RU; Mon, 09 May 2022 10:31:39 +0000
Received: by outflank-mailman (input) for mailman id 324367;
 Mon, 09 May 2022 10:31:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1no0fx-0004YV-KV
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 10:31:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1no0fx-0002mJ-B0; Mon, 09 May 2022 10:31:37 +0000
Received: from [54.239.6.187] (helo=[192.168.22.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1no0fx-0003an-4m; Mon, 09 May 2022 10:31:37 +0000
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
	bh=YzYQEWXqF4mmeF9MkGzosy6IevOTDVLvxL6FoXKhWuw=; b=4mwEM3urYX9s9cdEhe3Nhgb15Z
	mmfrq/6KfEEhq1ywzqdGI/Mck5X8979Xf4rJM3rifDHzIA429Gi3ffBxy27o4ILUnkoELZpYLGxfy
	Fde6cIlVgIah1XkMZz2v2tCeTlyXX8DCfZdHjjR1SUwylNM0RamicSFBHfim+0N3VZQs=;
Message-ID: <0ac6d6c0-4f34-ad1e-c473-2278dd7289c9@xen.org>
Date: Mon, 9 May 2022 11:31:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 3/3] xen/arm: Add sb instruction support
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <24fd2364294345f103cb13bdab2ad0b706681071.1651570561.git.bertrand.marquis@arm.com>
 <6571ead7-ff94-acb5-1e55-53ae69944bf0@xen.org>
 <E67D129C-DCA4-479E-B8B8-4C7DF8CC92B9@arm.com>
 <d8889ee4-7790-ab93-a5d1-708aa541dd1b@xen.org>
 <15DEAB6E-3130-49E8-87BD-AC82C08C7698@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <15DEAB6E-3130-49E8-87BD-AC82C08C7698@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 09/05/2022 11:08, Bertrand Marquis wrote:
> Hi Julien,

Hi,

>> On 4 May 2022, at 09:06, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 04/05/2022 08:24, Bertrand Marquis wrote:
>>> Hi Julien,
>>
>> Hi Bertrand,
>>
>>>> On 3 May 2022, at 19:47, Julien Grall <julien@xen.org> wrote:
>>>>> A new cpuerrata capability is introduced to enable the alternative
>>>>
>>>> 'sb' is definitely not an erratum. Errata are for stuff that are meant to be specific to one (or multiple) CPU and they are not part of the architecture.
>>>>
>>>> This is the first time we introduce a feature in Xen. So we need to add a new array in cpufeature.c that will cover 'SB' for now. In future we could add feature like pointer auth, LSE atomics...
>>> I am not quite sure why you would want to do that.
>>> Using the sb instruction is definitely something to do to solve erratas, if a CPU is not impacted by those erratas, why would you want to use this ?
>>
>> I agree that SB is used to solve errata but the instruction itself is not a workaround (it may be part of it though). Instead, this is a more efficient way to prevent speculation and will replace dsb/isb.
>>
>> Speculation is never going to disappear from processor. So, in the future, there might be valid reason for us to say "We don't want the processor to speculate". This would mean using SB.
> 
> If the need arise then we will check depending on that how we can support it but in the current status as there is no use case I don’t think we need that.

It is not clear how I should read this answer... If you add SB in 
cpuerrata.c, then a user will start to see message like:

"enabled workaround for Speculation Barrier".

Which is completely bogus. Replacing "dsb; isb" with "sb" is mostly an 
optimization and none of the current use will end up to be 
architecturaly executed.

I appreciate this is more work to add cpufeature.c. However, AFAIK, 
there are no rush to get this optimization in (see why above) and muddy 
(even temporarily) the logs.

Cheers,

-- 
Julien Grall

