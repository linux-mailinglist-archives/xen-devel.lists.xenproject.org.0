Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F7F75D7DF
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 01:24:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567745.887208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMzTz-0000fY-HU; Fri, 21 Jul 2023 23:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567745.887208; Fri, 21 Jul 2023 23:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMzTz-0000dP-Eq; Fri, 21 Jul 2023 23:24:23 +0000
Received: by outflank-mailman (input) for mailman id 567745;
 Fri, 21 Jul 2023 23:24:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzSz=DH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMzTx-0000dJ-A7
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 23:24:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7162097-281d-11ee-b23a-6b7b168915f2;
 Sat, 22 Jul 2023 01:24:19 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 382E461DA1;
 Fri, 21 Jul 2023 23:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC073C433C8;
 Fri, 21 Jul 2023 23:24:15 +0000 (UTC)
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
X-Inumbo-ID: b7162097-281d-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689981857;
	bh=prLw98o3vJP9lHSr+Nzaxe/clMP848JoQo1u+ZWOpIE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ox7XTg3FHZoVWenWtZ4UkMJjk59DQS5PekNYHa+bEcHZ/2kbZYYHqeOF3y4jgfLdB
	 Z+nttSnVJc2i08WHAXYswPEcw8kX6PhUOK+LGMNZpGZqjg8uQJpdfKRjZ/56k5U9xm
	 JaMr30lmA0M1AAFSa6XAh4zMl5ebvsXTtPX7XrArPCNY9g9bJFLbItlX+JdotpQmfB
	 u6mgS4Y22t3+O71EZbScglsGwfj/MFxPrUeeE6DzFqDPh+KVtyqEboDwm8yuRn/Ws7
	 MVesZy5/nF8Ky1AdnLcqufW5VF3RvstnsYMXztKUhBCZ/K9SVHo82DMXaEtUy7Wfa+
	 bMVaL2k2GiWgw==
Date: Fri, 21 Jul 2023 16:24:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christopher Clark <christopher.w.clark@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Luca Fancellu <luca.fancellu@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Rich Persaud <persaur@gmail.com>
Subject: Re: [PATCH 01/10] x86 setup: move x86 boot module counting into a
 new boot_info struct
In-Reply-To: <CACMJ4GZ5-Mg7Tg_H4mCj6EUUbwhhjZYid2V==c71o1fa5VPgOQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2307211616260.3118466@ubuntu-linux-20-04-desktop>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com> <20230701071835.41599-2-christopher.w.clark@gmail.com> <alpine.DEB.2.22.394.2307081124250.761183@ubuntu-linux-20-04-desktop>
 <CACMJ4GZ5-Mg7Tg_H4mCj6EUUbwhhjZYid2V==c71o1fa5VPgOQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

(You might want to check your email settings because it looks like you
sent an html email)

On Thu, 20 Jul 2023, Christopher Clark wrote:
>       > +struct boot_info {
> 
>       This is what we call struct bootmodules on ARM right? Would it help if
>       we used the same name?
> 
>       I am not asking to make the ARM code common because I think that would
>       probably be a lot more work.

This comment was wrong


> It becomes clearer to see by the end of the full hyperlaunch v1 series with the domain builder implemented, but it is also evident by the
> end of this series: the core/common boot info for Xen is more than just a set of bootmodules. This first patch is part of adding
> functionality to common incrementally, as a starting point, and reducing this boot info to just a bootmodules structure is going to be
> limiting it in this context.

After having read the whole series, it is clear that you made such a
fantastic progress toward unifying all the interfaces, both ARM and x86.
You managed to introduce interfaces so similar to the existing ARM
interfaces, that they are almost the same already. This is way better
than I expected when I wrote that comment to the first patch.

I think we should go the extra mile and move the ARM interfaces to
common, and make any changes needed by x86 there in common and
reflecting the changes back to ARM.

This will also allow us to move more dom0less init code from ARM to
common with fewer changes later on. 

