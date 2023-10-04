Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0507B9866
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 00:53:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612786.952877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoAjm-0002X4-Gb; Wed, 04 Oct 2023 22:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612786.952877; Wed, 04 Oct 2023 22:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoAjm-0002UI-DG; Wed, 04 Oct 2023 22:53:02 +0000
Received: by outflank-mailman (input) for mailman id 612786;
 Wed, 04 Oct 2023 22:53:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XhzZ=FS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qoAjl-0002UC-42
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 22:53:01 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c38d33b8-6308-11ee-9b0d-b553b5be7939;
 Thu, 05 Oct 2023 00:52:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 0DE1AB821C8;
 Wed,  4 Oct 2023 22:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF00EC433C8;
 Wed,  4 Oct 2023 22:52:55 +0000 (UTC)
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
X-Inumbo-ID: c38d33b8-6308-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696459977;
	bh=5lIJM0akCeyUY2N61Rnr0eprSgKxj/Xi5swvZIwZ1/0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uIt9XsjzKV7jkmXBDnkZKrFSyyXEAhqnp7wDfK4s2HbR3WA+y/ew82R5XjjZtv88f
	 COtODi87tyjf2XPaLtjsXTYcbkZQ7PJZvbg20jD3ktN+WZT3gwtzA/jX5iM4f5Z34o
	 pFsyVZAalpKy+1gkQPVOebZM66KA717gqpsOz5C2HdAKrGBgOMCq5dEFusduNqPKQ6
	 4ov4sjv4I/E8woriidMlyeqakhtZCtqGvvgr30xayHq462DENFbqJ+MTrllJ6MI+Jc
	 CvsBX5qn53XI4WyEYMnj1rIXGgqWWCi4zkox/9v2rWmSIE4cMBWzvKNWBJ3IPbsQU7
	 qsFraoTvm5nkg==
Date: Wed, 4 Oct 2023 15:52:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: Issue with shared information page on Xen/ARM 4.17
In-Reply-To: <f8242725-7ee0-4fca-a608-d234f8f3b564@xen.org>
Message-ID: <alpine.DEB.2.22.394.2310041509170.2348112@ubuntu-linux-20-04-desktop>
References: <ZRY7Ls3p6M6pakMq@mattapan.m5p.com> <ZRvQNKyYpLDVTs0i@MacBookPdeRoger> <ZRxpC7ukhiYvzz5m@mattapan.m5p.com> <ZR0erl_OSkNgIQjx@MacBookPdeRoger> <c0b67401-dfe5-475f-8640-b66ac32a80fb@xen.org> <ZR1gM19i6-vBaXh7@MacBookPdeRoger>
 <b00500ae-76b1-441c-8154-bcdd897734dc@xen.org> <ZR1rBP_49Y2V8VF6@MacBookPdeRoger> <fe94dcd2-4429-48df-8ebd-59563d43796a@xen.org> <ZR18dlMAbCwEOeH4@MacBookPdeRoger> <f8242725-7ee0-4fca-a608-d234f8f3b564@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Oct 2023, Julien Grall wrote:
> > > This is not very different here. For Arm we decided to not follow a
> > > behavior
> > > that I consider incorrect and potentially more harmful than trying to
> > > support bootloader not removing the shared page.
> > 
> > I think this is not very friendly to users, specially if edk2 wasn't
> > checked.
> 
> This was forgotten because it is not yet common to use EDK2 on Xen on Arm (the
> proof is it took one year to find the obvious bug). I agree this is not user
> friendly, but it is impossible to check all the single projects. I will
> usually only look at the one that I know are used on Arm and/or someone remind
> me on the ML.

At AMD/Xilinx we don't have EDK2 on any ARM board. Unless I go out of my
way to test it on purpose I wouldn't see it.


> > I understand the situation is different on Arm vs x86, so if
> > edk2 is not supported on arm I guess it doesn't matter much whether
> > it's broken.  It would be a much worse issue on x86 where edk2 is
> > supported.
> 
> AFAIK, we have CI for x86 on EDK2 but we don't on Arm.

I think we should have a gitlab-ci job testing EDK2 on ARM using QEMU
and I would certainly welcome it if someone contributed it.


> > > If we want to handle such firmware, I think it would be better if we
> > > provide
> > > an hypercall that would return the GFN where it is currently mapped.
> > 
> > Sure, but such hypercall would be racy, as by the time the gfn is
> > returned the value could be stale.  Adding a replacing and non
> > replacing XENMEM_add_to_physmap variations would IMO be better.
> > 
> > Anyway, I don't maintain this, so it's up to you.
> 
> Bertrand/Stefano, any opinions?

I think we should fix EDK2 to unmap the shared info in all cases as
that's simpler and the best implementation. What's the value of keeping
the mapping around when the OS can't find it? Unless you have an idea on
how the OS could find the location of the existing EDK2 shared info
mapping.


It is important not to have 2 different behaviors for the same hypercall
on ARM and x86, especially when the hypercall looks arch-neutral and an
operating system would reasonably expect to use it in common code.
Having different behaviors on ARM/x86 is more error prone than having a
less-than-ideal hypercall implementation.

I agree with Julien that the ARM behavior is the right behavior. Can we
change the x86 implementation to match ARM somehow?

If we do, I guess we would end up breaking legacy EDK2?

Is really the only choice to change the ARM implementation to match the
x86 implementation?

