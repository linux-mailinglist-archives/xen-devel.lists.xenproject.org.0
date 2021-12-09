Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D81146DFF1
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 02:00:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242655.419661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv7ma-00061x-AE; Thu, 09 Dec 2021 00:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242655.419661; Thu, 09 Dec 2021 00:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv7ma-0005zX-7J; Thu, 09 Dec 2021 00:59:36 +0000
Received: by outflank-mailman (input) for mailman id 242655;
 Thu, 09 Dec 2021 00:59:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PYs1=Q2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mv7mY-0005zR-Vm
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 00:59:34 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44fd490e-588b-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 01:59:33 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AFC80B82269;
 Thu,  9 Dec 2021 00:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C2EC00446;
 Thu,  9 Dec 2021 00:59:30 +0000 (UTC)
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
X-Inumbo-ID: 44fd490e-588b-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639011570;
	bh=JBRUvmlqtKYO6wmUvlnMnb6NAQ+n15ncBLmNykYGTq0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dSuHHwnCyqSZ83TbfNBdfPANK+Eritcp33WaSlkA1QczlgssS7cWwZ+t4F5Nu6SgV
	 wX4FMJ2s3BwWeULH5+46ezf6G+4IkoezR4TgNj2lF0vSEEknEfs1KqcQFhiPRHfagR
	 pYJD/7oKp78ewx9YbKMGkA8S+HTMVUKj+nD5/UvKFkm1JGajtPjoWRgBxIL9eLCCp2
	 6l/rCq0Ry1TVwCpNN43m+wgLzJ7JgFJLm7GfRnFgBZZpRIFvK/QIP+8aaUPMRT2VzB
	 OTZJPgK5BWVxOKi8jNSuw0fsAkqh9vkldVoAYQ3UBjiXfhWLP48eIFYiKE8ao+H4Zr
	 1J+KYSfFui8Cg==
Date: Wed, 8 Dec 2021 16:59:28 -0800 (PST)
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
In-Reply-To: <50997667-7c6c-491d-ff04-11e093fee7f0@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2112081659090.4091490@ubuntu-linux-20-04-desktop>
References: <1637787223-21129-1-git-send-email-olekstysh@gmail.com> <1637787223-21129-5-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.22.394.2111241701240.1412361@ubuntu-linux-20-04-desktop> <c2e8c00a-3856-8330-8e8f-ab8a92e93e47@gmail.com>
 <alpine.DEB.2.22.394.2112071506370.4091490@ubuntu-linux-20-04-desktop> <50997667-7c6c-491d-ff04-11e093fee7f0@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-157919797-1639011569=:4091490"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-157919797-1639011569=:4091490
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 9 Dec 2021, Oleksandr wrote:
> On 08.12.21 01:36, Stefano Stabellini wrote:
> Hi Stefano
> 
> > On Thu, 25 Nov 2021, Oleksandr wrote:
> > > > > Please note the following:
> > > > > for V3 arch_xen_unpopulated_init() was moved to init() as was agreed
> > > > > and gained __init specifier. So the target_resource is initialized
> > > > > there.
> > > > > 
> > > > > With current patch series applied if CONFIG_XEN_UNPOPULATED_ALLOC
> > > > > is enabled:
> > > > > 
> > > > > 1. On Arm, under normal circumstances, the
> > > > > xen_alloc_unpopulated_pages()
> > > > > won't be called “before” arch_xen_unpopulated_init(). It will only be
> > > > > called "before" when either ACPI is in use or something wrong happened
> > > > > with DT (and we failed to read xen_grant_frames), so we fallback to
> > > > > xen_xlate_map_ballooned_pages() in
> > > > > arm/xen/enlighten.c:xen_guest_init(),
> > > > > please see "arm/xen: Switch to use gnttab_setup_auto_xlat_frames() for
> > > > > DT"
> > > > > for details. But in that case, I think, it doesn't matter much whether
> > > > > xen_alloc_unpopulated_pages() is called "before" of "after"
> > > > > target_resource
> > > > > initialization, as we don't have extended regions in place the
> > > > > target_resource
> > > > > will remain invalid even after initialization, so
> > > > > xen_alloc_ballooned_pages()
> > > > > will be used in both scenarios.
> > > > > 
> > > > > 2. On x86, I am not quite sure which modes use unpopulated-alloc
> > > > > (PVH?),
> > > > > but it looks like xen_alloc_unpopulated_pages() can (and will) be
> > > > > called
> > > > > “before” arch_xen_unpopulated_init().
> > > > > At least, I see that xen_xlate_map_ballooned_pages() is called in
> > > > > x86/xen/grant-table.c:xen_pvh_gnttab_setup(). According to the
> > > > > initcall
> > > > > levels for both xen_pvh_gnttab_setup() and init() I expect the former
> > > > > to be called earlier.
> > > > > If it is true, the sentence in the commit description which mentions
> > > > > that “behaviour on x86 is not changed” is not precise. I don’t think
> > > > > it would be correct to fallback to xen_alloc_ballooned_pages() just
> > > > > because we haven’t initialized target_resource yet (on x86 it is just
> > > > > assigning it iomem_resource), at least this doesn't look like an
> > > > > expected
> > > > > behaviour and unlikely would be welcome.
> > > > > 
> > > > > I am wondering whether it would be better to move
> > > > > arch_xen_unpopulated_init()
> > > > > to a dedicated init() marked with an appropriate initcall level
> > > > > (early_initcall?)
> > > > > to make sure it will always be called *before*
> > > > > xen_xlate_map_ballooned_pages().
> > > > > What do you think?
> > >     ... here (#2). Or I really missed something and there wouldn't be an
> > > issue?
> > Yes, I see your point. Yeah, it makes sense to make sure that
> > drivers/xen/unpopulated-alloc.c:init is executed before
> > xen_pvh_gnttab_setup.
> > 
> > If we move it to early_initcall, then we end up running it before
> > xen_guest_init on ARM. But that might be fine: it looks like it should
> > work OK and would also allow us to execute xen_xlate_map_ballooned_pages
> > with target_resource already set.
> > 
> > So I'd say go for it :)
> 
> 
> Thank you for the confirmation! In order to be on the safe side, I would
> probably leave drivers/xen/unpopulated-alloc.c:init as is, I mean with current
> subsys initcall level (it expects the extra memory regions to be already
> filled)
> and create a separate unpopulated_init() to put arch_xen_unpopulated_init()
> into. Something like the following:
> 
> static int __init unpopulated_init(void)
> {
>     int ret;
> 
>     if (!xen_domain())
>         return -ENODEV;
> 
>     ret = arch_xen_unpopulated_init(&target_resource);
>     if (ret) {
>         pr_err("xen:unpopulated: Cannot initialize target resource\n");
>         target_resource = NULL;
>     }
> 
>     return ret;
> }
> early_initcall(unpopulated_init);

Sounds good
--8323329-157919797-1639011569=:4091490--

