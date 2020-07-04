Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86114214747
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 18:09:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrki1-0004c2-Qj; Sat, 04 Jul 2020 16:08:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRhY=AP=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jrki0-0004bx-UL
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 16:08:09 +0000
X-Inumbo-ID: 8cf3a452-be10-11ea-8b57-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8cf3a452-be10-11ea-8b57-12813bfff9fa;
 Sat, 04 Jul 2020 16:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8T9HRFe0NX5TmJ8txEXvtIB0ExxdDWChxtJUzjMFJak=; b=A0IybA58BeGAUCAiY3dqiV4xjk
 hV1YUeeq3eNsp7ELsl6At7/IIF9hGqGyCyBguyV4l8RCkTP0u9BBlbjaehQxaECP14CdNObomQoO3
 dORozY4Vbedlfrf4RefWcrrCF+QZWcY7yzTPDMReYnPp83QquTooMf3XbmQFYzhC3+1g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jrkhs-00084w-C5; Sat, 04 Jul 2020 16:08:00 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jrkhs-0007bb-2X; Sat, 04 Jul 2020 16:08:00 +0000
Subject: Re: [PATCH 1/2] xen/arm: entry: Place a speculation barrier following
 an ret instruction
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200616175913.7368-1-julien@xen.org>
 <20200616175913.7368-2-julien@xen.org>
 <alpine.DEB.2.21.2006161422240.24982@sstabellini-ThinkPad-T480s>
 <57696b4d-da83-a4d6-4d82-41a6f6c9174c@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <5c3a2407-3e76-3a30-7f93-036706e00f73@xen.org>
Date: Sat, 4 Jul 2020 17:07:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <57696b4d-da83-a4d6-4d82-41a6f6c9174c@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: paul@xen.org, Andre.Przywara@arm.com, Julien Grall <jgrall@amazon.com>,
 Bertrand.Marquis@arm.com, security@xenproject.org,
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17/06/2020 17:23, Julien Grall wrote:
> Hi,
> 
> On 16/06/2020 22:24, Stefano Stabellini wrote:
>> On Tue, 16 Jun 2020, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Some CPUs can speculate past a RET instruction and potentially perform
>>> speculative accesses to memory before processing the return.
>>>
>>> There is no known gadget available after the RET instruction today.
>>> However some of the registers (such as in check_pending_guest_serror())
>>> may contain a value provided the guest.
>>                                ^ by
>>
>>
>>> In order to harden the code, it would be better to add a speculation
>>> barrier after each RET instruction. The performance is meant to be
>>> negligeable as the speculation barrier is not meant to be archicturally
>>> executed.
>>>
>>> Note that on arm32, the ldmia instruction will act as a return from the
>>> function __context_switch(). While the whitepaper doesn't suggest it is
>>> possible to speculate after the instruction, add preventively a
>>> speculation barrier after it as well.
>>>
>>> This is part of the work to mitigate straight-line speculation.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> I did a compile-test on the patch too.
>>
>>
>>> ---
>>>
>>> I am still unsure whether we preventively should add a speculation 
>>> barrier
>>> preventively after all the RET instructions in arm*/lib/. The smc 
>>> call be
>>> taken care in a follow-up patch.
>>
>> SMC is great to have but it seems to be overkill to do the ones under
>> lib/.
>  From my understanding, the compiler will add a speculation barrier 
> preventively after each 'ret' when the mitigation are turned on.So it 
> feels to me we want to follow the same approach.
> 
> Obviously, we can avoid them but I would like to have a justification 
> for not adding them (nothing is overkilled against speculation ;)).

I finally found some time to look at arm*/lib in more details. Some of 
the helpers can definitely be called with guest inputs.

For instance, memchr() is called from hypfs_get_path_user() with the 3rd 
argument controlled by the guest. In both 32-bit and 64-bit 
implementation, you will reach the end of the function memchr() with 
r2/w2 and r3/w3 (it contains a character from the buffer) controlled by 
the guest.

As this is the only function in the unit, we don't know what will be the 
instructions right after RET. So it would be safer to add a speculation 
barrier there too.

Note that hypfs is currently only accessibly by Dom0. Yet, I still think 
we should try to harden any code if we can :).

Cheers,

-- 
Julien Grall

