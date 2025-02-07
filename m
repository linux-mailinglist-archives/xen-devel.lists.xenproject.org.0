Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9708A2B7BE
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 02:20:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883242.1293291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgD20-00067e-PO; Fri, 07 Feb 2025 01:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883242.1293291; Fri, 07 Feb 2025 01:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgD20-00066C-MZ; Fri, 07 Feb 2025 01:19:44 +0000
Received: by outflank-mailman (input) for mailman id 883242;
 Fri, 07 Feb 2025 01:19:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HBwa=U6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tgD1z-000666-6T
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 01:19:43 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ae829cf-e4f1-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 02:19:41 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4B1C7A41023;
 Fri,  7 Feb 2025 01:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86296C4CEE0;
 Fri,  7 Feb 2025 01:19:38 +0000 (UTC)
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
X-Inumbo-ID: 9ae829cf-e4f1-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738891179;
	bh=pFQZJIUFGjYDV23Rdm9vXzsC0sqnVo3YqUYyHKCF0y8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fEgEcHG7TPKDhbeaEEvyIJr5gW9xfyDUtlVuUm2GCa8oDeUtgi2M6Fpbu5GUIGauv
	 /nAYX4zN7LHg1YqblqHc0Nny7DlhBlEFvl/epl9ey2/uxaruPTG5R9T3UULXNOcez/
	 OtztzuNDbT2GdfluISKSBaCflZq8nZAnLCtJb3y9zso3J8pSQlUilrpob2SR2QCkio
	 xKtLn7nbj+0pYEh4CA9CwoWRRuZRoNYlfL6tCAV3PHTFPCufxQ7pr8w8dUlrURvJiB
	 XhK0zZs19+pSFwXrIkScRztAHcJ7EIiXiBUrMXNGSuHzLh3HMmSAeGE6ovZXhcAPbU
	 oe1g10XrTyHTQ==
Date: Thu, 6 Feb 2025 17:19:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Orzel, Michal" <michal.orzel@amd.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    bertrand.marquis@arm.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    Henry Wang <xin.wang2@amd.com>, Alec Kwapis <alec.kwapis@medtronic.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v5 3/9] xen/arm: Alloc XenStore page for Dom0less DomUs
 from hypervisor
In-Reply-To: <b59a3ea2-3b2a-41e2-8bd7-ad2beda414da@amd.com>
Message-ID: <alpine.DEB.2.22.394.2502061719280.619090@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop> <20250206010843.618280-3-stefano.stabellini@amd.com> <b59a3ea2-3b2a-41e2-8bd7-ad2beda414da@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Feb 2025, Orzel, Michal wrote:
> On 06/02/2025 02:08, Stefano Stabellini wrote:
> > From: Henry Wang <xin.wang2@amd.com>
> > 
> > There are use cases (for example using the PV driver) in Dom0less
> > setup that require Dom0less DomUs start immediately with Dom0, but
> > initialize XenStore later after Dom0's successful boot and call to
> > the init-dom0less application.
> > 
> > An error message can seen from the init-dom0less application on
> > 1:1 direct-mapped domains:
> > ```
> > Allocating magic pages
> > memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
> > Error on alloc magic pages
> > ```
> > 
> > The "magic page" is a terminology used in the toolstack as reserved
> > pages for the VM to have access to virtual platform capabilities.
> > Currently the magic pages for Dom0less DomUs are populated by the
> > init-dom0less app through populate_physmap(), and populate_physmap()
> > automatically assumes gfn == mfn for 1:1 direct mapped domains. This
> > cannot be true for the magic pages that are allocated later from the
> > init-dom0less application executed in Dom0. For domain using statically
> > allocated memory but not 1:1 direct-mapped, similar error "failed to
> > retrieve a reserved page" can be seen as the reserved memory list is
> > empty at that time.
> > 
> > Since for init-dom0less, the magic page region is only for XenStore.
> > To solve above issue, this commit allocates the XenStore page for
> > Dom0less DomUs at the domain construction time. The PFN will be
> > noted and communicated to the init-dom0less application executed
> > from Dom0. To keep the XenStore late init protocol, set the connection
> > status to XENSTORE_RECONNECT.
> > 
> > Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
> > Suggested-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> > Signed-off-by: Henry Wang <xin.wang2@amd.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> >  xen/arch/arm/dom0less-build.c | 55 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 54 insertions(+), 1 deletion(-)
> > 
> > diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> > index 49d1f14d65..046439eb87 100644
> > --- a/xen/arch/arm/dom0less-build.c
> > +++ b/xen/arch/arm/dom0less-build.c
> > @@ -1,5 +1,6 @@
> >  /* SPDX-License-Identifier: GPL-2.0-only */
> >  #include <xen/device_tree.h>
> > +#include <xen/domain_page.h>
> >  #include <xen/err.h>
> >  #include <xen/event.h>
> >  #include <xen/grant_table.h>
> > @@ -11,6 +12,8 @@
> >  #include <xen/sizes.h>
> >  #include <xen/vmap.h>
> >  
> > +#include <public/io/xs_wire.h>
> > +
> >  #include <asm/arm64/sve.h>
> >  #include <asm/dom0less-build.h>
> >  #include <asm/domain_build.h>
> > @@ -704,6 +707,53 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
> >      return 0;
> >  }
> >  
> > +#define XENSTORE_PFN_OFFSET 1
> > +static int __init alloc_xenstore_page(struct domain *d)
> > +{
> > +    struct page_info *xenstore_pg;
> > +    struct xenstore_domain_interface *interface;
> > +    mfn_t mfn;
> > +    gfn_t gfn;
> > +    int rc;
> > +
> > +    if ( (UINT_MAX - d->max_pages) < 1 )
> > +    {
> > +        printk(XENLOG_ERR "%pd: Over-allocation for d->max_pages by 1 page.\n",
> > +               d);
> > +        return -EINVAL;
> > +    }
> empty line here

Sure


> > +    d->max_pages += 1;
> If this patch is separate from modifying init-dom0less, max_pages will be bumped twice. Here and in init-dom0less.
> Shouldn't we fold it in? The rest is ok.

OK


