Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91281ACEC77
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 10:58:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006407.1385579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN6Qe-0000Jk-Ox; Thu, 05 Jun 2025 08:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006407.1385579; Thu, 05 Jun 2025 08:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN6Qe-0000IH-Lx; Thu, 05 Jun 2025 08:58:28 +0000
Received: by outflank-mailman (input) for mailman id 1006407;
 Thu, 05 Jun 2025 08:58:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIxA=YU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uN6Qd-0000I9-C6
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 08:58:27 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dd270a6-41eb-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 10:58:26 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-442eb5d143eso6526435e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 01:58:26 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-451fb169336sm11528295e9.1.2025.06.05.01.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 01:58:24 -0700 (PDT)
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
X-Inumbo-ID: 3dd270a6-41eb-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749113905; x=1749718705; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nt4eBACnwJZkVG5t0seTp+2K1gNg3NAL9+SCn2oVifs=;
        b=tZ2kzTxM98S6o0VzpNuQq70te+qYD8NhcKn4O0tiNl/Rw1Gv0L9RUAQUY9Dj21pOW+
         hPYJDo4Hv4Y7jWzXLE/+juACivGZPCnODnUFXBhJUDJrfmnKw13xn9qFKX5WV4qNcWXL
         lwnl21gnOkc99rA80/NmKiEf+usC7bEJ+AU0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749113905; x=1749718705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nt4eBACnwJZkVG5t0seTp+2K1gNg3NAL9+SCn2oVifs=;
        b=MF26NO6ycWExwcuIE+lRVkiESYAM8PFZv7abIyUbcxYoI4lUU348AUwcwtN4IIwdvG
         Ydq1rPXzkYBMna4MK7qNzgrTRzV0ctROjSodUOLiJK48pTMSSB5kA+pZypwyG1mrzE5P
         /p+ykcxhzaQazckVR7MILQ/38Enab8yhftq65nfi5H/zhtAeqPoWtl/pVTaN978AG1Vr
         5Pb6Id3Lj54lYfqsePyURZkMPKiqdjXlulybqOvs1mgUYyUljxWBgL+h6/xITlUxd5Ks
         I1DI/HN/uUmho4ln6BQHPxsLm33yPNU6hbvjKqNPB31dQ3EdUBdqaAhjncXpxAsFPCVD
         SS6g==
X-Forwarded-Encrypted: i=1; AJvYcCW047d+hEA/6y9HL28QTCroek+wXe1YgdIWn/wwrjxRLANM4FxqSOXadm9Y6xlbuAK6B7tI5qRbWuo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxt+GZTTMywu7jG4EbPU8No4GJYe2a8F4Ut6kYQyIlvERJqMWm/
	xeIXfFlwavJ4z9SjD0AEsN3kmUS41CghyTBMvCNtciPlj8a+NbC2a24t1pYKS0eWq5M=
X-Gm-Gg: ASbGncuTX4PlNv+62nqHuwoYa44gQOm2mHXCegQt9yFEa5rVZkB91I8110HlfGKh5iM
	vK+N+vuphdRKOGiIAfd1F9ObNtlOTy2C89Yw1Amywt5JdZAt1aCvRIrFGIs83qX/Fr2wT9qnDU/
	dB5UzJyHEN+ODQLWQyQCZD09k9J2rMu9/3rXGn8ACPVxQI3bWjdv/jvf65GRukBvbCbWaR12lDJ
	4Ecdu+Xoxeks3vJkcvIi3Y/aDaEiUDvhajJXNyR0kFpid0lb6UQ/sG5aToqIeBC5P+zklKWg8OQ
	RPZx9BX2GbyMRDsbvnTYeapLq3BnBdZPoqnTpCquBnyW2NTqF/Z6w1y/XlU8WiyhfQgLOi7WOsy
	org1MknbDG7IrmvfkjUJ1X9LJ5/GPZg==
X-Google-Smtp-Source: AGHT+IFIgcYr+bsCEjJXL9s/tipEDt9f/uTIzV6udUsheXKTyJkmBPLIfJl811SRU583+UXo3NWC/A==
X-Received: by 2002:a05:600c:34c2:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-451f0b0c75emr63448235e9.17.1749113905357;
        Thu, 05 Jun 2025 01:58:25 -0700 (PDT)
Date: Thu, 5 Jun 2025 10:58:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: dmkhn@proton.me, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
	julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org,
	teddy.astie@vates.tech, dmukhin@ford.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 2/2] xen/domain: rewrite emulation_flags_ok()
Message-ID: <aEFcMOMR8Czf6nD0@macbook.local>
References: <20250602191717.148361-1-dmukhin@ford.com>
 <20250602191717.148361-3-dmukhin@ford.com>
 <b0970d27-ff9f-43ee-a7e4-b0aa24bf0916@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b0970d27-ff9f-43ee-a7e4-b0aa24bf0916@suse.com>

On Wed, Jun 04, 2025 at 12:43:22PM +0200, Jan Beulich wrote:
> On 02.06.2025 21:17, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> > 
> > Rewrite emulation_flags_ok() to simplify future modifications.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
> > ---
> > Changes since v4:
> > - updated commentaries
> > - added Teddy's R-b, kept Stefano's R-b
> > ---
> >  xen/arch/x86/domain.c | 91 ++++++++++++++++++++++++++++++++++---------
> >  1 file changed, 73 insertions(+), 18 deletions(-)
> 
> Given this diffstat, I wonder what the other x86 maintainers think about
> this.

I think the array is a cleaner way of expressing the possible domain
configurations.

See below, I got some suggestions that would likely make the diffstat
better.

> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -743,32 +743,87 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> >      return 0;
> >  }
> >  
> > +/*
> > + * Verify that the domain's emulation flags resolve to a supported configuration.
> > + *
> > + * This ensures we only allow a known, safe subset of emulation combinations
> > + * (for both functionality and security). Arbitrary mixes are likely to cause
> > + * errors (e.g., null pointer dereferences).
> > + *
> > + * NB: use the internal X86_EMU_XXX symbols, not the public XEN_X86_EMU_XXX
> > + * symbols.
> > + */
> >  static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
> >  {
> > +    enum {
> > +        CAP_PV          = BIT(0, U),
> > +        CAP_HVM         = BIT(1, U),
> > +        CAP_HWDOM       = BIT(2, U),
> > +        CAP_DOMU        = BIT(3, U),
> > +    };
> > +    static const struct {
> > +        unsigned int caps;
> > +        uint32_t min;
> > +        uint32_t opt;
> > +    } configs[] = {
> > +#ifdef CONFIG_PV
> > +        /* PV */
> > +        {
> > +            .caps   = CAP_PV | CAP_DOMU,
> > +            .min    = 0,
> > +            .opt    = 0,
> 
> Why the latter two initializers? Imo adding ones which say nothing else than
> what's the default is only enlarging code without much real benefit.

I'm fine with skipping explicit initialization of 0 fields, I don't
think there's much benefit here.

> > +        },
> > +
> > +        /* PV dom0 */
> > +        {
> > +            .caps   = CAP_PV | CAP_HWDOM,
> > +            .min    = X86_EMU_PIT,
> > +            .opt    = 0,
> > +        },
> > +#endif /* #ifdef CONFIG_PV */

I think the above two elements could be folded into a single one,
iow:

	/* PV domU and dom0 */
        {
            .caps   = CAP_PV
            .min    = X86_EMU_PIT,
        },

As given the current code we do allow PV domUs with X86_EMU_PIT, so
otherwise the change here is not non-functional.

> > +
> > +#ifdef CONFIG_HVM
> > +        /* PVH dom0 */
> > +        {
> > +            .caps   = CAP_HVM | CAP_HWDOM,
> > +            .min    = X86_EMU_LAPIC | X86_EMU_IOAPIC | X86_EMU_VPCI,
> > +            .opt    = 0,
> > +        },
> > +
> > +        /* HVM domU */
> > +        {
> > +            .caps   = CAP_HVM | CAP_DOMU,
> > +            .min    = X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ),
> > +            /* HVM PIRQ feature is user-selectable. */
> > +            .opt    = X86_EMU_USE_PIRQ,
> > +        },
> > +
> > +        /* PVH domU */
> > +        {
> > +            .caps   = CAP_HVM | CAP_DOMU,
> > +            .min    = X86_EMU_LAPIC,
> > +            .opt    = 0,
> > +        },
> > +#endif /* #ifdef CONFIG_HVM */
> > +    };
> > +    unsigned int i, caps = is_hardware_domain(d) ? CAP_HWDOM : CAP_DOMU;
> > +
> > +    if ( is_pv_domain(d) )
> > +        caps |= CAP_PV;
> > +    else if ( is_hvm_domain(d) )
> > +        caps |= CAP_HVM;
> 
> There's no 3rd case, so this could be expressed with plain "else", and hence
> also with a conditional operator, and hence could also be right in the
> initializer. How far to go with those transformations I'm not sure; personally
> I'd go all the way, but I'd be okay-ish with just the first of the steps.

I agree, I would place them all in the definition:

    unsigned int caps = (is_hardware_domain(d) ? CAP_HWDOM : CAP_DOMU) |
                        (is_pv_domain(d) ? CAP_PV : CAP_HVM);

Thanks, Roger.

