Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB147FE812
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 05:03:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644396.1005327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8YGH-0003DZ-HY; Thu, 30 Nov 2023 04:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644396.1005327; Thu, 30 Nov 2023 04:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8YGH-0003B3-Er; Thu, 30 Nov 2023 04:02:49 +0000
Received: by outflank-mailman (input) for mailman id 644396;
 Thu, 30 Nov 2023 04:02:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKhV=HL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8YGG-0003Aw-Ij
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 04:02:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 512731f1-8f35-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 05:02:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7A9EA61D04;
 Thu, 30 Nov 2023 04:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63761C433C9;
 Thu, 30 Nov 2023 04:02:42 +0000 (UTC)
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
X-Inumbo-ID: 512731f1-8f35-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701316964;
	bh=X0+zuvpu/LWOCx5sGIUWs70rMuq6CB62gaXT4eplXPw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uObZ4+1lLGa49MWw1i7eflNmalTLvQ2T9QOz7fSJW3la3tpj/U3p3CvqZ4xrE8c6b
	 5oXBKqoTJmShWZ07S28VxNk18JnP2MOGVwZv7R0YevJZ6qhb18Ih3nqvDLstM7wUU9
	 JEjml1Us3WneGrc6gNVzM+q6952W0jjrB7HwwBdv9l+6t4TACly3vGDe1Ry/IdP9oD
	 O5kpLAWS7yJWHgJDZK9VETN7IRQ18X2jm7p17dtLBQBALngiAMZpLVg0JSc5Yk6BC2
	 D1wd6vsRfZSwiTNkZTiQNay2Az7k2Nk884JiAe7+5UrujX3aFkz6E+tWuf4JW7It5+
	 2GU+D2bDQtR1A==
Date: Wed, 29 Nov 2023 20:02:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jiqian Chen <Jiqian.Chen@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Alex Deucher <Alexander.Deucher@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Huang Rui <Ray.Huang@amd.com>, Honglei Huang <Honglei1.Huang@amd.com>, 
    Julia Zhang <Julia.Zhang@amd.com>
Subject: Re: [RFC XEN PATCH v2 3/3] tools: Add new function to get gsi from
 irq
In-Reply-To: <alpine.DEB.2.22.394.2311291937170.3533093@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2311291956130.3533093@ubuntu-linux-20-04-desktop>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com> <20231124104136.3263722-4-Jiqian.Chen@amd.com> <ZWX4R9UEE6oXiqaz@macbook> <alpine.DEB.2.22.394.2311291937170.3533093@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2021362076-1701316589=:3533093"
Content-ID: <alpine.DEB.2.22.394.2311291956430.3533093@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2021362076-1701316589=:3533093
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2311291956431.3533093@ubuntu-linux-20-04-desktop>

n Wed, 29 Nov 2023, Stefano Stabellini wrote:
> On Tue, 28 Nov 2023, Roger Pau Monné wrote:
> > On Fri, Nov 24, 2023 at 06:41:36PM +0800, Jiqian Chen wrote:
> > > In PVH dom0, it uses the linux local interrupt mechanism,
> > > when it allocs irq for a gsi, it is dynamic, and follow
> > > the principle of applying first, distributing first. And
> > > if you debug the kernel codes, you will find the irq
> > > number is alloced from small to large, but the applying
> > > gsi number is not, may gsi 38 comes before gsi 28, that
> > > causes the irq number is not equal with the gsi number.
> > > And when we passthrough a device, QEMU will use its gsi
> > > number to do mapping actions, see xen_pt_realize->
> > > xc_physdev_map_pirq, but the gsi number is got from file
> > > /sys/bus/pci/devices/xxxx:xx:xx.x/irq in current code,
> > > so it will fail when mapping.
> > > And in current codes, there is no method to translate
> > > irq to gsi for userspace.
> > 
> > I think it would be cleaner to just introduce a new sysfs node that
> > contains the gsi if a device is using one (much like the irq sysfs
> > node)?
> > 
> > Such ioctl to translate from IRQ to GSI has nothing to do with Xen, so
> > placing it in privcmd does seem quite strange to me.  I understand
> > that for passthrough we need the GSI, but such translation layer from
> > IRQ to GSI is all Linux internal, and it would be much simpler to just
> > expose the GSI in sysfs IMO.
> 
> Maybe something to add to drivers/xen/sys-hypervisor.c in Linux.
> Juergen what do you think?

Let me also add that privcmd.c is already a Linux specific interface.
Although it was born to be a Xen hypercall "proxy" in reality today we
have a few privcmd ioctls that don't translate into hypercalls. So I
don't think that adding IOCTL_PRIVCMD_GSI_FROM_IRQ would be a problem.
--8323329-2021362076-1701316589=:3533093--

