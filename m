Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FF3ACBD8C
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 00:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003884.1383507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uME62-0006Gm-Sj; Mon, 02 Jun 2025 22:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003884.1383507; Mon, 02 Jun 2025 22:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uME62-0006FL-Pq; Mon, 02 Jun 2025 22:57:34 +0000
Received: by outflank-mailman (input) for mailman id 1003884;
 Mon, 02 Jun 2025 22:57:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rm0f=YR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uME60-0006FF-Sg
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 22:57:32 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f67bf1f4-4004-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 00:57:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 84EDE4A6E2;
 Mon,  2 Jun 2025 22:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA49C4CEEB;
 Mon,  2 Jun 2025 22:57:29 +0000 (UTC)
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
X-Inumbo-ID: f67bf1f4-4004-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748905050;
	bh=7pIyvHjDLO6WWHS14Re+izDl0pZBBVpDlviSo3FY9KM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mAhbgm33ZNRD99nSAg6WXqawWsQvulQydnqWG3C0cvI7dMgI1f+ETcf3NiD4LVaP5
	 4S8M3kB2Iq0F7r7sO5PBqWXEowIpvgpeBVB52NPZHm6qqb2wKo+8blGbMzO6KwIpcx
	 sjXk1tXR+7O3yy/3U7uiT7gTyxekEPtinPznRWwV35uC9TOChmsfGgHsKpg5X4Lu2v
	 +JKGgCJfyMk9/J5YWlxwRf0ETZzqZGubO41he5NSSpc4LdY5jI1aefxhC6Yusnp3oQ
	 KcYNrQZxlPgax3D9JZtXLYEHF4oOtZ/TeF0855XXclDiqhw8DE6sTpFOWogY+DzstR
	 iYoliSOyPISVg==
Date: Mon, 2 Jun 2025 15:57:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
    xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    andrew.cooper3@citrix.com, edgar.iglesias@amd.com
Subject: Re: [PATCH v3 2/5] xen/arm: dom0less: Add trap-unmapped-accesses
In-Reply-To: <f62020d9-1cd5-4afa-ace3-98902526e58b@xen.org>
Message-ID: <alpine.DEB.2.22.394.2506021555540.1147082@ubuntu-linux-20-04-desktop>
References: <20250530134559.1434255-1-edgar.iglesias@gmail.com> <20250530134559.1434255-3-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2506021535490.1147082@ubuntu-linux-20-04-desktop> <f62020d9-1cd5-4afa-ace3-98902526e58b@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Jun 2025, Julien Grall wrote:
> Hi,
> 
> On 02/06/2025 23:36, Stefano Stabellini wrote:
> > On Fri, 30 May 2025, Edgar E. Iglesias wrote:
> > > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > > 
> > > Add the trap-unmapped-accesses per-domain fdt property.
> > > 
> > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > > ---
> > >   docs/misc/arm/device-tree/booting.txt | 10 ++++++++++
> > >   xen/arch/arm/dom0less-build.c         |  9 ++++++++-
> > >   2 files changed, 18 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/docs/misc/arm/device-tree/booting.txt
> > > b/docs/misc/arm/device-tree/booting.txt
> > > index 59fa96a82e..9add6440de 100644
> > > --- a/docs/misc/arm/device-tree/booting.txt
> > > +++ b/docs/misc/arm/device-tree/booting.txt
> > > @@ -225,6 +225,16 @@ with the following properties:
> > >       option is provided with a non zero value, but the platform doesn't
> > > support
> > >       SVE.
> > >   +- trap-unmapped-accesses
> > > +
> > > +    Optional. An integer that configures handling of accesses to unmapped
> > > +    address ranges.
> > > +    If set to 0, guest accesses will read all bits as ones, e.g
> > > 0xFFFFFFFF
> > > +    for a 32bit access and writes will be ignored.
> > > +    If set to 1, guest accesses will trap.
> > > +
> > > +    This option is only implemented for ARM where the default is 1.
> > 
> > Please expand it to: "This option is only implemented for ARM where the
> > default is 1 when trap-unmapped-accesses is absent."
> 
> I am confused. The document is part of "docs/misc/arm" and some options like
> "sve" are Arm specific. We don't mention this is Arm only because the
> documention is Arm specific.
> 
> I know that RISC-V is starting to share the bindings. So really (part of) the
> documentation should be moved to common. Until then, I think it is misleading
> to add "is only implemented for ARM".

Yes you are right. Maybe Oleksii or Alejandro can fix this, moving this
file to common.

For this smaller patch series, I would remove the "is only implemented
for ARM".


> BTW, the spelling for should be "Arm" ;).

:-)

