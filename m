Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97848B05275
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 09:13:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043545.1413510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubZqm-0003Se-VX; Tue, 15 Jul 2025 07:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043545.1413510; Tue, 15 Jul 2025 07:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubZqm-0003QE-SO; Tue, 15 Jul 2025 07:13:16 +0000
Received: by outflank-mailman (input) for mailman id 1043545;
 Tue, 15 Jul 2025 07:13:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubZql-0003Q6-N8
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 07:13:15 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bc2f64a-614b-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 09:13:13 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so3331118f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 00:13:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9e058casm11594683b3a.37.2025.07.15.00.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 00:13:12 -0700 (PDT)
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
X-Inumbo-ID: 2bc2f64a-614b-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752563593; x=1753168393; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dPQ19C0JWbQ583K/Uk1rKmMmeCq1/5NttwJeD5gtACE=;
        b=C7V7lyr/EWkUQK3UPpNnvQPGovRzMbMDElk6RxT9o/tgOe1QPm4rdtqPiNKpJP2uI0
         xA27pPrUc60qj2H8JNbaQ14JRmWc2q+1CVSTdXtgNFflX5ye9WFiJj3Q3NMk1uc/1NEO
         fJ+M/ojPINYjRv0k/k4ndNEwe+DFzwrypvGYk3DzvIHSo3FIPjx47o0ObwqY1tG5rblg
         d9GlEB7QfIopxH/wA1sCwoKts8xSYQDQqFN0ebQq7PTSZzuIwpB6NDuDdTyVM/l5LjtY
         euj0XGUBg3HPo6Y9zDPK098+hek4Y7CuFhyCmKx5uqEIbaV8zRZALMnVB2oY3a/tccD6
         SSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752563593; x=1753168393;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPQ19C0JWbQ583K/Uk1rKmMmeCq1/5NttwJeD5gtACE=;
        b=lDw23+u3HjG+i3xrWQ1xLxeMCqkjly1OuOuwx+2oSZeFrZh+5hFMS4K75oNcMYoEai
         wmPbC7ZpVydFc/gqZC10SKEZgwskf9mYTxfculujXesx14q6+HSXrWuvxLllyM4H69sM
         PDRNZKTOMKo9hKyjd4LdbA58JIpxvSz+TKGYG/quk34PWoRjws7VQqXUQ/ut4/E9r62J
         C2O8RCwgBO51zdYccCPJrmeWm22MlyZXllXBjLoJWglOWIu+soj25c0k/E1FEZwKucHb
         7P07C+/TkG3K0ealyoUAjnRQwAxmPRWTVU/xmpEo90YAU+3R6Jo7FLue0XBr0NsiCbL5
         IVgA==
X-Forwarded-Encrypted: i=1; AJvYcCX9L7iJdtRZcd+aOLs2kQLk9eRkovBP8Fy9fviNYx2A3AQQdWmUku/fKCyhwSCOMKw3CUTYv29FCsY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEGGLj/r5tFCSWicxNWOHYIyXDtqzlGgXGivOoQGnYsq115BaJ
	XnKDajc+l+FTDQpz1sJRgLQPdQN8B/77FifNu2jttlvXXgixxo0pdOgpr6Cz8M2ffw==
X-Gm-Gg: ASbGncvjACEXcsExVK7x4vtJilhm2pxnsdetWjKd31EU1E+ON9Wuxmd0J7GQllDX79p
	g9YSu/4iZ5/iS9bFbEQO23lwgSDomFn1rRAch+lGUbgwa0wVPfw+7iptqWD5v6tn6XHfeo7BFMy
	cp9d8IRs7DCdS1V3LVrTTuyeYX8wdbVldv+a8gcCs3WqbJ2rnqr4ZtjT/Prwnv+OOz3WiaI7xcK
	cl5N/WvTPLZtDBtLg9yaH9J4R0bzLTiIdWglEsRa+CVE/Xu4OmGHVD63SvLcveN9fWe2ni5tMbR
	VomJu4pC48vO1GWNsh9ttQ7aunmxgOlnZeN6YLexJiysu1u38TlwGv4C+144Ao8JqlinQj7ZCj/
	W3xjfhaRTQZXhNw71vBybryEinWympc8UOMLZPHbCTD2XHMSYbuvMr1keWwG6tHP7DMK1c4186m
	ilDei0rC0=
X-Google-Smtp-Source: AGHT+IG554a7QlWHYlZJchujHE0dPWnlWL3iOFTmdT9QBMIJBo4hJn8LYaLlmdxKS5g7LtDwqWH7Xw==
X-Received: by 2002:a05:6000:2b0c:b0:3a3:70ab:b274 with SMTP id ffacd0b85a97d-3b609524369mr1126059f8f.12.1752563592847;
        Tue, 15 Jul 2025 00:13:12 -0700 (PDT)
Message-ID: <52d46e12-d716-4b3c-ad92-7eff59ad2236@suse.com>
Date: Tue, 15 Jul 2025 09:13:05 +0200
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

Actually we can use TZCNT here and LZCNT below with gas 2.25 (and Clang
looks to be happy too, even version 3.0). I expect that's preferable over
merely omitting the semicolons?

Jan

