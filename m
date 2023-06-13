Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2325272DFEB
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:42:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548085.855858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91Tm-00031W-2a; Tue, 13 Jun 2023 10:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548085.855858; Tue, 13 Jun 2023 10:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91Tl-0002yn-W6; Tue, 13 Jun 2023 10:42:25 +0000
Received: by outflank-mailman (input) for mailman id 548085;
 Tue, 13 Jun 2023 10:42:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lBMi=CB=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q91Tl-0002yd-9Y
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:42:25 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa443e0b-09d6-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 12:42:23 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f6283d0d84so6524637e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jun 2023 03:42:22 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n18-20020a1c7212000000b003f604793989sm14046403wmc.18.2023.06.13.03.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 03:42:21 -0700 (PDT)
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
X-Inumbo-ID: fa443e0b-09d6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1686652942; x=1689244942;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TEZtXVLIntkKJlfoXAG/sPp/JrN9hVzdJxLL7M1OdEo=;
        b=RPdy04GT968CdKfkx60s2o+0Ka+vURz6iOTc2LXMT/oMG4H+7KMmfM3T6PH8gzketp
         Eg38pZsmsSOM05c9XV4sOEyc08nES9GywgMlybD0ppHNVaGvKcqF15vAKUuaJOSrq7jL
         2F+wpWIbDiA6FuwhG0KFPCtcp8k/nkcx7k35s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686652942; x=1689244942;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEZtXVLIntkKJlfoXAG/sPp/JrN9hVzdJxLL7M1OdEo=;
        b=Xg6ShMdDlCdzjdkTcklKBZauWfvWHeJgcZ/1tOLfuwmqWmGyWwiAhdgj3Hg+NcFLPF
         qD3SkverUpVOGokCT0SAfGs+zyAmbhcHTjy6nGvP3TmMTiJg8SSgx2FpQgvjyYEJzbY0
         mF/+Rlwj/nsIugDJgiZgg+k8n/aGIVe8jmX7P6R5+L93KigWplnRWNarN8xiF9Rrq/xH
         hcNFvdu8jC4Eq0aYmC/oYnWiiKEKlgQfBGGLEHUAIk+ODuiEgAnecQMvxX1rzl1TAwDf
         XEWvHT9/8/V9imqRY0qMgsc+o2jy6cEw9QtOoUPgx0EiPNas9bAL6tex8XU/mqOGoyKR
         WwKg==
X-Gm-Message-State: AC+VfDzzWVcdlcoPq2J98tBaqrW0HJNx1zn5iozGsYyRHiMk6LKlls5i
	S9T2ZaSvWOU6FE7tNcg3dbA9ZA==
X-Google-Smtp-Source: ACHHUZ4oVAZsNOPlgUkr3lGirmoC9CRfNSA2iTGJwoP9DYRVQeSM5ECH0uwyj3LCDTk//HAm7Yp53Q==
X-Received: by 2002:a19:6551:0:b0:4f6:2a02:fc1a with SMTP id c17-20020a196551000000b004f62a02fc1amr4788747lfj.17.1686652941745;
        Tue, 13 Jun 2023 03:42:21 -0700 (PDT)
Message-ID: <6488480d.1c0a0220.bdc79.4f7a@mx.google.com>
X-Google-Original-Message-ID: <ZIhICyPk5BB3vz/c@EMEAENGAAD19049.>
Date: Tue, 13 Jun 2023 11:42:19 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/4] x86: Read MSR_ARCH_CAPS after
 early_microcode_init()
References: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
 <20230605170817.9913-3-alejandro.vallejo@cloud.com>
 <6ee9e687-b8ac-adfb-552e-522a21e128de@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ee9e687-b8ac-adfb-552e-522a21e128de@suse.com>

On Mon, Jun 12, 2023 at 05:46:07PM +0200, Jan Beulich wrote:
> See early_cpu_init().
Ah, I missed that. I didn't expect several leafs to be read at once.
I see now that that function takes care of 

> (I have to admit that I was also struggling with
> your use of "read": Aiui you mean the field was never written / set,
> and "read" really refers to the reading of the corresponding CPUID
> leaf.)
Correct, though in retrospect that does sound misleading. I meant read from
the HW CPUID leaf.

> > --- a/xen/arch/x86/cpu/microcode/core.c
> > +++ b/xen/arch/x86/cpu/microcode/core.c
> > @@ -840,6 +840,15 @@ static int __init early_microcode_update_cpu(void)
> >      return microcode_update_cpu(patch);
> >  }
> >  
> > +static void __init early_read_cpuid_7d0(void)
> > +{
> > +    boot_cpu_data.cpuid_level = cpuid_eax(0);
> 
> As per above I don't think this is needed.
> 
> > +    if ( boot_cpu_data.cpuid_level >= 7 )
> > +        boot_cpu_data.x86_capability[FEATURESET_7d0]
> > +            = cpuid_count_edx(7, 0);
> 
> This is actually filled in early_cpu_init() as well, so doesn't need
> re-doing here unless because of a suspected change to the value (but
> then other CPUID output may have changed, too). At which point ...
MSR_ARCH_CAPS may genuinely appear only after a microcode update, so
re-reading 7d0 and the MSR itself is probably the sane thing to do.

> 
> > @@ -878,5 +887,17 @@ int __init early_microcode_init(unsigned long *module_map,
> >      if ( ucode_mod.mod_end || ucode_blob.size )
> >          rc = early_microcode_update_cpu();
> >  
> > +    early_read_cpuid_7d0();
> > +
> > +    /*
> > +     * tsx_init() needs MSR_ARCH_CAPS, but it runs before identify_cpu()
> > +     * populates boot_cpu_data, so we read it here to centralize early
> > +     * CPUID/MSR reads in the same place.
> > +     */
> > +    if ( cpu_has_arch_caps )
> > +        rdmsr(MSR_ARCH_CAPABILITIES,
> > +              boot_cpu_data.x86_capability[FEATURESET_m10Al],
> > +              boot_cpu_data.x86_capability[FEATURESET_m10Ah]);
> 
> ... "centralize" aspect goes away, and hence the comment needs adjusting.
Indeed. I'll rewrite that.

> > --- a/xen/arch/x86/tsx.c
> > +++ b/xen/arch/x86/tsx.c
> > @@ -39,9 +39,9 @@ void tsx_init(void)
> >      static bool __read_mostly once;
> >  
> >      /*
> > -     * This function is first called between microcode being loaded, and CPUID
> > -     * being scanned generally.  Read into boot_cpu_data.x86_capability[] for
> > -     * the cpu_has_* bits we care about using here.
> > +     * While MSRs/CPUID haven't yet been scanned, MSR_ARCH_CAPABILITIES
> > +     * and leaf 7d0 have already been read if present after early microcode
> > +     * loading time. So we can assume _those_ are present.
> >       */
> >      if ( unlikely(!once) )
> >      {
> 
> I think I'd like to see at least the initial part of the original comment
> retained here.
Ack. Sure.

Alejandro

