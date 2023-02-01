Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1131686268
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 10:07:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488211.756177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN94U-0000DH-UY; Wed, 01 Feb 2023 09:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488211.756177; Wed, 01 Feb 2023 09:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN94U-0000Ac-RE; Wed, 01 Feb 2023 09:06:26 +0000
Received: by outflank-mailman (input) for mailman id 488211;
 Wed, 01 Feb 2023 09:06:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pN94T-0000AW-9o
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 09:06:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pN94S-0002X2-5U; Wed, 01 Feb 2023 09:06:24 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pN94R-0002Vu-Up; Wed, 01 Feb 2023 09:06:24 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=m2obYo8VF0262euVcLhlmIca1IIMvx+h7vlIhXldtK8=; b=AqDRYpBmUZJwC1FklR7lsjwugD
	QxSO0IafPCLph1OXHJeec3pOPE5ozfs+UHzn+LBVp1JmeGHIHtp7xq3FL3lHpYrgDCzMHDbWEpm4d
	INEABfMskBh9ZgAo3SQBSCZ8kX693A9yjzR+yn0qJ2zwkwD3TjPLeWGc7kJVzo7DWRBs=;
Message-ID: <1a1e9b46-e665-f33a-b122-31a5af5b22da@xen.org>
Date: Wed, 1 Feb 2023 09:06:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Andrew Cooper <amc96@srcf.net>, Alistair Francis <alistair23@gmail.com>
Cc: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Connor Davis
 <connojdavis@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>
References: <cover.1674819203.git.oleksii.kurochko@gmail.com>
 <06c2c36bd68b2534c757dc4087476e855253680a.1674819203.git.oleksii.kurochko@gmail.com>
 <f5cd1bfb116bfcc86fc2848df7eead05cd1a24c0.camel@gmail.com>
 <CAKmqyKMGiDiPRZBekdKan=+YduSmkB2DoWo5btrtVQ8nS3KMAg@mail.gmail.com>
 <2f6a3b17-4e41-fe9a-1713-4942b3bd3585@xen.org>
 <CAKmqyKNwH4-D3dKGQEsW_Zup4OT32C1RwaA7_Sey4fo_jOzFcA@mail.gmail.com>
 <9d5841b2-5d0b-390f-6e95-cf492e99e5a2@srcf.net>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v7 1/2] xen/riscv: introduce early_printk basic stuff
In-Reply-To: <9d5841b2-5d0b-390f-6e95-cf492e99e5a2@srcf.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 01/02/2023 00:21, Andrew Cooper wrote:
> On 31/01/2023 11:17 pm, Alistair Francis wrote:
>> On Tue, Jan 31, 2023 at 10:03 PM Julien Grall <julien@xen.org> wrote:
>>> On 31/01/2023 11:44, Alistair Francis wrote:
>>>> On Sat, Jan 28, 2023 at 12:15 AM Oleksii <oleksii.kurochko@gmail.com> wrote:
>>>>
>>>   From my understanding, on RISC-V, the use of PC-relative address is
>>> only guaranteed with medany. So if you were going to change the cmodel
>>> (Andrew suggested you would), then early_*() may end up to be broken.
>>>
>>> This check serve as a documentation of the assumption and also help the
>>> developer any change in the model and take the appropriate action to
>>> remediate it.
>>>
>>>> I think this is safe to remove.
>>> Based on what I wrote above, do you still think this is safe?
>> With that in mind it's probably worth leaving in then. Maybe the
>> comment should be updated to make it explicit why we want this check
>> (I find the current comment not very helpful).
> 
> The presence of this check pre-supposes that Xen will always relocate
> itself, and this simply not true.  XIP for example typically does not
> 
> Furthermore it's not checking the property wanted.  The way C is
> compiled has no bearing on what relocation head.S uses to call it.

I think we are still cross-talking each other because this is not my 
point. I am not sure how to explain differently...

This check is not about how head.S call early_*() but making sure the C 
function can be executed with the MMU off. In which case, you will 
likely have VA != PA.

In theory head.S could apply some relocations before hand, but it may be 
too complicated to do it before calling early_*().

> 
> It is a given that we compile the hypervisor with a consistent code
> model, meaning that the properly actually making the check do what is
> wanted is also the property that means it is not needed in the first place.

See above.

> 
> This check is literally not worth the bytes it's taking up on disk, and
> not worth the added compiler time, nor the wasted time of whoever comes
> to support something like XIP in the future finds it to be in the way.
> Xen as a whole will really genuinely function as intended in models
> other than medany, and it demonstrates a misunderstanding of the topic
> to put in such a check to begin with.

Then enlight me :). So far it looks more like you are not understanding 
my point: I am talking about C function call with MMU off (e.g. VA != 
PA) and you are talking about Xen as a whole.

I guess the only way to really know is to implement a different model. 
At which point there are three possible outcome:
   1) We had the compiler check, it fired and the developper will take 
action to fix it (if needed).
   2) We have no compiler check, the developper knew what to do it and 
fixed it.
   3) We have no compiler check, the developper where not aware of the 
problem and we will waste time.

Even if you disagree with the check, then I think 1 is still the best 
because it would explain our assumption. Yes it may waste a few minutes 
to the developer switching the model. But that probably nothing compare 
to the time you could waste if you don't notice it.

Anyway, Alistair has now all the information to take an informative 
decision.

Cheers,

-- 
Julien Grall

