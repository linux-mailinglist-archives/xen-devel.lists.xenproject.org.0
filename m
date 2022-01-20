Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8B24945A6
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 02:54:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258931.446460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAMeI-00075C-8s; Thu, 20 Jan 2022 01:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258931.446460; Thu, 20 Jan 2022 01:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAMeI-00073M-4d; Thu, 20 Jan 2022 01:54:02 +0000
Received: by outflank-mailman (input) for mailman id 258931;
 Thu, 20 Jan 2022 01:54:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4vKw=SE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nAMeG-00073G-VC
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 01:54:00 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d57deaab-7993-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 02:53:59 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6B8B8B81BFA;
 Thu, 20 Jan 2022 01:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8472EC004E1;
 Thu, 20 Jan 2022 01:53:56 +0000 (UTC)
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
X-Inumbo-ID: d57deaab-7993-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642643637;
	bh=R95tjV/8iYfQdaCIq0E0eOSAYDmpJ0f6xfnifO1XRSw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KeqR55/IuAcwo+wRTuk4FUG0Ybnk1bW+XLqtH7nYoV6HCKWvLr5Y4hakQeomHbTFJ
	 pP9ysY8Qawd/RQiMxa6T3ukqXWQbRdTxKt2MYLZEjv6yYvba7Qh47D0Nif61xwW/QY
	 82a9ugbVktl+7raTIiFm0pJLlOCb/z6KWCfZwBK1mxczKn4DTVkOTvvk2Eullm7feG
	 d2Q3lOkXevIlM2zUn56IECcix1G/uq3WzbTO0sLIHZJLsZ3TEVbTttTcmXVBNeC3g2
	 V/Iat7phI7EUZGcVDWNn77RBK9k22M/VDuGCMmGeVExIcVaNs/3XEmhXYca8uPGY7X
	 MdN0BLB/V1jiw==
Date: Wed, 19 Jan 2022 17:53:55 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Oleksandr <olekstysh@gmail.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
In-Reply-To: <20220119094013.GA3756156@EPUAKYIW015D>
Message-ID: <alpine.DEB.2.22.394.2201191733320.19362@ubuntu-linux-20-04-desktop>
References: <YcHol8ads22asXGF@perard> <alpine.DEB.2.22.394.2112211330310.2060010@ubuntu-linux-20-04-desktop> <bc6d7529-337d-a4e1-664a-dddd68ecf5cb@xen.org> <87lf0cx50o.fsf@epam.com> <3967a86d-295f-7672-9ce3-71e1c393dcbd@xen.org> <87ee64x1hf.fsf@epam.com>
 <796960e7-62ab-6f05-b3c0-cd02d7e8a8ba@xen.org> <alpine.DEB.2.22.394.2112221636530.2060010@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2112231056380.2060010@ubuntu-linux-20-04-desktop> <b85f7ea3-dd0c-1281-d1e2-1010fb2f5892@xen.org>
 <20220119094013.GA3756156@EPUAKYIW015D>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Jan 2022, Oleksii Moisieiev wrote:
> On Fri, Dec 24, 2021 at 02:30:50PM +0100, Julien Grall wrote:
> > Hi,
> > 
> > On 23/12/2021 20:06, Stefano Stabellini wrote:
> > > On Wed, 22 Dec 2021, Stefano Stabellini wrote:
> > > > # Future Ideas
> > > > 
> > > > A great suggestion by Julien is to start supporting the dom0less partial
> > > > device tree format in xl/libxl as well so that we can have a single
> > > > "device_tree" option in dom.cfg instead of 4 (device_tree, iomem, irqs,
> > > > dtdev).
> > > > 
> > > > Even with that implemented, the user has still to provide a partial dtb,
> > > > xen,reg and xen,path. I think this is a great step forward and we should
> > > > do that, if nothing else to make it easier to switch between dom0less
> > > > and normal domU configurations. But the number of options and
> > > > information that the user has to provide is still similar to what we
> > > > have today.
> > > 
> > > I have just realized that if we start to parse the partial DTB in
> > > xl/libxl the same way that we do for dom0less guests (parse "xen,path",
> > > "xen,reg", and "interrupts", making dtdev, irqs and iomem optional)
> > > actually we can achieve the goal below thanks to the combination:
> > > "xen,path" + "xen,force-assign-without-iommu".
> > > 
> > > In other words, with dom0less we already have a way to specify the link
> > > to the host node even if the device is not a DMA master. We can do that
> > > by specifying both xen,path and xen,force-assign-without-iommu for a
> > > device.
> > > 
> > > This is just FYI. I am not suggesting we should introduce dom0less-style
> > > partial DTBs in order to get SCMI support in guests (although it would
> > > be great to have). I think the best way forward for this series is one
> > > of the combinations below, like a) + d), or a) + c)
> > 
> > I strongly prefer a) + c) because a warning is easy to miss/ignore. At least
> > with the extra property the user made an action to think about it and agree
> > that this is the way do it.
> > 
> > It is also easier to spot if we ask the user to provide the configuration
> > file.
> > 
> 
> Let me share my thoughts about c), which is:
> c) require force-assign-without-iommu="true" in dom.cfg
> 
> Adding this parameter to domain config means removing
> xen,force-assign-without-iommu param from partial DTB.

Why? No I don't think so.


> This will affect dom0less configuration, which I can't test for now
> without extra effort.

We are just talking about adding:

force-assign-without-iommu="true"

to the xl config file. For instance:

dtdev = [ "/amba/serial@ff000000" ]
iomem = ["0xff000,1"]
force-assign-without-iommu="true"

It is unrelated to the dom0less partial DTB. There is no need to test
dom0less to do this.


