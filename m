Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0818A7BE0E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 15:39:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938218.1339149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0hGl-0002iG-Qx; Fri, 04 Apr 2025 13:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938218.1339149; Fri, 04 Apr 2025 13:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0hGl-0002g1-NY; Fri, 04 Apr 2025 13:39:39 +0000
Received: by outflank-mailman (input) for mailman id 938218;
 Fri, 04 Apr 2025 13:39:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z71V=WW=edera.dev=alexander@srs-se1.protection.inumbo.net>)
 id 1u0hGk-0002fv-9g
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 13:39:38 +0000
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [2607:f8b0:4864:20::82f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d9f7b16-115a-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 15:39:33 +0200 (CEST)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-476b89782c3so21929301cf.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 06:39:33 -0700 (PDT)
Received: from localhost ([64.201.234.99]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4791aef3455sm22191591cf.0.2025.04.04.06.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 06:39:31 -0700 (PDT)
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
X-Inumbo-ID: 3d9f7b16-115a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.dev; s=google; t=1743773972; x=1744378772; darn=lists.xenproject.org;
        h=content-transfer-encoding:organization:message-id:references
         :in-reply-to:subject:cc:to:from:date:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QUCJwb9m9tu/I12JKrhIwcxMqFCd6xmTpVJfD7tqRDY=;
        b=YCWVz7xNYeWZJTuYR7+m/MXT1971yRjgVdXe90QVfvOSmRIzVPnTEvwsGGDnRwl6pL
         0LOCnixBDgz3Kr9ved7YUifqOzFjL7GpraVqrxnXGvOJWRItbjyx61mrCm/HYvv4HCv4
         knEzzIOssEanVkRV9o6j2yfnSeV7JmsS0akbHOb3RfcNLHCtUNHhyQFPSt1IZkukXy9p
         Wci/zkKfaJcyGh75YASmteGKZlaLGeHjANQbRZRlqYOcgA7q2588NpPGILVzev4VG9xX
         mrGbmRSwTsYgo4a0J5nCLfJho1R+MBDCt6YOIG1vxRVrvRKPwmfOrM1wy4GCAX+QIGO1
         i5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743773972; x=1744378772;
        h=content-transfer-encoding:organization:message-id:references
         :in-reply-to:subject:cc:to:from:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUCJwb9m9tu/I12JKrhIwcxMqFCd6xmTpVJfD7tqRDY=;
        b=GRBrn7bgMniKD/qI9LubcjXQUud1U8NXR4DFngJgNMQ9g2AX60P7f6V9RhX2euvIDt
         qrejQxDwXlfPW/00DBJJSTRgbQyMLBXsKgGLJTaTTw06db86vbmPzkueWPmM76U8snrx
         W7oUhxSZKEcnq6LVX5KSFcLYjgWeSxZgV7YrI/4adilmV+5zABLB4fWZw74fZLY7iRR7
         mOwZZxcnS3bRaKwDaue7U8fALgwwSAzmTsi29NQ1B3Vd49ef5c2cl8DZsn32PRo2CRqr
         dIpfQ88r8Wt6NQEwozVzwa3RFy6xRdTO2jErKkq/jNThQ7UVuW61y9qHqAEitjwFKJ66
         RvjQ==
X-Gm-Message-State: AOJu0YxIGuEiTc2yIZEvvYjCPTKl+y0He7qH+uyAz3wDTzfi36W3b3Ix
	oorNMGiIFhmqTOgwxlyUOcDT3Ia3F/n2SKc0PWXsb08VpyTpaDxa5fOcANbkpZE=
X-Gm-Gg: ASbGnctKnWmbn48SvNGFsNqg1OqymbSnfYdn1TsXfLypzOpRXjCVN5XxTxjdaCyKbQO
	Vv2TDJChppfr2sdm8kmLxnFCainddy4RQN1SfxPclxekAEniLVMQqaF5uO+2UOYyGyyz416OWtI
	cbIu7hQ/ux+hyOVhzAuLm6viIijtDIwpOvz5KgBwqilRuP84+dFpyp0GDnG6XAUOkSYXq9Nyvr5
	9elowPPzyNr1+7r7AXD8cYodtbIH1T1gtlQt4RCADmVm13qLLRj9h7lh1xi2mnNSeXi+ZyRpydU
	9Ms+e5jMftS97IOzNI9fvJIlSWFBxd7M9017xuB00VylNDXKSuwBXRln7+t7YmS6WuY=
X-Google-Smtp-Source: AGHT+IGXs1kC6jEltSQfpuNBmoTism/EM7BjBD2UI0CDNkmWauZN8F6oZnv5rBq6z8rQ3ktmhfaNmQ==
X-Received: by 2002:ac8:7d11:0:b0:476:8ee8:d8a1 with SMTP id d75a77b69052e-479249d584fmr44886621cf.45.1743773972159;
        Fri, 04 Apr 2025 06:39:32 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 04 Apr 2025 09:39:30 -0400
From: Alexander Merritt <alexander@edera.dev>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86: drop XSAVEOPT and CLWB build flags
In-Reply-To: <9870999d-3a45-4c2b-a37b-2651e4d53c3b@citrix.com>
References: <3de09e4e2a3320e0f314803e349fbe6520d04b12.1743719892.git.alexander@edera.dev>
 <c07ec835-3c69-4cf9-ba6a-39d6152393bf@citrix.com>
 <9870999d-3a45-4c2b-a37b-2651e4d53c3b@citrix.com>
Message-ID: <b8f4e43e93bac45204ff5fb43af3b589@edera.dev>
X-Sender: alexander@edera.dev
Organization: Edera
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-04-03 19:34, Andrew Cooper wrote:
> On 04/04/2025 12:28 am, Andrew Cooper wrote:
> Also, I forgot to write in the ticket, clflushopt wants similar
> treatment, even if there isn't an outward define for it.  I think the
> following two hunks should do:
> 
> ~Andrew
> 
> diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
> index 18748b2bc805..ef30ef546336 100644
> --- a/xen/arch/x86/flushtlb.c
> +++ b/xen/arch/x86/flushtlb.c
> @@ -287,7 +287,7 @@ void cache_flush(const void *addr, unsigned int 
> size)
>           * of letting the alternative framework fill the gap by
> appending nops.
>           */
>          alternative_io("ds; clflush %[p]",
> -                       "data16 clflush %[p]", /* clflushopt */
> +                       "clflushopt %[p]",

Agree on these changes. However, I see branch staging uses 
alternative_input and the below /* no outputs */ does not exist.

>                         X86_FEATURE_CLFLUSHOPT,
>                         /* no outputs */,
>                         [p] "m" (*(const char *)(addr)));
> diff --git a/xen/arch/x86/include/asm/system.h
> b/xen/arch/x86/include/asm/system.h
> index 73cb16ca68d6..6f5b6d502911 100644
> --- a/xen/arch/x86/include/asm/system.h
> +++ b/xen/arch/x86/include/asm/system.h
> @@ -23,7 +23,7 @@ static inline void clflush(const void *p)
>  
>  static inline void clflushopt(const void *p)
>  {
> -    asm volatile ( "data16 clflush %0" :: "m" (*(const char *)p) );
> +    asm volatile ( "clflushopt %0" :: "m" (*(const char *)p) );
>  }
>  
>  static inline void clwb(const void *p)

