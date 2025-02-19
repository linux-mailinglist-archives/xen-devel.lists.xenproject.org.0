Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31733A3BE89
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 13:49:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892836.1301786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjWL-0002WI-G1; Wed, 19 Feb 2025 12:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892836.1301786; Wed, 19 Feb 2025 12:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjWL-0002Tb-Cp; Wed, 19 Feb 2025 12:49:45 +0000
Received: by outflank-mailman (input) for mailman id 892836;
 Wed, 19 Feb 2025 12:49:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkjWK-0002S2-7C
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 12:49:44 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fce863f8-eebf-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 13:49:42 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-abbc38adeb1so269595366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 04:49:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53232282sm1276402766b.12.2025.02.19.04.49.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 04:49:41 -0800 (PST)
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
X-Inumbo-ID: fce863f8-eebf-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739969382; x=1740574182; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v/t6Cow+852GrLvVH9RB971Fy2Ky/OQX6UT+SdlVoiE=;
        b=J3GURLHUReYZaDtS2cRsb1s0LxyVd8K6wklsegoGQUMYsAgT4mI8GTxW2CAR8oQ/ZD
         LKisBZzbj3IQtQKrMts7RyHPvOY/IW6ezUaQt9YSw6HWrh3+iDaxOHzf9Jv5Wdhe6ocV
         KyjF9/bvQKgziRByE5jy+sAUzhTtZgQKLxeAoB0AzSMdGBGeYIV5fZa+OVFZa5vRDrDA
         KMy8JHm10h+vqXXoUfeJqmWkQhSU43sFuzwsU+ql9A582mJS7vDadWvq3yQE/kRx5iWL
         bn179/TA264D+lxSfx40oSkRf18PstYmiaoerKFkMEHQtCm0MzKpffZrjy5OFwkughhr
         a3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739969382; x=1740574182;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/t6Cow+852GrLvVH9RB971Fy2Ky/OQX6UT+SdlVoiE=;
        b=rafyvT5vWKwxg9ieLuRKfmWijfpgs2n3VA159t8UC841Oe+iMUn63mey+2sVQJl0Kx
         wS0Uaeq3vVc8jPbvW+m+acfTfbuM82iJNiBfCBrV5xEMgkLgRZN+Um4L9ia+Yl/SjQOS
         a+q8J+voZPr+iNEiPFriHT0k6KuH7OCrhaA3a4D5D1LUSTFCX2QCdSa8c4bAWtDlkzmG
         8uGxbMf+TfXi3amd2Qf15ale3WliZgWpukAE0ddo7P9eRHXFqUnJChbmLvprCZqGNJEb
         Vvijve2PRAZQ4ziNm3XAJEKlBMJwGGuAVIzy3YTVYQphZFh5ttWBbYpX8xcM4/wOsWcu
         +q0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJrYfoQsO217Tky/624rSRbeEoLluH+yEiopDKLFEUTIkcTSs9smch5ssRq7/19FsRnERwafsk//M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGAr08Tbc/Y94Zi8yEPn6RSmEAmv74/wf2FYr6+t3qS0NWHi4+
	/FyM/RxTVzR0MMPQyHnib4RnLdvnAmBlWo6WIqrzwOMF/cpljBHsl1LXZgX+Dw==
X-Gm-Gg: ASbGncvdV8AuMTmKKaUYls1Mmmjr6UEhsBGw3txMjFLuCbUWIKc3vxOZDF/oz5ycMWR
	Z+Qugr8w+dc6RTzSZbOlnrOoay+Dsf9ZZDKXuTaIkpTEAQYIOEC/ApGICq3mCOrh+YaBLLsUTyB
	szbukv6pN90K5JbJ2TdhVUm+QGcTuxW3d/UvUVXPe0qaDf9A4oKIveIvLuWZdfcrE5nb/8RHEo9
	GZKxyf1goM78cKmTqCRcbk/kJcmIlPdhCq0QZwt4kzhDJJJJmwMVGp9+DcyKPP5BBt5rjVPvsMt
	8PA7oCrln3gxINILRPwjH4gm2JLZ6DvvRwfhRO0iEdEukIBncViq7Sbd0Ztp82N1ftrvpRhziS8
	L
X-Google-Smtp-Source: AGHT+IEeJk54KpW82YZLuquxww1oyYfnKHoAIS0xcitHa3V017bXEBl1lJ7vWSnaqlbp46MXt/yxEw==
X-Received: by 2002:a17:907:6e94:b0:aa6:832b:8d76 with SMTP id a640c23a62f3a-abbccccce5cmr301135066b.12.1739969381632;
        Wed, 19 Feb 2025 04:49:41 -0800 (PST)
Message-ID: <f0a4af56-016f-4ea7-92a8-6f6f4a62809a@suse.com>
Date: Wed, 19 Feb 2025 13:49:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] code style exercise: Drivers folder samples
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: Artem_Mygaiev@epam.com, Luca.Fancellu@arm.com, roger.pau@citrix.com,
 marmarek@invisiblethingslab.com, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250216102108.2665222-1-andr2000@gmail.com>
 <4f1fcad5-dd6c-471f-9496-023973fa8857@suse.com>
 <alpine.DEB.2.22.394.2502171833370.1085376@ubuntu-linux-20-04-desktop>
 <f6db4e23-8c6e-43a5-a90a-ea3526f88b23@suse.com>
 <26cfd51b-123f-48e7-9911-2c96b48abdfe@gmail.com>
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
In-Reply-To: <26cfd51b-123f-48e7-9911-2c96b48abdfe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.02.2025 13:43, Oleksandr Andrushchenko wrote:
> Hello, Jan, Stefano!
> 
> On 18.02.25 13:34, Jan Beulich wrote:
>> On 18.02.2025 03:36, Stefano Stabellini wrote:
>>> On Mon, 17 Feb 2025, Jan Beulich wrote:
>>>> On 16.02.2025 11:21, Oleksandr Andrushchenko wrote:
>>>>> 1. Const string arrays reformatting
>>>>> In case the length of items change we might need to introduce a bigger
>>>>> change wrt new formatting of unaffected lines
>>>>> ==============================================================================
>>>>>
>>>>> --- a/xen/drivers/acpi/tables.c
>>>>> +++ b/xen/drivers/acpi/tables.c
>>>>> @@ -38,10 +38,10 @@
>>>>> -static const char *__initdata
>>>>> -mps_inti_flags_polarity[] = { "dfl", "high", "res", "low" };
>>>>> -static const char *__initdata
>>>>> -mps_inti_flags_trigger[] = { "dfl", "edge", "res", "level" };
>>>>> +static const char *__initdata mps_inti_flags_polarity[] = { "dfl", "high",
>>>>> +                                                            "res", "low" };
>>>>> +static const char *__initdata mps_inti_flags_trigger[] = { "dfl", "edge", "res",
>>>>>
>>>>> --- a/xen/drivers/acpi/utilities/utglobal.c
>>>>> +++ b/xen/drivers/acpi/utilities/utglobal.c
>>>>>   static const char *const acpi_gbl_region_types[ACPI_NUM_PREDEFINED_REGIONS] = {
>>>>> -	"SystemMemory",
>>>>> -	"SystemIO",
>>>>> -	"PCI_Config",
>>>>> -	"EmbeddedControl",
>>>>> -	"SMBus",
>>>>> -	"CMOS",
>>>>> -	"PCIBARTarget",
>>>>> -	"DataTable"
>>>>> +    "SystemMemory", "SystemIO", "PCI_Config",   "EmbeddedControl",
>>>>> +    "SMBus",        "CMOS",     "PCIBARTarget", "DataTable"
>>>>>   };
>>>> Why in the world would a tool need to touch anything like the two examples
>>>> above? My take is that the code is worse readability-wise afterwards.
>>> I think the output is acceptable: not necessarily better than before,
>>> but also not significantly worse.
>> Hmm, for the change to xen/drivers/acpi/tables.c I wouldn't agree with this
>> statement. And for xen/drivers/acpi/utilities/utglobal.c remember that this
>> is code taken from ACPI CA, which we may better not re-format.
> We can use /* clang-format off */ constructs to protect those lines we
> do not want to be touched by clang-format [1]. This is what Grygprii
> mentioned in some other e-mail.

We have fall-through comments. We have SAF comments. Yet another flavor to
keep some external tool happy. If everyone else thinks this is a good idea,
I'm not intending to stand in the way. Yet I don't like this as a workaround.
Instead I think the tool's going too far.

Jan

