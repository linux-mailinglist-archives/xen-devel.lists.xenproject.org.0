Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F342E210EBE
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 17:11:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqeO7-000450-62; Wed, 01 Jul 2020 15:11:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6/Ob=AM=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jqeO5-00044v-ML
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 15:11:02 +0000
X-Inumbo-ID: 12034596-bbad-11ea-8496-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 12034596-bbad-11ea-8496-bc764e2007e4;
 Wed, 01 Jul 2020 15:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593616259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3OzkLmjp2/6OT377j2dxBv/5JQQ05QCE0dQNnMjasKY=;
 b=CqOUbAQXEYG+JILftKBus9lVMeLedXctE0dHgAigSx0L0QNB7ZxolZcHydu8DwWrxhTpSp
 qu0Jm2XJI13gBX5NcjzHduOuR+4A1FOJJAupvrY+QcepCRgi7073fHnj8/5TUYpr8tYFI6
 2hLqKHEabcofxg+rBMCZsVshY4V6KIQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-kl_brxg7OkSYFHsnilCUKw-1; Wed, 01 Jul 2020 11:10:57 -0400
X-MC-Unique: kl_brxg7OkSYFHsnilCUKw-1
Received: by mail-ed1-f70.google.com with SMTP id h5so21102340edl.7
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2020 08:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=3OzkLmjp2/6OT377j2dxBv/5JQQ05QCE0dQNnMjasKY=;
 b=gRwfj+NzByR1EJi465bZ0g3vj57tQd8io+jagn/UsVsQULNPZtd97RgSfuIiuRGmrB
 X97NcpHBD1YvwfRc/E9+OoTQTOFMcVpd9DNmiVweb9lQprFPnzbsAqBqUWuIhAKVSxdl
 0LKXbW13qdsmvP9fetjJYIQRwx/8aLkXWAosShpRlhIqGRhAF+6Ob0rT0A6lItzvumw3
 K3r2rBQ3RHOMuO7gOWsNuh3fH34G/PGeDDdMikHlBFO2QbmCBUgIwN6F72cUmfUoMhvi
 IkWkFGbljqqST7pdsLmsG8BawawcmZ3EHxqAtxOtGXEal9sfs3e1AurB3iYsHiMKg6Gz
 VgSg==
X-Gm-Message-State: AOAM531k86W2xjiRh1j6oifEjHaIjWfbMdaD/nQy+/Ot3MlOA0kXIGEI
 LGIEyHTwYiRHMd+myRdghFkDpLQ7yT02DYTGZ+gOR7dt++3MwxR/ZH/oxVw4U2OFfYK4ovrII/C
 JDmh8kvPppEnPt+PzPWh4IcpzSnI=
X-Received: by 2002:a17:906:35d2:: with SMTP id
 p18mr24456300ejb.393.1593616256219; 
 Wed, 01 Jul 2020 08:10:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRsyWL+FnQ+2J4ypqMaTDn8KOMxKU/MhqjZ2pwt5D4D1Yx8kgojUgOqxbplfComQUP53vs5g==
X-Received: by 2002:a17:906:35d2:: with SMTP id
 p18mr24456276ejb.393.1593616256004; 
 Wed, 01 Jul 2020 08:10:56 -0700 (PDT)
Received: from [192.168.1.37] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id c10sm97656edt.22.2020.07.01.08.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 08:10:55 -0700 (PDT)
Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
To: Jason Andryuk <jandryuk@gmail.com>
References: <20200624121841.17971-1-paul@xen.org>
 <20200624121841.17971-3-paul@xen.org>
 <33e594dd-dbfa-7c57-1cf5-0852e8fc8e1d@redhat.com>
 <000701d64ef5$6568f660$303ae320$@xen.org>
 <9e591254-d215-d5af-38d2-fd5b65f84a43@redhat.com>
 <000801d64f75$c604f570$520ee050$@xen.org>
 <CAKf6xpvNTVqK263pdSARyoWnzP8g9SRoSqvhnLLwyYadjR1ChQ@mail.gmail.com>
 <07cc67e9-aeaa-1947-43db-c00716bead01@redhat.com>
 <5c00f6a5-3f86-258e-999f-956eef825d14@redhat.com>
 <CAKf6xpuiQBhvChwfikaLd4tvKVUn3oo88wbsMVw7P11ehV-EYQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <7cec82ad-208c-04d9-4ad7-8656cc914516@redhat.com>
Date: Wed, 1 Jul 2020 17:10:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAKf6xpuiQBhvChwfikaLd4tvKVUn3oo88wbsMVw7P11ehV-EYQ@mail.gmail.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <pdurrant@amazon.com>,
 Paul Durrant <paul@xen.org>, QEMU <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 7/1/20 4:59 PM, Jason Andryuk wrote:
> On Wed, Jul 1, 2020 at 8:55 AM Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> On 7/1/20 2:40 PM, Philippe Mathieu-Daudé wrote:
>>> On 7/1/20 2:25 PM, Jason Andryuk wrote:
>>>> On Wed, Jul 1, 2020 at 3:03 AM Paul Durrant <xadimgnik@gmail.com> wrote:
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>>> Sent: 30 June 2020 18:27
>>>>>> To: paul@xen.org; xen-devel@lists.xenproject.org; qemu-devel@nongnu.org
>>>>>> Cc: 'Eduardo Habkost' <ehabkost@redhat.com>; 'Michael S. Tsirkin' <mst@redhat.com>; 'Paul Durrant'
>>>>>> <pdurrant@amazon.com>; 'Jason Andryuk' <jandryuk@gmail.com>; 'Paolo Bonzini' <pbonzini@redhat.com>;
>>>>>> 'Richard Henderson' <rth@twiddle.net>
>>>>>> Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
>>>>>>
>>>>>> On 6/30/20 5:44 PM, Paul Durrant wrote:
>>>>>>>> -----Original Message-----
>>>>>>>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>>>>> Sent: 30 June 2020 16:26
>>>>>>>> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org; qemu-devel@nongnu.org
>>>>>>>> Cc: Eduardo Habkost <ehabkost@redhat.com>; Michael S. Tsirkin <mst@redhat.com>; Paul Durrant
>>>>>>>> <pdurrant@amazon.com>; Jason Andryuk <jandryuk@gmail.com>; Paolo Bonzini <pbonzini@redhat.com>;
>>>>>>>> Richard Henderson <rth@twiddle.net>
>>>>>>>> Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
>>>>>>>>
>>>>>>>> On 6/24/20 2:18 PM, Paul Durrant wrote:
>>>>>>>>> From: Paul Durrant <pdurrant@amazon.com>
>>>>>>>>>
>>>>>>>>> The generic pc_machine_initfn() calls pc_system_flash_create() which creates
>>>>>>>>> 'system.flash0' and 'system.flash1' devices. These devices are then realized
>>>>>>>>> by pc_system_flash_map() which is called from pc_system_firmware_init() which
>>>>>>>>> itself is called via pc_memory_init(). The latter however is not called when
>>>>>>>>> xen_enable() is true and hence the following assertion fails:
>>>>>>>>>
>>>>>>>>> qemu-system-i386: hw/core/qdev.c:439: qdev_assert_realized_properly:
>>>>>>>>> Assertion `dev->realized' failed
>>>>>>>>>
>>>>>>>>> These flash devices are unneeded when using Xen so this patch avoids the
>>>>>>>>> assertion by simply removing them using pc_system_flash_cleanup_unused().
>>>>>>>>>
>>>>>>>>> Reported-by: Jason Andryuk <jandryuk@gmail.com>
>>>>>>>>> Fixes: ebc29e1beab0 ("pc: Support firmware configuration with -blockdev")
>>>>>>>>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
>>>>>>>>> Tested-by: Jason Andryuk <jandryuk@gmail.com>
>>>>>>>>> ---
>>>>>>>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>>>>>>>> Cc: Richard Henderson <rth@twiddle.net>
>>>>>>>>> Cc: Eduardo Habkost <ehabkost@redhat.com>
>>>>>>>>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>>>>>>>>> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>>>>>>>>> ---
>>>>>>>>>  hw/i386/pc_piix.c    | 9 ++++++---
>>>>>>>>>  hw/i386/pc_sysfw.c   | 2 +-
>>>>>>>>>  include/hw/i386/pc.h | 1 +
>>>>>>>>>  3 files changed, 8 insertions(+), 4 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>>>>>>>> index 1497d0e4ae..977d40afb8 100644
>>>>>>>>> --- a/hw/i386/pc_piix.c
>>>>>>>>> +++ b/hw/i386/pc_piix.c
>>>>>>>>> @@ -186,9 +186,12 @@ static void pc_init1(MachineState *machine,
>>>>>>>>>      if (!xen_enabled()) {
>>>>>>>>>          pc_memory_init(pcms, system_memory,
>>>>>>>>>                         rom_memory, &ram_memory);
>>>>>>>>> -    } else if (machine->kernel_filename != NULL) {
>>>>>>>>> -        /* For xen HVM direct kernel boot, load linux here */
>>>>>>>>> -        xen_load_linux(pcms);
>>>>>>>>> +    } else {
>>>>>>>>> +        pc_system_flash_cleanup_unused(pcms);
>>>>>>>>
>>>>>>>> TIL pc_system_flash_cleanup_unused().
>>>>>>>>
>>>>>>>> What about restricting at the source?
>>>>>>>>
>>>>>>>
>>>>>>> And leave the devices in place? They are not relevant for Xen, so why not clean up?
>>>>>>
>>>>>> No, I meant to not create them in the first place, instead of
>>>>>> create+destroy.
>>>>>>
>>>>>> Anyway what you did works, so I don't have any problem.
>>>>>
>>>>> IIUC Jason originally tried restricting creation but encountered a problem because xen_enabled() would always return false at that point, because machine creation occurs before accelerators are initialized.
>>>>
>>>> Correct.  Quoting my previous email:
>>>> """
>>>> Removing the call to pc_system_flash_create() from pc_machine_initfn()
>>>> lets QEMU startup and run a Xen HVM again.  xen_enabled() doesn't work
>>>> there since accelerators have not been initialized yes, I guess?
>>>
>>> Ah, I missed that. You pointed at the bug here :)
>>>
>>> I think pc_system_flash_create() shouldn't be called in init() but
>>> realize().
>>
>> Hmm this is a MachineClass, not qdev, so no realize().
>>
>> In softmmu/vl.c we have:
>>
>> 4152     configure_accelerators(argv[0]);
>> ....
>> 4327     if (!xen_enabled()) { // so xen_enable() is working
>> 4328         /* On 32-bit hosts, QEMU is limited by virtual address space */
>> 4329         if (ram_size > (2047 << 20) && HOST_LONG_BITS == 32) {
>> 4330             error_report("at most 2047 MB RAM can be simulated");
>> 4331             exit(1);
>> 4332         }
>> 4333     }
>> ....
>> 4348     machine_run_board_init(current_machine);
>>
>> which calls in hw/core/machine.c:
>>
>> 1089 void machine_run_board_init(MachineState *machine)
>> 1090 {
>> 1091     MachineClass *machine_class = MACHINE_GET_CLASS(machine);
>> ....
>> 1138     machine_class->init(machine);
>> 1139 }
>>
>>          -> pc_machine_class_init()
>>
>> This should come after:
>>
>>          -> pc_machine_initfn()
>>
>>             -> pc_system_flash_create(pcms)
> 
> Sorry, I'm not following the flow you want.

Well, I was simply trying to understand what was wrong, and
what we should fix so you don't have to create flash devices
then destroy them when using Xen.

I already said Paul patch is OK and gave my R-b to it.

> 
> The xen_enabled() call in vl.c may always fail.  Or at least in most
> common Xen usage.  Xen HVMs are started with machine xenfv and don't
> specify an accelerator.  You need to process the xenfv default machine
> opts to process "accel=xen".  Actually, I don't know how the
> accelerator initialization works, but xen_accel_class_init() needs to
> be called to set `ac->allowed = &xen_allowed`.  xen_allowed is the
> return value of xen_enabled() and the accelerator initialization must
> toggle it.

Since you are happy how this current works, I'm also fine with it,
I won't investigate further.

Regards,

Phil.


