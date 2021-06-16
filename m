Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3713A9F60
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 17:35:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143427.264357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltXZe-0006JZ-KP; Wed, 16 Jun 2021 15:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143427.264357; Wed, 16 Jun 2021 15:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltXZe-0006Hg-HJ; Wed, 16 Jun 2021 15:35:26 +0000
Received: by outflank-mailman (input) for mailman id 143427;
 Wed, 16 Jun 2021 15:35:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IKif=LK=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1ltXZd-0006HQ-0Q
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 15:35:25 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3a83026-2ede-4195-9356-24f270d9223d;
 Wed, 16 Jun 2021 15:35:23 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1777768B05; Wed, 16 Jun 2021 17:35:20 +0200 (CEST)
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
X-Inumbo-ID: f3a83026-2ede-4195-9356-24f270d9223d
Date: Wed, 16 Jun 2021 17:35:19 +0200
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
Message-ID: <20210616153519.GA6476@lst.de>
References: <855a58e2-1e03-4763-cb56-81367b73762c@oracle.com> <20210616114205.38902-1-roman_skakun@epam.com> <20210616114205.38902-2-roman_skakun@epam.com> <2834cdc0-534c-4f07-1901-e468a7713c1f@oracle.com> <20210616142148.GA764@lst.de> <83353b34-2abb-9dfc-bed6-21d500abf49f@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83353b34-2abb-9dfc-bed6-21d500abf49f@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jun 16, 2021 at 11:33:50AM -0400, Boris Ostrovsky wrote:
> Isn't the expectation of virt_to_page() that it only works on non-vmalloc'd addresses? (This is not a rhetorical question, I actually don't know).

Yes.  Thus is why I'd suggest to just do the vmalloc_to_page or
virt_to_page dance in ops_helpers.c and just continue using that.

