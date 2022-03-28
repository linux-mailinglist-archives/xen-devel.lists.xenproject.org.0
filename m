Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE42D4E99F2
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 16:42:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295472.502809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYqYr-00084e-30; Mon, 28 Mar 2022 14:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295472.502809; Mon, 28 Mar 2022 14:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYqYq-000824-Vx; Mon, 28 Mar 2022 14:41:36 +0000
Received: by outflank-mailman (input) for mailman id 295472;
 Mon, 28 Mar 2022 14:39:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XDS/=UH=xs4all.nl=mark.kettenis@srs-se1.protection.inumbo.net>)
 id 1nYqWa-0007EL-KR
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 14:39:16 +0000
Received: from sibelius.xs4all.nl (sibelius.xs4all.nl [83.163.83.176])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d691e289-aea4-11ec-a405-831a346695d4;
 Mon, 28 Mar 2022 16:39:14 +0200 (CEST)
Received: from localhost (bloch.sibelius.xs4all.nl [local])
 by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 7b122d64;
 Mon, 28 Mar 2022 16:39:12 +0200 (CEST)
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
X-Inumbo-ID: d691e289-aea4-11ec-a405-831a346695d4
Date: Mon, 28 Mar 2022 16:39:12 +0200 (CEST)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: djm@mindrot.org, roger.pau@citrix.com,
	marmarek@invisiblethingslab.com,
	xen-devel@lists.xenproject.org, tech@openbsd.org
In-Reply-To: <c904abda-e6a0-256e-478a-ee0909c17e50@invisiblethingslab.com>
	(message from Demi Marie Obenour on Mon, 28 Mar 2022 09:51:22 -0400)
Subject: Re: Security support status of xnf(4) and xbf(4)
References: <Yj3qW/y20htoSvuK@itl-email>
 <37a4b6-cd56-1993-be2-b5522b9aa4d7@mindrot.org> <c904abda-e6a0-256e-478a-ee0909c17e50@invisiblethingslab.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-ID: <d3ccc20d61dc7636@bloch.sibelius.xs4all.nl>

> Date: Mon, 28 Mar 2022 09:51:22 -0400
> From: Demi Marie Obenour <demi@invisiblethingslab.com>
> 
> On 3/27/22 21:45, Damien Miller wrote:
> > On Fri, 25 Mar 2022, Demi Marie Obenour wrote:
> > 
> >> Linux’s netfront and blkfront drivers recently had a security
> >> vulnerability (XSA-396) that allowed a malicious backend to potentially
> >> compromise them.  In follow-up audits, I found that OpenBSD’s xnf(4)
> >> currently trusts the backend domain.  I reported this privately to Theo
> >> de Raadt, who indicated that OpenBSD does not consider this to be a
> >> security concern.
> >>
> >> This is obviously a valid position for the OpenBSD project to take, but
> >> it is surprising to some (such as myself) from the broader Xen
> >> ecosystem.  Standard practice in the Xen world is that bugs in frontends
> >> that allow a malicious backend to cause mischief *are* considered
> >> security bugs unless there is explicit documentation to the contrary.
> >> As such, I believe this deserves to be noted in xnf(4) and xbf(4)’s man
> >> pages.  If the OpenBSD project agrees, I am willing to write a patch,
> >> but I have no experience with mandoc so it might take a few tries.
> > 
> > Hang on, what is a "malicious backend" in this context? Is it something
> > other than the Xen Hypervisor? If not, then it seems not to be a useful
> > attack model, as the hypervisor typically has near-complete access to
> > guests' memory and CPU state.
> 
> The backend can run in any Xen VM.  It often runs in dom0, but it
> is not required to, and in Qubes OS the network backend never runs
> in dom0.  Unless it runs in dom0, it has no access to frontend memory,
> except for memory the frontend has explicitly given it access to via
> grant tables.

So this is somewhat similar to the situation on sun4v (Sun's
virtualization of the SPARC architecture).  When writing the vnet(4)
and vdsk(4) drivers for OpenBSD, I did consider the implications of
those drivers talking to a "malicious" domain.  the SPARC hypervisor
implements a concept similar to grant tables.  It is fairly obvious
that any memory you grant access to should be considered insecure.
This means that you either have to make a copy of the data or revoke
access to the shared memory through some sort of Hypervisor call that
implements a synchronization point of some sorts.  Otherwise you and
up TOCTOU issues all over the place.  But this obviously has
significant performance consequences.  For vnet(4) I decided that an
extra copy was worth doing and the only reasonable way of doing things
given how OpenBSD's mbuf layer works.  But for vdsk(4) I decided to
trust the other domain as there is no way to prevent it from feeding
you compromised data.  Full disk encryption doesn't really solve the
problem unless you have a way to securely verify the bootloader.

Personally I think it might be beneficial for us to turn xnf(4) into
what we colloquially call a "bcopy" network driver.  But folks who
actually use xen may find the performance impact of doing this
unacceptable and decide to trust the backend instead.

