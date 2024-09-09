Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C338971616
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 13:03:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794281.1203097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sncAb-0007L1-0K; Mon, 09 Sep 2024 11:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794281.1203097; Mon, 09 Sep 2024 11:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sncAa-0007JV-Ro; Mon, 09 Sep 2024 11:02:56 +0000
Received: by outflank-mailman (input) for mailman id 794281;
 Mon, 09 Sep 2024 11:02:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnCw=QH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sncAY-0007JP-RN
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 11:02:54 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f35e9f1-6e9b-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 13:02:52 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8d4979b843so179926966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 04:02:52 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ced17asm328915766b.170.2024.09.09.04.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 04:02:51 -0700 (PDT)
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
X-Inumbo-ID: 0f35e9f1-6e9b-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725879772; x=1726484572; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uzrt6NH22Q/60sNv5qJFHAzFsiPQUajoypNRKceWd04=;
        b=oFA3+z6cMF0E/dmAo9o+81V6U8FjIM5Hi1xSct4SS95BG5bRCN5++tlNA5P0omrKRE
         ez/AvjEPdmHzDH9PfB+vVU3AaQ5BdFBq/fbVLPFvxC+yiKOg3F14STENiF88DkPKrYV1
         NXdXmCIyLPz+Y28d4T0E7BlJZUYrbiJvf0B2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879772; x=1726484572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzrt6NH22Q/60sNv5qJFHAzFsiPQUajoypNRKceWd04=;
        b=TMN9XKQcv6iu7TGee7vGnSm7cKQuaKd0mCA69m2bV4PvXdD6AfRVRlZ4Vt3sgwBEEL
         Td12ct4kFRsRXVlG9y1e3catYa0iuWKgWZdZaytm2twbJXpeEdmUfUnOdPPqx7n6fLFh
         D+7CuAzW+8xxvHWQa8EjiGToDyhWv5d8CqABDNhMNo/5qElv8lPQ18EWbAVaihHfgLkH
         Lc/0fkNnqPhI173b+O7OI1uoycAT/72vGrMKkjtK6Sxfh7xUBF9r94ql7auR2XAtNXCC
         ch3h7Po/5E5AINPfZrO2/tKN4/DIjEjFo3l8XNPJxrOXUWO7rD4mboh1YY86pcURu/v9
         QkXg==
X-Forwarded-Encrypted: i=1; AJvYcCWUrRFS8pM+nNnjaTNTo6x+A+g+CymxgEi9oXm9kfAX/D9L5L+Qva6kdnB0BM0bOYZ1Qax+NCXGQ9M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywc4P09U42mOeI2gn+JR3NiK/Bn/HLmy46dI3VDRWMM0N2S0a3A
	y0oPMNKNhfeiOrTETruSR5nIV9xOM0PP3IdKIiPqZA3fHPbLRYtfX6lVrZI0PXs=
X-Google-Smtp-Source: AGHT+IGb4+dncTFaUQKSLCtb0zu2TB99hewA5BOt8QCK4E845ngtG4s74T5m1SBetMgui5xaYJQ+ng==
X-Received: by 2002:a17:907:9606:b0:a86:9ba1:639e with SMTP id a640c23a62f3a-a8a885fb742mr1101360866b.26.1725879771596;
        Mon, 09 Sep 2024 04:02:51 -0700 (PDT)
Date: Mon, 9 Sep 2024 13:02:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 4/6] x86/time: introduce probing logic for the
 wallclock
Message-ID: <Zt7V2mKWlETVLKVZ@macbook.local>
References: <20240904153151.83995-1-roger.pau@citrix.com>
 <20240904153151.83995-5-roger.pau@citrix.com>
 <af5ce242-1ec9-4ccc-a531-2252b2d8c90d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <af5ce242-1ec9-4ccc-a531-2252b2d8c90d@suse.com>

On Thu, Sep 05, 2024 at 05:58:47PM +0200, Jan Beulich wrote:
> On 04.09.2024 17:31, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/time.c
> > +++ b/xen/arch/x86/time.c
> > @@ -1291,14 +1291,23 @@ static bool __get_cmos_time(struct rtc_time *rtc)
> >      return t1 <= SECONDS(1) && t2 < MILLISECS(3);
> >  }
> >  
> > -static bool cmos_probe(struct rtc_time *rtc_p, bool cmos_rtc_probe)
> > +static bool __initdata cmos_rtc_probe;
> > +boolean_param("cmos-rtc-probe", cmos_rtc_probe);
> > +
> > +static bool __init cmos_probe(void)
> 
> I'm sorry for not paying attention to this earlier, but "cmos" alone
> is misleading here and perhaps even more so for cmos_read(). These
> aren't about the CMOS (storage) but the CMOS RTC. May I suggest
> cmos_rtc_{probe,read}() instead?

I've assumed that those living in time.c would be clear enough it's
the CMOS RTC, but I'm fine with renaming to cmos_rtc_{probe,read}().

> 
> >  {
> >      unsigned int seconds = 60;
> >  
> > +    if ( !(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) )
> > +        return true;
> > +
> > +    if ( !cmos_rtc_probe )
> > +        return false;
> 
> With this I think ...
> 
> >      for ( ; ; )
> >      {
> > -        bool success = __get_cmos_time(rtc_p);
> > -        struct rtc_time rtc = *rtc_p;
> > +        struct rtc_time rtc;
> > +        bool success = __get_cmos_time(&rtc);
> >  
> >          if ( likely(!cmos_rtc_probe) )
> >              return true;
> 
> ... this ends up being dead code.

Indeed, I've missed to remove that one when moving the check outside
of the for loop.

Thanks, Roger.

