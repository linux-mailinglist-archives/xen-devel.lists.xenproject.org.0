Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157ED35159F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:28:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104551.200091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRyId-0004RL-At; Thu, 01 Apr 2021 14:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104551.200091; Thu, 01 Apr 2021 14:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRyId-0004Qw-7p; Thu, 01 Apr 2021 14:27:55 +0000
Received: by outflank-mailman (input) for mailman id 104551;
 Thu, 01 Apr 2021 14:27:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRyIb-0004Qq-HA
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:27:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6abfc8e0-307b-48a0-8f78-f7d7717b2082;
 Thu, 01 Apr 2021 14:27:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9CFFEB1BC;
 Thu,  1 Apr 2021 14:27:51 +0000 (UTC)
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
X-Inumbo-ID: 6abfc8e0-307b-48a0-8f78-f7d7717b2082
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617287271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uqjRHjMJw8JbA2dlMGmgldrt6ty/trqzJ0kd0jTS3x0=;
	b=T6OHUx5p4RbTA9CYGUOWblyujMjReWbQ0qY2dzRovS2e9vKkFK2OgTk2yLQNg8i9iKwK5N
	v4Pn3LeN8YcI6VX8SeV2py/tn7eJWdebUY9nQTBDVsc0PiVHIBGyXuiSt3bYVJZImsd3ax
	bUvpux0c5QaMfyh8VyHOoj7Xn9jp/1A=
Subject: Re: [PATCH 00/23] further population of xen/lib/
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
 <27916fa0-9ebd-a49a-bbb9-1ef47c2b5bf6@xen.org>
 <4f745d03-baa8-e9e6-692c-f9c9f401b766@suse.com>
 <6a38f0db-938b-fd13-48e6-6b538c85fe42@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d9a21b2c-8eca-027d-5672-e5d9dfaaf4b7@suse.com>
Date: Thu, 1 Apr 2021 16:27:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <6a38f0db-938b-fd13-48e6-6b538c85fe42@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.04.2021 16:04, Julien Grall wrote:
> Hi Jan,
> 
> On 01/04/2021 14:43, Jan Beulich wrote:
>> On 01.04.2021 13:54, Julien Grall wrote:
>>> On 01/04/2021 11:14, Jan Beulich wrote:
>>>> This is to dissolve / move xen/common/lib.c and xen/common/string.c.
>>>> One benefit of moving these functions into an archive is that we can
>>>> drop some of the related __HAVE_ARCH_* #define-s: By living in an
>>>> archive, the per-arch functions will preempt any loading of the
>>>> respective functions (objects) from the archive. (Down the road we
>>>> may want to move the per-arch functions into archives as well, at
>>>> which point the per-arch archive(s) would need to be specified ahead
>>>> of the common one(s) to the linker.)
>>>
>>> While I think it is a good idea to move code in xen/lib, I am not
>>> convinced that having a single function per file is that beneficial.
>>>
>>> Do you have numbers showing how much Xen will shrink after this series?
>>
>> In the default build, from all I was able to tell, there's one function
>> that's unused (strspn(), as mentioned in the respective patch description).
>> I don't think I've been claiming any space savings here, though, so I
> 
> You didn't. I was trying to guess why you wrote this series given that 
> your cover letter doesn't provide a lot of benefits (other than dropping 
> __HAVE_ARCH_*).
> 
>> wonder why you make this a criteria at all.
> 
> Because this is the main reason I would be willing to ack this series. 
> This outweight the increase number of files with just a single function 
> implemented.
> 
>> The functions being one per
>> CU is such that they can be individually overridden by an arch, without
>> pulling in dead code.
> 
> I would agree with functions like memcpy/memset() because you can gain a 
> lot to outweight the implementation in assembly. I am not convinced this 
> would be true for functions such as strlen().

strlen() is actually a pretty good candidate for overriding, and
we may even want to on x86 with newer hardware's "Fast Short REP
CMPSB/SCASB".

> So overall, the number of functions requiring overriding will likely be 
> pretty limited and #ifdef would be IMHO tolerable.
> 
> Although, I would be OK with creating a file per function that are 
> already overrided. For all the others, I think this is just pointless.

Well, I don't see a reason to special case individual functions.
Plus any reasonable static library should imo have one (global)
function per object file in the normal case; there may be very
few exceptions. Drawing an ad hoc boundary at what currently has
an override somewhere doesn't look very attractive to me. Plus
to be honest while I would find it unfair to ask to further
split things if I did just a partial conversion (i.e. invest yet
more time), I find it rather odd to be asked to undo some of the
splitting when I've already taken the extra time to make things
consistent.

Jan

