Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D46D97A3F4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 16:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799559.1209538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqCUp-0008Bp-JO; Mon, 16 Sep 2024 14:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799559.1209538; Mon, 16 Sep 2024 14:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqCUp-000893-Ge; Mon, 16 Sep 2024 14:14:31 +0000
Received: by outflank-mailman (input) for mailman id 799559;
 Mon, 16 Sep 2024 14:14:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H51U=QO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sqCUo-00088x-8g
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 14:14:30 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbc95a50-7435-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 16:14:28 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c275491c61so6019315a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 07:14:27 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb89d69sm2779262a12.77.2024.09.16.07.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 07:14:26 -0700 (PDT)
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
X-Inumbo-ID: fbc95a50-7435-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726496067; x=1727100867; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yhg4VNAEaodhmEhShwvldT0HWTu9pqwU7Ha2O5CXnK0=;
        b=mTo20cWGbWBmvzmQ8iLGk9oJmBVxtj1TQw9KLLiepy3h+xnIAAtBSyWPZQreP+vGOj
         UbPzjU7cstqeEie/5ZNEQymZd91QB6j11zVmxygdmBsXMKlJvRHO51z5XVQ4BsYzKhIT
         w9bD9fRLDFxtmLcibg8K+9euKi+f8xcC4j0LY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726496067; x=1727100867;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yhg4VNAEaodhmEhShwvldT0HWTu9pqwU7Ha2O5CXnK0=;
        b=OLMbFG/vCd1DYJDM0ZDZXQu7bwmhYPkLmzXM7PKyWiDDT91CcGeLXOwbP9tGFgI+Qq
         JCf8sKEt1uKhydtr0Mkgpa34ncMZmcRhLuGrZ56h0vXBNnzYwhJXY97jIUFEkvDDWGM6
         OyyiWrwEbhXcBJCXxu5gxMIaNw29meKNSKlW4b7LC4Ua/H8fukEQvz99TPlcKX4N9+iC
         Tb27t3f0ER9Ui8FQzX2iy4fajqWL148zPsmkg9I5lsGD268VJpov0EInTqPKVv2/091y
         7E2lFZpel8qTw8piFovIfo60jKWeePrJIUiMujvSe2NXiPVrUvwLKOk43PeEnftFa3Uy
         SAMw==
X-Forwarded-Encrypted: i=1; AJvYcCU4mNBHlWiCw86Q3DXabR5bSU6/fIv3sfdnIeupaOL2C9PYWzvEWyE4e+4rTEgwMVYHT6Gg6oiuWfI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCeccZXXzyNSvwAyPuyupUd3mXrPy5EHamqBAzMtqODKglfH92
	trzQJfElGCxLWc8uyIM4tr+vFowm6jiSeMVRzCCom2Lrt7WULyzKLbaLvxuzF1U=
X-Google-Smtp-Source: AGHT+IGfQOj5vO2FXs1/05YBLvs1Ei6SafVBu8yNB5xTzkorZrf4uGeC4Jdnn2bGM5UhAVIiOFwI8Q==
X-Received: by 2002:a05:6402:1e95:b0:5c2:768d:23e with SMTP id 4fb4d7f45d1cf-5c413e4d08fmr16496281a12.27.1726496066794;
        Mon, 16 Sep 2024 07:14:26 -0700 (PDT)
Date: Mon, 16 Sep 2024 16:14:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 1/2] x86/time: introduce command line option to select
 wallclock
Message-ID: <Zug9QarN1j2M-z9w@macbook.local>
References: <20240913075907.34460-1-roger.pau@citrix.com>
 <20240913075907.34460-2-roger.pau@citrix.com>
 <01b4b04f-d7ba-4526-b45f-2146bfc03cbe@citrix.com>
 <ZugwuGWIl2Xg7EMD@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZugwuGWIl2Xg7EMD@mail-itl>

On Mon, Sep 16, 2024 at 03:20:56PM +0200, Marek Marczykowski-Górecki wrote:
> On Mon, Sep 16, 2024 at 02:11:08PM +0100, Andrew Cooper wrote:
> > On 13/09/2024 8:59 am, Roger Pau Monne wrote:
> > > diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> > > index 959cf45b55d9..2a9b3b9b8975 100644
> > > --- a/docs/misc/xen-command-line.pandoc
> > > +++ b/docs/misc/xen-command-line.pandoc
> > > @@ -2816,6 +2816,27 @@ vwfi to `native` reduces irq latency significantly. It can also lead to
> > >  suboptimal scheduling decisions, but only when the system is
> > >  oversubscribed (i.e., in total there are more vCPUs than pCPUs).
> > >  
> > > +### wallclock (x86)
> > > +> `= auto | xen | cmos | efi`
> > > +
> > > +> Default: `auto`
> > > +
> > > +Allow forcing the usage of a specific wallclock source.
> > > +
> > > + * `auto` let the hypervisor select the clocksource based on internal
> > > +   heuristics.
> > > +
> > > + * `xen` force usage of the Xen shared_info wallclock when booted as a Xen
> > > +   guest.  This option is only available if the hypervisor was compiled with
> > > +   `CONFIG_XEN_GUEST` enabled.
> > > +
> > > + * `cmos` force usage of the CMOS RTC wallclock.
> > > +
> > > + * `efi` force usage of the EFI_GET_TIME run-time method when booted from EFI
> > > +   firmware.
> > 
> > For both `xen` and `efi`, something should be said about "if selected
> > and not satisfied, Xen falls back to other heuristics".

There's a line just below that notes this: "If the selected option is
invalid or not available Xen will default to `auto`."  I think it's
clearer than having to comment on every specific option.

> > > +
> > > +If the selected option is invalid or not available Xen will default to `auto`.
> > 
> > I'm afraid that I'm firmly of the opinion that "auto" on the cmdline is
> > unnecessary complexity.  Auto is the default, and doesn't need
> > specifying explicitly.  That in turn simplifies ...
> 
> What about overriding earlier choice? For example overriding a built-in
> cmdline? That said, with the current code, the same can be achieved with
> wallclock=foo, and living with the warning in boot log...

It's IMO weird to ask the users to use wallclock=foo to override a
previous command line wallclock option and fallback to the default
behavior.

> > > +
> > >  ### watchdog (x86)
> > >  > `= force | <boolean>`
> > >  
> > > diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> > > index 29b026735e5d..e4751684951e 100644
> > > --- a/xen/arch/x86/time.c
> > > +++ b/xen/arch/x86/time.c
> > > @@ -1552,6 +1552,37 @@ static const char *__init wallclock_type_to_string(void)
> > >      return "";
> > >  }
> > >  
> > > +static int __init cf_check parse_wallclock(const char *arg)
> > > +{
> > > +    wallclock_source = WALLCLOCK_UNSET;
> > > +
> > > +    if ( !arg )
> > > +        return -EINVAL;
> > > +
> > > +    if ( !strcmp("auto", arg) )
> > > +        ASSERT(wallclock_source == WALLCLOCK_UNSET);
> > 
> > ... this.
> > 
> > Hitting this assert will manifest as a system reboot/hang with no
> > information on serial/VGA, because all of this runs prior to getting up
> > the console.  You only get to see it on a PVH boot because we bodge the
> > Xen console into default-existence.
> 
> This assert is no-op as wallclock_source is unconditionally set to WALLCLOCK_UNSET few lines above.

As mentioned to Jan - I find it nicer than adding an empty statement.

> > So, ASSERT()/etc really need avoiding wherever possible in cmdline parsing.
> > 
> > In this case, all it serves to do is break examples like `wallclock=xen
> > wallclock=auto` case, which is unlike our latest-takes-precedence
> > behaviour everywhere else.
> > 
> > > +    else if ( !strcmp("xen", arg) )
> > > +    {
> > > +        if ( !xen_guest )
> > 
> > We don't normally treat this path as an error when parsing (we know what
> > it is, even if we can't action it).  Instead, there's no_config_param()
> > to be more friendly (for PVH at least).
> > 
> > It's a bit awkward, but this should do:
> > 
> >     {
> > #ifdef CONFIG_XEN_GUEST
> >         wallclock_source = WALLCLOCK_XEN;
> > #else
> >         no_config_param("XEN_GUEST", "wallclock", s, ss);
> > #endif
> >     }
> 
> Can you boot the binary build with CONFIG_XEN_GUEST=y as native? If so,
> the above will not be enough, a runtime check is needed anyway.
> 
> > There probably wants to be something similar for EFI, although it's not
> > a plain CONFIG so it might be more tricky.
> 
> It needs to be runtime check here even more. Not only because of
> different boot modes, but due to interaction with efi=no-rs (or any
> other reason for not having runtime services). See the comment there.

I agree with Marek, no_config_param() is not enough here: Xen needs to
ensure it has been booted as a Xen guest, or that EFI run-time
services are enabled in order to ensure the selected clock source is
available.

Thanks, Roger.

