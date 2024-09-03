Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F2E9695B6
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 09:35:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788707.1198160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slO4b-0005U4-Bl; Tue, 03 Sep 2024 07:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788707.1198160; Tue, 03 Sep 2024 07:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slO4b-0005Rx-8d; Tue, 03 Sep 2024 07:35:33 +0000
Received: by outflank-mailman (input) for mailman id 788707;
 Tue, 03 Sep 2024 07:35:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxvv=QB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slO4Z-0005Rq-8j
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 07:35:31 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1884d428-69c7-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 09:35:30 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a869332c2c2so945504966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 00:35:30 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feae63sm649872366b.35.2024.09.03.00.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 00:35:28 -0700 (PDT)
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
X-Inumbo-ID: 1884d428-69c7-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725348930; x=1725953730; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PDXEB96Y2J53tMeLy5H+susvEZV5xj8Q64ZQmR12JcI=;
        b=Pbcmmp2x6uv3DtudJWmWk6LYf84cxrWDRcH7mHMagpMPh1aiTR1QPmTtWchWVdyuGH
         qUj2exwkkEc5WJdqZrfwXoHSucUZqxr6l4U/VLoNRe1nh9nnzYp7RS36jzvSwRxFEUwO
         IFNyIGVxd2zBZ6LO54fPO2V9fuj8qop6AMTE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725348930; x=1725953730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDXEB96Y2J53tMeLy5H+susvEZV5xj8Q64ZQmR12JcI=;
        b=gEK2qGtrWQRdBqigrHQFxpU9SS4mJtAZFwZMrmwDMqLpmq4Ij96EuayXyIpnNsNzCm
         FYrrCHih8TyKNbWgoFbh15Aep9NuYPMCFRnNYpoTTzWJfcC1n+iG+Jh3Xv+FkNwdVvAf
         irXAP//KToo+GoVoM8QqwNJy8TbUr0OFv9nzxpJdl2WKS5Qj5VRwva54CY7/q9ggYxiX
         jvpr14ZjZDW7SoQ5LRs1wvAXQ5A2wTWYbw5pYZIRE7WLwQuDuaA/fbeQW6l1eQqThMr8
         XYY9git0+GV5zH5fV7qdFrwLHx2u8R33hlTwlMTa7G1hNNC4jnC8CEE4TDfSLYkEM2C8
         rqKA==
X-Forwarded-Encrypted: i=1; AJvYcCVRQMFMtqz8M/9iCK1blWV2J995l2uxmQUEKdr9OL7ry7RnR4U1ufnUBc7B9mEBzu67EJzXUT4Zw9g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuTEe74Wi43w8lBW8D6hEQi6hKhCNbuA7GbwEE9By3YiytGKsB
	GhNFuwiRfpGwZNdU+0p9UCM9E0C6k6azjVjyLGGpcRO7c0+aXPc7G3u74PUsug8=
X-Google-Smtp-Source: AGHT+IH/WZv7MFa/eGUcLKitQ0E5/pwjolLTasXit8dkLahrv7hzfMk9xaH9PEBI3NDiWodb82JEAg==
X-Received: by 2002:a17:907:3188:b0:a72:4207:479b with SMTP id a640c23a62f3a-a898231e941mr1617483666b.5.1725348929169;
        Tue, 03 Sep 2024 00:35:29 -0700 (PDT)
Date: Tue, 3 Sep 2024 09:35:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] x86/time: split CMOS time fetching into wrapper
Message-ID: <Zta8QLwmHcBWyJd6@macbook.local>
References: <20240830095220.49473-1-roger.pau@citrix.com>
 <20240830095220.49473-2-roger.pau@citrix.com>
 <f193e088-18fb-4e68-a935-720cc65f3947@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f193e088-18fb-4e68-a935-720cc65f3947@suse.com>

On Tue, Sep 03, 2024 at 08:24:18AM +0200, Jan Beulich wrote:
> On 30.08.2024 11:52, Roger Pau Monne wrote:
> > @@ -1285,33 +1270,56 @@ static unsigned long get_cmos_time(void)
> >          } while ( (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) &&
> >                    t2 < MILLISECS(3) );
> >  
> > -        __get_cmos_time(&rtc);
> > +        __get_cmos_time(rtc);
> >  
> >          spin_unlock_irqrestore(&rtc_lock, flags);
> >  
> > -        if ( likely(!cmos_rtc_probe) ||
> > -             t1 > SECONDS(1) || t2 >= MILLISECS(3) ||
> > -             rtc.sec >= 60 || rtc.min >= 60 || rtc.hour >= 24 ||
> > -             !rtc.day || rtc.day > 31 ||
> > -             !rtc.mon || rtc.mon > 12 )
> > -            break;
> > +        if ( likely(!cmos_rtc_probe) )
> > +            return true;
> > +
> > +        if ( t1 > SECONDS(1) || t2 >= MILLISECS(3) ||
> > +             rtc->sec >= 60 || rtc->min >= 60 || rtc->hour >= 24 ||
> > +             !rtc->day || rtc->day > 31 ||
> > +             !rtc->mon || rtc->mon > 12 )
> > +            return false;
> >  
> >          if ( seconds < 60 )
> >          {
> > -            if ( rtc.sec != seconds )
> > -            {
> > -                cmos_rtc_probe = false;
> 
> This clearing of the variable is lost, which looks wrong to me.

Note the code in get_cmos_time() is modified, so the variable is no
longer used past the call to read_cmos_time().  Instead the signaling
of whether the CMOS is functional or not is done using the return
value of the newly introduced read_cmos_time() function.

Thanks, Roger.

