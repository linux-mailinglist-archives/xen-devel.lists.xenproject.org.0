Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1485AAE4E5D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 22:51:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022746.1398587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTo86-0006zM-OL; Mon, 23 Jun 2025 20:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022746.1398587; Mon, 23 Jun 2025 20:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTo86-0006xv-L5; Mon, 23 Jun 2025 20:51:02 +0000
Received: by outflank-mailman (input) for mailman id 1022746;
 Mon, 23 Jun 2025 20:51:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Rx=ZG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uTo85-0006xp-9Z
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 20:51:01 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c36943ba-5073-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 22:50:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1996E43562;
 Mon, 23 Jun 2025 20:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43EC8C4CEEA;
 Mon, 23 Jun 2025 20:50:56 +0000 (UTC)
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
X-Inumbo-ID: c36943ba-5073-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750711856;
	bh=2r0TtgD3LFnzLpbwy4L6qEk26dWvgzXcRvPBhGu0Rlk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FhkXc397HA7d1D4OiXnWRUYD4qwEoFq28yIdKv0bQL+IesvMzkdjSibsUUMIzX4CF
	 QwO5U6nhvN9CWXwHoSckPJPQ/IEpkzCnwP+gLQjnk29oNVHGxJ6L7+Cv3cAIqkQZFQ
	 nQsqe9oPq649P/JawlB7KVlnd7pM9p3Qwb+ZWwtgQts6BnfN5562J0ACPrc4nuSN65
	 azRqtlRtEV2Ji4SBmuc2pLupZ+tv6Csbm4uY+doJwsxXDwZerwqIm1QK9u0jN3KdGf
	 lMaMiKO/S/DiHbIvnf1LsBeVjaQhXg9GCL4glqaeZRHarodzHRniR0gL3+KfarKTdO
	 tQvOmRxvuVmDw==
Date: Mon, 23 Jun 2025 13:50:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v1 5/5] Setup ssh access to test systems
In-Reply-To: <aFlhlKc8Pl76SgTW@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2506231350430.8066@ubuntu-linux-20-04-desktop>
References: <cover.7129d44a341f3fb3a85f808a998c28ebe8a77ee8.1750684376.git-series.marmarek@invisiblethingslab.com> <d9e1dc62d2bcf647e0a1d26d90d2d33778d954a1.1750684376.git-series.marmarek@invisiblethingslab.com> <fe0adc4b-8bbf-41d6-b33d-54f5f9f18156@citrix.com>
 <aFlhlKc8Pl76SgTW@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1643038626-1750711856=:8066"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1643038626-1750711856=:8066
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 23 Jun 2025, Marek Marczykowski-Górecki wrote:
> On Mon, Jun 23, 2025 at 02:56:00PM +0100, Andrew Cooper wrote:
> > On 23/06/2025 2:46 pm, Marek Marczykowski-Górecki wrote:
> > > For this add also bridge package, so xenbr0 can be configured with
> > > /etc/network/interfaces.
> > > This allows extracting more logs out of the test system.
> > >
> > > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > > ---
> > > This enables passwordless root login. It's okay for qubes runners, as
> > > they are isolated (even from each other). Is that okay in other places
> > > too?
> > 
> > It's potentially a problem on a corporate network.
> > 
> > Can't we have each job generate a random password an insert it via the
> > dom0-rootfs overlay?
> > 
> > Or alternatively have the runner drop a public key in
> > /root/.ssh/authorised_keys ?
> 
> That can work, yes. And is preferred to a password, as easier to do
> non-interactively.

+1
--8323329-1643038626-1750711856=:8066--

