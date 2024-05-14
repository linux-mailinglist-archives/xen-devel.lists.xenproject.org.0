Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 715548C56A4
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 15:11:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721503.1124965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6rvo-00075g-Ep; Tue, 14 May 2024 13:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721503.1124965; Tue, 14 May 2024 13:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6rvo-00073Z-BI; Tue, 14 May 2024 13:11:00 +0000
Received: by outflank-mailman (input) for mailman id 721503;
 Tue, 14 May 2024 13:10:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6rvn-00073T-Bh
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 13:10:59 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 666419bc-11f3-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 15:10:57 +0200 (CEST)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-792ecce9522so45373785a.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 06:10:57 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf2fc587sm561120185a.75.2024.05.14.06.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 06:10:55 -0700 (PDT)
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
X-Inumbo-ID: 666419bc-11f3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715692256; x=1716297056; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1SfSHiXaC6QhrOH7TgxyNsbQ5kNUGDEUN9bq4b11pc=;
        b=qugr5v8b/LOa1CZ/wNassNsAlkZsfNS+6Sx+QnNPthtlJdeWiZqtvWjv5ft3GUp4cg
         9/VS7ONdLKeQrfMGVNPH7S0R20o3EZl/hJbvwa8NLf/cfQUBXIW2gGr1tTBFjRmd1Cv2
         AU7lJ2hM/j1O73oA6gNWO9UwoBIn3uk0f9a8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715692256; x=1716297056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1SfSHiXaC6QhrOH7TgxyNsbQ5kNUGDEUN9bq4b11pc=;
        b=uCP7zGnZoBA9NihUB/ScGd9CnkA0I+4pRcad1oPYV/GNLuoSpkeZ/WJFNYjYyEf5ZM
         /8sUJ/pDV+lUUQoV5bQN6ZwNJwjEGcMjB+2w6mcdJ/8SlcCZE9wfIWhZgaFh1QMtx0jI
         wTi+iFjzApKaI0SLnV3unwW+jOySaGOrvoKTdI9FvMxG1oxuO+aP8dXZ3nFUu9/bgVd5
         ylxVC/kOZ3deiq8bZe90bXu12g6au9IwitaeaMtKLYLGSkMBs/LZjm1+TpLMmqE+rBEb
         V6Dc0wifOxqVFzS8OQZlc2IYgCr0Fi4DTvD8tG98Yjn/SHhVWZII+GhtxTQaR5O7SmfY
         408Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVnPEOqzfuF56r22VfiTJs8BwCLgkitqUc3P/C7db7AO00+gjQA89SBcTV85PnP3DA255HcUbJjvElNoQNYvTCbpWwALvuGahBz61eMxk=
X-Gm-Message-State: AOJu0YwBf5YqyjE+D8FUp2NPT37VyXpVco3JqLKjfa/Wdk9F8ugLCT8C
	mkw6Y14RR/BhueXpNzvC0n51xwOLfQQAnbCc8/e1B8WxKFfbuQK7epSLViTQwZk=
X-Google-Smtp-Source: AGHT+IEoWK9Gw+dQabeRnCApT3pQG2wPcZy4eaeTMLpby12DFrU20XLO4LEOGFCb1XWLgHpeeGNZxw==
X-Received: by 2002:a05:620a:102e:b0:78a:5fd9:46d7 with SMTP id af79cd13be357-792c75ffc85mr1447254385a.67.1715692255735;
        Tue, 14 May 2024 06:10:55 -0700 (PDT)
Date: Tue, 14 May 2024 15:10:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.19] x86/mtrr: avoid system wide rendezvous when
 setting AP MTRRs
Message-ID: <ZkNi3HE4V_ErzyhR@macbook>
References: <20240513085925.59324-1-roger.pau@citrix.com>
 <435ccfc3-d4e3-4da4-838f-4fb0e8987eab@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <435ccfc3-d4e3-4da4-838f-4fb0e8987eab@suse.com>

On Tue, May 14, 2024 at 01:57:13PM +0200, Jan Beulich wrote:
> On 13.05.2024 10:59, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/cpu/mtrr/main.c
> > +++ b/xen/arch/x86/cpu/mtrr/main.c
> > @@ -573,14 +573,15 @@ void mtrr_ap_init(void)
> >  	if (!mtrr_if || hold_mtrr_updates_on_aps)
> >  		return;
> >  	/*
> > -	 * Ideally we should hold mtrr_mutex here to avoid mtrr entries changed,
> > -	 * but this routine will be called in cpu boot time, holding the lock
> > -	 * breaks it. This routine is called in two cases: 1.very earily time
> > -	 * of software resume, when there absolutely isn't mtrr entry changes;
> > -	 * 2.cpu hotadd time. We let mtrr_add/del_page hold cpuhotplug lock to
> > -	 * prevent mtrr entry changes
> > +	 * hold_mtrr_updates_on_aps takes care of preventing unnecessary MTRR
> > +	 * updates when batch starting the CPUs (see
> > +	 * mtrr_aps_sync_{begin,end}()).
> > +	 *
> > +	 * Otherwise just apply the current system wide MTRR values to this AP.
> > +	 * Note this doesn't require synchronization with the other CPUs, as
> > +	 * there are strictly no modifications of the current MTRR values.
> >  	 */
> > -	set_mtrr(~0U, 0, 0, 0);
> > +	mtrr_set_all();
> >  }
> 
> While I agree with the change here, it doesn't go quite far enough. Originally
> I meant to ask that, with this (supposedly) sole use of ~0U gone, you please
> also drop the handling of that special case from set_mtrr(). But another
> similar call exist in mtrr_aps_sync_end(). Yet while that's "fine" for the
> boot case (watchdog being started only slightly later), it doesn't look to be
> for the S3 resume one: The watchdog is re-enabled quite a bit earlier there.
> I actually wonder whether mtrr_aps_sync_{begin,end}() wouldn't better
> themselves invoke watchdog_{dis,en}able(), thus also making the boot case
> explicitly safe, not just safe because of ordering.

Hm, I don't like disabling the watchdog, I guess it could be
acceptable here because both usages of mtrr_aps_sync_end() are limited
to specific scenarios (boot or resume from suspension).  I can prepare
a separate patch, but I don't think the watchdog disabling should be
part of this patch.

Thanks, Roger.

