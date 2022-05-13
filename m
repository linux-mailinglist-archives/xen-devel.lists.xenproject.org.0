Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 829E852594E
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 03:17:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328130.551057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npJvN-00011T-Vk; Fri, 13 May 2022 01:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328130.551057; Fri, 13 May 2022 01:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npJvN-0000zT-Si; Fri, 13 May 2022 01:16:57 +0000
Received: by outflank-mailman (input) for mailman id 328130;
 Fri, 13 May 2022 01:16:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npJvM-0000zN-Je
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 01:16:56 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60c815b3-d25a-11ec-8fc4-03012f2f19d4;
 Fri, 13 May 2022 03:16:55 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C549FB82BCE;
 Fri, 13 May 2022 01:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A83C34113;
 Fri, 13 May 2022 01:16:53 +0000 (UTC)
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
X-Inumbo-ID: 60c815b3-d25a-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652404613;
	bh=sUi9zx5uAbIAkOAolBH/Xf63s1EcqIcLC1NiVzsqu5M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mOKCaTRYpGdPI4rSfftmlbu6cbGDJNXrqE+N2p5VITetqEeH9IqFLa84MLp1wG9TV
	 kthMAJG+ykWJ2rqtUNN1B525CpQ869QMOUOVvWbreigdYOYu3LK8yVMx2wythxehcy
	 WHVtnSjFaML/zSdRYOdgty8Y+XCMHNOLvDImpTrdYB7T5e+en5Uvd4NBRVAkEhnSP9
	 8UDSsHJ8Ezmrl0fql5ulX1/9+fG1pa45m6tPfxW22Ku1fjWPt3KVTNUWBpYHnXkxRh
	 qy6u9oG9+6Bg+G1dHmajmfjGDvkkYtP1Sg4gVO/nNi7dOiMGuxgbJb5lSCWXiDakn5
	 PnLA0H3Vr48+A==
Date: Thu, 12 May 2022 18:16:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, jgross@suse.com, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    anthony.perard@citrix.com, wl@xen.org
Subject: Re: [PATCH v6 5/7] xenstored: send an evtchn notification on
 introduce_domain
In-Reply-To: <0f4ef9bc-4089-6419-5373-13b0abdf5fd3@xen.org>
Message-ID: <alpine.DEB.2.22.394.2205121812160.3842@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop> <20220505001656.395419-5-sstabellini@kernel.org> <0f4ef9bc-4089-6419-5373-13b0abdf5fd3@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 May 2022, Julien Grall wrote:
> On 05/05/2022 01:16, Stefano Stabellini wrote:
> > From: Luca Miccio <lucmiccio@gmail.com>
> > 
> > When xs_introduce_domain is called, send out a notification on the
> > xenstore event channel so that any (dom0less) domain waiting for the
> > xenstore interface to be ready can continue with the initialization.
> > Before sending the notification, clear XENSTORE_RECONNECTING.
> > 
> > The extra notification is harmless for domains that don't require it.
> > 
> > In xs_wire.h update the commment on top of XENSTORE_RECONNECTING to
> > generalize its meaning to suit the dom0less use-case better.
> > 
> > Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > CC: jgross@suse.com
> > CC: anthony.perard@citrix.com
> > CC: wl@xen.org
> > ---
> > If you have better suggestions for the wording in xs_wire.h please
> > suggest!
> > 
> > 
> > Changes in v6:
> > - use XENSTORE_CONNECTED instead of 0x0
> > - update xs_wire.h
> > 
> > Changes in v5:
> > - reset XS_CONNECTION_STATE_RECONNECTING before notifying the domU
> > 
> > Changes in v2:
> > - drop the new late_init parameter
> > ---
> >   tools/xenstore/xenstored_domain.c | 4 ++++
> >   xen/include/public/io/xs_wire.h   | 2 +-
> 
> I am not entirely sure this is the right place to mention it. But I couldn't
> find a better one.
> 
> The documentation (docs/misc/xenstore-misc.txt) states that the field is valid
> when the server advertised ``Connection State``.
> 
> Is there any guarantee the field will be 0 for any previous {C, O}xenstored
> implementation? If not, then I think we need to set the feature flag so Linux
> knows the field can be used.
> 
> If yes, then the documentation should be relaxed so an OS knows it can safely
> use the field without checking the feature flag.

The xenstore page is allocated by the toolstack which zeros the page,
*xenstored wouldn't set it, so I think we can assume the field has
always been zero.


> > diff --git a/xen/include/public/io/xs_wire.h
> > b/xen/include/public/io/xs_wire.h
> > index 953a0050a3..c1ec7c73e3 100644
> > --- a/xen/include/public/io/xs_wire.h
> > +++ b/xen/include/public/io/xs_wire.h
> > @@ -141,7 +141,7 @@ struct xenstore_domain_interface {
> >     /* Valid values for the connection field */
> >   #define XENSTORE_CONNECTED 0 /* the steady-state */
> > -#define XENSTORE_RECONNECT 1 /* guest has initiated a reconnect */
> > +#define XENSTORE_RECONNECT 1 /* reconnect in progress */
> 
> The definition in the docs needs to be updated.

I wanted to do that but I am very unfamiliar with the xenstore docs.
Can you point me to the place where I need to change the definition? I
cannot find where XENSTORE_RECONNECT is defined...

