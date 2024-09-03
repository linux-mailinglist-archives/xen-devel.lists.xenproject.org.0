Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F091969754
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 10:38:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788839.1198325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slP3h-0001P3-1s; Tue, 03 Sep 2024 08:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788839.1198325; Tue, 03 Sep 2024 08:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slP3g-0001Ml-V7; Tue, 03 Sep 2024 08:38:40 +0000
Received: by outflank-mailman (input) for mailman id 788839;
 Tue, 03 Sep 2024 08:38:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxvv=QB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slP3f-0001Mb-BE
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 08:38:39 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea727f57-69cf-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 10:38:38 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53351642021so5419420e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 01:38:38 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb9c6sm655450566b.24.2024.09.03.01.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 01:38:36 -0700 (PDT)
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
X-Inumbo-ID: ea727f57-69cf-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725352718; x=1725957518; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9qJuXGFdraj5+5jOpOZx6sb3mmZpDh493zWYm9lQzAE=;
        b=NYOSSRcXIwBPrQa0zfYpJ52l4DSLKvD88ufwqnVPVDGEv1+afpCYKX02XTznuysfKK
         cx7L3ycwS713pC1NkVhGSGkHMTOPqa3VH8NbYjWnLLLe0VpBiJy6j4F4nO+mQVHoIFtD
         X1rJO07VDf1o9yH5tzNY/7egJBVPLAIkJiWuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725352718; x=1725957518;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9qJuXGFdraj5+5jOpOZx6sb3mmZpDh493zWYm9lQzAE=;
        b=MD1R5XO2VQQwavp41BJeIss6rgxCFbHc1cMJwJRom/teWNRA04Efq63iUu9HbDUkMw
         2Vjnjyy0QYYI+5v62krYf6022kMO+Y8K746UnGUbf5bIJYpp7t7+cxazk6WqFmQv0shg
         TrdPuwCvc5hEPd4vFYrxgzd+c+VdYHbL/aHNJr+qjNAbzvX5fLQ1pPTDr/mSGr+3niIU
         2UFgj6THbLppEW4TK0V0ehNOU7yvJTBhtubScOz/okqhMtf6qhpRATyWABVyHZ4IVRhR
         Ne/8uosu374paOtvWGlNPBRDd6+wIn1qZINdhRb7yuuY/yVfyzx9+BGVRKINfj48BJP4
         jPJA==
X-Forwarded-Encrypted: i=1; AJvYcCVkZAvB4YABOVNIGb9N6R7I8IJuob0dZJikrbq837/bftJ7IO1ljf2vUY9AnrxRW8SvgaCj1UfhFoQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4XB84i7FmH/idefDlR1kljEzIiK8HUxt41DMfSqPLW7uAZgFk
	akKLPA7xWcvAiEon2oNq4+SoNN80qj7tfPB2bSK8cpS7WkUvBDnLHlDwFeG+XPcWrbq/M4pRZjs
	q
X-Google-Smtp-Source: AGHT+IEQySiDqnfeK/usmcSk87jRXqjCashuS/6jCSy9J8coy2V0+YFwFJf7v898U4IOkbMpQSvLrQ==
X-Received: by 2002:a05:6512:68c:b0:530:c1fb:51a1 with SMTP id 2adb3069b0e04-53546aff14dmr8519091e87.17.1725352717193;
        Tue, 03 Sep 2024 01:38:37 -0700 (PDT)
Date: Tue, 3 Sep 2024 10:38:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] x86/time: split CMOS time fetching into wrapper
Message-ID: <ZtbLC1Yz6drguz9F@macbook.local>
References: <20240830095220.49473-1-roger.pau@citrix.com>
 <20240830095220.49473-2-roger.pau@citrix.com>
 <f193e088-18fb-4e68-a935-720cc65f3947@suse.com>
 <Zta8QLwmHcBWyJd6@macbook.local>
 <d7cfa284-f764-46a0-ac2e-e5f928a043ad@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7cfa284-f764-46a0-ac2e-e5f928a043ad@suse.com>

On Tue, Sep 03, 2024 at 09:53:47AM +0200, Jan Beulich wrote:
> On 03.09.2024 09:35, Roger Pau Monné wrote:
> > On Tue, Sep 03, 2024 at 08:24:18AM +0200, Jan Beulich wrote:
> >> On 30.08.2024 11:52, Roger Pau Monne wrote:
> >>> @@ -1285,33 +1270,56 @@ static unsigned long get_cmos_time(void)
> >>>          } while ( (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) &&
> >>>                    t2 < MILLISECS(3) );
> >>>  
> >>> -        __get_cmos_time(&rtc);
> >>> +        __get_cmos_time(rtc);
> >>>  
> >>>          spin_unlock_irqrestore(&rtc_lock, flags);
> >>>  
> >>> -        if ( likely(!cmos_rtc_probe) ||
> >>> -             t1 > SECONDS(1) || t2 >= MILLISECS(3) ||
> >>> -             rtc.sec >= 60 || rtc.min >= 60 || rtc.hour >= 24 ||
> >>> -             !rtc.day || rtc.day > 31 ||
> >>> -             !rtc.mon || rtc.mon > 12 )
> >>> -            break;
> >>> +        if ( likely(!cmos_rtc_probe) )
> >>> +            return true;
> >>> +
> >>> +        if ( t1 > SECONDS(1) || t2 >= MILLISECS(3) ||
> >>> +             rtc->sec >= 60 || rtc->min >= 60 || rtc->hour >= 24 ||
> >>> +             !rtc->day || rtc->day > 31 ||
> >>> +             !rtc->mon || rtc->mon > 12 )
> >>> +            return false;
> >>>  
> >>>          if ( seconds < 60 )
> >>>          {
> >>> -            if ( rtc.sec != seconds )
> >>> -            {
> >>> -                cmos_rtc_probe = false;
> >>
> >> This clearing of the variable is lost, which looks wrong to me.
> > 
> > Note the code in get_cmos_time() is modified, so the variable is no
> > longer used past the call to read_cmos_time().  Instead the signaling
> > of whether the CMOS is functional or not is done using the return
> > value of the newly introduced read_cmos_time() function.
> 
> I wasn't concerned of the further processing on the 1st invocation, but
> of the behavior of the 2nd invocation. But yes, there the flag will end
> up being cleared because of the FADT flag also having been cleared. Not
> easily visible, though. Could minimally do with a remark in the
> description.

Indeed, the variable gets clearer on further invocations, as the
adjustment to ACPI_FADT_NO_CMOS_RTC gets propagated.

Given Andrew comments, I've reworked all of this and I think it ended
up being clearer.

Thanks, Roger.

