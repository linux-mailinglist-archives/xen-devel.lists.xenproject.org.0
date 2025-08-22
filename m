Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACB3B30EE1
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 08:25:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089552.1447080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upLDX-0004gG-2i; Fri, 22 Aug 2025 06:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089552.1447080; Fri, 22 Aug 2025 06:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upLDW-0004de-Vu; Fri, 22 Aug 2025 06:25:38 +0000
Received: by outflank-mailman (input) for mailman id 1089552;
 Fri, 22 Aug 2025 06:25:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDWw=3C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1upLDW-0004dY-E9
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 06:25:38 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce77076d-7f20-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 08:25:32 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-618b62dba1aso2477643a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 23:25:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded3582basm554420666b.52.2025.08.21.23.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 23:25:32 -0700 (PDT)
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
X-Inumbo-ID: ce77076d-7f20-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755843932; x=1756448732; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bXfgOZNsIf6Epfc2/bUBmtlBrDI2ZbKRjFkx8Vz4YK0=;
        b=KEYrLbYTMV0y8a5ZGSZQkOxzrnt0FX5WPzbGqc4Vw/0rM5EIFZ8Bs6EKATWv0VKKIe
         lExbjiVO2IXHVFw6ZN5cowVD3HlEwMUthMwCXB2n4Q16mBsFqzr3JlVGYIGVuxsWWlun
         NwbfiE7ecqPlCydRXS7wRfavmFzEcwp67Qu6P3Gyf9dlyCome+eRl41j7SpvVAy3uhuc
         bNifxamlzMp6wt8BZzn5QuHJJRsGY4OWX0p7Om3b3IdSGc5EmD2qeU1+C8+JtgylhH5R
         5apB0i0HLSyENISk9COi/9XAMRoDw/qukc+x5+Neluw50xYaYHYyWi5cWFRAfCdk2bWB
         sq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755843932; x=1756448732;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXfgOZNsIf6Epfc2/bUBmtlBrDI2ZbKRjFkx8Vz4YK0=;
        b=IMaQcI23zMZlW47GY2d7IumTNK/+pakXo8DV9+dJSpADxcLcf/eKtiWy+mj0AfPjqK
         zhdUny7oQqxeA8rRWd6GB340YaWWQ68iBOrAV6sVfB5E1V5x4dWJmHZ+dO0/rPA/cSnC
         cNqhe4r14eyQepn0NxXs+xDpY4mMLhEh1EJnNQKG/ssbwxoiTi3N3M+/dvrEcjruFTaJ
         kLdSGPV9CrkGGbYPHrGWxBxmyeVEQInZrTQKV2NxaHfNcHdrpzC4AYuO3ylvnzfk/7o/
         Qm1PR5AhwvL2HNLzCMBhJB6H66uoitu73xLLDFFiweXbEXG4ToFcnPjNSRDBGuEfNt9B
         Xuhg==
X-Forwarded-Encrypted: i=1; AJvYcCVSvgmrfBRpzNWQ1/7m39qg/HiWDIGYL4DSywbApSQkUQ51bYAXsz6EhtprllQ4tPxLCIVMZEKVUxY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6Z919XnGGr3pZBNjSxaVf6DZSjTpc/ANsJHQKGQNEMgaxrrnz
	TsCbfUYA19LsVpHyjP4puU9ODtkwe2Nyj74A+lzrZdr8K74p7BoAVaFsPUpw+D+Xdw==
X-Gm-Gg: ASbGncvsl/pNtXCtEfrlnbXb0Tcr9XRqK2VAJc3+rem1cmh1CUeXyrPDGX7pVofIwdT
	QKINeIFPSXDZwyDVC98gWUaNkn6yfyQ6z2ky8US6b47M5AgoWnDnheruxPMHFTZr0qqJ4YV+EP7
	XynTyaDApkrv1fjQxkqTDCkdDuykaRohRG9qFsYrYpVAt/MaYehkPlVDLpMo67RjA6RqUZ8Eirj
	E3XsKv8gNmNniXJon9p/M1dvpgmZrDhTIezee1wd8iLRpK48ah0IUJwEwvoXqST2Si3XlkT+loM
	NVROhT4kBNvRjK3/r0oZLKVcQ8l4gYTm+CsxXSfn4UpTk9eSpAkCIDzwJ/+5aoWZhHNOYQMOxFA
	H4EjvsLxHwt9KEmQCOqUVetdMZi+tCvkcjUekyVpjTBX9b5/2LDSly8U31Bx3mB+7IHC7PilWqP
	Gb2xIM01o=
X-Google-Smtp-Source: AGHT+IE42nFypcpW2scHmDblU3fv+B5UAVjwtCbhYPyjQ4EHDDDnjnVdswVk7TFDhrfIa+jPWW2UCg==
X-Received: by 2002:a17:907:1c99:b0:afd:d994:7d1b with SMTP id a640c23a62f3a-afe29749978mr144111866b.64.1755843932322;
        Thu, 21 Aug 2025 23:25:32 -0700 (PDT)
Message-ID: <98e30ce6-92a9-46f5-8f36-5f4946b4691a@suse.com>
Date: Fri, 22 Aug 2025 08:25:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/16] x86/fsgsbase: Split out __{rd,wr}gskern()
 helpers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-15-andrew.cooper3@citrix.com>
 <740ce507-de96-41e0-a5ae-999b5b6d8726@suse.com>
 <4d07f29b-006a-46ea-845a-3f21ce246f44@citrix.com>
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
In-Reply-To: <4d07f29b-006a-46ea-845a-3f21ce246f44@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.08.2025 22:20, Andrew Cooper wrote:
> On 19/08/2025 2:01 pm, Jan Beulich wrote:
>> On 15.08.2025 22:41, Andrew Cooper wrote:
>>> Right now they're inline in {read,write}_gs_shadow(), but we're going to need
>>> to use these elsewhere to support FRED.
>> But why "kern"? We're not dealing with GS in kernel / user terms, but in
>> real / shadow ones.
> 
> Because it's a common name that also has the property of aligning nicely
> when used beside GS_BASE.
> 
> But fine, I'll rename it.
> 
>>  I'm also not quite happy with the double leading
>> underscores, fwiw.
> 
> Consistency with the similar logic.

Yet making for more changes later, once we mean to strictly follow the
respective Misra rule.

>>> --- a/xen/arch/x86/include/asm/fsgsbase.h
>>> +++ b/xen/arch/x86/include/asm/fsgsbase.h
>>> @@ -32,6 +32,17 @@ static inline unsigned long __rdgsbase(void)
>>>      return base;
>>>  }
>>>  
>>> +static inline unsigned long __rdgskern(void)
>>> +{
>>> +    unsigned long base;
>>> +
>>> +    asm_inline volatile ( "swapgs\n\t"
>>> +                          "rdgsbase %0\n\t"
>>> +                          "swapgs" : "=r" (base) );
>> Again strictly speaking "=&r", if already you open-code rdgsbase() now.
> 
> As before, why?   There are no inputs to be clobbered, early or otherwise.

Hence why I said "strictly speaking". Inputs or not imo doesn't matter in
such a decision; that merely makes using the early-clobber form benign.
The sole criteria by which I think one ought to go is whether a register
is altered solely by the last (often: only) insn. IOW it's again more to
prevent setting a bad precedent. Here things are easy to see, so a
hypothetical future change isn't at much of a risk of breaking things. The
more complex asm()-s get, the easier it is to overlook a missing early-
clobber when making some change.

Jan

