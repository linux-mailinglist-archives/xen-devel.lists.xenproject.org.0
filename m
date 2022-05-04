Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 900E9519939
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 10:06:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320424.541138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmA1e-0000Xn-GT; Wed, 04 May 2022 08:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320424.541138; Wed, 04 May 2022 08:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmA1e-0000W4-D2; Wed, 04 May 2022 08:06:22 +0000
Received: by outflank-mailman (input) for mailman id 320424;
 Wed, 04 May 2022 08:06:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nmA1c-0000Vx-SM
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 08:06:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmA1c-0008Bf-IZ; Wed, 04 May 2022 08:06:20 +0000
Received: from [54.239.6.185] (helo=[192.168.21.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmA1c-0000pX-Cc; Wed, 04 May 2022 08:06:20 +0000
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
	bh=fFRfu8WinN2af30yWVR7eQyalk7y8rMLkiOOZFNQqFw=; b=Mvuqq12UMZAEiZAQqgk5PjMOGK
	Wkx92OntMK5kOg9bwOGB+0h1GP6qlE52kGmrMA+Vsmtu4/WLMT7ukMMcfdC6eQHFUHXYNtx6dcmy9
	fS/LfHEV9eI9BKefLHhX2lDR8ZrDfPgp9mWrM4lf7+FgkSHkfol0JC9r2EsovItSwqwE=;
Message-ID: <d8889ee4-7790-ab93-a5d1-708aa541dd1b@xen.org>
Date: Wed, 4 May 2022 09:06:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH 3/3] xen/arm: Add sb instruction support
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <24fd2364294345f103cb13bdab2ad0b706681071.1651570561.git.bertrand.marquis@arm.com>
 <6571ead7-ff94-acb5-1e55-53ae69944bf0@xen.org>
 <E67D129C-DCA4-479E-B8B8-4C7DF8CC92B9@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <E67D129C-DCA4-479E-B8B8-4C7DF8CC92B9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/05/2022 08:24, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

> 
>> On 3 May 2022, at 19:47, Julien Grall <julien@xen.org> wrote:
>>> A new cpuerrata capability is introduced to enable the alternative
>>
>> 'sb' is definitely not an erratum. Errata are for stuff that are meant to be specific to one (or multiple) CPU and they are not part of the architecture.
>>
>> This is the first time we introduce a feature in Xen. So we need to add a new array in cpufeature.c that will cover 'SB' for now. In future we could add feature like pointer auth, LSE atomics...
> 
> I am not quite sure why you would want to do that.
> 
> Using the sb instruction is definitely something to do to solve erratas, if a CPU is not impacted by those erratas, why would you want to use this ?

I agree that SB is used to solve errata but the instruction itself is 
not a workaround (it may be part of it though). Instead, this is a more 
efficient way to prevent speculation and will replace dsb/isb.

Speculation is never going to disappear from processor. So, in the 
future, there might be valid reason for us to say "We don't want the 
processor to speculate". This would mean using SB.

>>> +    .inst 0xd50330ff
>>> +    nop
>>
>> Why do we need the NOP?
> 
> Alternative requires both sides to have the same size hence the nop to have 2 instructions as in the if.

A few years ago we backported a patch from Linux to automatically add 
nop. However, looking at the code, this would not handle this

Cheers,

-- 
Julien Grall

