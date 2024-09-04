Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1D296B6A9
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 11:30:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789950.1199617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slmKR-0002rD-4X; Wed, 04 Sep 2024 09:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789950.1199617; Wed, 04 Sep 2024 09:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slmKR-0002p2-1v; Wed, 04 Sep 2024 09:29:31 +0000
Received: by outflank-mailman (input) for mailman id 789950;
 Wed, 04 Sep 2024 09:29:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MPF=QC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slmKQ-0002ow-2f
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 09:29:30 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e92d131-6aa0-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 11:29:28 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f4f24263acso95253311fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 02:29:28 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb767sm791870666b.16.2024.09.04.02.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 02:29:26 -0700 (PDT)
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
X-Inumbo-ID: 2e92d131-6aa0-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725442167; x=1726046967; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r2UzjK1zw/Jht3hYXbbjM1MjuJ9AfdWkfAQesnj/eUE=;
        b=M8H+l2mSKLl5BEOJkYcRflfF2DUPRM9R3+1TkqJFDpfkIRcXucmp9H5Xf3TUaPwVzF
         4L7XlFlp000WWJxTnANkk9rcMJv3j7pEzGsP1r2V3RVn0C8S+fTRcS7pLX/18M72L8JB
         cFMgGL7MBxY23eKWJEPZWV80JSMpKoig+Hcw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725442167; x=1726046967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2UzjK1zw/Jht3hYXbbjM1MjuJ9AfdWkfAQesnj/eUE=;
        b=wDauMggN4QSsC90kKqV59+Yct8M2e1nXLmxfQ4mZIpU2YgyU8m5yR1Z1Oh2I2Ahztt
         WHeqpdwg1JPhiriZGZiG7i6zjbYT3jWgSBDfcTyalgOVdvDIgs7aKR7Gec7QuqHM5ZqA
         LZ3UiPacA+GDWCQY3r99y/rbLPDTBwJTyDZc1YRyjm9hkSrUANeDC1QByjsy47puRnM9
         Njs5VBnnJKrOZhwGf4OHgdWSOtE9jbCPKpZx1CbEHBQYAtQTK3Y93ZPQozADI3jRsGVs
         MPsySUfj+nVSZgXUtahgc7Z5jC5qEgRWnBewHvsjucqtR/K2MObEA62Do+eOoMxiEMmX
         Rl4g==
X-Forwarded-Encrypted: i=1; AJvYcCUynCLC3I9dEf2k0LqlqCW5MDbGF11FNLp6OWKw14bLl1nOQQ9pfLctfx8LUEsFeVEQqqHsHTuEypw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrhsSIr8xzOwqgHpg7IVqP14sEHTOCiDJAstdKUvwxR3T5W+X6
	ayyuUB9T08QEp4i9FriSdHt/+WtjmeaQmYdu14yd0NGtPuMGVD5OHCGmlUZN/ps=
X-Google-Smtp-Source: AGHT+IHZFjLeVnZo7MX+A/DtCi+jMyXoJ563aTB/1NiH6nC+MDSD801luwkobjFjLlJEMIv33goA7g==
X-Received: by 2002:a2e:bc19:0:b0:2f5:966:c22e with SMTP id 38308e7fff4ca-2f6105d74e3mr194966491fa.11.1725442166528;
        Wed, 04 Sep 2024 02:29:26 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:29:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/7] x86/time: introduce helper to fetch Xen wallclock
 when running as a guest
Message-ID: <ZtgodW4MrFpy40jj@macbook.local>
References: <20240903130303.71334-1-roger.pau@citrix.com>
 <20240903130303.71334-2-roger.pau@citrix.com>
 <3788d706-7000-4382-b162-f25fa595144a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3788d706-7000-4382-b162-f25fa595144a@suse.com>

On Tue, Sep 03, 2024 at 04:48:41PM +0200, Jan Beulich wrote:
> On 03.09.2024 15:02, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/time.c
> > +++ b/xen/arch/x86/time.c
> > @@ -785,6 +785,31 @@ static struct platform_timesource __initdata_cf_clobber plt_xen_timer =
> >      .resume = resume_xen_timer,
> >      .counter_bits = 63,
> >  };
> > +
> > +static unsigned long read_xen_wallclock(void)
> > +{
> > +    struct shared_info *sh_info = XEN_shared_info;
> > +    uint32_t wc_version;
> > +    uint64_t wc_sec;
> > +
> > +    ASSERT(xen_guest);
> > +
> > +    do {
> > +        wc_version = sh_info->wc_version & ~1;
> > +        smp_rmb();
> > +
> > +        wc_sec  = sh_info->wc_sec;
> > +        smp_rmb();
> > +    } while ( wc_version != sh_info->wc_version );
> > +
> > +    return wc_sec + read_xen_timer() / 1000000000;
> > +}
> > +#else
> > +static unsigned long read_xen_wallclock(void)
> > +{
> > +    ASSERT_UNREACHABLE();
> > +    return 0;
> > +}
> >  #endif
> 
> I understand you try to re-use an existing #ifdef here, but I wonder if I
> could talk you into not doing so and instead placing the #ifdef inside the
> (then single) function body. Less redundancy, less room for mistakes /
> oversights.

I don't mind much, I've assumed reducing the number of #ifdefs blocks
was better, but I don't have a strong opinion.  Initially I just kept
the #ifdef block in get_wallclock_time().

Thanks, Roger.

