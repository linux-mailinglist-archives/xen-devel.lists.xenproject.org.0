Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A0420FA8B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 19:28:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqK2d-0000CD-Mp; Tue, 30 Jun 2020 17:27:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sbHC=AL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jqK2c-0000C8-Bs
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 17:27:30 +0000
X-Inumbo-ID: f83cb842-baf6-11ea-bb8b-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f83cb842-baf6-11ea-bb8b-bc764e2007e4;
 Tue, 30 Jun 2020 17:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593538047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oqaF53js116BFuwCtw9OPfpHPGSljyERaOiFUdX/2cY=;
 b=JLCJnRonvLSBEU+mhg/euJC4KbxMq+pI8SX2pkT+9LRUbRMnSFVX0Ry7b3vZdRcggnWSjw
 vojhap1ndNdJJFSEOIF3ukiNmLsj7SEOyvupW3iCHSMWealSF4QR12sspZRNSoktL744/a
 EIm075fJFJzBHT4bdDzSrf/QorVvEa0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-6bzu-WqhPD2vZc1MPwEz0A-1; Tue, 30 Jun 2020 13:27:25 -0400
X-MC-Unique: 6bzu-WqhPD2vZc1MPwEz0A-1
Received: by mail-ed1-f71.google.com with SMTP id x20so17581452edr.20
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2020 10:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=oqaF53js116BFuwCtw9OPfpHPGSljyERaOiFUdX/2cY=;
 b=P2JHjslwd6eeTUHC4n0zfXVpFOj+K4LC54o2d76jHumd2wLaC3mtnq99S2CBYsJPBW
 mULiurVfZ+R62Fft7wq556yXbveJHgsPV6L8yPcExnrgQ8zvVudpdPEg5FtZBAbWao/N
 3Em6oP2SjEG9QbH7Es/QBZPy/IIvnBEWgtsbcJl8PHs65a39Obygss6DZ9EzJS7e6B3o
 RCl8BqjiGyb7kvnp9VbwLDuyvNaq2QRPfMMRyXfRyycnS3hmr+t4AGrlHfF76RVfc1oF
 GujWLhQbh9aaB+j0IQl+amd6d7CCns4TrWodHBFLlIYfVXwx55yzgYNTZUrxua3nTS0X
 t3pQ==
X-Gm-Message-State: AOAM532Qb+bzXVBnM+qUaoBPqsCd11PTKP1QNtVh8r4nOSTeUWGNhL1/
 7qsPXrtJV9Iw+Rtsb0vyUjFP2gBJSu0YIkq4E838Y2UN+4e6wzFliP9ULVnf6Smqbk4V198L6on
 SHPl23CAlAopu0++n826xGweT6OQ=
X-Received: by 2002:a17:906:d9c4:: with SMTP id
 qk4mr20323088ejb.100.1593538044377; 
 Tue, 30 Jun 2020 10:27:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTRshH+tCbYqBRZoSrP2wOTHAhNfEEVSe9WoaeIdjWw3EP94byVU+BJoJjNvqHzssgxk8aLQ==
X-Received: by 2002:a17:906:d9c4:: with SMTP id
 qk4mr20323075ejb.100.1593538044167; 
 Tue, 30 Jun 2020 10:27:24 -0700 (PDT)
Received: from [192.168.1.40] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id g21sm3546337edu.2.2020.06.30.10.27.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 10:27:23 -0700 (PDT)
Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
To: paul@xen.org, xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
References: <20200624121841.17971-1-paul@xen.org>
 <20200624121841.17971-3-paul@xen.org>
 <33e594dd-dbfa-7c57-1cf5-0852e8fc8e1d@redhat.com>
 <000701d64ef5$6568f660$303ae320$@xen.org>
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
Message-ID: <9e591254-d215-d5af-38d2-fd5b65f84a43@redhat.com>
Date: Tue, 30 Jun 2020 19:27:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <000701d64ef5$6568f660$303ae320$@xen.org>
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
Cc: 'Eduardo Habkost' <ehabkost@redhat.com>,
 'Jason Andryuk' <jandryuk@gmail.com>, 'Paul Durrant' <pdurrant@amazon.com>,
 "'Michael S. Tsirkin'" <mst@redhat.com>, 'Paolo Bonzini' <pbonzini@redhat.com>,
 'Richard Henderson' <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/30/20 5:44 PM, Paul Durrant wrote:
>> -----Original Message-----
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Sent: 30 June 2020 16:26
>> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org; qemu-devel@nongnu.org
>> Cc: Eduardo Habkost <ehabkost@redhat.com>; Michael S. Tsirkin <mst@redhat.com>; Paul Durrant
>> <pdurrant@amazon.com>; Jason Andryuk <jandryuk@gmail.com>; Paolo Bonzini <pbonzini@redhat.com>;
>> Richard Henderson <rth@twiddle.net>
>> Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
>>
>> On 6/24/20 2:18 PM, Paul Durrant wrote:
>>> From: Paul Durrant <pdurrant@amazon.com>
>>>
>>> The generic pc_machine_initfn() calls pc_system_flash_create() which creates
>>> 'system.flash0' and 'system.flash1' devices. These devices are then realized
>>> by pc_system_flash_map() which is called from pc_system_firmware_init() which
>>> itself is called via pc_memory_init(). The latter however is not called when
>>> xen_enable() is true and hence the following assertion fails:
>>>
>>> qemu-system-i386: hw/core/qdev.c:439: qdev_assert_realized_properly:
>>> Assertion `dev->realized' failed
>>>
>>> These flash devices are unneeded when using Xen so this patch avoids the
>>> assertion by simply removing them using pc_system_flash_cleanup_unused().
>>>
>>> Reported-by: Jason Andryuk <jandryuk@gmail.com>
>>> Fixes: ebc29e1beab0 ("pc: Support firmware configuration with -blockdev")
>>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
>>> Tested-by: Jason Andryuk <jandryuk@gmail.com>
>>> ---
>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>> Cc: Richard Henderson <rth@twiddle.net>
>>> Cc: Eduardo Habkost <ehabkost@redhat.com>
>>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>>> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>>> ---
>>>  hw/i386/pc_piix.c    | 9 ++++++---
>>>  hw/i386/pc_sysfw.c   | 2 +-
>>>  include/hw/i386/pc.h | 1 +
>>>  3 files changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>> index 1497d0e4ae..977d40afb8 100644
>>> --- a/hw/i386/pc_piix.c
>>> +++ b/hw/i386/pc_piix.c
>>> @@ -186,9 +186,12 @@ static void pc_init1(MachineState *machine,
>>>      if (!xen_enabled()) {
>>>          pc_memory_init(pcms, system_memory,
>>>                         rom_memory, &ram_memory);
>>> -    } else if (machine->kernel_filename != NULL) {
>>> -        /* For xen HVM direct kernel boot, load linux here */
>>> -        xen_load_linux(pcms);
>>> +    } else {
>>> +        pc_system_flash_cleanup_unused(pcms);
>>
>> TIL pc_system_flash_cleanup_unused().
>>
>> What about restricting at the source?
>>
> 
> And leave the devices in place? They are not relevant for Xen, so why not clean up?

No, I meant to not create them in the first place, instead of
create+destroy.

Anyway what you did works, so I don't have any problem.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
>   Paul
>  
>> -- >8 --
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -1004,24 +1004,26 @@ void pc_memory_init(PCMachineState *pcms,
>>                                      &machine->device_memory->mr);
>>      }
>>
>> -    /* Initialize PC system firmware */
>> -    pc_system_firmware_init(pcms, rom_memory);
>> -
>> -    option_rom_mr = g_malloc(sizeof(*option_rom_mr));
>> -    memory_region_init_ram(option_rom_mr, NULL, "pc.rom", PC_ROM_SIZE,
>> -                           &error_fatal);
>> -    if (pcmc->pci_enabled) {
>> -        memory_region_set_readonly(option_rom_mr, true);
>> -    }
>> -    memory_region_add_subregion_overlap(rom_memory,
>> -                                        PC_ROM_MIN_VGA,
>> -                                        option_rom_mr,
>> -                                        1);
>> -
>>      fw_cfg = fw_cfg_arch_create(machine,
>>                                  x86ms->boot_cpus, x86ms->apic_id_limit);
>>
>> -    rom_set_fw(fw_cfg);
>> +    /* Initialize PC system firmware */
>> +    if (!xen_enabled()) {
>> +        pc_system_firmware_init(pcms, rom_memory);
>> +
>> +        option_rom_mr = g_malloc(sizeof(*option_rom_mr));
>> +        memory_region_init_ram(option_rom_mr, NULL, "pc.rom", PC_ROM_SIZE,
>> +                               &error_fatal);
>> +        if (pcmc->pci_enabled) {
>> +            memory_region_set_readonly(option_rom_mr, true);
>> +        }
>> +        memory_region_add_subregion_overlap(rom_memory,
>> +                                            PC_ROM_MIN_VGA,
>> +                                            option_rom_mr,
>> +                                            1);
>> +
>> +        rom_set_fw(fw_cfg);
>> +    }
>>
>>      if (pcmc->has_reserved_memory && machine->device_memory->base) {
>>          uint64_t *val = g_malloc(sizeof(*val));
>> ---
>>
>>> +        if (machine->kernel_filename != NULL) {
>>> +            /* For xen HVM direct kernel boot, load linux here */
>>> +            xen_load_linux(pcms);
>>> +        }
>>>      }
>>>
>>>      gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
>>> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
>>> index ec2a3b3e7e..0ff47a4b59 100644
>>> --- a/hw/i386/pc_sysfw.c
>>> +++ b/hw/i386/pc_sysfw.c
>>> @@ -108,7 +108,7 @@ void pc_system_flash_create(PCMachineState *pcms)
>>>      }
>>>  }
>>>
>>> -static void pc_system_flash_cleanup_unused(PCMachineState *pcms)
>>> +void pc_system_flash_cleanup_unused(PCMachineState *pcms)
>>>  {
>>>      char *prop_name;
>>>      int i;
>>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>>> index e6135c34d6..497f2b7ab7 100644
>>> --- a/include/hw/i386/pc.h
>>> +++ b/include/hw/i386/pc.h
>>> @@ -187,6 +187,7 @@ int cmos_get_fd_drive_type(FloppyDriveType fd0);
>>>
>>>  /* pc_sysfw.c */
>>>  void pc_system_flash_create(PCMachineState *pcms);
>>> +void pc_system_flash_cleanup_unused(PCMachineState *pcms);
>>>  void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
>>>
>>>  /* acpi-build.c */
>>>
> 
> 


