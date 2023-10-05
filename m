Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C267BABA5
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 22:53:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613123.953437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoVKf-0005Rh-Di; Thu, 05 Oct 2023 20:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613123.953437; Thu, 05 Oct 2023 20:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoVKf-0005P8-Ax; Thu, 05 Oct 2023 20:52:29 +0000
Received: by outflank-mailman (input) for mailman id 613123;
 Thu, 05 Oct 2023 20:52:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0G7T=FT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qoVKd-0005P2-TD
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 20:52:27 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16203d40-63c1-11ee-9b0d-b553b5be7939;
 Thu, 05 Oct 2023 22:52:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 5880AB826BB;
 Thu,  5 Oct 2023 20:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0A1C433C7;
 Thu,  5 Oct 2023 20:52:22 +0000 (UTC)
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
X-Inumbo-ID: 16203d40-63c1-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696539143;
	bh=9n3s0NZZpZTeGiyOiXFjR0ymqO/dZKYjdTrkqa0Y7N4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gx30C2jKzOuzORrLhRenTmLVzhF7U/b7GFWeodRsgJI/2i5K5iYXW1Dfu3Z5i82s2
	 Nh9p1GJJoy7dailGCBRcRxzpd6QQRYQc8i2qf9iW/e+h+q9vYHBjdyEL1gUIVsNtXv
	 kHnOXACOS7oUD1rw0vdQBVL+FaSiYFN/PdV3EYJkobnk8SyQPEDHdwRJ9L+1Vn82xF
	 ZNT2MMFMj0JuQ4d1Udh8HgqE/OY8tPuwlP1hx1aI9A21tirpPuKqOSlrnwmCtTfWHu
	 HyhLdoo55lcBXr/rooR62NaKFzeY4kjkCMEiBvJa4sV7yJLMP6dUJ1X8tc3c/KG/Wt
	 S6Z9R9PSKqZuA==
Date: Thu, 5 Oct 2023 13:52:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: Issue with shared information page on Xen/ARM 4.17
In-Reply-To: <ZR6A5LP1FKFAgJRv@MacBookPdeRoger>
Message-ID: <alpine.DEB.2.22.394.2310051352160.2348112@ubuntu-linux-20-04-desktop>
References: <ZRxpC7ukhiYvzz5m@mattapan.m5p.com> <ZR0erl_OSkNgIQjx@MacBookPdeRoger> <c0b67401-dfe5-475f-8640-b66ac32a80fb@xen.org> <ZR1gM19i6-vBaXh7@MacBookPdeRoger> <b00500ae-76b1-441c-8154-bcdd897734dc@xen.org> <ZR1rBP_49Y2V8VF6@MacBookPdeRoger>
 <fe94dcd2-4429-48df-8ebd-59563d43796a@xen.org> <ZR18dlMAbCwEOeH4@MacBookPdeRoger> <f8242725-7ee0-4fca-a608-d234f8f3b564@xen.org> <alpine.DEB.2.22.394.2310041509170.2348112@ubuntu-linux-20-04-desktop> <ZR6A5LP1FKFAgJRv@MacBookPdeRoger>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1133245002-1696538928=:2348112"
Content-ID: <alpine.DEB.2.22.394.2310051348570.2348112@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1133245002-1696538928=:2348112
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2310051348571.2348112@ubuntu-linux-20-04-desktop>

On Thu, 5 Oct 2023, Roger Pau Monné wrote:
> On Wed, Oct 04, 2023 at 03:52:54PM -0700, Stefano Stabellini wrote:
> > On Wed, 4 Oct 2023, Julien Grall wrote:
> > > > > If we want to handle such firmware, I think it would be better if we
> > > > > provide
> > > > > an hypercall that would return the GFN where it is currently mapped.
> > > > 
> > > > Sure, but such hypercall would be racy, as by the time the gfn is
> > > > returned the value could be stale.  Adding a replacing and non
> > > > replacing XENMEM_add_to_physmap variations would IMO be better.
> > > > 
> > > > Anyway, I don't maintain this, so it's up to you.
> > > 
> > > Bertrand/Stefano, any opinions?
> > 
> > I think we should fix EDK2 to unmap the shared info in all cases as
> > that's simpler and the best implementation. What's the value of keeping
> > the mapping around when the OS can't find it? Unless you have an idea on
> > how the OS could find the location of the existing EDK2 shared info
> > mapping.
> 
> Indeed, edk2 should unmap the page, and we should fix that.
> 
> > 
> > It is important not to have 2 different behaviors for the same hypercall
> > on ARM and x86, especially when the hypercall looks arch-neutral and an
> > operating system would reasonably expect to use it in common code.
> > Having different behaviors on ARM/x86 is more error prone than having a
> > less-than-ideal hypercall implementation.
> > 
> > I agree with Julien that the ARM behavior is the right behavior. Can we
> > change the x86 implementation to match ARM somehow?
> 
> I'm afraid I don't see how.  edk2 is supported on x86, and hence we
> cannot simply make a change to the hypervisor that would render all
> current versions of edk2 unusable.
> 
> > If we do, I guess we would end up breaking legacy EDK2?
> 
> Breaking plain edk2, as there's no version of edk2 that currently does
> the unmapping?
> 
> > Is really the only choice to change the ARM implementation to match the
> > x86 implementation?
> 
> Unless we want x86 and Arm to diverge in behavior.
> 
> I do think the arm behavior is more sane, but I don't think we can
> make that change on x86 and simply render all existing versions of
> edk2 unusable.

Right, but maybe we can come up with a deprecation period?

Especially considering that this is for domU firmware (not host
firmware), and domU firmware is often (not always, but often) provided
by Xen (Xen in the sense of xen.git and Xen packages). First we fix EDK2
upstream and we update the EDK2 build in xen.git. Then we give it a
couple of releases, then we change the x86 hypercall behavior?

In the meantime we could print a warning in Xen DEBUG builds when the
hypercall is called and there is one existing mapping?
--8323329-1133245002-1696538928=:2348112--

