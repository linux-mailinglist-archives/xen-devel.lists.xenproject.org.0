Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E989D29AA
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 16:32:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840374.1256136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDQCe-0006rT-IA; Tue, 19 Nov 2024 15:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840374.1256136; Tue, 19 Nov 2024 15:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDQCe-0006oM-Ev; Tue, 19 Nov 2024 15:31:44 +0000
Received: by outflank-mailman (input) for mailman id 840374;
 Tue, 19 Nov 2024 15:31:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydLn=SO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tDQCd-0006me-C9
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 15:31:43 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d7ffdef-a68b-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 16:31:37 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2fb4af0b6beso49134071fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 07:31:37 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20dffbaf8sm667686666b.122.2024.11.19.07.31.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2024 07:31:36 -0800 (PST)
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
X-Inumbo-ID: 5d7ffdef-a68b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmYiLCJoZWxvIjoibWFpbC1sajEteDIyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjVkN2ZmZGVmLWE2OGItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDMwMjk3LjI2NjQwMywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732030296; x=1732635096; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HndC8XrotjRyo85dZwX65ZIQAKa8dPh8VRGWQEf/h4k=;
        b=acF1nePEsvBHUmU7+Oja6UPJee7hxrYSSTLQMXHPGbOeER+PNiK4emqUeC1JtS5EG8
         Of2GroZku8p8VhJYym+HHavTm/G0P0iYiEVXsI6ueVZotwyTtOzqvH+Dv+Fy+cd+pg6/
         FH9/Wguhym9MJvlCJ6hel2B4CtKKBHw3RAyv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732030296; x=1732635096;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HndC8XrotjRyo85dZwX65ZIQAKa8dPh8VRGWQEf/h4k=;
        b=QpEJ2rBzo9g2pea/jtqrE+OUgB+eGn33HrfuCCw64Pke9Abr5o59DRV3XLD3C8yE6b
         oGxpUra7ryADAcKQStcVARE7GvQTWy+aj2HwWy7lLSCFUC52lkL4KasTPQAkuJMZudF7
         yjTWDhxlnPJ+s99t1Q0fOee6am1ExMGgRGEuIL9vfTN8wJoyszR8nT13ePxmMFhnC++9
         gvROflWIgaBbciu6R+9EPCsxgkbYYqa8DABNsXsDNQ/vVSqb4Udpf7hdE9fJe0UxI4/7
         7q5n0XX5rb1M+0IS9PZ7PTRQiLTewBrrg1hg6sDOVu7SHHvFNfvXd3hlD7C61/4paUZz
         ZMaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWznt60Yx1qTZZdJ19y0jv5Jymr8JLn8W3y9ySF5ej9jcb4kZme+HsNl6Y7QPi5iXWkvdWy40E+MvA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoakruSNAMt8LYTqiT3bQXgiOTjofh4iCaHsZwdDODN5j27GYi
	9Y7mtOErwUOqBS4+oFmPobGSXZ11xawlZeF6BcJ4bv0nmRPne3YsYis+uzL6jxSYaSX+lMRR3il
	d
X-Google-Smtp-Source: AGHT+IEiSUxh0Pw+LQ9WbYbuC6ViU8OHDbgFGyQlPTaytzNeFKyJv2VGDiWe0h6iupgpCT1BLa/0ew==
X-Received: by 2002:a2e:be9e:0:b0:2ff:559e:c877 with SMTP id 38308e7fff4ca-2ff606f8091mr132085111fa.33.1732030296545;
        Tue, 19 Nov 2024 07:31:36 -0800 (PST)
Message-ID: <9cf6ea3e-b6b5-4fc8-a0f1-53c1b2f7ab31@citrix.com>
Date: Tue, 19 Nov 2024 15:31:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86/uaccess: rework user access speculative harden
 guards
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20241119103444.23296-1-roger.pau@citrix.com>
 <20241119103444.23296-4-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241119103444.23296-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/11/2024 10:34 am, Roger Pau Monne wrote:
> The current guards to select whether user accesses should be speculative
> hardened violate Misra rule 20.7, as the UA_KEEP() macro doesn't (and can't)
> parenthesize the 'args' argument.
>
> Change the logic so the guard is implemented inside the assembly block using
> the .if assembly directive.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> The guard check could be moved inside of the guest_access_mask_ptr macro, but
> given it's limited usages it's clearer to keep the check in the callers IMO.

Overall this is far more legible, and I'm tempted to take it on that
justification alone.  But this is Jan's pile of magic.

There is a weird effect from this change:

add/remove: 2/0 grow/shrink: 2/2 up/down: 740/-739 (1)
Function                                     old     new   delta
build_symbol_table                             -     686    +686
build_symbol_table.cold                        -      48     +48
pv_map_ldt_shadow_page                       641     644      +3
pv_emulate_gate_op                          2919    2922      +3
livepatch_op.cold                            557     509     -48
livepatch_op                                5952    5261    -691

which is clearly changing inlining decisions.  I suspect it's related to...

> diff --git a/xen/arch/x86/usercopy.c b/xen/arch/x86/usercopy.c
> index 7ab2009efe4c..d66beecc5507 100644
> --- a/xen/arch/x86/usercopy.c
> +++ b/xen/arch/x86/usercopy.c
> @@ -11,23 +11,23 @@
>  #include <asm/uaccess.h>
>  
>  #ifndef GUARD
> -# define GUARD UA_KEEP
> +# define GUARD 1
>  #endif
>  
>  unsigned int copy_to_guest_ll(void __user *to, const void *from, unsigned int n)
>  {
> -    GUARD(unsigned dummy);
> +    unsigned __maybe_unused dummy;

... this.  This doesn't need to be __maybe_unused, because ...

>  
>      stac();
>      asm volatile (
> -        GUARD(
> +        ".if " STR(GUARD) "\n"
>          "    guest_access_mask_ptr %[to], %q[scratch1], %q[scratch2]\n"
> -        )
> +        ".endif\n"
>          "1:  rep movsb\n"
>          "2:\n"
>          _ASM_EXTABLE(1b, 2b)
> -        : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from)
> -          GUARD(, [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy))
> +        : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from),
> +          [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy)

... these parameters are referenced unconditionally.

However, it does mean the compiler is spilling the scratch registers
even when guard is 0.  I expect this is what is affecting the inlining
decisions.

~Andrew

