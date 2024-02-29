Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB7986C8A8
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 12:56:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686961.1069618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rff1p-0004LS-AA; Thu, 29 Feb 2024 11:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686961.1069618; Thu, 29 Feb 2024 11:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rff1p-0004Iu-7U; Thu, 29 Feb 2024 11:56:45 +0000
Received: by outflank-mailman (input) for mailman id 686961;
 Thu, 29 Feb 2024 11:56:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xh/y=KG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rff1o-0004Ik-Fe
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 11:56:44 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a4421ad-d6f9-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 12:56:42 +0100 (CET)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-787c900af02so59357785a.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 03:56:42 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 b6-20020a05620a04e600b00787f6064a9fsm584569qkh.108.2024.02.29.03.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 03:56:41 -0800 (PST)
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
X-Inumbo-ID: 9a4421ad-d6f9-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709207801; x=1709812601; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TJAuCfUOEyK5EMPgJRPdwSJV9B95LJ1m5JcD53wqlYU=;
        b=dHMaUIUIMaUMVng8RhKl4pK1mxGjWaQberU+r2PZFrzRg60av+nefFP6fByJY7RUzp
         to6WDxgDw5Kdny4AXqRr9ADjCIfUVZ2xP24/Gw2WLOuzfsPcNGBZlbbnAh5tGIRsasX/
         hyGMGM4KNJ4v32qyoEtwqCxUlDDa/8RWAGdFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709207801; x=1709812601;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJAuCfUOEyK5EMPgJRPdwSJV9B95LJ1m5JcD53wqlYU=;
        b=Voq1MVGddIOVrDpTSLVf82e9+deFribdJ84o4y7V+VdxIpTIg0ZK0hUuut9r/a0+nX
         6sKZEXgkf7VkfYJwpERh1afX6UHQwXLh/MlsUVp6rDrOVAUYvMoMcS1Ft/BiNSP2yVQd
         9JnnyYnrPvOMmqKVdfcOvH7gtrcw9sKNsBpNOXNZRqUTLhDMRQ3M03Va1SJdmZ2N6TE8
         pz0CfW9C5zCyfByuJz62kIvYJMMHdh+7gz54uJiDB7NcBWzVG5bhBptejqz/XUkumaf2
         9dK0/j4fw2/uv/VMRqRXjdiwG1D6YMSr2/Lhhy025+I2f/zwuWHkO81/lpOQF93be3u6
         HU6w==
X-Gm-Message-State: AOJu0YySboX1LgEfKtEmhShqSLnpoellqT5DlaDzw+WkacI5au8r3qjT
	TPpu1dKPGsJbEuLQuXaPHC0kUtdN/OZXCszpA4C5sXB2/6kI67RP70L3+aRv4UE=
X-Google-Smtp-Source: AGHT+IGs/GPmQQD0vqpZHE01EdVrRrPw/zKlleZ9A1O0xRrniiI8jDVkiE95nZsN42u73WUuAZ5kAg==
X-Received: by 2002:a05:620a:8f02:b0:787:fd85:26e8 with SMTP id rh2-20020a05620a8f0200b00787fd8526e8mr1233330qkn.19.1709207801349;
        Thu, 29 Feb 2024 03:56:41 -0800 (PST)
Date: Thu, 29 Feb 2024 12:56:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/cpu-policy: Fix x2APIC visibility for PV guests
Message-ID: <ZeBw96VzCVeF0-6T@macbook>
References: <20240229104304.2478614-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240229104304.2478614-1-andrew.cooper3@citrix.com>

On Thu, Feb 29, 2024 at 10:43:04AM +0000, Andrew Cooper wrote:
> Right now, the host x2APIC setting filters into the PV max and default
> policies, yet PV guests cannot set MSR_APIC_BASE.EXTD or access any of the
> x2APIC MSR range.  Therefore they absolutely shouldn't see the x2APIC bit.
> 
> Linux has workarounds for the collateral damage caused by this leakage; it
> unconditionally filters out the x2APIC CPUID bit, and EXTD when reading
> MSR_APIC_BASE.
> 
> Hide the x2APIC bit in the PV default policy, but for compatibility, tolerate
> incoming VMs which already saw the bit.  This is logic from before the
> default/max split in Xen 4.14 which wasn't correctly adjusted at the time.
> 
> Update the annotation from !A to !S which slightly better describes that it
> doesn't really exist in PV guests.  HVM guests, for which x2APIC can be
> emulated completely, already has it unconditionally set in the max policy.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> This wants backporting as far as people can tollerate, but it's really not
> obvious which commit in 4.14 should be referenced in a Fixes: tag.

Oh, so we didn't use to expose x2APIC in Xen < 4.14 for PV at all?

I think this need mentioning in the commit message, as it's not clear
whether x2APIC has always been advertised to guests.

If it's indeed only Xen 4.14 that started exposing the flag, it's IMO
less dangerous to stop exposing it.  My main concern would be OSes
having grow some dependency on it, and us no longer exposing it
causing collateral damage (which would be an OS bug anyway).

> ---
>  xen/arch/x86/cpu-policy.c                   | 19 +++++++++++++++++--
>  xen/include/public/arch-x86/cpufeatureset.h |  2 +-
>  2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
> index 10079c26ae24..a0205672428d 100644
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -534,6 +534,14 @@ static void __init calculate_pv_max_policy(void)
>      *p = host_cpu_policy;
>      x86_cpu_policy_to_featureset(p, fs);
>  
> +    /*
> +     * Xen at the time of writing (Feb 2024, 4.19 dev cycle) used to leak the
> +     * host x2APIC capability into PV guests, but never supported the guest
> +     * trying to turn x2APIC mode on.  Tolerate an incoming VM which saw the
> +     * x2APIC CPUID bit.
> +     */
> +    __set_bit(X86_FEATURE_X2APIC, fs);
> +
>      for ( i = 0; i < ARRAY_SIZE(fs); ++i )
>          fs[i] &= pv_max_featuremask[i];
>  
> @@ -566,6 +574,14 @@ static void __init calculate_pv_def_policy(void)
>      *p = pv_max_cpu_policy;
>      x86_cpu_policy_to_featureset(p, fs);
>  
> +    /*
> +     * PV guests have never been able to use x2APIC mode, but at the time of
> +     * writing (Feb 2024, 4.19 dev cycle), the host value used to leak into
> +     * guests.  Hide it by default so new guests don't get mislead into
> +     * thinking that they can use x2APIC.
> +     */
> +    __clear_bit(X86_FEATURE_X2APIC, fs);

IIRC if you use the 'S' tag it won't be added to the default PV policy
already, so there should be nothing to clear?  pv_def_featuremask
shouldn't contain the bit in the first place.

Thanks, Roger.

