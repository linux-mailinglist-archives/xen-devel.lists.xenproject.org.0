Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 875E923283C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 01:39:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0vfJ-0001zb-NF; Wed, 29 Jul 2020 23:39:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1ssD=BI=runbox.com=m.v.b@srs-us1.protection.inumbo.net>)
 id 1k0vfH-0001zU-9n
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 23:39:15 +0000
X-Inumbo-ID: b2189dda-d1f4-11ea-8cfa-bc764e2007e4
Received: from aibo.runbox.com (unknown [91.220.196.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2189dda-d1f4-11ea-8cfa-bc764e2007e4;
 Wed, 29 Jul 2020 23:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com; 
 s=selector2;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=ryw1KN8G6h/++LeW6jPFPZaW48ovXavii2BR1FFNXKI=; b=FPowg7Di5qDZCGTgKJv0O15P14
 MEiCJNiet/vWmBU9fEZyTS3psaPzs43NLu9lME8G6p2+XvrkFuXUgaEcvuJ0fgipQFu0r+yqxN/7b
 p43sESKGo2tcg2Pbuds0IoF7k+Y4lyN2EME7Cz49wW1yBi4azCzRVjuh4+yBX95UAeIE9eeH/a3Cw
 cKtwtA2sYU/nVQsqPvvJNN+4zuJtIpM/h4IvWv+//uOqpJ33oPeZloP2rMRVu5dV/X/QrPA6lTBJM
 0o2ZgMiTACk5mcMEzG65a3dPzZB0Fhb8O8KbAFOxG9n/eGEyWS0NdmLKHXsOUqSxTfHq6tk6x3tNq
 ajSdHVfQ==;
Received: from [10.9.9.73] (helo=submission02.runbox)
 by mailtransmit02.runbox with esmtp (Exim 4.86_2)
 (envelope-from <m.v.b@runbox.com>)
 id 1k0vf4-0007Wm-PR; Thu, 30 Jul 2020 01:39:02 +0200
Received: by submission02.runbox with esmtpsa [Authenticated alias (536975)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1k0vew-0006HT-In; Thu, 30 Jul 2020 01:38:54 +0200
Subject: Re: [PATCH] x86/S3: put data segment registers into known state upon
 resume
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <3cad2798-1a01-7d5e-ea55-ddb9ba6388d9@suse.com>
 <6343ad61-246f-fefd-cd12-d260807e82f0@citrix.com>
 <c726cdc7-271b-0ea7-4056-8ab86686282e@suse.com>
 <e61e34c4-38dd-d201-8035-ead79a7595c2@citrix.com>
 <072d2566-8640-2bf6-d660-2eeb019c8a08@runbox.com>
 <de1f03ff-6740-d9da-8cc6-e2dd4fea3c68@citrix.com>
From: "M. Vefa Bicakci" <m.v.b@runbox.com>
Message-ID: <b9bae032-cdbe-de26-e8c1-1980bce175d3@runbox.com>
Date: Thu, 30 Jul 2020 02:38:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.0.1
MIME-Version: 1.0
In-Reply-To: <de1f03ff-6740-d9da-8cc6-e2dd4fea3c68@citrix.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 7/30/20 2:31 AM, Andrew Cooper wrote:
> On 30/07/2020 00:29, M. Vefa Bicakci wrote:
>> On 7/23/20 7:00 PM, Andrew Cooper wrote:
>>> On 23/07/2020 16:19, Jan Beulich wrote:
>>>> On 23.07.2020 16:40, Andrew Cooper wrote:
>>>>> On 20/07/2020 16:20, Jan Beulich wrote:
>>>>>> wakeup_32 sets %ds and %es to BOOT_DS, while leaving %fs at what
>>>>>> wakeup_start did set it to, and %gs at whatever BIOS did load into
>>>>>> it.
>>>>>> All of this may end up confusing the first load_segments() to run on
>>>>>> the BSP after resume, in particular allowing a non-nul selector value
>>>>>> to be left in %fs.
>>>>>>
>>>>>> Alongside %ss, also put all other data segment registers into the
>>>>>> same
>>>>>> state that the boot and CPU bringup paths put them in.
>>>>>>
>>>>>> Reported-by: M. Vefa Bicakci <m.v.b@runbox.com>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>
>>>>>> --- a/xen/arch/x86/acpi/wakeup_prot.S
>>>>>> +++ b/xen/arch/x86/acpi/wakeup_prot.S
>>>>>> @@ -52,6 +52,16 @@ ENTRY(s3_resume)
>>>>>>            mov     %eax, %ss
>>>>>>            mov     saved_rsp(%rip), %rsp
>>>>>>    +        /*
>>>>>> +         * Also put other segment registers into known state,
>>>>>> like would
>>>>>> +         * be done on the boot path. This is in particular
>>>>>> necessary for
>>>>>> +         * the first load_segments() to work as intended.
>>>>>> +         */
>>>>> I don't think the comment is helpful, not least because it refers to a
>>>>> broken behaviour in load_segemnts() which is soon going to change
>>>>> anyway.
>>>> Well, I can drop it. I merely thought I'd be nice and comment my
>>>> code once in a while (and the comment could be dropped / adjusted
>>>> when load_segments() changes)...
>>>>
>>>>> We've literally just loaded the GDT, at which point reloading all
>>>>> segments *is* the expected thing to do.
>>>> In a way, unless some/all are assumed to already hold a nul selector.
>>>>
>>>>> I'd recommend that the diff be simply:
>>>>>
>>>>> diff --git a/xen/arch/x86/acpi/wakeup_prot.S
>>>>> b/xen/arch/x86/acpi/wakeup_prot.S
>>>>> index dcc7e2327d..a2c41c4f3f 100644
>>>>> --- a/xen/arch/x86/acpi/wakeup_prot.S
>>>>> +++ b/xen/arch/x86/acpi/wakeup_prot.S
>>>>> @@ -49,6 +49,10 @@ ENTRY(s3_resume)
>>>>>            mov     %rax, %cr0
>>>>>              mov     $__HYPERVISOR_DS64, %eax
>>>>> +        mov     %eax, %ds
>>>>> +        mov     %eax, %es
>>>>> +        mov     %eax, %fs
>>>>> +        mov     %eax, %gs
>>>>>            mov     %eax, %ss
>>>>>            mov     saved_rsp(%rip), %rsp
>>>> So I had specifically elected to not put the addition there, to make
>>>> sure the stack would get established first. But seeing both Roger
>>>> and you ask me to do otherwise - well, so be it then.
>>>
>>> There is no IDT.  Any fault is will be triple, irrespective of the exact
>>> code layout.
>>>
>>> This sequence actually matches what we have in __high_start().
>>>
>>> I don't think it is wise to write code which presumes that
>>> __HYPERVISOR_DS64 is 0 (it happens to be, but could easily be 0xe010 as
>>> well), or that the trampoline has fixed behaviours for the segments.
>>
>> Hello Jan and Andrew,
>>
>> Is there anything I can do to help with the delivery/merging of this
>> patch?
> 
> It was committed last Friday.
> 
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=55f8c389d4348cc517946fdcb10794112458e81e
> 
> I presume Jan will backport it to stable trees when he's not OoO.

Great -- thanks! (And sorry for not checking the git tree prior to
sending my e-mail.)

Vefa

