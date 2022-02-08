Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EDB4ACCD8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 01:54:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267476.461214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHElE-0002Z5-NB; Tue, 08 Feb 2022 00:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267476.461214; Tue, 08 Feb 2022 00:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHElE-0002WC-JX; Tue, 08 Feb 2022 00:53:36 +0000
Received: by outflank-mailman (input) for mailman id 267476;
 Tue, 08 Feb 2022 00:53:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sPwi=SX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nHElD-0002W6-1m
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 00:53:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8945398c-8879-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 01:53:32 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 56C9860ED6;
 Tue,  8 Feb 2022 00:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E27C340ED;
 Tue,  8 Feb 2022 00:53:30 +0000 (UTC)
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
X-Inumbo-ID: 8945398c-8879-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644281610;
	bh=BKvtTLmbWxb5jV3BD/gKrYbJ6FspEd+ihRTcx/qBHEE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kFemCdk9YkMAKK3gkKKC/Xyps4rO+0ZjNa+cPU6KYIJiUedzkeyq2yi0dYYfXgI85
	 LgcAiZ/bKVLHdBZ4FyB0AVqWSQjgleB8ecgPbZZiFc4R5HD8htric3iqJ7qSpGY/56
	 LIsBwm96Cnt3gTaoblz3DweMenZ/5J7ekNmWd6DL6eiteKwxjnlHjw9C37YJC+zv05
	 D6dFuZR0JQNJPUiGgOcFzYPd0am7p13bLO2l7fRimfiCi07ypkfawzH1oelAtgWJdv
	 IpL/tU2I1MIR1SDLJzrFtSfcAI33Fw61yYk7qR/+we+VOzDvsiQzDx6UEj5dJh2hVd
	 FhmTbcNgazf+w==
Date: Mon, 7 Feb 2022 16:53:23 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rob Herring <robh@kernel.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Robin Murphy <robin.murphy@arm.com>, 
    Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Julien Grall <julien@xen.org>, 
    Oleksandr Tyshchenko <olekstysh@gmail.com>, 
    "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
    "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: xen: document Xen iommu
 device
In-Reply-To: <Yf3dfUtYoB8wpWkl@robh.at.kernel.org>
Message-ID: <alpine.DEB.2.22.394.2202071616300.2091381@ubuntu-linux-20-04-desktop>
References: <20220117123251.140867-1-Sergiy_Kibrik@epam.com> <20220117123251.140867-2-Sergiy_Kibrik@epam.com> <e88b882f-4b5d-a801-fc68-66b7f790e11c@arm.com> <PAXPR03MB81144A63E18CAF10E785E2A7F0209@PAXPR03MB8114.eurprd03.prod.outlook.com>
 <447f89ca-86c0-dc35-e7ac-e6639a573670@arm.com> <alpine.DEB.2.22.394.2201261050300.27308@ubuntu-linux-20-04-desktop> <Yf3dfUtYoB8wpWkl@robh.at.kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Feb 2022, Rob Herring wrote:
> On Wed, Jan 26, 2022 at 10:56:39AM -0800, Stefano Stabellini wrote:
> > On Wed, 26 Jan 2022, Robin Murphy wrote:
> > > On 2022-01-26 15:09, Sergiy Kibrik wrote:
> > > > Hi Robin,
> > > > 
> > > > > 
> > > > > This could break Linux guests, since depending on the deferred probe
> > > > > timeout setting it could lead to drivers never probing because the "IOMMU"
> > > > > never becomes available.
> > > > > 
> > > > 
> > > > I've noticed no deferred probe timeouts when booting with this patch. Could
> > > > you please explain more on how this would break guests?
> > > 
> > > Right now I think it would actually require command-line intervention, e.g.
> > > "fw_devlink=on" or "deferred_probe_timeout=3600" (with modules enabled for the
> > > latter to take full effect), but I'm wary of the potential for future config
> > > options to control those behaviours by default.
> 
> fw_devlink=on is now the default (for at least a couple of cycles).
> 
> > 
> > If deferred_probe_timeout=3600 was specified, we would just need an
> > IOMMU driver in Linux for the "xen,iommu-el2-v1" node to solve the
> > problem, right? I guess I am trying to say that it wouldn't be a device
> > tree interface problem but rather a Linux implementation discussion.
> 
> You would have to add that IOMMU driver to old, existing kernels if you 
> want compatibility with a new DT. Otherwise, that kernel would stop 
> booting with a new DT.

The tiny "xen,iommu-el2-v1" driver could be backported to the stable
trees, I would imagine. Otherwise, do you have another suggestion?

It looks like fw_devlink=on applies to supplier/consumer interfaces.
If that is the problem, then maybe we should avoid supplier/consumer
interfaces altogether. Instead, we could add a new Xen specific
property, e.g.:

    device@ff0000 {
        compatible = "this,device";

        xen,iommu = "on";
    };

