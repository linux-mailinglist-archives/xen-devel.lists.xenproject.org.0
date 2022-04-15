Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EA9503048
	for <lists+xen-devel@lfdr.de>; Sat, 16 Apr 2022 00:19:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305939.521071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfUHP-0004xi-OS; Fri, 15 Apr 2022 22:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305939.521071; Fri, 15 Apr 2022 22:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfUHP-0004vr-LZ; Fri, 15 Apr 2022 22:19:03 +0000
Received: by outflank-mailman (input) for mailman id 305939;
 Fri, 15 Apr 2022 22:19:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nfUHO-0004vj-0d
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 22:19:02 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d09fda6-bd0a-11ec-8fbe-03012f2f19d4;
 Sat, 16 Apr 2022 00:19:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 150A7B83122;
 Fri, 15 Apr 2022 22:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E2DC385A4;
 Fri, 15 Apr 2022 22:18:58 +0000 (UTC)
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
X-Inumbo-ID: 0d09fda6-bd0a-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650061138;
	bh=fscACWys4DXSOaZ8pzzt20bUsUJOvEXojsuQGUVaXEI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cV7D6S9Zcm9o1PgKk/92APwE108cD816p4nS+GfJm3a5hYohEmbQoM0CNgq0o9Ojb
	 7Dn2iGFyV3PcBW6ni5wpYkPF+Yf5mZ9UrQLv9kZ6QJvOYlj9k1SFTUAIyDbeVHQqBg
	 u0gQZio8p45XsDmfpgQwMnwxQPSqwB2fNwgu5E5Dy2LKYDdFZBUtgQoDhDa/nqZbkj
	 6N8a3Y50leuzl0xEH9WMl0CaYIFTuq/n8ALwaOEditxCWgxE8tlDv/Feq2rj/+6+kp
	 qW5uaQEwmw57vr1CDikL5ydRGkueOUsexQeWHcpXO+da4mtmFbVAfhGxZKdlYwKb7s
	 8Uo7Js2X3rM7w==
Date: Fri, 15 Apr 2022 15:18:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, nd <nd@arm.com>, 
    Penny Zheng <penzhe01@a011292.shanghai.arm.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Chen <Wei.Chen@arm.com>
Subject: RE: [PATCH v1 02/13] xen/arm: introduce a special domain
 DOMID_SHARED
In-Reply-To: <DU2PR08MB7325F469140EFE83F2F8F91DF7EE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2204151506520.915916@ubuntu-linux-20-04-desktop>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com> <20220311061123.1883189-3-Penny.Zheng@arm.com> <eefa9cf2-a04c-ba8d-74cb-0d2aaa35badb@suse.com> <alpine.DEB.2.22.394.2203181443440.2910984@ubuntu-linux-20-04-desktop> <30a6ef6f-d37c-b66c-d5af-be2208766057@suse.com>
 <alpine.DEB.2.22.394.2203211256370.2910984@ubuntu-linux-20-04-desktop> <f8627956-8b01-6a5d-d69a-d2da16d74726@xen.org> <DU2PR08MB7325F469140EFE83F2F8F91DF7EE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Apr 2022, Penny Zheng wrote:
> > Hi Stefano,
> > 
> > On 21/03/2022 20:03, Stefano Stabellini wrote:
> > > On Mon, 21 Mar 2022, Jan Beulich wrote:
> > >> On 18.03.2022 22:50, Stefano Stabellini wrote:
> > >>> On Fri, 18 Mar 2022, Jan Beulich wrote:
> > >>>> On 11.03.2022 07:11, Penny Zheng wrote:
> > >>>>> In case to own statically shared pages when owner domain is not
> > >>>>> explicitly defined, this commits propose a special domain
> > >>>>> DOMID_SHARED, and we assign it 0x7FF5, as one of the system domains.
> > >>>>>
> > >>>>> Statically shared memory reuses the same way of initialization
> > >>>>> with static memory, hence this commits proposes a new Kconfig
> > >>>>> CONFIG_STATIC_SHM to wrap related codes, and this option depends
> > on static memory(CONFIG_STATIC_MEMORY).
> > >>>>>
> > >>>>> We intends to do shared domain creation after setup_virt_paging so
> > >>>>> shared domain could successfully do p2m initialization.
> > >>>>
> > >>>> There's nothing said here, in the earlier patch, or in the cover
> > >>>> letter about the security aspects of this. There is a reason we
> > >>>> haven't been allowing arbitrary, un-supervised sharing of memory
> > >>>> between domains. It wants clarifying why e.g. grants aren't an
> > >>>> option to achieve what you need, and how you mean to establish
> > >>>> which domains are / aren't permitted to access any individual page
> > owned by this domain.
> > >>>
> > >>>
> > >>> I'll let Penny write a full reply but I'll chime in to try to help
> > >>> with the explanation.
> > >>>
> > >>> This is not arbitrary un-supervised sharing of memory between
> > >>> domains, which indeed is concerning.
> > >>>
> > >>> This is statically-configured, supervised by the system
> > >>> configurator, sharing of memory between domains.
> > >>>
> > >>> And in fact safety (which is just a different aspect of security) is
> > >>> one of the primary goals for this work.
> > >>>
> > >>> In safety-critical environments, it is not considered safe to
> > >>> dynamically change important configurations at runtime. Everything
> > >>> should be statically defined and statically verified.
> > >>>
> > >>> In this case, if the system configuration knows a priori that there
> > >>> are only 2 VM and they need to communication over shared memory, it
> > >>> is safer to pre-configure the shared memory at build time rather
> > >>> than let the VMs attempt to share memory at runtime. It is faster too.
> > >>>
> > >>> The only way to trigger this static shared memory configuration
> > >>> should be via device tree, which is at the same level as the XSM
> > >>> rules themselves.
> > >>>
> > >>> Hopefully I made things clearer and not murkier :-)
> > >>
> > >> It adds some helpful background, yes, but at the same time it doesn't
> > >> address the security concern at all: How are access permissions
> > >> managed when the owning domain is a special one? I haven't spotted
> > >> any recording of the domains which are actually permitted to map /
> > >> access the pages in questions. (But of course I also only looked at
> > >> non-Arm-specific code. I'd expect such code not to live in arch-
> > >> specific files.)
> > >
> > > All this static memory sharing is statically done at __init time only.
> > > It should not be possible to trigger any further memory sharing at
> > > runtime (if there is, that would be a bug).
> > 
> > Looking at the code, get_pg_owner() will be able to handle DOMID_SHARED.
> > So anyone that is permitted to access DOMID_SHARED will be able to map any
> > memory region at runtime.
> > 
> > > There are no new interfaces for the guest to map this memory because
> > > it is already "pre-mapped".
> > 
> > It can via XENMAPSPACE_gmfn_foreign (assuming proper permission).
> > 
> 
> Correct me if I'm wrong:
> The existing XENMAPSPACE_gmfn_foreign only allows privileged Dom0 to map
> memory pages from one foreign DomU to itself. So It can happen that Dom0 is
> using XENMAPSPACE_gmfn_foreign to (maliciously?) access shared memory owned
> by DOMID_SHARED, and for now only Dom0 could.

No, currently there is no protection against dom0 doing malicious
operations. Dom0 can poweroff the entire system.

If we are certain that only dom0 (and not other domains) can use
XENMAPSPACE_gmfn_foreign to access shared memory owned by DOMID_SHARED
then we are good. Looking at the code, and also considering that we have
agreed to move to DOMID_IO, get_pg_owner can already handle DOMID_IO.

Next is the xsm_map_gmfn_foreign(XSM_TARGET, d, od) check, which would
fail unless the asking domain is privileged over the target domain.
xsm_map_gmfn_foreign would fail for all domains except dom0.

So I think we are OK. I don't think we need to do anything else.

