Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9A647E7EC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Dec 2021 20:06:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251160.432413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0TPy-0003fD-Qu; Thu, 23 Dec 2021 19:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251160.432413; Thu, 23 Dec 2021 19:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0TPy-0003cy-Nn; Thu, 23 Dec 2021 19:06:22 +0000
Received: by outflank-mailman (input) for mailman id 251160;
 Thu, 23 Dec 2021 19:06:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yk4J=RI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n0TPw-0003cs-UR
 for xen-devel@lists.xenproject.org; Thu, 23 Dec 2021 19:06:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67fad821-6423-11ec-bb0b-79c175774b5d;
 Thu, 23 Dec 2021 20:06:19 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BCD2961F3F;
 Thu, 23 Dec 2021 19:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACDB9C36AE9;
 Thu, 23 Dec 2021 19:06:15 +0000 (UTC)
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
X-Inumbo-ID: 67fad821-6423-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640286376;
	bh=T7SsKIyn7JWn4UKKcnnJm2co5Hs0PE+q/1wtRdLU5ME=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=u9nht8sgXBeDBP/8+pCxw536htt7cY8bAzNfySBKx3sXR9Ih7Jp0C1qfyfI8MjyLT
	 NnJrEktWuBPzpTvoHmpnAscEb/YpT3FTzxqB/9mvXViI0ZhR+rwyLjFqHqfv1nfX1q
	 A5INPCG/5XQp/nclJ3SNQT249bIo+EpSskV7JGDJ35QEpD2YUYQKupn90meFC610W7
	 R1B8a6J9gcO+lXUN8eW6GCilRIxl/KIaKacuohe5+J7HQRFEXmFthCr3KLaSgn7IY8
	 yHYk9EnhIugdJjzylwH7ffLyN2rMiBDkfqreKGjIGCCpDSjGIPT3LfGrJhrwwRUyDH
	 tGmKbR+s/omHw==
Date: Thu, 23 Dec 2021 11:06:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, 
    Oleksandr <olekstysh@gmail.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
In-Reply-To: <alpine.DEB.2.22.394.2112221636530.2060010@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2112231056380.2060010@ubuntu-linux-20-04-desktop>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com> <4469cdf05051bd691a8adff2657d27f6a5f0cefb.1639472078.git.oleksii_moisieiev@epam.com> <b1c27f70-309d-bb36-3228-32836063fd16@gmail.com> <20211217121524.GA4021162@EPUAKYIW015D> <YcHol8ads22asXGF@perard>
 <alpine.DEB.2.22.394.2112211330310.2060010@ubuntu-linux-20-04-desktop> <bc6d7529-337d-a4e1-664a-dddd68ecf5cb@xen.org> <87lf0cx50o.fsf@epam.com> <3967a86d-295f-7672-9ce3-71e1c393dcbd@xen.org> <87ee64x1hf.fsf@epam.com> <796960e7-62ab-6f05-b3c0-cd02d7e8a8ba@xen.org>
 <alpine.DEB.2.22.394.2112221636530.2060010@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Dec 2021, Stefano Stabellini wrote:
> # Future Ideas
> 
> A great suggestion by Julien is to start supporting the dom0less partial
> device tree format in xl/libxl as well so that we can have a single
> "device_tree" option in dom.cfg instead of 4 (device_tree, iomem, irqs,
> dtdev).
> 
> Even with that implemented, the user has still to provide a partial dtb,
> xen,reg and xen,path. I think this is a great step forward and we should
> do that, if nothing else to make it easier to switch between dom0less
> and normal domU configurations. But the number of options and
> information that the user has to provide is still similar to what we
> have today.

I have just realized that if we start to parse the partial DTB in
xl/libxl the same way that we do for dom0less guests (parse "xen,path",
"xen,reg", and "interrupts", making dtdev, irqs and iomem optional)
actually we can achieve the goal below thanks to the combination:
"xen,path" + "xen,force-assign-without-iommu".

In other words, with dom0less we already have a way to specify the link
to the host node even if the device is not a DMA master. We can do that
by specifying both xen,path and xen,force-assign-without-iommu for a
device.

This is just FYI. I am not suggesting we should introduce dom0less-style
partial DTBs in order to get SCMI support in guests (although it would
be great to have). I think the best way forward for this series is one
of the combinations below, like a) + d), or a) + c) 


[...]

> So I think we should either:
> 
> a) extend dtdev to cover all devices, including non-DMA masters
> b) or add a new "device_assignment" property which is like dtdev but is
>    the list of both DMA masters and non-DMA masters
> 
> Either way, when non-DMA masters are present in the
> dtdev/device_assignment list we could either:
>     c) require force-assign-without-iommu="true" in dom.cfg
>     d) or print a warning like:
>     "WARNING: device assignment safety for device XXX cannot be
>     verified. Please make sure XXX is not a DMA mastering device."

