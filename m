Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED643468FA
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 20:26:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100791.192248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOmfc-0002lJ-Ed; Tue, 23 Mar 2021 19:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100791.192248; Tue, 23 Mar 2021 19:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOmfc-0002ku-Ba; Tue, 23 Mar 2021 19:26:28 +0000
Received: by outflank-mailman (input) for mailman id 100791;
 Tue, 23 Mar 2021 19:26:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lOmfa-0002kp-3F
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 19:26:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lOmfZ-0005GF-UY; Tue, 23 Mar 2021 19:26:25 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lOmfZ-0002YM-MI; Tue, 23 Mar 2021 19:26:25 +0000
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
	bh=YQaMh62nSe7DvVoi+4Bau/eO1tss8Tm22vjQaGMyU1E=; b=16Ok74XA9VMF3tuCW//har6l2P
	8cof9opVZuhpIEIRdLjn2C4ZLQbmuiHMlL98A4y3P18ulwcEFvwpPN1cQVbEn6vli/TwmkYtPz3a9
	PKmV1OTuT65kfRK59FZVMqPCgvgj2I1zllD6r6c2UdvSR5mvOtB6NzXFSQh7GcPFrutQ=;
Subject: Re: xen/evtchn: Dom0 boot hangs using preempt_rt kernel 5.10
To: Luca Fancellu <luca.fancellu@arm.com>, Jason Andryuk <jandryuk@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <VI1PR08MB3629824170C1707255465D8BE46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <VI1PR08MB36292202FAA817F9FFDCAD81E46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <cb4badc8-a932-2d4e-956e-4d474a137b0b@suse.com>
 <EC3489FE-8151-4EE7-B177-22CC2F92131C@arm.com>
 <1FAD6C91-2B3A-48F0-88D7-CFCFC8B53BA9@arm.com>
 <c2e9268d-daec-95d8-cbb9-a2d2ecf233ec@suse.com>
 <2BC82A95-DFB9-4F90-8CC6-AE39405157ED@arm.com>
 <CAKf6xptBm8G-T8UCfht22nfeS_4XOj2sN9fBvJhOVA1QKbfnhA@mail.gmail.com>
 <565C6475-4693-4A7C-8316-9613146300C2@arm.com>
 <2A09774F-ADDF-41B0-8E72-DC0FA0A6B1F3@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d5551ce9-6934-6228-e9da-e1ecc87ec015@xen.org>
Date: Tue, 23 Mar 2021 19:26:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2A09774F-ADDF-41B0-8E72-DC0FA0A6B1F3@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 23/03/2021 17:06, Luca Fancellu wrote:
> Hi all,

Hi,

Please avoid top posting when answering to a comment. This makes more 
difficult to follow.

> I have an update, changing the lock introduced by the serie from spinlock_t to raw_spinlock_t, changing the lock/unlock function to use the raw_* version and keeping the BUG_ON(…) (now we can because raw_* implementation disable interrupts on preempt_rt) the kernel is booting correctly.
> So seems that the BUG_ON(…) is needed and the unmask function should run with interrupt disabled, anyone knows why this change worked?

Do you mean why no-one spotted the issue before? If so, AFAIK, on 
vanilla Linux, spin_lock is still just a wrapper to raw_spinlock. IOW 
there is no option to replace it with a RT spinlock.

So if you don't apply the RT patches, you would not be able to trigger 
the issue.

As to the fix itself, I think using raw_spinlock_t is the correct thing 
to do because the lock is also used in interrupt context (even with RT 
enabled).

Would you be able to send a patch?

> 
>> On 23 Mar 2021, at 15:39, Luca Fancellu <luca.fancellu@arm.com> wrote:
>>
>> Hi Jason,
>>
>> Thanks for your hints, unfortunately seems not an init problem because in the same init configuration I tried the 5.10.23 (preempt_rt) without the Juergen patch but with the BUG_ON removed and it boots without problem. So seems that applying the serie does something (on a preempt_rt kernel) and we are trying to figure out what.
>>
>>
>>> On 23 Mar 2021, at 12:36, Jason Andryuk <jandryuk@gmail.com> wrote:
>>>
>>> On Mon, Mar 22, 2021 at 3:09 PM Luca Fancellu <luca.fancellu@arm.com> wrote:
>>>>
>>>> Hi Juergen,
>>>>
>>>> Yes you are right it was my mistake, as you said to remove the BUG_ON(…) this serie (https://patchwork.kernel.org/project/xen-devel/cover/20210306161833.4552-1-jgross@suse.com/) is needed, since I’m using yocto I’m able to build a preempt_rt kernel up to the 5.10.23 and for this reason I’m applying that serie on top of this version, then I’m removing the BUG_ON(…).
>>>>
>>>> A thing that was not expected is that now the Dom0 kernel is stuck on “Setting domain 0 name, domid and JSON config…” step and the system seems unresponsive. Seems like a deadlock issue but looking into the serie we can’t spot anything and that serie was also tested by others from the community.

The deadlock is expected. When you enable RT spinlock, the interrupts 
will not disabled even when you call spin_lock_irqsave().

As the lock is also used in interrupt context (e.g. with interrupt 
masked), this will lead to a deadlock because the lock can be held with 
interrupt unmasked.

This is quite a common error as developpers are not yet used to test RT. 
I remember finding a few other instances like that when I worked on RT a 
couple of years ago.

For future reference, I think CONFIG_PROVE_LOCKING=y could help you to 
detect (potential) deadlock.

Cheers,

-- 
Julien Grall

