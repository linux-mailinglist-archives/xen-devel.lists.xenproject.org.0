Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A4222B259
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 17:19:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyd0N-0002bB-Hj; Thu, 23 Jul 2020 15:19:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jyd0N-0002b6-2p
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 15:19:31 +0000
X-Inumbo-ID: e768c4d0-ccf7-11ea-a2be-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e768c4d0-ccf7-11ea-a2be-12813bfff9fa;
 Thu, 23 Jul 2020 15:19:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AF629AE91;
 Thu, 23 Jul 2020 15:19:37 +0000 (UTC)
Subject: Re: [PATCH] x86/S3: put data segment registers into known state upon
 resume
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <3cad2798-1a01-7d5e-ea55-ddb9ba6388d9@suse.com>
 <6343ad61-246f-fefd-cd12-d260807e82f0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c726cdc7-271b-0ea7-4056-8ab86686282e@suse.com>
Date: Thu, 23 Jul 2020 17:19:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6343ad61-246f-fefd-cd12-d260807e82f0@citrix.com>
Content-Type: text/plain; charset=utf-8
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
 "M. Vefa Bicakci" <m.v.b@runbox.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.07.2020 16:40, Andrew Cooper wrote:
> On 20/07/2020 16:20, Jan Beulich wrote:
>> wakeup_32 sets %ds and %es to BOOT_DS, while leaving %fs at what
>> wakeup_start did set it to, and %gs at whatever BIOS did load into it.
>> All of this may end up confusing the first load_segments() to run on
>> the BSP after resume, in particular allowing a non-nul selector value
>> to be left in %fs.
>>
>> Alongside %ss, also put all other data segment registers into the same
>> state that the boot and CPU bringup paths put them in.
>>
>> Reported-by: M. Vefa Bicakci <m.v.b@runbox.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/acpi/wakeup_prot.S
>> +++ b/xen/arch/x86/acpi/wakeup_prot.S
>> @@ -52,6 +52,16 @@ ENTRY(s3_resume)
>>          mov     %eax, %ss
>>          mov     saved_rsp(%rip), %rsp
>>  
>> +        /*
>> +         * Also put other segment registers into known state, like would
>> +         * be done on the boot path. This is in particular necessary for
>> +         * the first load_segments() to work as intended.
>> +         */
> 
> I don't think the comment is helpful, not least because it refers to a
> broken behaviour in load_segemnts() which is soon going to change anyway.

Well, I can drop it. I merely thought I'd be nice and comment my
code once in a while (and the comment could be dropped / adjusted
when load_segments() changes)...

> We've literally just loaded the GDT, at which point reloading all
> segments *is* the expected thing to do.

In a way, unless some/all are assumed to already hold a nul selector.

> I'd recommend that the diff be simply:
> 
> diff --git a/xen/arch/x86/acpi/wakeup_prot.S
> b/xen/arch/x86/acpi/wakeup_prot.S
> index dcc7e2327d..a2c41c4f3f 100644
> --- a/xen/arch/x86/acpi/wakeup_prot.S
> +++ b/xen/arch/x86/acpi/wakeup_prot.S
> @@ -49,6 +49,10 @@ ENTRY(s3_resume)
>          mov     %rax, %cr0
>  
>          mov     $__HYPERVISOR_DS64, %eax
> +        mov     %eax, %ds
> +        mov     %eax, %es
> +        mov     %eax, %fs
> +        mov     %eax, %gs
>          mov     %eax, %ss
>          mov     saved_rsp(%rip), %rsp

So I had specifically elected to not put the addition there, to make
sure the stack would get established first. But seeing both Roger
and you ask me to do otherwise - well, so be it then.

> It is a shame that the CR0 load breaks up the obvious connection with
> lgdt, but IIRC, that was a consequence of how the code was laid out
> previously.
> 
> Preferably with the above diff, Reviewed-by: Andrew Cooper
> <andrew.cooper3@citrix.com>

Thanks, Jan

