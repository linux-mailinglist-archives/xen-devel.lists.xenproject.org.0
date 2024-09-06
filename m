Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3150096FC10
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 21:20:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.792013.1202067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smeVD-0000Q3-Pc; Fri, 06 Sep 2024 19:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 792013.1202067; Fri, 06 Sep 2024 19:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smeVD-0000No-Mh; Fri, 06 Sep 2024 19:20:15 +0000
Received: by outflank-mailman (input) for mailman id 792013;
 Fri, 06 Sep 2024 19:20:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+R7=QE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smeVC-0000Nh-V4
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 19:20:14 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09f40a9e-6c85-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 21:20:12 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c2561e8041so2667296a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Sep 2024 12:20:12 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a6236d527sm310198666b.135.2024.09.06.12.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 12:20:11 -0700 (PDT)
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
X-Inumbo-ID: 09f40a9e-6c85-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725650412; x=1726255212; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ujcBfhl2qeHig0fN5Ls/vjy9AU7OiAZ/U3DXlqnsx3k=;
        b=EgRil9sfEhk4E07sAgpPOxskz47ONCbkx4Ysu9MxF1ybUsECnstYMVMGy8nk8Vh3qM
         K8X+8NYdK2zbjJnymbY7fHa+cIR5RC8BaEUsd/XUM4wB2ckea82mLyUDSlPzSzG86qfi
         n5eWTgYHJCNmGCo189boNh7MtBrqkv4PjY5pE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725650412; x=1726255212;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujcBfhl2qeHig0fN5Ls/vjy9AU7OiAZ/U3DXlqnsx3k=;
        b=WM/KztR9PZ9PKHXTYvrUhb3b7wiTBpsXFDxkbIdOzJfT0PHskxBC+Yni5HibIlxGJc
         dGCjLkLe11jqk6HHBCwbruFzD0ZU+WHYNkF71vV5AA+aBtdAYoDOUjYyCXMsqN5wEsOS
         wDTncQoLdF3NFz/JV6o/XClWyE0w5HY58h4hRiLzlLN6wvDeZGc0cqDYffZC4UrK6ARE
         fIBnwdKFTkMW1ul6DT4D+Y7lomdyEnHVZAgqWjMfpXpfdjMIqjqXKow8zpCS4DXDTvA+
         YX1QZnbx0LP4a2lxau/xKjJ+1qmpqkTmKmMYa14SH73xYdxwsUgKzHbEhZHN4BlhA4Tg
         yHpA==
X-Forwarded-Encrypted: i=1; AJvYcCVYOwfbjqGXZP//DdCCTRqyOhVpUCgPaDRKCwruz7ZmOo5BG7cmsN2n8PXleIueC500/awjXRg3qE4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3zATWAgbOeLWWg4+h5UOgmzx/ma7KiDZagMZmpMloqv69GIcP
	dm2KRHS0INkUKbDPmZmBlJJkUpyosDJhiRY7B03T/k/0Vx/nxbCJ6qLfTJKxRP5Suoa6QHIRmYD
	y
X-Google-Smtp-Source: AGHT+IE6V+IPR+q4iv2lEGIvMhOPJb0/l8O5pPYnirORg2pnIkRgyyg5cKEgPPRT1bVOfGAURgi0Ww==
X-Received: by 2002:a17:906:eec7:b0:a88:b90b:bd5e with SMTP id a640c23a62f3a-a8a885be339mr258697866b.3.1725650411535;
        Fri, 06 Sep 2024 12:20:11 -0700 (PDT)
Message-ID: <53ecfaa0-3be1-4da0-ad8d-8245512e4172@citrix.com>
Date: Fri, 6 Sep 2024 20:20:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86/HVM: allocate emulation cache entries dynamically
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <31906cba-8646-4cf9-ab31-1d23654df8d1@suse.com>
 <e35606db-9050-485a-84fb-168f101b5d1c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e35606db-9050-485a-84fb-168f101b5d1c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/09/2024 2:29 pm, Jan Beulich wrote:
> Both caches may need higher capacity, and the upper bound will need to
> be determined dynamically based on CPUID policy (for AMX at least).

Is this to cope with TILE{LOAD,STORE}, or something else?

It's not exactly clear, even when looking at prior AMX series.

> While touching the check in hvmemul_phys_mmio_access() anyway, also
> tighten it: To avoid overrunning the internal buffer we need to take the
> offset into the buffer into account.

Does this really want to be mixed with a prep patch ?

>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This is a patch taken from the AMX series, which was part of the v3
> submission. All I did is strip out the actual AMX bits (from
> hvmemul_cache_init()), plus of course change the description. As a
> result some local variables there may look unnecessary, but this way
> it's going to be less churn when the AMX bits are added. The next patch
> pretty strongly depends on the changed approach (contextually, not so
> much functionally), and I'd really like to avoid rebasing that one ahead
> of this one, and then this one on top of that.

Fine by me.

> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -26,6 +26,18 @@
>  #include <asm/iocap.h>
>  #include <asm/vm_event.h>
>  
> +/*
> + * We may read or write up to m512 or up to a tile row as a number of
> + * device-model transactions.
> + */
> +struct hvm_mmio_cache {
> +    unsigned long gla;
> +    unsigned int size;
> +    unsigned int space:31;
> +    unsigned int dir:1;
> +    uint8_t buffer[] __aligned(sizeof(long));

I know this is a minor tangent, but you are turning a regular struct
into a flexible one.

Could we introduce __counted_by() and start using it here?

At the toolchain level, it lets the compiler understand the real size of
the object, so e.g. the sanitisers can spot out-of-bounds accesses
through the flexible member.

But, even in the short term, having

    /* TODO */
    # define __counted_by(member)

in compiler.h still leaves us with better code, because

    struct hvm_mmio_cache {
        unsigned long gla;
        unsigned int size;
        unsigned int space:31;
        unsigned int dir:1;
        uint8_t buffer[] __aligned(sizeof(long)) __counted_by(size);
    };

is explicitly clear in a case where the "space" field creates some
ambiguity.

> @@ -2978,16 +2991,21 @@ void hvm_dump_emulation_state(const char
>  int hvmemul_cache_init(struct vcpu *v)
>  {
>      /*
> -     * No insn can access more than 16 independent linear addresses (AVX512F
> -     * scatters/gathers being the worst). Each such linear range can span a
> -     * page boundary, i.e. may require two page walks. Account for each insn
> -     * byte individually, for simplicity.
> +     * AVX512F scatter/gather insns can access up to 16 independent linear
> +     * addresses, up to 8 bytes size. Each such linear range can span a page
> +     * boundary, i.e. may require two page walks.
> +     */
> +    unsigned int nents = 16 * 2 * (CONFIG_PAGING_LEVELS + 1);
> +    unsigned int i, max_bytes = 64;
> +    struct hvmemul_cache *cache;
> +
> +    /*
> +     * Account for each insn byte individually, both for simplicity and to
> +     * leave some slack space.
>       */

Hang on.  Do we seriously use a separate cache entry for each
instruction byte ?

~Andrew

