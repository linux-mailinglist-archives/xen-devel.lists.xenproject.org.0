Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E7E98653E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 18:57:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804450.1215441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stVJl-0005ZN-90; Wed, 25 Sep 2024 16:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804450.1215441; Wed, 25 Sep 2024 16:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stVJl-0005VL-5y; Wed, 25 Sep 2024 16:56:45 +0000
Received: by outflank-mailman (input) for mailman id 804450;
 Wed, 25 Sep 2024 16:56:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1stVJj-0005VF-Q3
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 16:56:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1stVJi-0006Mo-PS; Wed, 25 Sep 2024 16:56:42 +0000
Received: from [15.248.2.30] (helo=[10.24.67.22])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1stVJi-0001rJ-Ix; Wed, 25 Sep 2024 16:56:42 +0000
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
	bh=0nAiQy9mtHnvGWbYvV5pOzzHXBWqvQVlC3AjuyBiQ+4=; b=LLoPAlbiDfjp9XKJQNwIBZvemg
	eFYuNAlaLCguryW9y3T/MaR1nk1gWl8zycDzNQtkPuDgunlIwDSaGA5zXj1o2dUa7rBjkZosxiMRw
	buinpDh3W5A4IM6MR9GyJCygP9S0f5c2kX2C0gzq6I7Q0JAOqlYe2K3HflhwVqXb/qaI=;
Message-ID: <aa0ea808-4767-4180-8522-c436eab7dc47@xen.org>
Date: Wed, 25 Sep 2024 17:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] xen/arm: ffa: Fine granular call support
Content-Language: en-GB
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
 <bb7e497fa2b03e0176b5013a05f342f3ea5ea296.1726676338.git.bertrand.marquis@arm.com>
 <0a537da2-4f2b-49a2-9e6b-6acc1a9aaabc@xen.org>
 <CAHUa44EC-0YNnWmD1-+sWDHqY=WsKVxV0N2N3a-Lc=AaTkMGUg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAHUa44EC-0YNnWmD1-+sWDHqY=WsKVxV0N2N3a-Lc=AaTkMGUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/09/2024 13:27, Jens Wiklander wrote:
> Hi,

Hi,

> On Sun, Sep 22, 2024 at 3:04 PM Julien Grall <julien@xen.org> wrote:
>>
>> Hi Bertrand,
>>
>> On 19/09/2024 14:19, Bertrand Marquis wrote:
>>> Create a bitmap to store which feature is supported or not by the
>>> firmware and use it to filter which calls done to the firmware.
>>>
>>> With this enabled. allow FF-A support to be activated for guest even if
>>
>> Typo: s/./,/ I think.
>>
>>> the firmware does not support it.
>>
>> Can you explain why you want to do this?
>>
>> The TEE mediator was designed to interpose with the HW. Without the HW
>> it doesn't entirely make sense to try to use it.
>>
>> It would also not work if the host system is using OP-TEE and expose to
>> some VM FF-A. So it feels that the mediator may not be the right place
>> to handle this case.
> 
> That's a good point, but all the FF-A handling should be in the same
> module since there's bound to be code and state to share. The problem
> is that FF-A tries to be a TEE mediator while it's about to become
> more than that. We can work around it by probing the OP-TEE mediator
> first, but it's adding another exception or special case. Would it
> make sense to move the FF-A mediator out of the TEE mediator framework
> and establish it separately?

I don't particularly want to have the FF-A mediator out of the TEE 
mediator. At the moment, it is unclear to me how much of the SMC 
handling code can really be shared between a domain talking with the 
host firmware and an emulated version. Are we just going to end up to 
have "if firmware then to this else do that"?

Cheers,

-- 
Julien Grall


