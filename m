Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2D2A39D3F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 14:20:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891406.1300451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkNWg-0007c9-Tt; Tue, 18 Feb 2025 13:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891406.1300451; Tue, 18 Feb 2025 13:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkNWg-0007Zt-RG; Tue, 18 Feb 2025 13:20:38 +0000
Received: by outflank-mailman (input) for mailman id 891406;
 Tue, 18 Feb 2025 13:20:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vlVU=VJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tkNWf-0007Zf-6C
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 13:20:37 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22fba048-edfb-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 14:20:35 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38f3486062eso2419284f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 05:20:35 -0800 (PST)
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b824dsm181005315e9.34.2025.02.18.05.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 05:20:33 -0800 (PST)
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
X-Inumbo-ID: 22fba048-edfb-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739884835; x=1740489635; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vC3MmtES1R3kkG1nVWHLeiRBuKWybO9xGwH1FF01u2M=;
        b=kXhLxT61ufRgXYjPYO/PEFOrRSdiaa7MdsC5LxeGKvYVzw5LpX3ehUWWVVdy2ojZll
         r1QP80//bWejAdHCyVFAcbjaFclYoS+rA6Tq15RUoi8DMAjGVZT7UCYdEhEb23iGKPMi
         DBWfrMwQ5ErM2L1CtvfFmPiCurNYdyCWQHpJF2G9CF6I39pN5IWLeoOPugLDoOVDSrM4
         kSLaNTFaC0yXXD8CB1SM9QDPDDiMMpQqzkI7AfLDsp4n/nSkrFyd7Vq90Pm0hVaYB3Mb
         L31cwO5ymXcMisPsDn3yki7WUo1NT2AyhwSPdzTSKmDlbrQzd3DIxXagCbl0cD92hE74
         PqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739884835; x=1740489635;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vC3MmtES1R3kkG1nVWHLeiRBuKWybO9xGwH1FF01u2M=;
        b=vF2OivuVrqudQ9bWYfE927UeRd8xHOS0zUnSYjKgcpuA/MNl5K/IC5lCAdV2jmwKpK
         zaG/2aexd1xr0CCaN2Ea0XHQXfJsuOUoS1mw0z37bTzFJ6PJITKhbAbW+RUBLl53cAaM
         Q/dDVVwcZRaOjZuvrNloihTQzlJyzxfq4/KV96KuQO/3ilyaRdKsWXYnYK0U2zwAruKV
         21MkJ5ljs3wPYd+VAQ2sA0mwJmSeJbriuBCBentN8wP5rFXb0HAcnnF6tcWnfvJ91qF+
         BTnW+HIo9lO8SkDSLKWIyrCk8tfW9DXNyCi51sKeIxfyuKB7uu6pQZDRbwwgWzGLSCcw
         O2rw==
X-Forwarded-Encrypted: i=1; AJvYcCUDkmj8K0FtG1N08lkicRexBfJVat1j4ljEI0nE7Q5lH57Y/EVyoTlKeCDVXT9LSbj4ZGoeVkNw+SE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaMuIctY/oRXV/n4BFdGTX/u9B28PspaQ2mKEJK7GYGP3GqQBx
	atV11V6go63IiENEJ7fWQ3LQQkPxd1g1alv/XmnLdnAQvQJEZqlHKyMasCpDBXE=
X-Gm-Gg: ASbGncuviMSMT6+V1Tg+J1izIyBE/nfiZmM6LEUYxeBhkmt8OY7i3Hl4uRJVjW1Ni44
	g3Hywo2dGohzrzSOf/EicDoDiXtLbUEfC0s98VWocvmcLq9nfJywRQuau2Ib3IlXzCIOHOR3AiZ
	4xydSYjO3XR+YC8PbCOJL/PyJS07W4TvKjtIe8L/PwkEitBK7LwPCU1S7D1gAgQEwt6ek3obkm0
	SPlqjiEIeE+LYpFicPgPYTr1bgFHjOZQvzrKy4YN+SuDTUeNU3y5XJF+h0q8GVhyqb3hOkNAJvu
	tTlL4MmhFzAdUUvVN29NLvLnWi4T5/JQ/1RNeXdu4dVW/pVIb+suvgB/CoM=
X-Google-Smtp-Source: AGHT+IForCtadydOvVhTNjd9ECIey58DSMhrG0QgWU5N7F/lu9Reb+pwn3DxvYQ/N+/It+4SLbTErg==
X-Received: by 2002:a05:6000:156c:b0:38f:2ddd:a1bb with SMTP id ffacd0b85a97d-38f33f10603mr11940369f8f.8.1739884834689;
        Tue, 18 Feb 2025 05:20:34 -0800 (PST)
Message-ID: <2691328e-09db-496f-975a-c4f61e358f92@linaro.org>
Date: Tue, 18 Feb 2025 14:20:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 3/9] meson: Disallow 64-bit on 32-bit Xen emulation
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, David Woodhouse <dwmw2@infradead.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20250208205725.568631-1-richard.henderson@linaro.org>
 <20250208205725.568631-4-richard.henderson@linaro.org>
 <aeaf0f19-0f14-4a02-9c51-09521e7c75e1@linaro.org>
 <dc24cf43-b6a1-42b6-ac93-4128f2c03684@linaro.org>
Content-Language: en-US
In-Reply-To: <dc24cf43-b6a1-42b6-ac93-4128f2c03684@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/2/25 14:19, Philippe Mathieu-Daudé wrote:
> On 18/2/25 12:20, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> Adding Xen community.
>>
>> On 8/2/25 21:57, Richard Henderson wrote:
>>> Require a 64-bit host binary to spawn a 64-bit guest.
>>>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   meson.build | 9 +++++++--
>>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index 1af8aeb194..911955cfa8 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -304,9 +304,14 @@ else
>>>   endif
>>>   accelerator_targets = { 'CONFIG_KVM': kvm_targets }
>>> -if cpu in ['x86', 'x86_64']
>>> +if cpu == 'x86'
>>> +  xen_targets = ['i386-softmmu']
>>> +elif cpu == 'x86_64'
>>>     xen_targets = ['i386-softmmu', 'x86_64-softmmu']
>>> -elif cpu in ['arm', 'aarch64']
>>> +elif cpu == 'arm'
>>> +  # i386 emulator provides xenpv machine type for multiple 
>>> architectures
>>> +  xen_targets = ['i386-softmmu']
>>
>> Is actually someone *testing* this config? I'm having hard time building
>> it, so am very suspicious about how it runs, and start to wonder if I'm
>> not just wasting my time (as could be our CI).
> 
> This config is not tested and not functional. I'll post a patch
> removing it.

(thus no need to follow the deprecation policy).

> 
>>
>>> +elif cpu == 'aarch64'
>>>     # i386 emulator provides xenpv machine type for multiple 
>>> architectures
>>>     xen_targets = ['i386-softmmu', 'x86_64-softmmu', 'aarch64-softmmu']
>>>   else
>>
>> Regards,
>>
>> Phil.
>>
> 


