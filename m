Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8F94CDF7E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 22:03:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284918.484163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQF5F-0006xl-Q3; Fri, 04 Mar 2022 21:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284918.484163; Fri, 04 Mar 2022 21:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQF5F-0006v8-Mi; Fri, 04 Mar 2022 21:03:29 +0000
Received: by outflank-mailman (input) for mailman id 284918;
 Fri, 04 Mar 2022 21:03:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2+cs=TP=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1nQF5E-0006v2-R6
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 21:03:28 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89a687f3-9bfe-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 22:03:27 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0D8E068BEB; Fri,  4 Mar 2022 22:03:18 +0100 (CET)
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
X-Inumbo-ID: 89a687f3-9bfe-11ec-8eba-a37418f5ba1a
Date: Fri, 4 Mar 2022 22:03:16 +0100
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	iommu@lists.linux-foundation.org, x86@kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
Message-ID: <20220304210316.GA17365@lst.de>
References: <20220301105311.885699-1-hch@lst.de> <20220301105311.885699-12-hch@lst.de> <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop> <ca748512-12bb-7d75-13f1-8d5ec9703e26@oracle.com> <20220304172859.GA12860@lst.de> <fc3992a8-896b-f0fc-e500-9010ec085c57@oracle.com> <20220304174308.GA13515@lst.de> <75cb15b5-d861-1b88-5413-df326c3f1144@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75cb15b5-d861-1b88-5413-df326c3f1144@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Mar 04, 2022 at 03:18:23PM -0500, Boris Ostrovsky wrote:
> This indeed allows dom0 to boot. Not sure I see where in the next patch this would have been fixed?

I thought it did, but it doesn't.  In the meantime I've pushed out an
updated branch with this folded in to:

git://git.infradead.org/users/hch/misc.git swiotlb-init-cleanup

> (BTW, just noticed in iommu_setup() you set this variable to 1. Should be 'true')

Thank, I'll fix this up.

