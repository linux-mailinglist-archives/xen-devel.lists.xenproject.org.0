Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98061AA03B6
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 08:48:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971566.1359951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9eld-00068H-77; Tue, 29 Apr 2025 06:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971566.1359951; Tue, 29 Apr 2025 06:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9eld-00065F-4V; Tue, 29 Apr 2025 06:48:33 +0000
Received: by outflank-mailman (input) for mailman id 971566;
 Tue, 29 Apr 2025 06:48:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9elb-000659-Ly
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 06:48:31 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f628967a-24c5-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 08:48:30 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-acbb85ce788so1088633566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 23:48:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ed6fc25sm735438966b.132.2025.04.28.23.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 23:48:29 -0700 (PDT)
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
X-Inumbo-ID: f628967a-24c5-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745909310; x=1746514110; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zh8fXfdEy0ung0RkzV6wSql/dzQEHSRxarD60SXNHEU=;
        b=XB3qciUem2kV7vQb6alAFqH5Gm3p3CKIlHJvB1hIxQ0ht5tra2gLYQFCKoATVEOQdc
         Fvh1Cd1JZlFVkqrmpbJZSg5byZXoo338po0IWrXS9E8xUp+n5Ypadm45rnerafJmMkZB
         DnRRPE6rVJuckQ4h3A7JPoOZrf0TPIWTX4V2xuuZU3jYtWLt2MG3POLhZNxEJxbMoUeD
         /tuAs0ibhbEvMQB86glBz4ovh6M4Is82ja5C1IUoV+tPAud3uX1b3xg7ZqYu5wuIiFYd
         i30TQuPrdNmhY8+gipmYMLiBv73NGdCfBOwYhVR00ZBbe1ww+s///Lzfev01gIc3+fwe
         qDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745909310; x=1746514110;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zh8fXfdEy0ung0RkzV6wSql/dzQEHSRxarD60SXNHEU=;
        b=mSBzO2fDqOSIF1b1gTzAHgQb/gRaxuGjZ+ntRqz1HtV5g4ZV8MoYrd/AOoFgkNFQ87
         WOMzF7xHgR4esDn3Eax89d8QyM0njWU1dvYjLnovpzcr76SUyDpjCYW1TK4bPKI32eI2
         RLTP8Kr/xLKrn5YUmWO6oiNcNumMt1PoEC/gjmJeefP8EklDn9HiRPb/FSDvwZ3nniRF
         alvkAYHmken1jUNSUGTSjEYYnDOoq10wz5duXu6vV0JXGlxhvv69Yfh97htPjmvBFGj0
         ynjoYW/p0DRqTLjUFA+bxr8CSasVwBddnmoaQlg4pcp/xksFwOR3L+Ua9R5k/aMRDWiZ
         yyTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5Q+4VRuFck0HF8W3fRojFjJ6QEU0PHwx/0dbBg/K+Ow6rM8b3rBjXk8tHNSSa1cDdKUhQyI34v0I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiKZVUPLysCp5soPlFRigZxS3UCOeOzrln3DzobkyBpaGtJPGH
	KQ/xfvvufcTn8JZnpanKEg/8f3Up15ScOuzsPD4TDXbRHR/AqA2jhpAUDkqQ+g==
X-Gm-Gg: ASbGncvYbdEoyXsfp4+Mdp+CW1Aa41qSrrN8x3rUXSEJSqKVg4zixNtI/ve3G0QK/Dx
	DLEwU+OQD3kS9sGMWy1fe1K5/KQUCSGjLKbR3ZnmgixFI7b0Qx/Lyu30E7hqBDfEuOksXYGYuVv
	XVIZ+tWTx0iCDdE5mJITkekuSpZzgz9jNp7CZVx7eO0+xrzhmRnccZck1aIbEDaflsdflx6ALMX
	yYpWKvYslS/PU3RmsmAtSGLh1Ve6KHsc9G7LnnfTNKcNiK9yHGR8ZMu+TUSIQwz+1pARUmnE6T+
	Gva0fTp30UiYz/dNQcYV3GF4WOHgF1jF+zAWAZKwc7/W0BL3HHQpClF78e3Q64t9OQKHWYLxkhi
	7ZUQauSn+6LhaAd4JITYVyBiZSQ==
X-Google-Smtp-Source: AGHT+IF1QRq/4pd2TkNuM5NDgzLS9HMCM1lbOkNjK+I5FdeR84gJ4enSi3iwxCH18di7BOUT2W77Fg==
X-Received: by 2002:a17:907:d8c:b0:ac1:f003:be08 with SMTP id a640c23a62f3a-acec849b8fdmr145768666b.12.1745909310087;
        Mon, 28 Apr 2025 23:48:30 -0700 (PDT)
Message-ID: <350d447e-7316-4d54-8468-68f78675cc8d@suse.com>
Date: Tue, 29 Apr 2025 08:48:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] x86: x86_emulate: address violations of MISRA C
 Rule 19.1
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: victorm.lira@amd.com, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <c694069696dd428bc1719e36c378a573b03f74b9.1745624090.git.victorm.lira@amd.com>
 <914e3157-736a-4890-9c91-e93fcc260bb0@suse.com>
 <alpine.DEB.2.22.394.2504281625240.785180@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2504281625240.785180@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2025 03:27, Stefano Stabellini wrote:
> On Mon, 28 Apr 2025, Jan Beulich wrote:
>> On 26.04.2025 01:42, victorm.lira@amd.com wrote:
>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>
>>> Rule 19.1 states: "An object shall not be assigned or copied
>>> to an overlapping object". Since the "call" and "compat_call" are
>>
>> Was this taken from patch 2 without editing?
>>
>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>>> @@ -526,9 +526,19 @@ static inline void put_loop_count(
>>>           */                                                             \
>>>          if ( !amd_like(ctxt) && mode_64bit() && ad_bytes == 4 )         \
>>>          {                                                               \
>>> +            uint64_t tmp;                                               \
>>> +                                                                        \
>>>              _regs.r(cx) = 0;                                            \
>>> -            if ( extend_si ) _regs.r(si) = _regs.esi;                   \
>>> -            if ( extend_di ) _regs.r(di) = _regs.edi;                   \
>>> +            if ( extend_si )                                            \
>>> +            {                                                           \
>>> +                tmp = _regs.esi;                                        \
>>> +                _regs.r(si) = tmp;                                      \
>>> +            }                                                           \
>>> +            if ( extend_di )                                            \
>>> +            {                                                           \
>>> +                tmp = _regs.edi;                                        \
>>> +                _regs.r(di) = tmp;                                      \
>>> +            }                                                           \
>>
>> See commit 7225f13aef03 for how we chose to address similar issues elsewhere
>> in the emulator. I think we want to be consistent there. This will then also
>> eliminate ...
>>
>>> @@ -2029,7 +2039,12 @@ x86_emulate(
>>>          switch ( op_bytes )
>>>          {
>>>          case 2: _regs.ax = (int8_t)_regs.ax; break; /* cbw */
>>> -        case 4: _regs.r(ax) = (uint32_t)(int16_t)_regs.ax; break; /* cwde */
>>> +        case 4:
>>> +            {
>>> +                uint32_t tmp = (uint32_t)(int16_t)_regs.ax;
>>> +                _regs.r(ax) = tmp;
>>> +                break; /* cwde */
>>> +            }
>>
>> ... the odd brace placement here, as well as the inconsistency in the types
>> you used for the temporary variables (both really could have been unsigned
>> int; no need for a fixed-width type).
> 
> Is this what you have in mind?

No, and that's also not what the referenced commit did in a similar situation.

> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -527,8 +527,8 @@ static inline void put_loop_count(
>          if ( !amd_like(ctxt) && mode_64bit() && ad_bytes == 4 )         \
>          {                                                               \
>              _regs.r(cx) = 0;                                            \
> -            if ( extend_si ) _regs.r(si) = _regs.esi;                   \
> -            if ( extend_di ) _regs.r(di) = _regs.edi;                   \
> +            if ( extend_si ) _regs.r(si) = (uint64_t)_regs.esi;         \
> +            if ( extend_di ) _regs.r(di) = (uint64_t)_regs.edi;         \

            if ( extend_si ) _regs.r(si) = (uint32_t)_regs.r(si);       \
            if ( extend_di ) _regs.r(di) = (uint32_t)_regs.r(di);       \

After all what the rule requires is that we use _the same_ field on both sides.

Jan

