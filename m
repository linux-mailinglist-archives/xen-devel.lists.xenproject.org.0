Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6BE97A836
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 22:19:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799682.1209652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqIBx-0004dD-Ut; Mon, 16 Sep 2024 20:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799682.1209652; Mon, 16 Sep 2024 20:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqIBx-0004ak-Rt; Mon, 16 Sep 2024 20:19:25 +0000
Received: by outflank-mailman (input) for mailman id 799682;
 Mon, 16 Sep 2024 20:19:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D3gN=QO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sqIBw-0004ae-BG
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 20:19:24 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5b353c0-7468-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 22:19:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B1889A4321A;
 Mon, 16 Sep 2024 20:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424B0C4CEC4;
 Mon, 16 Sep 2024 20:19:20 +0000 (UTC)
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
X-Inumbo-ID: f5b353c0-7468-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726517961;
	bh=9oMaMq4JbZsi++uRLE3HEFiboWVRs8H6S6Ee3vyo6ng=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OVRbnsjGRZj8KqNu89ASxv0qzGUd9UE5Dp9vi8lPma+XdHFJkEPelDXGH8UNAlznc
	 thtUhqQsdlXK3g3yp1Waccqz+51v9KT0/0AVS8mQ1sNUd8HSJo8yPWk1wpTS2uz7zJ
	 syMMFZhsOQGUDS8vBv3FEk/8xhwqyXxCNQpne0m3ZUDNSyVQi1uv519yL1jzN/8Mjh
	 yPVKPcKVE2UtuipCI8E0IrMOmMDs+0IJlxTU14E9G/bpe1eeOUxQAFOlsTapFnYYaX
	 0y43AzcGbNbDHtk6D21hPFGRWkZwh4Ju8AtDslfHOykOFyCkUKJ9tgychqJQKMV/X+
	 6KsiKvkorXsBw==
Date: Mon, 16 Sep 2024 13:19:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    iommu@lists.linux.dev
Subject: Re: [PATCH v2 1/2] xen/swiotlb: add alignment check for dma
 buffers
In-Reply-To: <8866f8a6-e42c-47d2-af6f-c4bdda5a358f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2409161312000.1417852@ubuntu-linux-20-04-desktop>
References: <20240916064748.18071-1-jgross@suse.com> <20240916064748.18071-2-jgross@suse.com> <d23c9af4-4a79-4300-891a-fba3ea9cbb1c@suse.com> <c2dd89b4-46c7-4a0a-a47b-70862294176b@suse.com> <8866f8a6-e42c-47d2-af6f-c4bdda5a358f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1816907758-1726517960=:1417852"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1816907758-1726517960=:1417852
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 16 Sep 2024, Juergen Gross wrote:
> On 16.09.24 08:56, Juergen Gross wrote:
> > On 16.09.24 08:50, Jan Beulich wrote:
> > > On 16.09.2024 08:47, Juergen Gross wrote:
> > > > --- a/drivers/xen/swiotlb-xen.c
> > > > +++ b/drivers/xen/swiotlb-xen.c
> > > > @@ -78,9 +78,15 @@ static inline int
> > > > range_straddles_page_boundary(phys_addr_t p, size_t size)
> > > >   {
> > > >       unsigned long next_bfn, xen_pfn = XEN_PFN_DOWN(p);
> > > >       unsigned int i, nr_pages = XEN_PFN_UP(xen_offset_in_page(p) +
> > > > size);
> > > > +    phys_addr_t algn = 1ULL << (get_order(size) + PAGE_SHIFT);
> > > >       next_bfn = pfn_to_bfn(xen_pfn);
> > > > +    /* If buffer is physically aligned, ensure DMA alignment. */
> > > > +    if (IS_ALIGNED(p, algn) &&
> > > > +        !IS_ALIGNED(next_bfn << XEN_PAGE_SHIFT, algn))
> > > 
> > > And this shift is not at risk of losing bits on Arm LPAE?
> > 
> > For alignment check this just doesn't matter (assuming XEN_PAGE_SIZE is
> > smaller than 4G).
> 
> Wait, that was nonsense.
> 
> I'll change the check to:
> 
> 	!IS_ALIGNED((phys_addr_t)next_bfn << XEN_PAGE_SHIFT, algn)

With this change:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

--8323329-1816907758-1726517960=:1417852--

