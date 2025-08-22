Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29507B3256C
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 01:31:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090654.1447779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upbEW-0004Fn-Ht; Fri, 22 Aug 2025 23:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090654.1447779; Fri, 22 Aug 2025 23:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upbEW-0004E3-FJ; Fri, 22 Aug 2025 23:31:44 +0000
Received: by outflank-mailman (input) for mailman id 1090654;
 Fri, 22 Aug 2025 23:31:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMUB=3C=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1upbEV-0004Dv-Rh
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 23:31:43 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28005572-7fb0-11f0-a32b-13f23c93f187;
 Sat, 23 Aug 2025 01:31:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3174940344;
 Fri, 22 Aug 2025 23:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C4DC4CEED;
 Fri, 22 Aug 2025 23:31:38 +0000 (UTC)
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
X-Inumbo-ID: 28005572-7fb0-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755905500;
	bh=WXYTLZyn5y5h85M7KdvUs3vMxFksdlg6DFWWMLgMVVQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TL4JoOULfdwBOdgH1iCNLIXgcrhzPrfz8I9M0zr91OKUsDceN4fQTA+2HN9Q3FMkQ
	 1Gt5wzyvQ6D8GQI829+eJHCGilPloDg/TQj9xg47G811cpI2Is5I8OQbiNj+JsX1PL
	 K4AOX8ybpuoisSEjC9Ys5BKBEUN3wgX1+nxPP29fkIXXNiL3knI8IUkxtu3GtPkSO3
	 YYi+MhSKzLygqK9x11wfJIvmKNzChMZdnSdgLCOaCXgrYdWtFh20+EYc6hpSKr2+7R
	 sjud4SN1D570x/V1NFL2EYW+7spArZtgoXCnK/QVHQ/S23Uu3AqDULncpDVMYBcgpC
	 QzhfNFJ/enaeg==
Date: Fri, 22 Aug 2025 16:31:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Mykyta Poturai <Mykyta_Poturai@epam.com>, 
    Luca Fancellu <luca.fancellu@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/3] xen/pci: add discovered PCI device at boot
In-Reply-To: <2ba28d38-3251-492e-b7d8-a626dcaa1035@suse.com>
Message-ID: <alpine.DEB.2.22.394.2508221631310.2743087@ubuntu-linux-20-04-desktop>
References: <cover.1755683961.git.mykyta_poturai@epam.com> <bb2589996131b0e7e645c0af281b9862e2e0f4cb.1755683961.git.mykyta_poturai@epam.com> <26bad9fb-3c4b-4423-a443-3406d07d56e0@suse.com> <df2d1f6a-23bc-4451-a91f-a484b448c467@epam.com>
 <2ba28d38-3251-492e-b7d8-a626dcaa1035@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 22 Aug 2025, Jan Beulich wrote:
> On 22.08.2025 10:03, Mykyta Poturai wrote:
> > On 21.08.25 12:08, Jan Beulich wrote:
> >> On 20.08.2025 14:28, Mykyta Poturai wrote:
> >>> From: Luca Fancellu <luca.fancellu@arm.com>
> >>>
> >>> In dom0less mode, there is no dom0 that can call PCI physdev ops to
> >>> register PCI devices to iommu, so it needs to be done by Xen.
> >>> pci_add_device requires some default domain, we don't have hwdom, and
> >>> the guests are not yet created during the PCI init phase, so use dom_io
> >>> as a temporary sentinel before devices are assigned to their target
> >>> domains.
> >>>
> >>> Rename setup_hwdom_pci_devices to setup_pci_devices and add dom0less
> >>> handling to it.
> >>>
> >>> In pci_add_device there is a call to xsm that doesn't consider the
> >>> requester of the function to be Xen itself, so add a check to skip
> >>> the call if the owner domain is dom_io, since it means the call is
> >>> coming directly from Xen.
> >>>
> >>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> >>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> >>> ---
> >>> (cherry picked from commit eff51e50021b75f5a50533f7de681b2ce044f5bd from
> >>>   the downstream branch poc/pci-passthrough from
> >>>   https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git
> >>>
> >>> v1->v2:
> >>> * integrate add_discovered_pci_devices into existing routines
> >>> * better explain the need for dom_io
> >>
> >> What I continue to miss is an explanation of why devices can't go to their
> >> ultimate "destination" domain right away (once those have been created),
> >> i.e. why the dom_io intermediary is necessary in the first place.
> > 
> > I've done some testing and indeed everything seems to work if we call 
> > pci_add_device directly during domain construction instead of 
> > reassigning them. Do you think this would be a better approach?
> 
> I think so, yes, but first and foremost you'll need Arm maintainer buyoff
> on either approach (or yet another one).

I am OK with that in principle

