Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C509E968995
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 16:14:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788006.1197455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl7oG-0004hz-7y; Mon, 02 Sep 2024 14:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788006.1197455; Mon, 02 Sep 2024 14:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl7oG-0004fK-5E; Mon, 02 Sep 2024 14:13:36 +0000
Received: by outflank-mailman (input) for mailman id 788006;
 Mon, 02 Sep 2024 14:13:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qspk=QA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sl7oF-0004fE-2J
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 14:13:35 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88995d6c-6935-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 16:13:31 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a86910caf9cso917803766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 07:13:32 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989009096sm560067666b.48.2024.09.02.07.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 07:13:30 -0700 (PDT)
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
X-Inumbo-ID: 88995d6c-6935-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725286411; x=1725891211; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EpJ/DeUOQtgMpNGUZFZKFFHst7KaChc8K3sLVhGdWkY=;
        b=a/UFyF3QU9BSJWqQrteuV6T2YtmOnKh231nX6VIRpgWk3Y9S9IfS77E1w6z6yh1AwQ
         T8BX3s17CzAUtU4xRkMih8NyvTMl3L1+NYfqI943LSHiZmysOR8DpP5YEbIRkv35nuPJ
         n2jU/OkVF8IOq9DhRQbvC7x+/MCNeEgyO2vxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725286411; x=1725891211;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpJ/DeUOQtgMpNGUZFZKFFHst7KaChc8K3sLVhGdWkY=;
        b=DZAgpoGff8MtUnHBHxEV1Wots36x5D/dTKnBp+aqQiH5yCoaRKXP1LRzcX7ug7MwF8
         NpvZRGFmxlf+jpUEJn3cFQeZCapEa6jZJ+ALUjGh8dEzaVJ5TkIncBP51Q5sXbHMGTmf
         1L1dmBQcKv1SSGV/v9A3mkPkyhRqaNQK3UTHvFW8xqc2JKUs073EsIrKCR1xxJnN3d/K
         TSvBOwKKKijJD2v9Zsk/17Kuaz1iGB52SyHZmbYojexxEhoBiROuDpFs2UQKRkRJgQ1K
         pLcNGyM7JeKPE+ihNhRES4qmydnt3A16OX+kpDa6ZbnJD/WiPw7gAhiq1bOm0zGTy27c
         iBZg==
X-Forwarded-Encrypted: i=1; AJvYcCUazfDhKYKhuQaflJ+eI0DuAnS42s1NW3U2vNed1CjmuYLb/3Rw+PgxOJgeP+5KjzK67rLCjJDfMeY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyD5HJ7YBTUhK4zpumoQlL+cewAzA6qPmnQLVShits+xUWJHpe6
	Wky3tfrRgfM2VqcSmLA5Th682JPpBZN3mSCvueMmAia09RLvHQK/IxpXcxQByzE=
X-Google-Smtp-Source: AGHT+IEsbw2WBsxt/dwCz2844sfNuT4wVVWHy62awL20fNSo2uWvB/3oj9M8PfQpg9gmWTMkffjSPg==
X-Received: by 2002:a17:907:608c:b0:a80:f646:c9c4 with SMTP id a640c23a62f3a-a898231c37emr1574907766b.1.1725286410831;
        Mon, 02 Sep 2024 07:13:30 -0700 (PDT)
Message-ID: <8b737e1c-f229-4355-bc4c-1f147acc3920@citrix.com>
Date: Mon, 2 Sep 2024 15:13:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PV: simplify (and thus correct) guest accessor
 functions
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <3c1a7eee-7909-4b18-9497-1d0a6ee4f17d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3c1a7eee-7909-4b18-9497-1d0a6ee4f17d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/09/2024 1:28 pm, Jan Beulich wrote:
> Taking a fault on a non-byte-granular insn means that the "number of
> bytes not handled" return value would need extra care in calculating, if
> we want callers to be able to derive e.g. exception context (to be
> injected to the guest) - CR2 for #PF in particular - from the value. To
> simplify things rather than complicating them, reduce inline assembly to
> just byte-granular string insns. On recent CPUs that's also supposed to
> be more efficient anyway.
>
> For singular element accessors, however, alignment checks are added,
> hence slightly complicating the code. Misaligned (user) buffer accesses
> will now be forwarded to copy_{from,to}_guest_ll().
>
> Naturally copy_{from,to}_unsafe_ll() accessors end up being adjusted the
> same way, as they're produced by mere re-processing of the same code.
> Otoh copy_{from,to}_unsafe() aren't similarly adjusted, but have their
> comments made match reality; down the road we may want to change their
> return types, e.g. to bool.
>
> Fixes: 76974398a63c ("Added user-memory accessing functionality for x86_64")
> Fixes: 7b8c36701d26 ("Introduce clear_user and clear_guest")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This is definitely simpler, however the code gen less so.

add/remove: 0/0 grow/shrink: 42/9 up/down: 2759/-178 (2581)


> --- a/xen/arch/x86/include/asm/uaccess.h
> +++ b/xen/arch/x86/include/asm/uaccess.h
> @@ -251,7 +251,8 @@ do {
>  static always_inline unsigned long
>  __copy_to_guest_pv(void __user *to, const void *from, unsigned long n)
>  {
> -    if (__builtin_constant_p(n)) {
> +    if ( __builtin_constant_p(n) && !((unsigned long)to & (n - 1)) )
> +    {

The problem is that we now emit this if condition unconditionally,
because the alignment check isn't constant-foldable.  This in turn
forces setup for both the trivial case and the function call case,
compounding the bloat.

e.g. the same example:

unsigned int foo(void *ptr)
{
    uint16_t val;
    return __copy_from_guest_pv(&val, ptr, sizeof(val));
}

now generates:

<foo>:
    48 89 f8                 mov    %rdi,%rax
    48 83 ec 08              sub    $0x8,%rsp
    48 89 fe                 mov    %rdi,%rsi
    83 e0 01                 and    $0x1,%eax
    75 31                    jne    <foo+0x40>
    0f 1f 00                 nopl   (%rax) // STAC
    48 89 fa                 mov    %rdi,%rdx
    49 b8 ff ff ff ff ff     movabs $0xffff87ffffffffff,%r8
    87 ff ff
    48 c7 c7 ff ff ff ff     mov    $0xffffffffffffffff,%rdi
    49 39 d0                 cmp    %rdx,%r8
    48 d1 df                 rcr    %rdi
    48 21 fa                 and    %rdi,%rdx
    66 8b 0a                 mov    (%rdx),%cx
    66 89 4c 24 06           mov    %cx,0x6(%rsp)
    0f 1f 00                 nopl   (%rax) // CLAC
    48 83 c4 08              add    $0x8,%rsp
    c3                       ret
    90                       nop
    48 8d 7c 24 06           lea    0x6(%rsp),%rdi
    ba 02 00 00 00           mov    $0x2,%edx
    e8 11 bc 03 00           call   <copy_from_guest_ll>
    48 83 c4 08              add    $0x8,%rsp
    c3                       ret


If we're not sure of the alignment in the first place, then it's better
to hand off to copy_*_guest_ll than to emit logic like this.

However, I can't think of any way of doing this without forgoing the
optimisation entirely.  We can't base anything on the type of the
guest-side pointer because while a guest expected to align it, there's
no hard requirement.  In turn, this means there's about nothing we can
do with compiler heuristics in Xen.

Perhaps the right thing to do is have copy_*_guest_ll have a fastpath
for aligned single accesses, and forgo the inline code generation entirely.

~Andrew

