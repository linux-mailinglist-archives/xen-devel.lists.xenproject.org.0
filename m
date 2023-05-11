Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBD36FF137
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 14:12:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533346.829924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px59a-0004MQ-VQ; Thu, 11 May 2023 12:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533346.829924; Thu, 11 May 2023 12:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px59a-0004KT-RL; Thu, 11 May 2023 12:12:14 +0000
Received: by outflank-mailman (input) for mailman id 533346;
 Thu, 11 May 2023 12:12:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lTi/=BA=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1px59Z-0004KN-4p
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 12:12:13 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f059b70-eff5-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 14:12:11 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-30796c0cbcaso4873433f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 May 2023 05:12:11 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b15-20020a5d4b8f000000b003064600cff9sm20246328wrt.38.2023.05.11.05.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 05:12:10 -0700 (PDT)
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
X-Inumbo-ID: 0f059b70-eff5-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683807131; x=1686399131;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/NWSIbhrrmlXYe0SJpj1AsNExE5w5gRba4Zpu3WmBr0=;
        b=Ele3Mb2b9rwR0sNGyvG98PyG31uRLSbFzSeBud1Q190+Cvk9Vl6SCGR+UNJ2jva8gi
         Eny6Q32uEShOYIJ+fNPgnOHmvxMCRApsUVZTDfbkQuiKd4+Y1ENBQDhL205evH8BF6rV
         EaGeJr5fPi+4NqolByUNIzfXZ2VZVM67G/QkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683807131; x=1686399131;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NWSIbhrrmlXYe0SJpj1AsNExE5w5gRba4Zpu3WmBr0=;
        b=Jkc/54wLZcXHcvlFRlt94n6o/r9WNsTURIDPq3j8wLjjMsdTXVnA+tZZ953gD6sTvu
         Vr063IO4WFNoO1XTsFykH0CWTxuE3f6MpWcW6GlyhzzXs609ynFth6ThpiGi2rsfzUPr
         l7D4EZoe0bjxAtUmbFpQLdkSVZomO29s0Zc4sacrqSLVkPMu+glOAO8mhXFbbk/Z/xiW
         ncOTnEATqDgty9y/0mJvthi4AeaCJT3oW4Y9JsES/Jlc04JKUu2wwu0SE6vwulAeCO9i
         Rgb7PZ8dWdaSfElgTPklqZfXC5EDA4OM8bKtWCt7WDK1H47GJUCCXazMet48niWQLaAV
         qk6g==
X-Gm-Message-State: AC+VfDzSaFDFItmLi5dBpyDxq7ONG/MwEjjSFNQUmcZCk0yFOkYiFQ/0
	HkDStadCPbIswPUl45CUb48aCQ==
X-Google-Smtp-Source: ACHHUZ5vjA8J7Wwdm9US3ZWu0WEVFts9gbi2QKs3SI1D0iRn4g9SCjOpKxutEH0iDvO9HEHGIx6Mdw==
X-Received: by 2002:adf:e483:0:b0:2cf:e517:c138 with SMTP id i3-20020adfe483000000b002cfe517c138mr14740013wrm.66.1683807131062;
        Thu, 11 May 2023 05:12:11 -0700 (PDT)
Message-ID: <645cdb9a.5d0a0220.d3a29.e895@mx.google.com>
X-Google-Original-Message-ID: <ZFzbl2urdhmGUXKD@EMEAENGAAD19049.>
Date: Thu, 11 May 2023 13:12:07 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/3] x86: Add support for CpuidUserDis
References: <20230509164336.12523-1-alejandro.vallejo@cloud.com>
 <20230509164336.12523-4-alejandro.vallejo@cloud.com>
 <1489425d-7627-30c6-bb0a-ca1145107f42@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1489425d-7627-30c6-bb0a-ca1145107f42@suse.com>

On Thu, May 11, 2023 at 01:05:42PM +0200, Jan Beulich wrote:
> > --- a/xen/arch/x86/cpu/amd.c
> > +++ b/xen/arch/x86/cpu/amd.c
> > @@ -279,8 +279,12 @@ static void __init noinline amd_init_levelling(void)
> >  	 * that can only be present when Xen is itself virtualized (because
> >  	 * it can be emulated)
> >  	 */
> > -	if (cpu_has_hypervisor && probe_cpuid_faulting())
> > +	if ((cpu_has_hypervisor && probe_cpuid_faulting()) ||
> > +	    boot_cpu_has(X86_FEATURE_CPUID_USER_DIS)) {
> 
> ... imo the probe_cpuid_faulting() call would better be avoided when
> the CPUID bit is set.

I wrote it like that originally. However, it felt wrong to leave
raw_policy.platform_info unset, as it's set inside probe_cpuid_faulting().
While it's highly unlikely a real AMD machine will have CPUID faulting
support, Xen might see both if it's itself virtualized under Xen.

The crux of the matter here is whether we want the raw policy to be an
accurate representation of _all_ the features of the machine (real or
virtual) or we're ok with it not having features we don't intend to use in
practice. It certainly can be argued either way. CpuidUserDis naturally
gets to the policy through CPUID leaf enumeration, so that's done
regardless.

My .02 is that raw means uncooked and as such should have the actual
physical features reported by the machine, but I could be persuaded either
way.

> 
> > +		expected_levelling_cap |= LCAP_faulting;
> > +		levelling_caps |=  LCAP_faulting;
> 
> Further the movement of these two lines from ...
> 
> > @@ -144,8 +145,6 @@ bool __init probe_cpuid_faulting(void)
> >  		return false;
> >  	}
> >  
> > -	expected_levelling_cap |= LCAP_faulting;
> > -	levelling_caps |=  LCAP_faulting;
> >  	setup_force_cpu_cap(X86_FEATURE_CPUID_FAULTING);
> 
> ... here (and also to intel.c) should imo be part of patch 2. While
> moving them, I think you also want to deal with the stray double
> blank.
> 
> Jan

Sure.

Alejandro

