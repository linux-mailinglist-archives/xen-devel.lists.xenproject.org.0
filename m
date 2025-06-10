Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6582CAD46FC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 01:48:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011218.1389574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP8i2-0002IG-6c; Tue, 10 Jun 2025 23:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011218.1389574; Tue, 10 Jun 2025 23:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP8i2-0002Fm-3w; Tue, 10 Jun 2025 23:48:50 +0000
Received: by outflank-mailman (input) for mailman id 1011218;
 Tue, 10 Jun 2025 23:48:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zL97=YZ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uP8i1-0002Fg-6m
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 23:48:49 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7403858f-4655-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 01:48:48 +0200 (CEST)
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
X-Inumbo-ID: 7403858f-4655-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749599327; x=1749858527;
	bh=YZ+LEwyLbV55jtjFAJs+03TxX67SrG1sxnUP20Rj4Nc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=X8PSTF3xtiFw3MUGaBtKl6CMmVA4s/EJsaQUYOLe02z5I02qdUIt4RjB/wyjMHDkR
	 ve8cV9VlQWQ3esunaazustV7kvhOH9vd/jnB3ORD8CaqnRdf8pc6E8C/eYb04n+l2T
	 LFSJsIpH8TCC5SwwdEO82i0csn0MHAM3KY43kCogOouLiWpBrLXkNY/lisw4aaq5kf
	 RCfVhBuIHehRgY+omOFTxRggPxChG/xsjYY5O4h9qgWf5f3KNv21kzdZkG2fyxGCIT
	 jmiPRGPWmwIQ9gMe4Jj6UGpPKX+nc6rk2mw6LmB4v/h1bWaYkyMWDszj2kc5alMo3P
	 jViCMwRjQ/6MQ==
Date: Tue, 10 Jun 2025 23:48:42 +0000
To: Jason Andryuk <jason.andryuk@amd.com>
From: dmkhn@proton.me
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, anthony.perard@vates.tech, roger.pau@citrix.com, teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/3] xen/domain: adjust domain ID allocation for Arm
Message-ID: <aEjEVEdCsYqNnlfb@kraken>
In-Reply-To: <c6a8d11b-b7c1-4cf5-9c5b-e4c0920c2af0@amd.com>
References: <20250528225030.2652166-1-dmukhin@ford.com> <a4c860d7-1fa0-43f4-8ae1-af59b7c6506f@xen.org> <30c01c78-5a5e-435f-9b1c-faca3af04a76@suse.com> <aEfmkMBW7r1KHuV0@kraken> <11ea9475-d963-473d-a85b-d1c461e7b213@suse.com> <aEf1Hw+x35Yci/FS@kraken> <61e2ae99-041b-4c8c-81bb-c86b5cee936e@xen.org> <alpine.DEB.2.22.394.2506101130490.2495561@ubuntu-linux-20-04-desktop> <c6a8d11b-b7c1-4cf5-9c5b-e4c0920c2af0@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 9e7bc00ded14564182d99735f9f60a191ecc300f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 05:37:33PM -0400, Jason Andryuk wrote:
> On 2025-06-10 14:33, Stefano Stabellini wrote:
> > +Jason
> >
> > On Tue, 10 Jun 2025, Julien Grall wrote:
> >> But even if we are ok to break compatibility, I don't see the value of
> >> "control_domid". The implication of setting "hardware_domid" is you wi=
ll
> >> have a separate control domain. At which point, why would it matter to=
 specify
> >> the domain ID?
> >
> > I just wanted to say that while we (AMD) are looking for a hardware
> > domain / control domain separation for safety reasons, I don't think we
> > have a need to specify the domid for either one.
>=20
> Specifying domids isn't really necessary, but it can be convenience or
> usability improvement with dom0less/Hyperlaunch.  But I don't think
> control_domid is necessary.
>=20
> hardware_domid is not used for dom0less/Hyperlaunch with split control
> and hardware domains.  The "capabilities" device tree (DT) property
> specifies the role of the domain.
>=20
> Hyperlaunch lets you specify a domid in the DT - there is some
> auto-allocation logic, but I haven't use it.  dom0less doesn't allow
> specifying a domid today, but it could.  dom0less domains are assigned
> domids sequentially, so you can determine it from the order in the DT.
>=20
> Knowing the domids can be helpful for configuring userspace, and that
> only really matters for dom0less/Hyperlaunch.  e.g. xenstored wants to
> know which domid is control.
>=20
> I think it's nice to have a domid property so that you know when
> configuring the system which domain is which.  You can explicitly read
> the domid out of the DT and know what it is.  Since dom0 userspace needs
> to refer to domids, this make it clear which domain is which for, as an
> example, connecting disks.
>=20
> hardware_domid=3D is the way of enabling later hardware domain
> functionality.  dom0 boots as dom0.  When it creates domid =3D=3D
> hardware_domid, that new domain becomes the hardware domain, and dom0
> loses hwdom and becomes just the control domain.  It's a legacy feature
> and was a workaround for when Xen could only create a single domain at bo=
ot.

Thanks for explanation!

>=20
> Regards,
> Jason


