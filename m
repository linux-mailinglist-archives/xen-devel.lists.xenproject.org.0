Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF07652593A
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 03:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328122.551047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npJnx-000809-6h; Fri, 13 May 2022 01:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328122.551047; Fri, 13 May 2022 01:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npJnx-0007xv-2v; Fri, 13 May 2022 01:09:17 +0000
Received: by outflank-mailman (input) for mailman id 328122;
 Fri, 13 May 2022 01:09:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npJnv-0007xl-JS
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 01:09:15 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4db30613-d259-11ec-8fc4-03012f2f19d4;
 Fri, 13 May 2022 03:09:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5C480B82C27;
 Fri, 13 May 2022 01:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BBBC385B8;
 Fri, 13 May 2022 01:09:11 +0000 (UTC)
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
X-Inumbo-ID: 4db30613-d259-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652404152;
	bh=+O2eOVFk4fd6Wn2HurEWZ5sH1IZOh+m/T6lpcaNucBk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TmeYWuo38ecuCyD+Truh4k3iCsx/Qx0WJNj5MuQ9m18YEcYUfW3+DtT1tnrdUdas2
	 CN7IKlw9Zxa6AfS9a9iqR68pn6NEpwc9W9eF3sNL7x+ap0F3QlBuBtahevmbB1sD9O
	 fC+cZ+vfc2G1MoI8EBkYoEJl0DbLSMaMVQHEoCHE2KebIvRd0yl9IX3VAirxWdhUzJ
	 kYNol3id5bpuoFktE9Y+sE0/z/Lwq/TA+Zeb3JAkkwj40yN4iIgj3aKlKqmG8XECrJ
	 lknfGocrbTtfO03AiKjVF8MYnuut8L8p1Vl3gmu11mJzujfORl9gjpAT+5BAnB/mPi
	 57SckEuYo1X1Q==
Date: Thu, 12 May 2022 18:09:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, jgross@suse.com, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v6 6/7] tools: add example application to initialize
 dom0less PV drivers
In-Reply-To: <fb9aefed-ef4b-c26e-9ff0-1eb59e7d215c@xen.org>
Message-ID: <alpine.DEB.2.22.394.2205121806210.3842@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop> <20220505001656.395419-6-sstabellini@kernel.org> <fb9aefed-ef4b-c26e-9ff0-1eb59e7d215c@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 May 2022, Julien Grall wrote:
> > +    rc = xs_introduce_domain(xsh, info->domid,
> > +            (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET,
> > +            xenstore_evtchn);
> 
> I might be missing something here. In an ealier version, I pointed out that
> xs_introduce_domain() would fail in the case the dom0less domain doesn't have
> "xen,enhanced".
> 
> AFAICT, you agreed that the (part?) of initialization should be skipped. But I
> don't see the change in the code. Regarding the placement, we could either
> fully skip init_domain() or just xs_introduce_domain(). The latter might be
> better so all the domains are listed using xenstore-ls.
> 
> So something like below should work:
> 
> if ( xenstore_evtchn )
> {
>     rc = xs_introduce...();
>     ...
> }

Yes, good point. xenstore_evtchn could be zero validly (first evtchn is
zero), so instead I'll check on xenstore_pfn to be zero (xenstore_pfn is
0 for non-enhanced domUs.)

