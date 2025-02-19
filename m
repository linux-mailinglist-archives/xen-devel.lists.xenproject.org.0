Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E44FA3BE5E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 13:43:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892813.1301756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjQW-00012y-EX; Wed, 19 Feb 2025 12:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892813.1301756; Wed, 19 Feb 2025 12:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjQW-0000zb-Bt; Wed, 19 Feb 2025 12:43:44 +0000
Received: by outflank-mailman (input) for mailman id 892813;
 Wed, 19 Feb 2025 12:43:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVer=VK=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1tkjQU-0000zT-Sk
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 12:43:42 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25a09aef-eebf-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 13:43:41 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5461f2ca386so3084841e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 04:43:41 -0800 (PST)
Received: from [192.168.10.20] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54531d76843sm1413387e87.84.2025.02.19.04.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 04:43:39 -0800 (PST)
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
X-Inumbo-ID: 25a09aef-eebf-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739969020; x=1740573820; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z6EO0Q/flVWKEx2MHtqvYO1mDrpwoWHP4CrKYcUemRs=;
        b=bW3U/WIcZ+UzwId9TBBGTRfp3bBUuOlNOYcGy3d41dC3OcmDiYBhHEUpP51mxsIw5v
         C8QbTfLFEQSRDIMGhk+aaibyA7pLcEzlnj/6kStkjXlFkXEQvWcPKXkgxwmUWYxxYEXK
         nUkzOzO+AxnHF2Gj2okfVtOQlPUr8280kV4oaoNfPKwPF8jnZXyX6SbckzdZjJUgORKy
         B3qlqenQQ7XxSrx8KwlgK5nZJEIQdfNePMtYhY1BI1Pf0NrrL1CTahXyS6ucifZlbUDd
         DYJw7oOJHlIS2l0usMvXB0QDE4/QF4QTvd4FfIBftngkUVkTFWcJiEi/7niFpIKDmZoG
         2KxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739969020; x=1740573820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6EO0Q/flVWKEx2MHtqvYO1mDrpwoWHP4CrKYcUemRs=;
        b=fgK5F+tm46LC6HfRvhCBzn+rn77vi0dKz28Wb+CFfUaiAmjdz82smDPXKlcLl202zc
         MFy6RpXy/xBMvgg0glEHBaWDKvkLcJLbZ5llUF4nslpUgnv6BqECkkTIcKKx934HQeMm
         LJyt6eUX4TtWrShA96NZk7GjjgSmghzlBTh/F0a9lYK/UbMQ4VFTQtj1+LcOJtv4v0RK
         EB6j0sd6UXlwnmxxzIirAT55n8ZGXlLvO3SKZ1z90tEUIvkd/zlqT1RKMbJe6V+2F0Zi
         QgfCQfHxC6tq49YCLTBCRhqKVIDTw+PhbjNHOKmwmj/q2je0FTsI0STujG+D8EdvFkbC
         xqYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoXjbT3oITBPllVrYRGggth1G8eaJfzoe6ruusXg7Su5zmPR9+//2U2QTed9rawOOjax20qiTv6gE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz51DZN/TPO9Cwfnd1792saIXLEh7S/enKeuOez6clBuVZF/T+t
	/7vGfD0SdrKS7gDcKeJG3vT4P2Ge+o8UeXdXVTKvJUEsQeLie0L2mpX01g==
X-Gm-Gg: ASbGncsOHvr74GYG8rPr2e4QbKBT+74KcKwIVWmZbejv6w/bZoVFkcMVev981R5vHzs
	OsrNAzwSf/PDpFSjRATsbPsSHxriNlKnLbL2asRIpXvPPfs9vgTJ+4KW/4q6A7fCjUuENHBr1rz
	G46chVfzYTs86VHaLotu8koQmWrYTt42TM6zMNS91OC4e8q4b4MrRBc/8YNtAhH2MSnqPkqLRVf
	a3o5WMNNw5SxvyQsOvOV87xaKmgbWdAxpqtYOqoeZuKozJ6zT2tYR2t80mO2uec2jYINhcfBM0X
	ZuBkasWc/5112BGq
X-Google-Smtp-Source: AGHT+IEz2R0biUL5oq8m/TrtrOiTkPSyYQUhELtCHINVn+cmWK+Uf3QIeKpQsPAKyqvBJPGGrMpNTg==
X-Received: by 2002:a19:5f1d:0:b0:546:207c:1c59 with SMTP id 2adb3069b0e04-546207c1e6emr3980548e87.34.1739969020261;
        Wed, 19 Feb 2025 04:43:40 -0800 (PST)
Message-ID: <26cfd51b-123f-48e7-9911-2c96b48abdfe@gmail.com>
Date: Wed, 19 Feb 2025 14:43:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] code style exercise: Drivers folder samples
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Artem_Mygaiev@epam.com, Luca.Fancellu@arm.com, roger.pau@citrix.com,
 marmarek@invisiblethingslab.com, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, xen-devel@lists.xenproject.org
References: <20250216102108.2665222-1-andr2000@gmail.com>
 <4f1fcad5-dd6c-471f-9496-023973fa8857@suse.com>
 <alpine.DEB.2.22.394.2502171833370.1085376@ubuntu-linux-20-04-desktop>
 <f6db4e23-8c6e-43a5-a90a-ea3526f88b23@suse.com>
Content-Language: en-US
From: Oleksandr Andrushchenko <andr2000@gmail.com>
In-Reply-To: <f6db4e23-8c6e-43a5-a90a-ea3526f88b23@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello, Jan, Stefano!

On 18.02.25 13:34, Jan Beulich wrote:
> On 18.02.2025 03:36, Stefano Stabellini wrote:
>> On Mon, 17 Feb 2025, Jan Beulich wrote:
>>> On 16.02.2025 11:21, Oleksandr Andrushchenko wrote:
>>>> 1. Const string arrays reformatting
>>>> In case the length of items change we might need to introduce a bigger
>>>> change wrt new formatting of unaffected lines
>>>> ==============================================================================
>>>>
>>>> --- a/xen/drivers/acpi/tables.c
>>>> +++ b/xen/drivers/acpi/tables.c
>>>> @@ -38,10 +38,10 @@
>>>> -static const char *__initdata
>>>> -mps_inti_flags_polarity[] = { "dfl", "high", "res", "low" };
>>>> -static const char *__initdata
>>>> -mps_inti_flags_trigger[] = { "dfl", "edge", "res", "level" };
>>>> +static const char *__initdata mps_inti_flags_polarity[] = { "dfl", "high",
>>>> +                                                            "res", "low" };
>>>> +static const char *__initdata mps_inti_flags_trigger[] = { "dfl", "edge", "res",
>>>>
>>>> --- a/xen/drivers/acpi/utilities/utglobal.c
>>>> +++ b/xen/drivers/acpi/utilities/utglobal.c
>>>>   static const char *const acpi_gbl_region_types[ACPI_NUM_PREDEFINED_REGIONS] = {
>>>> -	"SystemMemory",
>>>> -	"SystemIO",
>>>> -	"PCI_Config",
>>>> -	"EmbeddedControl",
>>>> -	"SMBus",
>>>> -	"CMOS",
>>>> -	"PCIBARTarget",
>>>> -	"DataTable"
>>>> +    "SystemMemory", "SystemIO", "PCI_Config",   "EmbeddedControl",
>>>> +    "SMBus",        "CMOS",     "PCIBARTarget", "DataTable"
>>>>   };
>>> Why in the world would a tool need to touch anything like the two examples
>>> above? My take is that the code is worse readability-wise afterwards.
>> I think the output is acceptable: not necessarily better than before,
>> but also not significantly worse.
> Hmm, for the change to xen/drivers/acpi/tables.c I wouldn't agree with this
> statement. And for xen/drivers/acpi/utilities/utglobal.c remember that this
> is code taken from ACPI CA, which we may better not re-format.
We can use /* clang-format off */ constructs to protect those lines we
do not want to be touched by clang-format [1]. This is what Grygprii
mentioned in some other e-mail.
>
>> To me, the main takeaway is that there
>> are many unavoidable but unnecessary changes.
> Interesting. I'd say it slightly differently: The main takeaway is that
> there are many avoidable / unnecessary changes.
But at the end of the day it will allow using automatic formatting...
>
> Jan
Thank you,
Oleksandr
[1] https://clang.llvm.org/docs/ClangFormatStyleOptions.html#disabling-formatting-on-a-piece-of-code

