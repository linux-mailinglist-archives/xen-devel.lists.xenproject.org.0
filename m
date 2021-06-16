Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8F03AA03E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 17:45:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143455.264406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltXib-0001Oj-EM; Wed, 16 Jun 2021 15:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143455.264406; Wed, 16 Jun 2021 15:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltXib-0001Mf-B0; Wed, 16 Jun 2021 15:44:41 +0000
Received: by outflank-mailman (input) for mailman id 143455;
 Wed, 16 Jun 2021 15:44:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IKif=LK=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1ltXia-0001MX-0f
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 15:44:40 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea112699-168d-4f67-8d30-9adf75dc741d;
 Wed, 16 Jun 2021 15:44:38 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 71B3B67357; Wed, 16 Jun 2021 17:44:36 +0200 (CEST)
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
X-Inumbo-ID: ea112699-168d-4f67-8d30-9adf75dc741d
Date: Wed, 16 Jun 2021 17:44:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, Roman Skakun <rm.skakun@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Roman Skakun <roman_skakun@epam.com>,
	Andrii Anisov <andrii_anisov@epam.com>
Subject: Re: [PATCH 2/2] swiotlb-xen: override common mmap and get_sgtable
 dma ops
Message-ID: <20210616154436.GA7619@lst.de>
References: <855a58e2-1e03-4763-cb56-81367b73762c@oracle.com> <20210616114205.38902-1-roman_skakun@epam.com> <20210616114205.38902-2-roman_skakun@epam.com> <2834cdc0-534c-4f07-1901-e468a7713c1f@oracle.com> <20210616142148.GA764@lst.de> <83353b34-2abb-9dfc-bed6-21d500abf49f@oracle.com> <20210616153519.GA6476@lst.de> <d4e8c822-3f92-d552-018c-611a44299e28@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4e8c822-3f92-d552-018c-611a44299e28@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jun 16, 2021 at 11:39:07AM -0400, Boris Ostrovsky wrote:
> 
> On 6/16/21 11:35 AM, Christoph Hellwig wrote:
> > On Wed, Jun 16, 2021 at 11:33:50AM -0400, Boris Ostrovsky wrote:
> >> Isn't the expectation of virt_to_page() that it only works on non-vmalloc'd addresses? (This is not a rhetorical question, I actually don't know).
> > Yes.  Thus is why I'd suggest to just do the vmalloc_to_page or
> > virt_to_page dance in ops_helpers.c and just continue using that.
> 
> 
> Ah, OK, so something along the lines of what I suggested. (I thought by "helpers" you meant virt_to_page()).

Yes.  Just keeping it contained in the common code without duplicating it
into a xen-specific version.

