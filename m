Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA99CA2B83A
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 02:44:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883258.1293302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgDPA-0001Wc-Py; Fri, 07 Feb 2025 01:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883258.1293302; Fri, 07 Feb 2025 01:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgDPA-0001TU-Ms; Fri, 07 Feb 2025 01:43:40 +0000
Received: by outflank-mailman (input) for mailman id 883258;
 Fri, 07 Feb 2025 01:43:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HBwa=U6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tgDP9-0001TO-1u
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 01:43:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1f992e8-e4f4-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 02:43:36 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0C4445C0552;
 Fri,  7 Feb 2025 01:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E971C4CEDD;
 Fri,  7 Feb 2025 01:43:33 +0000 (UTC)
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
X-Inumbo-ID: f1f992e8-e4f4-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738892614;
	bh=qX+bVSMFU/Gl6zSjxoZmhc1YPNMnshJaOTFdFlMl2iA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IK8kgbZSzGOOM0rwUi/PtTcanJrx9Eaos45SWxWUpKgrvTdZZL+1rQ/quvlC5Nwt9
	 LOYb8aWwKDsHQN39EzrQL2F90/F1uph1uid+OqMrmAFlNdrZXx61y8Vph4+jFfBqgs
	 HYAI8A/nja172Fvvj3s27HgXpvVDcI85jKqqayGV6p1hYMS2VpT2oiMzI7UyqBm3K8
	 Q1iaNlFBk8THRw8VAccS/P8Y3rTmzmwbq2mh9Y+9nTUrZNOVC5jTjOK5daDRXbQweY
	 dHyJTWUCKLtBWjYfLUzNCoRDuMfnJiniLvX5cJAScOeZRe3v0voS4V5fRMcOjRLdB6
	 JGiEwpmBOa51w==
Date: Thu, 6 Feb 2025 17:43:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Orzel, Michal" <michal.orzel@amd.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    bertrand.marquis@arm.com, julien@xen.org, Volodymyr_Babchuk@epam.com
Subject: Re: [PATCH v5 8/9] xen/arm: introduce legacy dom0less option for
 xenstore allocation
In-Reply-To: <e7058754-d595-4444-9cd6-da20fcee03aa@amd.com>
Message-ID: <alpine.DEB.2.22.394.2502061732540.619090@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop> <20250206010843.618280-8-stefano.stabellini@amd.com> <e7058754-d595-4444-9cd6-da20fcee03aa@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Feb 2025, Orzel, Michal wrote:
> On 06/02/2025 02:08, Stefano Stabellini wrote:
> > The new xenstore page allocation scheme might break older unpatches
> > Linux kernels that do not check for the Xenstore connection status
> > before proceeding with Xenstore initialization.
> > 
> > Introduce a dom0less configuration option to retain the older behavior,
> > which is not compatible with 1:1 mapped guests, but it will work with
> The issue is for static domains in general - not only for 1:1 guests.
> Static domains without direct map will simply fail on acquire_reserved_page().

I'll clarify


> > older legacy kernel versions.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> >  docs/misc/arm/device-tree/booting.txt |  5 +++++
> >  xen/arch/arm/dom0less-build.c         | 13 ++++++++++++-
> >  xen/arch/arm/include/asm/kernel.h     | 14 +++++++++++---
> >  3 files changed, 28 insertions(+), 4 deletions(-)
> > 
> > diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> > index ff70d44462..8fa3da95be 100644
> > --- a/docs/misc/arm/device-tree/booting.txt
> > +++ b/docs/misc/arm/device-tree/booting.txt
> > @@ -222,6 +222,11 @@ with the following properties:
> >      Xen PV interfaces, including grant-table and xenstore, will be
> >      enabled for the VM.
> >  
> > +    - "legacy"
> > +    Same as above, but the way the xenstore page is allocated is not
> > +    compatible with 1:1 mapped guests. On the other hand, it works with
> Same remark about 1:1
>
> > +    older Linux kernels.
> > +
> >      - "disabled"
> >      Xen PV interfaces are disabled.
> >  
> > diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> > index 046439eb87..9afdbca8b8 100644
> > --- a/xen/arch/arm/dom0less-build.c
> > +++ b/xen/arch/arm/dom0less-build.c
> > @@ -799,6 +799,13 @@ static int __init construct_domU(struct domain *d,
> >          else
> >              panic("At the moment, Xenstore support requires dom0 to be present\n");
> >      }
> > +    else if ( rc == 0 && !strcmp(dom0less_enhanced, "legacy") )
> > +    {
> > +        if ( hardware_domain )
> > +            kinfo.dom0less_feature = DOM0LESS_ENHANCED_LEGACY;
> > +        else
> > +            panic("At the moment, Xenstore support requires dom0 to be present\n");
> > +    }
> >      else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
> >          kinfo.dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
> >  
> > @@ -848,13 +855,17 @@ static int __init construct_domU(struct domain *d,
> >      if ( rc < 0 )
> >          return rc;
> >  
> > -    if ( kinfo.dom0less_feature & DOM0LESS_XENSTORE )
> > +    if ( kinfo.dom0less_feature & (DOM0LESS_XENSTORE|DOM0LESS_XS_LEGACY) )
> Spaces around | operator.

OK


> 
> >      {
> >          ASSERT(hardware_domain);
> >          rc = alloc_xenstore_evtchn(d);
> >          if ( rc < 0 )
> >              return rc;
> > +        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
> > +    }
> >  
> > +    if ( kinfo.dom0less_feature & DOM0LESS_XENSTORE )
> > +    {
> Can I talk you into moving all of these into separate function e.g. alloc_xenstore_params(struct kernel_info *kinfo)?
> It would simplify construct_domU() in which we tend to just call functions responsible for a given functionality.

OK


> >          rc = alloc_xenstore_page(d);
> >          if ( rc < 0 )
> >              return rc;
> > diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> > index de3f945ae5..4c2ae0b32b 100644
> > --- a/xen/arch/arm/include/asm/kernel.h
> > +++ b/xen/arch/arm/include/asm/kernel.h
> > @@ -17,16 +17,24 @@
> >   *                          default features (excluding Xenstore) will be
> >   *                          available. Note that an OS *must* not rely on the
> >   *                          availability of Xen features if this is not set.
> > - * DOM0LESS_XENSTORE:       Xenstore will be enabled for the VM. This feature
> > - *                          can't be enabled without the
> > - *                          DOM0LESS_ENHANCED_NO_XS.
> > + * DOM0LESS_XENSTORE:       Xenstore will be enabled for the VM. The
> > + *                          xenstore page allocation is done by Xen at
> > + *                          domain creation. This feature can't be
> > + *                          enabled without the DOM0LESS_ENHANCED_NO_XS.
> > + * DOM0LESS_XS_LEGACY       Xenstore will be enabled for the VM, the
> > + *                          xenstore page allocation will happen in
> > + *                          init-dom0less. This feature can't be enabled
> > + *                          without the DOM0LESS_ENHANCED_NO_XS.
> >   * DOM0LESS_ENHANCED:       Notify the OS it is running on top of Xen. All the
> >   *                          default features (including Xenstore) will be
> >   *                          available. Note that an OS *must* not rely on the
> >   *                          availability of Xen features if this is not set.
> > + * DOM0LESS_ENHANCED_LEGACY:Same as before, but using DOM0LESS_XS_LEGACY.
> NIT: I would just >> all text by one to have a space after :

OK


> >  #define DOM0LESS_ENHANCED_NO_XS  BIT(0, U)
> >  #define DOM0LESS_XENSTORE        BIT(1, U)
> > +#define DOM0LESS_XS_LEGACY       BIT(2, U)
> > +#define DOM0LESS_ENHANCED_LEGACY (DOM0LESS_ENHANCED_NO_XS | DOM0LESS_XS_LEGACY)
> >  #define DOM0LESS_ENHANCED        (DOM0LESS_ENHANCED_NO_XS | DOM0LESS_XENSTORE)
> >  
> >  struct kernel_info {
> 
> Otherwise, patch is ok.

Thanks for the review

