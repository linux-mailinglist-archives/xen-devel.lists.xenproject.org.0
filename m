Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0971D4C31A5
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 17:40:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278497.475775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNH9i-0007JR-4v; Thu, 24 Feb 2022 16:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278497.475775; Thu, 24 Feb 2022 16:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNH9i-0007HV-1d; Thu, 24 Feb 2022 16:39:50 +0000
Received: by outflank-mailman (input) for mailman id 278497;
 Thu, 24 Feb 2022 16:39:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uiXl=TH=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1nNH9g-0007H6-64
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 16:39:48 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 605fefbb-9590-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 17:39:46 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8DAAC68AFE; Thu, 24 Feb 2022 17:39:43 +0100 (CET)
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
X-Inumbo-ID: 605fefbb-9590-11ec-8eb8-a37418f5ba1a
Date: Thu, 24 Feb 2022 17:39:43 +0100
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
	x86@kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
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
Subject: Re: cleanup swiotlb initialization
Message-ID: <20220224163943.GA32088@lst.de>
References: <20220222153514.593231-1-hch@lst.de> <09cb4ad3-88e7-3744-b4b8-a6d745ecea9e@oracle.com> <20220224155854.GA30938@lst.de> <206ba6a3-770a-70ad-96bc-76c6380da988@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <206ba6a3-770a-70ad-96bc-76c6380da988@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Feb 24, 2022 at 11:18:33AM -0500, Boris Ostrovsky wrote:
>
> On 2/24/22 10:58 AM, Christoph Hellwig wrote:
>> Thanks.
>>
>> This looks really strange as early_amd_iommu_init should not interact much
>> with the changes.  I'll see if I can find a AMD system to test on.
>
>
> Just to be clear: this crashes only as dom0. Boots fine as baremetal.

Ah.  I can gues what this might be.  On Xen the hypervisor controls the
IOMMU and we should never end up initializing it in Linux, right?

