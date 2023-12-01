Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF4580137A
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 20:14:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645669.1007909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r98y5-0006Sr-Pc; Fri, 01 Dec 2023 19:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645669.1007909; Fri, 01 Dec 2023 19:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r98y5-0006Qf-M7; Fri, 01 Dec 2023 19:14:29 +0000
Received: by outflank-mailman (input) for mailman id 645669;
 Fri, 01 Dec 2023 19:14:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r98y4-0006QZ-VM
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 19:14:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r98y0-0006fg-SQ; Fri, 01 Dec 2023 19:14:24 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r98y0-0001nI-MB; Fri, 01 Dec 2023 19:14:24 +0000
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
	bh=TSqBDuGzvvBLIRlLQ20G3Oiz63ONTDCryzDb7TxI/u8=; b=0tQxXEAkt7VxK1x1T7awo2Ydlk
	Unfw9kqgSQIw3fBMwLyQMjmE/reEX/9yICIFgdAngbEfcrn8++EI2bBpebSn1WhjtqfnomFn/R9qB
	0r4WSdGJWtQLSC0TvNaPoiewPX7NVWTHiUoC+b8BFI9/ERNwGMeOvPVu+Ap9By8RMIwI=;
Message-ID: <da7a86ba-7f74-41bb-9540-76f4530ac7ac@xen.org>
Date: Fri, 1 Dec 2023 19:14:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Config.mk: drop -Wdeclaration-after-statement
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20231128174729.3880113-1-alex@linutronix.de>
 <fcb1cc57-b985-4711-a234-4aaa380b9abe@suse.com>
 <81043e30-c9fd-4c5e-ad63-0e42edea733d@linutronix.de>
 <5a469665-54b2-4904-9604-ad686fbbb05e@xen.org>
 <716b0ec4-adce-494d-b9b6-69dbb7e26000@perard>
 <890f54b5-9692-40b8-94fa-9a55268e29f5@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <890f54b5-9692-40b8-94fa-9a55268e29f5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 30/11/2023 08:36, Jan Beulich wrote:
> On 29.11.2023 14:10, Anthony PERARD wrote:
>> On Wed, Nov 29, 2023 at 11:47:24AM +0100, Julien Grall wrote:
>>> + Anthony for the tools
>>> + Juergen for Xenstored
>>>
>>> On 29/11/2023 11:34, Alexander Kanavin wrote:
>>>> On 11/29/23 08:51, Jan Beulich wrote:
>>>>
>>>>> On 28.11.2023 18:47, Alexander Kanavin wrote:
>>>>>> Such constructs are fully allowed by C99:
>>>>>> https://gcc.gnu.org/onlinedocs/gcc-12.2.0/gcc/Mixed-Labels-and-Declarations.html#Mixed-Labels-and-Declarations
>>>>> There's more to this: It may also be a policy of ours (or of any
>>>>> sub-component)
>>>>> to demand that declarations and statements are properly separated.
>>>>> This would
>>>>> therefore need discussing first.
>>>>
>>>> The error is coming from python 3.12 headers and not from anything in
>>>> xen tree, no? As you don't have control over those headers, I'm not sure
>>>> what other solution there could be.
>>>
>>> We seem to add -Wno-declaration-after-statement for some components in
>>> tools/. So one possibility would be to move the flags to an hypervisor
>>> specific makefile (in xen/).
>>
>> You mean xen/Makefile I hope.
>>
>>> Anthony/Juergen, do you have any concern if the tools are built without
>>> -Wdeclaration-after-statement?
>>
>> I don't, and as you said, there's already quite a few
>> -Wno-declaration-after-statement.
>>
>> It can be nice to add a new variable in the middle of a function, it's
>> like creating a new scope without adding extra indentation (if we wanted
>> a new scope, we would need {} thus the intend).
> 
> To be clear, I wouldn't mind this in the hypervisor either. But then I also
> don't see why we should further request people to separate declarations
> from statements in an easily noticeable way. Thing is that imo something
> like this wants spelling out in ./CODING_STYLE.

So I agree that if we were to remove -Wdeclaration-after-statement then 
we should also update the CODING_STYLE. However, I am not entirely sure 
I would want to mix code and declaration in the hypervisor.

Anyway, I think this is a separate discussion from resolving the 
immediate problem (i.e. building the python bindings).

So for now, I think it would make sense to push the 
-Wdeclaration-after-statement to the tools.

@Alexander, are you going to send a new version? If not, I would be 
happy to do it.

Cheers,

-- 
Julien Grall

