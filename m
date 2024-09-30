Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E2B98A086
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 13:27:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807225.1218535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEYo-0003cT-6D; Mon, 30 Sep 2024 11:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807225.1218535; Mon, 30 Sep 2024 11:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEYo-0003Zj-3b; Mon, 30 Sep 2024 11:27:26 +0000
Received: by outflank-mailman (input) for mailman id 807225;
 Mon, 30 Sep 2024 11:27:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svEYm-0003Zd-IC
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 11:27:24 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f698a8dd-7f1e-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 13:27:23 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5398d171fa2so1657097e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 04:27:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2979e00sm520104666b.158.2024.09.30.04.27.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 04:27:22 -0700 (PDT)
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
X-Inumbo-ID: f698a8dd-7f1e-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727695643; x=1728300443; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XSGoG/Tx9GuotZZxQq6hAVneKODIQz9E8wjdmu+nmd0=;
        b=XyRYmnREAm8rQSxHcMNwlUaBIOhGYA6KmnXqLdblWc3+E29XbAQDG7jnX8WhGEqb+r
         UicncTO0dpAVwwS3nYlS1jn/uLDRdAE1xugTXBuXr8F2REBPcBJ8r5XKH9UXXKsH84+h
         G7hd8+6MCGlkwVcmiBAic4jy2az/iCRWA6KLUXMD3c9Z5Jrm3BZJS65+X7EwVPm6s6vx
         dcSaiOe9GVZSTSkB0ZMdCjwvI9/9x8BoihoWLXp6d5tn4/kCt4R5jFDL36rfqab8/IA2
         aLF4zE8HS9cJFUWnkAfSNU9Paf7WSfCXb5J4qtG9628W8xlpvIasftxN3ik+CQoX6CHm
         DfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727695643; x=1728300443;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSGoG/Tx9GuotZZxQq6hAVneKODIQz9E8wjdmu+nmd0=;
        b=q9LgSLO30q74lkTPfnbzvfqbIY5dV67V6a5sMAZ9piNjL1nXl/DrTWSbjgJDJ9ZreT
         JZgQnMZzHh43L7ALSaxomNb1AZnQrX1SWgQsj9laHY91qlJsHqSBGHry425exi8fSgTd
         JiCXN5Ek+p5SICPsEYBWcflBKSHV1J9joRLy4z14XxzWvCUE71HuwT+iCjWPdni2DGd9
         DRX3A/zNbnsRHEJBVgvkwx+zp8aL+I3WxGjTXKE6q2C3vQXjINKGj6TyOig0hEBs9CMI
         DMg8O7Igo4Q+bBqNI7v27c+a2uhBw1NZJUE4UmlVO/+J1o8AN6cwEPNeT9mLvCj+M7Cp
         0SoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7iGzV1LSZfmIFb/wD985KMPYzFVi5esk/gCSFf+f++V/izcc9FEh+qDH4bpsxtI2NVyp/GplENMg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzaXMNJpiyUyS4nd54wRE3wv5PYDehHX9tvsOufVeknrfdo941
	BXlXX4lff8tMv+cw12yJ0Mv/rmrkeooL1Sam8jYDD2FrrOFSWks6EywA7NhuTQ==
X-Google-Smtp-Source: AGHT+IF/JkVZmSCNMAcs48BZXmHqVVMrbXvlN2KVjpX9kWO1kztfV8BKX4qKdpExdIUCobRMLpRzbg==
X-Received: by 2002:a05:6512:334e:b0:539:8af8:159b with SMTP id 2adb3069b0e04-5398af81608mr2695494e87.34.1727695642838;
        Mon, 30 Sep 2024 04:27:22 -0700 (PDT)
Message-ID: <3c6aebb6-ec8c-4f1a-b5d2-eb216b9f7bef@suse.com>
Date: Mon, 30 Sep 2024 13:27:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/hvm: make ACPI PM timer support optional
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240916063757.990070-1-Sergiy_Kibrik@epam.com>
 <Zufh7DOSCwzhrpZG@macbook.local>
 <alpine.DEB.2.22.394.2409161252380.1417852@ubuntu-linux-20-04-desktop>
 <614611f1-dfbe-4185-8f0a-dc89aa7f5a20@epam.com>
 <ZuqgTKqaUDWC_I-u@macbook.local>
 <27d717f7-3073-4139-bef0-05d1a39f1e6c@epam.com>
 <d5a6774b-3c50-4b39-9bb7-740f0763a1d4@suse.com>
 <12072ee1-5a39-4c19-a442-c5be45fb968e@epam.com>
 <15d79e3e-dea6-4c07-82c6-43e17e429123@suse.com>
 <b2edae9d-2c1a-4e67-9e01-2ce3813d4dbe@epam.com>
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
In-Reply-To: <b2edae9d-2c1a-4e67-9e01-2ce3813d4dbe@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.09.2024 13:03, Sergiy Kibrik wrote:
> 27.09.24 12:44, Jan Beulich:
>>>>> (probably with X86_PMTIMER option depending on PV)
>>>> HVM you mean?
>>>>
>>> I wanted to do it like this:
>>>
>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -386,7 +386,7 @@ config ALTP2M
>>>             If unsure, stay with defaults.
>>>
>>>    config X86_PMTIMER
>>> -       bool "ACPI PM timer emulation support" if EXPERT
>>> +       bool "ACPI PM timer emulation support" if EXPERT && PV
>>>           default y
>>>           depends on HVM
>>>           help
>>>
>>> to allow it to be disabled when PV is on and prevent situation when pvh
>>> domain can't be created because !PV and hvm domain can't be created
>>> either without emulated timer.
>> How does PV matter for this "depends on HVM" setting?
> 
> Options are dependant on HVM option, because pmtimer & stdvga drivers 
> are part of HVM support code.
> At the same time these options are allowed to be de-selected when PV/PVH 
> enabled, because only PV/PVH domains can be created when stdvga or 
> pmtimer are disabled

But PV != PVH.

> (if both PV & any emulated device are disabled one would end up with 
> weird system that can't create any VM).

It would still be able to create PVH domains, wouldn't it?

Also we allow e.g. both PV and HVM being turned off. That'll lead to no
useful domains being possible to create, too. Conceptually no different
when PV is off while HVM/PVH domains cannot be created for reasons like
missing emulation.

Jan

