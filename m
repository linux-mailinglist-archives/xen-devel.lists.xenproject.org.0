Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 517C8B17CA5
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 07:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066814.1431879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhijk-0001x6-Gi; Fri, 01 Aug 2025 05:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066814.1431879; Fri, 01 Aug 2025 05:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhijk-0001vB-E0; Fri, 01 Aug 2025 05:55:24 +0000
Received: by outflank-mailman (input) for mailman id 1066814;
 Fri, 01 Aug 2025 05:55:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhiji-0001v5-PD
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 05:55:22 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bf86781-6e9c-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 07:55:21 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b78a034f17so370718f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 22:55:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899b5e5sm33201385ad.124.2025.07.31.22.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 22:55:20 -0700 (PDT)
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
X-Inumbo-ID: 1bf86781-6e9c-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754027721; x=1754632521; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OeMBKb7OWna1CoAfKsX4bSslW07EGIW7m/Wk47pqeNI=;
        b=QUacE5GF+ixr9FqDOJFOaF9ZSW8OCo67zUhmTCSInAhrnHt1GbJL300/H6AjPwubUr
         ziLaRvkVKlGa8OXml79hgmcOWyZRGGId5J0exG6MwTVkWlKTCgRUhLsornyqLjf0CDxp
         C1UWnBM4k/omDGRo++BLD+geTWoK/AC1ZfeMIxxjqPekcIf6S+HhIhU7ink1plx+2qUl
         199D3nznW/l+eWKhjPCoSmJ/EnuuT32gcx+t2kWP+m4BQzd3iVgbOxnXrGBSgbgp2hEl
         JwGxjm4XwcGrO6r1nVAdWDyGYe+0qnbBvAp14zjVZPsLsFUHco8Q+LVYscSWqIHpBNXu
         QAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754027721; x=1754632521;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OeMBKb7OWna1CoAfKsX4bSslW07EGIW7m/Wk47pqeNI=;
        b=hrOdxOnIuC8qoFagfYLsbBogmEekxoTdaPmZ6hfrfvrhX2jtmxBTFGg8URhHGHPLPs
         4g0Aek7G5rAMxCVtfrCcIEVXw/buedgRaRpZqIuD+PXR9FnPKBD7Zdxw9Wya+Xy2YsNv
         26fe+ebatVoCqx8L+gf7mehj8FsBRaX1DpuVib62ukhNqcHq4KJDWdk/itKxwtfis7pI
         NsAEBqFO5KOGonF8j7rrYaWzt9AN+rJQbhxtfEN/qfsliLQADmDrnHonq/EZDzTW5T7G
         Dc0oMPZjYcIRbp2AeVVz6Wths2AtW0BGmWvMtqw2+7/gKHmXUFY/8PsX5EU3fRI5MeeF
         cuxw==
X-Forwarded-Encrypted: i=1; AJvYcCWsADkNBXhV9IsqNOhW859EWir8frv/G3h/YKuiypOkYu5eUfkOuMkmREIqVVSW1WczsxrRt79Q6Tk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzeAiGfdzTk0BW39qFPfv8VbPYdXEeiNoK3+HS59uhHP8kPleII
	TpoB7RJucuxKbG/RdVQ/OBO/a4X1R0pACOGHNUaCZw9CB1vaX3OTaOlfj0fafPW+ug==
X-Gm-Gg: ASbGnctFqrS55+4S6ypRa7Vvr7lm2YQmh/BkqVUZMLZaGnvAGxBVTTOA172kJrpIkUH
	v68gD2Wv9OQb5CRAHKOkRDUV4KHF8z903MfGLxzn1oEjqy8jzQDmri7yoIqiWKcYhr6kNWp74gv
	NL+nf3BTrAXReRUuzzbTnWyG+Qx6r9/9Mgh8Nnsqux4NDsAFTKKGfXVT12L6BxmT3RmZJHt7WWe
	7hLrvvLN/1e6zorTGC5CDydRuMzD7JOx5M3XwYIbqJCPGEXUL+AU8BANvp7p4md8JfbwQsQY/19
	eMpBaweGEcgArpUYBqxcQ1GVTa+iL+Pw2Qs85GnOxiDchQsd+Vp8EaCd7Jo2ZakK1aMiYYR1BqH
	5q8Wu5yXanhjIW7Yzjl8ce9N3KvlvdkTAAU7ZrnJ+wqcE6CGg3ckv+01lq1U+JS07CY9xh8hOct
	qUxjVKiH4=
X-Google-Smtp-Source: AGHT+IGU3nhlkHP+8ZTq24z4kTPWBEx1Yyjn/MSMbP16VvM8sDhfqB9/k2NXx3pxgUuuQsZ7enp29A==
X-Received: by 2002:adf:fa11:0:b0:3b7:925b:571c with SMTP id ffacd0b85a97d-3b795025c18mr5787090f8f.57.1754027720712;
        Thu, 31 Jul 2025 22:55:20 -0700 (PDT)
Message-ID: <4f12dbce-29a2-4fba-9a44-669109fed450@suse.com>
Date: Fri, 1 Aug 2025 07:55:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misra: allow discarding 'noreturn' during function
 pointer conversions
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <63d5d311e6502d5b957009be59e1c97599015b46.1753911912.git.dmytro_prokopchuk1@epam.com>
 <46e8dd16-11e4-4d96-95cb-f13b652e7317@suse.com>
 <0999ccba-37cf-4222-8b6e-82aa95371b75@epam.com>
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
In-Reply-To: <0999ccba-37cf-4222-8b6e-82aa95371b75@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 18:48, Dmytro Prokopchuk1 wrote:
> 
> 
> On 7/31/25 10:20, Jan Beulich wrote:
>> On 30.07.2025 23:47, Dmytro Prokopchuk1 wrote:
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -342,6 +342,12 @@ Deviations related to MISRA C:2012 Rules:
>>>          semantics that do not lead to unexpected behaviour.
>>>        - Tagged as `safe` for ECLAIR.
>>>   
>>> +   * - R11.1
>>> +     - The conversion from 'void noreturn (*)(void *)' to 'void (*)(void *)'
>>> +       is safe because the semantics of the 'noreturn' attribute do not alter
>>> +       the calling convention or behavior of the resulting code.
>>> +     - Tagged as `safe` for ECLAIR.
>>
>> As before, imo such a deviation should be generic, i.e. here independent
>> of what parameters a function takes. If that can't be easily expressed
>> to Eclair, then that wants stating as a justification for the
>> deviations.ecl change to not fully cover the deviation we put in place.
>> Having the textual deviation generic means later possible needs can be
>> easily addressed by just a deviations.ecl change, without any adjustment
>> to the deviations themselves.
>>
>> Jan
> 
> Hi, Jan
> 
> Currently Eclair checks exact pointer type 'void (*)(void *)', as 
> described in the configuration:
> 
> to(type(pointer(inner(return(builtin(void))&&all_param(1, 
> pointer(builtin(void)))))))
> 
> Nicola wrote: "then if it needs to be extended when more cases emerge I 
> can do that".
> 
> So, for clarification.
> 
> 1. In the file "deviations.ecl" I leave exist description and config:
> "The conversion from 'void noreturn (*)(void *)' to 'void (*)(void *)' 
> is safe because the semantics of the 'noreturn' attribute do not alter 
> the calling convention or behavior of the resulting code."
> 
> 2. In the file "deviations.rst" I change the description to:
> "The conversion from `void noreturn (*)(...)` to `void (*)(...)`
> is safe because the semantics of the 'noreturn' attribute do not alter
> the calling convention or behavior of the resulting code, parameter 
> handling remain consistent."
> 
> 3. In the file "rules.rst" I change the description to:
> "Conversions from 'void noreturn (*)(...)' to 'void (*)(...)' are 
> permitted."
> 
> It means that only "deviations.ecl" needs to be updated if a new 
> deviation needs to be addressed.
> 
> 
> Is it OK?

Yes, with the patch description also suitably adjusted.

Jan

