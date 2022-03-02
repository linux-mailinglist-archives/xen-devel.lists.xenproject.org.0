Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87A04CA088
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 10:22:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282126.480711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPLBS-00064b-8h; Wed, 02 Mar 2022 09:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282126.480711; Wed, 02 Mar 2022 09:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPLBS-00062P-5W; Wed, 02 Mar 2022 09:22:10 +0000
Received: by outflank-mailman (input) for mailman id 282126;
 Wed, 02 Mar 2022 09:22:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rYeN=TN=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1nPLBR-00062H-5W
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 09:22:09 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b4681cf-9a0a-11ec-8eba-a37418f5ba1a;
 Wed, 02 Mar 2022 10:22:08 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 745BC68AFE; Wed,  2 Mar 2022 10:22:04 +0100 (CET)
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
X-Inumbo-ID: 3b4681cf-9a0a-11ec-8eba-a37418f5ba1a
Date: Wed, 2 Mar 2022 10:22:04 +0100
From: Christoph Hellwig <hch@lst.de>
To: Anatoly Pugachev <matorola@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
	x86@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390 <linux-s390@vger.kernel.org>,
	linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH 07/11] x86: remove the IOMMU table infrastructure
Message-ID: <20220302092204.GA24139@lst.de>
References: <20220227143055.335596-1-hch@lst.de> <20220227143055.335596-8-hch@lst.de> <CADxRZqxrjp4erFNorH+XqubZWLRNjw2E14z7vOW537no1eKnhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADxRZqxrjp4erFNorH+XqubZWLRNjw2E14z7vOW537no1eKnhw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Mar 02, 2022 at 12:18:26PM +0300, Anatoly Pugachev wrote:
> Is it possible to keep documentation comments in source files? Or are
> they completely irrelevant now?

That ones you quoted are very much irrelevant now.  And the behaviour
of the swiotlb disabling will have to change (this patchset is a bit
of a preparation for now) as we now use per-device dma_ops and the
dma-iommu can dip into the swiotlb pool for untrusted devices.  In
practive we'll basically have to always initialize the swiotlb buffer
now.

