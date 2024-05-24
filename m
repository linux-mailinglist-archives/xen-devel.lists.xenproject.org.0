Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5252B8CEC90
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 01:02:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730001.1135363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdvU-0000bi-J2; Fri, 24 May 2024 23:02:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730001.1135363; Fri, 24 May 2024 23:02:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdvU-0000a0-G2; Fri, 24 May 2024 23:02:16 +0000
Received: by outflank-mailman (input) for mailman id 730001;
 Fri, 24 May 2024 23:02:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6bJ=M3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sAdvS-0000Zu-Uh
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 23:02:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a747bfc9-1a21-11ef-b4bb-af5377834399;
 Sat, 25 May 2024 01:02:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1AAB2632A9;
 Fri, 24 May 2024 23:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 005FDC2BBFC;
 Fri, 24 May 2024 23:02:08 +0000 (UTC)
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
X-Inumbo-ID: a747bfc9-1a21-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716591730;
	bh=ry/BE4GGdY0GMaJHtALiuLIzm7exxh0X0tdD8b8xN5E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JkPxrEmpEh0ILdCde0vkTJZuoyrurKUZCXKCAPmsZBLayYPXhfCNjLZ+XODgxrBMD
	 Bf/eib3fBcj6O20JELw/x6JXxtVIC3l4XfHzpMty3lvAOb+BreHxTtsVoPXVbvSm6G
	 gxo+5truNZVmbrQxpjVc9J1rAb3PrGAk+NKjZZ8ct5oCNPBr/QtTPox7oFSd/nbcLl
	 D8IzLXErKxOvTsdbAHUHanPsuCHNMQ6rK7K9pm89rT3AaEugiEubYsutYgKSCuO1Qe
	 UgchuvaLLJmBF+VxqBxLp57TDtg6zRtBqYT0HZWzI5NUg/18EMV1jKQVnoGrIhL6wX
	 5eA55bmgA7zCQ==
Date: Fri, 24 May 2024 16:02:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Alec Kwapis <alec.kwapis@medtronic.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 2/4] xen/arm: Alloc XenStore page for Dom0less DomUs
 from hypervisor
In-Reply-To: <0a153f00-04bf-4c98-ae98-c904ee52af13@xen.org>
Message-ID: <alpine.DEB.2.22.394.2405241559480.2557291@ubuntu-linux-20-04-desktop>
References: <20240517032156.1490515-1-xin.wang2@amd.com> <20240517032156.1490515-3-xin.wang2@amd.com> <cf0a096a-0fe8-4d91-a064-910bd6c43951@xen.org> <alpine.DEB.2.22.394.2405241536510.2557291@ubuntu-linux-20-04-desktop>
 <0a153f00-04bf-4c98-ae98-c904ee52af13@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 May 2024, Julien Grall wrote:
> Hi Stefano,
> 
> On 24/05/2024 23:49, Stefano Stabellini wrote:
> > On Fri, 24 May 2024, Julien Grall wrote:
> > > Hi Henry,
> > > 
> > > + Juergen as the Xenstore maintainers. I'd like his opinion on the
> > > approach.
> > > The documentation of the new logic is in:
> > > 
> > > https://lore.kernel.org/xen-devel/20240517032156.1490515-5-xin.wang2@amd.com/
> > > 
> > > FWIW I am happy in principle with the logic (this is what we discussed on
> > > the
> > > call last week). Some comments below.
> > > 
> > > On 17/05/2024 04:21, Henry Wang wrote:
> > > > There are use cases (for example using the PV driver) in Dom0less
> > > > setup that require Dom0less DomUs start immediately with Dom0, but
> > > > initialize XenStore later after Dom0's successful boot and call to
> > > > the init-dom0less application.
> > > > 
> > > > An error message can seen from the init-dom0less application on
> > > > 1:1 direct-mapped domains:
> > > > ```
> > > > Allocating magic pages
> > > > memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
> > > > Error on alloc magic pages
> > > > ```
> > > > 
> > > > The "magic page" is a terminology used in the toolstack as reserved
> > > > pages for the VM to have access to virtual platform capabilities.
> > > > Currently the magic pages for Dom0less DomUs are populated by the
> > > > init-dom0less app through populate_physmap(), and populate_physmap()
> > > > automatically assumes gfn == mfn for 1:1 direct mapped domains. This
> > > > cannot be true for the magic pages that are allocated later from the
> > > > init-dom0less application executed in Dom0. For domain using statically
> > > > allocated memory but not 1:1 direct-mapped, similar error "failed to
> > > > retrieve a reserved page" can be seen as the reserved memory list is
> > > > empty at that time.
> > > > 
> > > > Since for init-dom0less, the magic page region is only for XenStore.
> > > > To solve above issue, this commit allocates the XenStore page for
> > > > Dom0less DomUs at the domain construction time. The PFN will be
> > > > noted and communicated to the init-dom0less application executed
> > > > from Dom0. To keep the XenStore late init protocol, set the connection
> > > > status to XENSTORE_RECONNECT.
> > > 
> > > So this commit is allocating the page, but it will not be used by
> > > init-dom0less until the next patch. But Linux could use it. So would this
> > > break bisection? If so, then I think patch #3 needs to be folded in this
> > > patch.
> > 
> > I think that's fine, 
> 
> I am not sure what you mean. Are you saying it is ok to break bisection?

No, I meant to say that it is fine to merge on commit.


> > I'll leave that with you on commit.
> 
> I am sorry but I don't think the folding should be done on commit. It should
> happen before hand because the commit message will also need to be updated.

Understood. I'll send one more version with the patches merged (ideally
with an ack?)

