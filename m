Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D5BAD985D
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 00:48:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015012.1392988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQDBA-0003HX-JY; Fri, 13 Jun 2025 22:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015012.1392988; Fri, 13 Jun 2025 22:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQDBA-0003F2-GJ; Fri, 13 Jun 2025 22:47:20 +0000
Received: by outflank-mailman (input) for mailman id 1015012;
 Fri, 13 Jun 2025 22:47:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NROC=Y4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uQDB9-0003Er-D2
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 22:47:19 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59d9624b-48a8-11f0-b894-0df219b8e170;
 Sat, 14 Jun 2025 00:47:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 20E6A629D0;
 Fri, 13 Jun 2025 22:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC31C4CEEB;
 Fri, 13 Jun 2025 22:47:12 +0000 (UTC)
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
X-Inumbo-ID: 59d9624b-48a8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749854833;
	bh=ytw8JNslhXak2snPnJT5eJ2x9/n08SccQf+B2eSiPYo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oPuJcui8vBUye4pT6dkFenl4HHY8g9hvsKp4GRgAuFUV3WDDCVLaG3Nm2YV02AaH2
	 1IysDwLZC2ILM0/1zlEwgEjPoy59MwN4i+PcnHZlp2c70r7Redx9I2pB0AtlwmOvl8
	 63/ilqmDfLBoSOvoGr4wdrHceNLX4EvTJ2qmMmmSDTapeflI05vX2+iUSnF7TrYV1/
	 +Z/OUeNYAxuFnOtCYMxJ9+cXh2DIaBa+N0m/cFxaBNc6v4RogP+f1qIxAkyreQqxO6
	 Q+wATGgN2NjLajq79VcK7/oWnKirQnrHzLYlCxy5fPj4BAseUnpLhDNdW+zy/FVC9w
	 ayVjTfNyC/H/w==
Date: Fri, 13 Jun 2025 15:47:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Jason Andryuk <jason.andryuk@amd.com>, 
    Christian Lindig <christian.lindig@citrix.com>, 
    David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/4] xen: Add DOMAIN_CAPS_DEVICE_MODEL &
 XEN_DOMCTL_CDF_device_model
In-Reply-To: <af247ba8-150f-4c19-b332-2bf5f53a81a5@suse.com>
Message-ID: <alpine.DEB.2.22.394.2506131536510.8480@ubuntu-linux-20-04-desktop>
References: <20250610225737.469690-1-jason.andryuk@amd.com> <20250610225737.469690-4-jason.andryuk@amd.com> <af247ba8-150f-4c19-b332-2bf5f53a81a5@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Jun 2025, Jan Beulich wrote:
> On 11.06.2025 00:57, Jason Andryuk wrote:
> > To add more flexibility in system configuration add the new
> > DOMAIN_CAPS_DEVICE_MODEL flag and XEN_DOMCTL_CDF_device_model.
> > 
> > Thie new flag corresponds to allowing XSM_DM_PRIV for the domain.  This
> > will enable running device model emulators (QEMU) from the assigne
> > domain for multiple target domains.
> > 
> > Stubdoms assign target allowing the stubdom to serve as the device
> > model for a single domain.  This new flag allows the single domain to
> > provide emulators for multiple guests.
> > 
> > The specific scenario is a disaggregated system with the hardware domain
> > providing device models for muitple guest domains.
> 
> Why the hardware domain? Unless a DM also needs access to some of the
> physical hardware, it ought to run in a separate domain. Conceivably
> such a domain could service multiply guests, so maybe the "single
> target" concept presently used for stubdom simply needed extending?

Not necessarily. While it is possible to have driver domains, it is not
the default configuration.

In a default configuration, the hardware domain gets all the hardware by
default and therefore will also run the PV backends and Virtio backends.
The Virtio backends require DM hypercalls. Let me elaborate further.

In the datacenter, we have Dom0 typically with all the hardware, the
backends (PV and Virtio), and also the toolstack. Then all other domains
are created dynamically by the toolstack. Driver domains are possible
but not very common.

In automotive/embedded, the total number of domains is static, so we can
create them using dom0less. We don't need the toolstack to create VMs.
Also, we have safety concerns, so we want to take away as much
privileges as possible from Dom0. This is easy because thanks to
dom0less, we don't need the toolstack and we don't need to create VMs
dynamically.

So the model is that Dom0 becomes the hardware domain: it has all the
drivers and backends but it is not privileged in the sense of
creating/destroying other VMs. If a user wants to have Dom0 "super
powers", they can create an optional Control Domain. The Control Domain
is expected to be tiny, such as XTF or Zephyr. It will have the ability
that Dom0 used to have but without the drivers. From a privilege
perspective, the Control Domain could create additional VMs, but in
automotive/embedded it is not expected to be a use-case because the
total number of VMs is still static. 

So your point about driver domains. Yes, one can have driver domains the
same way that one can have driver domains in the datacenter but it is
not the default. The new default for embedded is what I described above
and I think it is a very widely applicable concept across industries:
automotive, industrial, robotics, etc. and also across vendors: AMD,
Xilinx, Renesas, EPAM, ARM, etc.

