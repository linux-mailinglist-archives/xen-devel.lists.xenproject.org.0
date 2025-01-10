Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67212A09471
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 15:56:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869762.1281225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWGQb-0008BK-M3; Fri, 10 Jan 2025 14:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869762.1281225; Fri, 10 Jan 2025 14:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWGQb-00088c-J2; Fri, 10 Jan 2025 14:56:01 +0000
Received: by outflank-mailman (input) for mailman id 869762;
 Fri, 10 Jan 2025 14:55:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0bo=UC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tWGQZ-00088W-O5
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 14:55:59 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffaff272-cf62-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 15:55:57 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aaeecbb7309so399492766b.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 06:55:57 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c905ecb7sm173795666b.26.2025.01.10.06.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 06:55:56 -0800 (PST)
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
X-Inumbo-ID: ffaff272-cf62-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736520957; x=1737125757; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RDPcXxyy2Ta5dtW2V7jkkmgY2NR22UEPefzBYuSQvRg=;
        b=Ou9cVUM7KY0OyS7WYUXT1tYyHS7l64/vH/LnWUfg6N5v8Hxywfwvln7vlnoesk0XdH
         NU70/qNXYzM3lCLEf1TgHAD5UJmShCaRlsteSqn9i2xAgoM9Tn/Elv0E6+eoOMWpgs4i
         WLSCKMTBmJpvM2l6S0Ymv/jMm/+ACO6EMOCe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736520957; x=1737125757;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RDPcXxyy2Ta5dtW2V7jkkmgY2NR22UEPefzBYuSQvRg=;
        b=Dr5Hju/25TwV0zweFKhF2jKkWQAmXxbiz6ae+z+yuJHThKCGt4RM7ruMn0T2BlovSM
         E/O9swgqOUeNYuIbNfSPU9hDiUzXpONeFOCUpZXzflvSK4tkRx1SGbVZ5YEZoPhmyHyU
         Nv0ow4NoV9tCKcS/eU1qe3VNzDMSyOYwYtmyjmDbOgci6lgSM/CsIjzImh9CUUJLtPOG
         dfNSiYOZM4VqVmLcnkfJ3Gv1yzWAnBZvrGTEvowwJ4qEJnU+nY4r1IedLOHVwfoo/oVd
         bQJG+SCMl3vbaAF9R3jB2g27g9XG+1lhROg/pAe0Kp/ejzBQ7IO8jmANwkh70z83LLxD
         2kYg==
X-Gm-Message-State: AOJu0YzAZPFgJpaMDR9faCrCQGX5KH43gAtg5ajhzNse1q1aZL/BfiWU
	N7sNCZBzzzq2TLWQd4NPVttr8zrUtsHwJmAc5rg77ACcM+DmxJtxDFYgI3hlssI=
X-Gm-Gg: ASbGncvIak9Ht5h1v8ZtWM6bC9g4yL/4SsrRkdyrlVAakUMITWhzL0kfbNtAzF16PzT
	AA/XIw9v/Ab4LN8dTlZKdPYXpZByXXQFm8vIhFGxS6G66t3EHH3ApPxVCB41uoo659rHVIjkH4E
	we3RarNPZtwetHYYAJjtvfGGgGNUy4lsw08Md7imMGmveOneH1GbN9uSMh1h3kM6wuJEJcVuqOM
	Nb+c1qHKQa77AO1D05fMdw+4JHgr3y8XSwbWHeVLDhbTGB+SWs/EcXJjihSX2B5Vkg=
X-Google-Smtp-Source: AGHT+IFici5Pug04ZUP65IU/rev0PsQbFH12k5vwuLldTqQf2Mn+SI3qFq9kOwLZLcZF5RLXHX0iRQ==
X-Received: by 2002:a17:907:809:b0:aaf:117c:e929 with SMTP id a640c23a62f3a-ab2abcb1440mr1002849366b.57.1736520957010;
        Fri, 10 Jan 2025 06:55:57 -0800 (PST)
Date: Fri, 10 Jan 2025 15:55:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 13/18] x86/spec-ctrl: introduce Address Space
 Isolation command line option
Message-ID: <Z4E0-5KUWh2AJu50@macbook.local>
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-14-roger.pau@citrix.com>
 <D6XMQD34DXRE.24L7RC2WUI298@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D6XMQD34DXRE.24L7RC2WUI298@cloud.com>

On Thu, Jan 09, 2025 at 02:58:29PM +0000, Alejandro Vallejo wrote:
> On Wed Jan 8, 2025 at 2:26 PM GMT, Roger Pau Monne wrote:
> > No functional change, as the option is not used.
> >
> > Introduced new so newly added functionality is keyed on the option being
> > enabled, even if the feature is non-functional.
> >
> > When ASI is enabled for PV domains, printing the usage of XPTI might be
> > omitted if it must be uniformly disabled given the usage of ASI.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - Improve comments and documentation about what ASI provides.
> >  - Do not print the XPTI information if ASI is used for pv domUs and dom0 is
> >    PVH, or if ASI is used for both domU and dom0.
> >
> > FWIW, I would print the state of XPTI uniformly, as otherwise I find the output
> > might be confusing for user expecting to assert the state of XPTI.
> > ---
> >  docs/misc/xen-command-line.pandoc    |  19 +++++
> >  xen/arch/x86/include/asm/domain.h    |   3 +
> >  xen/arch/x86/include/asm/spec_ctrl.h |   2 +
> >  xen/arch/x86/spec_ctrl.c             | 115 +++++++++++++++++++++++++--
> >  4 files changed, 133 insertions(+), 6 deletions(-)
> >
> > diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> > index 08b0053f9ced..3c1ad7b5fe7d 100644
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -202,6 +202,25 @@ to appropriate auditing by Xen.  Argo is disabled by default.
> >      This option is disabled by default, to protect domains from a DoS by a
> >      buggy or malicious other domain spamming the ring.
> >  
> > +### asi (x86)
> > +> `= List of [ <bool>, {pv,hvm}=<bool>,
> > +               {vcpu-pt}=<bool>|{pv,hvm}=<bool> ]`
> 
> nit: While this grows later, the braces around vcpu-pt aren't strictly needed here.

Since I have to modify the whole line I can indeed add the braces
later.

> > +
> > +Offers control over whether the hypervisor will engage in Address Space
> > +Isolation, by not having potentially sensitive information permanently mapped
> > +in the VMM page-tables.  Using this option might avoid the need to apply
> > +mitigations for certain speculative related attacks, at the cost of mapping
> > +sensitive information on-demand.
> 
> Might be worth mentioning that this provides some defense in depth against
> unmitigated attacks too.

It's IMO a bit too vague to make such promises, but I can add:

Offers control over whether the hypervisor will engage in Address Space
Isolation, by not having potentially sensitive information permanently mapped
in the VMM page-tables.  Using this option might avoid the need to apply
mitigations for certain speculative related attacks, at the cost of mapping
sensitive information on-demand.  It might also offer some protection
against unmitigated speculation-related attacks.

> > +
> > +* `pv=` and `hvm=` sub-options allow enabling for specific guest types.
> > +
> > +**WARNING: manual de-selection of enabled options will invalidate any
> > +protection offered by the feature.  The fine grained options provided below are
> > +meant to be used for debugging purposes only.**
> > +
> > +* `vcpu-pt` ensure each vCPU uses a unique top-level page-table and setup a
> > +  virtual address space region to map memory on a per-vCPU basis.
> > +
> >  ### asid (x86)
> >  > `= <boolean>`
> >  
> > diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
> > index ced84750015c..9463a8624701 100644
> > --- a/xen/arch/x86/spec_ctrl.c
> > +++ b/xen/arch/x86/spec_ctrl.c
> > @@ -2075,6 +2165,19 @@ void __init init_speculation_mitigations(void)
> >           hw_smt_enabled && default_xen_spec_ctrl )
> >          setup_force_cpu_cap(X86_FEATURE_SC_MSR_IDLE);
> >  
> > +    /* Disable all ASI options by default until feature is finished. */
> > +    if ( opt_vcpu_pt_pv == -1 )
> > +        opt_vcpu_pt_pv = 0;
> > +    if ( opt_vcpu_pt_hwdom == -1 )
> > +        opt_vcpu_pt_hwdom = 0;
> > +    if ( opt_vcpu_pt_hvm == -1 )
> > +        opt_vcpu_pt_hvm = 0;
> 
> Why not preinitialise them to zero instead in the static declarations?

Hm, indeed.  I can probably make them booleans then.  I wrongly
recall that checking whether they haven't been initialized was needed
somewhere, but that doesn't seem to be the case.

Thanks, Roger.

