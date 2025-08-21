Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B05B2FFD7
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 18:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089029.1446724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up81m-0001HM-Vq; Thu, 21 Aug 2025 16:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089029.1446724; Thu, 21 Aug 2025 16:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up81m-0001Ew-Sr; Thu, 21 Aug 2025 16:20:38 +0000
Received: by outflank-mailman (input) for mailman id 1089029;
 Thu, 21 Aug 2025 16:20:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+vP=3B=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1up81l-0001Eq-0W
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 16:20:37 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4c4ff4d-7eaa-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 18:20:36 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b9e418ba08so549720f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 09:20:36 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b50e11ab8sm2684805e9.24.2025.08.21.09.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 09:20:34 -0700 (PDT)
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
X-Inumbo-ID: c4c4ff4d-7eaa-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755793235; x=1756398035; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mwAjPGHgdmUho15Le/6JepBQP61dWPSteegC+7r5tFQ=;
        b=FDpUGEM/MQoHcVu/iMVHWZPNaS2WLTJmIxepx4DlVA4KiojCFzwXz8fByY5WB5exmf
         FDujAqz9AkbBI8IvZH+LdeB3n5KjQgkDn6iioub3lAWAzV2lBrE3H0GzdUftxM6+Wm2s
         FvDEgijoUmFBRYD3eP8a30YuQADIduJxawgQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755793235; x=1756398035;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwAjPGHgdmUho15Le/6JepBQP61dWPSteegC+7r5tFQ=;
        b=OtJCCsI1dhn5gn6Fl40vnnScsNFUvl48YtW2oRMj3gUAyJ7ogRz/cyWz2Hf/1o6wtl
         9SP/R6ZfFbz8l87PE5wGOYe7eXhy0/9X5dJ7bqYYhtJ5raV4UJZjv2NHoMPvX7SboAiy
         ttTA0amrVXSu34Du8fm3xoCO37BKWOAaprgTEelmy1Ad5lfYjYQjnd7eciCBytAAzhWj
         WLv8d4Ljqu/sOO5k+uIl+03LyAk/4h95nurHYVuKGriYrd09FMyvQwrzd47pyHE1ZGq9
         xGmsFz8WZSkzisQraGqFVxp7CzbliRFKcg9G/HsgEZhQEBaXYhPEgYpS7IjLTcLMAvYG
         5s0g==
X-Forwarded-Encrypted: i=1; AJvYcCXhpfdC8veRGNKZni0D3h+YJOBoA+pWDkRN1efwg1RA1+p6K9jR/QFlUWl3erxdwYcrEL6Vv/2p610=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYZoYhWzXzZy2WUqtV07ppOy4/baWDUptd5qS/qGpoj65NZinU
	fO8w9J9bPd7T+e6mlxCB23a2hbjZLw+iLRf0PxIjtoPHfL0phVZigd+C6TOP6hSWNVw=
X-Gm-Gg: ASbGnctpA0loQjxBgLGVxOZdilX18vQi1sBZbSWZFJ78am4m08Qy7IKhsORPBXxpq+J
	CeIW92Wlflo5bf9v7PtwIkiSAjkZ0LNHytrN8kyKh4gmlVkF0YF2PwOQhc7E8YVzVp7FW6sIJlj
	M0c+3lSUKEjp3Ial7Oesj/FGebVENczSprqwhgkM76VsLADfUgV5qzP+mMB2+NJZ/Fv/pJVOve4
	/g6f5HSDZC97BkM7/lae2Y5cEhXquOnlA6XIPtDk8eTjN9l85V+upSrrxnICf5nHuYHpncSB+3n
	LcuqPJQM+sdeUnqqoIxd5YJdf9PhOqn0LQVuoHbZqykI1Ehcp4BF0ZlqdAzyptXPCwcrGgZrNLm
	1Qk/UNwh6ha26EIlrPsb/BmRqAuYkLZEnHkg1ChdVoM16S2JAt1PNg0rW3/phFQJn7IeY9ccx2s
	6YZ5w=
X-Google-Smtp-Source: AGHT+IEGOEk57coYBJDJtRycDLGWu6Sm4tEhRet+wp52N6YG6nycqQdfnNyOujvlNF6rRRU13N35aw==
X-Received: by 2002:adf:f4c4:0:b0:3c5:4844:4612 with SMTP id ffacd0b85a97d-3c548444c12mr1362229f8f.38.1755793235333;
        Thu, 21 Aug 2025 09:20:35 -0700 (PDT)
Message-ID: <885c3544-1a4b-492b-bd3c-dd2e818d7eff@citrix.com>
Date: Thu, 21 Aug 2025 17:20:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/16] x86/msr: Rework rdmsr_safe() using asm goto()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-3-andrew.cooper3@citrix.com>
 <aa57cc7c-c659-4949-aaed-4484ead54ffc@suse.com>
 <7b836f06-74ab-4588-8aeb-d0105b54be91@citrix.com>
 <01ece885-1363-4aac-99ce-205354419400@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <01ece885-1363-4aac-99ce-205354419400@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/08/2025 5:23 pm, Jan Beulich wrote:
> On 19.08.2025 15:52, Andrew Cooper wrote:
>> On 18/08/2025 12:27 pm, Jan Beulich wrote:
>>> On 15.08.2025 22:41, Andrew Cooper wrote:
>>>> ... on capable toolchains.
>>>>
>>>> This avoids needing to hold rc in a register across the RDMSR, and in most
>>>> cases removes direct testing and branching based on rc, as the fault label can
>>>> be rearranged to directly land on the out-of-line block.
>>>>
>>>> There is a subtle difference in behaviour.  The old behaviour would, on fault,
>>>> still produce 0's and write to val.
>>>>
>>>> The new behaviour only writes val on success, and write_msr() is the only
>>>> place where this matters.  Move temp out of switch() scope and initialise it
>>>> to 0.
>>> But what's the motivation behind making this behavioral change? At least in
>>> the cases where the return value isn't checked, it would feel safer if we
>>> continued clearing the value. Even if in all cases where this could matter
>>> (besides the one you cover here) one can prove correctness by looking at
>>> surrounding code.
>> I didn't realise I'd made a change at first, but it's a consequence of
>> the compiler's ability to rearrange basic blocks.
>>
>> It can be fixed with ...
>>
>>>> --- a/xen/arch/x86/include/asm/msr.h
>>>> +++ b/xen/arch/x86/include/asm/msr.h
>>>> @@ -55,6 +55,24 @@ static inline void wrmsrns(uint32_t msr, uint64_t val)
>>>>  /* rdmsr with exception handling */
>>>>  static inline int rdmsr_safe(unsigned int msr, uint64_t *val)
>>>>  {
>>>> +#ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
>>>> +    uint64_t lo, hi;
>>>> +    asm_inline goto (
>>>> +        "1: rdmsr\n\t"
>>>> +        _ASM_EXTABLE(1b, %l[fault])
>>>> +        : "=a" (lo), "=d" (hi)
>>>> +        : "c" (msr)
>>>> +        :
>>>> +        : fault );
>>>> +
>>>> +    *val = lo | (hi << 32);
>>>> +
>>>> +    return 0;
>>>> +
>>>> + fault:
>>     *val = 0;
>>
>> here, but I don't want to do this.  Because val is by pointer and
>> generally spilled to the stack, the compiler can't optimise away the store.
> But the compiler is dealing with such indirection in inline functions just
> fine. I don't expect it would typically spill val to the stack. Is there
> anything specific here that you think would make this more likely?

Yes.  The design of the functions they're used in.  Adding this line
results in:

add/remove: 0/0 grow/shrink: 7/2 up/down: 109/-36 (73)
Function                                     old     new   delta
read_msr                                    1243    1307     +64
resource_access                              326     341     +15
hwp_init_msrs.cold                           297     308     +11
probe_cpuid_faulting                         168     175      +7
svm_msr_read_intercept                      1034    1039      +5
hwp_write_request                            113     117      +4
hwp_init_msrs                                371     374      +3
amd_log_freq                                 844     828     -16
guest_rdmsr                                 2168    2148     -20

Taking read_msr() as a concrete example, this is because it's a store
into a parent functions variable, not into a local variable, and cannot
be elided.


>
>> I'd far rather get a real compiler error, than to have logic relying on
>> the result of a faulting MSR read.
> A compiler error? (Hmm, perhaps you think of uninitialized variable
> diagnostics. That may or may not trigger, depending on how else the
> caller's variable is used.)

Yes I was referring to the uninitialised variable diagnostic.  *_safe()
are fairly rare, and we've got plenty of coverage in CI.

~Andrew

