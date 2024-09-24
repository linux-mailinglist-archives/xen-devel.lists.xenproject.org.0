Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3CF984449
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 13:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802625.1212924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st3TK-0001Qq-Hl; Tue, 24 Sep 2024 11:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802625.1212924; Tue, 24 Sep 2024 11:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st3TK-0001ON-E9; Tue, 24 Sep 2024 11:12:46 +0000
Received: by outflank-mailman (input) for mailman id 802625;
 Tue, 24 Sep 2024 11:12:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1st3TI-0001OH-HD
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 11:12:44 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb90301c-7a65-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 13:12:43 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8a7b1c2f2bso898863366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 04:12:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f32db2sm72451266b.25.2024.09.24.04.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 04:12:42 -0700 (PDT)
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
X-Inumbo-ID: eb90301c-7a65-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727176363; x=1727781163; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7i2zVQxcoqKj4yCuJCKjo8zJsce91P4St2ViY9U+TUU=;
        b=ePauLIaBHr6Rf4OgB+w+3QRRwBopll0MF2LCaljCyXJ25THa0/ct0X/PY5uUgwcubX
         AGY0Q/827mBLXKueVGnPs4nPq4bk8O9qFwqrghDoYv5XGvuIrzxfXFYKf0xosQCoqs6s
         Deqpcp3Winjoc6pb0Pmyx0/LOLmq4gpZBlP/kJp79dhumPD9FD5BQG2kRtEumeLLMEaE
         5+5H9hZIRbOlyYVfoVV5JvNvkfN9MrN+TDFGlrpAsn7Ei6c0fX9S7kraazjNBvt812O/
         cjUY/RtLTWFI2kiIPK+BYIHIErDv0JHGfcCfN7UTXol2hSIFNLOWUG1NncJzqh5hUCir
         +Cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727176363; x=1727781163;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7i2zVQxcoqKj4yCuJCKjo8zJsce91P4St2ViY9U+TUU=;
        b=wQFQnwB77VC+wWaKjHSEjuCFwO1i+xogTnF42ido8XNxZ7VFwQ+siyjyZIp72ENGpf
         G0avoIIGTXTZM/CTUXUV5by2Hf1z+44uP6WEhN5s8VsgT7VzNS35dWwh/zxGA5+qGWvt
         DvFxTtG9cwFmdGM7LwmpMlj2wl0owz+pjx4V7RFAeI/Hw4OueoWYm26BkK3TDszPJIYA
         ZoxqnbkHV7j7tVAI7AhDK51fNd7VGe/A9wdwmYkPoCEDm621Z/PWQ7m7XzqGC1+keUaX
         MxyUhVpi55wejC3zG5te3ZHfjOI11DePv3oBDwywTgXkGml03rN8ClyGYLESMWdUQgIl
         Pl4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFaxRB8MvneU9LIrA3mSP8YmH3x69v3FOxC1/6h0vgxEAfjNobv/zZycjMna+Np2FehksNzg4EpPg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzzGptizLFiILhisJNipd2kSVE8DjPrx2M0q02g1AD2dz3yM7V
	A0LScjiwAQEaSBONeJ6UXWKXLyPwbxlh+LhTuCSGpm5vmWtvOmkPekh9Uj8MBQ==
X-Google-Smtp-Source: AGHT+IGrWb7vmse0SyC0bqydO8Mnf9g6vgdtTkmJPw0R+wsZz+ytCF9U6Ny0XB7g2T/rvDNkAuJfbQ==
X-Received: by 2002:a17:907:d16:b0:a8d:7b7d:8c47 with SMTP id a640c23a62f3a-a90d5197004mr1685342966b.59.1727176362858;
        Tue, 24 Sep 2024 04:12:42 -0700 (PDT)
Message-ID: <01f30530-1a9f-4785-9e11-40adf580eefe@suse.com>
Date: Tue, 24 Sep 2024 13:12:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] xen/common: move device initialization code to
 common code
To: oleksii.kurochko@gmail.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1726579819.git.oleksii.kurochko@gmail.com>
 <0b4d49742f58549ec644944ce1e02c98d7551845.1726579819.git.oleksii.kurochko@gmail.com>
 <13de4165-2df2-4481-974d-30d528dfd8cd@suse.com>
 <2727fcff560d62d2035237a225c0a14fdf0410dc.camel@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <2727fcff560d62d2035237a225c0a14fdf0410dc.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.09.2024 12:16, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-09-23 at 16:43 +0200, Jan Beulich wrote:
>> On 17.09.2024 18:15, Oleksii Kurochko wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -12,6 +12,14 @@ config CORE_PARKING
>>>  	bool
>>>  	depends on NR_CPUS > 1
>>>  
>>> +config DEVICE_INIT
>>> +	bool
>>> +	default !X86
>>
>> This can simply be "def_bool y" as ...
>>
>>> +	depends on !X86 && (ACPI || HAS_DEVICE_TREE)
>>
>> ... this enforces all restrictions. As indicated before I'd prefer if
>> we
>> could get away without yet another Kconfig constant, which would then
>> also eliminate my concern about the expression not really covering
>> for
>> the case where x86 would obtain DT support (and hence likely needing
>> the
>> initialization here, too). What about ...
>>
>>> --- a/xen/common/Makefile
>>> +++ b/xen/common/Makefile
>>> @@ -6,6 +6,7 @@ obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
>>>  obj-$(CONFIG_CORE_PARKING) += core_parking.o
>>>  obj-y += cpu.o
>>>  obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
>>> +obj-$(CONFIG_DEVICE_INIT) += device.o
>>
>> obj-$(CONFIG_HAS_DEVICE_TREE) += device.o
>> obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
>>
>> ? (Eventually we could then simplify this to just obj-$(CONFIG_ACPI),
>> to allow DT on x86, making sure the ACPI part of the file builds for
>> x86 but does nothing there.)
> I am okay with this solution. It seems I misunderstood you in the first
> version of this patch series. When "obj-$(or ... )" was used, I decided
> it wasn’t a good approach to use 'or', 'filter-out', or other similar
> functions in Makefiles for such cases. I couldn't come up with a better
> solution at the time, so I introduced a new config instead.
> 
> The only issue I see with this approach is that in device.c, there is
> the following code:
>    #ifdef CONFIG_ACPI
>    
>    extern const struct acpi_device_desc _asdevice[], _aedevice[];
>    
>    int __init acpi_device_init(enum device_class class, const void *data,
>    int class_type)
>       ...
>    
>    #endif
> This shouldn't be compiled for X86. However, it will still be compiled
> if we simplify to:
>    obj-$(CONFIG_HAS_DEVICE_TREE) += device.o
>    obj-$(CONFIG_ACPI) += device.o

Which is why I said "eventually". For now it'll be the $(filter-out ...).
How to best adjust the code to permit above simplification is to be
determined; what you outlined matches what I had thought of as an option.

Jan

