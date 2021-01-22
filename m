Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B4F2FFDE2
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 09:07:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72558.130681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2rSz-0002wq-3P; Fri, 22 Jan 2021 08:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72558.130681; Fri, 22 Jan 2021 08:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2rSy-0002wR-W3; Fri, 22 Jan 2021 08:06:48 +0000
Received: by outflank-mailman (input) for mailman id 72558;
 Fri, 22 Jan 2021 08:06:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=530u=GZ=codiax.se=anders.tornqvist@srs-us1.protection.inumbo.net>)
 id 1l2rSw-0002w6-Mp
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 08:06:47 +0000
Received: from mailrelay2-3.pub.mailoutpod1-cph3.one.com (unknown
 [46.30.212.11]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a192bce-4596-4839-bd28-da8993153324;
 Fri, 22 Jan 2021 08:06:43 +0000 (UTC)
Received: from [192.168.101.129] (h77-53-239-0.cust.a3fiber.se [77.53.239.0])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id c26b52a5-5c88-11eb-b55b-d0431ea8a290;
 Fri, 22 Jan 2021 08:06:41 +0000 (UTC)
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
X-Inumbo-ID: 2a192bce-4596-4839-bd28-da8993153324
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codiax.se; s=20191106;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:to:subject:from;
	bh=uTBjrx750KvJTMMDl44O1/Hxb0ip0QWGwPCYzRuAQeQ=;
	b=D0xSGH8Ms5RE1iUZaploVije4m8aWb5A8PeSs40hXRfPY4SnCfyxbY0pQnxwVNTngBy9aYJWwC0xQ
	 /Xr7qs7I3aOSQd8GlBb1mP3clBmIgMmm1Q1KzPPpJ1UTOVYt+QxN/ShHobuo0g/uSvVZ3oENwW8Rnu
	 x0Z48zrnrWuO8WHh8ZBa1iCT7i8gtgqkCr8YtI7SP+I4OfpTL62d7zJ8WQ2m5qwhSPG7QBZ8Y3xnI2
	 31X1t7XwUhDp8VMcNG2QV+W7A76UsNjBD7Jq9uLNwynaGcHYfBbsLtF3j4JhPISTGSBOr9Mmg9z0yC
	 3CHajgOn9+ZBpv5P14zVcIJWkEMkl3Q==
X-HalOne-Cookie: ab916a2e33bddc278d43401ec6cb906d09f59a93
X-HalOne-ID: c26b52a5-5c88-11eb-b55b-d0431ea8a290
Subject: Re: Null scheduler and vwfi native problem
To: Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
From: =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>
Message-ID: <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
Date: Fri, 22 Jan 2021 09:06:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

Thanks for the responses.

On 1/22/21 12:35 AM, Dario Faggioli wrote:
> On Thu, 2021-01-21 at 19:40 +0000, Julien Grall wrote:
>> Hi Dario,
>>
> Hi!
>
>> On 21/01/2021 18:32, Dario Faggioli wrote:
>>> On Thu, 2021-01-21 at 11:54 +0100, Anders Törnqvist wrote:
>>>>    
>>>> https://lists.xenproject.org/archives/html/xen-devel/2018-09/msg01213.html
>>>> .
>>>>
>>> Right. Back then, PCI passthrough was involved, if I remember
>>> correctly. Is it the case for you as well?
>> PCI passthrough is not yet supported on Arm :). However, the bug was
>> reported with platform device passthrough.
>>
> Yeah, well... That! Which indeed is not PCI. Sorry for the terminology
> mismatch. :-)
>
>>> Well, I'll think about it. >
>>>> Starting the system without "sched=null vwfi=native" does not
>>>> result
>>>> in
>>>> the problem.
>>>>
>>> Ok, how about, if you're up for some more testing:
>>>
>>>    - booting with "sched=null" but not with "vwfi=native"
>>>    - booting with "sched=null vwfi=native" but not doing the IRQ
>>>      passthrough that you mentioned above
>>>
>>> ?
>> I think we can skip the testing as the bug was fully diagnostics back
>> then. Unfortunately, I don't think a patch was ever posted.
>>
> True. But an hackish debug patch was provided and, back then, it
> worked.
>
> OTOH, Anders seems to be reporting that such a patch did not work here.
> I also continue to think that we're facing the same or a very similar
> problem... But I'm curious why applying the patch did not help this
> time. And that's why I asked for more testing.
I made the tests as suggested to shed some more light if needed.

- booting with "sched=null" but not with "vwfi=native"
Without "vwfi=native" it works fine to destroy and to re-create the domain.
Both printouts comes after a destroy:
(XEN) End of domain_destroy function
(XEN) End of complete_domain_destroy function


- booting with "sched=null vwfi=native" but not doing the IRQ 
passthrough that you mentioned above
"xl destroy" gives
(XEN) End of domain_destroy function

Then a "xl create" says nothing but the domain has not started correct. 
"xl list" look like this for the domain:
mydomu                                   2   512     1 ------       0.0

>
> Anyway, it's true that we left the issue pending, so something like
> this:
>
>>   From Xen PoV, any pCPU executing guest context can be considered
>> quiescent. So one way to solve the problem would be to mark the pCPU
>> when entering to the guest.
>>
> Should be done anyway.
>
> We'll then see if it actually solves this problem too, or if this is
> really something else.
>
> Thanks for the summary, BTW. :-)
>
> I'll try to work on a patch.
Thanks, just let me know if I can do some testing to assist.
>
> Regards
>
>> [1]
>>      
>> https://lore.kernel.org/xen-devel/acbeae1c-fda1-a079-322a-786d7528ecfc@arm.com/


