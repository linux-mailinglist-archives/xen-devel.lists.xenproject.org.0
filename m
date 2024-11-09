Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E0D9C2E57
	for <lists+xen-devel@lfdr.de>; Sat,  9 Nov 2024 17:00:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833142.1248369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9nrS-0004qb-Le; Sat, 09 Nov 2024 15:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833142.1248369; Sat, 09 Nov 2024 15:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9nrS-0004pA-HU; Sat, 09 Nov 2024 15:58:54 +0000
Received: by outflank-mailman (input) for mailman id 833142;
 Sat, 09 Nov 2024 15:58:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1MTz=SE=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1t9nrQ-0004p4-MH
 for xen-devel@lists.xenproject.org; Sat, 09 Nov 2024 15:58:52 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81afb6d7-9eb3-11ef-a0c6-8be0dac302b0;
 Sat, 09 Nov 2024 16:58:48 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4316e9f4a40so26737795e9.2
 for <xen-devel@lists.xenproject.org>; Sat, 09 Nov 2024 07:58:48 -0800 (PST)
Received: from [192.168.3.213] (73.red-95-127-47.staticip.rima-tde.net.
 [95.127.47.73]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b05e5f77sm112739325e9.43.2024.11.09.07.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Nov 2024 07:58:47 -0800 (PST)
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
X-Inumbo-ID: 81afb6d7-9eb3-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMjkiLCJoZWxvIjoibWFpbC13bTEteDMyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjgxYWZiNmQ3LTllYjMtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMTY3OTI4Ljc2MDY4OSwic2VuZGVyIjoicGhpbG1kQGxpbmFyby5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731167928; x=1731772728; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O5QJBE+exSNEWl13piD/ZWc/zu8Q994F5xC83jXETjo=;
        b=Q6klVlkItgkbr1haRwhqXTzP0/SPTwVZXlHb8140a1whgVvcH7oBZxJye+xW+wjoOI
         XkaT738AAwdOJAkAzxkmGF/4QEDz0mEP/mEZBSRw0WIDMwo6tdx3QW6vgocnyCltU9zD
         RYwPNMp2iFiBrJxHQ/fmWE8EPP1ndY6gXG8i2LGlU9Z7pr+I8eYDPPaCkvN0mIIBri+I
         YtMMv76BKWzwZUnoer3KehIg9u/WfvIhcDszWRwzKcOUtoYyVfAOzpMYrG9FOWrRg9sx
         oclFk/CrTlho39qX6UtH3e23SCa4TUruu5w1/BpnCnYQwJVrx1/0yZcFxlswtVNBHTMa
         ZMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731167928; x=1731772728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O5QJBE+exSNEWl13piD/ZWc/zu8Q994F5xC83jXETjo=;
        b=vC/qLmOBEVng31TUuWBe+PYH2sxK1Ns/h8Ikotque9WJJvEeV9A2QIt0Ihi6e4sf0V
         4oBiNNtl6uS9wt4f2l7YZoRr7kyDYFiih111oCIqZ279XjnNwXaBuxFnDcFyZbnoEOlo
         xZ/bi2bf8zD35f65eC+57nUP5EBriRrxvCKXcPE+9tb5I1dnMLdkJjC3H243iZZGPeOS
         PHPOBIKzlsiG3x1qGE/XNc9BXx6ec0Ws9IB1MMDSWAjIhmiF8SHGD26w8XoNJcCisbGX
         VhIwrCs/FHtvKrwuCeGUSVDNc7Rto+6susjlbu2OmpUXDPMYrkgnyfyt5I9AFiUO6dIS
         /eug==
X-Forwarded-Encrypted: i=1; AJvYcCXxyqIgESx8oGYY8GHhvgFuuIBFetfVa6g8C9rW0aXLvog0Q4/VsvlDI+4uQu9K9xTCmXX3h/Jl0IM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNAkpf3qutSv1Ue3P94drTX942bwQtGTU3nke6R/Yet+AO7vXh
	yfr260Db+c2bXSMWTN1ks5C4+CL3SNmKrqvCVKNegp+nshGX3DguEmrT8vxi0tU=
X-Google-Smtp-Source: AGHT+IEdF64Da16/injPEnNM4CGcXvREr92TI2x4tU2BHjXMu8nVHZ2fJ3gn9VKceL1Nt+6kSIG1bA==
X-Received: by 2002:a05:600c:4590:b0:42c:b4f2:7c30 with SMTP id 5b1f17b1804b1-432b7515c33mr55770805e9.23.1731167927842;
        Sat, 09 Nov 2024 07:58:47 -0800 (PST)
Message-ID: <84046f49-a39f-4639-a383-fa3c4a97e17a@linaro.org>
Date: Sat, 9 Nov 2024 16:58:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] hw/openrisc: Mark devices as big-endian
To: Thomas Huth <huth@tuxfamily.org>
Cc: qemu-devel@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anthony PERARD <anthony@xenproject.org>,
 Eduardo Habkost <eduardo@habkost.net>, Jia Liu <proljc@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20241106184612.71897-1-philmd@linaro.org>
 <20241106184612.71897-5-philmd@linaro.org> <20241109074225.76e0e4ad@tpx1>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241109074225.76e0e4ad@tpx1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas,

On 9/11/24 06:42, Thomas Huth wrote:
> Am Wed,  6 Nov 2024 18:46:11 +0000
> schrieb Philippe Mathieu-Daudé <philmd@linaro.org>:
> 
>> These devices are only used by the OpenRISC target, which is
>> only built as big-endian. Therefore the DEVICE_NATIVE_ENDIAN
>> definition expand to DEVICE_BIG_ENDIAN (besides, the
>> DEVICE_LITTLE_ENDIAN case isn't tested). Simplify directly
>> using DEVICE_BIG_ENDIAN.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/openrisc/openrisc_sim.c | 2 +-
>>   hw/openrisc/virt.c         | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)


>> diff --git a/hw/openrisc/virt.c b/hw/openrisc/virt.c
>> index 47d2c9bd3c..ede57fe391 100644
>> --- a/hw/openrisc/virt.c
>> +++ b/hw/openrisc/virt.c
>> @@ -236,7 +236,7 @@ static void openrisc_virt_serial_init(OR1KVirtState *state, hwaddr base,
>>       qemu_irq serial_irq = get_per_cpu_irq(cpus, num_cpus, irq_pin);
>>   
>>       serial_mm_init(get_system_memory(), base, 0, serial_irq, 115200,
>> -                   serial_hd(0), DEVICE_NATIVE_ENDIAN);
>> +                   serial_hd(0), DEVICE_BIG_ENDIAN);
>>   
>>       /* Add device tree node for serial. */
>>       nodename = g_strdup_printf("/serial@%" HWADDR_PRIx, base);
> 
> According to https://openrisc.io/or1k.html the openrisc CPU could be
> implemented as little endian, too ... so would it make sense to use
> a runtime detected value here instead?

While this patch is a code change, it aims to not introduce any
functional change. We are not building (nor testing) these devices
in a little endian configuration:

$ git grep -l TARGET_BIG_ENDIAN configs/targets/*softmmu*
configs/targets/hppa-softmmu.mak
configs/targets/m68k-softmmu.mak
configs/targets/microblaze-softmmu.mak
configs/targets/mips-softmmu.mak
configs/targets/mips64-softmmu.mak
configs/targets/or1k-softmmu.mak
                 ^^^^
configs/targets/ppc-softmmu.mak
configs/targets/ppc64-softmmu.mak
configs/targets/s390x-softmmu.mak
configs/targets/sh4eb-softmmu.mak
configs/targets/sparc-softmmu.mak
configs/targets/sparc64-softmmu.mak
configs/targets/xtensaeb-softmmu.mak

$ git grep -L TARGET_BIG_ENDIAN configs/targets/*softmmu*
configs/targets/aarch64-softmmu.mak
configs/targets/alpha-softmmu.mak
configs/targets/arm-softmmu.mak
configs/targets/avr-softmmu.mak
configs/targets/i386-softmmu.mak
configs/targets/loongarch64-softmmu.mak
configs/targets/microblazeel-softmmu.mak
configs/targets/mips64el-softmmu.mak
configs/targets/mipsel-softmmu.mak
configs/targets/riscv32-softmmu.mak
configs/targets/riscv64-softmmu.mak
configs/targets/rx-softmmu.mak
configs/targets/sh4-softmmu.mak
configs/targets/tricore-softmmu.mak
configs/targets/x86_64-softmmu.mak
configs/targets/xtensa-softmmu.mak

(no little-endian config here)

Having little-endian OpenRISC is certainly welcomed, but it
has to be done separately, preferably adding test coverage.

Should I rework the commit description to be more precise?

Regards,

Phil.


