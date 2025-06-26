Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B07AE9725
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 09:49:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025973.1401240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUhMM-00049s-Fr; Thu, 26 Jun 2025 07:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025973.1401240; Thu, 26 Jun 2025 07:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUhMM-00048C-Co; Thu, 26 Jun 2025 07:49:26 +0000
Received: by outflank-mailman (input) for mailman id 1025973;
 Thu, 26 Jun 2025 07:49:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hGPv=ZJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uUhMK-000485-SO
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 07:49:24 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12821cea-5262-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 09:49:22 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4538bc1cffdso1671865e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 00:49:22 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a6e8117187sm6429439f8f.101.2025.06.26.00.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 00:49:21 -0700 (PDT)
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
X-Inumbo-ID: 12821cea-5262-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750924161; x=1751528961; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N2eBZ73J800zS0COuSSb7WwAu4nL1GCeHQjgrI24kL4=;
        b=BLUyqqfkkrE7h+Vw2RnLLdg7LMtCDL/2zwgznBry6ZyN7LpMEnZz/g1BzNlA6re8R3
         YoU1JwHOmAS9Ow8J/5PWlf5fKCEhkHZ9gLMYUZy6+H4xDBsahNXSlnBb7km3ziF1MMd/
         eERfPxmQlwaSj+4VjFqIxayOH8NwqmQwSIOw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750924161; x=1751528961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2eBZ73J800zS0COuSSb7WwAu4nL1GCeHQjgrI24kL4=;
        b=DuBYkVbihlfLTi6k4gYHQaBqVaa197ICkpVVrsc5EE89upSTrIBbH1U4Q0yQhb+GUb
         gcs25vcoiBpR1XBGSjfJzFEEdgvl8OnAMPGP5XGrPIHae53S70a446nawmF8eLp3PO3K
         0KZvTFOBKoctQMfsYHgPiY2sczdpdEmmBHlo5zdE3LDPYSlVpdOaToTBOPoMFDMXU6QN
         ZR1NzFhC1bjPFgMIj3kdyQXdeH2147+iK+AbBif6Xzemdg6CuX0X49deFZdJrq9il98g
         6FO9xOPS+EIPAOB4URdq7BWgIxI1wasBRHhRUFZRl5QGU34uxPbCi7rd36pzj/EhLrVR
         OuCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt3HNzH77xHN1HclcJL3z76jD02bZGF+4nEdWg1D/HJBu7KtmgwraZqqW2b4Dum5rxfF/AHUhDTYQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIhB6NDY15UFMs8sQt8JT7bHBU16xYdriimvEW6S6Z+jncrdyS
	9UKx8zSpoJwd9WmghhJobWWpoIUAa9nDuV9Ndbw4eDJB5OLIAMGSHi3SSMBan2gjdT4=
X-Gm-Gg: ASbGncunn68UIX1lnACNLqufZmOJ5Hg/YWFCYomGYlHT5cvrx8dMabATeZqsN8OnQW/
	00TGjrTVmt//au5O23sJeGxAftGxTz7PSge25wcpBvPPBt5MlFP0OHnD1x9+0PkHRGSTL7F4lf5
	epKxB/Z5nMrrCazuHfZdnWAoiOAoJ+ouq44WW9DSOdRekYohUJQprl0oi9uJip9ZL/3m1A8nvNG
	SWXZLDqAgltAJF+v98yP6njVZNFMKTWUuf1iQJrsEFDPgA7QVSjMOOgvz31kK3Kj2EVk48ShPPm
	jUpHHOGqypo2bJNX8eJkVz8HdrnpfGiv8sLFnv1tIOJgNazPH+1IlY23lfAQkQ9tobtT1BELdWd
	3wvzNgemUQZIPh/5lnqfUJpeWYN6/1zEDafGVGt1f0GbNSQ==
X-Google-Smtp-Source: AGHT+IEX8T0o9JAt/xqkiCO4Z4Di1M0dnj4pP/mnuAu8IsEmIwPyUZom3xaz9I61nrm4fV9WdYOIwg==
X-Received: by 2002:a05:600c:4684:b0:450:cea0:1781 with SMTP id 5b1f17b1804b1-45381ae456bmr62138925e9.16.1750924161364;
        Thu, 26 Jun 2025 00:49:21 -0700 (PDT)
Date: Thu, 26 Jun 2025 09:49:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/8] kconfig: turn PDX compression into a choice
Message-ID: <aFz7gHfrXCta_r1W@macbook.local>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-3-roger.pau@citrix.com>
 <bd844f21-ce43-41a2-baf0-db92ccef7c2c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bd844f21-ce43-41a2-baf0-db92ccef7c2c@suse.com>

On Tue, Jun 24, 2025 at 03:13:27PM +0200, Jan Beulich wrote:
> On 20.06.2025 13:11, Roger Pau Monne wrote:
> > Rename the current CONFIG_PDX_COMPRESSION to CONFIG_PDX_MASK_COMPRESSION,
> > and make it part of the PDX compression choice block, in preparation for
> > adding further PDX compression algorithms.
> > 
> > No functional change intended as the PDX compression defaults should still
> > be the same for all architectures, however the choice block cannot be
> > protected under EXPERT and still have a default choice being
> > unconditionally selected.  As a result, the new "PDX (Page inDeX)
> > compression" item will be unconditionally visible in Kconfig.
> 
> Just to mention it: Afaict there is a functional change, but one I actually
> appreciate, at least in part. So far ...
> 
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -52,9 +52,10 @@ config EVTCHN_FIFO
> >  
> >  	  If unsure, say Y.
> >  
> > -config PDX_COMPRESSION
> > -	bool "PDX (Page inDeX) compression" if EXPERT && !X86 && !RISCV
> > -	default ARM || PPC
> 
> ... for x86 (and RISC-V) this option couldn't be selected. Whereas ...
> 
> > @@ -67,6 +68,17 @@ config PDX_COMPRESSION
> >  	  If your platform does not have sparse RAM banks, do not enable PDX
> >  	  compression.
> >  
> > +config PDX_MASK_COMPRESSION
> > +	bool "Mask compression"
> > +	help
> > +	  Compression relying on all RAM addresses sharing a zeroed bit region.
> 
> ... this option is now available, as the prior !X86 && !RISCV doesn't
> re-appear here. (As the description mentions it, that dependency clearly
> can't appear on the enclosing choice itself.) Since x86 actually still
> should have mask compression implemented properly, that's fine (from my
> pov; iirc I even asked that it would have remained available when the
> earlier change was done), whereas I think for RISC-V it's not quite right
> to offer the option. It also did escape me why the option was made
> available for PPC, which I'm pretty sure also lacks the logic to determine
> a suitable mask.

Yes, the only architectures that have functional PDX compression are
x86 and ARM, as neither RISC-V nor PowerPC call the initialization
functions.  AFAICT this is harmless apart from giving the wrong
impression to the user that PDX compression might be implemented.

Would you prefer for me to introduce a new HAS_PDX config option
that's selected by x86 and ARM, and is used to enable the choice PDX
config?

Thanks, Roger.

