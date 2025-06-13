Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A890EAD9867
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 00:59:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015026.1393008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQDMg-0005Nn-Le; Fri, 13 Jun 2025 22:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015026.1393008; Fri, 13 Jun 2025 22:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQDMg-0005Lq-Ip; Fri, 13 Jun 2025 22:59:14 +0000
Received: by outflank-mailman (input) for mailman id 1015026;
 Fri, 13 Jun 2025 22:59:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NROC=Y4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uQDMf-0005Lk-6I
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 22:59:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04826943-48aa-11f0-a309-13f23c93f187;
 Sat, 14 Jun 2025 00:59:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 472155C5EAE;
 Fri, 13 Jun 2025 22:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA787C4CEE3;
 Fri, 13 Jun 2025 22:59:07 +0000 (UTC)
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
X-Inumbo-ID: 04826943-48aa-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749855549;
	bh=M7HjTnP6AklMB8JVcgr0sPm3URJ6h3TEpsF0SvDE9Mk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KGkmN6y0tgc7lHXJeALH45FONXWD8mEYcS8UTK6cc5vrTQ48QT5t1YGYTl6hfBtlk
	 PaLaQfaQPz54Nuh+vBcP02M0p/XxBcA/5C3G4t815SDHVcrSXgh2DctGdShE9HRU2w
	 IsUBFFCc51obc5S6NRc8rsqk40o24UBDo3bA2nmXnxiL2o9m08sPWwpMdhSYtMX3Hk
	 8qmTX95VxjNZ7NqERs5puYq2A+F6gX9rBIQ/4pMFzx9ZZmh470MpOWUS9e/WUOwRMG
	 4HvHCsHNU2IjBKQoLxIa5w2bx1/DHbBRTNhtghFUJLn7eiyPP8sxPpSOdhlsTiGld2
	 J3xBxOmKCEx1w==
Date: Fri, 13 Jun 2025 15:59:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Jason Andryuk <jason.andryuk@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Christian Lindig <christian.lindig@citrix.com>, 
    David Scott <dave@recoil.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/4] XSM changes for split hardware / control domain
In-Reply-To: <eecfaf59-3b7a-4330-863f-bbdc66a355e7@suse.com>
Message-ID: <alpine.DEB.2.22.394.2506131526540.8480@ubuntu-linux-20-04-desktop>
References: <20250610225737.469690-1-jason.andryuk@amd.com> <0defc4e7-382b-4651-8255-652da17a2129@suse.com> <4b0b7554-e22f-4ef2-9236-bcc2079842d2@amd.com> <eecfaf59-3b7a-4330-863f-bbdc66a355e7@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Jun 2025, Jan Beulich wrote:
> On 11.06.2025 07:08, Jason Andryuk wrote:
> > On 2025-06-11 09:28, Jan Beulich wrote:
> >> On 11.06.2025 00:57, Jason Andryuk wrote:
> >>> Theses are the broad changes needed for a split hardware / control
> >>> domain.
> >>>
> >>> An earlier posting gave device_model privileges to hardware domain.  For
> >>> this posting, it was split out into a new capability.  This way the
> >>> operator can choose where to run the device models without making the
> >>> hardware domain have the permissions.
> >>>
> >>> The first patch add XSM_HW_PRIV for the hardware hypercalls.  Unlike the
> >>> first posting, the control domain can call these hypercalls even though
> >>> it doesn't really make sense.  The idea was to keep the control domain
> >>> all powerful from an XSM perspective.
> >>>
> >>> SILO is changed to allow control, hardwware or xenstore to service
> >>> domUs.  Xenstore and hardware will use grants for PV interfaces.
> >>> Control wouldn't typically provide PV interfaces to domUs, but it is
> >>> given the permision to do so.  Again, to keep control all powerful.
> >>>
> >>> xsm/dummy: Allow hwdom SYSCTL_readconsole/physinfo this is not strictly
> >>> needed.  xenconsoled could read Xen's dmesg.  If it's in hwdom, then
> >>> that permission would be required.  SYSCTL_physinfo is mainly to silence
> >>> xl messages, which are mostly cosmetic.
> >>>
> >>> Jason Andryuk (4):
> >>>    xen/xsm: Add XSM_HW_PRIV
> >>>    xsm/silo: Support hwdom/control domains
> >>>    xen: Add DOMAIN_CAPS_DEVICE_MODEL & XEN_DOMCTL_CDF_device_model
> >>>    xsm/dummy: Allow hwdom SYSCTL_readconsole/physinfo
> >>
> >> Overall I can't help the impression that this level of disaggregation simply
> >> requires the use of Flask.
> > 
> > I have thought about that.  The problem with Flask is the complexity of 
> > the security server.  We don't want to have to deal with all that code. 
> > A fixed policy is easier for our coverage testing.
> > 
> > Exposing separate control, hardware and xenstore capabilities, it makes 
> > sense for the default policy to function with them.
> 
> Yet as indicated in replies to individual patches - the boundaries between
> the three aren't clear, which imo goes (to some degree at least) against the
> purpose of "disaggregation".

At a high level things are clear. We have a static number of VMs, so
with Dom0less we don't need domain creation capabilities. Dom0 can be
de-privileged and becomes the Hardware Domain. To allow monitoring and
other privileged operations an optional Control Domain might be present
(or not).

- The Control Domain has d->is_privileged == true but has no direct
  access to hardware by default. With Dom0less ability to create all the
  VMs at boot, the Control Domain is not required for domain creation,
  so it is just optional.

- The Hardware Domain has all hardware by default but d->is_privileged
  == false. The Hardware Domain should be as close to a DomU as possible
  in terms of privileges but it must be able to run PV backends and
  Virtio backends.

- Xenstored will typically be in the Hardware Domain to enable PV
  backends, especially as the Control Domain is optional. It could also
  live in its own separate domain to speed up the boot. If a user
  chooses to deploy a Control Domain, xenstored could also run there.
  It could be entirely missing if a user only deploys Virtio. It makes
  sense to provide flexibility on this.

We have other instances of XSM policies without Flask, such as SILO. I
think the industrial/automotive use-case is clear enough and shared
among many Xen community members so I think it makes sense to optimize a
policy for it without having to involving Flask because Flask's
complexity would cause trouble in terms of coverage testing and
validation.

