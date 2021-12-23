Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDDF47DDB0
	for <lists+xen-devel@lfdr.de>; Thu, 23 Dec 2021 03:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250927.432153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0DlK-0003Lh-DW; Thu, 23 Dec 2021 02:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250927.432153; Thu, 23 Dec 2021 02:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0DlK-0003K0-7t; Thu, 23 Dec 2021 02:23:22 +0000
Received: by outflank-mailman (input) for mailman id 250927;
 Thu, 23 Dec 2021 02:23:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yk4J=RI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n0DlJ-0003Ju-2O
 for xen-devel@lists.xenproject.org; Thu, 23 Dec 2021 02:23:21 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a273174-6397-11ec-bb0b-79c175774b5d;
 Thu, 23 Dec 2021 03:23:18 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7A333B81F48;
 Thu, 23 Dec 2021 02:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F982C36AE5;
 Thu, 23 Dec 2021 02:23:14 +0000 (UTC)
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
X-Inumbo-ID: 4a273174-6397-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640226195;
	bh=I4V/2KspmrQvTn48nYH6aryOG5r8w4HrUqrc4S1NOXs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Oyp1FJSQcU+52D5iyEUyzYaVj2fhbypmpZmfmHqNM2tszkV2wX4hG17piEVXmn5kL
	 CT0ZSw7OY8QbOo2BZurjy3vpq9SJE2pAf5mrEfo1O6YpmwBFnDwj/rajnolOZx6+52
	 KNnwhRTB4Wxw8vzyRnFJ7APRhZbsipWH2TjI75QaDyALysXV8hEq18wDJn2ELK13lY
	 ezVNTG+R3SuvaJPCCSt3uTvTx/Yq7uZ6lFFt33U9YgsSNI0X4kX1WNZBB6VsX0PzpT
	 dFMq5OERdXKKVs14VvBPbkKGIVkIBnC9S0YNrNt8TYUIK72LALyhPxTq4a7k946dYZ
	 4DbKAT+Bw0/Jw==
Date: Wed, 22 Dec 2021 18:23:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, 
    Oleksandr <olekstysh@gmail.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
In-Reply-To: <796960e7-62ab-6f05-b3c0-cd02d7e8a8ba@xen.org>
Message-ID: <alpine.DEB.2.22.394.2112221636530.2060010@ubuntu-linux-20-04-desktop>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com> <4469cdf05051bd691a8adff2657d27f6a5f0cefb.1639472078.git.oleksii_moisieiev@epam.com> <b1c27f70-309d-bb36-3228-32836063fd16@gmail.com> <20211217121524.GA4021162@EPUAKYIW015D> <YcHol8ads22asXGF@perard>
 <alpine.DEB.2.22.394.2112211330310.2060010@ubuntu-linux-20-04-desktop> <bc6d7529-337d-a4e1-664a-dddd68ecf5cb@xen.org> <87lf0cx50o.fsf@epam.com> <3967a86d-295f-7672-9ce3-71e1c393dcbd@xen.org> <87ee64x1hf.fsf@epam.com>
 <796960e7-62ab-6f05-b3c0-cd02d7e8a8ba@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Dec 2021, Julien Grall wrote:
> > > > > > To me dtdev and XEN_DOMCTL_assign_device are appropriate because
> > > > > > they
> > > > > > signify device assignment of one or more devices. We are not adding
> > > > > > any
> > > > > > additional "meaning" to them. It is just that we'll automatically
> > > > > > detect
> > > > > > and generate any SCMI configurations based on the list of assigned
> > > > > > devices. Because if SCMI is enabled and a device is assigned to the
> > > > > > guest, then I think we want to add the device to the SCMI list of
> > > > > > devices automatically.
> > > > > 
> > > > > I am OK with re-using dtdev/XEN_DOMCTL_assign_device however there is
> > > > > a pitfall with that approach.
> > > > > 
> > > > > At the moment, they are only used for device protected by the
> > > > > IOMMU. If the device is not protected by the IOMMU then it will return
> > > > > an error.
> > > > IIRC there was a change, that allowed to assign device without a
> > > > IOMMU. At
> > > > least we discussed this internally.
> > > 
> > > I am not aware of any upstream. Do you have a pointer if there is any
> > > public discussion?
> > 
> > No, this is the first public discussion on this topic.
> > 
> > > 
> > > > > 
> > > > > Now, with your approach we may have a device that is not protected by
> > > > > the IOMMU but require to a SCMI configuration.
> > > > You need to protect only DMA-capable devices.
> > > 
> > > Xen doesn't know if the device is DMA-capable or not. So...
> > > 
> > 
> > But it knows if there is a iommus=<> node present for the device.
> 
> Not really. Not all the platforms have IOMMUs and not all the platforms with
> IOMMU have DMA-capable device protected by an IOMMU.
> 
> > 
> > > > 
> > > > > I don't think it would be sensible to just return "succeed" here
> > > > > because technically you are asking to assign a non-protected
> > > > > device. But at the same time, it would prevent a user to assign a
> > > > > non-DMA capable device.
> > > > > 
> > > > > So how do you suggest to approach this?
> > > > Well, in my head assign_device ideally should do the following:
> > > > 1. Assign IOMMU if it is configured for the device
> > > 
> > > ... with this approach you are at the risk to let the user passthrough
> > > a device that cannot be protected.
> > > 
> > > > 2. Assign SCMI access rights
> > > > (Not related to this patch series, but...)
> > > > 3. Assign IRQs
> > > > 4. Assign IO memory ranges.
> > > > Points 3. and 4. would allow us to not provide additional irq=[] and
> > > > iomem=[] entries in a guest config.
> > > 
> > > That could only work if your guest is using the same layout as the
> > > host.
> > 
> > Agreed. But in my experience, in most cases this is the true. We worked
> > with Renesas and IMX hardware and in both cases iomems were
> > mapped 1:1.
> > 
> > > Otherwise, there is a risk it will clash with other parts of the
> > > memory layout.
> > > 
> > 
> > > Today, guests started via the toolstack is only using a virtual
> > > layout, so you would first need to add support to use the host memory
> > > layout.
> > 
> > I can't say for all the possible configurations in the wild, but I'm
> > assuming that in most cases it will be fine to use 1:1 mapping. For
> > those more exotic cases it would be possible to implement some
> > configuration option like iomem_map=[mfn:gfn].
> Well, the Xen memory layout is not something that is stable nor AFAIK based on
> any memory layout. In fact, there is no such generic layout on Arm.
> 
> It is quite possible that it will work well with 1:1 MMIO on some platform
> (e.g. Renesas, IMX) but you can't expect to work for every Xen release or all
> the platforms.

Yeah this is a true problem. Thankfully with Penny's series we'll be
able to create domUs with the host memory layout (although dom0less
only but it is a step forward).

 
> > As Stefano pointed, right now user needs to provide 3 configuration
> > options to pass a device to a guest: dt_dev, irq, iomem. But in fact,
> > Xen is already knowing about irq and iomem from device tree.
> 
> I understand and this is not ideal. I would be happy to consider your
> approach. However, this will have to enabled only when the guest is re-using
> the host layout.

It looks like we all agree that today configuring device assignment with
Xen is too complicated and would like for it to be simpler. This thread
has some excellent ideas on how to address the issue. Skip to the end if
you are only interested in this patch series.


# Future Ideas

A great suggestion by Julien is to start supporting the dom0less partial
device tree format in xl/libxl as well so that we can have a single
"device_tree" option in dom.cfg instead of 4 (device_tree, iomem, irqs,
dtdev).

Even with that implemented, the user has still to provide a partial dtb,
xen,reg and xen,path. I think this is a great step forward and we should
do that, if nothing else to make it easier to switch between dom0less
and normal domU configurations. But the number of options and
information that the user has to provide is still similar to what we
have today.

After that, I think we need something along the lines of what Volodymyr
suggested. Let's say that the user only provides "dtdev" and
"device_tree" in dom.cfg.  We could:

- read interrupts from the  "interrupts" property like we do for dom0less
- read "xen,reg" for the mapping, if "xen,reg" is missing, read "reg"
  and assume 1:1 (we could try the mapping and print an error on
  failure, or we could only do 1:1 if the domain is entirely 1:1)
- optionally read "xen,path" to populate dtdev
- if an IOMMU configuration is present, then also configure the IOMMU
  for the device, if not then "xen,force-assign-without-iommu" must be
  present
- assign SCMI access rights


Now we only have:
- device_tree in dom.cfg
- dtdev in dom.cfg (or xen,path in the partial DTB)
- xen,force-assign-without-iommu in the partial DTB


It would be good if we could remove "xen,force-assign-without-iommu"
because at this stage it is the only Xen-specific property remaining in
the partial DTB. If we could get rid of it, it would make it easier to
write/generate the partial DTB because it becomes a strict subset of the
corresponding host node. It would enable us to automatically generate it
(we are going to do experiments with it at Xilinx in the next few
months) and it would be easier to explain to users how to write it.
The partial DTB usually starts as a copy of the corresponding host node
plus some edits. The fewer edits are required, the better.

But it is difficult because of the reasons mentioned by Julien. In Xen
we cannot know if a device is not behind an IOMMU because is not a DMA
master (so safe to assign) or because the system simply doesn't have
enough IOMMU coverage (so not safe to assign). Thankfully the hardware
has been improving in recent years and there are more and more platforms
with full IOMMU coverage. I think we should make it easier for users on
these well-behave platforms.

At least, we could move the "xen,force-assign-without-iommu" option from
the partial DTB to the VM config file dom.cfg. Something like:

force-assign-without-iommu="true"
or
platform-iommu-safe="true"

That way, it is global rather than per-device and doesn't have to be
added by the user by hand when creating the partial DTB.


# This patch series

Now in regards to this specific series and the SCMI options today, I
think it is OK to have a per-domain sci="scmi_smc", but I think we
should try to avoid another detailed list of device paths or list of
IDs in addition to dtdev.

dtdev already specifies the device tree nodes to be assigned to the
guest. Based on that list we can also do SCMI assignment.

As Julien pointed out, the issue is: what if a device needs SCMI
assignment but is not a DMA master (hence there is no IOMMU
configuration on the host)?

Attempting to assign a DMA mastering device without IOMMU protection is
not just unsafe, it will actively cause memory corruptions in most
cases. It is an erroneous configuration.

Of course we should try to stop people from running erroneous
configurations, but we should do so without penalizing all users.

With that in mind, also considering that dtdev is the list of devices to
be assigned, I think dtdev should be the list of all devices, even
non-DMA masters. It makes a lot of sense also because today is really
difficult to explain to a user that "yes, dtdev is the devices to be
assigned but no, if the device is a UART you don't have to add it to
dtdev because it is not a DMA master". It would be a lot easier if the
list of assigned devices was comprehensive, including both DMA masters
and not DMA masters.

So I think we should either:

a) extend dtdev to cover all devices, including non-DMA masters
b) or add a new "device_assignment" property which is like dtdev but is
   the list of both DMA masters and non-DMA masters

Either way, when non-DMA masters are present in the
dtdev/device_assignment list we could either:
    c) require force-assign-without-iommu="true" in dom.cfg
    d) or print a warning like:
    "WARNING: device assignment safety for device XXX cannot be
    verified. Please make sure XXX is not a DMA mastering device."


All these options are good I think. My preference is a) + d), so extend
dtdev and print a warning if non-DMA masters are in the list. We don't
necessarily need a new hypercall but that is also an option.

I think this discussion was a long time coming and I am glad we are
having it now. We have a lot of room for improvement! I don't want to
scope-creep this patch series, but I hope that this last bit could be
done as part of this series if we find agreement in the community.

