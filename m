Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8778DAA28
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 23:20:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735033.1141180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEF5c-0000xR-41; Mon, 03 Jun 2024 21:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735033.1141180; Mon, 03 Jun 2024 21:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEF5c-0000v4-0z; Mon, 03 Jun 2024 21:19:36 +0000
Received: by outflank-mailman (input) for mailman id 735033;
 Mon, 03 Jun 2024 21:19:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=29W0=NF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sEF5b-0000uy-2V
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 21:19:35 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f69242c2-21ee-11ef-b4bb-af5377834399;
 Mon, 03 Jun 2024 23:19:29 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-35dce6102f4so291637f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2024 14:19:29 -0700 (PDT)
Received: from [172.31.7.231] ([62.48.184.126])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd066d317sm9754719f8f.113.2024.06.03.14.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 14:19:28 -0700 (PDT)
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
X-Inumbo-ID: f69242c2-21ee-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717449569; x=1718054369; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6/fMCteIGurMwvJFr+zKaGcV1XwSTll/UXfxnP8XqWw=;
        b=CLbSgSvYveyMRFA+dpjM2Kq1GUYq7IEfEZHUiet7j64nLgQzE4JtObhcmckpmPRM0I
         jBfTr5WPERSibKW6zj8RsOe/9kbpI7ztwgcj+f9QejjkHxy6sCQlNkIP7tHxyvPFgWCV
         aeA4bmV1H9QfPRm+MPmvk0t68xYEm+mcySHtvWea0nt3/o4afY0sAud4wIbpHLcBP+KT
         ZSojJWZoa1oYnW5BV3F+Ms8XgVytLIkT7u0SIO4GPzL16yA5u+IB96BFpgRiGKQGeEPn
         Ejx3oHMaWW2h6Yyl0pVMzTW1EBUpcai8fr5CblDGeoxG/84B/je8GqAvCjOkZrJZDav4
         WkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717449569; x=1718054369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6/fMCteIGurMwvJFr+zKaGcV1XwSTll/UXfxnP8XqWw=;
        b=ch51W5Ja+2XrHrHmZEzJWesrWWq/2qB5Iuxdh/RUJSvAxS8tzMVxrrbde+XwVSdhwQ
         SMHtBKML9qsVmaWmV8E8GLB4+3JMNvjgau7no48Ip5B3IOCavyAQmhHZDy9gMrI80VMs
         xJnhUi78+pVXMCIpCElRqRhwpEXvfL5q4koV0qw+AkZbylp8efnHEEqVmu51DH3pbWL8
         RJT7MXP1/zIg2qX+rVDeSjKC3b0DUDP86aF2NOjJeHuiywWBTCnaYytRl/A+iWi3mePq
         RD9sOSfRD5TRktyY4eKwy3cXv08g0JO1ss+rdJhXlCj+x6Fh9uj2JQ/UMvM8sPfgiAWi
         qr6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIls/R6LAzBiGEnpmLFmsFyzo4CENHLYd7MJMX+f/XtHPrar7kVNn0HdzzTNgY9IIw0u7H7dqRnfskwhjzxh7gLdsUj/BoOpSjObxSEUs=
X-Gm-Message-State: AOJu0YwgmbnBP1t3ctVod4OrkjZw2e6Oub38izevCq+yjRHMdaEkiFbw
	7pZrI3RICo1q+ZoL7eZfUriOklbkYFhMDSUWQE/6Vehou5YZWgyKi0h449JlWg==
X-Google-Smtp-Source: AGHT+IEDqgWFVAEMzctxEZUAg27CKh0pRkwNNNqZwsIU0wE798z7Rt/yvl/9SoZB7+b3jtG+U2qXGA==
X-Received: by 2002:a5d:53c4:0:b0:355:75f:2876 with SMTP id ffacd0b85a97d-35e0f25a3c2mr6685235f8f.5.1717449569006;
        Mon, 03 Jun 2024 14:19:29 -0700 (PDT)
Message-ID: <c5951643-5172-4aa1-9833-1a7a0eebb540@suse.com>
Date: Mon, 3 Jun 2024 23:19:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: vcpumask_to_pcpumask() case study
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <3bb4e3fa-376b-4641-824d-61864b4e1e8e@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3bb4e3fa-376b-4641-824d-61864b4e1e8e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.06.2024 20:50, Andrew Cooper wrote:
> One of the followon items I had from the bitops clean-up is this:
> 
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 648d6dd475ba..9c3a017606ed 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -3425,7 +3425,7 @@ static int vcpumask_to_pcpumask(
>              unsigned int cpu;
>  
>              vcpu_id = ffsl(vmask) - 1;
> -            vmask &= ~(1UL << vcpu_id);
> +            vmask &= vmask - 1;
>              vcpu_id += vcpu_bias;
>              if ( (vcpu_id >= d->max_vcpus) )
>                  return 0;
> 
> which yields the following improvement:
> 
>   add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-34 (-34)
>   Function                                     old     new   delta
>   vcpumask_to_pcpumask                         519     485     -34

Nice. At the risk of getting flamed again for raising dumb questions:
Considering that elsewhere "trickery" like the &= mask - 1 here were
deemed not nice to have (at least wanting to be hidden behind a
suitably named macro; see e.g. ISOLATE_LSB()), wouldn't __clear_bit()
be suitable here too, and less at risk of being considered "trickery"?
But yes, that would eliminate the benefit of making the bit clearing
independent of the ffsl() result. And personally I'm fine anyway with
the form as suggested.

> While I (the programmer) can reason the two expressions are equivalent,
> the compiler can't,

Why is it you think it can't? There's no further knowledge that you
as a human need to rely on for this, afaics. If ffsl() uses the
built-in (as it now does), the compiler has full insight into what's
going on. It's just that compiler engineers may not deem it worth the
effort to carry out such a special-case optimization.

> so we really are saving a SHL to re-calculate (1 <<
> vcpu_id) and swapping it for a LEA -1(vmask) which happens to be hoisted
> above the ffsl() call.
> 
> However, the majority of the savings came from the fact that the old
> code used to hold 1 in %r15 (across the entire function!) so it could
> calculate (1 << vcpu_id) on each loop iteration.  With %r15 now free for
> other use, we one fewer thing spilt to the stack.
> 
> Anyway - while it goes to show that while/ffs logic should be extra
> careful to use x &= x - 1 for it's loop condition logic, that's not all.
> 
> The rest of this function is crazy.  We're reading a guest-word at a
> time in order to make a d->max_vcpus sized bitmap (with a reasonable
> amount of opencoded logic to reassemble the fragments back into a vcpu
> number).
> 
> PVH dom0 can reach here, and because it's not pv32, will be deemed to
> have a guest word size of 64.  Also, word-at-time for any HVM guest is
> an insane overhead in terms of the pagewalks behind the copy_from_hvm()
> infrastructure.
> 
> Instead, we should calculate the size of the bitmap at
> DIV_ROUND_UP(d->max_vcpus, 8), copy the bitmap in one whole go, and then
> just have a single for_each_set_bit() looping over it.  Importantly this
> avoids needing to know or care about the guest word size.
> 
> This removes 4 of the 6 hiding lfences; the pair for calculating
> is_native to start with, and then one of the two pairs behind the use of
> is_native to select the type of the access.
> 
> The only complications is this:  Right now, PV max vCPUS is 8k, so we
> could even get away with this being an on-stack bitmap.  However, the
> vast majority of PV guests small and a 64-bit bitmap would do fine.
> 
> But, given this is just one example, wouldn't it be better if we just
> unconditionally had a marshalling buffer for hypercalls?  There's the
> XLAT area but it doesn't exist PV64, and we've got various other pieces
> of scratch per-cpu data.
> 
> If not, having a 128/256-bit bitmap on the stack will still be good
> enough in practice, but still ok at amortising the PVH dom0 costs.
> 
> Thoughts?

Well, yes, the last of what you suggest might certainly be worthwhile
as a minimal improvement. The only slight concern with increasing the
granularity is that it'll be increasingly less likely that a 2nd or
further iterations of the loop would actually be exercised in routine
testing.

A marshalling buffer might also make sense to have, as long as we have
more than just one or two places wanting to use it. Since you say "just
one example", likely you have further uses in mind. In most other
places we use input data more directly, so it looks like I can't right
away come up with possible further use cases.

Jan

