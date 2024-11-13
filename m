Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D519C6A30
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 08:52:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835058.1250890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB89S-0005ly-46; Wed, 13 Nov 2024 07:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835058.1250890; Wed, 13 Nov 2024 07:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB89S-0005jo-14; Wed, 13 Nov 2024 07:50:58 +0000
Received: by outflank-mailman (input) for mailman id 835058;
 Wed, 13 Nov 2024 07:50:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tB89Q-0005ji-J8
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 07:50:56 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0129767d-a194-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 08:50:52 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3807dd08cfcso6166864f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 23:50:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda0604bsm17320786f8f.105.2024.11.12.23.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 23:50:51 -0800 (PST)
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
X-Inumbo-ID: 0129767d-a194-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmEiLCJoZWxvIjoibWFpbC13cjEteDQyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjAxMjk3NjdkLWExOTQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDg0MjUyLjA4NjQ5NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731484251; x=1732089051; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UIbP/9MobanleR79icVKxOm8vUi6azNRSBcH1shk9Z8=;
        b=OUXRT481DOEi2SedMGFwfqq8WlurLMc9PyXp6JBNMzsIAVn8mBHJP/EgRk9Uo9DMQH
         Su80j+sG6o/kGSbGNRDsleaH43Nzj1RrNvULbLVZRuUg69Jx/RY35HZdOFonZjobkjwR
         tGnKGSr9rwHYVhKTCKqDPdSt+XCB+8fOOak1ZgAvfNvQCQavlQjuunXRKVj1twH9yCfa
         NKRAsw0q86eGwUj4W+YtM2ZRrDmmz63Q4Dz4a0AOAqekg/Oul6uiBytx5x+S2G62ez5T
         rzVtBuVzFXf96TqNBezKbZgAHs9F11HtzrK6yJrvm0iuRRK9QrWSYDUiAoQdfSbJvovK
         ruug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731484251; x=1732089051;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIbP/9MobanleR79icVKxOm8vUi6azNRSBcH1shk9Z8=;
        b=C/zpCOxDFq3jDIVXZ20rXrUb0Nxr0NXqS1SIn6CvIPjvRQI/zOGFjXq/zPRf3q46Vb
         IY/rw1wBF77lV9Cf0u+FtYHQiisX0+Z8PQPwSGzDPkOdgIg79pIKJ+GQqj83ZI2TP52y
         BmGIF6/fr7eTe3QbXMJEjc/QsMfeYT0LM7LyHbNQH26tn6WX3JnNi0qjzsU2tc3+nL2l
         CgYdGXOScjEc/OvaG5zzXNBQ4WhEXFqKciIldeZ5su7fEeF9yIZgAX228Vfk2DuUjeT7
         6Ju0fVoJLm63pnA3HZv4VYd1u44qQnem7ZpIOTziq9ax5j1C2PPLJH/pr+2VQ06/LLAP
         Mxrg==
X-Forwarded-Encrypted: i=1; AJvYcCVXRcxMuJUUNx0InBIdAn4w0q74WWmhr8s0dEhezqoxvNZucOHvlBGSezG3ToxnyWETPrsscUJsT1U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVPfgkbyfM+anD8owYb/mCEKdOW04ecrUZSSLKnthi4c3cvKWA
	I99AfoF3qA+wJKQRmpFQgrceH36eX5N6MVfXtZwGvZxxS2YVrKLYamlrXD2S1g==
X-Google-Smtp-Source: AGHT+IGHDamkgx0DHas7RrjCGr098w5J0A7DKEfkyXe1hT0qjVitIKPaZQGzDadBHRTbvPujlrNQbg==
X-Received: by 2002:a05:6000:2a1:b0:374:c658:706e with SMTP id ffacd0b85a97d-381f1884860mr21215146f8f.39.1731484251416;
        Tue, 12 Nov 2024 23:50:51 -0800 (PST)
Message-ID: <3b80f30e-9fb4-4db7-9f11-e0e01d516eef@suse.com>
Date: Wed, 13 Nov 2024 08:50:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86emul: correct EFLAGS testing for BMI1/BMI2
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <367ba117-f376-433b-bd70-586d7519d94c@suse.com>
 <04602af0-9a03-4d43-beb3-28b76e2cad33@suse.com>
 <af2715ab-987c-4e90-a3a0-c136f2e8d8d7@citrix.com>
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
In-Reply-To: <af2715ab-987c-4e90-a3a0-c136f2e8d8d7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.11.2024 00:46, Andrew Cooper wrote:
> On 12/11/2024 2:59 pm, Jan Beulich wrote:
>> Apparently I blindly copied the constants from the BEXTR case, where SF
>> indeed wants leaving out. For BLSI, BLSMSK, BLSR, and BZHI SF is
>> defined, and hence wants checking. This is noticable in particular for
>> BLSR, where with the input we use SF will be set in the result (and
>> hence is being switched to be clear on input).
>>
>> Convert to using named constants we have available, while omitting DF,
>> TF, as well as the MBZ bits 3 and 5 from the masking values in the
>> checks of the produced output. For BZHI also set SF on input, expecting
>> it to transition to clear.
>>
>> Fixes: 771daacd197a ("x86emul: support BMI1 insns")
>> Fixes: 8e20924de13d ("x86emul: support BMI2 insns")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> However, there's a related bug elsewhere.  I recently learnt that the
> rotate instructions are different between vendors.  AMD leaves CF/OF
> well defined, others preserved, while Intel has CF well defined, and
> others undefined (seemingly zero in practice, but clearly there's a very
> old processor which wasn't).

Quoting from the PM's RCL page:

"For 1-bit rotates, the instruction sets the OF flag to the logical xor
 of the CF bit (after the rotate) and the most significant bit of the
 result. When the rotate count is greater than 1, the OF flag is undefined.
 When the rotate count is 0, no flags are affected."

That's the same as Intel behavior. If we were to test anything beyond what
the SDM says, we'd at least need a reference to where that behavior is
specified / described.

Further, considering ...

> We test RCL and happen to fall into a common subset between vendors.  At
> least the emulator itself dispatches to real instructions, so guests
> ought to see the behaviour correct for the CPU.

... this behavior, I'm not even sure I see where there would be a bug. We
could in principle tighten the test for the AMD case, or we could add a
comment. Yet neither would really look like a bugfix to me.

>> --- a/tools/tests/x86_emulator/test_x86_emulator.c
>> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
>> @@ -1969,10 +1969,13 @@ int main(int argc, char **argv)
>>  
>>          *res        = 0xfedcba98;
>>          regs.edx    = (unsigned long)res;
>> -        regs.eflags = 0xac2;
>> +        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS_OF | X86_EFLAGS_SF | \
>> +                      X86_EFLAGS_ZF;
>>          rc = x86_emulate(&ctxt, &emulops);
>>          if ( (rc != X86EMUL_OKAY) || regs.ecx != 8 || *res != 0xfedcba98 ||
>> -             (regs.eflags & 0xf6b) != 0x203 || !check_eip(blsi) )
>> +             (regs.eflags & (EFLAGS_MASK & ~(X86_EFLAGS_AF | X86_EFLAGS_PF))) !=
>> +              (EFLAGS_ALWAYS_SET | X86_EFLAGS_CF) ||
> 
> As an observation, this is really wanting for an EFL_SYM() helper like
> the others I have in XTF  (I haven't needed one for flags specifically).
> 
> The verbosity definitely interferes with the clarity.

Hmm, yes - added to the TODO list.

Jan

