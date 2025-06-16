Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6DDADBDC6
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 01:40:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017560.1394530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRJQT-0006M3-FZ; Mon, 16 Jun 2025 23:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017560.1394530; Mon, 16 Jun 2025 23:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRJQT-0006KK-Bs; Mon, 16 Jun 2025 23:39:41 +0000
Received: by outflank-mailman (input) for mailman id 1017560;
 Mon, 16 Jun 2025 23:39:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w0jr=Y7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uRJQR-0006KE-Ol
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 23:39:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 290ee1ff-4b0b-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 01:39:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 31EEE5C561D;
 Mon, 16 Jun 2025 23:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BB2C4CEEA;
 Mon, 16 Jun 2025 23:39:32 +0000 (UTC)
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
X-Inumbo-ID: 290ee1ff-4b0b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750117174;
	bh=qoNjzUrsbbLZ2YwToDWf9In6EJADVRiGdufE9CU/CmY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d/luVqJfvJnkDSKxdua4RlMmp2iTUW6SCGDIo/VuBQxj/nmpLv0IrkwhYdpYyNEjb
	 VhvnI3w+/vDIuX7SdoEqkykQCbZp9qaWkzC7ygb/to2YMMOG87O5/qQ95TizfdhlBU
	 wWiY+3g2gc7oXEbVE1togH7c7GAhU4abEUsIDUEOudXyMJQF7SPv5/Yl31SxUUB3yU
	 hY4bYGrt/H8A4Ufw9wENjQZOzabHNWEmcHefBGA0zuQXrYwCKUbLZPIN34YcCaYcfU
	 2XTiHymrGAxIOx90mJxyi4ML0iTCmuuXA9c5xeQpjWV4wB3Px0FyQ7Ifo8/A+idkHk
	 ipderh2NHC+nQ==
Date: Mon, 16 Jun 2025 16:39:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 14/14] kconfig: Allow x86 to pick
 CONFIG_DOM0LESS_BOOT
In-Reply-To: <DAO1A9SJ9I2G.2L00II6AC0JDZ@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506161639240.1384757@ubuntu-linux-20-04-desktop>
References: <20250613151612.754222-1-agarciav@amd.com> <20250613151612.754222-15-agarciav@amd.com> <2a54e49b-c1ad-4654-9291-4373e92580ff@xen.org> <DAO1A9SJ9I2G.2L00II6AC0JDZ@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Jun 2025, Alejandro Vallejo wrote:
> On Mon Jun 16, 2025 at 10:00 AM CEST, Julien Grall wrote:
> > Hi,
> >
> > On 13/06/2025 16:13, Alejandro Vallejo wrote:
> >> Without picking CONFIG_HAS_DEVICE_TREE.
> >> 
> >> In order to do that. Allow CONFIG_DOM0LESS_BOOT to enable a subset
> >> of the common/device-tree/ directory. 
> >  > x86 doesn't want dom0less-build.c,> as that's tightly integrated 
> > still to the ARM way of building domains.
> >
> > I don't understand this argument. dom0less-build.c was moved to common 
> > and it will soon be used by RISC-V. This raises the question what's so 
> > special with x86?
> 
> That's 2 separate matters:
> 
>   1. dom0less-build.c not being compiled in.
>   2. CONFIG_DOM0LESS_BOOT enabling use of DT code without CONFIG_HAS_DEVICE_TREE.
> 
> (1) is a matter of not wanting to boil the ocean upfront. The way x86 and
> everyone else build domains is just different and duplicated in non-trivially
> consolidable ways. The goal here is to enable the domain builders in any arch
> to use the same backbone. I don't want to go the extra mile just yet to unify
> domain construction (though in time I will want to).
> 
> (2) has to do with compiling OUT things I really cannot have around. Anything
> involving devices described in a DT must not exist on x86, because it has no
> concept of a "struct device".
> 
> My intent is/was to repurpose CONFIG_HAS_DEVICE_TREE to mean "this hypervisor
> goes on a platform that gives a platform-describing DT". On x86 that's given by
> DSDT/SSDTs with ACPI.

Alejandro is suggesting two levels of Device Tree support:

- full DT support, including device discovery via DT
- minimal DT support, for the dom0less/hyperlaunch configuration

Reading this series, it looks reasonable to me, at least as a stepping
stone. I think it is expected that the kind of DT support needed by an
architecture like ARM or RISC-V is different from the one needed by an
architecture like x86. Of course we might be able to align things even
more in the future but as of today I think it is reasonable to
distinguish between the two.

That said, we might want to consider renaming or changing the kconfig
options. For instance:

- CONFIG_HAS_DEVICE_TREE -> enable minimal DT support
- CONFIG_DT_DEVICE_DISCOVERY -> device discovery via DT

In this model, all architectures would have CONFIG_HAS_DEVICE_TREE, but
only ARM and RISC-V would have CONFIG_DT_DEVICE_DISCOVERY.


> > Note I don't particularly care if you don't want to use it on x86. 
> > However, the argument provided is lacking some details... This will be 
> > useful in the future if someone thinks about consolidating the two.
> 
> I very definitely will want it all unified, but I'm working one elephant at
> a time.

+1

