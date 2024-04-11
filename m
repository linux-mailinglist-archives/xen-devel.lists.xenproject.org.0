Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF808A211E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 23:50:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704225.1100473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv2JN-00087j-E3; Thu, 11 Apr 2024 21:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704225.1100473; Thu, 11 Apr 2024 21:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv2JN-00084Y-Ac; Thu, 11 Apr 2024 21:50:25 +0000
Received: by outflank-mailman (input) for mailman id 704225;
 Thu, 11 Apr 2024 21:50:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKzY=LQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rv2JM-000848-93
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 21:50:24 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d843d4d-f84d-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 23:50:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 84A94CE23D1;
 Thu, 11 Apr 2024 21:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492A6C072AA;
 Thu, 11 Apr 2024 21:50:16 +0000 (UTC)
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
X-Inumbo-ID: 7d843d4d-f84d-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712872217;
	bh=qXTnxlgiUSzk3qvLwDue25bCa5BIGucthFflB3c4mcE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WP5kgsY2qEhUVxa5YwgLExTCCb52hAGeIfPQeihhhNlsbXJgiTfK1DmGK4wl4k20s
	 Z1v9UKqWomT8JFr7r5sRaFpgkZLizNQGTJ9oIApza2EvHTyHyO9Dv0ONbujdmjj+zp
	 ArzFM6ibTRhmaNKZNUO+4hu+zMFqtjSMCaZpeF1yIoy1dUdrNw359wtCAgFTnjPCLX
	 7xPsg62Td8gqq8uEXe0uRxd5XLBajKwUeOqzF66JMGNZnEisKQdbd/QZ0sMgg2RPmi
	 mGoK3xxeRrydsSJIc2TJ/NoqQ2th/BHEA91Pj5/NPjjDp3AiY0YXuk/4ftNfCaM0k0
	 FBNgNfIVyexSA==
Date: Thu, 11 Apr 2024 14:50:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, 
    "olekstysh@gmail.com" <olekstysh@gmail.com>, Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrei Cherechesu <andrei.cherechesu@nxp.com>, Bertrand.Marquis@arm.com, 
    michal.orzel@amd.com, Artem_Mygaiev@epam.com, Edgar.Iglesias@amd.com
Subject: Re: [VirtIO] Support for various devices in Xen
In-Reply-To: <5fb49c84-0f54-49a5-9106-7f207b3eee4c@oss.nxp.com>
Message-ID: <alpine.DEB.2.22.394.2404111446490.997881@ubuntu-linux-20-04-desktop>
References: <PA4PR04MB95655F653BBFE3A70A8CD0FBF9682@PA4PR04MB9565.eurprd04.prod.outlook.com> <alpine.DEB.2.22.394.2401111627360.3675@ubuntu-linux-20-04-desktop> <ZaCOVSuEJtsAj9G5@amd.com> <5fb49c84-0f54-49a5-9106-7f207b3eee4c@oss.nxp.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1568205576-1712872016=:997881"
Content-ID: <alpine.DEB.2.22.394.2404111447130.997881@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1568205576-1712872016=:997881
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2404111447131.997881@ubuntu-linux-20-04-desktop>

-Vikram +Edgar

On Thu, 11 Apr 2024, Andrei Cherechesu wrote:
> Hi Stefano, Vikram, Viresh,
> 
> Thank you for your answers and support, and sorry for my late reply.
> 
> 
> On 12/01/2024 02:56, Vikram Garhwal wrote:
> > Hi Andrei & Stefano,
> >
> > Actually, QEMU patches are already upstreamed for virtio-blk and virtio-net
> > devices available in v8.2.0.
> > For virtio with grants, the patches are WiP.
> >
> > On Xen side, we are yet to upstream xen-tools patches which basically generate
> > the right arguments when invoking QEMU.
> > Here are down stream patches if you want:
> > 1. https://github.com/Xilinx/xen/commit/be35b46e907c7c78fd23888d837475eb28334638
> > 2. For Virtio disk backend:
> >     https://github.com/Xilinx/xen/commit/947280803294bbb963f428423f679d074c60d632
> > 3. For Virtio-net:
> >     https://github.com/Xilinx/xen/commit/32fcc702718591270e5c8928b7687d853249c882
> > 4. For changing the machine name to Xenpvh(to align with QEMU changes):
> >     https://github.com/Xilinx/xen/commit/5f669949c9ffdb1947cb47038956b5fb8eeb072a
> >> The libxl changes are lagging behind a bit and you might have to use
> >> device_model_args to enable virtio backends in QEMU.
> > But QEMU 8.2.0 can still be used for virtio-net on ARM.
> >
> > @Andrei here is an example on how to use virtio-net with QEMU:
> >     -device virtio-net-device,id=nic0,netdev=net0,mac=00:16:3e:4f:43:05 \
> >     -netdev type=tap,id=net0,ifname=vif1.0-emu,br=xenbr0,script=no,downscript=no\
> >     -machine xenpvh
> >
> > Please make sure to use xenpvh as QEMU machine.
>
> I've managed to successfully get a DomU up and running with the rootfs based on virtio-blk. I'm running QEMU 8.2.1, Xen 4.18 + Vikram's downstream patches, Linux 6.6.12-rt, built through yocto with some changes to xen-tools and QEMU recipes.
> 
> However, when also enabling PV networking through virtio-net, it seems that DomU cannot successfully boot. The device model args passed by xen-tools when invoking QEMU look exactly like what Vikram said they should.
> 
> While executing `xl -v create ..` I can see some error regarding the device model crashing:
> 
>         libxl: debug: libxl_exec.c:127:libxl_report_child_exitstatus: domain 1 device model (dying as expected) [300] died due to fatal signal Killed
> 
> But the error is not fatal and the DomU spawn goes on, it boots but never reaches prompt. It seems that kernel crashes silently at some point. Though, the networking interface is present since udev tries to rename it right before boot hangs:
> 
>         [    4.376715] vif vif-0 enX0: renamed from eth1
> 
> Why would the QEMU DM process be killed, though? Invalid memory access?
> 
> Here are the full logs for the "xl create" command [0] and for DomU's dmesg [1].
> Any ideas as to why that might happen, some debugging insights, or maybe some configuration details I could have overlooked?
> 
> Thank you very much for your help once again.

Edgar (CCed) has recently setup a working system with QEMU and the
xenpvh machine for ARM. He should be able to help you.

Cheers,

Stefano


> [0] https://privatebin.net/?0fc1db27433dbcb5#4twCBMayizr7x89pxPzNqQ198z92q8YxVheHvNDsVAtd
> [1] https://privatebin.net/?ec3cb13fe2a086a1#F1zynLYQJCUDfZiwikZtRBEPJTACR2GZX6jn2ShXxmae
> >> For SCMI, I'll let Bertrand (CCed) comment.
> >>
> >> Cheers,
> >>
> >> Stefano
> >>
> >>
> >> On Thu, 11 Jan 2024, Andrei Cherechesu (OSS) wrote:
> >>> Hello,
> >>>
> >>> As I've mentioned in previous discussion threads in the xen-devel
> >>> community, we are running Xen 4.17 (uprev to 4.18 in progress) on NXP
> >>> S32G automotive processors (Cortex-A53 cores) and we wanted to know more
> >>> about the support for various VirtIO device types in Xen.
> >>>
> >>> In the Xen 4.17 release notes, the VirtIO standalone backends mentioned
> >>> as supported and tested are: virtio-disk, virtio-net, virtio-i2c and
> >>> virtio-gpio.
> >>>
> >>> However, we've only managed to successfully set up and try some
> >>> use-cases with the virtio-disk standalone backend [0] (which Olexandr
> >>> provided) based on the virtio-mmio transport.
> >>>
> >>> As such, we have a few questions, which we haven't been able to figure
> >>> out from the mailing list discussions and/or code:
> >>>     1. Are there any plans for the virtio-disk repo to have a stable
> >>>     version? Is it going to be long-term hosted and maintained in the
> >>>     xen-troops github repo? Or was it just an one-time PoC implementation
> >>>
> >>>     and the strategy for future VirtIO devices will be based on a more generic
> >>>
> >>>     approach (i.e., without need for a specific standalone app)?
> >>>
> >>>
> >>>     2. With regards to the other backends, we want to try out and provide PV
> >>>
> >>>     networking to a DomU based on virtio-net, but we haven't found any available
> >>>
> >>>     resources for it (e.g., the standalone backend implementation if needed for
> >>>
> >>>     control plane, configuration examples, presentations, demos, docs). Does it
> >>>
> >>>     rely on the QEMU virtio-net or vhost implementation? Are there any examples
> >>>
> >>>     on how to set it up? Any required Xen/Linux Kernel/QEMU versions?
> >>>
> >>>
> >>>     3. What other VirtIO device types are there planned to be supported in Xen?
> >>>
> >>>     I'm supposing libxl will also need changes to accomodate new configuration
> >>>
> >>>     parameters for each of them. Or is there something I'm missing?
> >>>
> >>>
> >>>     4. Also, while we're at it, are there any plans regarding SCMI
> >>>     awareness for Xen (e.g., SCMI Mediator - where the RFC thread from 2022
> >>>
> >>>     seems discontinued)? Or is the preferred approach for sharing SCMI access
> >>>
> >>>     to guests through virtio-scmi?
> >>>
> >>> Thank you very much for the support, once again, and we're also looking
> >>> forward to the progress on the rust-vmm initiative.
> >>>
> >>> Regards,
> >>> Andrei Cherechesu,
> >>> NXP Semiconductors
> >>>
> >>> [0] https://github.com/xen-troops/virtio-disk
> >>>
> >>>
> >>>
> 
--8323329-1568205576-1712872016=:997881--

