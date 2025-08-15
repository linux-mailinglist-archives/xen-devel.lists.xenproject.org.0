Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB6CB27B20
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 10:35:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083005.1442680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umptr-0007Co-8F; Fri, 15 Aug 2025 08:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083005.1442680; Fri, 15 Aug 2025 08:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umptr-0007A6-4y; Fri, 15 Aug 2025 08:34:59 +0000
Received: by outflank-mailman (input) for mailman id 1083005;
 Fri, 15 Aug 2025 08:34:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umptp-0006eT-Un
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 08:34:57 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b94ae9b4-79b2-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 10:34:57 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afcb7347e09so280764466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 01:34:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72d95sm90502866b.33.2025.08.15.01.34.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 01:34:56 -0700 (PDT)
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
X-Inumbo-ID: b94ae9b4-79b2-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755246896; x=1755851696; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+xOSjCohFmefKXh7W/af4tIQMWDxymb30IEjQgi7Y0g=;
        b=NMXMLKrMu6Q6xXaYxqoCCzDjw5kVxPP0G9VdbWcD2uI0i1tyWbp2m7dlhMfiAuwGa0
         /w5HPKicCV6qJgFksmhDzrrZR0p1LkbukNisU4g/0vwHovYiqg6Zw4yvBCkdlC+i9WqX
         gOr1NAVZpJdh5KRWsO0KiaWJhb1ittKcmBlYz/saoBS5Mc/yeg13qrwi2uyHCWSEMBpB
         A/6k6v+N5acSaRtu4KozBf0p67GE9TnQoGv4n3+Zi0M2BURNm+VgE34U1m5iqd6dZ22R
         L/BS4fPFz7VIFZi3fW9Q5cO8mmG9KTzBbhbGduPO8qcGinzDS8LfdcdeBtUOL83O5E3d
         bNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755246896; x=1755851696;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xOSjCohFmefKXh7W/af4tIQMWDxymb30IEjQgi7Y0g=;
        b=rf9gWHo7YEbab/N4tEVkHrX2g04+vv9vaVDyktFHyjSSxAu+UQlUnr5rpHcO8Ch4s6
         8b6kc7PNFd39HGcz4M+UB2A5d1CW2zkGIigJ8Uc0xXKdXAtm0PcRsPEKIqxwASEMdh9e
         4KdqgPuMUKNZ5IPP3XZe6TQ3xK82r4Z5ByIUrDOa18DDQ3n9eOYfXBHXIpitHcvDJZau
         yZ28TUw5AnVLpS6aYBQ5/pBZGS2jkqdW6fEn/4EHWpIOUkUHnQkazcm5o9cYzb/CrBef
         Gf6v+xizrN+IK6Syc5XtdJ7Yg9X8l+TEmpbNnIowuf4xY6A37/oLmZfH/NNzT2vaR8t6
         cV5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkaSpWTHvwIs0/Xb1u2T2CCJ1VbyugQuEcusO/68C75AiABKmlO/j0PK7o/DUqE+EBHGdSEAK+wQ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMSxVop/T2dPTdAhA/lZ9H7E/5crDa+WLVvIZpt0vGyPpzk3yy
	RqlXXw0dGQnUuSsujIL0M0dIedHsW1GMPp0YuOZP22ZcDywco3uFJoUKL0NhNLyR73MzzskEf6t
	+o78=
X-Gm-Gg: ASbGncvxMhme0onZ19ie4P0DpCqzwHtKxsBGK91MC/5pev//dU9VHNSTFV1lgQUaHzk
	+4uiIfv0KmsM3HFCvosfjg+7CtRFRbPKclVZPQIG/PqIvJMJbfyfpk6NtlpqiG2HGbipBK00AK6
	YnumN01vqESIA8P3UXYoUzgL+4wwKbBsOBepZxYqcsGCJBhPgoejh3+CrDZutZhQjJqWX2O7ctS
	I0GpQsBcad9O/vIS7gAoC4ULG6RuaP47vMXl6HUdxxx7St/vxnkx62kD+Yv6ZMTwERkQXkIAmZX
	LC2Yj8SqtyPdabDeS/EOi+uswWulxAvaPvSU/h5dUqqNqL+0pHQv4sIcVzRCPbsY/l9Y+uMbAcY
	CKh90aSYto47qQdS4ZqEvaJbSi7gdxptEtFgBTMgQL0bVX5Mg0OsWzauWVXeHC7g4R5IP4NSySj
	xz6YGuK2EVvzi7yVFX73dvb9bKSD0/
X-Google-Smtp-Source: AGHT+IFGJw5SdHwxPN12saWkad28wcxdI2EdUfdE+ir9kX3EoH/Sgbd7S6ScTEsdy3X7+hnAHtO6QQ==
X-Received: by 2002:a17:906:7307:b0:af9:81cd:ccd9 with SMTP id a640c23a62f3a-afcdc2d947dmr108010066b.28.1755246896527;
        Fri, 15 Aug 2025 01:34:56 -0700 (PDT)
Message-ID: <689c255e-ebea-4454-80e3-3731b4d12781@suse.com>
Date: Fri, 15 Aug 2025 10:34:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/22] x86: FRED enumerations
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-14-andrew.cooper3@citrix.com>
 <9b4da5b3-dd68-4052-92cc-fe322164eaa5@suse.com>
 <737eab59-f016-426a-ba6e-e6c7a58a9e61@suse.com>
 <79521edc-34d9-4364-922d-158e93fcbc04@citrix.com>
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
In-Reply-To: <79521edc-34d9-4364-922d-158e93fcbc04@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2025 20:45, Andrew Cooper wrote:
> On 14/08/2025 2:19 pm, Jan Beulich wrote:
>> On 14.08.2025 13:20, Jan Beulich wrote:
>>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>>>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>>>> @@ -310,7 +310,10 @@ XEN_CPUFEATURE(ARCH_PERF_MON, 10*32+8) /*   Architectural Perfmon */
>>>>  XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
>>>>  XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
>>>>  XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
>>>> +XEN_CPUFEATURE(FRED,         10*32+17) /*   Fast Return and Event Delivery */
>>>> +XEN_CPUFEATURE(LKGS,         10*32+18) /*   Load Kernel GS instruction */
>>>>  XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*S  WRMSR Non-Serialising */
>>>> +XEN_CPUFEATURE(NMI_SRC,      10*32+20) /*   NMI-Source Reporting */
>>>>  XEN_CPUFEATURE(AMX_FP16,     10*32+21) /*   AMX FP16 instruction */
>>>>  XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
>>>>  XEN_CPUFEATURE(LAM,          10*32+26) /*   Linear Address Masking */
>>> I'd like to note that we could long have had this if my long-pending emulator
>>> patch had gone in at some point.
>> Actually what I further have there, and what in the context of patch 15 I
>> notice you should have here is
>>
>> --- a/xen/tools/gen-cpuid.py
>> +++ b/xen/tools/gen-cpuid.py
>> @@ -278,7 +278,8 @@ def crunch_numbers(state):
>>          # superpages, PCID and PKU are only available in 4 level paging.
>>          # NO_LMSL indicates the absense of Long Mode Segment Limits, which
>>          # have been dropped in hardware.
>> -        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, AMX_TILE, CMPCCXADD],
>> +        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, AMX_TILE, CMPCCXADD,
>> +             LKGS],
>>  
>>          # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
>>          # standard 3DNow in the earlier K6 processors.
>> @@ -347,6 +348,9 @@ def crunch_numbers(state):
>>          # computational instructions.  All further AMX features are built on top
>>          # of AMX-TILE.
>>          AMX_TILE: [AMX_BF16, AMX_INT8, AMX_FP16, AMX_COMPLEX],
>> +
>> +        # FRED builds on the LKGS instruction.
>> +        LKGS: [FRED],
>>      }
>>  
>>      deep_features = tuple(sorted(deps.keys()))
> 
> Hmm.  Yes, but normally this is part of guest enablement.

Hence why I would have wanted the emulator patch to long have gone in.

> Having now done the Xen work and concluded that we don't actually need
> LKGS, I'm rethinking the linkage here.  It's probably the right thing to
> do in practice, but probably needs a bit more in the way of
> justification.  "built on" doesn't quite cut it IMO.

The comment can be adjusted (or dropped). Im "builds on" is quite adequate,
as without SWAPGS you won't really have a way to get things working in an
OS without having LKGS available. In Xen we're in a slightly different
position ...

Jan

