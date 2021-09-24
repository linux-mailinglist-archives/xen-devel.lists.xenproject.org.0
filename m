Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA94417D14
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 23:42:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195655.348445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTsxJ-0003F0-5V; Fri, 24 Sep 2021 21:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195655.348445; Fri, 24 Sep 2021 21:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTsxJ-0003Cs-2M; Fri, 24 Sep 2021 21:42:05 +0000
Received: by outflank-mailman (input) for mailman id 195655;
 Fri, 24 Sep 2021 21:42:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTsxH-0003Cj-OM
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 21:42:03 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed99cc6e-4b01-4baa-8dec-55881c98fb26;
 Fri, 24 Sep 2021 21:42:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE7FB60F6D;
 Fri, 24 Sep 2021 21:42:01 +0000 (UTC)
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
X-Inumbo-ID: ed99cc6e-4b01-4baa-8dec-55881c98fb26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632519722;
	bh=LalBGFaYkCzugsFxqYC4kt+8k7oBL8tjeSNC7JGy6Qc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d7SXTVa8wFJI75FLZGK7pWHQsIWZfXdRURxn+G9YGd945pUm85HUaWQoa6l8SLf65
	 AMlA9v9yzCUKLyV9VqNDoP1ndJfph1I5NpJOn2h4JCu022JP2qQ93zNls+Feq59TKk
	 jGHlurImXTMJXadQna8HXkXXrztDOrDBdpHGftJ9jDJisBAPeIHAo/cKlgpizh4fFB
	 yhAU1A4BUuNXI07yG02I+qV0W+QBXyCWfpLZLQpoxda3q6vp+2mjnLTrvYM3WHT+T2
	 mUW4LE9HYaLacN8NQKNw10LWNugtS445vWt7SKQ50Y9vHLAC5tR8PQru1zLPz/ufNv
	 XIhCgOrXv8LhQ==
Date: Fri, 24 Sep 2021 14:42:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Andre Przywara <Andre.Przywara@arm.com>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 11/17] xen/arm: PCI host bridge discovery within XEN
 on ARM
In-Reply-To: <1E52C080-6913-4009-997D-A9C0988B5A09@arm.com>
Message-ID: <alpine.DEB.2.21.2109241422170.17979@sstabellini-ThinkPad-T480s>
References: <cover.1632307952.git.rahul.singh@arm.com> <c837d73b1fc8953ab48d36609482cf84832b7827.1632307952.git.rahul.singh@arm.com> <alpine.DEB.2.21.2109221836190.17979@sstabellini-ThinkPad-T480s> <F87F4A4E-D6CC-4341-88CF-2DD52A1FD503@arm.com>
 <alpine.DEB.2.21.2109231206120.17979@sstabellini-ThinkPad-T480s> <1E52C080-6913-4009-997D-A9C0988B5A09@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Sep 2021, Rahul Singh wrote:
> Hi Stefano,
> 
> > On 23 Sep 2021, at 8:12 pm, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Thu, 23 Sep 2021, Rahul Singh wrote:
> >>>> +            goto err_exit;
> >>>> +    }
> >>> 
> >>> This is unnecessary at the moment, right? Can we get rid of ops->init ?
> >> 
> >> No this is required for N1SDP board. Please check below patch.
> >> https://gitlab.com/rahsingh/xen-integration/-/commit/6379ba5764df33d57547087cff4ffc078dc515d5
> > 
> > OK
> > 
> > 
> >>>> +int pci_host_common_probe(struct dt_device_node *dev, const void *data)
> >>>> +{
> >>>> +    struct pci_host_bridge *bridge;
> >>>> +    struct pci_config_window *cfg;
> >>>> +    struct pci_ecam_ops *ops;
> >>>> +    const struct dt_device_match *of_id;
> >>>> +    int err;
> >>>> +
> >>>> +    if ( dt_device_for_passthrough(dev) )
> >>>> +        return 0;
> >>>> +
> >>>> +    of_id = dt_match_node(dev->dev.of_match_table, dev->dev.of_node);
> >>>> +    ops = (struct pci_ecam_ops *) of_id->data;
> >>> 
> >>> Do we really need dt_match_node and dev->dev.of_match_table to get
> >>> dt_device_match.data?
> >>> 
> >> 
> >>> data is passed as a parameter to pci_host_common_probe, isn't it enough
> >>> to do:
> >>> 
> >>> ops = (struct pci_ecam_ops *) data;
> >> 
> >> As of now not required but in future we might need it if we implement other ecam supported bridge
> >> 
> >> static const struct dt_device_match gen_pci_dt_match[] = {                      
> >>    { .compatible = "pci-host-ecam-generic",                                    
> >>      .data =       &pci_generic_ecam_ops },
> >> 
> >>    { .compatible = "pci-host-cam-generic",
> >>      .data = &gen_pci_cfg_cam_bus_ops },                                 
> >> 
> >>    { },                                                                        
> >> };
> > 
> > Even if we add another ECAM-supported bridge, the following:
> > 
> > ops = (struct pci_ecam_ops *) data;
> > 
> > could still work, right? The probe function will directly receive as
> > parameter the .data pointer. You shouldn't need the indirection via
> > dt_match_node?
> 
> As per my understanding probe function will not get .data pointer.Probe data argument is NULL in most of the cases in XEN
> Please have a look once dt_pci_init() -> device_init(..) call flow implementation.

You are right. Looking at the code, nobody is currently using
dt_device_match.data and it is clear why: it is not passed to the
device_desc.init function at all. As it is today, it is basically
useless.

And there is only one case where device_init has a non-NULL data
parameter and it is in xen/drivers/char/arm-uart.c. All the others are
not even using the data parameter of device_init.

I think we need to change device_init so that dt_device_match.data can
be useful. Sorry for the scope-creep but I think we should do the
following:

- do not add of_match_table to struct device

- add one more parameter to device_desc.init:
  int (*init)(struct dt_device_node *dev, struct device_desc *desc, const void *data);

- change device_init to call desc->init with the right parameters:
  desc->init(dev, desc, data);

This way pci_host_common_probe is just going to get a desc directly as
parameter. I think it would make a lot more sense from an interface
perspective. It does require a change in all the DT_DEVICE_START.init
functions adding a struct device_desc *desc parameter, but it should be
a mechanical change.

Alternatively we could just change device_init to pass
device_desc.dt_match.data when the data parameter is NULL but it feels
like a hack.


What do you think?

