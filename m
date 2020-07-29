Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3879623281C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 01:32:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0vYB-0001k1-U7; Wed, 29 Jul 2020 23:31:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XnVs=BI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k0vYA-0001jv-3G
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 23:31:54 +0000
X-Inumbo-ID: ae28ff7c-d1f3-11ea-aa7c-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae28ff7c-d1f3-11ea-aa7c-12813bfff9fa;
 Wed, 29 Jul 2020 23:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596065512;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=P7Bd6LYoU4Om/hsW0kYYE0Q5zLNZTDMtD0E63E93pEA=;
 b=H1PZ+plBS71MulvtiP1VuIBAeJnfyuz4PhdCqc65BvbX/uywiloBRTcs
 i6B+mzoLRvIz0tzkYUtf8QZuvOTLnMNNjEw2lvd1bdNz+be2t92sdRFTL
 KNt2896d54LqvSQ0IdjGdtZqpsKRWD8KY3a5m+U+vdisce9s7LBHkgR+c c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 8xHH3hqjO32hswaIL9iw6uG2Z/fln4W+R/S1coGMp874+y0Hq5oAD1nMK8KjT5lSP1WPZwlACI
 R1vUDxCCO6b4dvJ4O9FSE43xtXgq8U/oWcCGfPTcoDH1mr6SVJUD/w4ox6SiJUR8SstbN3F+/h
 oQUqfVASUV5PUx8uoIIHe5YLv1g/YbuzG8/WEv6DC0KouNtneqL2NFAqUzXXOOJnDHeRvpRN/z
 MOwL8sF9GanZHnjacDe+aEF9/HZgLc41cCTDosQbvVSPyPVGRtHdiTLpzbegLuP8xGLjNnk9+V
 axk=
X-SBRS: 2.7
X-MesageID: 23509159
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,412,1589256000"; d="scan'208";a="23509159"
Subject: Re: [PATCH] x86/S3: put data segment registers into known state upon
 resume
To: "M. Vefa Bicakci" <m.v.b@runbox.com>, Jan Beulich <jbeulich@suse.com>
References: <3cad2798-1a01-7d5e-ea55-ddb9ba6388d9@suse.com>
 <6343ad61-246f-fefd-cd12-d260807e82f0@citrix.com>
 <c726cdc7-271b-0ea7-4056-8ab86686282e@suse.com>
 <e61e34c4-38dd-d201-8035-ead79a7595c2@citrix.com>
 <072d2566-8640-2bf6-d660-2eeb019c8a08@runbox.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <de1f03ff-6740-d9da-8cc6-e2dd4fea3c68@citrix.com>
Date: Thu, 30 Jul 2020 00:31:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <072d2566-8640-2bf6-d660-2eeb019c8a08@runbox.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30/07/2020 00:29, M. Vefa Bicakci wrote:
> On 7/23/20 7:00 PM, Andrew Cooper wrote:
>> On 23/07/2020 16:19, Jan Beulich wrote:
>>> On 23.07.2020 16:40, Andrew Cooper wrote:
>>>> On 20/07/2020 16:20, Jan Beulich wrote:
>>>>> wakeup_32 sets %ds and %es to BOOT_DS, while leaving %fs at what
>>>>> wakeup_start did set it to, and %gs at whatever BIOS did load into
>>>>> it.
>>>>> All of this may end up confusing the first load_segments() to run on
>>>>> the BSP after resume, in particular allowing a non-nul selector value
>>>>> to be left in %fs.
>>>>>
>>>>> Alongside %ss, also put all other data segment registers into the
>>>>> same
>>>>> state that the boot and CPU bringup paths put them in.
>>>>>
>>>>> Reported-by: M. Vefa Bicakci <m.v.b@runbox.com>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> --- a/xen/arch/x86/acpi/wakeup_prot.S
>>>>> +++ b/xen/arch/x86/acpi/wakeup_prot.S
>>>>> @@ -52,6 +52,16 @@ ENTRY(s3_resume)
>>>>>           mov     %eax, %ss
>>>>>           mov     saved_rsp(%rip), %rsp
>>>>>   +        /*
>>>>> +         * Also put other segment registers into known state,
>>>>> like would
>>>>> +         * be done on the boot path. This is in particular
>>>>> necessary for
>>>>> +         * the first load_segments() to work as intended.
>>>>> +         */
>>>> I don't think the comment is helpful, not least because it refers to a
>>>> broken behaviour in load_segemnts() which is soon going to change
>>>> anyway.
>>> Well, I can drop it. I merely thought I'd be nice and comment my
>>> code once in a while (and the comment could be dropped / adjusted
>>> when load_segments() changes)...
>>>
>>>> We've literally just loaded the GDT, at which point reloading all
>>>> segments *is* the expected thing to do.
>>> In a way, unless some/all are assumed to already hold a nul selector.
>>>
>>>> I'd recommend that the diff be simply:
>>>>
>>>> diff --git a/xen/arch/x86/acpi/wakeup_prot.S
>>>> b/xen/arch/x86/acpi/wakeup_prot.S
>>>> index dcc7e2327d..a2c41c4f3f 100644
>>>> --- a/xen/arch/x86/acpi/wakeup_prot.S
>>>> +++ b/xen/arch/x86/acpi/wakeup_prot.S
>>>> @@ -49,6 +49,10 @@ ENTRY(s3_resume)
>>>>           mov     %rax, %cr0
>>>>             mov     $__HYPERVISOR_DS64, %eax
>>>> +        mov     %eax, %ds
>>>> +        mov     %eax, %es
>>>> +        mov     %eax, %fs
>>>> +        mov     %eax, %gs
>>>>           mov     %eax, %ss
>>>>           mov     saved_rsp(%rip), %rsp
>>> So I had specifically elected to not put the addition there, to make
>>> sure the stack would get established first. But seeing both Roger
>>> and you ask me to do otherwise - well, so be it then.
>>
>> There is no IDT.  Any fault is will be triple, irrespective of the exact
>> code layout.
>>
>> This sequence actually matches what we have in __high_start().
>>
>> I don't think it is wise to write code which presumes that
>> __HYPERVISOR_DS64 is 0 (it happens to be, but could easily be 0xe010 as
>> well), or that the trampoline has fixed behaviours for the segments.
>
> Hello Jan and Andrew,
>
> Is there anything I can do to help with the delivery/merging of this
> patch?

It was committed last Friday.

https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=55f8c389d4348cc517946fdcb10794112458e81e

I presume Jan will backport it to stable trees when he's not OoO.

~Andrew

