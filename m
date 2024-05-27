Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112BE8D09CA
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 20:13:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730915.1136204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBepf-0002RS-2H; Mon, 27 May 2024 18:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730915.1136204; Mon, 27 May 2024 18:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBepe-0002Pm-Vk; Mon, 27 May 2024 18:12:26 +0000
Received: by outflank-mailman (input) for mailman id 730915;
 Mon, 27 May 2024 18:12:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MISB=M6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sBepd-0002Pg-Pw
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 18:12:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa393001-1c54-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 20:12:24 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5A20761B86;
 Mon, 27 May 2024 18:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B1D0C2BBFC;
 Mon, 27 May 2024 18:12:20 +0000 (UTC)
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
X-Inumbo-ID: aa393001-1c54-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716833542;
	bh=fBmuH4cXhZojeW2O6Rp+qJH/rY/Fl3e4iWLDvnMo+Lw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=P51+ghXmSHFgkDI6AiSxJOaorD3l79ZtVBHyW/fLO8yc9d/A8n07E8DKeK4zu1/bf
	 1QdQStHjMPigr6hNsZVcvHkY6DeVAwJ/ZshWx1/WykXEwEcLCkKBrwgSrzUqfy34BC
	 CykfTG+ufFNeG4v6+24avoQyOwuuZFGfaIAYFQnDtVMod4DmaBmRPl315HYhLUCM09
	 hsz0sa4S3T00LScV5zvJknEGAEULHxzPgc4WvAQ9vgbqzfV+uD4yMTU/l6seVF8Bak
	 b+4F37TLQGRlVzwj6YYWstlLEtO3l9oP5YLxuyytO2456FC4CMZ3H/C3kTPHofoS19
	 cj13eqhR6iWLA==
Date: Mon, 27 May 2024 11:12:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Alec Kwapis <alec.kwapis@medtronic.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 2/4] xen/arm: Alloc XenStore page for Dom0less DomUs
 from hypervisor
In-Reply-To: <480ccee9-a50a-4b30-92c4-3f39e4202bca@suse.com>
Message-ID: <alpine.DEB.2.22.394.2405271111220.2557291@ubuntu-linux-20-04-desktop>
References: <20240517032156.1490515-1-xin.wang2@amd.com> <20240517032156.1490515-3-xin.wang2@amd.com> <cf0a096a-0fe8-4d91-a064-910bd6c43951@xen.org> <d3aca96b-2b6b-4bb8-99bf-7c0ede4c94fe@suse.com> <alpine.DEB.2.22.394.2405241614370.2557291@ubuntu-linux-20-04-desktop>
 <480ccee9-a50a-4b30-92c4-3f39e4202bca@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-99592716-1716833542=:2557291"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-99592716-1716833542=:2557291
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 27 May 2024, Jürgen Groß wrote:
> On 25.05.24 01:19, Stefano Stabellini wrote:
> > On Fri, 24 May 2024, Jürgen Groß wrote:
> > > On 24.05.24 15:58, Julien Grall wrote:
> > > > Hi Henry,
> > > > 
> > > > + Juergen as the Xenstore maintainers. I'd like his opinion on the
> > > > approach.
> > > > The documentation of the new logic is in:
> > > > 
> > > > https://lore.kernel.org/xen-devel/20240517032156.1490515-5-xin.wang2@amd.com/
> > > > 
> > > > FWIW I am happy in principle with the logic (this is what we discussed
> > > > on
> > > > the call last week). Some comments below.
> > > 
> > > I'm not against this logic, but I'm wondering why it needs to be so
> > > complicated.
> > 
> > Actually the reason I like it is that in my view, this is the simplest
> > approach. You allocate a domain, you also allocate the xenstore page
> > together with it. Initially the xenstore connection has an
> > "uninitialized" state, as it should be. That's it. At some point, when
> > xenstored is ready, the state changes to CONNECTED.
> > 
> > 
> > > Can't the domU itself allocate the Xenstore page from its RAM pages,
> > > write the PFN into the Xenstore grant tab entry, and then make it
> > > public via setting HVM_PARAM_STORE_PFN?
> > 
> > This is not simpler in my view
> 
> Okay, fine with me. I had the impression that violating the 1:1 mapping
> of the domain would add complexity, but if you are fine with that I don't
> mind your approach.

Yes, that's fine. Thanks!
--8323329-99592716-1716833542=:2557291--

