Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB13996B740
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 11:46:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789984.1199668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slmaZ-0000IG-Js; Wed, 04 Sep 2024 09:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789984.1199668; Wed, 04 Sep 2024 09:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slmaZ-0000G3-Gd; Wed, 04 Sep 2024 09:46:11 +0000
Received: by outflank-mailman (input) for mailman id 789984;
 Wed, 04 Sep 2024 09:46:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MPF=QC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slmaX-0000Fx-LU
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 09:46:09 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f6b528d-6aa2-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 11:46:02 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-374c84dcc64so2280297f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 02:46:02 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891a3dbdsm785108066b.131.2024.09.04.02.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 02:46:01 -0700 (PDT)
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
X-Inumbo-ID: 7f6b528d-6aa2-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725443162; x=1726047962; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KyTEStuT38cFKjEq9cfUmiJsjims6G2/+SOilZnu+4M=;
        b=Rh5AEqrcRcXlV457ZLWMJT6LYJRkbpCjurZDWahZGaHv7x3ezgsFsdL7ib/zO0PKYx
         7yAHaZjRdDVpWfh5L6muppowJ4aRINDHH7ipMDdUeMkJXrMs9QWih1Vkvu89pAX1zmLL
         NAncyrE1XlQNIWTPgiHixeAfkzK75ulZ0IcRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725443162; x=1726047962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyTEStuT38cFKjEq9cfUmiJsjims6G2/+SOilZnu+4M=;
        b=xRn0hRnfnDixR08srhbYZUfDecfkonhl1Odr6usqnrLv9/San7nmKIriVJ2SQ1U2iQ
         tS1zGs+g/9qT4UM4LtnApQQWwdAvLrnmC5Q48EE2Y3hM450rp7ptgb2aN2U8T9LJ485V
         mUQzU1Df2W32CBqxxioObx+uZVuWa86+y/FUNpBEDgre4MLx2/EwkKfxTKhV7MCwpbKu
         d3kTcQ8g591OGfWratrDgSbPuJTUn8QBRRROrf+AA9wYXf1YzUmHT3oKcou8v1m0o4Lo
         uQj6bb3qFbrMbgw2zKVBJVoCq1T8oOc7mq3W7SHG1pSoGkWdo+mSeE1B00NChNbiw/cV
         /uDA==
X-Forwarded-Encrypted: i=1; AJvYcCX2KcuggsL9eqqQuP65X32ndsWlIag+vzMdVwidfa7wV9jfg1VCuUwBe4lK1QvZU8XA0D7iZJSEwNc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBmQBQlMk4tFQmCsmfY9+fNscmRUiLiGGq4MT0m+Q69iO6F3//
	Ws5KmzWuHuQwqVq8WIsh4Q5Zg156p2pDpad3ozGm7jGsNCBNf2wbIDJxqjsCUYuF3/pbD8pDeyy
	N
X-Google-Smtp-Source: AGHT+IFR431Z8hIOyhXIXrUk6fyRNFQKs7S2DF9qjb5emyVKTldQTbPk18rAMBSyIjZLfBeIcHW1/Q==
X-Received: by 2002:a05:6000:4014:b0:374:d07a:c136 with SMTP id ffacd0b85a97d-374d07ac2f2mr8226266f8f.36.1725443161917;
        Wed, 04 Sep 2024 02:46:01 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:46:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/7] x86/time: move CMOS edge detection into read
 helper
Message-ID: <ZtgsWN0O8guwNSVd@macbook.local>
References: <20240903130303.71334-1-roger.pau@citrix.com>
 <20240903130303.71334-3-roger.pau@citrix.com>
 <5695338e-3543-4611-a6a4-0b42e0727e1d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5695338e-3543-4611-a6a4-0b42e0727e1d@suse.com>

On Tue, Sep 03, 2024 at 05:02:21PM +0200, Jan Beulich wrote:
> On 03.09.2024 15:02, Roger Pau Monne wrote:
> > Move the logic that ensures the CMOS RTC data is read just after it's been
> > updated into the __get_cmos_time() function that does the register reads.  This
> > requires returning a boolean from __get_cmos_time() to signal whether the read
> > has been successfully performed after an update.
> 
> Considering the limited use of both function, that's probably fine a change
> to make, despite me otherwise thinking that this is the slightly wrong move.
> I'd generally expect __get_cmos_time() to be usable without that checking,
> so long as the results are interpreted appropriately.

I've expanded the commit message a bit to reflect what you mention
here.

> > --- a/xen/arch/x86/time.c
> > +++ b/xen/arch/x86/time.c
> > @@ -1247,8 +1247,26 @@ struct rtc_time {
> >      unsigned int year, mon, day, hour, min, sec;
> >  };
> >  
> > -static void __get_cmos_time(struct rtc_time *rtc)
> > +static bool __get_cmos_time(struct rtc_time *rtc)
> >  {
> > +    s_time_t start, t1, t2;
> > +    unsigned long flags;
> > +
> > +    spin_lock_irqsave(&rtc_lock, flags);
> > +
> > +    /* read RTC exactly on falling edge of update flag */
> > +    start = NOW();
> > +    do { /* may take up to 1 second... */
> > +        t1 = NOW() - start;
> > +    } while ( !(CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) &&
> > +              t1 <= SECONDS(1) );
> > +
> > +    start = NOW();
> > +    do { /* must try at least 2.228 ms */
> > +        t2 = NOW() - start;
> > +    } while ( (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) &&
> > +              t2 < MILLISECS(3) );
> > +
> >      rtc->sec  = CMOS_READ(RTC_SECONDS);
> >      rtc->min  = CMOS_READ(RTC_MINUTES);
> >      rtc->hour = CMOS_READ(RTC_HOURS);
> > @@ -1268,11 +1286,15 @@ static void __get_cmos_time(struct rtc_time *rtc)
> >  
> >      if ( (rtc->year += 1900) < 1970 )
> >          rtc->year += 100;
> > +
> > +    spin_unlock_irqrestore(&rtc_lock, flags);
> 
> Imo this unlock wants placing at least ahead of the if() in context. The
> lock needs to protect only the port accesses, not any of the calculations.

I could even cache the value of CMOS_READ(RTC_CONTROL) ahead of the
check, so that the drop could be dropped earlier, but I'm not going to
do it here.

Thanks, Roger.

