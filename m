Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA979969A6
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 14:10:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814437.1227997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syVVa-0007ED-EB; Wed, 09 Oct 2024 12:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814437.1227997; Wed, 09 Oct 2024 12:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syVVa-0007C4-Bd; Wed, 09 Oct 2024 12:09:38 +0000
Received: by outflank-mailman (input) for mailman id 814437;
 Wed, 09 Oct 2024 12:09:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syVVY-0007By-QN
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 12:09:36 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59883449-8637-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 14:09:35 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9953bdc341so454363666b.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 05:09:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e7e226bsm648053366b.210.2024.10.09.05.09.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 05:09:34 -0700 (PDT)
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
X-Inumbo-ID: 59883449-8637-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728475775; x=1729080575; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LcSk0hKhTZvm1b8dZbnCjCU2ZKbnfk0LnD76zfyF5I8=;
        b=gGwyR85r3kp+sAlQfajS/31ScktlR0rUOgeavlwYEdGkabfEG6e6mnWgUL6UozfrDs
         WCF4NCBxrdF7I7P1DbvQZtzACZRDFPuSGgdGPw8iwOGviVn4nv47AsQ+Qpb0e17H0htn
         gKOHmjq54kpWrQXgWBjPAKfewy0bkoTXctZoOowXtK2UD8ROM4YkiOqwvdQEmWthPKfF
         v+m6xuNz2RyA87UXpK13flTnFSXCl3kNkLT4PtIhI1hfY4QPYT1eP3W0NIF15VKfqGNZ
         KmpSHqI8jyw3Q6+SnJz6367ycUyAKitpT3ZfJ4mrziulR6W0b9TASVXiqARargtG3kjT
         Nl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728475775; x=1729080575;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcSk0hKhTZvm1b8dZbnCjCU2ZKbnfk0LnD76zfyF5I8=;
        b=iiNQzgXDNMiH/ho9thsiP4xJuHWwu352r5WKDMF/WBmjy60uL//JR+GP4hBmoE57jv
         Yejf9ke7PUV9k+QOJYN0jJNvWX94Qpxbx2GP7xUeFNd6Tge/64Vgm+V1LAhSVNrpMord
         N/ov4g1pE69LZOPSuyTOIxOcjKAq7N0sJpxRIGay7P1c6DaYx4NbeWTl3VLTRNsaqayj
         Yevutehbc9nJpXJzcPG4m8VVUIPcIKFCDu1G7oAI94RFswTU9Wu3n0jWmc1boNBxEEBP
         UHgGrZYxvagOh/vquJxnM8vzjaiqauvOeiXVj9pd/eTKeaEUGnUHfZm+sBICFvroIjd8
         pNyA==
X-Forwarded-Encrypted: i=1; AJvYcCVQSqd4E/h81zILPf+Ek/OnmMVUgH1AthvtOZlBKuWSm4UgrLonKy4I/FGKADGUUtEoSh9u37YCm0c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyyBlxOvWsBvz9uSDpKvRoGAMYoRdjH9NN6OAjaS5W37MEvwadH
	P9VL01xQ7QkHIUR4jiM4LuYp4dxGopCVHFVkSSd6++Gdxcu/JEkDiFpGDGuh3Q==
X-Google-Smtp-Source: AGHT+IFde4xi1BocKAe01aSiw3Kd16/2Vf/qL1o2fHlH94NUNTWGZT+em5sefsz9xl6RdJ3Qb69xrg==
X-Received: by 2002:a17:907:e2e7:b0:a99:371e:7a91 with SMTP id a640c23a62f3a-a998d32585cmr177373666b.52.1728475774955;
        Wed, 09 Oct 2024 05:09:34 -0700 (PDT)
Message-ID: <34f73ec6-0e10-41f4-8894-c367264afefc@suse.com>
Date: Wed, 9 Oct 2024 14:09:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/amd-vi: do not error if device referenced in IVMD
 is not behind any IOMMU
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Willi Junga
 <xenproject@ymy.be>, xen-devel@lists.xenproject.org
References: <20241008104706.74001-1-roger.pau@citrix.com>
 <d6489e43-2cfe-4ad7-824e-a3212367dbca@suse.com>
 <ZwY4ym2Gnlx4tytP@macbook.local>
 <5a2a4ff4-a2c7-46f6-bd18-a4837fe8d4c1@suse.com>
 <ZwZlVlU2nHkBedyo@macbook.local>
 <703fa416-c7d5-4862-a871-5831125c2e25@suse.com>
 <ZwZtR6ZTl2gUWN2T@macbook.local>
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
In-Reply-To: <ZwZtR6ZTl2gUWN2T@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.10.2024 13:47, Roger Pau Monné wrote:
> On Wed, Oct 09, 2024 at 01:28:19PM +0200, Jan Beulich wrote:
>> On 09.10.2024 13:13, Roger Pau Monné wrote:
>>> I also think returning an error when no device in the IVMD range is
>>> covered by an IOMMU is dubious.  Xen will already print warning
>>> messages about such firmware inconsistencies, but refusing to boot is
>>> too strict.
>>
>> I disagree. We shouldn't enable DMA remapping in such an event. Whereas
> 
> I'm not sure I understand why you would go as far as refusing to
> enable DMA remapping.  How is a IVMD block having references to some
> devices not assigned to any IOMMU different to all devices referenced
> not assigned to any IOMMU?  We should deal with both in the same
> way.

Precisely because of ...

> If all devices in the IVMD block are not covered by an IOMMU, the
> IVMD block is useless.

... this. We simply can't judge whether such a useless block really was
meant to cover something. If it was, we're hosed. Or maybe we screwed up
and wrongly conclude it's useless.

>  But there's nothing for Xen to action, due to
> the devices not having an IOMMU assigned.  IOW: it would be the same
> as booting natively without parsing the IVRS in the first place.

Not really, no. Not parsing IVRS means not turning on any IOMMU. We
then know we can't pass through any devices. We can't assess the
security of passing through devices (as far as it's under our control)
if we enable the IOMMU in perhaps a flawed way.

A formally valid IVMD we can't make sense of is imo no different from
a formally invalid IVMD, for which we would return ENODEV as well (and
hence fail to enable the IOMMU). Whereas what you're suggesting is, if
I take it further, to basically ignore (almost) all errors in table
parsing, and enable the IOMMU(s) in a best effort manner, no matter
whether that leads to a functional (let alone secure [to the degree
possible]) system.

What I don't really understand is why you want to relax our checking
beyond what's necessary for the one issue at hand.

>> the "refusing to boot" is interrupt remapping related iirc, if x2APIC
>> is already enabled. We need to properly separate the two (and the
>> discussion there was started quite a long time ago, but it got stuck at
>> some point); until such time it is simply an undesirable side effect of
>> the inappropriate implementation that in certain case we fail boot when
>> we shouldn't.
> 
> Yes, but that's a different topic, and not something I plan to fix as
> the scope of this patch :).

Sure, I'm merely asking to accept that, until that's resolved, issues
with boot failure can result here, and need to be lived with.

Jan

