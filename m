Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C206FA53E83
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 00:32:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902954.1310883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpyEL-0005ti-9s; Wed, 05 Mar 2025 23:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902954.1310883; Wed, 05 Mar 2025 23:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpyEL-0005rF-6R; Wed, 05 Mar 2025 23:32:49 +0000
Received: by outflank-mailman (input) for mailman id 902954;
 Wed, 05 Mar 2025 23:32:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gbs/=VY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tpyEJ-0005qe-JB
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 23:32:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 243929cd-fa1a-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 00:32:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 247C85C6C56;
 Wed,  5 Mar 2025 23:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D163C4CED1;
 Wed,  5 Mar 2025 23:32:43 +0000 (UTC)
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
X-Inumbo-ID: 243929cd-fa1a-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741217564;
	bh=rb8BW7RKmfhRYdPI8/3emOzhu+JhecFvm6g4keHCiVk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CdQnB9O0lFyNklC3uhXglKMu/bRdtEpH9sBN2iPT6wvuI8/ur9FcLbXCsB9Ai9uCG
	 6AnmrVDo8Exknl5R9mO4Ldi0Opc/pChPfB0uCuL/2Gf1dTTSGMcMAlEQ0WU3583q6b
	 7SyKp1oBb6yz531JVBJQReeo7iMwxs5xqSTrmZWNU5Frd/YZvwKyodfj0Nchi1f6n/
	 M/atZaXFhOdi/aMJE8LAV8psFkDzA1FQuVqYmUt9h0JHbLY2MIPwWgCfWvfoeVDVNP
	 8uRfJaSyfNG2KAX+AwbrjP+KaZ7EULL9vZH/EJC+j930dlSCw7nBcw6tXfRZZE55iY
	 dvi+89BP1+JRg==
Date: Wed, 5 Mar 2025 15:32:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [PATCH v8 0/9] remove libxenctrl usage from xenstored
In-Reply-To: <9c8f50d4-9139-4541-8acb-ff407b61ef97@suse.com>
Message-ID: <alpine.DEB.2.22.394.2503051531380.1303386@ubuntu-linux-20-04-desktop>
References: <20250204113407.16839-1-jgross@suse.com> <6e63a858-9554-440b-92f1-55dc34256e0b@suse.com> <9c8f50d4-9139-4541-8acb-ff407b61ef97@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-502919770-1741217565=:1303386"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-502919770-1741217565=:1303386
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 5 Mar 2025, Juergen Gross wrote:
> On 25.02.25 12:10, Juergen Gross wrote:
> > Ping? Especially ...
> > 
> > On 04.02.25 12:33, Juergen Gross wrote:
> > > Xenstored is using libxenctrl for only one purpose: to get information
> > > about state of domains.
> > > 
> > > This patch series is removing that dependency by introducing a new
> > > stable interface which can be used by xenstored instead.
> > > 
> > > There was a RFC series sent out 3 years ago, which I have taken as a
> > > base and by addressing all comments from back then.
> > > 
> > > The main differences since that RFC series are:
> > > 
> > > - Instead of introducing an new main hypercall for a stable management
> > >    interface I have just added a new domctl sub-op, as requested in 2021.
> > > 
> > > - I have added a new library libxenmanage for easy use of the new
> > >    stable hypervisor interface. Main motivation for adding the library
> > >    was the recent attempt to decouple oxenstored from the Xen git tree.
> > >    By using the new library, oxenstored could benefit in the same way as
> > >    xenstored from the new interface: it would be possible to rely on
> > >    stable libraries only.
> > > 
> > > - Mini-OS has gained some more config options recently, so it was rather
> > >    easy to make xenstore[pvh]-stubdom independent from libxenctrl, too.
> > > 
> > > Please note that the last 4 patches can be committed only after the
> > > related Mini-OS patch "config: add support for libxenmanage" has gone in
> > > AND the Mini-OS commit-id has been updated in Config.mk accordingly! The
> > > Mini-OS patch has been Acked already, so it can go in as soon as patch
> > > 5 of this series (the one introducing libxenmanage) has been committed.
> > > 
> > > As patches 1 and 2 change current behavior, Jan didn't want to give his
> > > Ack (he didn't reject the patch either). So I'm asking other "Rest"
> > > maintainers to look at those patches specifically.
> > 
> > ... patches 1 and 2 could need an additional opinion.
> 
> And another ping.
> 
> One of Andrew, Stefano, Julien, Roger, Anthony, Mical: Please have a look.
> 
> The related discussion between Jan and me can be found here (patches 2 and 3):
> 
> https://lore.kernel.org/xen-devel/20250107101711.5980-1-jgross@suse.com/

I didn't do an in-details review but based on Jan's comments and your
replies, I think they are an improvement. If someone else wants to do a
proper review, they would be welcome.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-502919770-1741217565=:1303386--

