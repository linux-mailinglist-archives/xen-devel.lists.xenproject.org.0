Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7301BECC4
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 01:58:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTwaM-00069P-VZ; Wed, 29 Apr 2020 23:57:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWzR=6N=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jTwaL-00069K-HD
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 23:57:49 +0000
X-Inumbo-ID: 3a1d0974-8a75-11ea-99de-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a1d0974-8a75-11ea-99de-12813bfff9fa;
 Wed, 29 Apr 2020 23:57:48 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFCD7206D9;
 Wed, 29 Apr 2020 23:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588204668;
 bh=lyOc+qDnLIA/VmUz/1uihooqx28w/cmElWlWhvNSQ4E=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=nLG/uTXq6mLlc+tvM+1kmZCSktEMPfpdbYfBy+jwuPnIiZAFtfbOD0+eh0R91XPjz
 DzJvugFOJTrD+G27g2g6np0G2RhpXRwM8UWpypilsfzv56SMhNC/qM7jnlZLkDVf9D
 KIqp3bdEDAnewW0PyhC6D6tjQCjaUjCh/7B02Tsc=
Date: Wed, 29 Apr 2020 16:57:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 01/12] xen: introduce xen_dom_flags
In-Reply-To: <aede4742-03e1-e47b-354a-5475f63fff86@suse.com>
Message-ID: <alpine.DEB.2.21.2004291628070.28941@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-1-sstabellini@kernel.org>
 <aede4742-03e1-e47b-354a-5475f63fff86@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 andrew.cooper3@citrix.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 15 Apr 2020, Jan Beulich wrote:
> On 15.04.2020 03:02, Stefano Stabellini wrote:
> > We are passing an extra special boolean flag at domain creation to
> > specify whether we want to the domain to be privileged (i.e. dom0) or
> > not. Another flag will be introduced later in this series.
> > 
> > Introduce a new struct xen_dom_flags and move the privileged flag to it.
> > Other flags will be added to struct xen_dom_flags.
> 
> I'm unsure whether introducing a 2nd structure is worth it here.
> We could as well define some internal-use-only flags for
> struct xen_domctl_createdomain's respective field.

Yep, great idea, I'll do that instead.


> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -529,7 +529,8 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
> >  }
> >  
> >  int arch_domain_create(struct domain *d,
> > -                       struct xen_domctl_createdomain *config)
> > +                       struct xen_domctl_createdomain *config,
> > +                       struct xen_dom_flags *flags)
> 
> const (also elsewhere)?

All of this goes away now, using the exising flag field in
xen_domctl_createdomain, reserving the top 16 bits for internal usage.


> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -706,6 +706,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
> >          .max_maptrack_frames = -1,
> >      };
> >      const char *hypervisor_name;
> > +    struct xen_dom_flags flags = { !pv_shim };
> 
> Here and elsewhere please use field designators right away, even if
> there's only a single field now.
> 
> > @@ -363,7 +363,7 @@ struct domain *domain_create(domid_t domid,
> >      ASSERT(is_system_domain(d) ? config == NULL : config != NULL);
> >  
> >      /* Sort out our idea of is_control_domain(). */
> > -    d->is_privileged = is_priv;
> > +    d->is_privileged =  flags ? flags->is_priv : false;
> 
> Stray double blanks.
> 
> > --- a/xen/common/domctl.c
> > +++ b/xen/common/domctl.c
> > @@ -364,6 +364,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> >      bool_t copyback = 0;
> >      struct xen_domctl curop, *op = &curop;
> >      struct domain *d;
> > +    struct xen_dom_flags flags ={ false };
> 
> Missing blank.
> 
> > --- a/xen/include/xen/domain.h
> > +++ b/xen/include/xen/domain.h
> > @@ -63,8 +63,13 @@ void arch_vcpu_destroy(struct vcpu *v);
> >  int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset);
> >  void unmap_vcpu_info(struct vcpu *v);
> >  
> > +struct xen_dom_flags {
> > +    bool is_priv;
> 
> Use a single bit bitfield instead? May even want to consider passing
> this struct by value then.
 

