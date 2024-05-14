Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B3F8C4CC0
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 09:22:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721164.1124344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6mUc-0005Vm-I3; Tue, 14 May 2024 07:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721164.1124344; Tue, 14 May 2024 07:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6mUc-0005UF-F3; Tue, 14 May 2024 07:22:34 +0000
Received: by outflank-mailman (input) for mailman id 721164;
 Tue, 14 May 2024 07:22:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6mUb-0005Tt-2T
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 07:22:33 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba507622-11c2-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 09:22:32 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a59a8f0d941so1275418766b.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 00:22:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733becfb83sm7135734a12.46.2024.05.14.00.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 00:22:31 -0700 (PDT)
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
X-Inumbo-ID: ba507622-11c2-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715671351; x=1716276151; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5OZM3jQfMRafwON+6Rr3i3c0ZrExWZEi7j42uNkEdFw=;
        b=Zbee86eXqJGZ7g2R1YZNOoS3g0lFt0KNqPWU1wMcwySv8K4zyhlFI3+qS0x+Y41hR9
         xqP2wiDq0lgYuKp4hFcTmogDieXqewpfopQkbDV/G0OOmbGz4FDQTTL8Kmqx3JnAWQJI
         4ac9RJyi71sRmEh4Tzd7O8QMVbwHTeS9yQdgqEWYwKmVsAUvbscj1AsJKNhMqYEbI0Lc
         7gmPvvnRwooejG8qPayZDtyqaNhcxRqdakmGB5NdUIbZzQrwZXztYcHw/EIjoBUnE3g7
         FP1Lb99eXu8pfBXdf3ENI5fWeamcXZEGK9z+OMjtIvCSQZXGRp5nm6DZzO+of19ZHlbl
         ksJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715671351; x=1716276151;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5OZM3jQfMRafwON+6Rr3i3c0ZrExWZEi7j42uNkEdFw=;
        b=lbtipPHCTO58aZ61/SFGZF3XFAtrry9mtdI4G2Tisbk4INRwZ00mlHAxgxap8rsD0r
         SbJnlnU5ktYHz64UFqhnBMKkFYGkM7oY8l0gWsQ0MBpBlDg9fytDfNTPtrgLgfTKBsT1
         s8cYOy/1Cg1ql8w0BMRoy8K6y8viHBnPMLKn9nKifIPvQ0cRg+eerCMRaLovkaCab/Sk
         qGsANY0Pe3VAxv4tEMhlVOcN3QH3l0SkMXaRdVfzrlTHcaSI7ZK6pzM4YLMpKKcgRhGL
         DnDioOVThblHKEFhMCMBiyq7v+jgzNNL1GR045jg3pTGLPwt85LPaizCKYuLrjOcnJsQ
         i8Cw==
X-Gm-Message-State: AOJu0YzZOwVbNmEhSled9k6Q4WFRagoHm4D6z55NF2xUMTDaa8wMPxpC
	7d6mlHUc1wp6/N2zgZEBPuEiHnYbK/yfMxB1zrE4H+y91K6fOM+g3WNa6TUlZQ==
X-Google-Smtp-Source: AGHT+IEX5x1WMdarNoWxfxkRtnwGqNzD2Mb3HMORyyF/9CMckXA9BluP696PNNYMmNixtmp5wtE4GQ==
X-Received: by 2002:a50:9353:0:b0:568:1248:9f49 with SMTP id 4fb4d7f45d1cf-5734d5bfbf9mr7364271a12.18.1715671351536;
        Tue, 14 May 2024 00:22:31 -0700 (PDT)
Message-ID: <8caac099-094d-4f16-b66b-8c8308684af7@suse.com>
Date: Tue, 14 May 2024 09:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: Sanity check bytes_per_rep in rep_outs()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20240511151642.2476555-1-andrew.cooper3@citrix.com>
 <ZkMNSbcB9S4YYcfy@macbook>
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
In-Reply-To: <ZkMNSbcB9S4YYcfy@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2024 09:05, Roger Pau Monné wrote:
> On Sat, May 11, 2024 at 04:16:42PM +0100, Andrew Cooper wrote:
>> Architecturally, there's no 64-bit variant of OUTS in x86.

This is the reason why personally ...

>>  Leaving an
>> assertion to this effect is enough to satisfy the analyser.

... I view adding such, in particular ...

>> --- a/xen/arch/x86/pv/emul-priv-op.c
>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>> @@ -685,6 +685,8 @@ static int cf_check rep_outs(
>>  
>>      *reps = 0;
>>  
>> +    ASSERT(bytes_per_rep <= 4); /* i.e. 'data' being 4 bytes is fine. */
> 
> Don't we need this to be a BUG_ON() to satisfy the compiler also on
> non-debug builds?
> 
> Or maybe:
> 
> if ( bytes_per_rep > 4 )
> {
>     ASSERT_UNREACHABLE();
>     return X86EMUL_UNHANDLEABLE;
> }

... such a non-debug-build-covering form as dead code. With suitable
information to hand, I guess Eclair / Misra might even say so, too.

Instead I view the analyzer report here as a weakness of how analysis
is (and has to be) done.

Jan

> Would it be possible to add the check to guest_io_okay() itself?
> 
> Thanks, Roger.


