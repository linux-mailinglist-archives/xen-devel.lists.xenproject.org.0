Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 524834AA595
	for <lists+xen-devel@lfdr.de>; Sat,  5 Feb 2022 03:15:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265881.459445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGAaq-0007Ef-4V; Sat, 05 Feb 2022 02:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265881.459445; Sat, 05 Feb 2022 02:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGAap-0007CU-V5; Sat, 05 Feb 2022 02:14:27 +0000
Received: by outflank-mailman (input) for mailman id 265881;
 Sat, 05 Feb 2022 02:14:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hh+u=SU=gmail.com=robherring2@srs-se1.protection.inumbo.net>)
 id 1nGAan-0007CO-TY
 for xen-devel@lists.xenproject.org; Sat, 05 Feb 2022 02:14:26 +0000
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55fed28c-8629-11ec-8f75-fffcc8bd4f1a;
 Sat, 05 Feb 2022 03:14:24 +0100 (CET)
Received: by mail-oi1-f170.google.com with SMTP id q186so10623261oih.8
 for <xen-devel@lists.xenproject.org>; Fri, 04 Feb 2022 18:14:24 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id i23sm1389213otj.19.2022.02.04.18.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 18:14:22 -0800 (PST)
Received: (nullmailer pid 3618455 invoked by uid 1000);
 Sat, 05 Feb 2022 02:14:21 -0000
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
X-Inumbo-ID: 55fed28c-8629-11ec-8f75-fffcc8bd4f1a
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bavDyoeix3ivKrmvk1c86k8fQHTEv2BfyXOQ+LGiGnA=;
        b=MZEBnC6eaqx3T0DUfyoW4fcwcJwoQfbfvqWGLdrUZqfHyzh+FFNKH0o64QYRF0kkO0
         sm/04ugnVMQKbhiXBPZBZxbqThDLyoXhvzdbVd04OD8KyiM7cC1rt8jPA+hrKEvIXiFZ
         34pXtwM2iZUWBb6LCeaoeeGxDeqPF55vU9r8nO5V+/LYVXTrulY0ZtmHOLFsvfeO66Am
         k4pxJJ00qarDeA8LB/QhPwpm/hDDcw+oP7N8BvKsqYZDlMsBhj9u0KlgwAk47tr3h0/h
         R1Nh6hEgZUAf472Dv7HbMkJ8RTxlzVf5f4RoIP6LyikQJDUrRHALYMVb2WnFXn3dgrEy
         WMtA==
X-Gm-Message-State: AOAM532QzaXOOPAPtODdgI4w3e9cpHvJON7PVwbm9IeQgxoU4+xQKvuN
	96JWG+BT0T8rZvXDX56a/zXXGEC4Lw==
X-Google-Smtp-Source: ABdhPJzohhI86BDByZJvtg/GYgD3FQPT2/j3rlDpD888Vi5x4ag/iD4VE+2Pi/X/ul8DPGRoE3J0Dw==
X-Received: by 2002:aca:c056:: with SMTP id q83mr2812199oif.294.1644027263107;
        Fri, 04 Feb 2022 18:14:23 -0800 (PST)
Date: Fri, 4 Feb 2022 20:14:21 -0600
From: Rob Herring <robh@kernel.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Julien Grall <julien@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: xen: document Xen iommu device
Message-ID: <Yf3dfUtYoB8wpWkl@robh.at.kernel.org>
References: <20220117123251.140867-1-Sergiy_Kibrik@epam.com>
 <20220117123251.140867-2-Sergiy_Kibrik@epam.com>
 <e88b882f-4b5d-a801-fc68-66b7f790e11c@arm.com>
 <PAXPR03MB81144A63E18CAF10E785E2A7F0209@PAXPR03MB8114.eurprd03.prod.outlook.com>
 <447f89ca-86c0-dc35-e7ac-e6639a573670@arm.com>
 <alpine.DEB.2.22.394.2201261050300.27308@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2201261050300.27308@ubuntu-linux-20-04-desktop>

On Wed, Jan 26, 2022 at 10:56:39AM -0800, Stefano Stabellini wrote:
> On Wed, 26 Jan 2022, Robin Murphy wrote:
> > On 2022-01-26 15:09, Sergiy Kibrik wrote:
> > > Hi Robin,
> > > 
> > > > 
> > > > This could break Linux guests, since depending on the deferred probe
> > > > timeout setting it could lead to drivers never probing because the "IOMMU"
> > > > never becomes available.
> > > > 
> > > 
> > > I've noticed no deferred probe timeouts when booting with this patch. Could
> > > you please explain more on how this would break guests?
> > 
> > Right now I think it would actually require command-line intervention, e.g.
> > "fw_devlink=on" or "deferred_probe_timeout=3600" (with modules enabled for the
> > latter to take full effect), but I'm wary of the potential for future config
> > options to control those behaviours by default.

fw_devlink=on is now the default (for at least a couple of cycles).

> 
> If deferred_probe_timeout=3600 was specified, we would just need an
> IOMMU driver in Linux for the "xen,iommu-el2-v1" node to solve the
> problem, right? I guess I am trying to say that it wouldn't be a device
> tree interface problem but rather a Linux implementation discussion.

You would have to add that IOMMU driver to old, existing kernels if you 
want compatibility with a new DT. Otherwise, that kernel would stop 
booting with a new DT.

Rob


