Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A346BC2E6
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 01:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510278.787660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcbeb-0004te-AD; Thu, 16 Mar 2023 00:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510278.787660; Thu, 16 Mar 2023 00:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcbeb-0004rw-6I; Thu, 16 Mar 2023 00:39:37 +0000
Received: by outflank-mailman (input) for mailman id 510278;
 Thu, 16 Mar 2023 00:39:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oCnM=7I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pcbeZ-0004rq-T8
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 00:39:35 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03dcae0f-c393-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 01:39:31 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 89A54B81F9A;
 Thu, 16 Mar 2023 00:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427E4C433EF;
 Thu, 16 Mar 2023 00:39:27 +0000 (UTC)
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
X-Inumbo-ID: 03dcae0f-c393-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678927169;
	bh=+z7iXm8M00j92yMchJ73P7cbvZLqxnT0O0mqa98ex+E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kr9rPkvaI87hYCMrFwB7XR59/z2zBgudu9uYWWIhutHNFYNfpPEfp+sqQMpKyiNZs
	 GadS3OXYxZ4eUNeBh8iIRqSE6jRJxASSjvJEJnVs5rp6ZOd+nD9G5HdoswK/YUXsEU
	 Nv65XBfbtPFDG5ntV26SfWKgrQR//QrDzEYKU7YHi77Ny0go6FgWlZeFE/PKWsvBDq
	 7JE/2JRU+t7Ui9kATWntj0D7Kvk9mqqGAF7MWDfe6cc5DAEe77ghwOIeABig7fjbYm
	 AHi6wpuhAwRK04NinFKzh6Pr8+0twQCy7BeBvke5td+bg9b6m9aSO9sYWcQYD76tw+
	 4P14AAApscDPg==
Date: Wed, 15 Mar 2023 17:39:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Huang Rui <ray.huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
    =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Xenia Ragiadakou <burzalodowa@gmail.com>, 
    Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, 
    Chen Jiqian <Jiqian.Chen@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [RFC XEN PATCH 4/6] x86/pvh: PVH dom0 also need PHYSDEVOP_setup_gsi
 call
In-Reply-To: <alpine.DEB.2.22.394.2303151723190.3462@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2303151737380.3462@ubuntu-linux-20-04-desktop>
References: <20230312075455.450187-1-ray.huang@amd.com> <20230312075455.450187-5-ray.huang@amd.com> <c51bcc5b-4f90-5651-de3d-df47bdf4a04a@suse.com> <521ccacd-a45a-f55a-72ed-de6b64bca050@citrix.com>
 <alpine.DEB.2.22.394.2303151723190.3462@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Mar 2023, Stefano Stabellini wrote:
> On Wed, 15 Mar 2023, Andrew Cooper wrote:
> > On 14/03/2023 4:30 pm, Jan Beulich wrote:
> > > On 12.03.2023 08:54, Huang Rui wrote:
> > >> From: Chen Jiqian <Jiqian.Chen@amd.com>
> > > An empty description won't do here. First of all you need to address the Why?
> > > As already hinted at in the reply to the earlier patch, it looks like you're
> > > breaking the intended IRQ model for PVH.
> > 
> > I think this is rather unfair.
> > 
> > Until you can point to the document which describes how IRQs are
> > intended to work in PVH, I'd say this series is pretty damn good attempt
> > to make something that functions, in the absence of any guidance.
> 
> And to make things more confusing those calls are not needed for PVH
> itself, those calls are needed so that we can run QEMU to support
> regular HVM guests on PVH Dom0 (I'll let Ray confirm.)
> 
> So technically, this is not breaking the PVH IRQ model.

To add more info:

QEMU (hw/xen/xen_pt.c) calls xc_physdev_map_pirq and
xc_domain_bind_pt_pci_irq. Note that xc_domain_bind_pt_pci_irq is the
key hypercall here and it takes a pirq as parameter.

That is why QEMU calls xc_physdev_map_pirq, so that we can get the pirq
and use the pirq as parameter for xc_domain_bind_pt_pci_irq.

We need to get the above to work also with Dom0 PVH.

