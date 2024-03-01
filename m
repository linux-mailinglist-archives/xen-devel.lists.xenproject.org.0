Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70DB86E200
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 14:30:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687678.1071383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg2wU-0001Nx-O8; Fri, 01 Mar 2024 13:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687678.1071383; Fri, 01 Mar 2024 13:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg2wU-0001LI-L4; Fri, 01 Mar 2024 13:28:50 +0000
Received: by outflank-mailman (input) for mailman id 687678;
 Fri, 01 Mar 2024 13:28:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jGsc=KH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rg2wT-0001L9-Jy
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 13:28:49 +0000
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [2607:f8b0:4864:20::c2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1c407c4-d7cf-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 14:28:47 +0100 (CET)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5a034c12090so921844eaf.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 05:28:47 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 mv1-20020a056214338100b0068f75622543sm1877943qvb.1.2024.03.01.05.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 05:28:45 -0800 (PST)
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
X-Inumbo-ID: a1c407c4-d7cf-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709299726; x=1709904526; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A03dm6nNY7eguplmpwqBpNN2ulIpbycVGOPdL5ZF9uU=;
        b=Z+I6nQBN9AqSmsTvNbsuFeEHdXxc3bYlJWSkFm0Rye07taIImOjK8pWSzU9RUHDWuU
         Y9YZm3pvsl8fcjW1n+e2p4eyxwkxQKdpfclrj5Nlmd1xlrDSZQKkzStyOnBmMbk1v6W9
         qg5Wqy5Hu+5ZPn4xBni8b+6MG0u+ZU9o1Q1Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709299726; x=1709904526;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A03dm6nNY7eguplmpwqBpNN2ulIpbycVGOPdL5ZF9uU=;
        b=r9mROtrgrVJdMzW/JTT6b4XfBy/yTIXOTLKBCfCk8G3h+OokZj7oVKHp7+DjmFGmqZ
         y4vCwEWhfkO/E0zozPlrGItKxrBa6SbGvoKmtce5VCLZIp66kP75p0GWLuz63rEVMrS6
         SVUbd0AH+kq4wKzC1lYzMTfvA/P9fD2+FgcTYH6zlHuMZPtQ2qBqhUjNn6UR9nh4zyqr
         RHBm5Kez9d1UnlYMdstSxZ2nqAFxlf6s4IKmpM1/hWjJlI3+xfdCZzFls3U0wV579ycf
         0cpUi0Aca0dkPz3j+N2przSVqvBCcUHDN8CvLgs12Xo/EW7yBkdsKWXptQ1fqxWe6sEv
         ItgQ==
X-Gm-Message-State: AOJu0YzYatCI499Tor4Pl6Br3JzlCnYC81HAV1AjqnJqbRtdSuUeka82
	wFgJhuRfIpS6Blzdd0PKjKLbrfsTdOgg6m2qWhTiadL7HaUbWwUP23I9M/tHNpY=
X-Google-Smtp-Source: AGHT+IFzbaVo0LGe3+msSomjCXjzIecARtGfCHKana3I4648ugUQ8gyUELuu8onfODMiF2ID38NrUQ==
X-Received: by 2002:a05:6358:c88:b0:178:99cc:e52e with SMTP id o8-20020a0563580c8800b0017899cce52emr1583286rwj.20.1709299725767;
        Fri, 01 Mar 2024 05:28:45 -0800 (PST)
Date: Fri, 1 Mar 2024 14:28:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/cpu-policy: Allow for levelling of VERW side effects
Message-ID: <ZeHYCzDGAsbVmSLY@macbook>
References: <20240229181354.2560819-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240229181354.2560819-1-andrew.cooper3@citrix.com>

On Thu, Feb 29, 2024 at 06:13:54PM +0000, Andrew Cooper wrote:
> MD_CLEAR and FB_CLEAR need OR-ing across a migrate pool.  Allow this, by
> having them unconditinally set in max, with the host values reflected in
> default.  Annotate the bits as having special properies.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  xen/arch/x86/cpu-policy.c                   | 24 +++++++++++++++++++++
>  xen/include/public/arch-x86/cpufeatureset.h |  4 ++--
>  2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
> index f3ed2d3a3227..41123e6cf778 100644
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -442,6 +442,16 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
>          __set_bit(X86_FEATURE_RSBA, fs);
>          __set_bit(X86_FEATURE_RRSBA, fs);
>  
> +        /*
> +         * These bits indicate that the VERW instruction may have gained
> +         * scrubbing side effects.  With pooling, they mean "you might migrate
> +         * somewhere where scrubbing is necessary", and may need exposing on
> +         * unaffected hardware.  This is fine, because the VERW instruction
> +         * has been around since the 286.
> +         */
> +        __set_bit(X86_FEATURE_MD_CLEAR, fs);
> +        __set_bit(X86_FEATURE_FB_CLEAR, fs);
> +
>          /*
>           * The Gather Data Sampling microcode mitigation (August 2023) has an
>           * adverse performance impact on the CLWB instruction on SKX/CLX/CPX.
> @@ -476,6 +486,20 @@ static void __init guest_common_default_feature_adjustments(uint32_t *fs)
>               cpu_has_rdrand && !is_forced_cpu_cap(X86_FEATURE_RDRAND) )
>              __clear_bit(X86_FEATURE_RDRAND, fs);
>  
> +        /*
> +         * These bits indicate that the VERW instruction may have gained
> +         * scrubbing side effects.  The max policy has them set for migration
> +         * reasons, so reset the default policy back to the host values in
> +         * case we're unaffected.
> +         */
> +        fs[FEATURESET_7d0]   &= ~cpufeat_mask(X86_FEATURE_MD_CLEAR);
> +        fs[FEATURESET_m10Al] &= ~cpufeat_mask(X86_FEATURE_FB_CLEAR);
> +
> +        fs[FEATURESET_7d0]   |= (boot_cpu_data.x86_capability[FEATURESET_7d0] &
> +                                 cpufeat_mask(X86_FEATURE_MD_CLEAR));
> +        fs[FEATURESET_m10Al] |= (boot_cpu_data.x86_capability[FEATURESET_m10Al] &
> +                                 cpufeat_mask(X86_FEATURE_FB_CLEAR));

This seems quite convoluted, why not use:

__clear_bit(X86_FEATURE_MD_CLEAR, fs);
if ( boot_cpu_has(X86_FEATURE_MD_CLEAR) )
    __set_bit(X86_FEATURE_MD_CLEAR, fs);

And the same for FB_CLEAR. I think that's quite easier to read.

Thanks, Roger.

