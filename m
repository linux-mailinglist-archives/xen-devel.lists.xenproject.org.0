Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7160846C850
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 00:38:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241982.418611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muk1A-0007GY-CP; Tue, 07 Dec 2021 23:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241982.418611; Tue, 07 Dec 2021 23:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muk1A-0007E3-8u; Tue, 07 Dec 2021 23:37:04 +0000
Received: by outflank-mailman (input) for mailman id 241982;
 Tue, 07 Dec 2021 23:37:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3n9=QY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1muk18-0007Dx-MN
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 23:37:02 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9269ba7c-57b6-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 00:37:00 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1FEE9CE1C51;
 Tue,  7 Dec 2021 23:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA742C341C3;
 Tue,  7 Dec 2021 23:36:54 +0000 (UTC)
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
X-Inumbo-ID: 9269ba7c-57b6-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638920215;
	bh=FG2SGFwHcUyA+9+/Ri7rTgQT9k2NE3/aM61sY9WDemQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Aok5DLUJj+Jy+u4ZaMwSlbC6ocZ+w7ekCFqJtmvUvFk88u7LuWmPb2RtTfOeKJ+vj
	 74uRJCdnaTNBaLlNCL85DkWQ3ctIxEImPA/IjNSnrAU4RDG3ozJGTMnEH8LqxLCt0t
	 M7L/j8LTAapBoD22PIB7nlv5uIAWuNbF5VX5lLdurPYF2WssIJmXdUM/kpkGsOIoj0
	 hZ1vkRZUR0bho/yrYDQg1m5hNj3V/igTBF+RgOKwwsTFsYZM8XIZVtlil77U/38TKM
	 qYlB/av2z5AFJH8/fB2CHpPVVOY9sAJhxDtFDi9D7dMKcgqpBTPTe1F0x3YU8vBlP+
	 vsA2scHSad/Ww==
Date: Tue, 7 Dec 2021 15:36:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH V3 4/6] xen/unpopulated-alloc: Add mechanism to use Xen
 resource
In-Reply-To: <c2e8c00a-3856-8330-8e8f-ab8a92e93e47@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2112071506370.4091490@ubuntu-linux-20-04-desktop>
References: <1637787223-21129-1-git-send-email-olekstysh@gmail.com> <1637787223-21129-5-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.22.394.2111241701240.1412361@ubuntu-linux-20-04-desktop> <c2e8c00a-3856-8330-8e8f-ab8a92e93e47@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1417778164-1638918436=:4091490"
Content-ID: <alpine.DEB.2.22.394.2112071520320.4091490@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1417778164-1638918436=:4091490
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2112071520321.4091490@ubuntu-linux-20-04-desktop>

On Thu, 25 Nov 2021, Oleksandr wrote:
> > > Please note the following:
> > > for V3 arch_xen_unpopulated_init() was moved to init() as was agreed
> > > and gained __init specifier. So the target_resource is initialized there.
> > > 
> > > With current patch series applied if CONFIG_XEN_UNPOPULATED_ALLOC
> > > is enabled:
> > > 
> > > 1. On Arm, under normal circumstances, the xen_alloc_unpopulated_pages()
> > > won't be called “before” arch_xen_unpopulated_init(). It will only be
> > > called "before" when either ACPI is in use or something wrong happened
> > > with DT (and we failed to read xen_grant_frames), so we fallback to
> > > xen_xlate_map_ballooned_pages() in arm/xen/enlighten.c:xen_guest_init(),
> > > please see "arm/xen: Switch to use gnttab_setup_auto_xlat_frames() for DT"
> > > for details. But in that case, I think, it doesn't matter much whether
> > > xen_alloc_unpopulated_pages() is called "before" of "after"
> > > target_resource
> > > initialization, as we don't have extended regions in place the
> > > target_resource
> > > will remain invalid even after initialization, so
> > > xen_alloc_ballooned_pages()
> > > will be used in both scenarios.
> > > 
> > > 2. On x86, I am not quite sure which modes use unpopulated-alloc (PVH?),
> > > but it looks like xen_alloc_unpopulated_pages() can (and will) be called
> > > “before” arch_xen_unpopulated_init().
> > > At least, I see that xen_xlate_map_ballooned_pages() is called in
> > > x86/xen/grant-table.c:xen_pvh_gnttab_setup(). According to the initcall
> > > levels for both xen_pvh_gnttab_setup() and init() I expect the former
> > > to be called earlier.
> > > If it is true, the sentence in the commit description which mentions
> > > that “behaviour on x86 is not changed” is not precise. I don’t think
> > > it would be correct to fallback to xen_alloc_ballooned_pages() just
> > > because we haven’t initialized target_resource yet (on x86 it is just
> > > assigning it iomem_resource), at least this doesn't look like an expected
> > > behaviour and unlikely would be welcome.
> > > 
> > > I am wondering whether it would be better to move
> > > arch_xen_unpopulated_init()
> > > to a dedicated init() marked with an appropriate initcall level
> > > (early_initcall?)
> > > to make sure it will always be called *before*
> > > xen_xlate_map_ballooned_pages().
> > > What do you think?
> 
>    ... here (#2). Or I really missed something and there wouldn't be an issue?

Yes, I see your point. Yeah, it makes sense to make sure that
drivers/xen/unpopulated-alloc.c:init is executed before
xen_pvh_gnttab_setup.

If we move it to early_initcall, then we end up running it before
xen_guest_init on ARM. But that might be fine: it looks like it should
work OK and would also allow us to execute xen_xlate_map_ballooned_pages
with target_resource already set.

So I'd say go for it :)
--8323329-1417778164-1638918436=:4091490--

