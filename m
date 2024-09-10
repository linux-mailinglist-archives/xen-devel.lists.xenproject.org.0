Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 215D69739CB
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:25:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795647.1205053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1nc-00036D-D4; Tue, 10 Sep 2024 14:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795647.1205053; Tue, 10 Sep 2024 14:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1nc-00034i-8c; Tue, 10 Sep 2024 14:24:56 +0000
Received: by outflank-mailman (input) for mailman id 795647;
 Tue, 10 Sep 2024 14:24:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EW7V=QI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1so1na-00034c-9F
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:24:54 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7169b016-6f80-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 16:24:52 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8d56155f51so96841466b.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 07:24:52 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d2598b85bsm486129766b.77.2024.09.10.07.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 07:24:51 -0700 (PDT)
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
X-Inumbo-ID: 7169b016-6f80-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725978292; x=1726583092; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6izmNKTKQjl5iyBCkAGR53MsmQxfqQjGZ2//ghQomok=;
        b=oPjxBE2BEP9HHVasqyMnkMsZo1ViiI0h4MJd2tO2inRv81EB/NcwNok6Ftuq12wzrx
         M4VbXjMO5z5XY73/3VwuP5/QIvj/KTgv4XmlgUuvuOCNJcFr5OuAKd0EzfqzKHyuNf7n
         8eW6KQnowj+idNUMRcodUWS6Mr8SMa3VSPuOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725978292; x=1726583092;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6izmNKTKQjl5iyBCkAGR53MsmQxfqQjGZ2//ghQomok=;
        b=bzgyO1xLU9kRYDLVgY23VZTvZpLyRa8MfEZmOZcmeUigfQgaoeeDyzf83CVETkCqV3
         oX9WOAeA3Xo9jwgyB0UfJSbKjwf9WSCZKkd9L6HBkW6UVWhEzOoV1cz3DlDWUQ4xbnK3
         bLrQBxkYa5eNJR3G/cFbMzkKOFTqEz365a5maB7OaiOvPrOPx+LBjIoS4KjZCPtPSOI4
         c40WoTKTNzitKg2t91GG67d0o0BS7ZYgscg138dq8ShR0GPN1aOD4FN+F5vKp91DjYWo
         XkiXLOkVbz76YEHl1TnBT04hpbyCSmxLtm+joVfur4nxwAyxIYaIFkNWW2GDWc7F4rsC
         lLVA==
X-Forwarded-Encrypted: i=1; AJvYcCULFyKdrrMRJOgPplnhORyLowC+KJMdZbzaJTwfqszY/iL0DzEFzHSmD3LsJ77yctf8VXIiszvTFkQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWuQj1jHvAJlR7+SNW6lt+hxP6aCNRmPibSCoFwuAj48CZv1y8
	PLkQPdbOQ2nASwwFJ/BKBnM8lvVu9HtSQxVV4+aAAhaUj071vGTBmXO3p+aCML0=
X-Google-Smtp-Source: AGHT+IGc4NtZ07KodJvaqO0ylQVc5pxwg8PAsLVxccQ6eALNnwGa6kfa4KB63MiMg0F4C97niuWmfg==
X-Received: by 2002:a17:906:6a12:b0:a86:7dbf:9205 with SMTP id a640c23a62f3a-a8ffadee076mr96771466b.51.1725978291273;
        Tue, 10 Sep 2024 07:24:51 -0700 (PDT)
Date: Tue, 10 Sep 2024 16:24:50 +0200
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
Message-ID: <ZuBWsn2wgf9g1Nyv@macbook.local>
References: <20240909145455.7517-1-roger.pau@citrix.com>
 <20240909145455.7517-4-roger.pau@citrix.com>
 <985c0d70-55de-43ba-a1b3-811487bb05be@suse.com>
 <ZuBFNu_GFygZwvil@macbook.local>
 <a52b019c-3f1c-4528-91f4-7bc1258c87d9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a52b019c-3f1c-4528-91f4-7bc1258c87d9@suse.com>

On Tue, Sep 10, 2024 at 03:49:52PM +0200, Jan Beulich wrote:
> On 10.09.2024 15:10, Roger Pau Monné wrote:
> > On Tue, Sep 10, 2024 at 11:32:05AM +0200, Jan Beulich wrote:
> >> On 09.09.2024 16:54, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/time.c
> >>> +++ b/xen/arch/x86/time.c
> >>> @@ -1550,6 +1550,36 @@ static const char *__init wallclock_type_to_string(void)
> >>>      return "";
> >>>  }
> >>>  
> >>> +static int __init cf_check parse_wallclock(const char *arg)
> >>> +{
> >>> +    if ( !arg )
> >>> +        return -EINVAL;
> >>> +
> >>> +    if ( !strcmp("auto", arg) )
> >>> +        wallclock_source = WALLCLOCK_UNSET;
> >>> +    else if ( !strcmp("xen", arg) )
> >>> +    {
> >>> +        if ( !xen_guest )
> >>> +            return -EINVAL;
> >>> +
> >>> +        wallclock_source = WALLCLOCK_XEN;
> >>> +    }
> >>> +    else if ( !strcmp("cmos", arg) )
> >>> +        wallclock_source = WALLCLOCK_CMOS;
> >>> +    else if ( !strcmp("efi", arg) )
> >>> +    {
> >>> +        if ( !efi_enabled(EFI_RS) )
> >>> +            return -EINVAL;
> >>
> >> I'm afraid there's a problem here, and I'm sorry for not paying attention
> >> earlier: EFI_RS is possibly affected by "efi=" (and hence may change after
> >> this code ran). (It can also be cleared if ->SetVirtualAddressMap() fails,
> >> but I think that's strictly ahead of command line parsing.)
> > 
> > Hm, I see, thanks for noticing.  Anyone using 'efi=no-rs
> > wallclock=efi' likely deserves to be punished.
> 
> Well, if you don't want to actually do this ;-) then ...

It's not too complicated to attempt to arrange for something half sane
even if the user provided options are nonsense.  I've seen people
accumulate all kind of crap on the command line "just because I've
read it online".

> >  Would you be fine with
> > adding the following in init_xen_time():
> > 
> >     /*
> >      * EFI run time services can be disabled form the command line, hence the
> >      * check for them cannot be done as part of the wallclock option parsing.
> >      */
> >     if ( wallclock_source == WALLCLOCK_EFI && !efi_enabled(EFI_RS) )
> >         wallclock_source = WALLCLOCK_UNSET;
> > 
> >     if ( wallclock_source == WALLCLOCK_UNSET )
> >         probe_wallclock();
> 
> ... this is probably the best we can do (nit: s/form/from/ in the comment;
> maybe also "..., hence the check done as part of option parsing may not
> suffice" or some such).

I didn't put in my previous reply, but I've removed the efi_enabled()
check from the option parsing and instead added this comment:

        /*
         * Checking if run-time services are available must be done after
         * command line parsing.
         */

I don't think there's much point in doing the check in
parse_wallclock() if it's not reliable, so your reference in the
comment to "the check done as part of option parsing" is no longer
valid.

Thanks, Roger.

