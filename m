Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E55986377
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:28:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804327.1215290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTvt-0002Qb-NA; Wed, 25 Sep 2024 15:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804327.1215290; Wed, 25 Sep 2024 15:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTvt-0002Op-KP; Wed, 25 Sep 2024 15:28:01 +0000
Received: by outflank-mailman (input) for mailman id 804327;
 Wed, 25 Sep 2024 15:27:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stTvr-0002NY-CZ
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:27:59 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd54ccd8-7b52-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 17:27:56 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5365cc68efaso2674917e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:27:57 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930cb0d0sm220739366b.126.2024.09.25.08.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 08:27:55 -0700 (PDT)
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
X-Inumbo-ID: bd54ccd8-7b52-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727278077; x=1727882877; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EL2F4y0Chu2oDgMcvMk58idM9ZEw+LfASdm+ja7/87I=;
        b=eB9Ffk9Payxcvmal26lulA/qxYbXzTxdx0dD0A9uJ/1VyxQvqTMhpSezNjVYgUsli7
         vdPOicp2lRkOhjuTOmUJ3YgFy+342a6GHjnIZ+CSAR9zUVTOCdu1hVnPVQLyPuyQ4ffN
         sdhV2+jH4Yn7CJEVcHAKo+4BjwAYz/0OTFbBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727278077; x=1727882877;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EL2F4y0Chu2oDgMcvMk58idM9ZEw+LfASdm+ja7/87I=;
        b=LKGZ3tMnLIJ+zVE0eKN+S0rsu6MVaEskhwWpDpc5HATuuxav4I1bKls8gQdFPwwB44
         DnYGE+o5Td0b4xhIcy0oa9XoQMxCa1gONBs75DfWGfHXPOjinRWWXnAGSbJ6dx+AZv/W
         Vms+bEoBjAr6y14q+ybkQdASZbcd7Gr4Ih6/W97qeBh0G7uoDE0JLFbLSeQQuKlbqWco
         YOs0nFWPBa9VzCvMENaq8gShJ2AXmJWpitaeieb4xXqik2ZanrWdpGKGGSAVbLftkuAp
         5zIPeiZRGNOgX1M+COdLBtKf9x/aAYwU1MmAUKPbFVOQREbLUjGe+RIyTwE2lVzlhYHC
         nlhg==
X-Forwarded-Encrypted: i=1; AJvYcCX4PS583gTIWQnbmQ+K98Qm2e3D9aegFMG11Mhj3HLCc3f9k82V6K8Q3EwXWrQCpmcNz9PeXlVJswY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyywPp0bqXOJSobAHqWtA0ZLMPcVAyVaheRd5wGHvp34TW4qdzg
	n7dhQXhM7oK27CCW5eBa1szS0OxPbvi6adK+d69U5e9vX/O97YCPTu912loERuY=
X-Google-Smtp-Source: AGHT+IE4I2z7fQ1qc1ABh13BaN+vOPbu3GCxDomVyikP/mnutledSnm2t0nsmngFO01RpuP0Gj+qLw==
X-Received: by 2002:a05:6512:ac4:b0:533:901:e455 with SMTP id 2adb3069b0e04-5387048bc50mr1717479e87.2.1727278075900;
        Wed, 25 Sep 2024 08:27:55 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:27:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: alejandro.vallejo@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 12/22] x86/spec-ctrl: introduce Address Space Isolation
 command line option
Message-ID: <ZvQr-n2gwWnWiJEW@macbook.local>
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-13-roger.pau@citrix.com>
 <c30b14a4-3fb2-4e2f-bdcc-81f587540811@suse.com>
 <ZvQQxijykD3cJNaJ@macbook.local>
 <49bd385d-f27a-4ca6-b0d2-56a458b44a84@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49bd385d-f27a-4ca6-b0d2-56a458b44a84@suse.com>

On Wed, Sep 25, 2024 at 04:03:04PM +0200, Jan Beulich wrote:
> On 25.09.2024 15:31, Roger Pau Monné wrote:
> > On Wed, Aug 14, 2024 at 12:10:56PM +0200, Jan Beulich wrote:
> >> On 26.07.2024 17:21, Roger Pau Monne wrote:
> >>> --- a/docs/misc/xen-command-line.pandoc
> >>> +++ b/docs/misc/xen-command-line.pandoc
> >>> @@ -2387,7 +2387,7 @@ By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
> >>>  
> >>>  ### spec-ctrl (x86)
> >>>  > `= List of [ <bool>, xen=<bool>, {pv,hvm}=<bool>,
> >>> ->              {msr-sc,rsb,verw,{ibpb,bhb}-entry}=<bool>|{pv,hvm}=<bool>,
> >>> +>              {msr-sc,rsb,verw,{ibpb,bhb}-entry,asi}=<bool>|{pv,hvm}=<bool>,
> >>
> >> Is it really appropriate to hide this underneath an x86-only option? Even
> >> of other architectures won't support it right away, they surely will want
> >> to down the road? In which case making as much of this common right away
> >> is probably the best we can do. This goes along with the question whether,
> >> like e.g. "xpti", this should be a top-level option.
> > 
> > I think it's better placed in spec-ctrl as it's a speculation
> > mitigation.
> 
> As is XPTI.

But XPTI predates the introduction of spec-ctrl option, I assumed
that's why xpti is not part of spec-ctrl.

> >  I can see your point about sharing with other arches,
> > maybe when that's needed we can introduce a generic parser of
> > spec-ctrl options?
> 
> Not sure how much could be generalized there.

Oh, so your point was not about sharing the parsing code, but sharing
the command line documentation about it, sorry, I missed that.

Along the lines of:

asi= boolean | { pv, hvm, hwdom }

Or similar?

Even then sub-options would likely be different between architectures.

> >>> @@ -143,6 +148,10 @@ static int __init cf_check parse_spec_ctrl(const char *s)
> >>>              opt_unpriv_mmio = false;
> >>>              opt_gds_mit = 0;
> >>>              opt_div_scrub = 0;
> >>> +
> >>> +            opt_asi_pv = 0;
> >>> +            opt_asi_hwdom = 0;
> >>> +            opt_asi_hvm = 0;
> >>>          }
> >>>          else if ( val > 0 )
> >>>              rc = -EINVAL;
> >>
> >> I'm frequently in trouble when deciding where the split between "=no" and
> >> "=xen" should be. opt_xpti_* are cleared ahead of the disable_common label;
> >> considering the similarity I wonder whether the same should be true for ASI
> >> (as this is also or even mainly about protecting guests from one another),
> >> or whether the XPTI placement is actually wrong.
> > 
> > Hm, that's a difficult one.  ASI is a Xen implemented mitigation, so
> > it should be turned off when spec-ctrl=no-xen is used according to the
> > description of the option:
> > 
> > "spec-ctrl=no-xen can be used to turn off all of Xen’s mitigations"
> 
> Meaning (aiui) mitigations to protect Xen itself.

So that would speculation attacks that take place in Xen context,
which is what ASI would protect against?

I don't have a strong opinion, but I also have a hard time seeing what
should `no-xen` disable.

> >>> @@ -378,6 +410,13 @@ int8_t __ro_after_init opt_xpti_domu = -1;
> >>>  
> >>>  static __init void xpti_init_default(void)
> >>>  {
> >>> +    ASSERT(opt_asi_pv >= 0 && opt_asi_hwdom >= 0);
> >>> +    if ( (opt_xpti_hwdom == 1 || opt_xpti_domu == 1) && opt_asi_pv == 1 )
> >>
> >> There is a separate opt_asi_hwdom which isn't used here, but only ...
> > 
> > opt_asi_pv (and opt_asi_hvm) must be set for opt_asi_hwdom to also be
> > set.  XPTI is sligtly different, in that XPTI could be set only for
> > the hwdom by using `xpti=dom0`.
> 
> Hmm, I didn't even notice this oddity (as it feels to me) in parsing.
> From the doc provided it wouldn't occur to me that e.g. "asi=pv" won't
> affect a PV Dom0. That's (iirc) specifically why "xpti=" has a "hwdom"
> sub-option.

It seems to be like that for all spec-ctrl options, see `bhb-entry`
for example.

> >>> @@ -643,22 +683,24 @@ static void __init print_details(enum ind_thunk thunk)
> >>>             opt_eager_fpu                             ? " EAGER_FPU"     : "",
> >>>             opt_verw_hvm                              ? " VERW"          : "",
> >>>             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM)  ? " IBPB-entry"    : "",
> >>> -           opt_bhb_entry_hvm                         ? " BHB-entry"     : "");
> >>> +           opt_bhb_entry_hvm                         ? " BHB-entry"     : "",
> >>> +           opt_asi_hvm                               ? " ASI"           : "");
> >>>  
> >>>  #endif
> >>>  #ifdef CONFIG_PV
> >>> -    printk("  Support for PV VMs:%s%s%s%s%s%s%s\n",
> >>> +    printk("  Support for PV VMs:%s%s%s%s%s%s%s%s\n",
> >>>             (boot_cpu_has(X86_FEATURE_SC_MSR_PV) ||
> >>>              boot_cpu_has(X86_FEATURE_SC_RSB_PV) ||
> >>>              boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV) ||
> >>> -            opt_bhb_entry_pv ||
> >>> +            opt_bhb_entry_pv || opt_asi_pv ||
> >>>              opt_eager_fpu || opt_verw_pv)            ? ""               : " None",
> >>>             boot_cpu_has(X86_FEATURE_SC_MSR_PV)       ? " MSR_SPEC_CTRL" : "",
> >>>             boot_cpu_has(X86_FEATURE_SC_RSB_PV)       ? " RSB"           : "",
> >>>             opt_eager_fpu                             ? " EAGER_FPU"     : "",
> >>>             opt_verw_pv                               ? " VERW"          : "",
> >>>             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV)   ? " IBPB-entry"    : "",
> >>> -           opt_bhb_entry_pv                          ? " BHB-entry"     : "");
> >>> +           opt_bhb_entry_pv                          ? " BHB-entry"     : "",
> >>> +           opt_asi_pv                                ? " ASI"           : "");
> >>>  
> >>>      printk("  XPTI (64-bit PV only): Dom0 %s, DomU %s (with%s PCID)\n",
> >>>             opt_xpti_hwdom ? "enabled" : "disabled",
> >>
> >> Should this printk() perhaps be suppressed when ASI is in use?
> > 
> > Maybe, I found it useful during development to ensure the logic was
> > correct, but I guess it's not of much use for plain users.  I will
> > make the printing conditional to ASI not being uniformly enabled.
> > 
> > Maybe it would be useful to unify XPTI printing with the rest of
> > mitigations listed in the "Support for PV VMs:" line?  Albeit that
> > would drop the signaling of opt_xpti_hwdom.
> 
> Which is why I wouldn't want to "unify" it.

Right I will avoid printing the line if ASI is uniformly enabled.

Thanks, Roger.

