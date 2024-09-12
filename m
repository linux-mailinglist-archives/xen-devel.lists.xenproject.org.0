Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F94E976B10
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 15:48:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797505.1207484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sokAy-0007nq-8O; Thu, 12 Sep 2024 13:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797505.1207484; Thu, 12 Sep 2024 13:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sokAy-0007lg-4I; Thu, 12 Sep 2024 13:48:00 +0000
Received: by outflank-mailman (input) for mailman id 797505;
 Thu, 12 Sep 2024 13:47:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HbDX=QK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sokAw-0007kB-6k
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 13:47:58 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d7faf36-710d-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 15:47:56 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5366fd6fdf1so1336550e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 06:47:56 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd76eb6sm6574622a12.61.2024.09.12.06.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 06:47:54 -0700 (PDT)
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
X-Inumbo-ID: 9d7faf36-710d-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726148876; x=1726753676; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dsth6Noo7k6lYDDpfXIP5Q/c2azbg2VnuQUgq1nBaw4=;
        b=XI5wEtdDlSzbpVFUP2N9/RpGFYOTAIMQETPXG9x5C6KEXwUq4nDONVPSid7t3Tq4WJ
         Y+tuvOMq25PF7MU6uS0T2ax6jlK+oxeUheLLfK3+pvyfH0WbolmCasr2gxGo9IJUNu34
         HoVriMo7ABpUxsYhh+pBns5V3qrQ71cGBM0HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726148876; x=1726753676;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dsth6Noo7k6lYDDpfXIP5Q/c2azbg2VnuQUgq1nBaw4=;
        b=MOfIWAhOURNg0EV8D0kmUfpj0Et8odwY8k9v6W+Zm6IR07o9GUnvSb597+ZD0VQKEg
         DXdhLH2aKBvAhhAlQSJsmIsWHkOZDaJviUh/bJg272u0QU8HRnU4AhaUMqJ994im/HBE
         mMTf9zB9KjM8o2e+ovUViHLroPHL+OeiGWy0G1n6kc07W8s8AsqyIh95kJLUGlq7hSDm
         ZpTPLl46HkaNXP+fHTYbNhyS3xOYLyD5BVjaGmrXAs1SxcnSVTk3EhcwUFhLeefFIbS5
         NkQQaLwYm0/qSNsvVXmCftgXj7J61KFJT/mbbsOI9z3pac32pkfnOmg96TMPmTor8VNG
         mScA==
X-Forwarded-Encrypted: i=1; AJvYcCW280eytDS2AnsXqEFwueMeMdA0rTNl7RSRX5rf7GkOnhkTUUUX3U3LtJ0Vc0cWIpECvWWhPkCecgA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwR/OFj+2zjkl745uRVSVFLY39AbzuTEpQCZwKGgzVuSM3G0j0t
	mf4GGhzjjOIG9W7LVhz5ndVo75lui5gpsdT6XRCw9BFa7qc7TnZStCFC8XMdOu8=
X-Google-Smtp-Source: AGHT+IHbyyzfck1kSCUvW20FVBU4ZOqHuCg3LPiPQkUmsc+dBzS1yoidHvSYrxRTIHPOT0+IQ4ivgg==
X-Received: by 2002:a05:6512:31cb:b0:52e:be1f:bf7f with SMTP id 2adb3069b0e04-53678fbf751mr1650479e87.27.1726148874993;
        Thu, 12 Sep 2024 06:47:54 -0700 (PDT)
Date: Thu, 12 Sep 2024 15:47:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 1/2] x86/time: introduce command line option to select
 wallclock
Message-ID: <ZuLxCXuxFbJq-rK_@macbook.local>
References: <20240912111514.26934-1-roger.pau@citrix.com>
 <20240912111514.26934-2-roger.pau@citrix.com>
 <51c8a98b-145c-4834-865c-b75b61f1d5b0@suse.com>
 <ZuLlF1PKSOmbqr8u@macbook.local>
 <ZuLs-htt3Kvw-M6A@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuLs-htt3Kvw-M6A@mail-itl>

On Thu, Sep 12, 2024 at 03:30:29PM +0200, Marek Marczykowski-Górecki wrote:
> On Thu, Sep 12, 2024 at 02:56:55PM +0200, Roger Pau Monné wrote:
> > On Thu, Sep 12, 2024 at 01:57:00PM +0200, Jan Beulich wrote:
> > > On 12.09.2024 13:15, Roger Pau Monne wrote:
> > > > --- a/xen/arch/x86/time.c
> > > > +++ b/xen/arch/x86/time.c
> > > > @@ -1552,6 +1552,35 @@ static const char *__init wallclock_type_to_string(void)
> > > >      return "";
> > > >  }
> > > >  
> > > > +static int __init cf_check parse_wallclock(const char *arg)
> > > > +{
> > > > +    if ( !arg )
> > > > +        return -EINVAL;
> > > > +
> > > > +    if ( !strcmp("auto", arg) )
> > > > +        wallclock_source = WALLCLOCK_UNSET;
> > > > +    else if ( !strcmp("xen", arg) )
> > > > +    {
> > > > +        if ( !xen_guest )
> > > > +            return -EINVAL;
> > > > +
> > > > +        wallclock_source = WALLCLOCK_XEN;
> > > > +    }
> > > > +    else if ( !strcmp("cmos", arg) )
> > > > +        wallclock_source = WALLCLOCK_CMOS;
> > > > +    else if ( !strcmp("efi", arg) )
> > > > +        /*
> > > > +         * Checking if run-time services are available must be done after
> > > > +         * command line parsing.
> > > > +         */
> > > > +        wallclock_source = WALLCLOCK_EFI;
> > > > +    else
> > > > +        return -EINVAL;
> > > > +
> > > > +    return 0;
> > > > +}
> > > > +custom_param("wallclock", parse_wallclock);
> > > > +
> > > >  static void __init probe_wallclock(void)
> > > >  {
> > > >      ASSERT(wallclock_source == WALLCLOCK_UNSET);
> > > > @@ -2527,7 +2556,15 @@ int __init init_xen_time(void)
> > > >  
> > > >      open_softirq(TIME_CALIBRATE_SOFTIRQ, local_time_calibration);
> > > >  
> > > > -    probe_wallclock();
> > > > +    /*
> > > > +     * EFI run time services can be disabled from the command line, hence the
> > > > +     * check for them cannot be done as part of the wallclock option parsing.
> > > > +     */
> > > > +    if ( wallclock_source == WALLCLOCK_EFI && !efi_enabled(EFI_RS) )
> > > > +        wallclock_source = WALLCLOCK_UNSET;
> > > > +
> > > > +    if ( wallclock_source == WALLCLOCK_UNSET )
> > > > +        probe_wallclock();
> > > 
> > > I don't want to stand in the way, and I can live with this form, so I'd like to
> > > ask that EFI folks or Andrew provide the necessary A-b / R-b. I'd like to note
> > > though that there continue to be quirks here. They may not be affecting the
> > > overall result as long as we have only three possible wallclocks, but there
> > > might be problems if a 4th one appeared.
> > > 
> > > With the EFI_RS check in the command line handler and assuming the default case
> > > of no "efi=no-rs" on the command line, EFI_RS may still end up being off by the
> > > time the command line is being parsed. With "wallclock=cmos wallclock=efi" this
> > > would result in no probing and "cmos" chosen if there was that check in place.
> > > With the logic as added here there will be probing in that case. Replace "cmos"
> > > by a hypothetical non-default 4th wallclock type (i.e. probing picking "cmos"),
> > > and I expect you can see how the result would then not necessarily be as
> > > expected.
> > 
> > My expectation would be that if "wallclock=cmos wallclock=efi" is used
> > the last option overrides any previous one, and hence if that last
> > option is not valid the logic will fallback to the default selection
> > (in this case to probing).
> 
> That would be my expectation too. If some kind of preference would be
> expected, it should looks like wallclock=efi,cmos, but I don't think we
> need that.
> 
> > Thinking about this, it might make sense to unconditionally set
> > wallclock_source = WALLCLOCK_UNSET at the start of parse_wallclock()
> > to avoid previous instances carrying over if later ones are not valid.
> 
> This may be a good idea. But more importantly, the behavior should be
> included in the option documentation (that if a selected value is not
> available, it fallback to auto). And maybe a log message when that
> happens (but I'm okay with skipping this one, as selected wallclock
> source is logged already)?

Thanks, would you be fine with:

### wallclock (x86)
> `= auto | xen | cmos | efi`

> Default: `auto`

Allow forcing the usage of a specific wallclock source.

 * `auto` let the hypervisor select the clocksource based on internal
   heuristics.

 * `xen` force usage of the Xen shared_info wallclock when booted as a Xen
   guest.  This option is only available if the hypervisor was compiled with
   `CONFIG_XEN_GUEST` enabled.

 * `cmos` force usage of the CMOS RTC wallclock.

 * `efi` force usage of the EFI_GET_TIME run-time method when booted from EFI
   firmware.

If the selected option is not available Xen will default to `auto`.

Regards, Roger.

