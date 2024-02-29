Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 345E186C936
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 13:28:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687007.1069689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffVn-0004QH-KN; Thu, 29 Feb 2024 12:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687007.1069689; Thu, 29 Feb 2024 12:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffVn-0004OJ-Hn; Thu, 29 Feb 2024 12:27:43 +0000
Received: by outflank-mailman (input) for mailman id 687007;
 Thu, 29 Feb 2024 12:27:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rffVm-0004OD-0z
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 12:27:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rffVk-0003cl-4f; Thu, 29 Feb 2024 12:27:40 +0000
Received: from [15.248.3.86] (helo=[10.45.19.50])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rffVj-00011q-S4; Thu, 29 Feb 2024 12:27:39 +0000
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
	bh=kFYCJO0UODbwDXJhr/9AMLUzqRfQrzD7DIO3d2rmI6Q=; b=CO6fVbwGIPI/kJy6wzgrurSqoy
	M9WlLvSahHQ71pv7tUXPuSEKihNPC5k3Vpj2eI6nXX0QrGgW3kNlWt7wHoUyLV9ejNAMiyNZOn3Vi
	t6GZQUZ5RmAYHA0u2K+YPdKXVH8oAXyrLuLhsw2PsuzJNv+1T7kGd/4Gyohjoe1ykeVw=;
Message-ID: <e817be8b-bef7-4702-87d3-3950cf176cf6@xen.org>
Date: Thu, 29 Feb 2024 12:27:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/23] xen/README: add compiler and binutils versions
 for RISC-V64
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <ebaa05ded3cfddb1e3f7c87cd806b866312878fb.1708962629.git.oleksii.kurochko@gmail.com>
 <73a38d85-0798-4cfa-8625-0f8c9e05b2a3@suse.com>
 <80fb8091-9a26-40a4-b2e7-371df9411861@xen.org>
 <889b132b-b92e-465b-94af-4e4133e4c297@suse.com>
 <52188e88-374c-449f-a71c-bfce9b6d07f4@xen.org>
 <cd52114b-c4f1-4bb9-96a4-d802dc50bade@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cd52114b-c4f1-4bb9-96a4-d802dc50bade@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 29/02/2024 12:05, Andrew Cooper wrote:
> On 29/02/2024 10:23 am, Julien Grall wrote:
>>>>> IOW it is hard for me to see why RISC-V needs stronger restrictions
>>>>> here
>>>>> than other architectures. It ought to be possible to determine a
>>>>> baseline
>>>>> version. Even if taking the desire to have "pause" available as a
>>>>> requirement, gas (and presumably gld) 2.36.1 would already suffice.
>>>>
>>>> I think we want to bump it on Arm. There are zero reasons to try to
>>>> keep
>>>> a lower versions if nobody tests/use it in production.
>>>>
>>>> I would suggest to do the same on x86. What's the point of try to
>>>> support Xen with a 15+ years old compiler?
>>>
>>> It could have long been bumped if only a proper scheme to follow for
>>> this and future bumping would have been put forward by anyone keen on
>>> such bumping, like - see his reply - e.g. Andrew. You may recall that
>>> this was discussed more than once on meetings, with no real outcome.
>>> I'm personally not meaning to stand in the way of such bumping as long
>>> as it's done in a predictable manner, but I'm not keen on doing so and
>>> hence I don't view it as my obligation to try to invent a reasonable
>>> scheme. (My personal view is that basic functionality should be
>>> possible to have virtually everywhere, whereas for advanced stuff it
>>> is fine to require a more modern tool chain.)
>>
>> That's one way to see it. The problem with this statement is a user
>> today is mislead to think you can build Xen with any GCC versions
>> since 4.1. I don't believe we can guarantee that and we are exposing
>> our users to unnecessary risk.
>>
>> In addition to that, I agree with Andrew. This is preventing us to
>> improve our code base and we have to carry hacks for older compilers.
> 
> I don't think anyone here is suggesting that we switch to a
> bleeding-edge-only policy.  But 15y of support is extreme in the
> opposite direction.
> 
> Xen ought to be buildable in the contemporary distros of the day, and I
> don't think anyone is going to credibly argue otherwise.
> 
> But, it's also fine for new things to have newer requirements.
> 
> Take CET for example.  I know we have disagreements on exactly how it's
> toolchain-conditionalness is implemented, but the basic principle of "If
> you want shiny new optional feature $X, you need newer toolchain $Y" is
> entirely fine.
> 
> A brand new architecture is exactly the same.  Saying "this is the
> minimum, because it's what we test" doesn't preclude someone coming
> along and saying "can we use $N-1 ?  See here it works, and here's a
> change to CI test it".
> 
> 
> Anyway, its clear we need to write some policy on this, before making
> specific adjustments.  To get started, is there going to be any
> objection whatsoever on some principles which begin as follows:

No objections.

> 
> * For established architectures, we expect Xen to be buildable on the
> common contemporary distros.  (i.e. minima is not newer than what's
> available in contemporary distros, without a good reason)

I think we would need to list the distros we are taking into account. 
Reading the rest of the principles, I am assuming you would be ok if new 
distros are added if there is a use case.

Cheers,

-- 
Julien Grall

