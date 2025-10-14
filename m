Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4E8BDA653
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 17:31:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142905.1476805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8gzh-00035F-FO; Tue, 14 Oct 2025 15:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142905.1476805; Tue, 14 Oct 2025 15:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8gzh-00032v-CP; Tue, 14 Oct 2025 15:31:21 +0000
Received: by outflank-mailman (input) for mailman id 1142905;
 Tue, 14 Oct 2025 15:31:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v8gzf-00032p-5r
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 15:31:19 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d366dc92-a912-11f0-9d15-b5c5bf9af7f9;
 Tue, 14 Oct 2025 17:31:17 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-46e47cca387so54814575e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Oct 2025 08:31:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb489194dsm245208565e9.12.2025.10.14.08.31.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 08:31:16 -0700 (PDT)
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
X-Inumbo-ID: d366dc92-a912-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760455876; x=1761060676; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2QMa/CPNI9VARtaK269Ah/RBxdOD4boeJVzphLTAt18=;
        b=WzVhNLNZdvUH4a6MXzRagMMu6KWsw9DuO11PVe7Ql+BOs+oli5DgmXbFJLUSrgHnG5
         8qDi+Vq9fXjG85Tx1uosMEKpy1T9bLXkMsmjSmmj0eOncgsCqNjaYrQbIgTbhJbsRsnC
         dBiaT997bEixZKIfYWYpDdF9OSxaAW7mAHcAGUIw5aUXo2xg9TW1WKqamJ2D5aKNQkYT
         iH+xVWr5hu9j9OtERPT3/N2g1BCrsZePGpdFm1W1lMWMYH8u4C+YC1vu+8l3juGFSTjC
         gTBoBOhluG2oYzKhiCbzO+QRuwN6WSW8yDlbdLysPUvz7ijUY5m5kRdKbS/PHWKVSG9k
         nFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455876; x=1761060676;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QMa/CPNI9VARtaK269Ah/RBxdOD4boeJVzphLTAt18=;
        b=OpspnxZ9xBoouKdTGUQxTG7dYamaNFtLufKu3q2odBYPTe3kJaKgQVeg3vFDljShOv
         jzgiPt/QCw7732RQSEUxUNXTvtOE80TCx6qbB7VZVvJXK5vpCqwyaLi51vxEDS3M1Bfh
         y3MFvzrOsTf6FgBNrtiQogGK3wyFW2CIASOaR1OCGTJ0SPm8OvJvgrOAy4yKEiANYFvy
         nTGvQeALVOCVMTr5Slf4+oxAW9/4cgNjs8u2EVycw8KOfCjfmPa6wpQqMEcshSwj+1G5
         sHh0e/WutoZSj4jhjyqGpNi/WtpDFJY7Nc3kZuHwlpYLIwuOaTTHcQH1C9LSmOBXAoF8
         OL8A==
X-Forwarded-Encrypted: i=1; AJvYcCWxZvUXECfucQaKYAzujhSYRlPA732+qJksVhGtWqttuHMjKzl6wphHD/rocxexqlsX5PE/U5hU38g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxgqdl6Nhufth7Jlt89lOVF/n1/nkvNAOGDxINlieocTZsTTv7V
	UDDVERQrE/prl+MIssV8unzJvAcBvuBM2P+1QF3yZXAo2TpcRXUONWV4bABDLnjnjQ==
X-Gm-Gg: ASbGncs5eJIG99a/cuALEwvBsof+Jd2KrQmAhlsklvm/x70dQF1ImfkhLfMdYklhqni
	0Q0KH34sO7+2fxtrmGnDnEOvICMwMmW+cGLwTDCNCfoa8i/5N1yichXI0E9DJDeD1cYFBNB6mgm
	HHMDF7BUEnVMKWj633uqbmCw6l8eJqkOypwXB1vcPlNhJLYyqyqCAmaYGYJv8/sfOP5rnEjgqTc
	8CT1is9oC0K/l2P7MsKBtw33ESypoDeNgKgdiTtWX4lfyKOnY+RT0iy7zXZXrNi2hoTC8APdimj
	S2wvgp2PXharsMj4e0V1qcwPT0tVI9ns0MX851+Bxay2Jb5/Pblf0wyATTcQdInZ+uDq4L5hpLF
	euOm5FfkMHLsQcr0Q9BGklGkxvc9JfhJuhVGyfhaBRNG7yZvocHbmPwSx0F76XOPIHj7chTreTr
	b6C9UY6ryctk6RJvp67QS5GTXEvuNUr4ifaOMw
X-Google-Smtp-Source: AGHT+IHwu1ZLKS8BZoiUlX4l0+8OItCX6xagYioBE4R5uI5gabL0xK1Z78PmPMxE1EeSbBzuQe6A1w==
X-Received: by 2002:a05:600c:3483:b0:46e:1b89:77e5 with SMTP id 5b1f17b1804b1-46fa9a996cbmr177961025e9.12.1760455876439;
        Tue, 14 Oct 2025 08:31:16 -0700 (PDT)
Message-ID: <c790efe2-d4cd-46ed-b2c6-27da157de762@suse.com>
Date: Tue, 14 Oct 2025 17:31:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21??? 3/3] x86/vLAPIC: properly support the CMCI LVT
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <amc96@srcf.net>, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
 <61a05ec1-aca7-4c3f-be6f-1bb053b2cd00@suse.com>
 <4477b803-4941-4032-be83-85cc126ceacb@epam.com>
 <8161d5b7-cc0e-41c3-8664-620988bc399e@suse.com>
 <2c9297b8-d4a7-4391-8e39-82a2c0245e0c@epam.com>
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
In-Reply-To: <2c9297b8-d4a7-4391-8e39-82a2c0245e0c@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.10.2025 16:12, Grygorii Strashko wrote:
> 
> 
> On 09.10.25 18:37, Jan Beulich wrote:
>> On 09.10.2025 17:08, Grygorii Strashko wrote:
>>> On 08.10.25 15:09, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/hvm/vlapic.c
>>>> +++ b/xen/arch/x86/hvm/vlapic.c
>>>> @@ -31,10 +31,13 @@
>>>>    #include <public/hvm/ioreq.h>
>>>>    #include <public/hvm/params.h>
>>>>    
>>>> -#define LVT_BIAS(reg)                   (((reg) - APIC_LVTT) >> 4)
>>>> +#include <../cpu/mcheck/x86_mca.h> /* MCG_CMCI_P */
>>>
>>> This include... You probably do not like it also
>>> It is dependency outside HVM code.
>>>
>>> I've been thinking about something like vlapic->caps which can be filed before vlapic_init()
>>> or passed as parameter, but seems x86 toolstack is considered to be able overwrite anything,
>>> including v->arch.vmce.
>>>
>>> Seems, no better options here.
>>
>> Same here, hence why I used it despite not liking it.
>>
>>>> @@ -697,8 +701,17 @@ int guest_rdmsr_x2apic(const struct vcpu
>>>>            return X86EMUL_EXCEPTION;
>>>>    
>>>>        offset = reg << 4;
>>>> -    if ( offset == APIC_ICR )
>>>> +    switch ( offset )
>>>> +    {
>>>> +    case APIC_ICR:
>>>>            high = (uint64_t)vlapic_read_aligned(vlapic, APIC_ICR2) << 32;
>>>> +        break;
>>>> +
>>>> +    case APIC_CMCI:
>>>> +        if ( !(v->arch.vmce.mcg_cap & MCG_CMCI_P) )
>>>
>>> Could it be done using wrapper, like vmce_has_cmci()?
>>> As this is Intel specific it's candidate to be opt-out eventually.
>>
>> Possible. I wanted to limit the churn, hence why I preferred not to introduce
>> a wrapper. Such an abstraction I wouldn't like to be a function taking a vCPU;
>> really this should be a domain property imo.
> 
> My intention was to limit spreading direct access to "vmce" data over vlapic code:
> 
> static bool vlapic_has_cmci(const struct vcpu *v)
> {
> 	return v->arch.vmce.mcg_cap & MCG_CMCI_P;
> }

"vlapic" in the name makes it seemingly better, but not really. As before: I
think such a predicate should be taking a const struct domain * as input.
Unless of course we expected that different vCPU-s in a guest may have
different settings of the MCG_CMCI_P bit.

Jan

