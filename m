Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFFB97BD76
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 15:57:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800301.1210240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqvB1-0004h9-Ma; Wed, 18 Sep 2024 13:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800301.1210240; Wed, 18 Sep 2024 13:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqvB1-0004ea-JL; Wed, 18 Sep 2024 13:57:03 +0000
Received: by outflank-mailman (input) for mailman id 800301;
 Wed, 18 Sep 2024 13:57:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yEL5=QQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sqvAz-0004eU-Vu
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 13:57:02 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dffa9ae0-75c5-11ef-99a2-01e77a169b0f;
 Wed, 18 Sep 2024 15:56:59 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52f01b8738dso4945189e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Sep 2024 06:56:59 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90613205b8sm589326366b.188.2024.09.18.06.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 06:56:58 -0700 (PDT)
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
X-Inumbo-ID: dffa9ae0-75c5-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726667819; x=1727272619; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ByS2rmIsnIiiOsd+rX30QsTSW5syalpi7kfsTzqZ2Xs=;
        b=XUiuVPPXTblSmWai4Ad4JYs/YSKfPnwa+Kz4C05P4eX7TKG4DYzbl6GeeRX5hktB8u
         5tgDTRdDFi3XsHFyx4FqpPeh/n8DVjt/NHU+mN1IsA6DdA+2Ri0+yKQh2MSSRXo7PVz9
         X73loSxt4I8gbWVTjwBez6HZe+f6yKJN6VrOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726667819; x=1727272619;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ByS2rmIsnIiiOsd+rX30QsTSW5syalpi7kfsTzqZ2Xs=;
        b=sSqFFqyS3xlNlkXbjHA0O96A6nMcfRZE3NGCGfNO1LiZJX814ocNcjAUJ7YM9FLoEx
         Kr1YF7z9liQIH9TcdbDLPvAdoq3Xi1Mn0lRa9JGaeAw3evRFSWwBN96rZKEkl6TIOtl9
         CZ4tIlL/7CQmcUYkRWWL/hwCJOsZXTWBKVpP5NwWl6stX4PVOYrR2hC3CuqP2NbaYew8
         /mY2dmu2x240evXcztlhaSs5cMFTRj/Gx3ZeLPQUo7ty4esYGX8R5ys2DpQL4W9/kvkO
         NpZgvQgOwgSOIgydLsaD4SRl9HOj1M+a5LbHyD+3o+1P5E26ERLQ/1+2CgECXyfuCZJR
         YL5g==
X-Forwarded-Encrypted: i=1; AJvYcCXwjU9gr4B4eSy81xJ5AepyEHiM1h63KvqeqdTBNjCoFMG9GHu4jz9ki/KGf4w+L4D6fav7nEMoLcw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8f808QPbc25GlP54ndjwnZ/gFbUa824VdTxh0DXLhOkacA1Xo
	Rf4xn7EeVrdylOSHEUkR3324PSEZCGpNijA6uaCzvlkI5FVvUQS/MDJcaqSY3Cc=
X-Google-Smtp-Source: AGHT+IGLwbS07qX6S5kcXwigy4lbCjoHSIKrX/fj2qMO2WEQB3JuBKLqMRPCgewUulQlrKno3IX8sA==
X-Received: by 2002:a05:6512:ba8:b0:530:ae4a:58d0 with SMTP id 2adb3069b0e04-53678fb1d2bmr12455463e87.8.1726667818863;
        Wed, 18 Sep 2024 06:56:58 -0700 (PDT)
Date: Wed, 18 Sep 2024 15:56:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] x86/hvm: make ACPI PM timer support optional
Message-ID: <ZurcKdyfG6qh-Btq@macbook.local>
References: <20240916063757.990070-1-Sergiy_Kibrik@epam.com>
 <Zufh7DOSCwzhrpZG@macbook.local>
 <alpine.DEB.2.22.394.2409161252380.1417852@ubuntu-linux-20-04-desktop>
 <614611f1-dfbe-4185-8f0a-dc89aa7f5a20@epam.com>
 <ZuqgTKqaUDWC_I-u@macbook.local>
 <27d717f7-3073-4139-bef0-05d1a39f1e6c@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27d717f7-3073-4139-bef0-05d1a39f1e6c@epam.com>

On Wed, Sep 18, 2024 at 04:35:21PM +0300, Sergiy Kibrik wrote:
> 18.09.24 12:41, Roger Pau Monné:
> > On Wed, Sep 18, 2024 at 12:29:39PM +0300, Sergiy Kibrik wrote:
> > > 16.09.24 22:57, Stefano Stabellini:
> > > > On Mon, 16 Sep 2024, Roger Pau Monné wrote:
> > > > > On Mon, Sep 16, 2024 at 09:37:57AM +0300, Sergiy Kibrik wrote:
> > > > > > Introduce config option X86_PMTIMER so that pmtimer driver can be disabled on
> > > > > > systems that don't need it.
> > > > > 
> > > > > Same comment as in the VGA patch, you need to handle the user passing
> > > > > X86_EMU_PM.  It's not OK to just ignore the flag if the hypervisor is
> > > > > built without ACPI PM timer support.
> > > > 
> > > > I also think that the flag should not be ignored. I think that Xen
> > > > should return error if a user is passing a domain feature not supported
> > > > by a particular version of the Xen build. I don't think that libxl needs
> > > > to be changed as part of this patch necessarily.
> > > 
> > > It looks like toolstack always leaves X86_EMU_PM bit enabled, so that part
> > > may also require changes.
> > 
> > I think you will be unable to create HVM guests, but that's kind of
> > expected if ACPI PM emulation is removed from the hypervisor (it won't
> > be an HVM guest anymore if it doesn't have ACPI PM).
> > 
> > PVH guest don't set X86_EMU_PM so you should be able to create those
> > fine.
> > 
> 
> would the check like this be enough?:
> 
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -758,6 +758,9 @@ static bool emulation_flags_ok(const struct domain *d,
> uint32_t emflags)
>               (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
>               emflags != X86_EMU_LAPIC )
>              return false;
> +        if ( !is_hardware_domain(d) &&

I don't think you need to gate this to the hardware domain?  IOW: if
it's build time disabled, it's not available for the hardware domain
either.

Seeing as there are several options you want to disable at build time, it
might be best to keep a mask, something like:

const uint32_t disabled_mask =
    (!IS_ENABLED(CONFIG_X86_PMTIMER) ? X86_EMU_PM  : 0) |
    (!IS_ENABLED(CONFIG_X86_STDVGA)  ? X86_EMU_VGA : 0);

And then:

if ( emflags & disabled_mask )
    return false;

You also want to adjust the has_foo() macros to short-circuit them:

#define has_vpm(d)         (IS_ENABLED(CONFIG_X86_PMTIMER) &&
                            !!((d)->arch.emulation_flags & X86_EMU_PM))

Also all those Kconfig options likely want to be inside of a separate
Kconfig section, rather than mixed with the rest of generic x86 arch
options.  It would nice to have all the options grouped inside of a
"Emulated device support" sub section or similar.

Thanks, Roger.

