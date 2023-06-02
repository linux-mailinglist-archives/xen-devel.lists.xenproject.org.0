Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 837DE7206D9
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 18:08:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543200.847963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q57KH-0005fH-GF; Fri, 02 Jun 2023 16:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543200.847963; Fri, 02 Jun 2023 16:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q57KH-0005by-DK; Fri, 02 Jun 2023 16:08:29 +0000
Received: by outflank-mailman (input) for mailman id 543200;
 Fri, 02 Jun 2023 16:08:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AB5B=BW=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q57KF-0005bs-T2
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 16:08:27 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4b17a11-015f-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 18:08:26 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3094910b150so2294373f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Jun 2023 09:08:26 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c4-20020a5d4144000000b0030ade1b9400sm2072671wrq.30.2023.06.02.09.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 09:08:25 -0700 (PDT)
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
X-Inumbo-ID: b4b17a11-015f-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685722105; x=1688314105;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UfFjQCoLLL8uV8X4fRXN/AhOmA7BAizI7I8Ds3Z3wiE=;
        b=kLfqe6GWyh1Ez/mFzI3v6aKD4W6PlI2j7TfT0jXdfJvDKSTCtrvUKI24b+hQBZiJzP
         TzcDNf/qZeo7ygBlierINi8YYKFzRy/lDKj7B0mLizZON28ISGVDLZc7ombrDo2n1FP+
         lnUChRJhrp5qZInnk9GX27rNdwumSS3heqDp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722105; x=1688314105;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UfFjQCoLLL8uV8X4fRXN/AhOmA7BAizI7I8Ds3Z3wiE=;
        b=cybJ0LlxIlSiJZZDf3n/uj9Jncmol26WrJW0LADdEiEj6z2NL3dkzfEhA7CgpeKX90
         J+GoLNXhH5g8fP5yR2Q6C+ddt8lHXHO5p0IPmXl/pafZyv3Z/li6jDFc2rxLsfPFxPsI
         qRLkvsD94y27ke9GVJrgrE4gTMDwLOcIfOEm8lfyznvd1sNCLmGSGsb1uLCO6iJcnocP
         5QiKskj5upqLBOE6PJpap8hAAVcohvnwUBaJCjdoK5KPCoAwizK6xodhe8if2q91h/sn
         cAPDtc3EIS3fPpSh94D2/JtY2c89jffLoeW4tchHUivjjpi/JC0JkWFhha1ni0alyyP2
         WyPw==
X-Gm-Message-State: AC+VfDyB6URCuZ4m3WwHEdPoAn+OTfTj9QL8Y4GfiM+IhgyDzx2a9kGe
	9GZND2RK6vT+hTy8SnHQohWCGw==
X-Google-Smtp-Source: ACHHUZ6JQacKMqqybsokzg9SPZ6JmvsLxKnIZgLC3MN04KFCXQkz9Tg5/XircJk9UjfyzxSfMvA8vg==
X-Received: by 2002:a5d:608a:0:b0:309:4999:7549 with SMTP id w10-20020a5d608a000000b0030949997549mr340806wrt.46.1685722105606;
        Fri, 02 Jun 2023 09:08:25 -0700 (PDT)
Message-ID: <647a13f9.5d0a0220.d924.94bb@mx.google.com>
X-Google-Original-Message-ID: <ZHoT99vIOchvPDoq@EMEAENGAAD19049.>
Date: Fri, 2 Jun 2023 17:08:23 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: Add Kconfig option to require NX bit support
References: <20230601174327.11401-1-alejandro.vallejo@cloud.com>
 <55945272-58d8-3dd3-19a4-0dea9be1db6d@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55945272-58d8-3dd3-19a4-0dea9be1db6d@citrix.com>

On Fri, Jun 02, 2023 at 03:22:20PM +0100, Andrew Cooper wrote:
> On 01/06/2023 6:43 pm, Alejandro Vallejo wrote:
> > diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> > index 09bebf8635..8414266281 100644
> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -647,11 +653,18 @@ trampoline_setup:
> >          cpuid
> >  1:      mov     %edx, CPUINFO_FEATURE_OFFSET(X86_FEATURE_LM) + sym_esi(boot_cpu_data)
> >  
> > -        /* Check for NX. Adjust EFER setting if available. */
> > +        /*
> > +         * Check for NX:
> > +         *   - If Xen was compiled requiring it simply assert it's
> > +         *     supported. The trampoline already has the right constant.
> > +         *   - Otherwise, update the trampoline EFER mask accordingly.
> > +         */
> >          bt      $cpufeat_bit(X86_FEATURE_NX), %edx
> > -        jnc     1f
> > +        jnc     no_nx_bit
> > +#if !IS_ENABLED(CONFIG_REQUIRE_NX_BIT)
> >          orb     $EFER_NXE >> 8, 1 + sym_esi(trampoline_efer)
> > -1:
> > +no_nx_bit:
> > +#endif
> 
> It occurs to me...  This will prevent Xen booting in firmware
> configurations where XD-Disable is active, despite Xen having
> unconditional logic to turn XD off later in boot.
In practice setting/clearing that bit was done through a BIOS configuration
knob AFAIR, so I wouldn't be too worried about forcing it open.

> 
> Linux deals with this in verify_cpu() (early asm) along with a FMS check
> protecting the access to MSR_MISC_ENABLE, rather than using rdmsr_safe()
> and catching the #GP.
> 
On a related note, we don't use rdmsr_safe() either. We just hope it exists
on any Intel CPU. It fortunately does on any Intel CPU we care about
because it was introduced shortly before Pentium 4 (Netburst), so we're
fine since we mandate long mode.

> 
> In terms of which CPUs are a problem, we almost got very lucky.  NX is
> part of the AMD64 spec, and all AMD, VIA, Centaur and Intel Atoms have
> this property.  64bit and XD were both added midway through the Pentium
> 4 era, and appear in the Prescott E0 stepping.
> 
> However, it appears that the prior stepping, D0, had 64bit but was only
> unlocked for certain OEMs.  (At the time, Intel were still trying to
> push Itaniaum as the future, and were trying hard not to go the x86_64
> route.)
> 
> Specifically,
> https://en.wikipedia.org/wiki/List_of_Intel_Xeon_processors_(NetBurst-based)#%22Nocona%22_(90_nm)
> is the suspected problem set.
> 
> 
> So, I think this does want to turn into a series, with the first patch
> moving the XD-disable logic into this path,
I agree. Will do.

> after which I think there is
> a strong case to be made for defaulting CONFIG_REQUIRE_NX to yes.
>  
> ~Andrew
A machine with long mode and no NX would be exceedingly rare, that's
for sure.

Alejandro

