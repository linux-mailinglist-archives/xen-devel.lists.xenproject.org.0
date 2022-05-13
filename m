Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5272526BBA
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 22:43:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328752.551868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npc7e-0000c6-Nu; Fri, 13 May 2022 20:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328752.551868; Fri, 13 May 2022 20:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npc7e-0000ZP-KT; Fri, 13 May 2022 20:42:50 +0000
Received: by outflank-mailman (input) for mailman id 328752;
 Fri, 13 May 2022 20:42:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npc7c-0000ZI-Mn
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 20:42:48 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f595f05-d2fd-11ec-b8b8-f95467ff1ed0;
 Fri, 13 May 2022 22:42:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C95AAB831D4;
 Fri, 13 May 2022 20:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250C7C34100;
 Fri, 13 May 2022 20:42:45 +0000 (UTC)
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
X-Inumbo-ID: 3f595f05-d2fd-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652474565;
	bh=8A07oBnxdkNkuXVyFVnrGizVDvsVydf0G+nR6brgT5c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=opVQZCDCSSCMSHwVKISN7oItOQa0yGdULhgfWJKjt8/8huksOrDjrAK65XRfTb8xX
	 t0FNW2LvfPEtZzqMgOuuQMeAzMCr/D+btpPUCOO54cDqjzCDz73XVXnIYlt9mr/om8
	 YyanIusVMoxEQyW9BLJMQbUelxmC/QyOaNutSeQOH/Y/koTHY6+Rl3twTe9e49eu4i
	 /AMmpUy4iG4G7U9IALzer813qyUCcdDAQRD7gCv8l13TLF4YiQON7DDvypibpi37F8
	 LSNYKye77bTJ+NjogciQVGboYXOnxnuwWSYKoWH1r+rFobyj4wEOmrHCwepaDlXMRV
	 9u5rz9B0GT89w==
Date: Fri, 13 May 2022 13:42:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    anthony.perard@citrix.com, wl@xen.org
Subject: Re: [PATCH v6 5/7] xenstored: send an evtchn notification on
 introduce_domain
In-Reply-To: <49d77746-1aaf-5fdc-517f-6ffa761474ef@suse.com>
Message-ID: <alpine.DEB.2.22.394.2205131342160.3842@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop> <20220505001656.395419-5-sstabellini@kernel.org> <0f4ef9bc-4089-6419-5373-13b0abdf5fd3@xen.org> <alpine.DEB.2.22.394.2205121812160.3842@ubuntu-linux-20-04-desktop>
 <49d77746-1aaf-5fdc-517f-6ffa761474ef@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 May 2022, Juergen Gross wrote:
> On 13.05.22 03:16, Stefano Stabellini wrote:
> > On Wed, 11 May 2022, Julien Grall wrote:
> > > On 05/05/2022 01:16, Stefano Stabellini wrote:
> > > > From: Luca Miccio <lucmiccio@gmail.com>
> > > > 
> > > > When xs_introduce_domain is called, send out a notification on the
> > > > xenstore event channel so that any (dom0less) domain waiting for the
> > > > xenstore interface to be ready can continue with the initialization.
> > > > Before sending the notification, clear XENSTORE_RECONNECTING.
> > > > 
> > > > The extra notification is harmless for domains that don't require it.
> > > > 
> > > > In xs_wire.h update the commment on top of XENSTORE_RECONNECTING to
> > > > generalize its meaning to suit the dom0less use-case better.
> > > > 
> > > > Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> > > > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > > > CC: jgross@suse.com
> > > > CC: anthony.perard@citrix.com
> > > > CC: wl@xen.org
> > > > ---
> > > > If you have better suggestions for the wording in xs_wire.h please
> > > > suggest!
> > > > 
> > > > 
> > > > Changes in v6:
> > > > - use XENSTORE_CONNECTED instead of 0x0
> > > > - update xs_wire.h
> > > > 
> > > > Changes in v5:
> > > > - reset XS_CONNECTION_STATE_RECONNECTING before notifying the domU
> > > > 
> > > > Changes in v2:
> > > > - drop the new late_init parameter
> > > > ---
> > > >    tools/xenstore/xenstored_domain.c | 4 ++++
> > > >    xen/include/public/io/xs_wire.h   | 2 +-
> > > 
> > > I am not entirely sure this is the right place to mention it. But I
> > > couldn't
> > > find a better one.
> > > 
> > > The documentation (docs/misc/xenstore-misc.txt) states that the field is
> > > valid
> > > when the server advertised ``Connection State``.
> > > 
> > > Is there any guarantee the field will be 0 for any previous {C,
> > > O}xenstored
> > > implementation? If not, then I think we need to set the feature flag so
> > > Linux
> > > knows the field can be used.
> > > 
> > > If yes, then the documentation should be relaxed so an OS knows it can
> > > safely
> > > use the field without checking the feature flag.
> > 
> > The xenstore page is allocated by the toolstack which zeros the page,
> > *xenstored wouldn't set it, so I think we can assume the field has
> > always been zero.
> > 
> > 
> > > > diff --git a/xen/include/public/io/xs_wire.h
> > > > b/xen/include/public/io/xs_wire.h
> > > > index 953a0050a3..c1ec7c73e3 100644
> > > > --- a/xen/include/public/io/xs_wire.h
> > > > +++ b/xen/include/public/io/xs_wire.h
> > > > @@ -141,7 +141,7 @@ struct xenstore_domain_interface {
> > > >      /* Valid values for the connection field */
> > > >    #define XENSTORE_CONNECTED 0 /* the steady-state */
> > > > -#define XENSTORE_RECONNECT 1 /* guest has initiated a reconnect */
> > > > +#define XENSTORE_RECONNECT 1 /* reconnect in progress */
> > > 
> > > The definition in the docs needs to be updated.
> > 
> > I wanted to do that but I am very unfamiliar with the xenstore docs.
> > Can you point me to the place where I need to change the definition? I
> > cannot find where XENSTORE_RECONNECT is defined...
> > 
> 
> See docs/misc/xenstore-ring.txt

Found it, thanks! I'll add:

In certain circumstances (e.g. dom0less guests with PV drivers support)
it is possible for the guest to find the Connection state already set to
1 by someone else during xenstore initialization. In that case, like in
the previous case, the guest must ignore all fields except the
Connection state and wait for it to be set to 0 before proceeding.

