Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3D496B8F1
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 12:48:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790125.1199837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnYs-0007GI-Ox; Wed, 04 Sep 2024 10:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790125.1199837; Wed, 04 Sep 2024 10:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnYs-0007Df-Lo; Wed, 04 Sep 2024 10:48:30 +0000
Received: by outflank-mailman (input) for mailman id 790125;
 Wed, 04 Sep 2024 10:48:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MPF=QC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slnYr-0007DZ-Qa
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 10:48:29 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 378b16d7-6aab-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 12:48:27 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f50ca18a13so77355631fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 03:48:27 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891a3e9dsm791091066b.108.2024.09.04.03.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 03:48:25 -0700 (PDT)
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
X-Inumbo-ID: 378b16d7-6aab-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725446907; x=1726051707; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vDspBjf+r4xJ+vURVBeS2PCHg3tLf7coVgu49jNdPMA=;
        b=LGUkJ0ojno8PdjZgogIWwAQpCYEXVScgoKsHqJT3xtHdmg1fqgKb6Z5Lr4hCTd7tMA
         qMiicAM72VyR+p12uJXLdBLbW9jSS/pzDGeDD2+TMFvvl0tTj3fSKcHREkXrMZKDCch3
         2iOhSUVUM/ByURI06e45WTStLlsoggltWQwwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725446907; x=1726051707;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vDspBjf+r4xJ+vURVBeS2PCHg3tLf7coVgu49jNdPMA=;
        b=gz9aP44/YxcJm+oIdCpdYsD0ZRSV2A16UtEUONgxiMl3ZdbbI9Rt7b+a0BKfwWT5AG
         NgcJvtR2js41gjORHln3cOsTbMB4u57beoq0uD8W6z7NYAPH8IZCxgKppKUQmOLe0YEC
         aYQHI9vwnyYTyYZPoOmVBbyPLjwGXcJtr0gx5PerWpOxn1cSsIsL5Uf90usYklNoluSZ
         /TsLusEZSYB65q8VnbyQ5ZxlWwyEODUXmwHUVR668RWq6Od/jKhkw/w9grEej6ns7rco
         Z5XW/zRh8eKbgrKAoWRRYEz+XCGSik1xNL7KPYqtgDv8TK0NW6h2GkV1Rl2ZORm75vQd
         /BGg==
X-Forwarded-Encrypted: i=1; AJvYcCXmRjgAd40aLk8BLMpe3QkEldXKpMaQlCeHKYXqH7eeu63K/kXFdjVURV2AyLKOdBjkuwFGbvjUsvA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwS3CHCzyjVQNVeYvslOz6LpC2GTp0QUjfj494kZ9jEWVdLjScI
	Dw7QrIXvaOi1GDYiYOoCRfq83ppfGiq7SRb40dSLOm5ya7llvRxVVX4DZLxUFAQ=
X-Google-Smtp-Source: AGHT+IEqS5mi0IeCpj7LZeP4f/VnoTQ0EPMsSuZ7vxcoNuB8qVbefJFJS01yYQpXTeq75+HR7WuWdw==
X-Received: by 2002:a05:6512:10c6:b0:52e:767a:ada7 with SMTP id 2adb3069b0e04-53546b9b1d1mr11293290e87.50.1725446906119;
        Wed, 04 Sep 2024 03:48:26 -0700 (PDT)
Date: Wed, 4 Sep 2024 12:48:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/7] x86/time: split CMOS read and probe logic into
 function
Message-ID: <Ztg6-WDTvX0a3Qk3@macbook.local>
References: <20240903130303.71334-1-roger.pau@citrix.com>
 <20240903130303.71334-4-roger.pau@citrix.com>
 <077fcf8f-3179-4615-b2d1-69fa9c4d7e56@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <077fcf8f-3179-4615-b2d1-69fa9c4d7e56@suse.com>

On Tue, Sep 03, 2024 at 05:16:44PM +0200, Jan Beulich wrote:
> On 03.09.2024 15:02, Roger Pau Monne wrote:
> > The current logic to probe for the CMOS RTC is open-coded in get_cmos_time(),
> > move it to a separate function that both serves the purpose of testing for the
> > CMOS RTC existence and returning its value.
> > 
> > The goal is to be able to split the probing and the reading logic into separate
> > helpers, and putting the current logic in a separate function helps simplifying
> > further changes.
> > 
> > A transient *rtc_p variable is introduced as a parameter to the function, that
> > will be removed by further changes.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> This looks like a straight transformation, except - as noted before - for ...
> 
> > --- a/xen/arch/x86/time.c
> > +++ b/xen/arch/x86/time.c
> > @@ -1292,45 +1292,32 @@ static bool __get_cmos_time(struct rtc_time *rtc)
> >      return t1 <= SECONDS(1) && t2 < MILLISECS(3);
> >  }
> >  
> > -static unsigned long get_cmos_time(void)
> > +static bool cmos_probe(struct rtc_time *rtc_p, bool cmos_rtc_probe)
> >  {
> > -    unsigned long res;
> > -    struct rtc_time rtc;
> >      unsigned int seconds = 60;
> > -    static bool __read_mostly cmos_rtc_probe;
> > -    boolean_param("cmos-rtc-probe", cmos_rtc_probe);
> > -
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
> >  
> >      for ( ; ; )
> >      {
> > -        bool success = __get_cmos_time(&rtc);
> > +        bool success = __get_cmos_time(rtc_p);
> > +        struct rtc_time rtc = *rtc_p;
> >  
> > -        if ( likely(!cmos_rtc_probe) || !success ||
> > +        if ( likely(!cmos_rtc_probe) )
> > +            return true;
> > +
> > +        if ( !success ||
> >               rtc.sec >= 60 || rtc.min >= 60 || rtc.hour >= 24 ||
> >               !rtc.day || rtc.day > 31 ||
> >               !rtc.mon || rtc.mon > 12 )
> > -            break;
> > +            return false;
> >  
> >          if ( seconds < 60 )
> >          {
> >              if ( rtc.sec != seconds )
> >              {
> > -                cmos_rtc_probe = false;
> 
> ... the removal of this line. As asked for before, can the somewhat sub-optimal
> new behavior (with the static, which now lives in another function, being
> cleared only the next time round) please be at least mentioned in the
> description?

Sure, sorry I've failed to do this here.  Such weird behavior is
transient, and will go away wit the next patch IIRC, once the probing
is properly split from the run-time reading of the CMOS RTC.

> >                  acpi_gbl_FADT.boot_flags &= ~ACPI_FADT_NO_CMOS_RTC;
> > +                return true;
> >              }
> > -            break;
> > +            return false;
> >          }
> >  
> >          process_pending_softirqs();
> > @@ -1338,7 +1325,31 @@ static unsigned long get_cmos_time(void)
> >          seconds = rtc.sec;
> >      }
> >  
> > -    if ( unlikely(cmos_rtc_probe) )
> > +    ASSERT_UNREACHABLE();
> > +    return false;
> > +}
> > +
> > +static unsigned long get_cmos_time(void)
> > +{
> > +    unsigned long res;
> > +    struct rtc_time rtc;
> > +    static bool __read_mostly cmos_rtc_probe;
> > +    boolean_param("cmos-rtc-probe", cmos_rtc_probe);
> > +
> > +    if ( efi_enabled(EFI_RS) )
> > +    {
> > +        res = efi_get_time();
> > +        if ( res )
> > +            return res;
> > +    }
> > +
> > +    if ( likely(!(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC)) )
> > +        cmos_rtc_probe = false;
> > +    else if ( system_state < SYS_STATE_smp_boot && !cmos_rtc_probe )
> > +        panic("System with no CMOS RTC advertised must be booted from EFI"
> > +              " (or with command line option \"cmos-rtc-probe\")\n");
> > +
> > +    if ( !cmos_probe(&rtc, cmos_rtc_probe) )
> >          panic("No CMOS RTC found - system must be booted from EFI\n");
> >  
> >      return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
> 
> Having seen the series up to here (and already by the previous patch) I think
> I see now where we disagree about the conditional-ness of the probing: I
> suppose you deem only the 2nd and possible subsequent iterations of the loop
> in (now) cmos_probe() as "probing", whereas I consider all of what that
> function now contains as exactly that.
> 
> The difference is becoming more pronounced with the subsequent change of
> preferring CMOS over EFI time: With EFI (with or without ACPI) there never
> was a guarantee that a CMOS clock would exist. Prior to the introduction of
> the ACPI_FADT_NO_CMOS_RTC flag the was a de-facto guarantee that PC-like
> systems would have one. And vendors abusing the flag made us probe, despite
> the port accesses being problematic until we know there actually is a CMOS
> (RTC) there. Hence why I was suggesting that there be a way to bypass the
> CMOS accesses altogether at least when booted from EFI (as is the case
> right now, just without the need for any user override).

With further patches you could use wallclock=efi in order to bypass
any probing of the CMOS.

Also note that the current logic here still keeps the reading of the
CMOS limited to when ACPI_FADT_NO_CMOS_RTC is not set or when
cmos-rtc-probe is present on the command line.

Thanks, Roger.

