Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BDFA820B3
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 11:07:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943672.1342343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2ROy-0008JB-9F; Wed, 09 Apr 2025 09:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943672.1342343; Wed, 09 Apr 2025 09:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2ROy-0008Gf-6Z; Wed, 09 Apr 2025 09:07:20 +0000
Received: by outflank-mailman (input) for mailman id 943672;
 Wed, 09 Apr 2025 09:07:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ii2m=W3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u2ROw-0007z5-Mp
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 09:07:18 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 099233f0-1522-11f0-9eaa-5ba50f476ded;
 Wed, 09 Apr 2025 11:07:18 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso47695225e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 02:07:18 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43f20a9f14csm8789305e9.1.2025.04.09.02.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 02:07:17 -0700 (PDT)
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
X-Inumbo-ID: 099233f0-1522-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744189638; x=1744794438; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qbm8MkLH63O31uSd7V1JYtHSQrp9dnV9v/F9oPhY0vc=;
        b=wc4wjFXFUGJb6aOHhlTBXG7JfflNNWvbS0YFHICzIkNszLhSe1IbFOVQTP8S1GTkUt
         bhEJX83wMPKgfb65+jRpB04lQ2ifeSu/4CTFwxiKiulumJifjE2kf/WBR9wk4ZMzmzlx
         SAYUL+kl4upiB0GIWuUGIvzVBDBBDr7/0rQ18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744189638; x=1744794438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qbm8MkLH63O31uSd7V1JYtHSQrp9dnV9v/F9oPhY0vc=;
        b=Kx7mqig3yK11cZ1GpVawTy43sp5NEslbtIQTuoa4lOrsQTg3kU8yA/HrGKKjeReTLa
         ktneNO0Ai7iodpJoslY5o382d50O3+E0s28rz29XvtfyyQMhMtdspEpcR0Pjf4p/iRD7
         rzIuJ2Fdy/pCTokdeqLuNSfz/CAdla7Ob0q3mzecSw8gQUOknOuDOkUEF25W6TkLjNOJ
         0+OvsoXOoP9eAreKw5TN+owdaFcc4oQrm8LlzzVEkUZIPGe/g/ZPxju+jnO6/yPx/lK5
         EoP1IbECWzkcLACwP2JMok0NsqrPgXFOddGGxXwbG4LbIMX0VRwUeZ0oX/foK6+c96V8
         gaWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV47bpOgrvHxLL9e/kN5erKU97KISNx3jaGdHEMJIVa3OWBJfMFY6nVbKFOJnUxxE1atEbnHMZeHpQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrsD9NILHDZFOGHEZJxbp6CG7gFVRaLaxoMVmulGfqMlPvgEdP
	FaXkWmTSOl/u/NCfv1M69salBeDjUffjL2MVBy0Yx6JdRcw5P4AhQ7+KO93jzxE=
X-Gm-Gg: ASbGncv8lOiCatFhtdQhY+uumobYgas1EovYOKN9HCnbOzbmTktoWMNEbBE2N7sPV20
	tXwf6unbGjWN+/LvRGKO2DNe/jxfhHVCa3othlMM1r/+96ye1rTzEmTmPHJX81UNWYVK9iBqwQ5
	o7Gcyiib86tYIOWl2AiTJlXCUZEUks7x2Tu0zi8AT07WD7js/2uJ1bzmGr1jTOgzTzSzCQh+Nba
	3VVKYD4J8fGNHXxD5tWhh+GrIHAsGkWbqnlwny+7F8fhX1GXUzNCs4+bCMQSgO1AztKxVkT4Ddb
	hJDeGJcivFRNdLJ+WQZwInYIpGxoqCg770JylEazOsZamVttPpnpI1x5h68zeA==
X-Google-Smtp-Source: AGHT+IFmSSZ6rlE6Gy6q2pPn9VFOwlyRC4wAheL5mDdU7UisCx61omdQXY4Ncdpo2BXAqt8x0XY2Qg==
X-Received: by 2002:a05:600c:4f43:b0:43d:bb9:ad00 with SMTP id 5b1f17b1804b1-43f1fe7f6edmr19965575e9.15.1744189637743;
        Wed, 09 Apr 2025 02:07:17 -0700 (PDT)
Date: Wed, 9 Apr 2025 11:07:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/hvm: fix write emulation of RO ranges
Message-ID: <Z_Y4xFzaltr_XKO4@macbook.lan>
References: <20250408093156.83277-1-roger.pau@citrix.com>
 <20250408093156.83277-3-roger.pau@citrix.com>
 <16c73cae-2ac0-4811-97d3-b25c95ed5abc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <16c73cae-2ac0-4811-97d3-b25c95ed5abc@suse.com>

On Tue, Apr 08, 2025 at 03:57:17PM +0200, Jan Beulich wrote:
> On 08.04.2025 11:31, Roger Pau Monne wrote:
> > When running on AMD hardware in HVM mode the guest linear address (GLA)
> > will not be provided to hvm_emulate_one_mmio(), and instead is
> > unconditionally set of ~0.  As a consequence mmio_ro_emulated_write() will
> > always report an error, as the fault GLA generated by the emulation of the
> > access won't be ~0.
> 
> Which means subpage_mmio_write_accept() is flawed, too, on AMD (or more
> generally whenever .gla_valid isn't set).

Oh, yes, good catch.  I didn't notice that one.  We should move all
those checks to use a paddr rather than a gla.

> > Fix this by only checking for the fault GLA in mmio_ro_emulated_write()
> > when the guest is PV.
> 
> This narrows checking too much, imo. For VT-x we could continue to do so,
> provided we pass e.g. npfec down into hvm_emulate_one_mmio(), i.e. make
> the gla_valid flag visible there.

I don't think we should rely on the gla at all in
mmio_ro_emulated_write(), and instead just use the physical address.

> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -5187,7 +5187,12 @@ int cf_check mmio_ro_emulated_write(
> >  
> >      /* Only allow naturally-aligned stores at the original %cr2 address. */
> >      if ( ((bytes | offset) & (bytes - 1)) || !bytes ||
> > -         offset != mmio_ro_ctxt->cr2 )
> > +         /*
> > +          * HVM domains might not have a valid fault GLA in the context, as AMD
> > +          * NPT faults don't report the faulting GLA.  It's also possible for
> > +          * the fault to happen in non-paging modes.
> > +          */
> > +         (is_pv_domain(current->domain) && offset != mmio_ro_ctxt->cr2) )
> >      {
> >          gdprintk(XENLOG_WARNING, "bad access (cr2=%lx, addr=%lx, bytes=%u)\n",
> >                  mmio_ro_ctxt->cr2, offset, bytes);
> 
> Is logging the supposed CR2 value useful then for cases where the GLA
> isn't valid? I fear it might be more confusing than helpful.

Since it was a debug printk I was kind of OK with leaving it, but
given the other comments I think I will have to rework
mmio_ro_emulated_write() so that it doesn't use the gla anymore.

Thanks, Roger.

