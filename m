Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (unknown [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122C3533BC8
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 13:31:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337188.561719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntpE6-0005Cd-OK; Wed, 25 May 2022 11:30:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337188.561719; Wed, 25 May 2022 11:30:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntpE6-0005Aq-LQ; Wed, 25 May 2022 11:30:54 +0000
Received: by outflank-mailman (input) for mailman id 337188;
 Wed, 25 May 2022 11:30:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ntpE5-0005Ak-Pp
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 11:30:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntpE2-0007Ni-Uf; Wed, 25 May 2022 11:30:50 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.21.168]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntpE2-00007h-OD; Wed, 25 May 2022 11:30:50 +0000
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
	bh=nmx40bZKQoNr8efyxTXmHeM1D6kreB5aaKQ7qYw+4IE=; b=NZpPMbXVM1aTZgLJITJVI8HFLb
	i7uwdwcVImBGYauKzyuODu5ywQCMLlUuv8d+flKm6GINnTIPQXK+hBhoACDp4eEHjYTS7ZLCWZsTz
	jTkdIR8ZONI1a8bOHzTIXi+FnhhtqXFfmKdJ42lJPBGqnI1lvUa+zh4cD+JcULj2036M=;
Message-ID: <cc7ac158-e558-e8e1-367a-cd15eeecd9b2@xen.org>
Date: Wed, 25 May 2022 12:30:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v2] SUPPORT.md: extend security support for x86 hosts to
 12 TiB of memory
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5835df1e-8f92-79ce-94c5-1b5df9c9ff65@suse.com>
 <6f333841-17e3-c9ac-580a-fc89f1741596@xen.org>
 <5ad659cd-826a-4393-777b-f4103d02af77@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5ad659cd-826a-4393-777b-f4103d02af77@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 25/05/2022 12:11, Jan Beulich wrote:
> On 25.05.2022 12:58, Julien Grall wrote:
>> On 25/05/2022 10:21, Jan Beulich wrote:
>>> --- a/SUPPORT.md
>>> +++ b/SUPPORT.md
>>> @@ -50,7 +50,7 @@ For the Cortex A57 r0p0 - r1p1, see Erra
>>>    
>>>    ### Physical Memory
>>>    
>>> -    Status, x86: Supported up to 8 TiB. Hosts with more memory are supported, but not security supported.
>>> +    Status, x86: Supported up to 12 TiB. Hosts with more memory are supported, but not security supported.
>>>        Status, Arm32: Supported up to 12 GiB
>>>        Status, Arm64: Supported up to 2 TiB
>>>    
>>> @@ -121,6 +121,17 @@ ARM only has one guest type at the momen
>>>    
>>>        Status: Supported
>>>    
>>> +## Guest Limits
>>> +
>>> +### Memory
>>> +
>>> +    Status, x86: Supported up to 8 TiB
>>> +    Status, Arm64: Supported up to 1 TiB
>>> +    Status, Arm32: Supported up to 32 GiB
>>
>> IIRC, the max the architecture would allow us is 16 Gib. Here we are
>> limited with how much physical memory is supported by Xen. So this wants
>> to be 12 GiB.
> 
> Hmm, while I don't know where I took the 32 from, it was you who
> suggested (in reply to v1) I put 16 here.

Hmmm... I am pretty sure I wrote 16 in v1 [1].

> Though yes, with the
> host limit now set to just 12, putting more here would be odd.
> I didn't cross check the numbers, I'll admit.
> 
>>> +
>>> +Guests with more memory, but less than 16 TiB, are supported,
>>> +but not security supported.
>>
>> On Arm32, we definitely can't support up to 16 TiB. On Arm64, we would
>> need some work to support it. So I would move this sentence in the
>> "Status, x86" section.
> 
> Sure, I can do that. Would have been nice if you had said so right
> on v1. 
I only spotted this oddity now. Sorry.

> As to Arm64 though - the host limit is 2 TiB. Going beyond
> that being impossible (without becoming at least unsupported), is
> the uniform upper bound of 16 TiB really a problem here (IOW do
> guests really only function up to 1 TiB)? 

The guest memory layout has only been defined for up to 1TB. Hopefully 
this is the only place where the assumption is baked. But as I don't 
have such machine in hand, I can't easily confirm it.

So I think we need to clarify that the 16TB limit only applies to x86.

> For Arm32 it would be
> even less of an issue, as hosts with more than 12 GiB are
> unsupported. 

This is only obvious if you know that Xen doesn't support memory 
overcommitting. Admittely, this could be considered as basic Xen knowledge.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/6ec0e3d9-374c-1caa-9889-f091dcf894e3@xen.org/

-- 
Julien Grall

