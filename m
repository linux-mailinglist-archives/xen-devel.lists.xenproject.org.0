Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3146673A3C2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 16:55:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553651.864333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCLiF-0003De-3F; Thu, 22 Jun 2023 14:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553651.864333; Thu, 22 Jun 2023 14:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCLiF-0003B8-03; Thu, 22 Jun 2023 14:55:07 +0000
Received: by outflank-mailman (input) for mailman id 553651;
 Thu, 22 Jun 2023 14:55:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VOAB=CK=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qCLiD-0003Ac-Oh
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 14:55:05 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4b75eee-110c-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 16:55:03 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3113da5260dso4619898f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 07:55:03 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 x6-20020adff0c6000000b00307972e46fasm7176745wro.107.2023.06.22.07.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 07:55:02 -0700 (PDT)
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
X-Inumbo-ID: c4b75eee-110c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1687445703; x=1690037703;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W0PvRvJuXYYDOGVMKLYrWYciz2JzwrVh7OWM4cuePak=;
        b=b90pedEHaeD0yA2PV5GqBtD0KZxPO9lL3VmkBNxXUf/Sz3Kh5pRN4DMhuRffGcFHV+
         MsMEmf+G3iJjHD/5sr+gU3Cj4RzAIRMfPEHS6woOXNwkYku47EhDTm1F8ggx9I9xTmrs
         +YFehJ6kcJZxVLCsyBw1qR3w+aKrIzN2Dv9kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687445703; x=1690037703;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0PvRvJuXYYDOGVMKLYrWYciz2JzwrVh7OWM4cuePak=;
        b=cTl+pXvN0NlZdy7sX0PupEYMbz00oCs8khSVt7OLWce0nPP5Y7pBO73kQYLTWwXefq
         qXJjmTECTXNj/tiZA3c6H+36UhIMuqeUC91xcrvVPOSmb3NYRnKwxS1tL1PxzRYU/GJQ
         r7r6wi5l4/DpZS2Fj98gshXjAYoFSFzqbNS87ei09lcncgYg/Isfyvq8/sTAfd45CAEM
         CWxzDLpUs/XIXThqOIY0NrW+ryzD7vZ8gFQ+ELZOzB2zjciwZiCAboQ7zzC8grpAu5Bk
         XAHJ3U81dG9EK+UsGQvrIP8d8mizrLqTAp2eXiDjsPwD5DJzBrBHfxuSP+W38dZWFNba
         HUoA==
X-Gm-Message-State: AC+VfDyIR21/IWEvbnjqu+XM8+4LUsCYmwMoOuKttrpSFk5f91u2czG4
	GswBCrHPX5K3Ixb8JX6vdSR3/g==
X-Google-Smtp-Source: ACHHUZ52Xbys/ea53A8oHYEAW6vHsCK5Xtc2rSQN7xUZEv73RfvMFqmODJbkPr4/8eXAc11E6/q/uQ==
X-Received: by 2002:adf:ffc3:0:b0:30f:c3ec:e78f with SMTP id x3-20020adfffc3000000b0030fc3ece78fmr1898524wrs.21.1687445702949;
        Thu, 22 Jun 2023 07:55:02 -0700 (PDT)
Message-ID: <649460c6.df0a0220.f4bf6.4717@mx.google.com>
X-Google-Original-Message-ID: <ZJRgxD64ela7E7pL@EMEAENGAAD19049.>
Date: Thu, 22 Jun 2023 15:55:00 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 4/5] x86: Read MSR_ARCH_CAPS immediately after
 early_microcode_init()
References: <20230615154834.959-1-alejandro.vallejo@cloud.com>
 <20230615154834.959-5-alejandro.vallejo@cloud.com>
 <e0b2bd19-8b77-50f2-2759-065529b89c84@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0b2bd19-8b77-50f2-2759-065529b89c84@suse.com>

On Mon, Jun 19, 2023 at 05:57:14PM +0200, Jan Beulich wrote:
> > +     * We might have exposed MSR_ARCH_CAPS after the microcode update.
> 
> I'm struggling a little with this sentence, but not being a native speaker
> it may be me, not the sentence. I would perhaps have said "MSR_ARCH_CAPS
> may have appeared with the microcode update."
Sure, works for me.

> I also wonder whether you wouldn't want to insert "e.g.", since iirc with
> the next patch tsx_init() isn't going to be the only user anymore.
tsx_init() is the only user, as far as I have seen. DIS_MCU_LOAD is checked
before the update, using the cached data read in early_cpu_init()

> 
> > +     */
> > +    if ( boot_cpu_data.cpuid_level >= 7 )
> > +        boot_cpu_data.x86_capability[FEATURESET_7d0]
> > +            = cpuid_count_edx(7, 0);
> 
> I take it we assume the maximum CPUID level won't go from below 7 to 7
> or higher with the ucode update?
Do you mean from >=7 to <7 instead? Otherwise it just works and I don't
undertand the concern.

If so, that's an impossibly unlikely case and the current code does not try
to clean up in that case.

> 
> > --- a/xen/arch/x86/tsx.c
> > +++ b/xen/arch/x86/tsx.c
> > @@ -39,9 +39,9 @@ void tsx_init(void)
> >      static bool __read_mostly once;
> >  
> >      /*
> > -     * This function is first called between microcode being loaded, and CPUID
> > -     * being scanned generally.  Read into boot_cpu_data.x86_capability[] for
> > -     * the cpu_has_* bits we care about using here.
> > +     * This function is first called between microcode being loaded, and
> > +     * CPUID being scanned generally. early_microcode_init() has already
> > +     * prepared the feature bits needed here after the microcode update.
> 
> Is this true in all cases? early_microcode_init() may have bailed
> early, so I think you need to further transform early_microcode_init()
> (and as a personal request of mine preferably without goto).
> 
> Jan
The series is eventually correct because MSR_ARCH_CAPS are also collected
in early_cpu_init(). Alas, that's not the case here. You're right. I'll
move the early MSR_ARCH_CAPS read to this patch as well.

Alejandro

