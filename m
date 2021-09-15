Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 895B740BC96
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 02:26:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187105.335843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQIk0-0007Df-Sw; Wed, 15 Sep 2021 00:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187105.335843; Wed, 15 Sep 2021 00:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQIk0-0007BS-PT; Wed, 15 Sep 2021 00:25:32 +0000
Received: by outflank-mailman (input) for mailman id 187105;
 Wed, 15 Sep 2021 00:25:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+tO=OF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mQIjz-0007BM-PY
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 00:25:31 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cde7055d-c39d-48fb-80e7-cf04772d8b92;
 Wed, 15 Sep 2021 00:25:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFA376121D;
 Wed, 15 Sep 2021 00:25:29 +0000 (UTC)
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
X-Inumbo-ID: cde7055d-c39d-48fb-80e7-cf04772d8b92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631665530;
	bh=1r6We/XbbEX1xmXeEkmuZ8/CtRbvBr5pJq4VhaF9Ju4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Fk+8NHEsEDFEBUUNkcCN+HWntwq6tEMUwzP8Ca7r0uDJoVY6YNUfOSmVM+UELoUcr
	 QuMTedNtYpf9I3X37yB09ttqeRpjcM+6n5uypd/CyAH6FfHw4vgXRxOZGTBhVLIK2O
	 BCZIYqRa6Ix5HQ+xGR4wxsw0IqSOV1VHGf+7OP4G0S2Hjzo95cF730Kf67xzgsMHz2
	 6G8YW93MhvhM6MWQM3vg/h9U+t79hDC/iFsxUz4t2xBURK0rT6S1/5Za/yf0YtIzQP
	 ifY3tofOkS4bBdkH/wyCMllRLs5enEE/Oz3kmCTZRajiGYMC4K1iHqg2xxruSpisLN
	 JNbAaPcZ7dvuQ==
Date: Tue, 14 Sep 2021 17:25:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
cc: Julien Grall <julien@xen.org>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Artem Mygaiev <Artem_Mygaiev@epam.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Rahul Singh <rahul.singh@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for hardware
 domain
In-Reply-To: <a4343670-2d9a-cec2-f093-aa3b0a5e0657@epam.com>
Message-ID: <alpine.DEB.2.21.2109141716170.21985@sstabellini-ThinkPad-T480s>
References: <20210903083347.131786-1-andr2000@gmail.com> <20210903083347.131786-10-andr2000@gmail.com> <247bd41c-98e6-f898-8216-e36b22158636@xen.org> <8db7ab42-d361-5b20-c648-7af9d0cdaad9@epam.com> <d7ecd474-fe0a-2bca-717e-cb82c89358ea@xen.org>
 <ad8ef71c-a834-daff-7ad8-b7c3f718a3e2@epam.com> <6810eefb-b6d0-9557-7bdd-80ac381e467b@xen.org> <7263f268-7f90-e561-4679-f78185c88cd8@epam.com> <0eb861db-eaf4-0919-4f54-64f448f1cdfe@xen.org> <52da7955-ead7-f404-6e51-7d1ee7bc3142@epam.com>
 <a4343670-2d9a-cec2-f093-aa3b0a5e0657@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-735770519-1631665135=:21985"
Content-ID: <alpine.DEB.2.21.2109141719190.21985@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-735770519-1631665135=:21985
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109141719191.21985@sstabellini-ThinkPad-T480s>

On Tue, 14 Sep 2021, Oleksandr Andrushchenko wrote:
> >> What you want to know if how many times register_mmio_handler() will be called from domain_vpci_init().
> >>
> >> You introduced a function pci_host_iterate_bridges() that will walk over the bridges and then call the callback vpci_setup_mmio_handler(). So you could introduce a new callback that will return 1 if bridge->ops->register_mmio_handler is not NULL or 0.
> >
> > Ok, clear. Something like:
> >
> >     if ( (rc = domain_vgic_register(d, &count)) != 0 )
> >         goto fail;
> >
> >     *find out how many bridges and update count*
> >
> >
> >     if ( (rc = domain_io_init(d, count + MAX_IO_HANDLER)) != 0 )
> >         goto fail;
> >
> I have the following code now:
> 
> int domain_vpci_get_num_mmio_handlers(struct domain *d)
> {
>      int count;

count is incremented but not initialized


>      if ( is_hardware_domain(d) )
>          /* For each PCI host bridge's configuration space. */
>          count += pci_host_get_num_bridges();
>      else
>          /*
>           * VPCI_MSIX_MEM_NUM handlers for MSI-X tables per each PCI device
>           * being passed through. Maximum number of supported devices
>           * is 32 as virtual bus topology emulates the devices as embedded
>           * endpoints.
>           * +1 for a single emulated host bridge's configuration space. */
>          count = VPCI_MSIX_MEM_NUM * 32 + 1;
>      return count;
> }
> 
> Please note that we cannot tell how many PCIe devices are going to be passed through
> 
> So, worst case for DomU is going to be 65 to what we already have...
> 
> This sounds scary a bit as most probably we won't pass through 32 devices most of the
> 
> time, but will make d->arch.vmmio.handlers almost 4 times bigger then it is now.
> 
> This may have influence on the MMIO handlers performance...

I am OK with that given that it doesn't affect performance until you
actually start creating too many virtual devices for the DomU. In other
words, find_mmio_handler restricts the search to vmmio->num_entries, so
as long as most entries are allocated but unused, we should be fine.
--8323329-735770519-1631665135=:21985--

