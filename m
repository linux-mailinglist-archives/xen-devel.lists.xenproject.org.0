Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BCE7F40A6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 09:56:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638536.995186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5j18-0002at-RL; Wed, 22 Nov 2023 08:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638536.995186; Wed, 22 Nov 2023 08:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5j18-0002Z1-Nv; Wed, 22 Nov 2023 08:55:30 +0000
Received: by outflank-mailman (input) for mailman id 638536;
 Wed, 22 Nov 2023 08:55:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q+k4=HD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5j17-0002Yv-1V
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 08:55:29 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1059dee-8914-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 09:55:26 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40b31232bf0so3715155e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 00:55:26 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 fj9-20020a05600c0c8900b00407b93d8085sm1504562wmb.27.2023.11.22.00.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 00:55:25 -0800 (PST)
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
X-Inumbo-ID: e1059dee-8914-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700643326; x=1701248126; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7RlEWLScUoeK3Cjh4QWmJ4FGF97MM4VI1Hm8l1IB030=;
        b=BznRMLVQYnz5P5AQxCf8hDW/DLinpSSZTfYvYhNseCESekaXbqSVopK0HiXuwUgL/J
         gX+tqWfBs4DEzKdSqFkzEaHA334uf/Tdz59NA29io1QlSK0Bf5bZnmBfN1uyTCFz98it
         4/0IM4c1PiDU2fSB/xweKl2kG7zWJ4dl+yRcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700643326; x=1701248126;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RlEWLScUoeK3Cjh4QWmJ4FGF97MM4VI1Hm8l1IB030=;
        b=X0vP2WGXnjm9sJl5MLmLgLgqtp+erF4B2/PDqJR//AwnURfMi0vv3KPXIQB21S8XRL
         qTG+w7LGEDbY1E1MFVnlk8nsKTjoA9MQTqP+88GVhXAUqPglZYIoebNW9CQk3IdBwwp+
         h2OmKQIXGYIyZxvMioNKliEvH+vmiXSL3noJQtLNm5nF8f4kkZeERpPIMJdfe+jaj2p5
         JMXZr/S83AM6L1pLdiUrGnwYQC/0ABbqDeWWqNwOtkh0KsodCGoot1w5eY6/+82R5Ct+
         N5CEYND2AeRxdSWaXl3MDCZ0wrj6OLiCfHjUpcQfVlLmSQU6kjGY6T4gNjlfR6gaPL+e
         di3w==
X-Gm-Message-State: AOJu0YylruBzdMGnP9sL+6Ryi6kHT9rVMTjj3CpgoDpDYPDNQWOgh8kP
	YX3ubLEak0rgAflNazOxOi5gBw==
X-Google-Smtp-Source: AGHT+IG1SJLi/CqLoMMcZ0MRHHmtawwPkGQsqM+t68piahTUAfUg87UmRrAbSlNaXqmBG1E/wIAS1w==
X-Received: by 2002:a05:600c:158a:b0:409:19a0:d26f with SMTP id r10-20020a05600c158a00b0040919a0d26fmr1215686wmf.23.1700643325845;
        Wed, 22 Nov 2023 00:55:25 -0800 (PST)
Message-ID: <61834620-3831-41fe-b870-00e80cf4697e@citrix.com>
Date: Wed, 22 Nov 2023 08:55:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm/efi: Simplify efi_arch_handle_cmdline()
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
 <20231121201540.1528161-5-andrew.cooper3@citrix.com>
 <379DF4D1-8DB9-46AF-9586-861ED78DFF38@arm.com>
 <03c6aa83-6c8f-4d40-9f36-d89725bd614b@citrix.com>
 <FEF56E45-6A0E-4B04-A7E1-CC753A9ED7BF@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <FEF56E45-6A0E-4B04-A7E1-CC753A9ED7BF@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/11/2023 1:31 am, Henry Wang wrote:
> Hi Both,
>
>> On Nov 22, 2023, at 04:41, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 21/11/2023 8:33 pm, Luca Fancellu wrote:
>>> + CC henry
>>>
>>>> On 21 Nov 2023, at 20:15, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>>
>>>> -Wwrite-strings is unhappy with assigning "xen" to a mutable pointer, but this
>>>> logic looks incorrect.  It was inherited from the x86 side, where the logic
>>>> was redundant and has now been removed.
>>>>
>>>> In the ARM case it inserts the image name into "xen,xen-bootargs" and there is
>>>> no logic at all to strip this before parsing it as the command line.
>>>>
>>>> The absence of any logic to strip an image name suggests that it shouldn't
>>>> exist there, or having a Xen image named e.g. "hmp-unsafe" in the filesystem
>>>> is going to lead to some unexpected behaviour on boot.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>> CC: Wei Liu <wl@xen.org>
>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>> CC: Julien Grall <julien@xen.org>
>>>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>>>> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
>>>> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>
>>>> v2:
>>>> * New.
>>>>
>>>> I'm afraid that all of this reasoning is based on reading the source code.  I
>>>> don't have any way to try this out in a real ARM UEFI environment.
>>> I will test this one tomorrow on an arm board
>> Thanks.  I have a sneaking suspicion that:
>>
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 9b9018574919..8bca5b9a1523 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -46,6 +46,12 @@
>>  #include <xsm/xsm.h>
>>  #include <asm/acpi.h>
>>  
>> +static int __init parse_ucode(const char *s)
>> +{
>> +    panic("Xen image name interpreted as a cmdline parameter\n");
>> +}
>> +custom_param("xen.efi", parse_xen);
>> +
>>  struct bootinfo __initdata bootinfo;
>>  
>>  /*
>>
>> will trigger.
> I saw I am CCed for this patch, so I think I am now going to throw this series
> to our CI and see if it explodes. Do you want me to also include above hunk?

Depends - up to you.  It needs tailoring for the name of the Xen binary
used, if it doesn't end up as a plain "xen.efi".

And to be more specific, it ought to trigger before this patch but cease
triggering after it.

It's probably better suited to a manual dev test in a real ARM UEFI
environment.

~Andrew

