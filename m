Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5F2321EC3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 19:04:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88334.166027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEFZa-0001XZ-NN; Mon, 22 Feb 2021 18:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88334.166027; Mon, 22 Feb 2021 18:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEFZa-0001XA-KH; Mon, 22 Feb 2021 18:04:42 +0000
Received: by outflank-mailman (input) for mailman id 88334;
 Mon, 22 Feb 2021 18:04:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V+0I=HY=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lEFZZ-0001X5-UN
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 18:04:41 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2dcd7357-e522-4cae-b78d-1df92cad2614;
 Mon, 22 Feb 2021 18:04:40 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-az0L5RqbNS6dy3SwhF9Kng-1; Mon, 22 Feb 2021 13:04:37 -0500
Received: by mail-ed1-f72.google.com with SMTP id g20so4874722edy.7
 for <xen-devel@lists.xenproject.org>; Mon, 22 Feb 2021 10:04:37 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b27sm7825403eja.64.2021.02.22.10.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 10:04:35 -0800 (PST)
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
X-Inumbo-ID: 2dcd7357-e522-4cae-b78d-1df92cad2614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614017080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SSsnX5SjnKwxu3rr90T4nBZzi1MZ/dtXAKPK6GY/CHA=;
	b=JYQXspFD0XNylrg8ANJu0NJ9V/mNSHFBXTZuEEA6VnMco8/dKpvb0jREOo7vXGeEVfkDCB
	ZsifBcfUwnq8TVyaKkhOeW3GC3H2AMxlW2vMHLoL+nqGxdex99ATP7Q6RW+1ntOEIyG3wV
	nEcF6SeVNbcZGaE8D2wXd0s3IU2gkvg=
X-MC-Unique: az0L5RqbNS6dy3SwhF9Kng-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SSsnX5SjnKwxu3rr90T4nBZzi1MZ/dtXAKPK6GY/CHA=;
        b=mbmIpU48MGd/1pAIl4CODRFPKe+SjVzzaC+yjf0tyXZKriZUP6nWwEOBNa7w2z3eDI
         z3CeWxP/6GDr8OP+r3Ziz2AA6AT9nmmrwiNF89ltINzfxV0b+vEfVQAuY94zXoxYZQ5g
         9k1ZDUG+aLgJ9NsOPSY6Vdt21dnN5YKl0X8MI7RyZ1YBH3gvdxXUT7th9HFPeUeSSsuP
         qaROsowGq+MQmRVnJtK6H5pqhjqfZR+N61mrdfhYRZnQ3DISLodr6weO8k9NfGbRbLuv
         j3c26+M8jEIW5aXDV+dFxtj+8SkLN1Yrvg+P+01tufCE09x46EUgAFGpXyq3tREjKuWK
         +V/g==
X-Gm-Message-State: AOAM532AndEranoKInmATOsc5kAhIts/Hx8WAtRFxiUtx9vC3xRkKbF0
	o2BK+FTSRyqFsAgn20qjQCthpWAlI4LXaWwoiISA9uacrG9scyv7McoMy/IdfMbT3y0+G9zMPNj
	DAACBv74hAyx+TQB6Sd8nvM7Ak3k=
X-Received: by 2002:a17:906:7e42:: with SMTP id z2mr21995947ejr.177.1614017076008;
        Mon, 22 Feb 2021 10:04:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/JC++82lk2ObRrXbPMXgvjOy+aii8aMRtQqY2wAzax0ZKP5G6jLvuYpnN+D+qmV72Wu/wKA==
X-Received: by 2002:a17:906:7e42:: with SMTP id z2mr21995909ejr.177.1614017075776;
        Mon, 22 Feb 2021 10:04:35 -0800 (PST)
Subject: Re: [PATCH v2 01/11] accel/kvm: Check MachineClass kvm_type() return
 value
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>, xen-devel@lists.xenproject.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Leif Lindholm <leif@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Alistair Francis <alistair@alistair23.me>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Greg Kurz <groug@kaod.org>, Christian Borntraeger <borntraeger@de.ibm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-2-philmd@redhat.com>
 <20210222182405.3e6e9a6f.cohuck@redhat.com>
 <bc37276d-74cc-22f0-fcc0-4ee5e62cf1df@redhat.com>
 <20210222185044.23fccecc.cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0f2a252e-34d8-6714-d1fd-d4e3764feef7@redhat.com>
Date: Mon, 22 Feb 2021 19:04:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222185044.23fccecc.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/22/21 6:50 PM, Cornelia Huck wrote:
> On Mon, 22 Feb 2021 18:41:07 +0100
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> On 2/22/21 6:24 PM, Cornelia Huck wrote:
>>> On Fri, 19 Feb 2021 18:38:37 +0100
>>> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>   
>>>> MachineClass::kvm_type() can return -1 on failure.
>>>> Document it, and add a check in kvm_init().
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>  include/hw/boards.h | 3 ++-
>>>>  accel/kvm/kvm-all.c | 6 ++++++
>>>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>>>> index a46dfe5d1a6..68d3d10f6b0 100644
>>>> --- a/include/hw/boards.h
>>>> +++ b/include/hw/boards.h
>>>> @@ -127,7 +127,8 @@ typedef struct {
>>>>   *    implement and a stub device is required.
>>>>   * @kvm_type:
>>>>   *    Return the type of KVM corresponding to the kvm-type string option or
>>>> - *    computed based on other criteria such as the host kernel capabilities.
>>>> + *    computed based on other criteria such as the host kernel capabilities
>>>> + *    (which can't be negative), or -1 on error.
>>>>   * @numa_mem_supported:
>>>>   *    true if '--numa node.mem' option is supported and false otherwise
>>>>   * @smp_parse:
>>>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>>>> index 84c943fcdb2..b069938d881 100644
>>>> --- a/accel/kvm/kvm-all.c
>>>> +++ b/accel/kvm/kvm-all.c
>>>> @@ -2057,6 +2057,12 @@ static int kvm_init(MachineState *ms)
>>>>                                                              "kvm-type",
>>>>                                                              &error_abort);
>>>>          type = mc->kvm_type(ms, kvm_type);
>>>> +        if (type < 0) {
>>>> +            ret = -EINVAL;
>>>> +            fprintf(stderr, "Failed to detect kvm-type for machine '%s'\n",
>>>> +                    mc->name);
>>>> +            goto err;
>>>> +        }
>>>>      }
>>>>  
>>>>      do {  
>>>
>>> No objection to this patch; but I'm wondering why some non-pseries
>>> machines implement the kvm_type callback, when I see the kvm-type
>>> property only for pseries? Am I holding my git grep wrong?  
>>
>> Can it be what David commented here?
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg784508.html
>>
> 
> Ok, I might be confused about the other ppc machines; but I'm wondering
> about the kvm_type callback for mips and arm/virt. Maybe I'm just
> confused by the whole mechanism?

For MIPS see https://www.linux-kvm.org/images/f/f2/01x08a-MIPS.pdf
and Jiaxun comment here:
https://lore.kernel.org/linux-mips/a2a2cfe3-5618-43b1-a6a4-cc768fc1b9fb@www.fastmail.com/

TE KVM: Trap-and-Emul guest kernel
VZ KVM: HW Virtualized

For "the whole mechanism" I'll defer to Paolo =)


