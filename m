Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF4F526BA5
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 22:36:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328744.551857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npc1M-0007Wf-T5; Fri, 13 May 2022 20:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328744.551857; Fri, 13 May 2022 20:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npc1M-0007Uq-PO; Fri, 13 May 2022 20:36:20 +0000
Received: by outflank-mailman (input) for mailman id 328744;
 Fri, 13 May 2022 20:36:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npc1L-0007Uj-3F
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 20:36:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55da46e7-d2fc-11ec-aa76-f101dd46aeb6;
 Fri, 13 May 2022 22:36:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BAE1F622E3;
 Fri, 13 May 2022 20:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3431C34113;
 Fri, 13 May 2022 20:36:13 +0000 (UTC)
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
X-Inumbo-ID: 55da46e7-d2fc-11ec-aa76-f101dd46aeb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652474174;
	bh=w4A332u3lgN6DwrS8dVt5IAs1YSdOMUooN/y4WSioiQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p1eyJTJGCl60oH+hDVAVMc+BUHkyuXt3SlMYKAYgmxwJZ68C1o2hVMuIDetHQN3MB
	 zwkLQI7QLk0CUsFx5mMZgVi/tRzIm2+hQV52tUeNgYNp7e+Ax//ULeLin3saFiHGYn
	 C6QQdGUycmscG73HXWGWnCkEs2PbjcTDHCRaK8bKigQrZ+RATi6LDq0zyRLX67A4cp
	 TLrMNuXiBKSWZhA6RgQfZoZyJQW3rh9069j6YcsxVTzf0cPyI/rYjlv3agkoP9FYZN
	 AmHTdo5mS6Egn8rfJO2YdHdVWFiqd+gMPhQ7m+AiEWYyGWyI0oSd1NDRw95uTQrYMT
	 MKGxMMl0tzKCA==
Date: Fri, 13 May 2022 13:36:12 -0700 (PDT)
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
In-Reply-To: <990efb92-e3b7-9487-2039-cf93ea1011af@xen.org>
Message-ID: <alpine.DEB.2.22.394.2205131328430.3842@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop> <20220505001656.395419-6-sstabellini@kernel.org> <fb9aefed-ef4b-c26e-9ff0-1eb59e7d215c@xen.org> <alpine.DEB.2.22.394.2205121806210.3842@ubuntu-linux-20-04-desktop>
 <990efb92-e3b7-9487-2039-cf93ea1011af@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 May 2022, Julien Grall wrote:
> On 13/05/2022 02:09, Stefano Stabellini wrote:
> > On Wed, 11 May 2022, Julien Grall wrote:
> > > > +    rc = xs_introduce_domain(xsh, info->domid,
> > > > +            (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET,
> > > > +            xenstore_evtchn);
> > > 
> > > I might be missing something here. In an ealier version, I pointed out
> > > that
> > > xs_introduce_domain() would fail in the case the dom0less domain doesn't
> > > have
> > > "xen,enhanced".
> > > 
> > > AFAICT, you agreed that the (part?) of initialization should be skipped.
> > > But I
> > > don't see the change in the code. Regarding the placement, we could either
> > > fully skip init_domain() or just xs_introduce_domain(). The latter might
> > > be
> > > better so all the domains are listed using xenstore-ls.
> > > 
> > > So something like below should work:
> > > 
> > > if ( xenstore_evtchn )
> > > {
> > >      rc = xs_introduce...();
> > >      ...
> > > }
> > 
> > Yes, good point. xenstore_evtchn could be zero validly (first evtchn is
> > zero),
> 
> Event channel 0 is always reserved when initialization the event channel
> subsystem (evtchn_init()):
> 
> evtchn_from_port(d, 0)->state = ECS_RESERVED;
> 
> > so instead I'll check on xenstore_pfn to be zero (xenstore_pfn is
> > 0 for non-enhanced domUs.)
> 
> I spotted that difference but decided to not comment on it as Linux is already
> considering the values 0 and ~0 as invalid. However, I am not in favor on any
> code to rely on 0 means Xenstore will never be available while ~0 means that
> it might be available.
> 
> Anyway, as I wrote above, the event channel 0 is always reserved. So you can
> safely use this value to detect whether we allocated the event channel for
> Xenstore.

Thanks I didn't know that. In that case, using xenstore_evtchn is
better, I'll do that.

