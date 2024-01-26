Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 139E583E3B4
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 22:11:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672513.1046608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTTTr-0007l5-Pd; Fri, 26 Jan 2024 21:11:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672513.1046608; Fri, 26 Jan 2024 21:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTTTr-0007jD-MH; Fri, 26 Jan 2024 21:11:19 +0000
Received: by outflank-mailman (input) for mailman id 672513;
 Fri, 26 Jan 2024 21:11:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HlWE=JE=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rTTTq-0007hw-Cl
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 21:11:18 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7123a7ef-bc8f-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 22:11:16 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40ee705e9bfso10502855e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 13:11:16 -0800 (PST)
Received: from [192.168.69.100] ([176.176.142.39])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a05600c348500b0040e48abec33sm6615547wmq.45.2024.01.26.13.11.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 13:11:15 -0800 (PST)
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
X-Inumbo-ID: 7123a7ef-bc8f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706303475; x=1706908275; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vxYwthXZn31ySjM2DeVKX29v0Ws6VePUGUeM9gtZWoA=;
        b=GSoUSj8T1aBRiF9e2CvAatPw2WojACTqmouvFFg1M002NzHUzJEIQ6Is4oAAdNsw2z
         VbaJyEbFvH3Gx2/wuifgdpklCDjzd2Q4SH0yc4tpRl/nr92htveNsogtambrSxcc1cXf
         eWfT15bUni27mBKppgm2ftx8w24lujOzrgA1R2cLXYG6EqEekdP6Uag+Ow8oycawg487
         cRZL/ADXbTBVGq/S7ZIdLHnIteUHrNWy9nU8jcuQcnqqnvVSW/Kn1oZPcYP3fhno2hNZ
         lnnMNiD1Y5EfCC6as9E5QPFVaTgOsx6RUGaG2FamdQRA0YBh/xLMzWMLQpepNS+hwtrp
         YP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706303475; x=1706908275;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vxYwthXZn31ySjM2DeVKX29v0Ws6VePUGUeM9gtZWoA=;
        b=L6Pqkk+YnIueVhL1yGiXCoGTGA/23BVrIlSZrOTeuGKVpClF7qnb+zn4GhPyOtvmUD
         VPwTfFeDXkvs2yiRiGDrmrcDBzgHhok92kD9hAYB3UFOg/0IgdcUalfXQES7Fao6gZTt
         Y4nyXJvopqqoEFha6fZx7iALBoKhjVSPcTZrvRaOCq2S2MrVhuwiuJXA82OtLJZlONtX
         AU3BpL7a1L7jzEa+mm+VBjqxrBG2I7n0RTTaZXq1dvxADwacJy/VEyHMS1VlomlOmGTa
         I2s9IIGqNGKhkVj3NWKnX+OTJF4Ekno21GXKnRNqV3TMsgsn5bWyx3gT/DYxQXkhN8kc
         54Fw==
X-Gm-Message-State: AOJu0YyY7s/ylXGFJ3kQ3zOcgx6PWwQfNR6590m6wI2Y0eDGnpF4CAvt
	Y69WxKN/UYoFSTi6lM+094N7uf4ETwr2hjrpcpzLb582kW1vWWIYZNdOVYFgnJY=
X-Google-Smtp-Source: AGHT+IHPfVDNkHfFEZ920e1AvtHAgCTjycghkqkwfmMNm/uoHYkWmbEXdBjZ/pk1I5xFKz0+SjDwuw==
X-Received: by 2002:a05:600c:4ca7:b0:40e:5534:728c with SMTP id g39-20020a05600c4ca700b0040e5534728cmr286415wmp.136.1706303475465;
        Fri, 26 Jan 2024 13:11:15 -0800 (PST)
Message-ID: <c4c07c69-11c6-4883-8ff8-1e5ec627d9bc@linaro.org>
Date: Fri, 26 Jan 2024 22:11:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] bulk: Prefer fast cpu_env() over slower CPU QOM cast
 macro
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?=
 <fbarrat@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Alexander Graf
 <agraf@csgraf.de>, Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, Laurent Vivier <laurent@vivier.eu>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Stafford Horne <shorne@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org
References: <20240125165648.49898-1-philmd@linaro.org>
 <20240125165648.49898-3-philmd@linaro.org>
 <135941df-2f8b-4fd5-91c7-40b413e6eae3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <135941df-2f8b-4fd5-91c7-40b413e6eae3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/1/24 18:09, Thomas Huth wrote:
> On 25/01/2024 17.56, Philippe Mathieu-Daudé wrote:
>> Mechanical patch produced running the command documented
>> in scripts/coccinelle/cpu_env.cocci_template header.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---

>>   114 files changed, 273 insertions(+), 548 deletions(-)
> 
> A huge patch ... I wonder whether it would make sense to split it up by 
> target architecture to ease the review?
> 
> ...
>> diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
>> index a8d014d09a..eb0613bfbe 100644
>> --- a/hw/i386/vmmouse.c
>> +++ b/hw/i386/vmmouse.c
>> @@ -74,8 +74,7 @@ struct VMMouseState {
>>   static void vmmouse_get_data(uint32_t *data)
>>   {
>> -    X86CPU *cpu = X86_CPU(current_cpu);
>> -    CPUX86State *env = &cpu->env;
>> +    CPUX86State *env = cpu_env(CPU(current_cpu));
> 
> No need for the CPU() cast here, current_cpu is already
> of type "CPUState *".

Yes, Paolo noticed and I fixed for v2.

> I'll stop here, please respin with the cpu_env(CPU(current_cpu)) fixed to
> cpu_env(current_cpu), and please split the patch by target CPU types.

Well I don't know, this is an reproducible mechanical patch..
But indeed as Paolo you found an optimization so worth not making
human review a pain.

I was about to post v2 but I'll see how to split.

Thanks for the review!

Phil.

