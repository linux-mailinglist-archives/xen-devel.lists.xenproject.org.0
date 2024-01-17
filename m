Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B668883073D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 14:41:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668473.1040712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ69m-0008Em-Tt; Wed, 17 Jan 2024 13:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668473.1040712; Wed, 17 Jan 2024 13:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ69m-0008Cj-Qu; Wed, 17 Jan 2024 13:40:38 +0000
Received: by outflank-mailman (input) for mailman id 668473;
 Wed, 17 Jan 2024 13:40:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQ69l-0008CW-Fh
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 13:40:37 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe608fc5-b53d-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 14:40:36 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e7065b7bdso39403375e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 05:40:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d6-20020adff846000000b0033725783839sm1696798wrq.110.2024.01.17.05.40.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 05:40:35 -0800 (PST)
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
X-Inumbo-ID: fe608fc5-b53d-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705498835; x=1706103635; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G66dl/KqyndMo1mUlVWk9m/3TFebwmIfDaKJUoPv2D4=;
        b=XkNKlSvBCe1sO9Cdg5kBTh8UQLkkjLxpggAlkSLdjAdVrdM0JPOT6FjlTAk5H/IaCq
         IaCEPHbgtl1y+1RCn//qADw9aJP5UwCQslOScJ905MhUKWz3MLz8YtoVNHXP8UTzQ2n3
         lVusdoAQDgMShbxZEYQWVIh4k3tyAG4t6Hcy0SeF5IuPs8zFu6u4FfuI/KPtOEgB8d0K
         CV145m3HiZ/GHGoZSuPSs+hd5HM7W1ZKJxFWkbMEIIAXVfLJ8ZdILoZ5FlGlgo0rE8Uh
         SHAZCaR610Gh12VxYbHyDPviBtjhfaV/CX0s5FoDImgHtSvW0YMq4b8F63R1u2JIDXTZ
         lNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705498835; x=1706103635;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G66dl/KqyndMo1mUlVWk9m/3TFebwmIfDaKJUoPv2D4=;
        b=KuSlS7FdSBUNJlEl6OtoTReekUTQKwHDTsc5/o0rNKSD7LT5cbAFGO0Quh40e00Rh+
         TAIJfIK+JzuG0wpBtpu6O61ueZzGWN0OL7YcDxD1K7+svYkgYW9tCOf2PWkRvugRpkhP
         sVFVkl+BTZcbMPHvrSmIIKNCEsCpQFWEb/cGKNEppjSqc8vITLFsvL61/7CobyF9E4ca
         +2yqXD2amZeShVlMc08nuVGALmhJwDwHMAOzdeFlACdm+OKbbC2jxpEF9kq9KahnAEbT
         hA333+3p0DCLkpadD+5ASoOCn88CZkHOhz3DvpTS6qysvtetsZKFZfWbSMarIf1StA7M
         gaKg==
X-Gm-Message-State: AOJu0YxhlAA/MpuDrwm+WDWpMhPjie+RA7VZALey/tlQ8/QVbx3fKcwd
	sWHzguGTMEy2YeZIyhsbmDf31Q8LRdwz
X-Google-Smtp-Source: AGHT+IHnIE97+jjPydDRhah2NKMpAvaHc/rckeUwz36BlXqrKmBCOWBK4fieCHd31ekqio/sNdUeDA==
X-Received: by 2002:a05:600c:4795:b0:40e:470a:d867 with SMTP id k21-20020a05600c479500b0040e470ad867mr3179135wmo.222.1705498835562;
        Wed, 17 Jan 2024 05:40:35 -0800 (PST)
Message-ID: <825e49e2-5270-4257-9c4f-c8f17c41267c@suse.com>
Date: Wed, 17 Jan 2024 14:40:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: E820 memory allocation issue on Threadripper platforms
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Patrick Plenefisch <simonpatp@gmail.com>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com> <ZafC3apB4rjFUOXP@mail-itl>
 <ZafPJvsIarRdy6BH@macbook>
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
In-Reply-To: <ZafPJvsIarRdy6BH@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.01.2024 13:59, Roger Pau Monné wrote:
> On Wed, Jan 17, 2024 at 01:06:53PM +0100, Marek Marczykowski-Górecki wrote:
>> On Tue, Jan 16, 2024 at 10:33:26AM +0100, Jan Beulich wrote:
>>> ... as per
>>>
>>> (XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x4a00000
>>>
>>> there's an overlap with not exactly a hole, but with an
>>> EfiACPIMemoryNVS region:
>>>
>>> (XEN)  0000000100000-0000003159fff type=2 attr=000000000000000f
>>> (XEN)  000000315a000-0000003ffffff type=7 attr=000000000000000f
>>> (XEN)  0000004000000-0000004045fff type=10 attr=000000000000000f
>>> (XEN)  0000004046000-0000009afefff type=7 attr=000000000000000f
>>>
>>> (the 3rd of the 4 lines). Considering there's another region higher
>>> up:
>>>
>>> (XEN)  00000a747f000-00000a947efff type=10 attr=000000000000000f
>>>
>>> I'm inclined to say it is poor firmware (or, far less likely, boot
>>> loader) behavior to clobber a rather low and entirely arbitrary RAM
>>> range, rather than consolidating all such regions near the top of
>>> RAM below 4Gb.
>>
>> FWIW, we have two more similar reports, with different motherboards and
>> firmware versions, but the common factor is Threadripper CPU. It doesn't
>> exclude firmware issue (it can be an issue in some common template, like
>> edk2?), but makes it a bit less likely.
>>
>>> There are further such odd regions, btw:
>>>
>>> (XEN)  0000009aff000-0000009ffffff type=0 attr=000000000000000f
>>> ...
>>> (XEN)  000000b000000-000000b020fff type=0 attr=000000000000000f
>>>
>>> If the kernel image was sufficiently much larger, these could become
>>> a problem as well. Otoh if the kernel wasn't built with
>>> CONFIG_PHYSICAL_START=0x1000000, i.e. to start at 16Mb, but at, say,
>>> 2Mb, things should apparently work even with this unusual memory
>>> layout (until the kernel would grow enough to again run into that
>>> very region).
>>
>> Shouldn't CONFIG_RELOCATABLE=y take care of this?
> 
> No, because PV doesn't use the native entry point.
> 
>> At least in the case
>> of Qubes OS, it's enabled and the issue still happens.
> 
> I think for PV it should be possible to workaround this in Linux
> itself, maybe by changing the pfn -> mfn relations of the kernel
> area?

Right, that's what I understand Jürgen is intending to look into once
he's back.

Jan

> Those overlaps are not real, as the loaded kernel is scattered across
> mfns, and those certainly belong to RAM regions in the memory map.
> 
> For PVH it's going to require some changes in Xen itself.
> 
> Roger.


