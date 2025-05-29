Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02305AC804F
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 17:32:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999980.1380431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKfDj-00048o-OF; Thu, 29 May 2025 15:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999980.1380431; Thu, 29 May 2025 15:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKfDj-00046K-Kz; Thu, 29 May 2025 15:31:03 +0000
Received: by outflank-mailman (input) for mailman id 999980;
 Thu, 29 May 2025 15:31:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vnej=YN=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uKfDi-00046E-Ma
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 15:31:02 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed15cdf7-3ca1-11f0-a2ff-13f23c93f187;
 Thu, 29 May 2025 17:31:01 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-54d98aa5981so1435036e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 May 2025 08:31:01 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533787d384sm362216e87.20.2025.05.29.08.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 08:30:59 -0700 (PDT)
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
X-Inumbo-ID: ed15cdf7-3ca1-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748532661; x=1749137461; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2Hw1o5oXO+csszFqpu9DCtn6QhiUeBloK/Zz6pQIH0=;
        b=VGrc54iiucPmce7HyxhD8x+urkaduS8qTJl6zeB1cMNGqmldjhukTRRMSyg18LnZTi
         bBFXvAdGs8bhIqGo9t0PJyP7VRSklbb0VIM6n23djB9kVxjWlFh5//2MMhEelCcRlVlk
         AJ1DflMhfpnMJNYGuXYtg4ekGhwNiX6QOmKPx7Re7X2RlM2uZMQySaD9jH0SbBXPVpL9
         +wZkrDEhWHTm8gvOho++HC6JR8PdsRwL4hcOY2gq5GvTEYRydZ9LBlfcFm3rbUgmjbjo
         obKiRzJK7lg0MTkuYRMj7OWxN7w3tAzx2Z091fIqSjeJowDgJQ6+01TmLRkpmUxQuqtw
         zomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748532661; x=1749137461;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2Hw1o5oXO+csszFqpu9DCtn6QhiUeBloK/Zz6pQIH0=;
        b=TjR94jfzlgB0hu3vKcEQwlpC80UKHQTGJ6wJFi9BpSrq9mGJ1kTEn6xBK5EkAitBxh
         v2GHCL22rTGG4Igx/RQyYPfn+pzLMiGKu07qf9NsFarwtF3LF6Q2UFcy0fghC+50qRLg
         taoPICVIgv+18UqR495272+a/xDXu3wr+XHW6pYgtyRBauUy/0kE4UTDyK/d57I5pVQB
         EW9D+J6TRaj235xaY6tH7j/byybyPoT/thK1LNpHfWhZMk2w+7qo3mFaoIqVzzTYdPr8
         SilaJsWhErPKQXFcLwGYWkE8y3RAT4V1n7iD0tURKSfXHkuGlwU+t2ZLK/Z3iBy/dyiJ
         4EQw==
X-Gm-Message-State: AOJu0Yy7/NLGjbeGlepVcggZf/Hh7bXMWHMh7Or4p+t04iOTaNe/Vn6Y
	JDgY8c5MMw2BoFbjkVGqHRVEDYTvuIgl+GSkJGzdHsrcjE5GQwuwzDc3
X-Gm-Gg: ASbGncsaRUKZa/u+tLbkBegW9zSn8cvwdy1C9TqjowTfv6oDfE+crxjX4kJoS8qwkh6
	3/X5ukjBNEMnJe31nQQEtZHINmLz++HLSCfyLHQJ+WB9j/XNDStVyw/FZi9jtgce6SKGrhUNDAC
	y5E0iY67roxgRAOcMddkQBBIDyAii9YgKSYvU0rEcR0BuTRKGSNurErhE9CDCDTf64ELCMZXwID
	2SCdf/Ymgid/1kcY1+ZEGTA6iwii7BCceBUr5S+XkRsXZZihh11jB4zXkPwkuPayP2a4kTXcjES
	Y1hBENhClLaA5CeD2y9vLBV/OBKe9s/OeH+wvjzcvyCV1sYaf+PZ0fNcveMlNKP1TJb4TkueFpa
	PsA/7HfZaZxcbhnzgO8+rpsA=
X-Google-Smtp-Source: AGHT+IHwhgWV8yooYfRGYeVXg19yB+ewGgamqw4ZeWf19XrxeCPjfDUQc4P8ITQrx5SyHIXpj22pSQ==
X-Received: by 2002:ac2:51c8:0:b0:553:29a6:339d with SMTP id 2adb3069b0e04-55329a6350dmr4021604e87.8.1748532660200;
        Thu, 29 May 2025 08:31:00 -0700 (PDT)
Date: Thu, 29 May 2025 17:30:58 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, julien@xen.org,
	bertrand.marquis@arm.com, michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com, edgar.iglesias@amd.com
Subject: Re: [PATCH v1 2/3] xen/arm: dom0less: Add trap-unmapped-mmio-disabled
Message-ID: <aDh9svFAad5xjuTr@zapote>
References: <20250527195616.874614-1-edgar.iglesias@gmail.com>
 <20250527195616.874614-3-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2505281736340.135336@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2505281736340.135336@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2025-03-23)

On Wed, May 28, 2025 at 05:41:34PM -0700, Stefano Stabellini wrote:
> On Tue, 27 May 2025, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > 
> > Add the trap-unmapped-mmio-disabled per-domain fdt property.
> > 
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >  docs/misc/arm/device-tree/booting.txt | 7 +++++++
> >  xen/arch/arm/dom0less-build.c         | 3 ++-
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> > index 59fa96a82e..75fbb245d1 100644
> > --- a/docs/misc/arm/device-tree/booting.txt
> > +++ b/docs/misc/arm/device-tree/booting.txt
> > @@ -225,6 +225,13 @@ with the following properties:
> >      option is provided with a non zero value, but the platform doesn't support
> >      SVE.
> >  
> > +- trap-unmapped-mmio-disabled
> > +
> > +    Optional. A boolean property that configures handling of accesses to
> > +    unmapped MMIO ranges.
> > +    If set, guest accesses will read 0xFFFFFFFF and writes ignored.
> > +    If not set, guest accesses will trap.
> 
> I would prefer that we are consistent with the name of the parameter we
> use in libxl and elsewhere so I would stick with trap-unmapped-mmio
> without -disabled.
> 
> We can still default the property to "enabled" when absent. Although
> this is not a common pattern for device tree, it happens and for
> instance the property "status" works that way as it is implied to be
> "enabled" when absent.


Sounds good Stefano,

Boolean DT props have no values so we can't have a default of true since
there wouldn't be a way of setting it to false.
But we can make trap-unmapped-acceses an integer. E.g:

trap-unmapped-acceses = <0>; // Disabled
trap-unmapped-acceses = <1>; // Enabled
// trap-unmapped-acceses not present defaults to Enabled.

I've done this latter for v2, avoiding the -disable suffix.

Cheers,
Edgar


> 
> 
> >  - xen,enhanced
> >  
> >      A string property. Possible property values are:
> > diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> > index e5e13e07d0..cd1ef05d89 100644
> > --- a/xen/arch/arm/dom0less-build.c
> > +++ b/xen/arch/arm/dom0less-build.c
> > @@ -344,8 +344,9 @@ void __init arch_create_domUs(struct dt_device_node *node,
> >  #endif
> >      }
> >  
> > -    /* Trap accesses to unmapped MMIO. */
> >      d_cfg->arch.flags = XEN_ARM_TRAP_UNMAPPED_MMIO;
> > +    if ( dt_property_read_bool(node, "trap-unmapped-mmio-disabled") )
> > +        d_cfg->arch.flags &= ~XEN_ARM_TRAP_UNMAPPED_MMIO;
> >  }
> >  
> >  int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
> > -- 
> > 2.43.0
> > 

