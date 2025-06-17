Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46434ADC31D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 09:18:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017797.1394795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRQal-0006hS-3d; Tue, 17 Jun 2025 07:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017797.1394795; Tue, 17 Jun 2025 07:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRQal-0006ep-0O; Tue, 17 Jun 2025 07:18:47 +0000
Received: by outflank-mailman (input) for mailman id 1017797;
 Tue, 17 Jun 2025 07:18:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VPhx=ZA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uRQaj-0006eh-5P
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 07:18:45 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4addbeeb-4b4b-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 09:18:40 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-450ccda1a6eso47574895e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 00:18:40 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4532e256630sm170414585e9.29.2025.06.17.00.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jun 2025 00:18:39 -0700 (PDT)
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
X-Inumbo-ID: 4addbeeb-4b4b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750144719; x=1750749519; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+iQbnVi6qoNwPsH0EtCP5cn6bop7bqaemlZH8HM2uEw=;
        b=nbxM+QUdQYofUznprZ9r+XpUoUUCikPVmhZy9E1XADB3M0URPFgD0BG+aoJo6A0fl2
         e5GooAhZ5a4qQ0dw6ATD9F0S0b1ysW+IW5u9alFR0Fb7RbMxzTEHdAxE6YMvY79nZcbn
         yHH1UeJRcfaCcs5Eo3yt1W2ME9k2f9FtptNx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750144719; x=1750749519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+iQbnVi6qoNwPsH0EtCP5cn6bop7bqaemlZH8HM2uEw=;
        b=JFjl7HsI7nhuZJ/EqM4YTQDa67J3IrqMhUBeUfPBf5DcfK2P+YaI+QUxpwtge3eNNv
         8TGl20pK5URnxeSeEFfvce4ajkI113XmaV5O4bafr62yC+ctXl+m2OrY6aTonNZzpagO
         WHMVZv71+YZNUIwuUAlVNAbeSNsV0D0JNLDJ16LObLCQ50M4PX2A9G/RAoHVYJA34IKj
         Zy4+lzLo+6xBc+dJCT1GU9doWlri15F9105T9SOtb+qiIg6xSj6xCBpHTHwkkHzqvIIr
         uikMm7yGSCN0/YSwybGMiT+ea2qujKx+DfkqYPxQRqzBwYNd+lYl28+aaUBD//r9W3Jb
         KXPg==
X-Forwarded-Encrypted: i=1; AJvYcCWW+EXptLB1/jw8Gig5+C3iCiWtFecOEGWUIEOqzd/pDyCm33HXoSQJz/J1Ml2QswoBhfABJogaSnk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwH8pp0gkkI5FPxHCHu6rcdPRATu/TI86g6kyVgLMY8VF8AI7z0
	oZTCKZrVREJeHfZbqeTxhyj4QDDitOwcXeDHdItG+LWMeTz+NSQYvSxRqCqbd1Ef+RE=
X-Gm-Gg: ASbGncvqR2rp3b/uIt5ROTCKF/V4Gb0F5tmph4MpRt6lFI0joyWtP2B+wkEEaGABS7k
	qPPlQxyIzo9SX7Wdh2ZhDJ/3iKDCcamz8al8b/nHQB1O/n2lFl+8nzDXA1dPXLEu2k8G5I+2ky6
	nSrTHdEqBqRpiCqLZqy8jxNUbDTnRF/5f4MX/jsAmoXEkhPVRhhiyfX/cXQy8YG4xdSv/RWIV5a
	GPLcG8/L2tOL1ro6e8zXlKbXMXkMPKF5N3pSeTHXpOip7shqCpbECTFlF90MxoyDuENSejS64gU
	KszRP57WwvYpFdfSG1uuJGb5qX1ndhsdThcx81QHoLLr56XJihRpj5EDLp8+U5WyidkPrHtSaMX
	lshl7w/JiI8xge2tT81MOlO0zGgz+lJOwhoYC8IyF
X-Google-Smtp-Source: AGHT+IE4C2uJmQXMPvZdb8Xrem8XtAHjIBoaRB4On7ei1ddLTt5F2DEdkizjKItH/5J2E5RS3lJSBg==
X-Received: by 2002:a05:600c:6211:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-4533cab86f3mr111739135e9.18.1750144719476;
        Tue, 17 Jun 2025 00:18:39 -0700 (PDT)
Date: Tue, 17 Jun 2025 09:18:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Jan Beulich <jbeulich@suse.com>, dmkhn@proton.me,
	andrew.cooper3@citrix.com, anthony.perard@vates.tech,
	julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org,
	teddy.astie@vates.tech, dmukhin@ford.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v8] xen/domain: rewrite emulation_flags_ok()
Message-ID: <aFEWzjgOOKKqfR51@macbook.local>
References: <20250617011519.55386-1-dmukhin@ford.com>
 <a8471943-ebf3-4b45-80bd-51bff5498ed2@suse.com>
 <dff6968c29274374d32c01baed7ca806@bugseng.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dff6968c29274374d32c01baed7ca806@bugseng.com>

On Tue, Jun 17, 2025 at 08:53:51AM +0200, Nicola Vetrini wrote:
> On 2025-06-17 08:19, Jan Beulich wrote:
> > On 17.06.2025 03:15, dmkhn@proton.me wrote:
> > > --- a/xen/arch/x86/domain.c
> > > +++ b/xen/arch/x86/domain.c
> > > @@ -743,32 +743,75 @@ int arch_sanitise_domain_config(struct
> > > xen_domctl_createdomain *config)
> > >      return 0;
> > >  }
> > > 
> > > +/*
> > > + * Verify that the domain's emulation flags resolve to a supported
> > > configuration.
> > > + *
> > > + * This ensures we only allow a known, safe subset of emulation
> > > combinations
> > > + * (for both functionality and security). Arbitrary mixes are
> > > likely to cause
> > > + * errors (e.g. null pointer dereferences).
> > > + *
> > > + * NB: use the internal X86_EMU_XXX symbols, not the public
> > > XEN_X86_EMU_XXX
> > > + * symbols, to take build-time config options (e.g. CONFIG_HVM)
> > > into account
> > > + * for short-circuited emulations.
> > > + */
> > >  static bool emulation_flags_ok(const struct domain *d, uint32_t
> > > emflags)
> > >  {
> > > +    enum domain_capability {
> > > +        CAP_PV          = BIT(0, U),
> > > +        CAP_HVM         = BIT(1, U),
> > > +        CAP_HWDOM       = BIT(2, U),
> > > +        CAP_DOMU        = BIT(3, U),
> > > +    };
> > > +    static const struct {
> > > +        enum domain_capability caps;
> > > +        uint32_t min;
> > > +        uint32_t opt;
> > > +    } configs[] = {
> > > +#ifdef CONFIG_PV
> > > +        /* PV dom0 and domU */
> > > +        {
> > > +            .caps   = CAP_PV | CAP_HWDOM | CAP_DOMU,
> > 
> > Just to double check - are we sure Misra / Eclair will like this (ab)use
> > of an enum?
> > 
> > Jan
> 
> Likely not, but x86_64 is build with CONFIG_PV=n

It's doing the same for HVM also, so it would trigger for the instance
below then.  I will ack v7 then, which used an unsigned int instead.

Thanks, Roger.

