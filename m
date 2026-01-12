Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF45D142EE
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 17:54:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200808.1516646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfLAn-0005m3-C5; Mon, 12 Jan 2026 16:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200808.1516646; Mon, 12 Jan 2026 16:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfLAn-0005jh-8I; Mon, 12 Jan 2026 16:53:45 +0000
Received: by outflank-mailman (input) for mailman id 1200808;
 Mon, 12 Jan 2026 16:53:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g/6n=7R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vfLAl-0005jb-Kz
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 16:53:43 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c0795ee-efd7-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 17:53:35 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-64d30dc4ed7so12944776a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 08:53:35 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b8c4454sm18295706a12.3.2026.01.12.08.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 08:53:34 -0800 (PST)
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
X-Inumbo-ID: 3c0795ee-efd7-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768236815; x=1768841615; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TFrzOfuWuR3wvKFK6Eo3qR7ND40QowhwHk3UwhZm65o=;
        b=i1xrYZUn6ajImJhWi6D7I4WE+RRRSYJ+BOUyZ8L7d06aZgkV10xRaoGMg6F+wBhaqf
         MFeYaaXJJW2RHFBSe0an7RPiRKSImIskbeaPQZ86QKZZM4q5PX/FH2lcXCs27Tnu5/ew
         q/WsRw7zrX5CNtG1I0ptFyn2m/0BcIScACXbRg1G5YMUzUZcE/e2TvC9UhntSRDhWbZQ
         XIW3ZM3IJTQzwipQXUHXR16v3ShyDuQO0x0xlgTF0I9IhpljykeyrAJSFjl5qVekUGn+
         nWTnBiQgVmFjtdEz0kKWrldqM/w3aR2hDWl2I1tC+7jUzmPuL568RGEOiYGb7Il8CExf
         s7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768236815; x=1768841615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFrzOfuWuR3wvKFK6Eo3qR7ND40QowhwHk3UwhZm65o=;
        b=RlXqqYugmGdFsjb5MOYqAWfD3YWsoVoLMWJp02A0q5j8fS1Q53WttREomuDafBy5Yl
         IIfXL7tIK56tjuS/payKBW74E8PgEw+ADcxwNh/k7/k2rb2nl4dnw27Ps/IsGkYWfkmf
         KaInGbQXC2lVunBzn1tMJA3GTAeqSB5R4U+NaP8eVZKlRAdEIs7FJ3NCFoUBHcgTAR45
         amdHtc61TERUWRZTR/j2oStj18MoCw65egIqmQAwNEadzppbR7ZRQAoaKSVgr8lm0gXf
         sYyXMyjWdyYhVifZwql0gz/dw3ey1OmiDc2wRtREvtx1ypbs0Xl7D0+6QSTTabOjzU7c
         p3iA==
X-Forwarded-Encrypted: i=1; AJvYcCW6mhcQHWWcUchEU83KKRhpz4Oxry4gUTu25FqExWzVQOF5MkQjLsAgfzarovjKOyDFiJ1Wyd568HQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0n2IbE5fWa+2YBz4grYGKWsN5QLj4wgAXK8rHVzQMg/Adkie9
	dsEqaTf3Nk6BUQVRMDjBU8B4g44Mdq9ci+szm43B8jA28DQ0JSI1G8Ok
X-Gm-Gg: AY/fxX4ynETMmuNayMtQdEEJAwUdO8ojgh2E2Wr/UeD+RUyS9n9KX7Kl8aQw2/Yq5PJ
	i1o3OD88+wSZVKWYQ0O+4mbOft6oqBLdo8XqaJomNhGa+XAfXCOmt2dj6sieiCXsADmhHmTmcrS
	odieBJKPi+u4Y7XgHDp5LzWcNqWdqxdy3/sG7/3/Zutd9qBkYmGjd3nnNUGDgN9SzDV7aNZ7/PM
	eGoOZYLx+d1MNGRERU9gTMTl3UXVrbr9JmilC6MydJ8uv8PgdQTl23LpFhOpC6qq7KOBRXaCS46
	ZmUc+rW0NL8ZXCpeuWSz5DHBhozYj15FZ/rZvdN2UrhjFT+j058ydY5737wAE5dLR7D9BhoNkkh
	F6ASNUpT156P/3dIvRyDjllQjm4jDiWfu72y7MAowHyQLpZ3P/P5JuUBMTeCrmDV+OZU2N840o8
	ykDKhK2KfzN/xyvkSMsNBaxehvbDsAOH0hIn6Qg8F2SO2pNifMsmdNKbTxE0IxiVo=
X-Google-Smtp-Source: AGHT+IE57ZREPJoTg+Fk7nuAJg5v8ePwSfUd62260AhHEQWuEEELGY378zBqu8v3buCpmQ8W8m38rA==
X-Received: by 2002:a05:6402:42c7:b0:64d:498b:aeec with SMTP id 4fb4d7f45d1cf-65097df8139mr18519113a12.12.1768236814639;
        Mon, 12 Jan 2026 08:53:34 -0800 (PST)
Message-ID: <94c0cd09-7aaa-4ae1-913e-57d883916682@gmail.com>
Date: Mon, 12 Jan 2026 17:53:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/15] xen/riscv: implement stub for
 smp_send_event_check_mask()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <837c863f5995cc4371e82b481211b053656ec7e7.1766595589.git.oleksii.kurochko@gmail.com>
 <319e6162-7a5b-4030-ae9f-a86a48e73605@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <319e6162-7a5b-4030-ae9f-a86a48e73605@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/7/26 4:47 PM, Jan Beulich wrote:
> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/smp.c
>> +++ b/xen/arch/riscv/smp.c
>> @@ -1,3 +1,4 @@
>> +#include <xen/cpumask.h>
>>   #include <xen/smp.h>
>>   
>>   /*
>> @@ -13,3 +14,10 @@
>>   struct pcpu_info pcpu_info[NR_CPUS] = { [0 ... NR_CPUS - 1] = {
>>       .processor_id = NR_CPUS,
>>   }};
>> +
>> +void smp_send_event_check_mask(const cpumask_t *mask)
>> +{
>> +#if CONFIG_NR_CPUS > 1
>> +# error "smp_send_event_check_mask() unimplemented"
>> +#endif
>> +}
> CONFIG_NR_CPUS is 64 by default for 64-bit arch-es, from all I can tell, also
> for RISC-V. And there's no "override" in riscv64_defconfig. How is the above
> going to work in CI? Then again I must be overlooking something, as the config
> used in CI has CONFIG_NR_CPUS=1. Just that I can't tell why that is.

It is 1 because of the defintion of NR_CPUS in KConfig:
config NR_CPUS
	int "Maximum number of CPUs"
	range 1 1 if ARM && MPU
	range 1 16383
         .... ( all other range props are condtional and there is no RISC-V in dependency)
so for RISC-V "range 1 16383" used and CONFIG_NR_CPUS is set to the minimal of this range,
so it is 1.

>
> And no, I'm not meaning to ask that you override NR_CPUS (and wherever such an
> override would live, I think it would better be dropped rather sooner than
> later). Instead an option may be this:
>
> void smp_send_event_check_mask(const cpumask_t *mask)
> {
> #if CONFIG_NR_CPUS > 1
>      BUG_ON(!cpumask_subset(mask, cpumask_of(0)));
> #endif
> }
>
> (I can't tell off the top of my head whether an empty mask may be passed to this
> function. If not, cpumask_equal() could be used as well.)

I will double-check. Thanks for such hint.

>
> Of course the #if may then not be necessary at all, and a TODO comment may want
> putting there instead.

With suggested above approach, I think it isn't really needed to use #if.

Thanks!

~ Oleksii


