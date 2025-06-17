Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704F5ADBE0F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 02:21:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017602.1394580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRK50-0007DB-M6; Tue, 17 Jun 2025 00:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017602.1394580; Tue, 17 Jun 2025 00:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRK50-0007Bj-JX; Tue, 17 Jun 2025 00:21:34 +0000
Received: by outflank-mailman (input) for mailman id 1017602;
 Tue, 17 Jun 2025 00:21:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hcls=ZA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uRK4z-0007Bd-EN
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 00:21:33 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0474ba08-4b11-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 02:21:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4564B629DF;
 Tue, 17 Jun 2025 00:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C8EC4CEEA;
 Tue, 17 Jun 2025 00:21:28 +0000 (UTC)
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
X-Inumbo-ID: 0474ba08-4b11-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750119690;
	bh=RHkuIpnIZX0wYKhXFDudawHGDMOOeYU3utuaBGcbUyU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LWwe6CIMH43QasEuDVs54ax1kj3lGHjDqStfAZxFxY23jMSVRgvTCEt7ucp9jZ402
	 N4ZH+Llq775Is5hUcLXtqU631YjdG5ZsgI2ZlsEmS4VPwc9tArSk2wUNryE/XXnOsg
	 +B7WN4d/k/YW4hkrXMXoiYv0eTgWopUo1iSx7G/CrIFUhTM56FaRBQEA0tjvJCTdUh
	 gYwJOLM4Uy17WDbvhIMN5nF6k/w9+hmzP1j3ns7QTlf4fxuQpWgc90p8+tzsDMCORl
	 cgXKV0EHcEzP7nstCxxu/x3Tnz5EgvxLVQqQvO3s3qnItkeCZ/vbIZKIEDlKyyqELu
	 gfkao9E0vLTXQ==
Date: Mon, 16 Jun 2025 17:21:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jason Andryuk <jason.andryuk@amd.com>, 
    Christian Lindig <christian.lindig@citrix.com>, 
    David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/4] xen: Add DOMAIN_CAPS_DEVICE_MODEL &
 XEN_DOMCTL_CDF_device_model
In-Reply-To: <3ef3ed9d-d6af-4621-ab4c-eb2ea88081b3@suse.com>
Message-ID: <alpine.DEB.2.22.394.2506161711150.1384757@ubuntu-linux-20-04-desktop>
References: <20250610225737.469690-1-jason.andryuk@amd.com> <20250610225737.469690-4-jason.andryuk@amd.com> <af247ba8-150f-4c19-b332-2bf5f53a81a5@suse.com> <alpine.DEB.2.22.394.2506131536510.8480@ubuntu-linux-20-04-desktop>
 <3ef3ed9d-d6af-4621-ab4c-eb2ea88081b3@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Jun 2025, Jan Beulich wrote:
> On 14.06.2025 00:47, Stefano Stabellini wrote:
> > On Wed, 11 Jun 2025, Jan Beulich wrote:
> >> On 11.06.2025 00:57, Jason Andryuk wrote:
> >>> To add more flexibility in system configuration add the new
> >>> DOMAIN_CAPS_DEVICE_MODEL flag and XEN_DOMCTL_CDF_device_model.
> >>>
> >>> Thie new flag corresponds to allowing XSM_DM_PRIV for the domain.  This
> >>> will enable running device model emulators (QEMU) from the assigne
> >>> domain for multiple target domains.
> >>>
> >>> Stubdoms assign target allowing the stubdom to serve as the device
> >>> model for a single domain.  This new flag allows the single domain to
> >>> provide emulators for multiple guests.
> >>>
> >>> The specific scenario is a disaggregated system with the hardware domain
> >>> providing device models for muitple guest domains.
> >>
> >> Why the hardware domain? Unless a DM also needs access to some of the
> >> physical hardware, it ought to run in a separate domain. Conceivably
> >> such a domain could service multiply guests, so maybe the "single
> >> target" concept presently used for stubdom simply needed extending?
> > 
> > Not necessarily. While it is possible to have driver domains, it is not
> > the default configuration.
> > 
> > In a default configuration, the hardware domain gets all the hardware by
> > default and therefore will also run the PV backends and Virtio backends.
> > The Virtio backends require DM hypercalls. Let me elaborate further.
> > 
> > In the datacenter, we have Dom0 typically with all the hardware, the
> > backends (PV and Virtio), and also the toolstack. Then all other domains
> > are created dynamically by the toolstack. Driver domains are possible
> > but not very common.
> > 
> > In automotive/embedded, the total number of domains is static, so we can
> > create them using dom0less. We don't need the toolstack to create VMs.
> > Also, we have safety concerns, so we want to take away as much
> > privileges as possible from Dom0.
> 
> At least purely by the wording, this ...
> 
> > This is easy because thanks to
> > dom0less, we don't need the toolstack and we don't need to create VMs
> > dynamically.
> > 
> > So the model is that Dom0 becomes the hardware domain: it has all the
> > drivers and backends but it is not privileged in the sense of
> > creating/destroying other VMs. If a user wants to have Dom0 "super
> > powers", they can create an optional Control Domain. The Control Domain
> > is expected to be tiny, such as XTF or Zephyr. It will have the ability
> > that Dom0 used to have but without the drivers. From a privilege
> > perspective, the Control Domain could create additional VMs, but in
> > automotive/embedded it is not expected to be a use-case because the
> > total number of VMs is still static. 
> > 
> > So your point about driver domains. Yes, one can have driver domains the
> > same way that one can have driver domains in the datacenter but it is
> > not the default.
> 
> ... kind of contradicts this: Running e.g. qemu in Dom0 gives Dom0 quite
> a bit of extra privilege.

Yes, in an ideal world that would not be necessary. However, in
automotive Virtio has become the standard. While there are efforts
ongoing to rework the Virtio protocol to have a better security/safety
profile, we need to provide something that works today. Even PV drivers
are not perfect in that regard because I don't think we can claim they
are free from interference but that is another topic.

In order to provide something that works today, we need to have support
for virtio backends in the hardware domain. Like you said, that gives
quite a bit of extra privilege to the hardware domain which is not
acceptable when targeting a "safe" VM such as the Control Domain.

Thus, we have another series to restrict DM and foreign mapping
hypercalls from being able to target "safe" domains. In other words, the
patch series will prevent the hardware domain from being able to target
the Control Domain or another DomU configured as "safe" with DM
hypercalls or foreign mapping hypercalls.

It will be up to the user to decide which domUs the harwdare domain will
be able to target. That way, the user will still be able to configure
one or more VMs are completely protected from interference from the
hardware domain at the cost of having no (traditional) virtio devices.

