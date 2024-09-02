Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABB5968AAC
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 17:10:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788107.1197546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8gk-0003bF-Vh; Mon, 02 Sep 2024 15:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788107.1197546; Mon, 02 Sep 2024 15:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8gk-0003Yt-SZ; Mon, 02 Sep 2024 15:09:54 +0000
Received: by outflank-mailman (input) for mailman id 788107;
 Mon, 02 Sep 2024 15:09:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sl8gj-0003Yk-1p
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 15:09:53 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66f9cf71-693d-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 17:09:52 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso4134568a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 08:09:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989223199sm569640266b.219.2024.09.02.08.09.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 08:09:50 -0700 (PDT)
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
X-Inumbo-ID: 66f9cf71-693d-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725289791; x=1725894591; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q5xLstq/+G8pxHhhkeGiGmqF/jcJCRyNkR8iFLjst+4=;
        b=fTiyduG98YbmCwGD6mS+ULBaKHs4/J49WRCxTMOpJpkPLHyXBsNZfR6ZBEUVRx5lWx
         VPj/sGNlZawBCtofVq8g7/DYKJZmkxvG6jbsM0kKul0JJ+mg/QQnbHclHLkr/kz598Le
         nHhWOpFR7H+02Hq3CNYWef7QLKK+hV6elcf9bUvVdRm+TiC07a1RUGqquQylvNkycu5K
         kQdBZ99gfqg55FLmbRho73t73zq9nw31fHP1pZm37xZV+tgt+KxSt+KLXnyZ7EUkq32K
         MKHQ6aNBJzfTN0xJErW482r1iGE4ux+qZOxWpEwPB7uUlCKW30MEhXG71zNb0EINvmcd
         eYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725289791; x=1725894591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5xLstq/+G8pxHhhkeGiGmqF/jcJCRyNkR8iFLjst+4=;
        b=pdN3i++htENQ2j2LOtRta8h6wow24KUchvVPlHOo/2TxjyZF7as3/z6hwCEB/boCiv
         ZVuAkawjfSH9GRgtbQML9+A3xjqJZAAAzGlIEhr9pxMLm7z07xDW99oP7xmdn7qOWF2G
         5IiTxlvndBCEaoacI5X7IRwcTTVUdJ8iC9R+KrsuLu/xOkOPw9uyjM6yK4t7qM/OOkrV
         +Gu+NNLoJku8wfBjapi3KjZzrtkmp05hpmJFzyA3Vkudp+mvU/OrTnI5LKoVx7VsFcO5
         WRE7H4DWtF7siA8HETQJFCEKqkH8k6zp6UmdpDocC3LQmIxFYyIrIDmPzcxdglMixOtW
         r3fg==
X-Forwarded-Encrypted: i=1; AJvYcCW0zGUJmtoIVz4Iq0pseEjdzjIYfCAGRuh2c4if+JaYalrHvXNLZbhMR7vfmzov6uZMiXnn0GQsHoY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpCbjXcZRSJCpX5HtXPxYP7mjLh24B3W0bvvJrgPEl2qd+LZkA
	e2N5Jf8fMpquvYWSKznbso0sTGu4Cn84AjACaAH7FuezJf7rBRv05buL4k09ag==
X-Google-Smtp-Source: AGHT+IG1twYE4F/rIlwzWZqAwy/rTTQZ41PER8IEw6bENI7dCzyXxUhAjGBfjK2nqWVdRVzkbsEliQ==
X-Received: by 2002:a17:907:97c2:b0:a77:c051:36a9 with SMTP id a640c23a62f3a-a89a2584240mr1072002766b.9.1725289790733;
        Mon, 02 Sep 2024 08:09:50 -0700 (PDT)
Message-ID: <b555d845-9746-484a-b945-4a69fa5beac2@suse.com>
Date: Mon, 2 Sep 2024 17:09:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PV: simplify (and thus correct) guest accessor
 functions
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3c1a7eee-7909-4b18-9497-1d0a6ee4f17d@suse.com>
 <8b737e1c-f229-4355-bc4c-1f147acc3920@citrix.com>
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
In-Reply-To: <8b737e1c-f229-4355-bc4c-1f147acc3920@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.09.2024 16:13, Andrew Cooper wrote:
> On 02/09/2024 1:28 pm, Jan Beulich wrote:
>> Taking a fault on a non-byte-granular insn means that the "number of
>> bytes not handled" return value would need extra care in calculating, if
>> we want callers to be able to derive e.g. exception context (to be
>> injected to the guest) - CR2 for #PF in particular - from the value. To
>> simplify things rather than complicating them, reduce inline assembly to
>> just byte-granular string insns. On recent CPUs that's also supposed to
>> be more efficient anyway.
>>
>> For singular element accessors, however, alignment checks are added,
>> hence slightly complicating the code. Misaligned (user) buffer accesses
>> will now be forwarded to copy_{from,to}_guest_ll().
>>
>> Naturally copy_{from,to}_unsafe_ll() accessors end up being adjusted the
>> same way, as they're produced by mere re-processing of the same code.
>> Otoh copy_{from,to}_unsafe() aren't similarly adjusted, but have their
>> comments made match reality; down the road we may want to change their
>> return types, e.g. to bool.
>>
>> Fixes: 76974398a63c ("Added user-memory accessing functionality for x86_64")
>> Fixes: 7b8c36701d26 ("Introduce clear_user and clear_guest")
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> This is definitely simpler, however the code gen less so.
> 
> add/remove: 0/0 grow/shrink: 42/9 up/down: 2759/-178 (2581)

Not nice, but entirely expected.

>> --- a/xen/arch/x86/include/asm/uaccess.h
>> +++ b/xen/arch/x86/include/asm/uaccess.h
>> @@ -251,7 +251,8 @@ do {
>>  static always_inline unsigned long
>>  __copy_to_guest_pv(void __user *to, const void *from, unsigned long n)
>>  {
>> -    if (__builtin_constant_p(n)) {
>> +    if ( __builtin_constant_p(n) && !((unsigned long)to & (n - 1)) )
>> +    {
> 
> The problem is that we now emit this if condition unconditionally,
> because the alignment check isn't constant-foldable.  This in turn
> forces setup for both the trivial case and the function call case,
> compounding the bloat.
> 
> e.g. the same example:
> 
> unsigned int foo(void *ptr)
> {
>     uint16_t val;
>     return __copy_from_guest_pv(&val, ptr, sizeof(val));
> }
> 
> now generates:
> 
> <foo>:
>     48 89 f8                 mov    %rdi,%rax
>     48 83 ec 08              sub    $0x8,%rsp
>     48 89 fe                 mov    %rdi,%rsi
>     83 e0 01                 and    $0x1,%eax
>     75 31                    jne    <foo+0x40>
>     0f 1f 00                 nopl   (%rax) // STAC
>     48 89 fa                 mov    %rdi,%rdx
>     49 b8 ff ff ff ff ff     movabs $0xffff87ffffffffff,%r8
>     87 ff ff
>     48 c7 c7 ff ff ff ff     mov    $0xffffffffffffffff,%rdi
>     49 39 d0                 cmp    %rdx,%r8
>     48 d1 df                 rcr    %rdi
>     48 21 fa                 and    %rdi,%rdx
>     66 8b 0a                 mov    (%rdx),%cx
>     66 89 4c 24 06           mov    %cx,0x6(%rsp)
>     0f 1f 00                 nopl   (%rax) // CLAC
>     48 83 c4 08              add    $0x8,%rsp
>     c3                       ret
>     90                       nop
>     48 8d 7c 24 06           lea    0x6(%rsp),%rdi
>     ba 02 00 00 00           mov    $0x2,%edx
>     e8 11 bc 03 00           call   <copy_from_guest_ll>
>     48 83 c4 08              add    $0x8,%rsp
>     c3                       ret
> 
> 
> If we're not sure of the alignment in the first place, then it's better
> to hand off to copy_*_guest_ll than to emit logic like this.
> 
> However, I can't think of any way of doing this without forgoing the
> optimisation entirely.  We can't base anything on the type of the
> guest-side pointer because while a guest expected to align it, there's
> no hard requirement.  In turn, this means there's about nothing we can
> do with compiler heuristics in Xen.

Well, I'm pretty sure we can retain the optimization, just that to do
so the patch will need to be more intrusive. I'd need to fiddle with
{get,put}_unsafe_asm() to make sure we produce a correct error
indicator (rather than the build-time constants passed into the macro).
Yet that'll still be more code per call site, even if most (all?) new
code would then live in .fixup.

If we went this route, we'd want to settle up front whether for the
to-guest operations we actually need the correct return values. The
problematic uses, after all, are all from-user if I'm not mistaken.
And determining how much of a buffer we can write to (ideally without
actually altering any data) is going to be a little more tricky than a
simple REP LODSB that we could use for read probing. Of course we
could take the position that since we were asked to write to the
buffer, we could as well REP STOSB e.g. zeroes into it.

Obviously there's then the corner case of the buffer becoming
accessible between the 1st and 2nd access attempt ...

Another option might be to actually make the CR2 value visible to the
fixup code, for use in calculating the correct error indicator. (If
the fault isn't #PF, returning the full size is imo good enough in
any event, even if there's the corner case of crossing the canonical-
noncanonical boundary.)

> Perhaps the right thing to do is have copy_*_guest_ll have a fastpath
> for aligned single accesses, and forgo the inline code generation entirely.

I expect that'll still be an increase in code size, plus presumably
some loss of performance (for the added calls and the new conditional).

Jan

