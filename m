Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F7C88BB09
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 08:17:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697929.1089187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp135-0008Ko-2H; Tue, 26 Mar 2024 07:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697929.1089187; Tue, 26 Mar 2024 07:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp134-0008Im-VZ; Tue, 26 Mar 2024 07:16:42 +0000
Received: by outflank-mailman (input) for mailman id 697929;
 Tue, 26 Mar 2024 07:16:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NDFk=LA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rp134-0008Ig-Aw
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 07:16:42 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca1fd531-eb40-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 08:16:40 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d28051376eso96243151fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 00:16:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o1-20020a1709061d4100b00a46b4c09670sm3861077ejh.131.2024.03.26.00.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 00:16:11 -0700 (PDT)
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
X-Inumbo-ID: ca1fd531-eb40-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711437399; x=1712042199; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j0fpi6fkdr8wOE7Wb0Lo5jHxkynaY+qqzi3trvAnl7Q=;
        b=fBXS4AcFYR2PVaY0GfSAGHHsHc8AuyWU2Ciqahu8KV+m1IxSt5LZYpRffwFHGkvMLq
         K/aXYCMSxhL8wPg6EyVkOmvWFoQUgGlj/s+J05NCjrHmZtvkvASydKEF5kuhVM1XQ46j
         5SjuZr/uglR6ivUJ5Evt/gY7iJLOhH/PTwr2ycAqEnyTcIhfzlIxBqtguZ1fb7GkSh5w
         oD5MgWIWuAUntj10hHU0Df2mHECTa/W07peBmtf4MdRpE6f2CKXbzHBBj39c3KmYbtrI
         0cQSiNQQgkZGz5Ro39UAc1193ZLMN0TGTll04pfJg1RJuV6JTMrAquL0C2wQxWHw1e//
         Ok7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711437399; x=1712042199;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j0fpi6fkdr8wOE7Wb0Lo5jHxkynaY+qqzi3trvAnl7Q=;
        b=hM6RiZk2Se+jezJ7Qd32p9fSPBDv8BpOnW8cetUv//ItzmpBE9YudJLIwwNjzHHm+W
         +71VpE0QghUHb1DSXfLQjcfGFH+jO/iEkB5R+VQIM8fJd5bbg7lrOfY6BzvgxcjTDJl8
         LHdwfKOK8ghv/4ioKavjeLxXP4PKtofVPEV2jwlQHd8kDnFTyh3ElkzWJSDgfDjSgV8F
         2AjT7lBZZlQKSu3iN6Fv5i6ufjBYt9y53wq3Dq4F08PPmspom59ViSxYbpS0zaKH2TOk
         JFd4zuhhcIE3iUmNm1J+ke4oJoHPbgnhPBtPL5BzZUQ9a4SNLv5ciAa/arxRjaXBM0Qa
         LS5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbUe7+h3pe9mxRdwcMEcQOFY9WmU5Tcr2Zh6x4Dntil3Vr3Anw0ips6Xnvsftvpif6Nw5PeYdHGVmvUtufRqc5TOR8CU/2CEolE6dPBKY=
X-Gm-Message-State: AOJu0YzbZRRFqrO7wr92RV/Ja3cyw0Up1clMN8xCU5zN7T3E/1B855sn
	z8BJrKJkB/3M6OLpPSGilB5O0MDt496NYRjN3JBx0KckWLC+ZkE7VYlSLkNZl8MV4TsUCNtcSWA
	=
X-Google-Smtp-Source: AGHT+IFYGaFReatHIA/LQ/B6eMCy0VXk52Hu6A0IvtFwAg+xs4+uIYszzOLQ2I+spECAGvdypUX5bA==
X-Received: by 2002:a05:6512:21c:b0:513:e031:739a with SMTP id a28-20020a056512021c00b00513e031739amr7261843lfo.22.1711437373372;
        Tue, 26 Mar 2024 00:16:13 -0700 (PDT)
Message-ID: <cbaec357-f7c6-4770-b7c6-45246b7c92cd@suse.com>
Date: Tue, 26 Mar 2024 08:16:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] xen/x86: Add initial x2APIC ID to the per-vLAPIC save
 area
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-2-alejandro.vallejo@cloud.com>
 <2e7fe91e-b483-4d61-9783-0cfa3753911f@suse.com>
 <19a4cf14-92c9-47e5-b8f0-f07a92a1ffd8@cloud.com>
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
In-Reply-To: <19a4cf14-92c9-47e5-b8f0-f07a92a1ffd8@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.03.2024 19:00, Alejandro Vallejo wrote:
> On 25/03/2024 16:45, Jan Beulich wrote:
>> On 09.01.2024 16:38, Alejandro Vallejo wrote:
>>> @@ -1514,6 +1530,13 @@ static void lapic_load_fixup(struct vlapic *vlapic)
>>>      const struct vcpu *v = vlapic_vcpu(vlapic);
>>>      uint32_t good_ldr = x2apic_ldr_from_id(vlapic->loaded.id);
>>>  
>>> +    /*
>>> +     * Guest with hardcoded assumptions about x2apic_id <-> vcpu_id
>>> +     * mappings. Recreate the mapping it used to have in old host.
>>> +     */
>>> +    if ( !vlapic->hw.x2apic_id )
>>> +        vlapic->hw.x2apic_id = v->vcpu_id * 2;
>>
>> This looks to depend upon it only ever being vCPU which may get a (new
>> style) APIC ID of 0. I think such at least wants mentioning in the
>> comment.
> 
> I don't quite follow you, I'm afraid. There is an implicit control flow
> assumption that I can extract into a comment (I assume you were going
> for that angle?). The implicit assumption that "vCPU0 always has
> APIC_ID=0", which makes vCPU0 go through that path even when no
> corrections are necessary. It's benign because it resolves to APIC_ID 0.
> 
> Is that what you meant? If so, I'll add it to v2.

Yes, and even in your reply you make the same assumption without further
explanation. It does not go without saying that vCPU 0 necessarily has
APIC ID 0. On bare metal that may be what one can typically observe, but
I'm unaware of any architectural guarantees to this effect.

>>> --- a/xen/include/public/arch-x86/hvm/save.h
>>> +++ b/xen/include/public/arch-x86/hvm/save.h
>>> @@ -394,6 +394,8 @@ struct hvm_hw_lapic {
>>>      uint32_t             disabled; /* VLAPIC_xx_DISABLED */
>>>      uint32_t             timer_divisor;
>>>      uint64_t             tdt_msr;
>>> +    uint32_t             x2apic_id;
>>> +    uint32_t             rsvd_zero;
>>>  };
>>
>> I can't spot any checking of this last field indeed being zero.
> 
> Huh. I was sure I zeroed that on vlapic_init(), but it must've been on a
> previous discarded series. Good catch.

No, explicit zeroing isn't needed, simply because all of struct vcpu
starts out zeroed.

> Do we also want a check on migrate so a migration from a future Xen in
> which it's not zero fails?

It's really only this that I meant. Recall we now even have a dedicated
checking hook, running ahead of any state loading.

Jan

