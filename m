Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 311FD6A2325
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 21:29:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501566.773383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVegE-0003At-31; Fri, 24 Feb 2023 20:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501566.773383; Fri, 24 Feb 2023 20:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVegD-000380-WC; Fri, 24 Feb 2023 20:28:33 +0000
Received: by outflank-mailman (input) for mailman id 501566;
 Fri, 24 Feb 2023 20:28:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhFC=6U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVegC-00037u-Bf
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 20:28:32 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cce678f9-b481-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 21:28:30 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id f13so2012878edz.6
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 12:28:30 -0800 (PST)
Received: from [192.168.1.93] (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.gmail.com with ESMTPSA id
 kx20-20020a170907775400b008b17de96f00sm10325122ejc.151.2023.02.24.12.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 12:28:29 -0800 (PST)
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
X-Inumbo-ID: cce678f9-b481-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Xx88+lcqjIy+YjQrkkEWWwYNjNSBD7jbJc1YEwTWV0=;
        b=SIwuQsAie0pLFnzDwkpVj3wFh4+Bwn4MmqRYfBv66NUQhqXHygR/M3Rgh6C1uWaMO5
         Wy8K49h9yxqoVNRcIkQ0A5hPJrjgcrxAW3EqlkZ+kLcsn6L+OfOl7feKSeFa7SsOmDyP
         iSCCaGk1/pmzU8NsMqL9Dz1LQxTrzqXj+jHO7pM0LsksTzhS/kttottseW/gwcw2LTbu
         0y704b/TyN2+RHA6GQwHo4AFRtjTsAD9q6aKzSNXRByh9d1EGDIBuTZvXdaSrnM4eoMu
         kaS97Uhuqz5DSRfWLWT4Ci++qpnuz9byfdXBBAEhJPqI7FaWEHI+HW2wSf0b/zBpsAII
         9uiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Xx88+lcqjIy+YjQrkkEWWwYNjNSBD7jbJc1YEwTWV0=;
        b=dxS9Fm/aVue3bpyTF9bCWZ/c6/ggdxJx75dfzdvHUgq+hnIS++V2aN7ekeWqko39z3
         WgZCYH3MdR6bpRKSe1hVrBlQBAWBXNmXcor0jCb2zNBqQVQ5A38tHMmYs1uvwl9L7KZW
         vN0JM56NxhHIcm/ivqMaAWthUaEvNKwrCeg2UDMyV52CJP9DEfGxW+Rmv6HZlse1Vo7S
         5v0WCCEAU4d/VxGnmSQMVNIfqY8oKjs8fANS/F1+lBmsExwLsdkETB1hcnH3GkoccBf+
         6VtLniqmrNC0aDaEPUxa78vqAYabhQpYOASfJhzlQa6QDPYziJwq1kLagAZbQGli1cxx
         945A==
X-Gm-Message-State: AO0yUKVONqlUs7jPkYoxZ6qlCEHQuMTnr1ufkBQGZod6bjwwT3kYTXpq
	rtwI4/RmqeUniqKwoSP1g9Y=
X-Google-Smtp-Source: AK7set9ot7uAncmnY+NByDkDbtODRmTfdHvcm0diXQtK+SURg5bTz9GxGkPx+n3K1ZBwYMj8JWxReA==
X-Received: by 2002:a17:906:3a46:b0:8af:54d2:2088 with SMTP id a6-20020a1709063a4600b008af54d22088mr25272626ejf.37.1677270509521;
        Fri, 24 Feb 2023 12:28:29 -0800 (PST)
Message-ID: <e4262b99-fb13-f58c-d6a3-972fafa790bd@gmail.com>
Date: Fri, 24 Feb 2023 22:28:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 05/14] x86/svm: move nestedsvm declarations used only
 by svm code to private header
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <20230224185010.3692754-6-burzalodowa@gmail.com>
 <2c6f4132-9c75-767d-1b98-dca1527c2b58@citrix.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <2c6f4132-9c75-767d-1b98-dca1527c2b58@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/24/23 22:12, Andrew Cooper wrote:
> On 24/02/2023 6:50 pm, Xenia Ragiadakou wrote:
>> diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
>> new file mode 100644
>> index 0000000000..43245e13de
>> --- /dev/null
>> +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
>> @@ -0,0 +1,77 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * nestedsvm.h: Nested Virtualization
>> + *
>> + * Copyright (c) 2011, Advanced Micro Devices, Inc
>> + */
>> +
>> +#ifndef __X86_HVM_SVM_NESTEDHVM_PRIV_H__
>> +#define __X86_HVM_SVM_NESTEDHVM_PRIV_H__
>> +
>> +#include <xen/mm.h>
>> +#include <xen/types.h>
>> +
>> +#include <asm/hvm/vcpu.h>
>> +#include <asm/hvm/hvm.h>
>> +#include <asm/hvm/nestedhvm.h>
>> +#include <asm/msr-index.h>
>> +
>> +/* SVM specific intblk types, cannot be an enum because gcc 4.5 complains */
>> +/* GIF cleared */
>> +#define hvm_intblk_svm_gif      hvm_intblk_arch
> 
> I know you're just moving code, but I simply don't believe this comment.
> 
> This additional delta seems to compile fine:
> 
> diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
> index dbb0022190a8..111b10673cf4 100644
> --- a/xen/arch/x86/hvm/svm/intr.c
> +++ b/xen/arch/x86/hvm/svm/intr.c
> @@ -154,7 +154,7 @@ void svm_intr_assist(void)
>               return;
>   
>           intblk = hvm_interrupt_blocked(v, intack);
> -        if ( intblk == hvm_intblk_svm_gif )
> +        if ( intblk == hvm_intblk_arch ) /* GIF */
>           {
>               ASSERT(nestedhvm_enabled(v->domain));
>               return;
> diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h
> b/xen/arch/x86/hvm/svm/nestedhvm.h
> index 43245e13deb7..c7747daae24a 100644
> --- a/xen/arch/x86/hvm/svm/nestedhvm.h
> +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
> @@ -16,10 +16,6 @@
>   #include <asm/hvm/nestedhvm.h>
>   #include <asm/msr-index.h>
>   
> -/* SVM specific intblk types, cannot be an enum because gcc 4.5
> complains */
> -/* GIF cleared */
> -#define hvm_intblk_svm_gif      hvm_intblk_arch
> -
>   #define vcpu_nestedsvm(v) (vcpu_nestedhvm(v).u.nsvm)
>   
>   /* True when l1 guest enabled SVM in EFER */
> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c
> b/xen/arch/x86/hvm/svm/nestedsvm.c
> index 92316c6624ce..1794eb2105be 100644
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -1247,7 +1247,7 @@ enum hvm_intblk cf_check nsvm_intr_blocked(struct
> vcpu *v)
>       ASSERT(nestedhvm_enabled(v->domain));
>   
>       if ( !nestedsvm_gif_isset(v) )
> -        return hvm_intblk_svm_gif;
> +        return hvm_intblk_arch;
>   
>       if ( nestedhvm_vcpu_in_guestmode(v) )
>       {
> 
> 
> but the first hunk demonstrates an error in the original logic.
> Architecturally, GIF can become set for SKINIT, and in systems where SVM
> isn't available.
> 
> I'm unsure whether its better to fix this up in this patch, or defer it
> for later.

I think this change merits its own patch.

> 
>> +
>> +#define vcpu_nestedsvm(v) (vcpu_nestedhvm(v).u.nsvm)
>> +
>> +/* True when l1 guest enabled SVM in EFER */
>> +#define nsvm_efer_svm_enabled(v) \
>> +    (!!((v)->arch.hvm.guest_efer & EFER_SVME))
> 
> This seems to be the only use of asm/msr-index.h, and it's a macro so
> the header is actually unused.
> 
> I'd drop the include - its a very common header anyway.

Feel free to drop it. There was not in the other header. I have a 
tendency to include headers for everything.

> 
> ~Andrew

-- 
Xenia

