Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0643A951B80
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 15:10:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777179.1187373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seDlx-000551-6u; Wed, 14 Aug 2024 13:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777179.1187373; Wed, 14 Aug 2024 13:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seDlx-00052C-3E; Wed, 14 Aug 2024 13:10:41 +0000
Received: by outflank-mailman (input) for mailman id 777179;
 Wed, 14 Aug 2024 13:10:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seDlv-000526-2v
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 13:10:39 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 982fc555-5a3e-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 15:10:36 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5a1c49632deso7281341a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 06:10:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd1a602115sm3810151a12.96.2024.08.14.06.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 06:10:35 -0700 (PDT)
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
X-Inumbo-ID: 982fc555-5a3e-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723641035; x=1724245835; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FeI75yeiARCn/mSaXsunSQAiUZWCKF8aMBhS201F18Y=;
        b=elPWQFXI/R5tv8qv00tMFx04HcDethJHfWzDy4W2/nrduK3zlnFuIiFepy42kTJ/w2
         6n/7e4drzIv+rV/KlBjPCUveYeuYB+5Ig9QY/5lqBX5HFsFst1yfxaWdbdGXFkBNUbkN
         NSpidwCMcX2KTxaDI49sISQ0QYNGeBWDUF0uwoBcjbEN2QwoG+cNQUmw6+Pe+J8D444u
         G0O2/IYaXuP9qZoNgw/6eeeTcoK+YxcIkftoSaytk1NPKKe3N8Zy3JWswZIoGT9h2sMs
         geBvRFXJhD0Xy3tJ8K0SmLbyBxGCP2qPTpgE3IjPx4A2srZkFPCaOhlJuXqgRAIjeVEk
         lR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723641035; x=1724245835;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeI75yeiARCn/mSaXsunSQAiUZWCKF8aMBhS201F18Y=;
        b=T7MlflVeU88zrNMHaQmqxeUOwrWKioMgF7lgNvx0YCVK/Ax4cWD7UorttMid2ZSfm4
         6c9vPOCnFZXrHg9578iSGpqMIHD6K6Gv1MhplUEnOfSMKPBEX8GRxC11O/ngBCuIZ2/W
         oxUGmAMPpxB/zGrLB9VhHQ/8La6Ua1HLFZhSKvoezfk7rSh3szfdhJXrlavh45/YCO5d
         ypVLueEN9bE0kuwf8MbDrhPEJXmFE6/d90RzMxyiKeqRbEwi/AJGEKinQSu5/Otp0iVp
         8ltoCW4ZbQKwKfbCO3hnHAaTZbWwCoIYvistjRf6GgJqmMWumvcgqotUAiyNClmY4R4c
         eo2w==
X-Forwarded-Encrypted: i=1; AJvYcCVXVtYSbQM7K/FMlhfkU9tmp5CCVdtGAWxMOJCG88tOezYyJyIDZvu0M5L30ccI0Oi2sAZ31VKckRiiBielD1Xshizr8raVrXWfksNi8no=
X-Gm-Message-State: AOJu0YxOtCwj3fiujugvoxEHP06iHeYIxQkXJOMMreZCfLIyR+TN2RGL
	SfTaR/iJ4JGm4DZSl5JZGsf+TodOLxc+2yCPuDPI1ZJ5AGEi315sQMumymsjXA==
X-Google-Smtp-Source: AGHT+IFBy3pXOAFh5OudBhfQn9A2gpUMD2IbGOBx15I4vUIEfobzVX33Z3HKuczUkjZA0KJnuCraRQ==
X-Received: by 2002:a05:6402:34cc:b0:59e:686b:1874 with SMTP id 4fb4d7f45d1cf-5bea1c6cc31mr2245084a12.6.1723641035363;
        Wed, 14 Aug 2024 06:10:35 -0700 (PDT)
Message-ID: <111eb480-2aed-4a9c-b9f8-8657a9cb1c36@suse.com>
Date: Wed, 14 Aug 2024 15:10:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: don't call ->read_segment() with x86_seg_none
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <81ae365f-98b4-4bb6-bbb6-c5423dfda038@suse.com>
 <a7d15429-ce49-43b1-9bbd-7b0129094388@citrix.com>
 <e0081fc2-c631-45a0-a847-edc8dcc3988e@suse.com>
 <3cc3f16b-bdc2-45e7-9a6b-fd6270e952c2@citrix.com>
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
In-Reply-To: <3cc3f16b-bdc2-45e7-9a6b-fd6270e952c2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2024 14:49, Andrew Cooper wrote:
> On 12/08/2024 3:05 pm, Jan Beulich wrote:
>> On 12.08.2024 15:04, Andrew Cooper wrote:
>>> On 05/08/2024 2:26 pm, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>>>> @@ -839,7 +839,8 @@ protmode_load_seg(
>>>>          case x86_seg_tr:
>>>>              goto raise_exn;
>>>>          }
>>>> -        if ( !_amd_like(cp) || vcpu_has_nscb() || !ops->read_segment ||
>>>> +        if ( seg == x86_seg_none || !_amd_like(cp) || vcpu_has_nscb() ||
>>>> +             !ops->read_segment ||
>>>>               ops->read_segment(seg, sreg, ctxt) != X86EMUL_OKAY )
>>>>              memset(sreg, 0, sizeof(*sreg));
>>>>          else
>>> While this fixes the crash, I'm not sure it will behave correctly for
>>> VERR/VERW.
>>>
>>> protmode_load_seg() is unconditionally X86EMUL_OKAY for a NULL selector,
>>> and VERW checks for type != 0x8 which an empty attr will pass.
>> That's past an sreg.s check, which will have failed (for sreg coming back
>> all clear).
> 
> Oh, so it is.
> 
> Any chance I could talk you into folding this hunk in too?
> 
> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c
> b/xen/arch/x86/x86_emulate/x86_emulate.c
> index 902538267051..d4d02c3e2eb3 100644
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -2852,7 +2852,7 @@ x86_emulate(
>                                              &sreg, ctxt, ops) )
>              {
>              case X86EMUL_OKAY:
> -                if ( sreg.s &&
> +                if ( sreg.s /* Excludes NULL selector too */ &&
>                       ((modrm_reg & 1) ? ((sreg.type & 0xa) == 0x2)
>                                        : ((sreg.type & 0xa) != 0x8)) )
>                      _regs.eflags |= X86_EFLAGS_ZF;
> 
> 
> because it is relevant to judging whether the subsequent logic is
> correct or not.

No problem at all. Am I okay to commit then, with Stefano's R-b?

>> Also if there was a concern here, it would be orthogonal to the adding of
>> the seg_none check: It would then have been similarly an issue for all
>> possibilities of taking the memset() path.
>>
>>> Interestingly, both Intel and AMD state that the NULL selector is
>>> neither readable nor writeable.
>> Which makes sense, doesn't it? A nul selector is really more like a
>> system segment in this regard (for VERR/VERW).
> 
> In the 32bit days, yes, the NULL selector was entirely unusable, but
> that changed in 64bit.
> 
> So IMO it really depends on whether VERR/VERW means "can I use this
> selector for $X", or "what does the GDT/LDT say about $X".
> 
> AMD say "Verifies whether a code or data segment specified by the
> segment selector in the 16-bit register or memory operand is readable
> from the current privilege level."
> 
> Intel say "Verifies whether the code or data segment specified with the
> source operand is readable (VERR) or writable[sic] (VERW) from the
> current privilege level (CPL)."
> 
> So that's clearly the former meaning rather than the latter meaning.

Not really. There's no "code or data segment" specified with a nul
selector. The use of GDT/LDT is implicit in this wording, but imo
it is there.

>>> Also, looking at the emulator logic, we're missing the DPL vs
>>> CPL/RPL/Conforming checks.
>> There's surely nothing "conforming" for a nul selector. Hence perhaps you
>> refer to something entirely unrelated?
> 
> Sorry, yes.  I think this is a general bug in how we emulate VERW/VERR,
> unrelated to this specific OSS-fuzz report.

I'll check that later and reply separately (here or with a patch).

Jan

