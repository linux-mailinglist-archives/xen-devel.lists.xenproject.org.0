Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D898CEC55
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 00:15:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729878.1135173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdBF-0006T4-Od; Fri, 24 May 2024 22:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729878.1135173; Fri, 24 May 2024 22:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdBF-0006RG-KU; Fri, 24 May 2024 22:14:29 +0000
Received: by outflank-mailman (input) for mailman id 729878;
 Fri, 24 May 2024 22:14:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6bJ=M3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sAdBE-0006RA-7V
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 22:14:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb6a087f-1a1a-11ef-90a1-e314d9c70b13;
 Sat, 25 May 2024 00:14:27 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B72AE61508;
 Fri, 24 May 2024 22:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F5FC2BBFC;
 Fri, 24 May 2024 22:14:23 +0000 (UTC)
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
X-Inumbo-ID: fb6a087f-1a1a-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716588865;
	bh=/X5DEcP1Js14mnr8xs0vj1UKxVeCX4tpbdd7BN1HbkI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MpC5iXLFuoBhf073m3kUij8QupCSJs6Xrm+r933buBF9zVhGwpnXxKNTyg5mv+C7O
	 3seluiyUPvKCiZ7/ARagM9darcgyFPOdhx0STQ2C92kKZoEFAdiTPqsE8ul728e1oz
	 VceYqiX7PfzyALnGsbDdOrWGqmVX0OFXvK8fuQY0I7fgp7KibCMgelVu/POZh8ju/E
	 TC9bx3uR6WtkjI/bRL3EBefmwSwNgHKhQaBvxdiZ38o8gljSHMy+M+0pGCAjSE9QDi
	 mYVVFaNW7j65ON7pprA/puvHeEJvjdFJZFxp1cI1VQyxsdMgDkcLlgRgrK0IuzR59T
	 H0hh8/iXtMjiQ==
Date: Fri, 24 May 2024 15:14:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, anthony@xenproject.org, 
    sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com, 
    Volodymyr_Babchuk@epam.com, Vikram Garhwal <fnu.vikram@xilinx.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Henry Wang <xin.wang2@amd.com>
Subject: Re: [PATCH v5 7/7] docs: Add device tree overlay documentation
In-Reply-To: <a7a0456d-9eac-4db4-8782-ae94c7e338b1@xen.org>
Message-ID: <alpine.DEB.2.22.394.2405241456230.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop> <20240524021814.2666257-7-stefano.stabellini@amd.com> <a7a0456d-9eac-4db4-8782-ae94c7e338b1@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 May 2024, Julien Grall wrote:
> Hi Stefano,
> 
> On 24/05/2024 03:18, Stefano Stabellini wrote:
> > From: Vikram Garhwal <fnu.vikram@xilinx.com>
> > 
> > Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > Signed-off-by: Henry Wang <xin.wang2@amd.com>
> > ---
> >   docs/misc/arm/overlay.txt | 82 +++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 82 insertions(+)
> >   create mode 100644 docs/misc/arm/overlay.txt
> > 
> > diff --git a/docs/misc/arm/overlay.txt b/docs/misc/arm/overlay.txt
> > new file mode 100644
> > index 0000000000..0a2dee951a
> > --- /dev/null
> > +++ b/docs/misc/arm/overlay.txt
> > @@ -0,0 +1,82 @@
> > +# Device Tree Overlays support in Xen
> > +
> > +Xen experimentally supports dynamic device assignment to running
> > +domains, i.e. adding/removing nodes (using .dtbo) to/from Xen device
> > +tree, and attaching them to a running domain with given $domid.
> > +
> > +Dynamic node assignment works in two steps:
> > +
> > +## Add/Remove device tree overlay to/from Xen device tree
> > +
> > +1. Xen tools check the dtbo given and parse all other user provided
> > arguments
> > +2. Xen tools pass the dtbo to Xen hypervisor via hypercall.
> > +3. Xen hypervisor applies/removes the dtbo to/from Xen device tree.
> > +
> > +## Attach device from the DT overlay to domain
> > +
> > +1. Xen tools check the dtbo given and parse all other user provided
> > arguments
> > +2. Xen tools pass the dtbo to Xen hypervisor via hypercall.
> > +3. Xen hypervisor attach the device to the user-provided $domid by
> > +   mapping node resources in the DT overlay.
> > +
> > +# Examples
> > +
> > +Here are a few examples on how to use it.
> > +
> > +## Dom0 device add
> > +
> > +For assigning a device tree overlay to Dom0, user should firstly properly
> > +prepare the DT overlay. More information about device tree overlays can be
> > +found in [1]. Then, in Dom0, enter the following:
> > +
> > +    (dom0) xl dt-overlay add overlay.dtbo
> > +
> > +This will allocate the devices mentioned in overlay.dtbo to Xen device
> > tree.
> > +
> > +To assign the newly added device from the dtbo to Dom0:
> > +
> > +    (dom0) xl dt-overlay attach overlay.dtbo 0
> > +
> > +Next, if the user wants to add the same device tree overlay to dom0
> > +Linux, execute the following:
> > +
> > +    (dom0) mkdir -p /sys/kernel/config/device-tree/overlays/new_overlay
> > +    (dom0) cat overlay.dtbo >
> > /sys/kernel/config/device-tree/overlays/new_overlay/dtbo
> > +
> > +Finally if needed, the relevant Linux kernel drive can be loaded using:
> > +
> > +    (dom0) modprobe module_name.ko
> > +
> > +## DomU device add/remove
> > +
> > +All the nodes in dtbo will be assigned to a domain; the user will need
> > +to prepare the dtb for the domU.
> 
> s/dtb/dtbo/? 

Yes, done


> But I am little bit confused with the wording. I think you may
> want to add *different dtbo* so it clarifies from the start (this only becomes
> obvious at the end of the section) that the user is not meant to use the same
> for all the commands.

Yes it was confusing, I tried to clarify it. This is a doc so we could
improve it further after the freeze.


>  For example, the `interrupt-parent`
> > +property of the DomU overlay should be changed to the Xen hardcoded
> > +value `0xfde8`, and the xen,reg property should be added to specify the
> > +address mappings. If xen,reg is not present, it is assumed 1:1 mapping.
> 
> Repeating an earlier comment here. I think xen,reg should be mandatory for
> non-direct mapped domain.

That's OK


> Also, can you clarify what is the expect property layout for xen,reg?

I'll add a pointer


> > +Below assumes the properly written DomU dtbo is `overlay_domu.dtbo`.
> > +
> > +For new domains to be created, the user will need to create the DomU
> > +with below properties properly configured in the xl config file:
> > +- `iomem`
> 
> I looked at your reply in v4 and I am afraid I still don't understand why we
> are mentioning 'iomem'. If we want to use the commands below, then the domain
> needs to be created in advance. So you can't yet know 'iomem'.
> 
> You could avoid "xl dt-overlay attach" but then you need the user to specify
> both "irqs" and "iomem". From a user point of view, it would be easier to add
> a new propery in the configuration file listing the overlays. Something like:
> 
> dt_overlays = [ "overlay.dtbo", ... ]
> 
> Anyway, that somewhat separate. For now, I think we want to drop 'iomem' from
> the list and reword this paragraph to say that the 'passthrough' property
> needs to be set if you plan to use DT overlay and devices requiring the IOMMU.

OK, I did that


> 
> > +- `passthrough` (if IOMMU is needed)
> 
> This property is required at the start because we don't support enabling the
> IOMMU lazily.

Yeah. I think it is much clearer now.


> > +
> > +User will also need to modprobe the relevant drivers. For already
> > +running domains, the user can use the xl dt-overlay attach command,
> > +example:
> > +
> > +    (dom0) xl dt-overlay add overlay.dtbo            # If not executed
> > before
> > +    (dom0) xl dt-overlay attach overlay.dtbo $domid
> > +    (dom0) xl console $domid                         # To access $domid
> > console
> > +
> > +Next, if the user needs to modify/prepare the overlay.dtbo suitable for
> > +the domU:
> > +
> > +    (domU) mkdir -p /sys/kernel/config/device-tree/overlays/new_overlay
> > +    (domU) cat overlay_domu.dtbo >
> > /sys/kernel/config/device-tree/overlays/new_overlay/dtbo
> > +
> > +Finally, if needed, the relevant Linux kernel drive can be probed:
> > +
> > +    (domU) modprobe module_name.ko
> > +
> > +[1] https://www.kernel.org/doc/Documentation/devicetree/overlay-notes.txt

