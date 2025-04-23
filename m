Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8A9A9882E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 13:10:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964407.1355218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Y00-00061B-4I; Wed, 23 Apr 2025 11:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964407.1355218; Wed, 23 Apr 2025 11:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Y00-0005zc-1D; Wed, 23 Apr 2025 11:10:40 +0000
Received: by outflank-mailman (input) for mailman id 964407;
 Wed, 23 Apr 2025 11:10:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7Xyy-0003KJ-4m
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 11:09:36 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ffc6aaa-2033-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 13:09:34 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso3855802f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 04:09:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4a4f38sm18758883f8f.97.2025.04.23.04.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 04:09:33 -0700 (PDT)
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
X-Inumbo-ID: 6ffc6aaa-2033-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745406574; x=1746011374; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uen0vKgAKHq7Aofrag0lfMDRF45Ila5MIvas9EqEpPs=;
        b=dtWHzl1Ezfkh6Mh+2G47izCLW1q+ogN/lZulf2LprGl5m5mTRDECnmKAtE8QIG4yXo
         fs2ZbltzpH+gLOO3m05+4Y4jMcUU7BqwavSJh/poqVmS0ZMo/H5iRi/mVVaZG1T671sg
         IdOmDpv7NrtDuxGEpRlIaxE44MTPMfkmRRSsHmUsVC45v+SXyKY20IPfdmh7T/jXaZnH
         eT8QQACWC7k026/FVtLYuDXvOJdraL8QSQa3UL//VWqCPZDg4raVN3PzPitdY/qiiC+P
         /ibnC32RlSWmU4RT96xAjOR8NLPEwcNu8JTdDO0Btu7O48iVAmLl2dkDWMMwhrXFkTyS
         Bd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406574; x=1746011374;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uen0vKgAKHq7Aofrag0lfMDRF45Ila5MIvas9EqEpPs=;
        b=hFEAu5qVv3bBMYVdQ8wJvGsGxW+MNRY1p7qIvb77lyq3QIb68SdozK+/nH7kwgL8BB
         BNB0NDNJ/6ZtFG5doD/Mm2ueNS7DJKi48PObVU2oIdOSBgTyli22PMC7V6UinXqtaypp
         50hR+BvczqiCiuPSudWyvTwFej9NfdLozp+um/qFPaYW7WMgIK678V0c89nmzZIi7paF
         6tCbKHQgC2daVLZbc/qQ1zd6dExmWxBxZ8EJxHEwHD48ppCF7Y7UKLtKH/12UP4KltyA
         6OMMEr0eiv+P4aLcNwzm9xt+gqbSNHWNmMa1TEwHxn/EdJt7YDGARAmlK38dPv/OZfN0
         iPkg==
X-Forwarded-Encrypted: i=1; AJvYcCXnk19WYywuL7G5kvjuWAnjyLfpFxPKT39oAEEt0uSHLuEHrXC5sE8UZO7AdLJ/cHLIMZSYfBJucm0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywwoaxg+P1tT+W1CFbTqki/bvqWyPEmtAC9NCXea3JJ2qkJKHrt
	LOvDS8ULMu1HtURT42ACXQHz3wXSvpWJlpyl4ig2QrG0be1TZr+jSIR3PgaQ1w==
X-Gm-Gg: ASbGnctUykpcH7dczM9KJPs722S9igYuuAxgBYbMiFf89Lvr0uqoOzH5B3OwkJ5fKWN
	JCvBIEcbjZSzoysWPKk3SNFA/nGutRdI9WFb2ebkFTRrG9g9DJy0MgLOS7EaIjbp6nsTNpGPQdV
	kTCLtBA6R7VAUIdN7W3op4/+xIP4eHhkCHrbiR8EP0eh1euVoxFtJQlJsArF9SkjduGAQGpTjeO
	ljEfFNYFEEa5T3bcNohgFrQegnO25CQCaygEZ1ovlzkGJfHCkQmOyvx2WZtr29FqvjaaIDjj3uE
	PPitvVb6exDQxqJY/lkLd3+7nK2r5EKgX9/tb2F9HcUk8MyU9/9h4I9wCdFtf1uR+Ssoa1tgiOI
	1ekR8cSx3Lvb9RweDotN2uiia+A==
X-Google-Smtp-Source: AGHT+IGYAVFsGRu/eJUibuOpHWrJxYV9DNd21gRafLx6EVIBqnS2P4M4p6p/qpXeWd0UFhmz7VB89A==
X-Received: by 2002:a5d:47aa:0:b0:39a:ca40:7bfb with SMTP id ffacd0b85a97d-39efbaf160cmr15885284f8f.54.1745406573817;
        Wed, 23 Apr 2025 04:09:33 -0700 (PDT)
Message-ID: <23a4d3fb-f700-4830-959f-d67b4d4cd980@suse.com>
Date: Wed, 23 Apr 2025 13:09:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: adjust BSF/BSR behavior as to EFLAGS
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <df3f3203-d660-4b7d-b771-871d16a8ec43@suse.com>
 <fc49cdec-69aa-4ae0-8d8e-cf6d6ba8fb74@citrix.com>
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
In-Reply-To: <fc49cdec-69aa-4ae0-8d8e-cf6d6ba8fb74@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.04.2025 11:49, Andrew Cooper wrote:
> On 23/04/2025 7:13 am, Jan Beulich wrote:
>> SDM revision 087 points out that apparently as of quite some time ago on
>> Intel hardware BSF and BSR may alter all arithmetic flags, not just ZF.
>> Because of the inconsistency (and because documentation doesn't look to
>> be quite right about PF), best we can do is simply take the flag values
>> from what the processor produces, just like we do for various other
>> arithmetic insns. (Note also that AMD and Intel have always been
>> disagreeing on arithmetic flags other than ZF.)
> 
> The new footnote Intel have added about "older processors" does match
> AMD, saying "unmodified".
> 
> I think it's clear now that Intel and AMD behaviour was the same
> originally, except AMD wrote "unmodified" and Intel wrote "undefined",
> and Intel used this flexibility to alter the behaviour.

Except it isn't - U in AMD's nomenclature is "undefined", not "unmodified"
(and despite what you wrote above I hope you agree that the two mean
different things). Unmodified flag entries are simply blank.

>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -5268,16 +5268,14 @@ x86_emulate(
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
>>          if ( (vex.pfx == vex_f3) && vcpu_has_bmi1() )
>>          {
>> -            _regs.eflags &= ~X86_EFLAGS_CF;
>> +            bool zf;
>> +
>> +            asm ( "bsf %2,%0" ASM_FLAG_OUT(, "; setz %1")
>> +                  : "=r" (dst.val), ASM_FLAG_OUT("=@ccz", "=qm") (zf)
>> +                  : "rm" (src.val) );
>> +            _regs.eflags &= ~(X86_EFLAGS_ZF | X86_EFLAGS_CF);
>>              if ( zf )
>>              {
>>                  _regs.eflags |= X86_EFLAGS_CF;
>> @@ -5286,25 +5284,23 @@ x86_emulate(
>>              else if ( !dst.val )
>>                  _regs.eflags |= X86_EFLAGS_ZF;
>>          }
>> -        else if ( zf )
>> +        else
>>          {
>> -            _regs.eflags |= X86_EFLAGS_ZF;
>> -            dst.type = OP_NONE;
>> +            emulate_2op_SrcV_srcmem("bsf", src, dst, _regs.eflags);
>> +            if ( _regs.eflags & X86_EFLAGS_ZF )
>> +                dst.type = OP_NONE;
> 
> On Intel, BSF/BSR writes back the destination register.  Notably, it
> gets 0 extended per normal rules,

That's also only on "older processors", as per the other footnote.

> which is why you have to be extra
> careful when using the trick of preloading it with -1; the result must
> be interpreted as (int) even over a 64bit operation.
> 
> This needs an amd_like() qualification to override dst.type.  This
> aspect genuinely is different between them.  Alternatively, we might be
> able to set the operand size always to 64 and write back the entire
> register as the processor gave to us, but I'm not sure if that will have
> effects elsewhere.

Besides (as per above), amd_like() not covering all cases, this would
then further need special treatment for 16-bit opsize. Plus promoting
to 64-bit would require manually clipping the result to 5 bits when
the original size wants 64-bit. That's imo far more complications
than gains.

Further, this patch is really about EFLAGS only; the OP_NONE was there
already before.

> Finally, I'm wary leaving TZCNT/LZCNT using the old logic.  Despite the
> absence of an update in 087, I find it unlikely that they behave
> differently WRT flags (specifically, I severely doubt they've got
> differing circuitry).

They do, I checked. Iirc I even mentioned on Matrix that I'm surprised
by the difference.

> I'd suggest giving them the same fully-emulated treatment as BSF/BSR.

But we're emulating them as the correct insn even if the respective
feature flag isn't set in the host policy. I don't want to break that,
so doing as you suggest would mean further bifurcating the handling
(to deal with the two different cases of what underlying hardware we
run on). This feels like unnecessary extra complexity to me.

Jan

