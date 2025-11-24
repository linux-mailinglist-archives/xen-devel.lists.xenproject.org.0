Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0E0C80165
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 12:07:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170304.1495372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUPd-0001tG-KQ; Mon, 24 Nov 2025 11:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170304.1495372; Mon, 24 Nov 2025 11:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUPd-0001qK-HC; Mon, 24 Nov 2025 11:07:17 +0000
Received: by outflank-mailman (input) for mailman id 1170304;
 Mon, 24 Nov 2025 11:07:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1xw1=6A=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vNUPc-0001qC-B9
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 11:07:16 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b947db03-c925-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 12:07:11 +0100 (CET)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-42bb288c1bfso2406733f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 03:07:10 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e556sm27384662f8f.5.2025.11.24.03.07.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 03:07:09 -0800 (PST)
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
X-Inumbo-ID: b947db03-c925-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763982430; x=1764587230; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/upjQ9H0SVSCgM+bbXBuwZe839PMqXM0bsd8OKlLlL0=;
        b=E9Y9QSPHBjQBCi2B44yKbv2Zozt/CZaPMqhwOowEzuVRmIaGVen5xVtQ+YGt9XBo+O
         JjVHcl+wMTagfoVF5AzBAEY3TspQ/NIAbL3elmThru7VhUjJH7oUmN8MDA+cZIFZ2K0/
         bYm+mVJMmEWSYAqli8nh4/TfAziUqb7qYq9b/IfUnJCNRA+hvhwoZoN1EaslSpgPxxMm
         BfhvEQlM3tMwiiygSCnNWPDWCZaMzH25ZnIloOI5/pvqVSheIz8r5pZ3zzC+xMj791RF
         vTObnknWV6Vrg8d7nGYhJp77J1LJdQlEmTbh1Jofu7ZAxNQ+bbCPlqsM+xTKvKSRHnJo
         8yAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763982430; x=1764587230;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/upjQ9H0SVSCgM+bbXBuwZe839PMqXM0bsd8OKlLlL0=;
        b=dZqdrCz/GoHS4XHUtTmQm7bU8fEPM89bpNbK0eoCI4Hb1lIg+ZdPoFmGsezbq2wrvM
         IEmHFnvAf7YS7Eer3DNILA8/tL997yj5xcorS7gp6T4+WtzaKVNKVZLdCZUQX6m3fuQo
         e32D1H0eWYQlJLYDio9B3sh5qC6gqL+CSmrfy6xHfMvW4qop1vxOHUYI91fBLyRqfyLT
         CjAoj0dbHBpJLgVEp5BtBnGgXN4GsudWK0+QnYwl2gtiZlj2LS7ImlZDmWIPYhlFfqjM
         kAZ9l2tgoXR45H20Ihs+D15L1qyAf1s0n/T789NO1B4Dd/19cCDXDRztn08V9pZCexiP
         P0AA==
X-Forwarded-Encrypted: i=1; AJvYcCVSIJxTj8rLRC+Qapm7EEv69IdBPwU2T224T/FBV+ZEkgQx0h6jKGzNwHL/yy5OucGHZZZYHYalxGU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHX/fwmdgVqgsra8lanRbXTb/5Ktlx4Ji0t4ANneMq84RTNc87
	+zoIjU1Cc9pmENISFYmZO96Loa1YBsWUaEEjYLyUljoNNv8394C97hMYJHRRAx3iDGE=
X-Gm-Gg: ASbGncvHQ5AHD5U7zD6krj2MbLjwljz1g010TaE/bhlcZ2YlRVKVgklR783RXK9pN69
	YEFb32S01udKVM0SHArldBHZMOAe3bEjLNylcrqohG9rDDIe8RTUmPJ4O76ZMyeWnzlGy1UbYwO
	VDMjXhC8BSnbu5pWvZO7H6E3KIEJX5AMU8EPnrBYJlhceSgElVflBYfkXGlRSEe5nplHayiLn0R
	QwBhn4BGszXROKyL4y0eKLKEwAPodVYzWg56LQ/3vLmXvUSjV5QQpLP1EvhGixVMpT1ePLytzIO
	rs8XocicXbGTL1zYwOSxaa+Mui8WMD6qOuuho6FNRw7Y3Mn8BXlFqvWhvknHMm930EZnv4zV6DC
	gYZ9z3udam0s3vfmV7xO34Kp3zfVBYlH5kUQcxDYpCSmHH++my+Bjgxzp8nBVG2RJCRCMKb8HaX
	md2AfHYnv4JIShE1EFO6/J42SrUPkiRt6JbuUCf/FTGKQWZSzL38ek6Q==
X-Google-Smtp-Source: AGHT+IGEnMVZZwNHPNq9S194krqfxY5EzZns/dSIyOWDta8DjbBG9k2g9N/EkMMC3EMX0Vm562Ebwg==
X-Received: by 2002:a05:6000:4305:b0:42b:3592:1b88 with SMTP id ffacd0b85a97d-42cc1d20dddmr11249650f8f.50.1763982430293;
        Mon, 24 Nov 2025 03:07:10 -0800 (PST)
Message-ID: <39f5f781-398b-4974-8b1e-e7061ed9194f@linaro.org>
Date: Mon, 24 Nov 2025 12:07:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/i386/isapc: Remove dead Xen code
Content-Language: en-US
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <eduardo@habkost.net>, xen-devel@lists.xenproject.org,
 Anthony PERARD <anthony@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20251123185832.53802-1-philmd@linaro.org>
 <066cb998-e89a-4cd1-a89b-865f4a6dcbbd@nutanix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <066cb998-e89a-4cd1-a89b-865f4a6dcbbd@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/11/25 11:27, Mark Cave-Ayland wrote:
> On 23/11/2025 18:58, Philippe Mathieu-Daudé wrote:
> 
>> We don't use Xen on the isapc machine: let's remove
>> pointless code.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/i386/isapc.c | 27 ++++-----------------------
>>   1 file changed, 4 insertions(+), 23 deletions(-)
>>
>> diff --git a/hw/i386/isapc.c b/hw/i386/isapc.c
>> index 1ba9ae22cc3..1e13a30c505 100644
>> --- a/hw/i386/isapc.c
>> +++ b/hw/i386/isapc.c
>> @@ -17,8 +17,6 @@
>>   #include "hw/ide/ide-bus.h"
>>   #include "system/kvm.h"
>>   #include "hw/i386/kvm/clock.h"
>> -#include "hw/xen/xen-x86.h"
>> -#include "system/xen.h"
>>   #include "hw/rtc/mc146818rtc.h"
>>   #include "target/i386/cpu.h"
>> @@ -37,7 +35,6 @@ static void pc_init_isa(MachineState *machine)
>>       ISABus *isa_bus;
>>       uint32_t irq;
>>       GSIState *gsi_state;
>> -    MemoryRegion *ram_memory;
>>       DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
>>       int i;
>> @@ -77,15 +74,9 @@ static void pc_init_isa(MachineState *machine)
>>       /*
>>        * There is no RAM split for the isapc machine
>>        */
>> -    if (xen_enabled()) {
>> -        xen_hvm_init_pc(pcms, &ram_memory);
>> -    } else {
>> -        ram_memory = machine->ram;
>> -
>> -        pcms->max_ram_below_4g = 3.5 * GiB;
>> -        x86ms->above_4g_mem_size = 0;
>> -        x86ms->below_4g_mem_size = machine->ram_size;
>> -    }
>> +    pcms->max_ram_below_4g = 3.5 * GiB;
>> +    x86ms->above_4g_mem_size = 0;
>> +    x86ms->below_4g_mem_size = machine->ram_size;
>>       x86_cpus_init(x86ms, pcmc->default_cpu_version);
>> @@ -94,17 +85,7 @@ static void pc_init_isa(MachineState *machine)
>>       }
>>       /* allocate ram and load rom/bios */
>> -    if (!xen_enabled()) {
>> -        pc_memory_init(pcms, system_memory, system_memory, 0);
>> -    } else {
>> -        assert(machine->ram_size == x86ms->below_4g_mem_size +
>> -                                    x86ms->above_4g_mem_size);
>> -
>> -        if (machine->kernel_filename != NULL) {
>> -            /* For xen HVM direct kernel boot, load linux here */
>> -            xen_load_linux(pcms);
>> -        }
>> -    }
>> +    pc_memory_init(pcms, system_memory, system_memory, 0);
>>       gsi_state = pc_gsi_create(&x86ms->gsi, false);
> 
> FWIW I did contact upstream about this (see https://patchew.org/ 
> QEMU/20250618112828.235087-1- 
> mark.caveayland@nutanix.com/20250618112828.235087-13- 
> mark.caveayland@nutanix.com/#91b96b24-af60-4a89-91ec- 
> d0e660a76a0a@nutanix.com) and they mentioned that it should work, which 
> is why I left it in.
> 
> Unfortunately I don't currently have any way to test it here :/

OK :| IMHO upstream Xen maintainers should provide us a test, otherwise
we can not make our code base evolve.

