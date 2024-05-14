Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE9E8C57DA
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 16:24:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721563.1125066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6t4V-0008Tg-2Y; Tue, 14 May 2024 14:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721563.1125066; Tue, 14 May 2024 14:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6t4U-0008QU-VM; Tue, 14 May 2024 14:24:02 +0000
Received: by outflank-mailman (input) for mailman id 721563;
 Tue, 14 May 2024 14:24:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6t4S-0008QO-Tc
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 14:24:00 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b038561-11fd-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 16:23:59 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a59a5f81af4so20607166b.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 07:23:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17fdesm727650266b.220.2024.05.14.07.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 07:23:59 -0700 (PDT)
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
X-Inumbo-ID: 9b038561-11fd-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715696639; x=1716301439; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JCRGASo4IlSi0Q0MtIL47B4S6DbaI3hI8yYBGuEb0pQ=;
        b=g/rjmTK4fE6Q3Pdyxt+vKdGd/Wb8cnv2hTRT9x3tsSwN0e6EAYtjMyUkFklbSOYwgB
         pps2UEJlb8B9UeFCerulvWrbJZUu3PQaQp3SIT+lmvWQwizkG3asppzPpokf04plqpOn
         3NVNfAEyG+FtbG+JCXD56ZfAUcLIpQ96Ux++Z728nB9gKrrf3coiuHNe9pjYwYyR+CmX
         AdDf3dHIIupz+vyA4nY/XjDg6FP743XNCs7dR0X+OT9wuMsS7ORDBSgKtVZ9bWufDw+t
         L44Dfiug+cWxXh66tRI+0RYY05pkh/f+dI+8jPES0OLQbvcGWB4EKj4LCcbCQOZGIPW/
         HWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715696639; x=1716301439;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JCRGASo4IlSi0Q0MtIL47B4S6DbaI3hI8yYBGuEb0pQ=;
        b=YzAVO1/dnR5if/G1vvBHAu0mE8lUPu7Lxzy9q7EwB8kt9oa+SVsF7gLiIdycBFXltF
         D2rH2Jz3tr8nyUyff4pgBIckTpe+5obKdv4su/+8LIgKfg79+eDnaMWVBc/cVkDiBTHl
         h2ystE/Fj9OLa6MugYat8Osy7YGQFA33RxbTpBjxJhS9OOmonvn0fjJ7GffRSXsiesTh
         IJ//Fv/YtXpLDH+6c1VFtF7C+b0102EUi1YoWB12hi+7XwP8K1PEWGBUbYpsCPZohetG
         +H19Jri13x/G7BZTxBE6hNYVfJfjDwsVd6Q8Zm/YBy1BlDkOh2Nm1PGUJZzEiW1Mclj9
         o/Cg==
X-Gm-Message-State: AOJu0Yy2OlF12vS1TZ6YIXxc/eQWvhBaXermHrtBNgzPRM3nskFxaFo/
	WdF7Fp0S066xAOU/2GsD6t+nAq+zCpOIHu8rbvO+UPpYEbQmf4xqzvP4rvuDXQ==
X-Google-Smtp-Source: AGHT+IECsrh4EtsS3we+P+JjNKQta4lQtwZkQCy2OrIz549hLCfFg5bhPnivz8WUFzZKAmFfzC9dsw==
X-Received: by 2002:a17:907:1189:b0:a59:ba2b:590b with SMTP id a640c23a62f3a-a5a2d6bed92mr874956566b.71.1715696639305;
        Tue, 14 May 2024 07:23:59 -0700 (PDT)
Message-ID: <bcae705d-ebaf-48f8-8217-ad2d917f90e2@suse.com>
Date: Tue, 14 May 2024 16:24:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v2 2/3] xen/x86: enable altp2m at create domain
 domctl
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, =?UTF-8?Q?Petr_Bene=C5=A1?=
 <w1benny@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240508112323.38946-1-roger.pau@citrix.com>
 <20240508112323.38946-3-roger.pau@citrix.com>
 <d43a704a-fd2a-4778-9250-a69b483016b4@citrix.com> <ZjyH6f-diiqLO-0D@macbook>
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
In-Reply-To: <ZjyH6f-diiqLO-0D@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.05.2024 10:23, Roger Pau Monné wrote:
> On Wed, May 08, 2024 at 08:38:07PM +0100, Andrew Cooper wrote:
>> On 08/05/2024 12:23 pm, Roger Pau Monne wrote:
>>> Enabling it using an HVM param is fragile, and complicates the logic when
>>> deciding whether options that interact with altp2m can also be enabled.
>>>
>>> Leave the HVM param value for consumption by the guest, but prevent it from
>>> being set.  Enabling is now done using the misc_flags field in
>>> xen_arch_domainconfig.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Changes since v1:
>>>  - New in this version.
>>
>> Ha.  So this is actually work that Petr has been wanting to do.
>>
>> Petr has a series hoping to make it into 4.19 (x86: Make MAX_ALTP2M
>> configurable), which just missed out on this side of things.
>>
>> altp2m is not architecture specific at all, and there's even support for
>> ARM out on the mailing list.  Therefore, the altp2m mode wants to be
>> common, just like the new MAX_ALTP2M setting already is.
> 
> Initially I had it as a set of XEN_DOMCTL_CDF_* flags, but it wasn't
> clear to me whether the modes could be shared between arches.
> 
>> Both fields can reasonably share uint32_t, but could you work with Petr
>> to make both halfs of this land cleanly.
> 
> I'm happy for Petr to pick this patch as part of the series if he
> feels like.
> 
> I assume the plan would be to add an XEN_DOMCTL_CDF_altp2m flag, and
> then a new field to signal the mode.
> 
>>
>> As to the HVMPARAM, I'd really quite like to delete it.  It was always a
>> bodge, and there's a full set of HVMOP_altp2m_* for a guest to use.
> 
> I've assumed we must keep HVM_PARAM_ALTP2M for backwards
> compatibility.
> 
>>> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
>>> index 20e83cf38bbd..dff790060605 100644
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -708,13 +711,33 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>          }
>>>      }
>>>  
>>> -    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
>>> +    if ( config->arch.misc_flags & ~XEN_X86_MISC_FLAGS_ALL )
>>>      {
>>>          dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
>>>                  config->arch.misc_flags);
>>>          return -EINVAL;
>>>      }
>>>  
>>> +    if ( altp2m && (altp2m & (altp2m - 1)) )
>>> +    {
>>> +        dprintk(XENLOG_INFO, "Multiple altp2m options selected in flags: %#x\n",
>>> +                config->flags);
>>> +        return -EINVAL;
>>
>> I think this would be clearer to follow by having a 2 bit field called
>> altp2m_mode and check for <= 2.
> 
> Don't we need 3 bits, for mixed, external and limited modes?
> 
> We could do with 2 bits if we signal altp2m enabled in a different
> field, and then introduce a field to just contain the mode.

I think what Andrew meant is

#define XEN_X86_ALTP2M_MIXED   (1U << 1)
/* Enable altp2m external mode. */
#define XEN_X86_ALTP2M_EXT     (2U << 1)
/* Enable altp2m limited mode. */
#define XEN_X86_ALTP2M_LIMITED (3U << 1)

(leaving aside the x86-only vs common aspect). That would also eliminate
the ability to request multiple (conflicting) modes.

Jan

