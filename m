Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE47A3BED6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 13:54:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892872.1301817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjap-0005hD-Ha; Wed, 19 Feb 2025 12:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892872.1301817; Wed, 19 Feb 2025 12:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjap-0005et-EA; Wed, 19 Feb 2025 12:54:23 +0000
Received: by outflank-mailman (input) for mailman id 892872;
 Wed, 19 Feb 2025 12:54:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVer=VK=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1tkjao-0005en-2E
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 12:54:22 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2080303-eec0-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 13:54:19 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-307bc125e2eso64140591fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 04:54:19 -0800 (PST)
Received: from [192.168.10.20] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309302c7477sm15555631fa.85.2025.02.19.04.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 04:54:18 -0800 (PST)
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
X-Inumbo-ID: a2080303-eec0-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739969659; x=1740574459; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kOwG4XJAMytdKClHhzBObOxRfesB510ILtAQ8R5Q4xI=;
        b=FcTfhDSVyGqvsP7RzGd6llWJ5EraOeN6mASUeJom0iqM/iHrS3sYZ8qmUrkrpv6Z24
         2m6E2bvA0lhwlaHyfJRpDRvAXDaSVEYGAQJIPyAsWIngQw4G4gE8HyfMBROAWaXJuM/z
         6pbJwkS37zsT7eSUUJA/KZ3raa2ujpsCAH9WenI5nVSLVh2xCQLOepZUSI7hDk2p4ADA
         T192vw+hihGCt2T2bBy6MkaCxymXdsM8ja4ruxrvlkCe2KylQU8uUtQyffMp6+wvJ79+
         MhiFIO8amlVR5HHBbOQ5C/byS+szFlWtFU0JmMXaJtqq7NCIaSw4ako3n8mZ405Z9gBW
         P2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739969659; x=1740574459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kOwG4XJAMytdKClHhzBObOxRfesB510ILtAQ8R5Q4xI=;
        b=XNNCvWpQ5w81yFeDFTCuc08rdyyZYLcf5B2pzNKpcOCvZQimaM0BXq4i6XlM4/dSjB
         ugnwleaKYmweCG8r2rGH9lr7dLxGCpAC/dDy5G0Bo5QMmVVEWXF1iVUcvgflNa/Df8AS
         vPynVVnRgYQ+gM6win+3IKnY53RVPsVOUdAI0oqp/eYb+YwFQSARKh0FezwYykcPOVgy
         KppFE31iBrcCEMaod/kEddb10NucZr6Ofv+x1mKo+j7HdEQ5iConWfDlMqKVeN7kDlnN
         15WmU6bF7Mb/JRzhsqlr3CfHgHe3cWf1c8kUXMprOwUFZxUv1bQxZ8TuBWNsXcxaPXDG
         ruRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGapyvBxHX0INT5t3WAG73J2EsFc+5gGebA3BnmP2FKpTKVb73RX4/v9ei1jC1rtBqh99pdHM5YAE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynfgnHZm7RcWjLTIun+jBf94F/Uz7pyA/EV0I5moJbXGJRx6j6
	XwLsvRlbCFLRmqC14M8gNLSNlkMN/n95jJLtbFDmhPkmbY+u572+
X-Gm-Gg: ASbGnctbJp7jMTV06anSCmWNyD80Q30q2aWX/ABFo0sdPVuTHXOa1dDHniWnosyAVuP
	7prUt1X4Pevm5ZCs28q0UxGL+xVVPg66g1Eu8FZ9P4bpsKz/SbT9tw8JAgn/osE2EzmnJ+W/Hto
	90fLV+KBrtCoPJ1YPEk/vvXgLzhObr4WDu7toviTO5Wbc11hgTJypO7QZoB2AYQ0X6V+tuz9AWr
	UpgdSJ0uUehq09d42VLyfeFDPxWCNUHeRPubGntJaI/3TG5y1XyeHngj8BrT4MRmpS3tVDOCULj
	3cc8tFMKSKFDwJAN
X-Google-Smtp-Source: AGHT+IG8xYoSoFCUBFfFSQegXYFEUZyOOa55Mc8FzFcDDpJgOHxV+UTmIomRHhrw8E07sQQf31ralw==
X-Received: by 2002:a2e:a0cf:0:b0:308:f6cf:362e with SMTP id 38308e7fff4ca-30927a578efmr54139471fa.4.1739969658484;
        Wed, 19 Feb 2025 04:54:18 -0800 (PST)
Message-ID: <924753a2-8abc-4d49-84f9-6f4677bf76f1@gmail.com>
Date: Wed, 19 Feb 2025 14:54:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] code style exercise: Drivers folder samples
To: Jan Beulich <jbeulich@suse.com>
Cc: Artem_Mygaiev@epam.com, Luca.Fancellu@arm.com, roger.pau@citrix.com,
 marmarek@invisiblethingslab.com, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250216102108.2665222-1-andr2000@gmail.com>
 <4f1fcad5-dd6c-471f-9496-023973fa8857@suse.com>
 <alpine.DEB.2.22.394.2502171833370.1085376@ubuntu-linux-20-04-desktop>
 <f6db4e23-8c6e-43a5-a90a-ea3526f88b23@suse.com>
 <26cfd51b-123f-48e7-9911-2c96b48abdfe@gmail.com>
 <f0a4af56-016f-4ea7-92a8-6f6f4a62809a@suse.com>
Content-Language: en-US
From: Oleksandr Andrushchenko <andr2000@gmail.com>
In-Reply-To: <f0a4af56-016f-4ea7-92a8-6f6f4a62809a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello, Jan!

On 19.02.25 14:49, Jan Beulich wrote:
> On 19.02.2025 13:43, Oleksandr Andrushchenko wrote:
>> Hello, Jan, Stefano!
>>
>> On 18.02.25 13:34, Jan Beulich wrote:
>>> On 18.02.2025 03:36, Stefano Stabellini wrote:
>>>> On Mon, 17 Feb 2025, Jan Beulich wrote:
>>>>> On 16.02.2025 11:21, Oleksandr Andrushchenko wrote:
>>>>>> 1. Const string arrays reformatting
>>>>>> In case the length of items change we might need to introduce a bigger
>>>>>> change wrt new formatting of unaffected lines
>>>>>> ==============================================================================
>>>>>>
>>>>>> --- a/xen/drivers/acpi/tables.c
>>>>>> +++ b/xen/drivers/acpi/tables.c
>>>>>> @@ -38,10 +38,10 @@
>>>>>> -static const char *__initdata
>>>>>> -mps_inti_flags_polarity[] = { "dfl", "high", "res", "low" };
>>>>>> -static const char *__initdata
>>>>>> -mps_inti_flags_trigger[] = { "dfl", "edge", "res", "level" };
>>>>>> +static const char *__initdata mps_inti_flags_polarity[] = { "dfl", "high",
>>>>>> +                                                            "res", "low" };
>>>>>> +static const char *__initdata mps_inti_flags_trigger[] = { "dfl", "edge", "res",
>>>>>>
>>>>>> --- a/xen/drivers/acpi/utilities/utglobal.c
>>>>>> +++ b/xen/drivers/acpi/utilities/utglobal.c
>>>>>>    static const char *const acpi_gbl_region_types[ACPI_NUM_PREDEFINED_REGIONS] = {
>>>>>> -	"SystemMemory",
>>>>>> -	"SystemIO",
>>>>>> -	"PCI_Config",
>>>>>> -	"EmbeddedControl",
>>>>>> -	"SMBus",
>>>>>> -	"CMOS",
>>>>>> -	"PCIBARTarget",
>>>>>> -	"DataTable"
>>>>>> +    "SystemMemory", "SystemIO", "PCI_Config",   "EmbeddedControl",
>>>>>> +    "SMBus",        "CMOS",     "PCIBARTarget", "DataTable"
>>>>>>    };
>>>>> Why in the world would a tool need to touch anything like the two examples
>>>>> above? My take is that the code is worse readability-wise afterwards.
>>>> I think the output is acceptable: not necessarily better than before,
>>>> but also not significantly worse.
>>> Hmm, for the change to xen/drivers/acpi/tables.c I wouldn't agree with this
>>> statement. And for xen/drivers/acpi/utilities/utglobal.c remember that this
>>> is code taken from ACPI CA, which we may better not re-format.
>> We can use /* clang-format off */ constructs to protect those lines we
>> do not want to be touched by clang-format [1]. This is what Grygprii
>> mentioned in some other e-mail.
> We have fall-through comments. We have SAF comments. Yet another flavor to
> keep some external tool happy. If everyone else thinks this is a good idea,
> I'm not intending to stand in the way. Yet I don't like this as a workaround.
> Instead I think the tool's going too far.
Yes, I do agree. But only if we talk about having an automated
code style check now (which is definitely the goal at some time).
Before that we could still use the tool to take all that good that
it does and manually prepare a set of patches to fix those
code style issues which we like.
>
> Jan


