Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F421D4EA3E4
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 01:55:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295615.503147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYzBU-0001Y6-3B; Mon, 28 Mar 2022 23:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295615.503147; Mon, 28 Mar 2022 23:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYzBT-0001WD-W2; Mon, 28 Mar 2022 23:54:03 +0000
Received: by outflank-mailman (input) for mailman id 295615;
 Mon, 28 Mar 2022 23:42:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hRXT=UH=openbsd.org=deraadt@srs-se1.protection.inumbo.net>)
 id 1nYyzw-0000XV-OF
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 23:42:08 +0000
Received: from cvs.openbsd.org (cvs.openbsd.org [199.185.137.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ac99c71b-aef0-11ec-a405-831a346695d4;
 Tue, 29 Mar 2022 01:42:06 +0200 (CEST)
Received: from cvs.openbsd.org (localhost [127.0.0.1])
 by cvs.openbsd.org (OpenSMTPD) with ESMTP id 40cc56d5;
 Mon, 28 Mar 2022 17:42:02 -0600 (MDT)
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
X-Inumbo-ID: ac99c71b-aef0-11ec-a405-831a346695d4
From: "Theo de Raadt" <deraadt@openbsd.org>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
cc: Mark Kettenis <mark.kettenis@xs4all.nl>, djm@mindrot.org,
    roger.pau@citrix.com, marmarek@invisiblethingslab.com,
    xen-devel@lists.xenproject.org, tech@openbsd.org
Subject: Re: Security support status of xnf(4) and xbf(4)
In-reply-to: <10e7b01a-2a8e-17cd-6418-1a6f836cc251@invisiblethingslab.com>
References: <Yj3qW/y20htoSvuK@itl-email> <37a4b6-cd56-1993-be2-b5522b9aa4d7@mindrot.org> <c904abda-e6a0-256e-478a-ee0909c17e50@invisiblethingslab.com> <d3ccc20d61dc7636@bloch.sibelius.xs4all.nl> <10e7b01a-2a8e-17cd-6418-1a6f836cc251@invisiblethingslab.com>
Comments: In-reply-to Demi Marie Obenour <demi@invisiblethingslab.com>
   message dated "Mon, 28 Mar 2022 16:38:33 -0400."
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Mar 2022 17:42:02 -0600
Message-ID: <37125.1648510922@cvs.openbsd.org>

And I simply why we don't simply delete all that code.


Demi Marie Obenour <demi@invisiblethingslab.com> wrote:

> On 3/28/22 10:39, Mark Kettenis wrote:
> >> Date: Mon, 28 Mar 2022 09:51:22 -0400
> >> From: Demi Marie Obenour <demi@invisiblethingslab.com>
> >>
> >> On 3/27/22 21:45, Damien Miller wrote:
> >>> On Fri, 25 Mar 2022, Demi Marie Obenour wrote:
> >>>
> >>>> Linux=E2=80=99s netfront and blkfront drivers recently had a security
> >>>> vulnerability (XSA-396) that allowed a malicious backend to potentia=
lly
> >>>> compromise them.  In follow-up audits, I found that OpenBSD=E2=80=99=
s xnf(4)
> >>>> currently trusts the backend domain.  I reported this privately to T=
heo
> >>>> de Raadt, who indicated that OpenBSD does not consider this to be a
> >>>> security concern.
> >>>>
> >>>> This is obviously a valid position for the OpenBSD project to take, =
but
> >>>> it is surprising to some (such as myself) from the broader Xen
> >>>> ecosystem.  Standard practice in the Xen world is that bugs in front=
ends
> >>>> that allow a malicious backend to cause mischief *are* considered
> >>>> security bugs unless there is explicit documentation to the contrary.
> >>>> As such, I believe this deserves to be noted in xnf(4) and xbf(4)=E2=
=80=99s man
> >>>> pages.  If the OpenBSD project agrees, I am willing to write a patch,
> >>>> but I have no experience with mandoc so it might take a few tries.
> >>>
> >>> Hang on, what is a "malicious backend" in this context? Is it somethi=
ng
> >>> other than the Xen Hypervisor? If not, then it seems not to be a usef=
ul
> >>> attack model, as the hypervisor typically has near-complete access to
> >>> guests' memory and CPU state.
> >>
> >> The backend can run in any Xen VM.  It often runs in dom0, but it
> >> is not required to, and in Qubes OS the network backend never runs
> >> in dom0.  Unless it runs in dom0, it has no access to frontend memory,
> >> except for memory the frontend has explicitly given it access to via
> >> grant tables.
> >=20
> > So this is somewhat similar to the situation on sun4v (Sun's
> > virtualization of the SPARC architecture).  When writing the vnet(4)
> > and vdsk(4) drivers for OpenBSD, I did consider the implications of
> > those drivers talking to a "malicious" domain.  the SPARC hypervisor
> > implements a concept similar to grant tables.  It is fairly obvious
> > that any memory you grant access to should be considered insecure.
> > This means that you either have to make a copy of the data or revoke
> > access to the shared memory through some sort of Hypervisor call that
> > implements a synchronization point of some sorts.  Otherwise you and
> > up TOCTOU issues all over the place.  But this obviously has
> > significant performance consequences.  For vnet(4) I decided that an
> > extra copy was worth doing and the only reasonable way of doing things
> > given how OpenBSD's mbuf layer works.  But for vdsk(4) I decided to
> > trust the other domain as there is no way to prevent it from feeding
> > you compromised data.  Full disk encryption doesn't really solve the
> > problem unless you have a way to securely verify the bootloader.
>=20
> In Qubes OS, xbf(4) devices are configurable.  While all of them are
> provided by dom0 (which is trusted) by default, it is possible to
> attach devices that are *not* provided by dom0, and these devices
> should not be trusted.
>=20
> > Personally I think it might be beneficial for us to turn xnf(4) into
> > what we colloquially call a "bcopy" network driver.  But folks who
> > actually use xen may find the performance impact of doing this
> > unacceptable and decide to trust the backend instead.
>=20
> You actually don=E2=80=99t have to do that.  The Xen network protocol
> requires the backend to drop access to the buffer before giving it
> to the frontend, so the frontend only needs to ensure that it cannot
> regain access.  This will fail if the backend still has access, but
> that is a bug in the backend, in which case you should shut down the
> interface.  So there should not be any significant performance impact.
>=20
> If you are curious about how Linux does this, you can look at
> drivers/xen/grant-table.c, drivers/net/xen-netfront.c, and
> drivers/block/xen-blkfront.c from the Linux source.  They are
> dual licensed GPL/MIT so there should not be licensing issues there.
> Be sure to use a version at or after =E2=80=9Cxen/netfront: react properl=
y to
> failing gnttab_end_foreign_access_ref()=E2=80=9D and the other XSA-396 pa=
tches.
> --=20
> Sincerely,
> Demi Marie Obenour (she/her/hers)
> Invisible Things Lab

