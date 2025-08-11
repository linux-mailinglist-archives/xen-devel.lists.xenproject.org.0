Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B43ECB20469
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 11:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077194.1438272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulPBG-000250-OI; Mon, 11 Aug 2025 09:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077194.1438272; Mon, 11 Aug 2025 09:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulPBG-00022b-LQ; Mon, 11 Aug 2025 09:51:02 +0000
Received: by outflank-mailman (input) for mailman id 1077194;
 Mon, 11 Aug 2025 09:51:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92re=2X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ulPBF-00022U-0u
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 09:51:01 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae7c7f93-7698-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 11:50:58 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-459e794b331so24820165e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 02:50:58 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458f713eb44sm371093015e9.14.2025.08.11.02.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 02:50:57 -0700 (PDT)
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
X-Inumbo-ID: ae7c7f93-7698-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754905858; x=1755510658; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VctuL99TGMSbM9k2sDcx8mKeApKJEWYgjDa2qFkfm+U=;
        b=qX30mlkhNJy+OJ0jws4CnrqwIJiwzAtrSHm+67Zn2KxnX1+70QE3hO5Nm7JCl3aTF/
         3Y2QvpmpjPdnmI6odI3JXAKyya9iylkRQhu8Y2yKaSGS2SFZ14G50nQAJKvH+2QSi2n8
         SuvcYtZlfGO2h/rJXuNkS5nIG6mlUbqiud8O4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754905858; x=1755510658;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VctuL99TGMSbM9k2sDcx8mKeApKJEWYgjDa2qFkfm+U=;
        b=TA89phn2AJirh6h3VCPR3Pdi7dtYysF+HzIJvD+JBYht6CvBX1qYAxDMsg+h2HF3yO
         Cec/ZG/+DhqHT7XeGgZ1sfXj3DLECXC7RJJXncrRmtapDfzYUtNHsEdEvbGmWuf1F931
         jlxjOjVgyJB88CFta+2XcmuiSGxCbxPRRGd6KYKu0yySVMA7vQUqPr/d2Ie7sKSUYpHF
         i/+KxsOTBPbNfRd/sQV/BxPEW9roESLN/Q053Py3bceUFGxmkoMkfcYZt4edzgO0BxcC
         Mfpdu3QDDEUOSU9zuK7Vbeddk2oJMjx3E4U9Dk+YuqLatvHar1zDYuSgXjyBt9vsOM09
         LDAA==
X-Forwarded-Encrypted: i=1; AJvYcCXRFfJVvwLJPoA8FDpQjL6CFUo8ZaBPgnTx0Ej0MdHAuyVUGJwBBmw17Ozvf3JkDq2sj++d3agVcok=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJdqt/dCAtcwKWTAlusjNlIc/MRusRncegAcMHIHzxWw9A+SMW
	2LYXgpZpmbvORjJGHRIDWObJxr5Ja1L16Rqny+MpE4dUu7Ucj3EdB/a19kjQA4Q+DBI=
X-Gm-Gg: ASbGncv9n0PjpAPO2xfABerM4goobfMNqo6Lvq6kKCuMa3dJiOLIx53FzbU03j9T63i
	LZyKTRvRHHem+YdyApUwM7S0dnNSUb+4oOiP24KRR//E7yfvDnwRfmJj2pLUupirsdSbtWy8Z6x
	eA65cjfNaY9+akryY4sS2aoiBktXDtYuG7K/qlrj/Y2ZXbKPZwp90oe08ZB85IfTlUDiY7vwVsC
	BLEZpnpwM4Gn6mMl2j+KqyGaZl1XEFK/ottss0TNdwibV9ur+ALq2gN2uZc6j0LP9ChdioZVs9u
	AjQsn2jNhgZ/Ol5aLTxGc8J3BclAnvAf11f8JgxZ6KMHx1i7bY7TrxfFVmXoCEahKxjRoMjlZDw
	Ausy0W10MwPxtIoY6Awnxucd3gmMIuPTSAFXIoP1TmFJVNUkFC0avlC+f2cZEzRMBBzmp
X-Google-Smtp-Source: AGHT+IHe7JjdCabchw4vqGyYXQkhiLINMsVkJ1ZSJ2yhu3FIkDhmrRnDUL1L1Hv6jH7JFMbcmYgJRw==
X-Received: by 2002:a05:600c:1d01:b0:459:dba8:bb7b with SMTP id 5b1f17b1804b1-459f4ecf85cmr111572515e9.13.1754905857805;
        Mon, 11 Aug 2025 02:50:57 -0700 (PDT)
Message-ID: <0d78dd8e-af92-4b29-9706-e08c2c06ee89@citrix.com>
Date: Mon, 11 Aug 2025 10:50:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC x86/msr: Use WRMSRNS $imm when available
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808222013.1071291-1-andrew.cooper3@citrix.com>
 <e81bc459-347c-4eb9-8f8e-ada25fe8966f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e81bc459-347c-4eb9-8f8e-ada25fe8966f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/08/2025 9:16 am, Jan Beulich wrote:
> On 09.08.2025 00:20, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> This is on top of the FRED series for the wrmsrns() cleanup, but otherwise
>> unrelated.
>>
>> The code generation isn't entirely ideal
>>
>>   Function                                     old     new   delta
>>   init_fred                                    255     274     +19
>>   vmx_set_reg                                  248     256      +8
>>   enter_state_helper.cold                     1014    1018      +4
>>   __start_xen                                 8893    8897      +4
>>
>> but made worse by the the prior codegen for wrmsrns(MSR_STAR, ...) being mad:
>>
>>   mov    $0xc0000081,%ecx
>>   mov    $0xe023e008,%edx
>>   movabs $0xe023e00800000000,%rax
>>   cs wrmsr
>>
>> The two sources of code expansion come from the compiler not being able to
>> construct %eax and %edx separately, and not being able propagate constants.
>>
>> Loading 0 is possibly common enough to warrant another specialisation where we
>> can use "a" (0), "d" (0) and forgo the MOV+SHR.
>>
>> I'm probably overthinking things.  The addition will be in the noise in
>> practice, and Intel are sure the advantage of MSR_IMM will not be.
> It's not entirely clear to me what the overall effects are now with your
> 02/22 reply on the FRED series.

The delta gets larger now that 2/22 isn't quite as bad as it was.

>  Nevertheless a nit or two here.
>
>> --- a/xen/arch/x86/include/asm/msr.h
>> +++ b/xen/arch/x86/include/asm/msr.h
>> @@ -38,9 +38,46 @@ static inline void wrmsrl(unsigned int msr, uint64_t val)
>>          wrmsr(msr, lo, hi);
>>  }
>>  
>> +/*
>> + * Non-serialising WRMSR with a compile-time constant index, when available.
>> + * Falls back to plain WRMSRNS, or to a serialising WRMSR.
>> + */
>> +static always_inline void __wrmsrns_imm(uint32_t msr, uint64_t val)
>> +{
>> +    /*
>> +     * For best performance, WRMSRNS %r64, $msr is recommended.  For
>> +     * compatibility, we need to fall back to plain WRMSRNS, or to WRMSR.
>> +     *
>> +     * The combined ABI is awkward, because WRMSRNS $imm takes a single r64,
>> +     * whereas WRMSR{,NS} takes a split edx:eax pair.
>> +     *
>> +     * Always use WRMSRNS %rax, $imm, because it has the most in common with
>> +     * the legacy forms.  When MSR_IMM isn't available, emit setup logic for
>> +     * %ecx and %edx too.
>> +     */
>> +    alternative_input_2(
>> +        "mov $%c[msr], %%ecx\n\t"
> Simply %[msr] here?
>
> And then, might it make sense to pull out this and ...
>
>> +        "mov %%rax, %%rdx\n\t"
>> +        "shr $32, %%rdx\n\t"
>> +        ".byte 0x2e; wrmsr",
>> +
>> +        /* WRMSRNS %rax, $msr */
>> +        ".byte 0xc4,0xe7,0x7a,0xf6,0xc0; .long %c[msr]", X86_FEATURE_MSR_IMM,
>> +
>> +        "mov $%c[msr], %%ecx\n\t"
> ... this, to ...
>
>> +        "mov %%rax, %%rdx\n\t"
>> +        "shr $32, %%rdx\n\t"
>> +        ".byte 0x0f,0x01,0xc6", X86_FEATURE_WRMSRNS,
>> +
>> +        [msr] "i" (msr), "a" (val) : "rcx", "rdx");
>         [msr] "i" (msr), "a" (val), "c" (msr) : "rdx");
>
> allowing the compiler to actually know what's put in %ecx? That'll make
> original and 2nd replacement code 10 bytes, better balancing with the 9
> bytes of the 1st replacement. And I'd guess that the potentially dead
> MOV to %ecx would be hidden in the noise as well.

I considered that, but what can the compiler do as a result of knowing %ecx?

That said, we do need an RDMSR form (which I desperately want to make
foo = rdmsr(MSR_BAR) but my cleanup series from 2019 got nowhere), and
in a read+write case I suppose the compiler could deduplicate the setup
of %ecx.

A dead mov $imm, %ecx probably is as close to a nop as makes no difference.

~Andrew

