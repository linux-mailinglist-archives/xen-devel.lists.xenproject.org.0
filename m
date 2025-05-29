Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D2BAC80E6
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 18:30:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000076.1380511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKg9G-0007tq-OQ; Thu, 29 May 2025 16:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000076.1380511; Thu, 29 May 2025 16:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKg9G-0007sJ-Kf; Thu, 29 May 2025 16:30:30 +0000
Received: by outflank-mailman (input) for mailman id 1000076;
 Thu, 29 May 2025 16:30:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vnej=YN=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uKg9F-0007sD-RH
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 16:30:29 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3aec8f13-3caa-11f0-b894-0df219b8e170;
 Thu, 29 May 2025 18:30:28 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5532a30ac41so1321759e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 May 2025 09:30:28 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533793780asm374527e87.222.2025.05.29.09.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 09:30:26 -0700 (PDT)
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
X-Inumbo-ID: 3aec8f13-3caa-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748536227; x=1749141027; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDfozTeTL73IOCurOX4vdAd5idolzSMAe8Z1aI0ghlQ=;
        b=B2fVjJeW/l3jo/q2O29R+0wR0iUe53yQZrY1R9VvPCvdt4AKllty6U1WuuaFxeIGSH
         p2GflMUdsn0hJDtTE7FAdMexq3HAKkDXBL9WpzfkwcYFVOM+09WuQ2QbzukeJBu2q6fB
         MNZFBIMYC+/2nzxJ+id80o8FTVhnPj1S2I3INQzdMhX7jJEHUt37R9vEQNWWBf03DUVw
         dPBvYNfsvChJ/3IirinANkagQZ57ms525/TDKBGyikmzaVbKm2H+2dRnTYiqdm+y0I5W
         +2Goym5MMFUzKwZmahzWSc2RnT2g4oHrPZ4k3A3+Vrxl+oh7Pcn3crJOAQ6W+6K0E/li
         o13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748536227; x=1749141027;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDfozTeTL73IOCurOX4vdAd5idolzSMAe8Z1aI0ghlQ=;
        b=CXFze0PLv0F4JspnTB6MALNh/Zrg2GcHL3Y7e2VlWTmTj41RfhArMTL2Z0g7VC72wd
         vfjARo1jQqgVaKZZ6quqsufsdAsizroqlsA1CpqWCJ3hzfsgwIYJj3tQ6Qar7LFwEyIH
         7PQs5oeHi0Sf4eCqDAOWTjOqEMxOD13UxDdpjEmZErTPcURbcgMNOUjrSBH5hUdPhrrA
         GU7QhhZ/OHdjQRs4OA7NS8DuNty4URJzgY2mk4mmJwnwxlWflWXyxblaF7iJJaWb27EE
         5nhmqB7fvGpPUh8r6zvzN5fJZAWWonimMfCKvdGR2I4K87gWMOvEScRJLiJUQAeMPJFe
         ywew==
X-Gm-Message-State: AOJu0Yxmgq1bWckH1q7g4X479R8rFt7vsYseDn+//89Mnd8YuJGAI2tA
	xAuHqmuZ6w7r2Ye5m0b2Bsm3cpRk5OyBZawMJ6B2/RJ42rl8Ta3X/G0oDCsoZ2Ixkrs=
X-Gm-Gg: ASbGncvICAlC0vJd8DPjJPfLIKYzYI9NztueyZIMVP9dD+pQymFqtbVCtccHvU2YE1T
	sdnukOBJA9Ulbbo7G3MwD1AJ0l8HdBrFjHHKJzVtp7BdgWdS2/NjWY+gKYB5bsXmUljg9nTdw1O
	+8wlYu/7HAbaI4KbhktPcew5kV/MpCK2RdJf+lk+tcGoWQseeJWJeyHQA5wa2dw4rva+ePzYXUs
	vLC6G9UQWTkwt5jbC2mYltMP0koybfNVNH1LCnX7Tjh+MTPop6rMqa+szJPUQpmq5hOqPiUKHD5
	AMsHLpQ7GIefrsX+ntLJcH3A3B8JY+yljqEYQzsvjvAk/Gfb3ROa95xv5cd4UAmmM/vRaifFBg4
	rOgx7iDgU6lyB0RMjboWOFtY=
X-Google-Smtp-Source: AGHT+IGJGN4c8AQTzHLXkBWn5FEEMG/Oajv6MWTcgOJCzLoCOGI15v0yQfTSs5AcpIH1RwvRxhCsRA==
X-Received: by 2002:a05:6512:3a86:b0:54f:c58a:f777 with SMTP id 2adb3069b0e04-5533b9098b7mr34372e87.34.1748536227236;
        Thu, 29 May 2025 09:30:27 -0700 (PDT)
Date: Thu, 29 May 2025 18:30:26 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
	bertrand.marquis@arm.com, michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com, andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com
Subject: Re: [PATCH v2 2/3] xen/arm: dom0less: Add trap-unmapped-accesses
Message-ID: <aDiLosXtgTUHZdSv@zapote>
References: <20250529155024.1284227-1-edgar.iglesias@gmail.com>
 <20250529155024.1284227-3-edgar.iglesias@gmail.com>
 <8c93db26-fd37-4e37-9822-54986e5ee3cc@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c93db26-fd37-4e37-9822-54986e5ee3cc@xen.org>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2025-03-23)

On Thu, May 29, 2025 at 05:03:12PM +0100, Julien Grall wrote:
> Hi Edgar,
> 
> On 29/05/2025 16:50, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > 
> > Add the trap-unmapped-accesses per-domain fdt property.
> > 
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >   docs/misc/arm/device-tree/booting.txt | 9 +++++++++
> >   xen/arch/arm/dom0less-build.c         | 9 ++++++++-
> >   2 files changed, 17 insertions(+), 1 deletion(-)
> > 
> > diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> > index 59fa96a82e..8a5c40ddf3 100644
> > --- a/docs/misc/arm/device-tree/booting.txt
> > +++ b/docs/misc/arm/device-tree/booting.txt
> > @@ -225,6 +225,15 @@ with the following properties:
> >       option is provided with a non zero value, but the platform doesn't support
> >       SVE.
> > +- trap-unmapped-accesses
> > +
> > +    Optional. An integer that configures handling of accesses to unmapped
> > +    address ranges.
> > +    If set to 0, guest accesses will read 0xFFFFFFFF and writes will be ignored.
> 
> Looking at the code, if I am not mistaken, it will only return this value
> for 32-bit. For 64-bit there will be a few Fs more and for less there will
> be less. So I think this needs to be reworded.
> 
> The rest looks good to me.

Thanks, in v3 I'll change it to:
    If set to 0, guest accesses will read all bits as ones, e.g 0xFFFFFFFF
    for a 32bit access and writes will be ignored.

Cheers,
Edgar

> 
> > +
> > +    This option is only implemented for ARM where the default is 1.
> > +
> >   - xen,enhanced
> >       A string property. Possible property values are:
> > diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> > index a4e0a33632..69324aa597 100644
> > --- a/xen/arch/arm/dom0less-build.c
> > +++ b/xen/arch/arm/dom0less-build.c
> > @@ -344,8 +344,15 @@ void __init arch_create_domUs(struct dt_device_node *node,
> >   #endif
> >       }
> > -    /* Trap accesses to unmapped areas. */
> > +    /* Trap unmapped accesses by default. */
> >       d_cfg->flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
> > +    if ( dt_property_read_u32(node, "trap-unmapped-accesses", &val) )
> > +    {
> > +        if ( val > 1 )
> > +            panic("trap-unmapped-accesses: supported values are 0 or 1");
> > +        if ( !val )
> > +            d_cfg->flags &= ~XEN_DOMCTL_CDF_trap_unmapped_accesses;
> > +    }
> >   }
> >   int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
> 
> Cheers,
> 
> -- 
> Julien Grall
> 

