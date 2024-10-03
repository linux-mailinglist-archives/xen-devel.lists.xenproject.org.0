Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E65098F71E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 21:39:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809856.1222412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swReZ-0003EN-Lq; Thu, 03 Oct 2024 19:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809856.1222412; Thu, 03 Oct 2024 19:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swReZ-0003CU-J0; Thu, 03 Oct 2024 19:38:23 +0000
Received: by outflank-mailman (input) for mailman id 809856;
 Thu, 03 Oct 2024 19:38:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNe7=Q7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1swReY-0003CO-6w
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 19:38:22 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b79d4e5-81bf-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 21:38:20 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a90349aa7e5so194092466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 12:38:20 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104c970esm122773366b.214.2024.10.03.12.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 12:38:19 -0700 (PDT)
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
X-Inumbo-ID: 0b79d4e5-81bf-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727984300; x=1728589100; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1wCH17kqyGTYHLjt08ZQck/rF9pMp0Oc8Bj2uoNrZ0E=;
        b=PRnTwRhOmj6gyRxy7HolutF5uK4NRncwnKyAx6myrGJI7m63gMhB2YZmQTr9pFll5a
         adq4wPEZAyhQP+xIpFSBUdH3gpkSlcNr7n5QkbwRm8isUyW00QMoH9DuWPz77l3gC4y9
         IXU8oqNkuTPVJJ95aiB04s9GQj1myDEAEJc20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727984300; x=1728589100;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wCH17kqyGTYHLjt08ZQck/rF9pMp0Oc8Bj2uoNrZ0E=;
        b=D3MEv1mqgdeb4R5dX+v76CDA+1IFCofcdMlTaHjqqbtMBgUbET79BxKRRmxH41g64I
         C53Thi0W079GGyP8ye2AIM30xTWACimGVXDpz18BB2qCpOkyKRgsYnQkbp3KPBtPslnC
         lvJ+aFNzJVxUJCnHrC4yTEWs6oStkSpG8wSRsRSbT5nKbgO7hjhfexVBX0JrwmXe3MHt
         iq2x0chIljAKm0KvDv4HwNCymNlOnoR8NlmcCUl1ez2PWjwxbZiJn6VxLjBqIPjnOPM0
         OsmJkHx2n/DN6ulvC0S+7yr2OzBJujILEPBvnMv+uuKlZnL1yLmn2bvTepTXoQIXeB54
         tHYg==
X-Forwarded-Encrypted: i=1; AJvYcCW2AER8nNqiLYh6VJWfgFCzEzkHW+BDvR4Qni01wJjOJnMKxlkUBjguevwYdtJZPHyZ6hv/IyqsFas=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzpm89+OG1zp/7OByVutp2YN0EJNO8dy6h2XwwvAEGD8DO3H+gf
	PWzg9hBjvNc8exPa0/1F7OKC5BrKXCKSxjv9JWYavzIqOsFg86uJvMrF2hmVG/NprvEo9/WN1P4
	duhGkDw==
X-Google-Smtp-Source: AGHT+IF4hZun5r4iwHw4wi7UHw++RSMCswGoNTaVTecrKef6+p9Uf82S7mvJQmU1u11vJDhesn1/wA==
X-Received: by 2002:a17:907:3f86:b0:a8d:6648:813f with SMTP id a640c23a62f3a-a991bd04dfemr37484066b.3.1727984299793;
        Thu, 03 Oct 2024 12:38:19 -0700 (PDT)
Message-ID: <2b42323a-961a-4dd8-8cde-f4b19eac0dc5@citrix.com>
Date: Thu, 3 Oct 2024 20:38:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] x86/fpu: Combine fpu_ctxt and xsave_area in
 arch_vcpu
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240813142119.29012-1-alejandro.vallejo@cloud.com>
 <20240813142119.29012-2-alejandro.vallejo@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240813142119.29012-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/08/2024 3:21 pm, Alejandro Vallejo wrote:
> @@ -299,44 +299,14 @@ void save_fpu_enable(void)
>  /* Initialize FPU's context save area */
>  int vcpu_init_fpu(struct vcpu *v)
>  {
> -    int rc;
> -
>      v->arch.fully_eager_fpu = opt_eager_fpu;
> -
> -    if ( (rc = xstate_alloc_save_area(v)) != 0 )
> -        return rc;
> -
> -    if ( v->arch.xsave_area )
> -        v->arch.fpu_ctxt = &v->arch.xsave_area->fpu_sse;
> -    else
> -    {
> -        BUILD_BUG_ON(__alignof(v->arch.xsave_area->fpu_sse) < 16);
> -        v->arch.fpu_ctxt = _xzalloc(sizeof(v->arch.xsave_area->fpu_sse),
> -                                    __alignof(v->arch.xsave_area->fpu_sse));
> -        if ( v->arch.fpu_ctxt )
> -        {
> -            fpusse_t *fpu_sse = v->arch.fpu_ctxt;
> -
> -            fpu_sse->fcw = FCW_DEFAULT;
> -            fpu_sse->mxcsr = MXCSR_DEFAULT;
> -        }
> -        else
> -            rc = -ENOMEM;

This looks wonky.  It's not, because xstate_alloc_save_area() contains
the same logic for setting up FCW/MXCSR.

It would be helpful to note this in the commit message.  Something about
deduplicating the setup alongside deduplicating the pointer.

> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index bca3258d69ac..3da60af2a44a 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -592,11 +592,11 @@ struct pv_vcpu
>  struct arch_vcpu
>  {
>      /*
> -     * guest context (mirroring struct vcpu_guest_context) common
> -     * between pv and hvm guests
> +     * Guest context common between PV and HVM guests. Includes general purpose
> +     * registers, segment registers and other parts of the exception frame.
> +     *
> +     * It doesn't contain FPU state, as that lives in xsave_area instead.
>       */

This new comment isn't really correct either.  arch_vcpu contains the
PV/HVM union, so it not only things which are common between the two.

I'd either leave it alone, or delete it entirely.  It doesn't serve much
purpose IMO, and it is going to bitrot very quickly (FRED alone will
change two of the state groups you mention).

> -
> -    void              *fpu_ctxt;
>      struct cpu_user_regs user_regs;
>  
>      /* Debug registers. */
> diff --git a/xen/arch/x86/x86_emulate/blk.c b/xen/arch/x86/x86_emulate/blk.c
> index e790f4f90056..28b54f26fe29 100644
> --- a/xen/arch/x86/x86_emulate/blk.c
> +++ b/xen/arch/x86/x86_emulate/blk.c
> @@ -11,7 +11,8 @@
>      !defined(X86EMUL_NO_SIMD)
>  # ifdef __XEN__
>  #  include <asm/xstate.h>
> -#  define FXSAVE_AREA current->arch.fpu_ctxt
> +#  define FXSAVE_AREA ((struct x86_fxsr *) \
> +                           (void *)&current->arch.xsave_area->fpu_sse)

This isn't a like-for-like replacement.

Previously FXSAVE_AREA's type was void *.  I'd leave the expression as just

    (void *)&current->arch.xsave_area->fpu_sse

because struct x86_fxsr is not the only type needing to be used here in
due course.   (There are 8 variations of data layout for older
instructions.)

>  # else
>  #  define FXSAVE_AREA get_fpu_save_area()
>  # endif
> diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
> index 5c4144d55e89..850ee31bd18c 100644
> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -507,9 +507,16 @@ int xstate_alloc_save_area(struct vcpu *v)
>      unsigned int size;
>  
>      if ( !cpu_has_xsave )
> -        return 0;
> -
> -    if ( !is_idle_vcpu(v) || !cpu_has_xsavec )
> +    {
> +        /*
> +         * This is bigger than FXSAVE_SIZE by 64 bytes, but it helps treating
> +         * the FPU state uniformly as an XSAVE buffer even if XSAVE is not
> +         * available in the host. Note the alignment restriction of the XSAVE
> +         * area are stricter than those of the FXSAVE area.
> +         */

Can I suggest the following?

"On non-XSAVE systems, we allocate an XSTATE buffer for simplicity. 
XSTATE is backwards compatible to FXSAVE, and only one cacheline larger."

It's rather more concise.

~Andrew

