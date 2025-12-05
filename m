Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EE0CA7B23
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 14:10:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179027.1502666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRVZJ-0005v9-3v; Fri, 05 Dec 2025 13:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179027.1502666; Fri, 05 Dec 2025 13:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRVZJ-0005tY-12; Fri, 05 Dec 2025 13:09:53 +0000
Received: by outflank-mailman (input) for mailman id 1179027;
 Fri, 05 Dec 2025 13:09:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vRVZH-0005tS-Ab
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 13:09:51 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad5a5fda-d1db-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 14:09:48 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso22543905e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Dec 2025 05:09:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311ece7asm82718475e9.12.2025.12.05.05.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 05:09:47 -0800 (PST)
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
X-Inumbo-ID: ad5a5fda-d1db-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764940188; x=1765544988; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cwSxZZQMARADIba/pcHLxEOjdWj43pLKjK2pWUdIk7o=;
        b=V9kYcMTfbNAfEkS8gLMKJUh/UbwXajLanZRt+ENY/Q0+u6XcEsBY4zlB/lZ4O7Py8F
         wow8w+ZM6Wmu7V4T2bp79qr4RWiA5Lz+Q3MEk/Ab7g0P1lUaRPhI5HPfHvoH7Adu6c9M
         bKdwCPhhOAu4YJPZmvZ77pr7eNChc/ir3Sqi8NNiRl09GswXWbG3LUx/ZyG3h6knaAzc
         D9R7kN0aPfU40vTel0QZ8FP6WE1b7lWFVdRrbxC12PEfTgvjroC6499ovYXrro0CufsI
         fvWLgc5EYTqXE8R6kGJYSoKZVayX/MAqIL4aE0GwEC3a9X6Ipps8h/DQq/8WfOSnnKne
         YjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764940188; x=1765544988;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwSxZZQMARADIba/pcHLxEOjdWj43pLKjK2pWUdIk7o=;
        b=mcLBg0Hq2cBfdpZNApAp//OR2y8A/E/I0hC/I5AAShQHudvEYRJPIfJmN+SHnwlgsn
         /ZeB6UxUgMONBJ2oGO3mJ2ARTtdfbxOQHJObPv+Ey3D5sEp5/Ozt2NOa0VlkHN8R6se9
         fhfeE8WP2ydQFF/df0GAuSblKmjzGGqEzplw5HmVEOCGLNXkSneWsaqpu5KxUf44MUY0
         MPJ4sFACDyvUmdcfj0igOHhIQQI2NXGDfrDg1ryFFOIfp9VSMdqRDdTnOHTjkUBw199/
         faluuXXVmFKquOaj0lVXUFFRttU2FSNz3TWwkdMpQWzUUs6a1f1ZfdTxIhhRa5PnvnnG
         MjxA==
X-Forwarded-Encrypted: i=1; AJvYcCX7hmyRuT934xBaSyiklK12cE8unP//5cA9k+WWmx22D5Lifg6e/vRefpDaXympHLeSOm+BglQs/Kk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdnbEEDLgSSX0PFsE6vFVs0+PpnRfzPVVzkfmnU8HwdvRJgfo5
	WR2TSoNlVcKTTKvPmWQhH/soMnQBy0sB88oLYKeP7xp5IJ8Y0ZQDYPLtsu4lUYHBsg==
X-Gm-Gg: ASbGncs4IV7hiFBmuNXxGjvUbucJT9DUwKTCKMTCMhDzQehlcUSpTJ1A8MuTFB95KNm
	OJ30ZMGHCn6UxbyXXEpA50+SpuDUrToeJ8RZUVepA/kD58JDX0xWtNkBFDhd/iuCI9TDvibqeRA
	icMCB+TvgXH8C25P+qY/+DEGIRtKep24WuJk5pbmtd7QRsSBkvtP6IMjy/gVG7Eg0YnCobTM45w
	vVPBMB4gDAAW+A7LbuwzHBksPWvAIgeAwhG0UpXUK949FKS0sUjXV64bdznEEYVgcEIyUciOPDh
	Q/1k4/9Gcnkvy0klC6UmnDa0C9/Rib1Q1IBLYAuYilRVkR3qI2tOj/ekfWfTDxuhRUNXM7AcxL1
	ZDWqTFn0LoXaXfdHq8wOoHVjlVGxyDg+gQAi4wvzvTG95XlOzZk+IZTAyjwe/TF2vbbtFeViQXh
	VDzzlxZw5HYWgbwas87Hz7j/GsnfYpDOBwaU2ONBbWSO6T+hJKSpcRyNym43KLoVnkkNBs4rLM8
	5s=
X-Google-Smtp-Source: AGHT+IFxoCg8mQ5/cu1x7842j/TYEseAhXT7t7BYLnbetCOmjoDiTG8ErntaDFj0Ki31jsGUlGdxyA==
X-Received: by 2002:a05:600c:a11b:b0:477:a71c:d200 with SMTP id 5b1f17b1804b1-4792eb5e5b9mr62319185e9.11.1764940188019;
        Fri, 05 Dec 2025 05:09:48 -0800 (PST)
Message-ID: <258c07b3-3413-4d3a-9729-b01365e88b83@suse.com>
Date: Fri, 5 Dec 2025 14:09:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 09/10] x86: use / "support" UDB
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
 <78b7c8a0-16ae-49c3-8c7b-5b10f5b0d688@suse.com>
 <e2ce221b-f852-4f9a-8a82-322e6f2af522@citrix.com>
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
In-Reply-To: <e2ce221b-f852-4f9a-8a82-322e6f2af522@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2025 13:01, Andrew Cooper wrote:
> On 24/11/2025 3:01 pm, Jan Beulich wrote:
>> With opcode D6h now firmly reserved as another #UD-raising one in 64-bit
>> mode, use that instead of the two-byte UD2 for bug frame marking.
>>
>> While there also make the respective adjustment to the emulator.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Should we also switch {svm,vmx}_init_hypercall_page()?
> 
> The hypercall pages are 32/64-agnostic right now, and used by 32bit
> guests.  UDB isn't safe to use in those cases.
> 
>> Furthermore x86_64/kexec_reloc.S also has two uses. Question is whether
>> "tailcall" is being open-coded there, or whether that's deliberately not
>> using the macro we have.
> 
> The code in kexec_reloc.S long predates the tailcall macro.  Also I now
> regret calling it tailcall; terminalcall might be more accurate but it's
> overly long.
> 
> Very counter-intuitively, Linux has plain KEXEC which is phrase as
> "call", and KEXEC_JUMP which the ability for the invoked kernel to return.
> 
> For the regular cases, Linux invokes the new kernel by spilling a
> register to the stack, and RET-ing to it.  For KEXEC_JUMP, it does call
> the target kernel, after some games to set up a stack in the target image.
> 
> Either way, we can convert these two to plain JMPs.  One of the ud2's in
> particular cannot be converted to UDB because of being in 32bit code.

Oh, right.

> I can do a patch if you'd like?

I could as well. However, isn't BUG wrong (or at the very least misleading)
to use in either case? The code there isn't executed in place, but at
wherever the page is copied. Hence the address association in the resulting
bug frame is useless.

>> One of the table entries in stub_selftest() uses UD1, yet not in quite
>> an appropriate way: The 0x90 following it (presumably meant to be a NOP)
>> really is a ModR/M byte, requiring a displacement to follow. Wouldn't we
>> better adjust that (e.g. using 0xcc instead)?
> 
> Oh lovely...  That was my mistake in 2eb1132f7963, where I was
> converting what looked to be a double ret.
> 
> Can't we use 0x00 so it doesn't look like an int3 either, and update the
> comment to make it explicit that there's a ModRM byte?

As the situation isn't entirely tidy for whether UD1 takes a ModR/M byte,
at the very least I'd want to use something that's a single-byte opcode.
There aren't that many candidates in the 00-3F opcode range. The PUSH/POP
sreg insns I would want to avoid. The (no-op) segment overrides would
associate with whatever follows. Which would leave only the 4 opcodes
which are invalid in 64-bit mode.

If CC isn't desirable from your perspective, could we perhaps pick another
single-byte opcode from the C0-FF range?

>> --- a/xen/arch/x86/x86_emulate/decode.c
>> +++ b/xen/arch/x86/x86_emulate/decode.c
>> @@ -651,7 +651,7 @@ decode_onebyte(struct x86_emulate_state
>>      case 0xce: /* into */
>>      case 0xd4: /* aam */
>>      case 0xd5: /* aad */
>> -    case 0xd6: /* salc */
>> +        /* 0xd6 (salc) omitted here, for #UD to be raised in 64-bit mode. */
>>          s->not_64bit = true;
>>          break;
> 
> Why does the not_64bit logic not suffice?  #UD is exactly what we do:
> 
>     generate_exception_if(state->not_64bit && mode_64bit(), X86_EXC_UD);

Hmm, right, we could get away with just a comment adjustment here.

Jan

