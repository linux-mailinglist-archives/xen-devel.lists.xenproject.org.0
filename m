Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00283973850
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 15:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795543.1204940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so0dQ-0002pt-Gv; Tue, 10 Sep 2024 13:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795543.1204940; Tue, 10 Sep 2024 13:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so0dQ-0002nW-Dt; Tue, 10 Sep 2024 13:10:20 +0000
Received: by outflank-mailman (input) for mailman id 795543;
 Tue, 10 Sep 2024 13:10:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EW7V=QI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1so0dP-0002nQ-3W
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 13:10:19 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05f16f85-6f76-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 15:10:17 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5365aa568ceso5337127e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 06:10:17 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c727fcsm479908966b.119.2024.09.10.06.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 06:10:15 -0700 (PDT)
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
X-Inumbo-ID: 05f16f85-6f76-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725973816; x=1726578616; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6yB9HAb/6dyiEzdO1XEImObySjv8SbsG38ZDMtd60dQ=;
        b=BP7wlsTXJaU9O/UhdaicI8ZRav5msGWS33ygih6tySknMa+3mwddXIz3WgCnyUABpI
         6m2CZnppRNGfT5if+aytL/qeoOymrdagfBocJPFr9tlBPzUe1EW9VT41AxEsNy3w0QkL
         1v1QJDVuBs5GcOsF6VIE2blL33QVfAYeTsT9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725973816; x=1726578616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yB9HAb/6dyiEzdO1XEImObySjv8SbsG38ZDMtd60dQ=;
        b=vD9qQFNw5A/I4iHer7UMbazgfMJsSQxPmDpPbNkiL9KG8PVcECtKZLW3J8rgeu3c/e
         9kZ4OFnjdupAgskzL5sL+gBqhSV02Nrkd4jLZedAchg8qFYZ0APJ4Hot1k5ZMDPz1j81
         1u2jui6AJdymv/BkZpHBzG7345Yxuo+CsdfOG6rWUp/80eDXXZTMCzbEGdNh/mFShXJs
         L+IsD8HCr3nkBeiW5fDepbFQI2XPfppKa1TNFCkMX8ZQ1e1OjqoV14OYq/u4YZnWeAAH
         V6cYnP3s3lk8N6y6KphFDXBvzdu+MokCgQYZvl6fCyG03aKWkQqPJkuCsY+HMgo2E4xI
         ++mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqeC56KS1wEp/yAvWpOP/e5ZEvXRNMLgqXg4R2gStmPi3WdQ949NqqHwtVioC3IJUaET65/TkxHWI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzytHfW3IL4IGDbXt0HA4r0ccwALo8aE2qU3YjJAyOeo1+KGvZ
	xjNEJVOyzDhoP5pMbQbJVhmzJg/ZUaqh3JU1Hc5nEXurCvdrHumSCv2Fs3kP4Vw=
X-Google-Smtp-Source: AGHT+IF4xotBw53jQdM++n41g8OIEzOHxpBO5BeHi7Wzgyovb1oh0VEuD3v0sI7lRUf7sN604310Yg==
X-Received: by 2002:a05:6512:1283:b0:533:407f:5cbd with SMTP id 2adb3069b0e04-536587a687amr13952300e87.7.1725973815535;
        Tue, 10 Sep 2024 06:10:15 -0700 (PDT)
Date: Tue, 10 Sep 2024 15:10:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 3/4] x86/time: introduce command line option to select
 wallclock
Message-ID: <ZuBFNu_GFygZwvil@macbook.local>
References: <20240909145455.7517-1-roger.pau@citrix.com>
 <20240909145455.7517-4-roger.pau@citrix.com>
 <985c0d70-55de-43ba-a1b3-811487bb05be@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <985c0d70-55de-43ba-a1b3-811487bb05be@suse.com>

On Tue, Sep 10, 2024 at 11:32:05AM +0200, Jan Beulich wrote:
> On 09.09.2024 16:54, Roger Pau Monne wrote:
> > Allow setting the used wallclock from the command line.  When the option is set
> > to a value different than `auto` the probing is bypassed and the selected
> > implementation is used (as long as it's available).
> > 
> > The `xen` and `efi` options require being booted as a Xen guest (with Xen guest
> > supported built-in) or from UEFI firmware.
> 
> Perhaps add "respectively"?

Sure.

> 
> > --- a/xen/arch/x86/time.c
> > +++ b/xen/arch/x86/time.c
> > @@ -1550,6 +1550,36 @@ static const char *__init wallclock_type_to_string(void)
> >      return "";
> >  }
> >  
> > +static int __init cf_check parse_wallclock(const char *arg)
> > +{
> > +    if ( !arg )
> > +        return -EINVAL;
> > +
> > +    if ( !strcmp("auto", arg) )
> > +        wallclock_source = WALLCLOCK_UNSET;
> > +    else if ( !strcmp("xen", arg) )
> > +    {
> > +        if ( !xen_guest )
> > +            return -EINVAL;
> > +
> > +        wallclock_source = WALLCLOCK_XEN;
> > +    }
> > +    else if ( !strcmp("cmos", arg) )
> > +        wallclock_source = WALLCLOCK_CMOS;
> > +    else if ( !strcmp("efi", arg) )
> > +    {
> > +        if ( !efi_enabled(EFI_RS) )
> > +            return -EINVAL;
> 
> I'm afraid there's a problem here, and I'm sorry for not paying attention
> earlier: EFI_RS is possibly affected by "efi=" (and hence may change after
> this code ran). (It can also be cleared if ->SetVirtualAddressMap() fails,
> but I think that's strictly ahead of command line parsing.)

Hm, I see, thanks for noticing.  Anyone using 'efi=no-rs
wallclock=efi' likely deserves to be punished.  Would you be fine with
adding the following in init_xen_time():

    /*
     * EFI run time services can be disabled form the command line, hence the
     * check for them cannot be done as part of the wallclock option parsing.
     */
    if ( wallclock_source == WALLCLOCK_EFI && !efi_enabled(EFI_RS) )
        wallclock_source = WALLCLOCK_UNSET;

    if ( wallclock_source == WALLCLOCK_UNSET )
        probe_wallclock();

Thanks, Roger.

