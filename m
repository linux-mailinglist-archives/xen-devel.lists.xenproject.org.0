Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0882A86E10F
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 13:31:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687643.1071354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg21w-0000rV-Tu; Fri, 01 Mar 2024 12:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687643.1071354; Fri, 01 Mar 2024 12:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg21w-0000p1-Qf; Fri, 01 Mar 2024 12:30:24 +0000
Received: by outflank-mailman (input) for mailman id 687643;
 Fri, 01 Mar 2024 12:30:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jGsc=KH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rg21u-0000nY-Qb
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 12:30:22 +0000
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [2001:4860:4864:20::35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78324372-d7c7-11ee-afd8-a90da7624cb6;
 Fri, 01 Mar 2024 13:30:21 +0100 (CET)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-21fb368b468so1098001fac.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 04:30:21 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 u24-20020ae9c018000000b00787f695c487sm1585815qkk.98.2024.03.01.04.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 04:30:20 -0800 (PST)
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
X-Inumbo-ID: 78324372-d7c7-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709296220; x=1709901020; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tZVfWNlAzvtMlMR2wkPKMnV6YlIBnJz6r+E+seKQxfY=;
        b=rZvHDExp2YEP9syCPEbt0Zaq/7iFTgqvrhcXfUoSwtw/MLov7wF2dd2qgoWkFHvbvl
         IYZ2JQ16y/pxwXEPg17meKhuR8Z8Wui1Nrpcxy53paDCTt1CNqGSlM1m72GlaG1MfvXR
         38B36CH4tDg5XqJFIJsehmtjyrTqjSJsZod30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709296220; x=1709901020;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZVfWNlAzvtMlMR2wkPKMnV6YlIBnJz6r+E+seKQxfY=;
        b=p964xsmLQcYRsLnbS6RyvcVDGxQAHzhjhKE6G1yAAHEvt2lAeVl6S2UVCkJQJt+c2i
         TGfdgWE5ZuEyv0vYGNhA+YYynnb58WJryCFYwGsiWRnWbYTem/llCavNziRXOVXAvwBc
         GhVIkPQYuzKG21I7Eq51b6ADEluHh4+J4R3jKGznAuvW7dGckpLvTlfB021xPRXxeyIw
         +fs5R9G1fChGSlzcgdj4a9lmeDspOu7YWDsU5Gm6mgUi3k+w4K9oY3rWZZBdOKFdBnwU
         vtS0iwaOW8xNk2/dfkyHeuRvSeWbz762ANaJbIsWLAjW/OB/rjbEa4a1dm0VS8I8vOUJ
         kA4w==
X-Gm-Message-State: AOJu0YwzNdse9kb7LSHHebvnoHliIL9Q0ZIn/I2NDU/lmWmjRE59Md5i
	A/dSbVVJ9NQTsRNRM2ZwCIlbpbTd1UDsL94G82cnUxWA90/U1N/kHFX2DMj9wp4=
X-Google-Smtp-Source: AGHT+IHk3GK72xn0yqiIm6Gw3CUJbIFzEMbKbcbYnEfJwTeTnOSGGJA+3p5HmyJP/1ISem5RyT5DGQ==
X-Received: by 2002:a05:6870:9d05:b0:21f:412a:87a8 with SMTP id pp5-20020a0568709d0500b0021f412a87a8mr1448430oab.41.1709296220532;
        Fri, 01 Mar 2024 04:30:20 -0800 (PST)
Date: Fri, 1 Mar 2024 13:30:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/cpu-policy: Fix visibility of HTT/CMP_LEGACY in max
 policies
Message-ID: <ZeHKWiHvsw_yMT0Y@macbook>
References: <20240301112829.2657865-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240301112829.2657865-1-andrew.cooper3@citrix.com>

On Fri, Mar 01, 2024 at 11:28:29AM +0000, Andrew Cooper wrote:
> The block in recalculate_cpuid_policy() predates the proper split between
> default and max policies, and was a "slightly max for a toolstack which knows
> about it" capability.  It didn't get transformed properly in Xen 4.14.
> 
> Because Xen will accept a VM with HTT/CMP_LEGACY seen, they should be visible
> in the max polices.  Keep the default policy matching host settings.
> 
> This manifested as an incorrectly-rejected migration across XenServer's Xen
> 4.13 -> 4.17 upgrade, as Xapi is slowly growing the logic to check a VM
> against the target max policy.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I have one question below.

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  xen/arch/x86/cpu-policy.c | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
> index c9b32bc17849..4f558e502e01 100644
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -464,6 +464,16 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
>               raw_cpu_policy.feat.clwb )
>              __set_bit(X86_FEATURE_CLWB, fs);
>      }
> +
> +    /*
> +     * Topology information inside the guest is entirely at the toolstack's
> +     * disgression, and bears no relationship to the host we're running on.
> +     *
> +     * HTT identifies p->basic.lppp as valid
> +     * CMP_LEGACY identifies p->extd.nc as valid
> +     */
> +    __set_bit(X86_FEATURE_HTT, fs);
> +    __set_bit(X86_FEATURE_CMP_LEGACY, fs);
>  }
>  
>  static void __init guest_common_default_feature_adjustments(uint32_t *fs)
> @@ -514,6 +524,18 @@ static void __init guest_common_default_feature_adjustments(uint32_t *fs)
>              __clear_bit(X86_FEATURE_CLWB, fs);
>      }
>  
> +    /*
> +     * Topology information is at the toolstack's discretion so these are
> +     * unconditionally set in max, but pick a default which matches the host.
> +     */
> +    __clear_bit(X86_FEATURE_HTT, fs);
> +    if ( cpu_has_htt )
> +        __set_bit(X86_FEATURE_HTT, fs);
> +
> +    __clear_bit(X86_FEATURE_CMP_LEGACY, fs);
> +    if ( cpu_has_cmp_legacy )
> +        __set_bit(X86_FEATURE_CMP_LEGACY, fs);

Not that I oppose to it, but does it make sense to expose this options
to PV guests by default?  Those guests don't really have an APIC ID,
and I think we don't expect any of the topology information to be
usable by them in the first place.

Thanks, Roger.

