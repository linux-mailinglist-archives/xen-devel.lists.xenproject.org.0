Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 808DB96B983
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 12:59:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790144.1199852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnid-0001PS-N2; Wed, 04 Sep 2024 10:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790144.1199852; Wed, 04 Sep 2024 10:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnid-0001Nq-JP; Wed, 04 Sep 2024 10:58:35 +0000
Received: by outflank-mailman (input) for mailman id 790144;
 Wed, 04 Sep 2024 10:58:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MPF=QC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slnib-0001Nk-V7
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 10:58:33 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f95b816-6aac-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 12:58:31 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f502086419so17114871fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 03:58:31 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c26e8ddc3fsm1693605a12.25.2024.09.04.03.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 03:58:30 -0700 (PDT)
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
X-Inumbo-ID: 9f95b816-6aac-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725447511; x=1726052311; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2jmnF7b/sIPTXsuy0saRkiH/Cxfa+bhim7GtRG6OUTM=;
        b=u4jIQdZScpJoxcR155Movt3NWfcx/kcYpiyGdqZItQT8bkGvCx1a/pkiDnfL6dKKRy
         63d8bjB8YJkvsDohfcpZ6Z3c3+UDpnShpFaHUoE8ODRtZVxnH9HOGFVkBDsYFFSFGBjp
         hvGDuGqCdUDFQgDyYm4+6GuumMaaA4ovGK0Ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725447511; x=1726052311;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2jmnF7b/sIPTXsuy0saRkiH/Cxfa+bhim7GtRG6OUTM=;
        b=e2dy+Qdmni8k4H+0ewobDax0n8xk1GsQDa88Cl2K6CLO8uN35WV9TM3vwunDKrTmon
         8P40cqNf4tyEvM3ZZLLofMLjSE2vQyNJ1Gd7xmpga79p9yMJ7v4/FoznNEOTepbCrDSV
         fhtSZpicpZ5nmBapt3StCLO54NIk9kiIZHDsXgqkzr9uj4kvBBh0toqFGT4FilnWqIhi
         AmugdqWRvy7odwCtybUZfn3mLH3pgPVGRAhaSVubsozpEnxskgpKYpndtb1D/oGsjSMS
         ZEGujFhSNjOQXxvlay2UgQdVQDOJgTCsLiDtU2C7D9Kod4KLE2Fjn2TqTX6QffPISgzW
         FV1w==
X-Forwarded-Encrypted: i=1; AJvYcCW7otFGCiaVibTxTwF5rWHRvLhzIq/Pw7d5U5k5NGsdPkeAp0WmQJXleof41VbeiUWXvgWE4+irgAY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywh3h8sbl7aM/ND79K89QT/bk5FeLKhnGB9lgEXWxIL8qt9mWOn
	PZSGMxb4hF7m+h3BhfqBTY0k6WIC/ufvszCJJ0Cg6F/MZUXPWCaBostmfZER7to=
X-Google-Smtp-Source: AGHT+IGmaqHlHYUqEqa4GGdYdwMg0rL7KgT0c/gYk7c1OIxN75qxBxvxjC/MDZ4k7A/TatzLVbMyRA==
X-Received: by 2002:a05:651c:548:b0:2f5:a29:5a42 with SMTP id 38308e7fff4ca-2f64440db85mr52675731fa.14.1725447510276;
        Wed, 04 Sep 2024 03:58:30 -0700 (PDT)
Date: Wed, 4 Sep 2024 12:58:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 4/7] x86/time: introduce probing logic for the
 wallclock
Message-ID: <Ztg9VeXxdM2iBLOR@macbook.local>
References: <20240903130303.71334-1-roger.pau@citrix.com>
 <20240903130303.71334-5-roger.pau@citrix.com>
 <bc1bd23f-edf5-447a-9799-bca0a6cd696e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc1bd23f-edf5-447a-9799-bca0a6cd696e@suse.com>

On Tue, Sep 03, 2024 at 05:32:27PM +0200, Jan Beulich wrote:
> On 03.09.2024 15:03, Roger Pau Monne wrote:
> > Adding such probing allows to clearly separate init vs runtime code, and to
> > place the probing logic into the init section for the CMOS case.  Note both
> > the Xen shared_info page wallclock, and the EFI wallclock don't really have any
> > probing-specific logic.  The shared_info wallclock will always be there if
> > booted as a Xen guest, while the EFI_GET_TIME method probing relies on checking
> > if it returns a value different than 0.
> > 
> > The panic message printed when Xen is unable to find a viable wallclock source
> > has been adjusted slightly, I believe the printed guidance still provides the
> > same amount of information to the user.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Looks a little involved, but I'm largely fine with it; just a couple of
> more or less cosmetic remarks:
> 
> > @@ -1329,28 +1338,13 @@ static bool cmos_probe(struct rtc_time *rtc_p, bool cmos_rtc_probe)
> >      return false;
> >  }
> >  
> > -static unsigned long get_cmos_time(void)
> > +
> > +static unsigned long cmos_read(void)
> >  {
> > -    unsigned long res;
> >      struct rtc_time rtc;
> > -    static bool __read_mostly cmos_rtc_probe;
> > -    boolean_param("cmos-rtc-probe", cmos_rtc_probe);
> > +    bool success = __get_cmos_time(&rtc);
> >  
> > -    if ( efi_enabled(EFI_RS) )
> > -    {
> > -        res = efi_get_time();
> > -        if ( res )
> > -            return res;
> > -    }
> > -
> > -    if ( likely(!(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC)) )
> > -        cmos_rtc_probe = false;
> > -    else if ( system_state < SYS_STATE_smp_boot && !cmos_rtc_probe )
> > -        panic("System with no CMOS RTC advertised must be booted from EFI"
> > -              " (or with command line option \"cmos-rtc-probe\")\n");
> > -
> > -    if ( !cmos_probe(&rtc, cmos_rtc_probe) )
> > -        panic("No CMOS RTC found - system must be booted from EFI\n");
> > +    ASSERT(success);
> 
> I'm not convinced of this assertion: It's either too much (compared to
> what we had so far) or not enough, considering the behavior ...
> 
> >      return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
> >  }
> 
> ... with a release build.

My reasoning was that on a debug build we want to spot any such
issues (as it's likely a symptom the RTC is misbehaving?) but on a release
build we should rather return an incorrect wallclock time rather than
panicking.  I can remove the ASSERT and local variable altogether if
you prefer.

> 
> > @@ -1533,12 +1527,82 @@ void rtc_guest_write(unsigned int port, unsigned int data)
> >      }
> >  }
> >  
> > -static unsigned long get_wallclock_time(void)
> > +static enum {
> > +    WALLCLOCK_UNSET,
> > +    WALLCLOCK_XEN,
> > +    WALLCLOCK_CMOS,
> > +    WALLCLOCK_EFI,
> > +} wallclock_source __ro_after_init;
> > +
> > +static const char *wallclock_type_to_string(void)
> 
> __init ?
> 
> >  {
> > +    switch ( wallclock_source )
> > +    {
> > +    case WALLCLOCK_XEN:
> > +        return "XEN";
> > +
> > +    case WALLCLOCK_CMOS:
> > +        return "CMOS RTC";
> > +
> > +    case WALLCLOCK_EFI:
> > +        return "EFI";
> > +
> > +    case WALLCLOCK_UNSET:
> > +        return "UNSET";
> > +    }
> > +
> > +    ASSERT_UNREACHABLE();
> > +    return "";
> > +}
> > +
> > +static void __init probe_wallclock(void)
> > +{
> > +    ASSERT(wallclock_source == WALLCLOCK_UNSET);
> > +
> >      if ( xen_guest )
> > +    {
> > +        wallclock_source = WALLCLOCK_XEN;
> > +        return;
> > +    }
> > +    if ( efi_enabled(EFI_RS) && efi_get_time() )
> > +    {
> > +        wallclock_source = WALLCLOCK_EFI;
> > +        return;
> > +    }
> > +    if ( cmos_probe() )
> > +    {
> > +        wallclock_source = WALLCLOCK_CMOS;
> > +        return;
> > +    }
> > +
> > +    panic("No usable wallclock found, probed:%s%s%s\n%s",
> > +          !cmos_rtc_probe && !efi_enabled(EFI_RS) ? " None" : "",
> > +          cmos_rtc_probe ? " CMOS" : "",
> > +          efi_enabled(EFI_RS) ? " EFI" : "",
> > +          !cmos_rtc_probe ? "Try with command line option \"cmos-rtc-probe\"\n"
> > +           : !efi_enabled(EFI_RS) ? "System must be booted from EFI\n" : "");
> 
> This last argument is sufficiently complex that I think it is pretty
> important for the question marks and colons to respectively align with
> one another, even if this may mean one or two more lines of code.

I had it that way originally, but then it seemed the extra
indentation made it less readable.  Will see how can I adjust it, my
preference would be for:

    panic("No usable wallclock found, probed:%s%s%s\n%s",
          !cmos_rtc_probe && !efi_enabled(EFI_RS) ? " None" : "",
          cmos_rtc_probe ? " CMOS" : "",
          efi_enabled(EFI_RS) ? " EFI" : "",
          !cmos_rtc_probe ? "Try with command line option \"cmos-rtc-probe\"\n"
                          : !efi_enabled(EFI_RS) ? "System must be booted from EFI\n"
                                                 : "");

But that exceeds the 80 columns limit.

Thanks, Roger.

