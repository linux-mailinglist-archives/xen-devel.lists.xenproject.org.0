Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8FF9EB36C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 15:34:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852562.1266321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1Jm-00048o-Mt; Tue, 10 Dec 2024 14:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852562.1266321; Tue, 10 Dec 2024 14:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1Jm-00046i-KE; Tue, 10 Dec 2024 14:34:30 +0000
Received: by outflank-mailman (input) for mailman id 852562;
 Tue, 10 Dec 2024 14:34:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL1Jk-000443-Um
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 14:34:28 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc438098-b703-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 15:34:28 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385eed29d17so3836639f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 06:34:28 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434f39653c6sm97268075e9.7.2024.12.10.06.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 06:34:27 -0800 (PST)
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
X-Inumbo-ID: dc438098-b703-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733841267; x=1734446067; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eP4phFgs+v8HUdiuLF/dOdt+yySmdFu8NJLZ/FDbxtk=;
        b=Qc8J4DbIF4M+BkjHiGMSVe1i4V6q3CM4rEPgtZ01UELGcAptQdZhjdvM0VAuNcsrJk
         qGHYic4kPoDPDfTmqhuVnjns95Gqkh93fzJz33goWtQZ4d3zb5AgNFSFQtb3jyyT2LtY
         5UIeS1jgoMfjakZo8ZnIn0sZieLaj4TvkSk/ayiqAUqCZGeTIcEGOc/FLYvXBzMQen9e
         pgkun1xSLSYJZm7OdcS4z/e+HQ5hFTBjpkndJoDrHeMPZHLsRMSEhD9UMvQeufeMyeQP
         f+vhp8mBJdmfQqLFtxlUzUp4yVrESTkstQziwQ4n/2dhq+bujf2aIfx6TPoicXBYTNsF
         BMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733841267; x=1734446067;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eP4phFgs+v8HUdiuLF/dOdt+yySmdFu8NJLZ/FDbxtk=;
        b=GUBk1PdZAj17u6mW6WlljdOBLoxkKZPVGCTYQSifs2gEaPGqGH/zH7Oa01YTuUxWlH
         +xZpuuFWqHQ7WLqhfLXTEE804SoiMCorxm+vZz4ZPs1ccD06ZHNW7ykDpeAbzVmmUw4d
         FeiDwq/+WElg8wYH1ETOra/jPQ71n9VjZxOjsx5RZnaAjmQsFy10ECxFUCiJfGFGTxyL
         vZRxwkCRhCKCMAU9N07pzT21Llv9J3PKpropGytNXzrpXaetcCHEgRcBXVuTdnk3jNjN
         uCLcplGXUkbFVFi0BNgLxqMebmRV7PyzcfyZzsfbiR4cjcNmLntCh4vXZL14RM/7MlOz
         63GA==
X-Forwarded-Encrypted: i=1; AJvYcCX5PYeL/RohugxrdjO1YoW8LKSAvecqqDrlBDAlGRBt+yqJQNv+yoT4GRWn0Y9w9NK4TirTChnZi/E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmRBzNc7sij70XepHcg+K9wvshgoSNLUMcnAyXbQZVdRx5/q90
	fzvzWg0dYxHjVH2BtwbNBaWcAa17Uf2JjWdrwDrv+2jKdhDXJlQuFuVCuf9a8w==
X-Gm-Gg: ASbGnctiEWD8sCbPuJLcmndlL+jar44bfrx8Jjk4IsE6JWwyk/L1jYjS1XY4ykpAUv6
	/WhzA2mUpzFM7gWwOI8Lfn1H18Ir1Wdcjemd4jgh+wKSdMRDe6eRaLc4OnAv4FMU2NWc7wqrteL
	YCNt+FwR3tG9UxcM5Sru65QAi4dHwFSiVLXCmjF42jhfEnfZmqekFAtHjQokbjMdEGg6sFp5bFm
	8brasFCmiZXCLx72nYRd91o82tRY3z2InkFpk5t8u/lYEDH9uG7p3KXeUDM+nCEsp5fCnAY1oey
	RWSi1GmXXmFx+nJc5QHzYW48SPFEZXGX8Ib5kIYiNGI7cedwsyrLtYZJ7syK/cDAyO4cyQdPMwz
	i9YS5CPO6KA==
X-Google-Smtp-Source: AGHT+IGMEUdfaVBKCCQfllGOU2wQDuHePuGnVYs2LyFayWJtBfpFkwjwB1Lz6QkYAZW6SWr4gyn+Wg==
X-Received: by 2002:a5d:47ac:0:b0:386:3e48:f732 with SMTP id ffacd0b85a97d-3863e48f812mr7193837f8f.16.1733841267573;
        Tue, 10 Dec 2024 06:34:27 -0800 (PST)
Message-ID: <4e9c0566-bed7-47a6-aa6d-2ac76c0a1bfe@suse.com>
Date: Tue, 10 Dec 2024 15:34:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/FPU: make vcpu_reset_fpu() build again with old gcc
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <da8320f7-1baf-41f5-b7ac-c05b6371e1e4@suse.com>
 <D6838QWBS1OG.37M94XNPN17P7@cloud.com>
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
In-Reply-To: <D6838QWBS1OG.37M94XNPN17P7@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.12.2024 15:25, Alejandro Vallejo wrote:
> On Mon Dec 9, 2024 at 3:13 PM GMT, Jan Beulich wrote:
>> Fields of anonymous structs/unions may not be part of an initializer for
>> rather old gcc.
> 
> Can you add the specific version for tracking purposes?

It's all the same as before, and I really didn't want to waste time on
once again figuring out which exact version it was that the behavior
changed to the better.

>> Fixes: 49a068471d77 ("x86/fpu: Rework fpu_setup_fpu() uses to split it in two")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/i387.c
>> +++ b/xen/arch/x86/i387.c
>> @@ -306,13 +306,13 @@ void vcpu_reset_fpu(struct vcpu *v)
>>  {
>>      v->fpu_initialised = false;
>>      *v->arch.xsave_area = (struct xsave_struct) {
>> -        .fpu_sse = {
>> -            .mxcsr = MXCSR_DEFAULT,
>> -            .fcw = FCW_RESET,
>> -            .ftw = FXSAVE_FTW_RESET,
>> -        },
>>          .xsave_hdr.xstate_bv = X86_XCR0_X87,
>>      };
>> +
>> +    /* Old gcc doesn't permit these to be part of the initializer. */
>> +    v->arch.xsave_area->fpu_sse.mxcsr = MXCSR_DEFAULT;
>> +    v->arch.xsave_area->fpu_sse.fcw = FCW_RESET;
>> +    v->arch.xsave_area->fpu_sse.ftw = FXSAVE_FTW_RESET;
> 
> That's not quite the same though. A more apt equivalence would be to memset the
> area to zero ahead of the assignments. Otherwise rubble will be left behind.

No. I didn't delete the initializer. All fields not mentioned there will
be default-initialized.

>>  }
>>  
>>  void vcpu_setup_fpu(struct vcpu *v, const void *data)
> 
> Out of context and not triggering the GCC bug, but vcpu_setup_fpu() should
> probably share the same initialization style as vcpu_reset_fpu(), imo.

Why?

Jan

