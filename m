Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A546380067D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 10:03:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645374.1007519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8zQT-0003IZ-LS; Fri, 01 Dec 2023 09:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645374.1007519; Fri, 01 Dec 2023 09:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8zQT-0003Gv-IT; Fri, 01 Dec 2023 09:03:09 +0000
Received: by outflank-mailman (input) for mailman id 645374;
 Fri, 01 Dec 2023 09:03:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bjU=HM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8zQS-0003Gp-0W
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 09:03:08 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ed091ce-9028-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 10:03:02 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40b399a6529so18892385e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 01:03:02 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c4fd200b0040b45282f88sm8255845wmq.36.2023.12.01.01.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 01:03:02 -0800 (PST)
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
X-Inumbo-ID: 6ed091ce-9028-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701421382; x=1702026182; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1YMrUSdUG2tveNsDVe5kwFVej4hbYjBI1JOj7cincDw=;
        b=F1xbO7KzmMhuPny5jn8W4N5RPA7HgO9gxfQQisqkhlQL7nuFmkRo6jvf6kceopUH6l
         paTWGz6i9uOUrxTUkAD60usJ97BLoDyMWkZzDGn8ny6SJ9KsKtH25NBjh+8TDDS5u9lS
         gMprYLF5Y9sYPgFHX+qSHisSS4C/Xx4oZbVDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701421382; x=1702026182;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1YMrUSdUG2tveNsDVe5kwFVej4hbYjBI1JOj7cincDw=;
        b=VQcuK45D3MLdIoiut41qJYVRvFsfzmwKf2QDhTuxZbdBueq4ovorvFCLAniI8vtY48
         8Q2YnpA5sNbE4OYCmLXArDJUoRPQ6v4jaHJfUkPup8aYBQET28t3J61z3RF9/Xsk9+as
         wGOyfnaodoPw/YyG2TVuMi6pP4he2ZgxGzy1IVwwBQXsAM2Xl/Ucj5Dq/tq5QDfr0O9e
         rLfDCISDfY+bokxzXWIwSdx3PvulnaYX65gJaRtgGE+xMA07F5J+RYXM5cKHi0eXu/VR
         EPMag3ds9S50/Wa0JovvSq7OJzBIo+waBfjDmWebybqHxu5cni09ZJ92B8ma5THz8H1r
         8qOA==
X-Gm-Message-State: AOJu0Yz+bOFxJWMhZSZUuBVZtyuurZ26zCZHR4ZU4ElsDF3/uwv/lpRd
	K51vtdjTVrqitEy20b6CZN35Yw==
X-Google-Smtp-Source: AGHT+IErNwVjqZkrQkMV/EuXtCIPxP0BRxtv/NR6+5nzEsJwPYHpwP27Ln1rR5aUzylK6yC9Wk+sFQ==
X-Received: by 2002:a05:600c:3d9a:b0:40b:5e4a:2356 with SMTP id bi26-20020a05600c3d9a00b0040b5e4a2356mr460923wmb.88.1701421382350;
        Fri, 01 Dec 2023 01:03:02 -0800 (PST)
Date: Fri, 1 Dec 2023 10:03:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Alex Deucher <Alexander.Deucher@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Huang Rui <Ray.Huang@amd.com>,
	Honglei Huang <Honglei1.Huang@amd.com>,
	Julia Zhang <Julia.Zhang@amd.com>
Subject: Re: [RFC XEN PATCH v2 3/3] tools: Add new function to get gsi from
 irq
Message-ID: <ZWmhRb6Ne4vgplzM@macbook>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-4-Jiqian.Chen@amd.com>
 <ZWX4R9UEE6oXiqaz@macbook>
 <alpine.DEB.2.22.394.2311291937170.3533093@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2311291956130.3533093@ubuntu-linux-20-04-desktop>
 <ZWheuUjLxShoQ_qn@macbook>
 <alpine.DEB.2.22.394.2311301907370.110490@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2311301907370.110490@ubuntu-linux-20-04-desktop>

On Thu, Nov 30, 2023 at 07:09:12PM -0800, Stefano Stabellini wrote:
> On Thu, 30 Nov 2023, Roger Pau Monné wrote:
> > On Wed, Nov 29, 2023 at 08:02:40PM -0800, Stefano Stabellini wrote:
> > > n Wed, 29 Nov 2023, Stefano Stabellini wrote:
> > > > On Tue, 28 Nov 2023, Roger Pau Monné wrote:
> > > > > On Fri, Nov 24, 2023 at 06:41:36PM +0800, Jiqian Chen wrote:
> > > > > > In PVH dom0, it uses the linux local interrupt mechanism,
> > > > > > when it allocs irq for a gsi, it is dynamic, and follow
> > > > > > the principle of applying first, distributing first. And
> > > > > > if you debug the kernel codes, you will find the irq
> > > > > > number is alloced from small to large, but the applying
> > > > > > gsi number is not, may gsi 38 comes before gsi 28, that
> > > > > > causes the irq number is not equal with the gsi number.
> > > > > > And when we passthrough a device, QEMU will use its gsi
> > > > > > number to do mapping actions, see xen_pt_realize->
> > > > > > xc_physdev_map_pirq, but the gsi number is got from file
> > > > > > /sys/bus/pci/devices/xxxx:xx:xx.x/irq in current code,
> > > > > > so it will fail when mapping.
> > > > > > And in current codes, there is no method to translate
> > > > > > irq to gsi for userspace.
> > > > > 
> > > > > I think it would be cleaner to just introduce a new sysfs node that
> > > > > contains the gsi if a device is using one (much like the irq sysfs
> > > > > node)?
> > > > > 
> > > > > Such ioctl to translate from IRQ to GSI has nothing to do with Xen, so
> > > > > placing it in privcmd does seem quite strange to me.  I understand
> > > > > that for passthrough we need the GSI, but such translation layer from
> > > > > IRQ to GSI is all Linux internal, and it would be much simpler to just
> > > > > expose the GSI in sysfs IMO.
> > > > 
> > > > Maybe something to add to drivers/xen/sys-hypervisor.c in Linux.
> > > > Juergen what do you think?
> > > 
> > > Let me also add that privcmd.c is already a Linux specific interface.
> > > Although it was born to be a Xen hypercall "proxy" in reality today we
> > > have a few privcmd ioctls that don't translate into hypercalls. So I
> > > don't think that adding IOCTL_PRIVCMD_GSI_FROM_IRQ would be a problem.
> > 
> > Maybe not all ioctls translate to hypercalls (I guess you are
> > referring to the IOCTL_PRIVCMD_RESTRICT ioctl), but they are specific
> > Xen actions.  Getting the GSI used by a device has nothing do to with
> > Xen.
> > 
> > IMO drivers/xen/sys-hypervisor.c is also not appropriate, but I'm not
> > the maintainer of any of those components.
> > 
> > There's nothing Xen specific about fetching the GSI associated with a
> > PCI device.  The fact that Xen needs it for passthrough is just a red
> > herring, further cases where the GSI is needed might arise outside of
> > Xen, and hence such node would better be placed in a generic
> > location.  The right location should be /sys/bus/pci/devices/<sbdf>/gsi.
> 
> That might be true but /sys/bus/pci/devices/<sbdf>/gsi is a non-Xen
> generic interface and the maintainers of that portion of Linux code
> might have a different opinion. We'll have to see.

Right, but before resorting to implement a Xen specific workaround
let's attempt to do it the proper way :).

I cannot see why exposing the gsi on sysfs like that would be an
issue.  There's a lot of resource information exposed on sysfs
already, and it's a trivial node to implement.

Thanks, Roger.

