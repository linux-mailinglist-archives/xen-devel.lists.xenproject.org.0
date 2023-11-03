Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44A77E05A2
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 16:35:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627220.978135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qywBi-0002ba-6Y; Fri, 03 Nov 2023 15:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627220.978135; Fri, 03 Nov 2023 15:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qywBi-0002YQ-3E; Fri, 03 Nov 2023 15:34:22 +0000
Received: by outflank-mailman (input) for mailman id 627220;
 Fri, 03 Nov 2023 15:34:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUT0=GQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qywBg-0002YK-9b
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 15:34:20 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74643503-7a5e-11ee-98d8-6d05b1d4d9a1;
 Fri, 03 Nov 2023 16:34:19 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5094cb3a036so2327677e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 Nov 2023 08:34:19 -0700 (PDT)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 i20-20020a05600c355400b0040839fcb217sm2858004wmq.8.2023.11.03.08.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 08:34:18 -0700 (PDT)
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
X-Inumbo-ID: 74643503-7a5e-11ee-98d8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699025659; x=1699630459; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qM2+RUZsByN764Ar2nK/rsj5kAkXUS/lv8hXHW6c7ZI=;
        b=PFIWFCfDneN6GyRcmgOxYHCZYVkbPxpqsqUxKXbRHcgvxSa+O6fKKg9aXD2E8FDLX9
         mQ/hT1dx2D9tr+75mR47YJoXB4pfvJDSvjQJtQAbrITDQcadRDmTlYP1DR8tJReAtR3m
         EVTrAxJ7JM96ycjQSxC2ogZRIBB/p9r925OkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699025659; x=1699630459;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qM2+RUZsByN764Ar2nK/rsj5kAkXUS/lv8hXHW6c7ZI=;
        b=sNBc/wq3iSUbhwSulFmNnZXqm0om/cQdNutE7fOae7tUYNS8x+D0XXrOpK70AAMCbq
         4Bs5LMosV3rwDFcw2KhfNM22eulEc1Q5tDsqE99mYaa1woKKb8R1XWdxELtpcMw9iszZ
         oya20BMBu9IFw7gRBSCIsD2yPsgckD7hxeu9KuKt9iiiuyihyC1cIqiB338wwiOsAvLV
         tuhJ8+DFq0Hmd+UhutSMPyQQBaDrSN+NHdRng+Z3PhdBB7H42uuQxf4NgcxjiI09RmXR
         fS+F6mG4FcmWlORpeObQ8tMmrNnin2T9bbT23pFZJD5foRXtx27Tfx1gGZ14RIsyQljf
         tNTg==
X-Gm-Message-State: AOJu0Yz8e6FgfcF5QkT17vTkV6LtDyRgt4VvhMWaFZgA+fE1cLcT4TJ2
	fMhTHjciqvJhU+CLnZKBGekS6Q==
X-Google-Smtp-Source: AGHT+IGeywt5bXrA2suk7ylLpNg/AeEjXE7iZQbY7/p/uL9705jQg0odbXNLPXsK1L9mduqmoC0wqQ==
X-Received: by 2002:a05:6512:114b:b0:507:9ae6:6913 with SMTP id m11-20020a056512114b00b005079ae66913mr20625569lfg.28.1699025658882;
        Fri, 03 Nov 2023 08:34:18 -0700 (PDT)
Date: Fri, 3 Nov 2023 16:34:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] x86/x2apic: introduce a mixed physical/cluster mode
Message-ID: <ZUUS-fzShqxOs5IO@macbook>
References: <20231103144537.90914-1-roger.pau@citrix.com>
 <93fc77ad-8696-4d83-b916-e47f883ac366@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93fc77ad-8696-4d83-b916-e47f883ac366@citrix.com>

On Fri, Nov 03, 2023 at 03:10:18PM +0000, Andrew Cooper wrote:
> On 03/11/2023 2:45 pm, Roger Pau Monne wrote:
> > The current implementation of x2APIC requires to either use Cluster Logical or
> 
> I'd suggest starting with "Xen's current ..." to make it clear that this
> is our logic, not a property of x2APIC itself.
> 
> > Physical mode for all interrupts.  However the selection of Physical vs Logical
> > is not done at APIC setup, an APIC can be addressed both in Physical or Logical
> > destination modes concurrently.
> >
> > Introduce a new x2APIC mode called mixed, which uses Logical Cluster mode for
> > IPIs, and Physical mode for external interrupts, thus attempting to use the
> > best method for each interrupt type.
> >
> > Using Physical mode for external interrupts allows more vectors to be used, and
> > interrupt balancing to be more accurate.
> >
> > Using Logical Cluster mode for IPIs allows less accesses to the ICR register
> 
> s/less/fewer/
> 
> > when sending those, as multiple CPUs can be targeted with a single ICR register
> > write.
> >
> > A simple test calling flush_tlb_all() 10000 times in a tight loop on a 96 CPU
> > box gives the following average figures:
> >
> > Physical mode: 26617931ns
> > Mixed mode:    23865337ns
> >
> > So ~10% improvement versus plain Physical mode.  Note that Xen uses Cluster
> > mode by default, and hence is already using the fastest way for IPI delivery at
> > the cost of reducing the amount of vectors available system-wide.
> 
> 96 looks suspiciously like an Intel number.  In nothing else, you ought
> to say which CPU is it, because microarchitecture matters.  By any
> chance can we try this on one of the Bergamos, to give us a datapoint at
> 512?

Let me see if I can grab the only one that's not broken.

Those figures are from an Intel IceLake IIRC.  Cluster mode is the
default, so this change shouldn't effect the performance of builds
that use the default settings.

> > diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> > index eac77573bd75..cd9286f295e5 100644
> > --- a/xen/arch/x86/Kconfig
> > +++ b/xen/arch/x86/Kconfig
> > @@ -228,11 +228,18 @@ config XEN_ALIGN_2M
> >  
> >  endchoice
> >  
> > -config X2APIC_PHYSICAL
> > -	bool "x2APIC Physical Destination mode"
> > +choice
> > +	prompt "x2APIC Destination mode"
> 
> "x2APIC Driver default" is going to be more meaningful to a non-expert
> reading this menu entry, IMO.

I will leave the helps as-is.

> > +};
> > +
> >  static int cf_check update_clusterinfo(
> >      struct notifier_block *nfb, unsigned long action, void *hcpu)
> >  {
> > @@ -220,38 +248,56 @@ static struct notifier_block x2apic_cpu_nfb = {
> >  static int8_t __initdata x2apic_phys = -1;
> >  boolean_param("x2apic_phys", x2apic_phys);
> >  
> > +enum {
> > +   unset, physical, cluster, mixed
> > +} static __initdata x2apic_mode = unset;
> > +
> > +static int __init parse_x2apic_mode(const char *s)
> 
> cf_check

I'm probably confused, but other users of custom_param() do have the
cf_check attribute, see parse_spec_ctrl() for example.

Thanks, Roger.

