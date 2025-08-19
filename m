Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C070B2C630
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 15:53:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086648.1444844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoMlK-0002kw-33; Tue, 19 Aug 2025 13:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086648.1444844; Tue, 19 Aug 2025 13:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoMlK-0002iZ-0L; Tue, 19 Aug 2025 13:52:30 +0000
Received: by outflank-mailman (input) for mailman id 1086648;
 Tue, 19 Aug 2025 13:52:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h/XH=27=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uoMlI-0002iT-OS
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 13:52:28 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd4f3ec9-7d03-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 15:52:26 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45a1b0bde14so28704735e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 06:52:26 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c074e38d7dsm3782419f8f.26.2025.08.19.06.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 06:52:25 -0700 (PDT)
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
X-Inumbo-ID: bd4f3ec9-7d03-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755611546; x=1756216346; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7swxEesY8TTAbthc0zToAK4jgbEeaVJCTFFGLivNJno=;
        b=Zfd5vXI7ChUDv7DQpJXXjC7TjbsZkVxaKYNcjAciWbaV4lUSBPQ9hrGiosl3WHZOVp
         arQ95pp1IOR9sbNBog1sXJNU8TS4+T3EkQ3h+3mG8rWk8MEcjPbBi5NwNN0bg47DbGH4
         +pV+Fzij5ZeBj57f+/VOdBnwhY3Y4pMTKMs5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755611546; x=1756216346;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7swxEesY8TTAbthc0zToAK4jgbEeaVJCTFFGLivNJno=;
        b=l/uoP+/HpLeuYxGrpmuUqyHoctvnDUTO/ssVpiykPPhUS2Caq7s95we9p3KQJXBrR2
         RgYaH3o3UCDUEY1BnFGmq9z3IS5oYK8ohh9h9+/37AigU4yF/D/BnJORVGXs8UTZupDQ
         WPRgrJDJuyaOUE5x3Ke9aHcTMbpaSNnhsq7nJtkmryDFyJNnLUn+/eCyoW1S1LHHQg8S
         uaK3ZpVHeRRkSEJTFCQxehT0HdhTIMsosqoyctrss+3lDfSVesDpkkwkDeMaButrRLch
         6SNNAPzABmGNec6xilDB5u0/7L3/VpDbHflFPeIJuWF7Oi2UJlYEOZOHPJwafHZUet8x
         0p4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3lM6w8DyV1FsHqkDv3Yf/NzocKw3o8FxoCLeZbbx0CZomXLRLljiIJ47EaXg5AoH9SA2C/+q81dI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxsGaUmM21s1lxdgOLnbxm6kJu7t4zISmivjARnwvrPTSkkjBCO
	qmp3JJW8MY93c1F9vKvySMkbczEYF+1y7MFSlVGd317IOGWVAYNmQo1XsJpBC2xnNzA=
X-Gm-Gg: ASbGncshlGG/opRpjDgftrJCw0PrFrSyIiiQrBvd3X29AuoQqzmjl9LFTB9VHnUgtBO
	FNjDiNKijtRLFWnpFfIF4Cu+Jkjitcbr3l27SuucMZve2/QmZclww7ZZY1DBaVTOmFUrxEWL6c7
	5DjgQfmAoLPWVX12dlnZfL3iwfzun+RyouwwkBNhgTcHWE1duDEMV5CfyBbVtx4nitvo42q2n5W
	UsNjGDkWgPNIfatI67KGOeeCHtVvQ5XuvmiKHUofiZbqIsFRQSxPsTXgdYE/mWhe4iBz6JhMeEa
	/aPPucWwytvtq+UuiNWMeu91dNxTPFgM3XkqLIjF9xTh6ztSATiuTE64M7x5Aak6BMlx5HPUfvF
	JLrTD/U7Gj2kjRIP9GFDmyybiDSsV8TJvLg18RFnVfouH8YXQ+2nC0w4JenYcaBPdj6LT
X-Google-Smtp-Source: AGHT+IFq9rV/MMRVD6xuIENbiUP3FVASr+/aumZjUU5RrQeGaK8UN6jDZ2fhbtTYzDR5yvuC/i2i2w==
X-Received: by 2002:a05:6000:4287:b0:3b8:d955:c598 with SMTP id ffacd0b85a97d-3c0eca48acbmr1603800f8f.30.1755611545555;
        Tue, 19 Aug 2025 06:52:25 -0700 (PDT)
Message-ID: <7b836f06-74ab-4588-8aeb-d0105b54be91@citrix.com>
Date: Tue, 19 Aug 2025 14:52:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/16] x86/msr: Rework rdmsr_safe() using asm goto()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-3-andrew.cooper3@citrix.com>
 <aa57cc7c-c659-4949-aaed-4484ead54ffc@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aa57cc7c-c659-4949-aaed-4484ead54ffc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/08/2025 12:27 pm, Jan Beulich wrote:
> On 15.08.2025 22:41, Andrew Cooper wrote:
>> ... on capable toolchains.
>>
>> This avoids needing to hold rc in a register across the RDMSR, and in most
>> cases removes direct testing and branching based on rc, as the fault label can
>> be rearranged to directly land on the out-of-line block.
>>
>> There is a subtle difference in behaviour.  The old behaviour would, on fault,
>> still produce 0's and write to val.
>>
>> The new behaviour only writes val on success, and write_msr() is the only
>> place where this matters.  Move temp out of switch() scope and initialise it
>> to 0.
> But what's the motivation behind making this behavioral change? At least in
> the cases where the return value isn't checked, it would feel safer if we
> continued clearing the value. Even if in all cases where this could matter
> (besides the one you cover here) one can prove correctness by looking at
> surrounding code.

I didn't realise I'd made a change at first, but it's a consequence of
the compiler's ability to rearrange basic blocks.

It can be fixed with ...

>
>> --- a/xen/arch/x86/include/asm/msr.h
>> +++ b/xen/arch/x86/include/asm/msr.h
>> @@ -55,6 +55,24 @@ static inline void wrmsrns(uint32_t msr, uint64_t val)
>>  /* rdmsr with exception handling */
>>  static inline int rdmsr_safe(unsigned int msr, uint64_t *val)
>>  {
>> +#ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
>> +    uint64_t lo, hi;
>> +    asm_inline goto (
>> +        "1: rdmsr\n\t"
>> +        _ASM_EXTABLE(1b, %l[fault])
>> +        : "=a" (lo), "=d" (hi)
>> +        : "c" (msr)
>> +        :
>> +        : fault );
>> +
>> +    *val = lo | (hi << 32);
>> +
>> +    return 0;
>> +
>> + fault:

    *val = 0;

here, but I don't want to do this.  Because val is by pointer and
generally spilled to the stack, the compiler can't optimise away the store.

I'd far rather get a real compiler error, than to have logic relying on
the result of a faulting MSR read.

>> +    return -EFAULT;
>> +#else
>>      int rc;
>>      uint64_t lo, hi;
> ... the same being needed here?

Fixed.

~Andrew

