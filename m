Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D86822B316
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 18:01:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jydeB-0000X2-Lf; Thu, 23 Jul 2020 16:00:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWck=BC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jydeA-0000Wx-KM
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 16:00:38 +0000
X-Inumbo-ID: a599aa29-ccfd-11ea-873e-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a599aa29-ccfd-11ea-873e-bc764e2007e4;
 Thu, 23 Jul 2020 16:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595520036;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=CUBcWDqMi6J0iPnXI5g8xtGAcA/gPUjYeEizeNxjR9U=;
 b=MjwGafP2/OZudzC2runZ4vW0rthoymczFkqEA9EHkAV9ugWRx+xzZLnT
 4vTKuUkQiCk8QKuE9VRSKR5JmxMbk8mMLisennZ33KeCwG5mpQSy6bNev
 FMIgnJmO8CyklaWgqBBtIrAcjPk68gO02Um5gpoTuULwyT5s2piNAHIfy M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: xwhDdYuWlOcdmIa3e8tGYl1S09NqyRiXNeYFP7dk3c7IBOvqtPBOz2WkIrQliKapKQcTUAZw1H
 H1j/WMMYfRYgnvluBV8qtj/WU4gRIICYk7IBoPjT5FKfI/314DRZCeR94r7QbLI+BtS7hitl4I
 MT1q0+PPtpjQ33Z33B5jWdcziIOEuVD57spAaYX1+hQPylFrBxBhiO9hRkj/hRI9wt0JmpWOeh
 U/qcK3sAFcvWzkfIXAHfk8byOAOJHcZbm4LPErwPldUule1DuSJr/GvWZBxTZcUAvYxLUiCgM1
 SdY=
X-SBRS: 2.7
X-MesageID: 23384890
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,387,1589256000"; d="scan'208";a="23384890"
Subject: Re: [PATCH] x86/S3: put data segment registers into known state upon
 resume
To: Jan Beulich <jbeulich@suse.com>
References: <3cad2798-1a01-7d5e-ea55-ddb9ba6388d9@suse.com>
 <6343ad61-246f-fefd-cd12-d260807e82f0@citrix.com>
 <c726cdc7-271b-0ea7-4056-8ab86686282e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e61e34c4-38dd-d201-8035-ead79a7595c2@citrix.com>
Date: Thu, 23 Jul 2020 17:00:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c726cdc7-271b-0ea7-4056-8ab86686282e@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "M.
 Vefa Bicakci" <m.v.b@runbox.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23/07/2020 16:19, Jan Beulich wrote:
> On 23.07.2020 16:40, Andrew Cooper wrote:
>> On 20/07/2020 16:20, Jan Beulich wrote:
>>> wakeup_32 sets %ds and %es to BOOT_DS, while leaving %fs at what
>>> wakeup_start did set it to, and %gs at whatever BIOS did load into it.
>>> All of this may end up confusing the first load_segments() to run on
>>> the BSP after resume, in particular allowing a non-nul selector value
>>> to be left in %fs.
>>>
>>> Alongside %ss, also put all other data segment registers into the same
>>> state that the boot and CPU bringup paths put them in.
>>>
>>> Reported-by: M. Vefa Bicakci <m.v.b@runbox.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/arch/x86/acpi/wakeup_prot.S
>>> +++ b/xen/arch/x86/acpi/wakeup_prot.S
>>> @@ -52,6 +52,16 @@ ENTRY(s3_resume)
>>>          mov     %eax, %ss
>>>          mov     saved_rsp(%rip), %rsp
>>>  
>>> +        /*
>>> +         * Also put other segment registers into known state, like would
>>> +         * be done on the boot path. This is in particular necessary for
>>> +         * the first load_segments() to work as intended.
>>> +         */
>> I don't think the comment is helpful, not least because it refers to a
>> broken behaviour in load_segemnts() which is soon going to change anyway.
> Well, I can drop it. I merely thought I'd be nice and comment my
> code once in a while (and the comment could be dropped / adjusted
> when load_segments() changes)...
>
>> We've literally just loaded the GDT, at which point reloading all
>> segments *is* the expected thing to do.
> In a way, unless some/all are assumed to already hold a nul selector.
>
>> I'd recommend that the diff be simply:
>>
>> diff --git a/xen/arch/x86/acpi/wakeup_prot.S
>> b/xen/arch/x86/acpi/wakeup_prot.S
>> index dcc7e2327d..a2c41c4f3f 100644
>> --- a/xen/arch/x86/acpi/wakeup_prot.S
>> +++ b/xen/arch/x86/acpi/wakeup_prot.S
>> @@ -49,6 +49,10 @@ ENTRY(s3_resume)
>>          mov     %rax, %cr0
>>  
>>          mov     $__HYPERVISOR_DS64, %eax
>> +        mov     %eax, %ds
>> +        mov     %eax, %es
>> +        mov     %eax, %fs
>> +        mov     %eax, %gs
>>          mov     %eax, %ss
>>          mov     saved_rsp(%rip), %rsp
> So I had specifically elected to not put the addition there, to make
> sure the stack would get established first. But seeing both Roger
> and you ask me to do otherwise - well, so be it then.

There is no IDT.  Any fault is will be triple, irrespective of the exact
code layout.

This sequence actually matches what we have in __high_start().

I don't think it is wise to write code which presumes that
__HYPERVISOR_DS64 is 0 (it happens to be, but could easily be 0xe010 as
well), or that the trampoline has fixed behaviours for the segments.

~Andrew

