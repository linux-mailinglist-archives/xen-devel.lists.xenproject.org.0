Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 217ED3A9D77
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 16:22:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143266.264105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWQU-0002LW-9X; Wed, 16 Jun 2021 14:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143266.264105; Wed, 16 Jun 2021 14:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWQU-0002JF-5G; Wed, 16 Jun 2021 14:21:54 +0000
Received: by outflank-mailman (input) for mailman id 143266;
 Wed, 16 Jun 2021 14:21:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IKif=LK=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1ltWQS-0002Ic-IC
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 14:21:52 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ab75f1b-cda7-43d3-9b30-1911f556e34e;
 Wed, 16 Jun 2021 14:21:51 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E68C468BEB; Wed, 16 Jun 2021 16:21:48 +0200 (CEST)
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
X-Inumbo-ID: 8ab75f1b-cda7-43d3-9b30-1911f556e34e
Date: Wed, 16 Jun 2021 16:21:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Roman Skakun <rm.skakun@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Roman Skakun <roman_skakun@epam.com>,
	Andrii Anisov <andrii_anisov@epam.com>
Subject: Re: [PATCH 2/2] swiotlb-xen: override common mmap and get_sgtable
 dma ops
Message-ID: <20210616142148.GA764@lst.de>
References: <855a58e2-1e03-4763-cb56-81367b73762c@oracle.com> <20210616114205.38902-1-roman_skakun@epam.com> <20210616114205.38902-2-roman_skakun@epam.com> <2834cdc0-534c-4f07-1901-e468a7713c1f@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2834cdc0-534c-4f07-1901-e468a7713c1f@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jun 16, 2021 at 10:12:55AM -0400, Boris Ostrovsky wrote:
> I wonder now whether we could avoid code duplication between here and dma_common_mmap()/dma_common_get_sgtable() and use your helper there.
> 
> 
> Christoph, would that work?  I.e. something like

You should not duplicate the code at all, and just make the common
helpers work with vmalloc addresses.

