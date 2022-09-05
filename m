Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 317305ADB52
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 00:17:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399198.640292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVKPI-0006rB-A0; Mon, 05 Sep 2022 22:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399198.640292; Mon, 05 Sep 2022 22:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVKPI-0006oq-6b; Mon, 05 Sep 2022 22:17:28 +0000
Received: by outflank-mailman (input) for mailman id 399198;
 Mon, 05 Sep 2022 22:17:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+J0v=ZI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oVKPH-0006nC-1v
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 22:17:27 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85316080-2d68-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 00:17:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B7BFFB81118;
 Mon,  5 Sep 2022 22:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25FF2C433D6;
 Mon,  5 Sep 2022 22:17:23 +0000 (UTC)
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
X-Inumbo-ID: 85316080-2d68-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662416243;
	bh=BDxNCKqD202DtOlDDp0107b8qH36zNff1JZExZDyU4Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EOLXwLX87BKRwz85nHVPuPx2FI3ka/aSyKU7U1uWJhBYnuNOVu61LaXOKRDJYZRTE
	 51Sxg3pM0V0x4ERvBUWGuttJbfIGbq7x1kYewet1RxrrFLKiBMf/aWWu5X4ARx19YF
	 6eji5Ceh6aykBKY+fSbbyPo9HgNxh/j6GTczNtZndwrZ2/kcbpNkuz/g/fWEB1gfj9
	 +y636yLfAHbP0VLz0+HxPfGM6GCGq6QT+UfEBa5XOjAlmhjlx5M6ntFCuK8dxFMJ1W
	 bTpn9hTAR+XYDCPWgT4WPzooQauRI3egfYQx7GxCz+kbOfo5BQCL6d0SuNMqzzZQvP
	 CTZX6pzcxE7Qw==
Date: Mon, 5 Sep 2022 15:17:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Rahul Singh <Rahul.Singh@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Zhou Wang <wangzhou1@hisilicon.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 03/10] xen/arm: smmuv3: Ensure queue is read after
 updating prod pointer
In-Reply-To: <8ae636bb-9508-9477-af0e-d30440782dbf@xen.org>
Message-ID: <alpine.DEB.2.22.394.2209051517130.3931@ubuntu-linux-20-04-desktop>
References: <cover.1662123432.git.rahul.singh@arm.com> <59c24309e2d8494edf414904fe9725b4e7387098.1662123432.git.rahul.singh@arm.com> <alpine.DEB.2.22.394.2209021613440.3931@ubuntu-linux-20-04-desktop> <FB788985-2DE3-406D-9282-56B8C9E4B1C1@arm.com>
 <5f0bf815-3236-2262-62b4-cd3d99bb60ff@xen.org> <71FC45C0-2F78-4CB7-AAB7-5B2C357F2C74@arm.com> <8ae636bb-9508-9477-af0e-d30440782dbf@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1967879923-1662416243=:3931"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1967879923-1662416243=:3931
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 5 Sep 2022, Julien Grall wrote:
> On 05/09/2022 11:23, Bertrand Marquis wrote:
> > > On 5 Sep 2022, at 10:31, Julien Grall <julien@xen.org> wrote:
> > > On 05/09/2022 10:18, Rahul Singh wrote:
> > > > > On 3 Sep 2022, at 12:21 am, Stefano Stabellini
> > > > > <sstabellini@kernel.org> wrote:
> > > > > 
> > > > > On Fri, 2 Sep 2022, Rahul Singh wrote:
> > > > > > From: Zhou Wang <wangzhou1@hisilicon.com>
> > > > > > 
> > > > > > Backport Linux commit a76a37777f2c. This is the clean backport
> > > > > > without
> > > > > > any changes.
> > > > > > 
> > > > > > Reading the 'prod' MMIO register in order to determine whether or
> > > > > > not there is valid data beyond 'cons' for a given queue does not
> > > > > > provide sufficient dependency ordering, as the resulting access is
> > > > > > address dependent only on 'cons' and can therefore be speculated
> > > > > > ahead of time, potentially allowing stale data to be read by the
> > > > > > CPU.
> > > > > > 
> > > > > > Use readl() instead of readl_relaxed() when updating the shadow copy
> > > > > > of the 'prod' pointer, so that all speculated memory reads from the
> > > > > > corresponding queue can occur only from valid slots.
> > > > > > 
> > > > > > Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
> > > > > > Link:
> > > > > > https://lore.kernel.org/r/1601281922-117296-1-git-send-email-wangzhou1@hisilicon.com
> > > > > > [will: Use readl() instead of explicit barrier. Update 'cons' side
> > > > > > to match.]
> > > > > > Signed-off-by: Will Deacon <will@kernel.org>
> > > > > > Origin:
> > > > > > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > > > > > a76a37777f2c
> > > > > > Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> > > > > > ---
> > > > > > Changes in v2:
> > > > > > - fix commit msg
> > > > > > - add _iomb changes also from the origin patch
> > > > > > ---
> > > > > > xen/arch/arm/include/asm/system.h     |  1 +
> > > > > > xen/drivers/passthrough/arm/smmu-v3.c | 11 +++++++++--
> > > > > > 2 files changed, 10 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/xen/arch/arm/include/asm/system.h
> > > > > > b/xen/arch/arm/include/asm/system.h
> > > > > > index 65d5c8e423..fe27cf8c5e 100644
> > > > > > --- a/xen/arch/arm/include/asm/system.h
> > > > > > +++ b/xen/arch/arm/include/asm/system.h
> > > > > > @@ -29,6 +29,7 @@
> > > > > > #endif
> > > > > > 
> > > > > > #define smp_wmb()       dmb(ishst)
> > > > > > +#define __iomb()        dmb(osh)
> > > > > 
> > > > > We don't have any other #define starting with __ in system.h.
> > > > > I wonder if we should call this macro differently or simply iomb().
> > > >   I think either iomb() or dma_mb() will be the right name.
> > > > Please let me know your view on this.
> > > 
> > > It is not 100% clear why Linux went with __iomb() rather than iomb(). But
> > > I would prefer to keep the __* version to match Linux.
> > > 
> > > If the others really want to drop the __. Then I think it should be name
> > > iomb(). The rationale is while __iomb() is an alias to dma_mb(), the
> > > __iormb() behaves differently compare to dma_mb() (I haven't into details
> > > why).
> > > 
> > > So if it was a read barrier, we would likely want to use the iormb()
> > > semantic. This will keep the terminology consistent with Linux (even if we
> > > remove the __).
> > 
> > We need the __iomb as “linux compatibility” in fact so I would suggest for
> > now to only introduce it at the beginning of smmu-v3.c with other linux
> > compatibility stuff to prevent adding this to Xen overall.
> 
> I would be fine with that.

+1
--8323329-1967879923-1662416243=:3931--

