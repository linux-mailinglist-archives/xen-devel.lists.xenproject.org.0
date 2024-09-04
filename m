Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A04196BCB9
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 14:45:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790262.1200011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slpNi-0006iq-3X; Wed, 04 Sep 2024 12:45:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790262.1200011; Wed, 04 Sep 2024 12:45:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slpNi-0006hI-0s; Wed, 04 Sep 2024 12:45:06 +0000
Received: by outflank-mailman (input) for mailman id 790262;
 Wed, 04 Sep 2024 12:45:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MPF=QC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slpNg-00069o-9C
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 12:45:04 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80d26904-6abb-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 14:45:02 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a866cea40c4so759663766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 05:45:02 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196babsm803949866b.100.2024.09.04.05.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 05:45:01 -0700 (PDT)
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
X-Inumbo-ID: 80d26904-6abb-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725453902; x=1726058702; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ksl9mhCdHg81dBrZsizFsW2M84KEg74pn0j4nzu7BW8=;
        b=ZkgZkws7D3jA3RREIDc1BZDdYBOxBVTaOnIQFiPpKhtPC4UkVoZJeUN3lPv1Imd6hb
         LaegHXBfVt+w3umxDyyOJ4Epr9hYF/dI2rb0fCTPU6henxswHwO5V0qR4nDCSpaQls5Y
         L8tiW5bvdte0lxNWosI8LPZBQsyeob2+kfQWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725453902; x=1726058702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ksl9mhCdHg81dBrZsizFsW2M84KEg74pn0j4nzu7BW8=;
        b=NObhhe7nAyyWaKoxfgRJDHkMazUm4pQygw6gUz5wzoEaE/0MMCb01aV0uHmjHisg3W
         LtqxvD7KRYQOVsgbkhjjDnJ/BM0XGmAzS/u/hLn/+p8A7WQyuG5sR+PosnCxm7Dbo+yN
         6FVCx5lVdJRd+e61WT4znhyfuxpaRK1oWrIh9dYJXPLBWy+PpQApSuFtYwTWxMj7anL3
         kVfn4/1XajDMe264I4w8Po5re2GxQhvOES2LE2DrEPSGKLmeTQ8qm7LHMfJxNy0hfbEl
         qJSyeUyqlrNtuhrN9Db8YBDKod/NwDBxPx4aOPkptnO4dEDzz6a56osdXCUDeqNcSoN4
         CZeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7NPIEJka7qCN9OYRXvGIqqWEOabRMiRUg8JbM47Oj7h+1Z2xOQTF/xdRFs5JhzNrR6GtjJ3PlI34=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyMs493Dj+1S9JJpJs8YYTztnPAGm0ZMg54xduWUta5uOoXAmX
	KyY8sj5HO9ttRTUPSWafLZrfDmLZg8FIgtzeHXrKTeBY4Y9zppbCft9WSkte9MFEDhX4dguZzWV
	W
X-Google-Smtp-Source: AGHT+IEeIW43TB6yt5XvMomWyXdsqzlYq55tuo58s1wgcFzCvrkd3VGRMFY68lQGZYA4lUbGLbnR4w==
X-Received: by 2002:a17:907:3e1c:b0:a7a:a46e:dc3f with SMTP id a640c23a62f3a-a8a1d4c34a1mr503627866b.45.1725453901427;
        Wed, 04 Sep 2024 05:45:01 -0700 (PDT)
Date: Wed, 4 Sep 2024 14:45:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 7/7] x86/time: probe the CMOS RTC by default
Message-ID: <ZthWTO6rOgAob-z_@macbook.local>
References: <20240903130303.71334-1-roger.pau@citrix.com>
 <20240903130303.71334-8-roger.pau@citrix.com>
 <66465a2a-f7a0-412d-b1af-98a28fd38472@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66465a2a-f7a0-412d-b1af-98a28fd38472@suse.com>

On Tue, Sep 03, 2024 at 05:48:09PM +0200, Jan Beulich wrote:
> On 03.09.2024 15:03, Roger Pau Monne wrote:
> > Probing for the CMOS RTC registers consist in reading IO ports, and we expect
> > those reads to have no side effects even when the CMOS RTC is not present.
> 
> But what do we gain from this besides possible being slower to boot?

The intent is that Xen can successfully boot on more systems without
having to pass specific command line options.

> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -326,11 +326,14 @@ Interrupts.  Specifying zero disables CMCI handling.
> >  ### cmos-rtc-probe (x86)
> >  > `= <boolean>`
> >  
> > -> Default: `false`
> > +> Default: `true`
> >  
> >  Flag to indicate whether to probe for a CMOS Real Time Clock irrespective of
> >  ACPI indicating none to be there.
> >  
> > +**WARNING: The `cmos-rtc-probe` option is deprecated and superseded by
> > +_wallclock=no-cmos-probe_ using both options in combination is undefined.**
> 
> Hmm, but then ...
> 
> > @@ -2822,7 +2825,7 @@ suboptimal scheduling decisions, but only when the system is
> >  oversubscribed (i.e., in total there are more vCPUs than pCPUs).
> >  
> >  ### wallclock (x86)
> > -> `= auto | xen | cmos | efi`
> > +> `= auto | xen | cmos | no-cmos-probe | efi`
> 
> ... this wants to be a boolean sub-option "cmos-probe", such that the flag
> can still be set both ways (in particular for a later command line option
> to override an earlier one).

What's the point in overriding?  Either the users selects a specific
wallclock to use, or it's left for Xen to decide which wallclock to
pick, either with (auto) or without (no-cmos-probe) possibly probing
the CMOS RTC.

Multiple different wallclock options being passed on the command line
will result in just the last one taking effect.

> > @@ -2836,6 +2839,11 @@ Allow forcing the usage of a specific wallclock source.
> >  
> >   * `cmos` force usage of the CMOS RTC wallclock.
> >  
> > + * `no-cmos-probe` do not probe for the CMOS RTC presence if the ACPI FADT
> > +   table signals there's no CMOS RTC.  Implies using the same heuristics as
> > +   the `auto` option.  By default Xen will probe for the CMOS RTC presence
> > +   even when ACPI FADT signals no CMOS RTC available.
> 
> "By default ..." reads as if this would always occur, which I don't think
> is the case.

Hm, not when using the Xen timer source indeed, there's no probing
then.

> > @@ -1560,6 +1560,8 @@ static int __init cf_check parse_wallclock(const char *arg)
> >      if ( !arg )
> >          return -EINVAL;
> >  
> > +    cmos_rtc_probe = true;
> > +
> >      if ( !strcmp("auto", arg) )
> >          wallclock_source = WALLCLOCK_UNSET;
> >      else if ( !strcmp("xen", arg) )
> > @@ -1571,6 +1573,8 @@ static int __init cf_check parse_wallclock(const char *arg)
> >      }
> >      else if ( !strcmp("cmos", arg) )
> >          wallclock_source = WALLCLOCK_CMOS;
> > +    else if ( !strcmp("no-cmos-probe", arg) )
> > +        cmos_rtc_probe = false;
> >      else if ( !strcmp("efi", arg) )
> >      {
> >          if ( !efi_enabled(EFI_RS) )
> 
> And to request a particular wallclock _and_ control the probing one then
> needs two wallclock= on the command line? And - because of the forcing to
> true of cmos_rtc_probe - even in a particular order. Not very nice from a
> usability pov.

If you request a specific wallclock then there's no probing, so
nothing to control.  I agree the interface is not great, but I
couldn't come up with anything better.

I'm kind of fine with not introducing an extra option to wallclock= to
control the CMOS RTC probing, but would you agree to switching
cmos-rtc-probe to true by default?

Thanks, Roger.

