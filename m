Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE68B05262
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 09:05:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043529.1413489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubZjD-0001G8-V0; Tue, 15 Jul 2025 07:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043529.1413489; Tue, 15 Jul 2025 07:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubZjD-0001E3-S5; Tue, 15 Jul 2025 07:05:27 +0000
Received: by outflank-mailman (input) for mailman id 1043529;
 Tue, 15 Jul 2025 07:05:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubZjC-0001Dx-TF
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 07:05:26 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14633365-614a-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 09:05:24 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a510432236so3627137f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 00:05:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3bbe577853sm11612810a12.21.2025.07.15.00.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 00:05:23 -0700 (PDT)
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
X-Inumbo-ID: 14633365-614a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752563124; x=1753167924; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+udRfKSYII1ZEeDltawPwbVIJ6eO85YGlBCrMfWewyw=;
        b=DUE3i8kieIZyK1wEUYL8qSXdwr7PA16oyYnGC+q1eQ/yrdA/glTaob6XZabpkvr8X7
         KebT/vcVaN5EZY2hkcxUpQnmBw7zWgd8O98Pnh71vD/myiHXht/GUYyaVNAEyOHk2hFN
         8lMbiuCaRCb46c8vr7Z587pJXX8PYkw8dhc93uN92rS8fNL8PjGRrVoznq0sPhku361/
         AqaVzgfllPDk1jDOtOviAnAmK1NSOFZ96UoeabTNgzvrHTu8oEjXMpX9ZKj7nr9Fz3zG
         dFyVtHpS/X5wMg956cLCXwQGTRPtpnYw/MTVa4tG9ObJCW0E1QOgz9tBUakS4Qn4U+cK
         kWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752563124; x=1753167924;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+udRfKSYII1ZEeDltawPwbVIJ6eO85YGlBCrMfWewyw=;
        b=vsHrTi89IvNCPsYYPqkpJp7Mf929v8WvVDk9obix3Xbv8lXw81DeqYIiD2CGIk6Akl
         WUGtYIT8simLxzezT62+SWJBzHaIGfZMZLpzth3peoKzpgipbYcJTQ2VoSZaG5cdb3c6
         1X6j2UJZ5Q39jy2EKCpxrv/HBsj3vTqtDf1iyL8PAVHP3cwF7zluFaaQXAszDdbXwN5f
         /LXpZIWHbV2xVorneKsGhoB5KOM0469yNWnRgYRdMN8N0nlx26lQiI4bLiMMkDAWzjLq
         QTi4dI5bZbFeY4yTLAjP4+rDbodmMRARaVBEIZa9GjZI9UbbTUJ+aVMZ631QxMOn8V7u
         fesQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhec6HDDiZbu4oGm4lcUrCpLaNHco/X4s774UktakGN+spqYO1HGRC+tseWrooZrU9o2wKvlemWSk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxT6S0BKHMsPLe4OhjK2lKDgKCST0OY/hb7zn7YXv5Lz0CxQLx/
	Js6ans2kYYskk1RgLQEUvO0NRezMY8AiuWW/1LYAgCnSHwAQmW95/SBliU4NcHFahQHvBEfVkZ4
	5OBk=
X-Gm-Gg: ASbGncuhQuKPAFBztI2Qiy1lSLilU6b4v4JNcccjAdYN+gITe9nL5Eh0sywd9rLVqCF
	ardtxsi1H6cnGydclCorPuM3WGziQF1ZK1SexGyH7oDVEunBrXrEVhxsAAjGaC0u2IYxV/8DRMO
	FnT03CMSNs43VlOiB6KSGLweeywdgxq90IjyKpn9dkg+TBCGO1JJRox8TjdKc7oogNiZmWdrU6f
	coRndNP/kPH8uxiJ8VHM/B+Qknlw2BNprUa6PhWkPEKHsCLpJZFLlmYvX1wAqXy5tnwhH56/y3P
	lNP3J06QvILdoB+KdDUhhVgVAPSICWYrT53px6gencpxqFZwgR6dp1GtLePuqh/LaPJaKaWo5mf
	Fb9DhSqCVaj4QMUlP2fy9WCNKuNlgTi7firuOOHe5HBWoJIELBH27pWnWRzJoZJ5GSGlwKFOT7b
	oDV8C6BbM=
X-Google-Smtp-Source: AGHT+IGOWb8Q3d+2gW/tezj+47BzFrb+MRjbIMA5sybww4mjZF266rKnvYZ8RIXMF7Q/OmS/RWVryw==
X-Received: by 2002:a05:6000:2085:b0:3a4:e667:922e with SMTP id ffacd0b85a97d-3b5f2dacddamr11685994f8f.4.1752563123941;
        Tue, 15 Jul 2025 00:05:23 -0700 (PDT)
Message-ID: <2aec91c8-4168-4372-91a0-d0c4bd314d08@suse.com>
Date: Tue, 15 Jul 2025 09:05:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86emul: adjust BSF/BSR/LZCNT/TZCNT behavior as to
 EFLAGS
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8c4df1bc-4fdc-4e96-ae67-ea23870d2725@suse.com>
 <2924fcc9-367b-4c05-a6bb-30c5b610107f@citrix.com>
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
In-Reply-To: <2924fcc9-367b-4c05-a6bb-30c5b610107f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.07.2025 18:19, Andrew Cooper wrote:
> On 14/07/2025 5:02 pm, Jan Beulich wrote:
>> SDM revision 087 points out that apparently as of quite some time ago on
>> Intel hardware BSF and BSR may alter all arithmetic flags, not just ZF.
>> Because of the inconsistency (and because documentation doesn't look to
> 
> It's probably worth saying errata explicitly.  There are a whole bunch
> of Intel CPUs where the behaviour doesn't match CPUID.

Okay, I've adjusted the wording slightly.

>> be quite right about PF), best we can do is simply take the flag values
>> from what the processor produces, just like we do for various other
>> arithmetic insns. (Note also that AMD and Intel have always been
>> disagreeing on arithmetic flags other than ZF.) To be both safe (against
>> further anomalies) and consistent, extend this to {L,T}ZCNT as well.
>> (Emulating the two insns correctly even when underlying hardware doesn't
>> support it was perhaps nice, but yielded guest-observable
>> inconsistencies.)
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -5270,62 +5270,26 @@ x86_emulate(
>>          break;
>>  
>>      case X86EMUL_OPC(0x0f, 0xbc): /* bsf or tzcnt */
>> -    {
>> -        bool zf;
>> -
>> -        asm ( "bsf %2,%0" ASM_FLAG_OUT(, "; setz %1")
>> -              : "=r" (dst.val), ASM_FLAG_OUT("=@ccz", "=qm") (zf)
>> -              : "rm" (src.val) );
>> -        _regs.eflags &= ~X86_EFLAGS_ZF;
>> -        if ( (vex.pfx == vex_f3) && vcpu_has_bmi1() )
>> -        {
>> -            _regs.eflags &= ~X86_EFLAGS_CF;
>> -            if ( zf )
>> -            {
>> -                _regs.eflags |= X86_EFLAGS_CF;
>> -                dst.val = op_bytes * 8;
>> -            }
>> -            else if ( !dst.val )
>> -                _regs.eflags |= X86_EFLAGS_ZF;
>> -        }
>> -        else if ( zf )
>> +        if ( vex.pfx == vex_f3 )
>> +            emulate_2op_SrcV_srcmem("rep; bsf", src, dst, _regs.eflags);
> 
> Do we need the ; ?
> 
> We surely don't on 4.21, but I presume there are bugs in older
> binutils?  (All Clangs back to 3.5 seem happy)

Right, we don't really need this on staging. I can omit it and then hopefully
not forget to add it back when backporting (which I was intending to do).

Jan

