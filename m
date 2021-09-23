Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 563484165C4
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 21:13:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194538.346566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTU8i-0004pe-DR; Thu, 23 Sep 2021 19:12:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194538.346566; Thu, 23 Sep 2021 19:12:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTU8i-0004mL-93; Thu, 23 Sep 2021 19:12:12 +0000
Received: by outflank-mailman (input) for mailman id 194538;
 Thu, 23 Sep 2021 19:12:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SRu=ON=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTU8h-0004m4-KQ
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 19:12:11 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74bb6cc1-9920-4ccb-be29-23b5b192f525;
 Thu, 23 Sep 2021 19:12:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2C916109E;
 Thu, 23 Sep 2021 19:12:09 +0000 (UTC)
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
X-Inumbo-ID: 74bb6cc1-9920-4ccb-be29-23b5b192f525
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632424329;
	bh=ItYHWUdHtysSe2603vDDSqLA2H/jNVUQL0qmiwt3PCE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aJz/1vSMd270C2jiAWo1h8dQ1OpDCTtsnxnIdx/lJx5ikX0Wj1evayiiiXJFxREo9
	 K9NIOR7PiLQFPEKrN3C460/IjdgUil9e2oUD1qOko8+ICBWMmyAu/u3NnApNmB63MX
	 nU8SaaXh0AJvqwbCllpznFrEJmovlfr48L/urs7fVe7A0G5tgPJ/AXCgA3ss6fK3Dv
	 zHlow+JukHQfZZUhzCZZM9cDAdSJbYkRsT3scafI7f62fl7Xdjtox5GQrU2yK/8l3n
	 GbSLuecm/5tDpk2fXSGfpViaOIwDxpfV0VtVAB3AMe6t7CfuJs4J4a2mntS5i9orP6
	 D+315Ns7IMJ7A==
Date: Thu, 23 Sep 2021 12:12:08 -0700 (PDT)
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
In-Reply-To: <F87F4A4E-D6CC-4341-88CF-2DD52A1FD503@arm.com>
Message-ID: <alpine.DEB.2.21.2109231206120.17979@sstabellini-ThinkPad-T480s>
References: <cover.1632307952.git.rahul.singh@arm.com> <c837d73b1fc8953ab48d36609482cf84832b7827.1632307952.git.rahul.singh@arm.com> <alpine.DEB.2.21.2109221836190.17979@sstabellini-ThinkPad-T480s> <F87F4A4E-D6CC-4341-88CF-2DD52A1FD503@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Rahul Singh wrote:
> >> +            goto err_exit;
> >> +    }
> > 
> > This is unnecessary at the moment, right? Can we get rid of ops->init ?
> 
> No this is required for N1SDP board. Please check below patch.
> https://gitlab.com/rahsingh/xen-integration/-/commit/6379ba5764df33d57547087cff4ffc078dc515d5

OK


> >> +int pci_host_common_probe(struct dt_device_node *dev, const void *data)
> >> +{
> >> +    struct pci_host_bridge *bridge;
> >> +    struct pci_config_window *cfg;
> >> +    struct pci_ecam_ops *ops;
> >> +    const struct dt_device_match *of_id;
> >> +    int err;
> >> +
> >> +    if ( dt_device_for_passthrough(dev) )
> >> +        return 0;
> >> +
> >> +    of_id = dt_match_node(dev->dev.of_match_table, dev->dev.of_node);
> >> +    ops = (struct pci_ecam_ops *) of_id->data;
> > 
> > Do we really need dt_match_node and dev->dev.of_match_table to get
> > dt_device_match.data?
> > 
> 
> > data is passed as a parameter to pci_host_common_probe, isn't it enough
> > to do:
> > 
> > ops = (struct pci_ecam_ops *) data;
> 
> As of now not required but in future we might need it if we implement other ecam supported bridge
> 
> static const struct dt_device_match gen_pci_dt_match[] = {                      
>     { .compatible = "pci-host-ecam-generic",                                    
>       .data =       &pci_generic_ecam_ops },
> 
>     { .compatible = "pci-host-cam-generic",
>       .data = &gen_pci_cfg_cam_bus_ops },                                 
>                                                                                 
>     { },                                                                        
> };

Even if we add another ECAM-supported bridge, the following:

ops = (struct pci_ecam_ops *) data;

could still work, right? The probe function will directly receive as
parameter the .data pointer. You shouldn't need the indirection via
dt_match_node?

If you are worried about gen_pci_cfg_cam_bus_ops not being a struct
pci_ecam_ops: that problem can also be solved by making
gen_pci_cfg_cam_bus_ops a struct containinig a struct pci_ecam_ops.

