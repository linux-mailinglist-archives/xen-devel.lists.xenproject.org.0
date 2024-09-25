Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BEB985E4A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 15:32:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803972.1214818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stS7X-0008On-EY; Wed, 25 Sep 2024 13:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803972.1214818; Wed, 25 Sep 2024 13:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stS7X-0008M7-B3; Wed, 25 Sep 2024 13:31:55 +0000
Received: by outflank-mailman (input) for mailman id 803972;
 Wed, 25 Sep 2024 13:31:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stS7W-0008M1-0P
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 13:31:54 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 867e9f08-7b42-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 15:31:52 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c3d20eed0bso7369587a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 06:31:52 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4c5074sm1859698a12.73.2024.09.25.06.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 06:31:51 -0700 (PDT)
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
X-Inumbo-ID: 867e9f08-7b42-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727271112; x=1727875912; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PAE2ee1swmOim4gwvFplDByytnW2/3H1HURm5GhTg5c=;
        b=C8KgNYF7ZLV5M+N/b+uYftsf4IOteB49GX+QgoK+rMrWcX1gXYgb44kiumOzkyknIq
         Mu5xoj7sCMtHfV+YfjJQMw5SqGbhID46csX8ny9XQ6i7PPLVAtE9W5xkoDbGfzMQZprP
         EL+hK8KINFKuUu5wMRAnWvwED5Y6l1OcT5tAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727271112; x=1727875912;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PAE2ee1swmOim4gwvFplDByytnW2/3H1HURm5GhTg5c=;
        b=BpV22Q8cV+jmJsGQ6piDXIUOMhzrCURf/VVwx7IieNbWLtpCsDL/SYTABueqE0bqBu
         k5+v+wlI3Y7le+nKvvGl4QcMO8VAll5fkNbG+9AXOr4mliKL7aXHPgIu8KaNkzLtJhPF
         XSFxryTMKliP4q1qeHWkgDx1pszmYyIOmP73tRaB1KNZmh691/B5Gk4spYkb2JtNhehg
         zyxkqIK09fTgRCWcyE0tzw1eWXTeRHoPeoM5Td4Aa1XWkcY8/xaFtJNW4kGNVe5MYcbo
         u7anf5B/Fq1Frzwhw/C6GNT6+P7JZo7bPZvrfACOwDtzZxkQcTcoymcJHftR+XJbAfx3
         dXVg==
X-Forwarded-Encrypted: i=1; AJvYcCUh6HHQfxWUAbVo1gYYlC+/BXrO8CL8a9A95CZ1nCCZvkA2J9sdAIttVfZ2/D2edQGlj7ZPHxcMHFk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8XZM8gXKLxvsR4oTZQKy/oJ2xl5W7KZwS+jCnOK3F4KzPHXGQ
	G6GQeixuDUJOSYC4g1bPvVqxmlXr9wy/xXntU3P4tzNkt7FyOJUTeQjQR+Fovg0=
X-Google-Smtp-Source: AGHT+IENCebfeV637mpHTmmYqTIiklMUqdZzLtj2tlBxD2YTEpDSE39bgx9bBIPre1k3kNd1FspxiA==
X-Received: by 2002:a05:6402:2109:b0:5c5:ae24:4616 with SMTP id 4fb4d7f45d1cf-5c72063fef7mr2289125a12.22.1727271112068;
        Wed, 25 Sep 2024 06:31:52 -0700 (PDT)
Date: Wed, 25 Sep 2024 15:31:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: alejandro.vallejo@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 12/22] x86/spec-ctrl: introduce Address Space Isolation
 command line option
Message-ID: <ZvQQxijykD3cJNaJ@macbook.local>
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-13-roger.pau@citrix.com>
 <c30b14a4-3fb2-4e2f-bdcc-81f587540811@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c30b14a4-3fb2-4e2f-bdcc-81f587540811@suse.com>

On Wed, Aug 14, 2024 at 12:10:56PM +0200, Jan Beulich wrote:
> On 26.07.2024 17:21, Roger Pau Monne wrote:
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -2387,7 +2387,7 @@ By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
> >  
> >  ### spec-ctrl (x86)
> >  > `= List of [ <bool>, xen=<bool>, {pv,hvm}=<bool>,
> > ->              {msr-sc,rsb,verw,{ibpb,bhb}-entry}=<bool>|{pv,hvm}=<bool>,
> > +>              {msr-sc,rsb,verw,{ibpb,bhb}-entry,asi}=<bool>|{pv,hvm}=<bool>,
> 
> Is it really appropriate to hide this underneath an x86-only option? Even
> of other architectures won't support it right away, they surely will want
> to down the road? In which case making as much of this common right away
> is probably the best we can do. This goes along with the question whether,
> like e.g. "xpti", this should be a top-level option.

I think it's better placed in spec-ctrl as it's a speculation
mitigation.  I can see your point about sharing with other arches,
maybe when that's needed we can introduce a generic parser of
spec-ctrl options?

It might end up needing slightly different processing for arches
different than x86, as for x86 it should be possible to enable the
option only for PV or HVM domains, while for other arches this might
make no sense for not having PV support.

> > @@ -2414,10 +2414,10 @@ in place for guests to use.
> >  
> >  Use of a positive boolean value for either of these options is invalid.
> >  
> > -The `pv=`, `hvm=`, `msr-sc=`, `rsb=`, `verw=`, `ibpb-entry=` and `bhb-entry=`
> > -options offer fine grained control over the primitives by Xen.  These impact
> > -Xen's ability to protect itself, and/or Xen's ability to virtualise support
> > -for guests to use.
> > +The `pv=`, `hvm=`, `msr-sc=`, `rsb=`, `verw=`, `ibpb-entry=`, `bhb-entry=` and
> > +`asi=` options offer fine grained control over the primitives by Xen.  These
> 
> Here, ahead of "by Xen", it looks like "used" was missing. Maybe a good
> opportunity to add it?

Oh, yes.

> > @@ -2449,6 +2449,11 @@ for guests to use.
> >    is not available (see `bhi-dis-s`).  The choice of scrubbing sequence can be
> >    selected using the `bhb-seq=` option.  If it is necessary to protect dom0
> >    too, boot with `spec-ctrl=bhb-entry`.
> > +* `asi=` offers control over whether the hypervisor will engage in Address
> > +  Space Isolation, by not having sensitive information mapped in the VMM
> > +  page-tables.  Not having sensitive information on the page-tables avoids
> > +  having to perform some mitigations for speculative attacks when
> > +  context-switching to the hypervisor.
> 
> Is "not having" and ...
> 
> > --- a/xen/arch/x86/include/asm/domain.h
> > +++ b/xen/arch/x86/include/asm/domain.h
> > @@ -458,6 +458,9 @@ struct arch_domain
> >      /* Don't unconditionally inject #GP for unhandled MSRs. */
> >      bool msr_relaxed;
> >  
> > +    /* Run the guest without sensitive information in the VMM page-tables. */
> > +    bool asi;
> 
> ... "without" really going to be fully true? Wouldn't we better say "as little
> as possible" or alike?

Maybe better use:

"...by not having sensitive information permanently mapped..."

And a similar adjustment to the comment?

The key point is that we would only map sensitive information
transiently IMO.

> > @@ -143,6 +148,10 @@ static int __init cf_check parse_spec_ctrl(const char *s)
> >              opt_unpriv_mmio = false;
> >              opt_gds_mit = 0;
> >              opt_div_scrub = 0;
> > +
> > +            opt_asi_pv = 0;
> > +            opt_asi_hwdom = 0;
> > +            opt_asi_hvm = 0;
> >          }
> >          else if ( val > 0 )
> >              rc = -EINVAL;
> 
> I'm frequently in trouble when deciding where the split between "=no" and
> "=xen" should be. opt_xpti_* are cleared ahead of the disable_common label;
> considering the similarity I wonder whether the same should be true for ASI
> (as this is also or even mainly about protecting guests from one another),
> or whether the XPTI placement is actually wrong.

Hm, that's a difficult one.  ASI is a Xen implemented mitigation, so
it should be turned off when spec-ctrl=no-xen is used according to the
description of the option:

"spec-ctrl=no-xen can be used to turn off all of Xen’s mitigations"

OTOH, there's no "virtualisation support in place for guests to use"
when no-xen is used.

I have to admin the description for that option is not obviously clear
to me, so 

> > @@ -378,6 +410,13 @@ int8_t __ro_after_init opt_xpti_domu = -1;
> >  
> >  static __init void xpti_init_default(void)
> >  {
> > +    ASSERT(opt_asi_pv >= 0 && opt_asi_hwdom >= 0);
> > +    if ( (opt_xpti_hwdom == 1 || opt_xpti_domu == 1) && opt_asi_pv == 1 )
> 
> There is a separate opt_asi_hwdom which isn't used here, but only ...

opt_asi_pv (and opt_asi_hvm) must be set for opt_asi_hwdom to also be
set.  XPTI is sligtly different, in that XPTI could be set only for
the hwdom by using `xpti=dom0`.

> > +    {
> > +        printk(XENLOG_ERR
> > +               "XPTI is incompatible with Address Space Isolation - disabling ASI\n");
> > +        opt_asi_pv = 0;
> > +    }
> >      if ( (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
> >           cpu_has_rdcl_no )
> >      {
> > @@ -389,9 +428,9 @@ static __init void xpti_init_default(void)
> >      else
> >      {
> >          if ( opt_xpti_hwdom < 0 )
> > -            opt_xpti_hwdom = 1;
> > +            opt_xpti_hwdom = !opt_asi_hwdom;
> >          if ( opt_xpti_domu < 0 )
> > -            opt_xpti_domu = 1;
> > +            opt_xpti_domu = !opt_asi_pv;
> >      }
> 
> ... here?
> 
> It would further seem desirable to me if opt_asi_hwdom had its default set
> later, when we know the kind of Dom0, such that it could be defaulted to
> what opt_asi_{hvm,pv} are set to. This, however, wouldn't be compatible
> with the use here. Perhaps the invocation of xpti_init_default() would
> need deferring, too.

Given the current parsing logic, opt_asi_hwdom will only be set when
both opt_asi_{hvm,pv} are set.  Setting spec-ctrl=asi={pv,hvm} will
only enable ASI for the domUs of the selected mode.

Hence deferring won't make any practical difference, as having
opt_asi_hwdom enabled implies having ASI enabled for all domain
types.

I think the most common case is either having ASI enabled everywhere,
or having ASI enabled only for domUs and the speculation mitigations
also disabled for the hw domain.

> > @@ -643,22 +683,24 @@ static void __init print_details(enum ind_thunk thunk)
> >             opt_eager_fpu                             ? " EAGER_FPU"     : "",
> >             opt_verw_hvm                              ? " VERW"          : "",
> >             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM)  ? " IBPB-entry"    : "",
> > -           opt_bhb_entry_hvm                         ? " BHB-entry"     : "");
> > +           opt_bhb_entry_hvm                         ? " BHB-entry"     : "",
> > +           opt_asi_hvm                               ? " ASI"           : "");
> >  
> >  #endif
> >  #ifdef CONFIG_PV
> > -    printk("  Support for PV VMs:%s%s%s%s%s%s%s\n",
> > +    printk("  Support for PV VMs:%s%s%s%s%s%s%s%s\n",
> >             (boot_cpu_has(X86_FEATURE_SC_MSR_PV) ||
> >              boot_cpu_has(X86_FEATURE_SC_RSB_PV) ||
> >              boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV) ||
> > -            opt_bhb_entry_pv ||
> > +            opt_bhb_entry_pv || opt_asi_pv ||
> >              opt_eager_fpu || opt_verw_pv)            ? ""               : " None",
> >             boot_cpu_has(X86_FEATURE_SC_MSR_PV)       ? " MSR_SPEC_CTRL" : "",
> >             boot_cpu_has(X86_FEATURE_SC_RSB_PV)       ? " RSB"           : "",
> >             opt_eager_fpu                             ? " EAGER_FPU"     : "",
> >             opt_verw_pv                               ? " VERW"          : "",
> >             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV)   ? " IBPB-entry"    : "",
> > -           opt_bhb_entry_pv                          ? " BHB-entry"     : "");
> > +           opt_bhb_entry_pv                          ? " BHB-entry"     : "",
> > +           opt_asi_pv                                ? " ASI"           : "");
> >  
> >      printk("  XPTI (64-bit PV only): Dom0 %s, DomU %s (with%s PCID)\n",
> >             opt_xpti_hwdom ? "enabled" : "disabled",
> 
> Should this printk() perhaps be suppressed when ASI is in use?

Maybe, I found it useful during development to ensure the logic was
correct, but I guess it's not of much use for plain users.  I will
make the printing conditional to ASI not being uniformly enabled.

Maybe it would be useful to unify XPTI printing with the rest of
mitigations listed in the "Support for PV VMs:" line?  Albeit that
would drop the signaling of opt_xpti_hwdom.

Thanks, Roger.

