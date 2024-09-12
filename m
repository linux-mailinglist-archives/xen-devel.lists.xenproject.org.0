Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A239769C5
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 14:57:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797472.1207433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sojNd-00062o-3B; Thu, 12 Sep 2024 12:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797472.1207433; Thu, 12 Sep 2024 12:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sojNd-00061I-0W; Thu, 12 Sep 2024 12:57:01 +0000
Received: by outflank-mailman (input) for mailman id 797472;
 Thu, 12 Sep 2024 12:56:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HbDX=QK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sojNb-00061C-HE
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 12:56:59 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e45f304-7106-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 14:56:57 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c3ca32971cso1130538a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 05:56:57 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd8cdebsm6442497a12.95.2024.09.12.05.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 05:56:56 -0700 (PDT)
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
X-Inumbo-ID: 7e45f304-7106-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726145817; x=1726750617; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OpV+yby5JTssRJbyJqvpW9C7cefNblvgdksWosM5V4s=;
        b=uZngFZozS9Zi2HSWDwOSn3NS5z2ACD9qbsiM6bZ6eyM/MQQIl4reasvb+VG9Xnx+xW
         CN+XubMygIFQj1o61alYRZDL/iv0XV6qXNwM9wBJ7Ni112mNi0VGLpiX9sSXHnRWsaFG
         SW4JSNVEGS6Xi3Mv/qcI2u934kVk+fvIaYTKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726145817; x=1726750617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpV+yby5JTssRJbyJqvpW9C7cefNblvgdksWosM5V4s=;
        b=KWLLGFAvCH/Dwj5kKJGUPJNroGaTOaiuWSQtLG3DNkzLPHTC071J+1gN2d25be5Cw8
         ikamk9eHoofddfLPeUElGv5ajeoBMa1pnBvGfptUryhqXT8N4bj50eEhVUTbyZdmz8Bh
         EECK48pOiT+/LqQJLUfdyvXWUqWoFD0qEoDhTSWw9AVVZEIVlK3njQB4KGwO8Q4SzhMw
         qLA6p0X8QvvWrVm/+ohZYqpzJLu9ZU9nRO0xz1ru+UcR50IkSljXBLOQXQm8AqJBava4
         MXmwkmg9fFZ8vZcliVyQh+JGbNJBlBE5aPorLpEzHpQJheFTRKdz3vDGDIhDxrR4gvcR
         bXWw==
X-Forwarded-Encrypted: i=1; AJvYcCUb658UuObYgibCrimorfh9imtIpBRAqGHZxkaZM9vR7q1+rz0cNuMCxQIWabbzHbr1bqVvpoZ6l7w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1aMpuYc92Py/oUFaSAtm4sBSrFbk4MrGqXD2HxKZkSlzZ1iK1
	C9O2EyNCZXPvm4xlUOtzQUr0NHKJcw7CNQxI0EH7ulSzP2un/YTbu6WiCbhvyRY=
X-Google-Smtp-Source: AGHT+IGjbqSgp0vCQ0vdBPZAQoSoxtnoWT8czLi/L8JqlXgNLnCiK0hX4Fg2XN5YqrIUkfuYi6Qqzg==
X-Received: by 2002:a50:c909:0:b0:5c0:a8d0:8be6 with SMTP id 4fb4d7f45d1cf-5c413e1ed52mr2028404a12.19.1726145816675;
        Thu, 12 Sep 2024 05:56:56 -0700 (PDT)
Date: Thu, 12 Sep 2024 14:56:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 1/2] x86/time: introduce command line option to select
 wallclock
Message-ID: <ZuLlF1PKSOmbqr8u@macbook.local>
References: <20240912111514.26934-1-roger.pau@citrix.com>
 <20240912111514.26934-2-roger.pau@citrix.com>
 <51c8a98b-145c-4834-865c-b75b61f1d5b0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <51c8a98b-145c-4834-865c-b75b61f1d5b0@suse.com>

On Thu, Sep 12, 2024 at 01:57:00PM +0200, Jan Beulich wrote:
> On 12.09.2024 13:15, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/time.c
> > +++ b/xen/arch/x86/time.c
> > @@ -1552,6 +1552,35 @@ static const char *__init wallclock_type_to_string(void)
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
> > +        /*
> > +         * Checking if run-time services are available must be done after
> > +         * command line parsing.
> > +         */
> > +        wallclock_source = WALLCLOCK_EFI;
> > +    else
> > +        return -EINVAL;
> > +
> > +    return 0;
> > +}
> > +custom_param("wallclock", parse_wallclock);
> > +
> >  static void __init probe_wallclock(void)
> >  {
> >      ASSERT(wallclock_source == WALLCLOCK_UNSET);
> > @@ -2527,7 +2556,15 @@ int __init init_xen_time(void)
> >  
> >      open_softirq(TIME_CALIBRATE_SOFTIRQ, local_time_calibration);
> >  
> > -    probe_wallclock();
> > +    /*
> > +     * EFI run time services can be disabled from the command line, hence the
> > +     * check for them cannot be done as part of the wallclock option parsing.
> > +     */
> > +    if ( wallclock_source == WALLCLOCK_EFI && !efi_enabled(EFI_RS) )
> > +        wallclock_source = WALLCLOCK_UNSET;
> > +
> > +    if ( wallclock_source == WALLCLOCK_UNSET )
> > +        probe_wallclock();
> 
> I don't want to stand in the way, and I can live with this form, so I'd like to
> ask that EFI folks or Andrew provide the necessary A-b / R-b. I'd like to note
> though that there continue to be quirks here. They may not be affecting the
> overall result as long as we have only three possible wallclocks, but there
> might be problems if a 4th one appeared.
> 
> With the EFI_RS check in the command line handler and assuming the default case
> of no "efi=no-rs" on the command line, EFI_RS may still end up being off by the
> time the command line is being parsed. With "wallclock=cmos wallclock=efi" this
> would result in no probing and "cmos" chosen if there was that check in place.
> With the logic as added here there will be probing in that case. Replace "cmos"
> by a hypothetical non-default 4th wallclock type (i.e. probing picking "cmos"),
> and I expect you can see how the result would then not necessarily be as
> expected.

My expectation would be that if "wallclock=cmos wallclock=efi" is used
the last option overrides any previous one, and hence if that last
option is not valid the logic will fallback to the default selection
(in this case to probing).

Thinking about this, it might make sense to unconditionally set
wallclock_source = WALLCLOCK_UNSET at the start of parse_wallclock()
to avoid previous instances carrying over if later ones are not valid.

Thanks, Roger.

