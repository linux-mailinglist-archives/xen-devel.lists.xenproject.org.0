Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E8BA5B5E5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 02:33:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906986.1314302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1troU6-0007LD-P1; Tue, 11 Mar 2025 01:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906986.1314302; Tue, 11 Mar 2025 01:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1troU6-0007Ia-Ll; Tue, 11 Mar 2025 01:32:42 +0000
Received: by outflank-mailman (input) for mailman id 906986;
 Tue, 11 Mar 2025 01:32:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzKm=V6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1troU5-0007IU-GJ
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 01:32:41 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b77e5b3a-fe18-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 02:32:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A6A4CA40FBE;
 Tue, 11 Mar 2025 01:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07DBDC4CEE5;
 Tue, 11 Mar 2025 01:32:35 +0000 (UTC)
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
X-Inumbo-ID: b77e5b3a-fe18-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741656757;
	bh=QTKu+8e++YU4ykPXa/W2YQNbcG1tqKeLylpql7nWwlM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nyzBeRTInu44PfV4vVMDBAvNrS+JQDB5ubOh2xbcBEofadPGvavZ6eYqreZ1qixZp
	 befitWZ4067zUBMXaAZ9YYP3IORg7ObbaLK/QNdsUKs2ZtLZKJxEcfssLAnikpM5xL
	 ypedjk3u4xPWfWaq22zBNleaL5BsfFWoGaBj/PGOX9PEE5K+ZfzTzr6rbfIdb8y71l
	 8SsEq+jEaJ/RbZv6zloabh7CiIn5QB1H/OUXfWzTev9jg60xp8llzi6JLqmYDZHkHb
	 Ehqs7auhfDEQKgBekmATlzlGdEEhcHZEXTVriz0SRIdfbRjqKJdS/zopHCX4jC2qvO
	 0K2zYZFIEF3qg==
Date: Mon, 10 Mar 2025 18:32:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 05/23] xen/arm: Add capabilities to dom0less
In-Reply-To: <cdb05727-fd2f-4b83-9200-d88789ce908e@xen.org>
Message-ID: <alpine.DEB.2.22.394.2503101823240.3090675@ubuntu-linux-20-04-desktop>
References: <20250306220343.203047-1-jason.andryuk@amd.com> <20250306220343.203047-6-jason.andryuk@amd.com> <254e38d3-ebc2-4044-9d0f-9be9f652c46c@xen.org> <92eca43f-1dc8-4eec-a124-e715d118ab03@amd.com> <01df1e44-a2cb-4e93-8b9d-99aca914db68@xen.org>
 <09103c2b-a7c0-44d5-8eb5-2d0fcb01c26e@amd.com> <cdb05727-fd2f-4b83-9200-d88789ce908e@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2028676297-1741656757=:3090675"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2028676297-1741656757=:3090675
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 8 Mar 2025, Julien Grall wrote:
> On 08/03/2025 00:02, Jason Andryuk wrote:
> > On 2025-03-07 16:21, Julien Grall wrote:
> > > Hi Jason,
> > > 
> > > On 07/03/2025 17:58, Jason Andryuk wrote:
> > > > On 2025-03-07 04:01, Julien Grall wrote:
> > > > > Hi,
> > > > > 
> > > > > On 06/03/2025 22:03, Jason Andryuk wrote:
> > > > > > Add capabilities property to dom0less to allow building a
> > > > > > disaggregated system.
> > > > > > 
> > > > > > Introduce bootfdt.h to contain these constants.
> > > > > > 
> > > > > > When using the hardware or xenstore capabilities, adjust the grant
> > > > > > and
> > > > > > event channel limits similar to dom0.
> > > > >  > > Also for the hardware domain, set directmap and iommu.  This
> > > > > brings its
> > > > > > configuration in line with a dom0.
> > > > > 
> > > > > Looking the device tree bindings, a user would be allowed to disable
> > > > > "passthrough" or even "directmap". This means, we would never be able
> > > > > to disable "directmap" for the hardware domain in the future with the
> > > > > existing property (this is to avoid break backwards compatibility).
> > > > > 
> > > > > Instead, I think we should check what the user provided and confirm
> > > > > this is matching our expectation for an hardware domain.
> > > >  >
> > > > > That said, I am not entirely sure why we should force directmap for
> > > > > the HW domain. We are starting from a clean slate, so I think it would
> > > > > be better to have by default no directmap and imposing the presence of
> > > > > an IOMMU in the system.
> > > > 
> > > > Ok, it seems like directmap is not necessary.  It was helpful early on
> > > > to get things booting, but I think it's no longer necessary after
> > > > factoring out construct_hwdom().
> > > > 
> > > > What exactly do you mean by imposing with respect to the iommu? Require
> > > > one, or mirror the dom0 code and set it for the hwdom?
> > > > 
> > > >      if ( iommu_enabled )
> > > >          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> > > 
> > > I mean requires one. Without it, you would need to set directmap and I
> > > don't think this should be allowed (at least for now) for the HW domain.
> > > 
> > > > 
> > > > > Lastly, can you provide an example of what the hardware domain DT node
> > > > > would looke like?
> > > > 
> > > > I've attached a dump of /sys/firmware/fdt from hwdom.  (This is direct
> > > > mapped).
> > > 
> > > Sorry if this was not clear, I am asking for the configuration you wrote
> > > in the host DT for create the hardware domain. I am interested to know
> > > which properties you set...
> > 
> > I've attached the u-boot fdt commands which generate the DT.  Hopefully that
> > works for you.
> > 
> > > > 
> > > > > > --- a/xen/arch/arm/dom0less-build.c
> > > > > > +++ b/xen/arch/arm/dom0less-build.c
> > > > > > @@ -12,6 +12,7 @@
> > > > > >   #include <xen/sizes.h>
> > > > > >   #include <xen/vmap.h>
> > > > > > +#include <public/bootfdt.h>
> > > > > >   #include <public/io/xs_wire.h>
> > > > > >   #include <asm/arm64/sve.h>
> > > > > > @@ -994,6 +995,34 @@ void __init create_domUs(void)
> > > > > >           if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
> > > > > >               panic("No more domain IDs available\n");
> > > > > > +        if ( dt_property_read_u32(node, "capabilities", &val) )
> > > > > > +        {
> > > > > > +            if ( val & ~DOMAIN_CAPS_MASK )
> > > > > > +                panic("Invalid capabilities (%"PRIx32")\n", val);
> > > > > > +
> > > > > > +            if ( val & DOMAIN_CAPS_CONTROL )
> > > > > > +                flags |= CDF_privileged;
> > > > > > +
> > > > > > +            if ( val & DOMAIN_CAPS_HARDWARE )
> > > > > > +            {
> > > > > > +                if ( hardware_domain )
> > > > > > +                    panic("Only 1 hardware domain can be specified!
> > > > > > (%pd)\n",
> > > > > > +                           hardware_domain);
> > > > > > +
> > > > > > +                d_cfg.max_grant_frames = gnttab_dom0_frames();
> > > > > > +                d_cfg.max_evtchn_port = -1;
> > > > > 
> > > > > What about d_cfg.arch.nr_spis? Are we expecting the user to pass
> > > > > "nr_spis"?
> > > > 
> > > > Further down, when nr_spis isn't specified in the DT, it defaults to:
> > > >      d_cfg.arch.nr_spis = gic_number_lines() - 32;
> > > 
> > > Thanks. One further question, what if the user pass "nr_spis" for the HW
> > > domain. Wouldn't this result to more issue further down the line?
> > 
> > I'm not familiar with ARM, so I'll to whatever is best.  I did put the
> > capabilities first, thinking it would set defaults, and then later options
> > could override them.
> 
> I am not sure it is related to Arm. It is more that the HW domain is going to
> re-use the memory layout of the host (this is including the mapping for the
> GIC) and also have all the irqs with pirq == virq.
> 
> I am a bit concerned that letting the users mistakenly tweaking the defaults
> could prevent attaching devices (for instance if the IRQ ID is above >
> nr_spis).
> 
> > 
> > > > 
> > > > Dom0 does:
> > > >      /*
> > > >       * Xen vGIC supports a maximum of 992 interrupt lines.
> > > >       * 32 are substracted to cover local IRQs.
> > > >       */
> > > >      dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992)
> > > > - 32;
> > > >      if ( gic_number_lines() > 992 )
> > > >          printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.
> > > > \n");
> > > > 
> > > > So I think it's fine as-is?  I could add the min() and warning if you
> > > > think it's necessary.
> > > 
> > > Regardless this discussion, I wonder why we didn't add the min(...) here
> > > like for dom0 because we are using the same vGIC emulation. So the max
> > > SPIs supported is the same...
> > > 
> > > What I am trying to understand is whether it is ok to allow the user to
> > > select "nr_spis", "vpl011" & co if they are either not honored (like for
> > > vpl011) or could introduce further issue (like for nr_spis as the HW
> > > domain is supposed to have the same configuration as dom0).
> > > 
> > > I also don't think it is a good idea to silently ignore what the user
> > > requested. So far, on Arm, we mainly decided to reject/panic early if the
> > > setup is not correct.
> > 
> > Again, I'll do whatever is best.
> 
> Bertrand, Michal, Stefano, any opinions?

As a first step, I would try to make the hardware domain as similar as
dom0 as possible in terms of these configurations. That's because I
would prioritize having something working reliably. So I think it is OK
to panic if the provided configuration is not what we expect, such as
"nr_spis" being provided.

direct-map is different because we know dom0 works fine today without
it, as an example cache coloring requires it. So I think it could be
a good idea to default direct-map to off, also to align better with
the DomU DT bindings. But the address map should still match the host
layout.
--8323329-2028676297-1741656757=:3090675--

