Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC98A4D90BA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 01:01:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290533.492771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTubq-0000Z3-7C; Tue, 15 Mar 2022 00:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290533.492771; Tue, 15 Mar 2022 00:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTubq-0000Va-2R; Tue, 15 Mar 2022 00:00:18 +0000
Received: by outflank-mailman (input) for mailman id 290533;
 Tue, 15 Mar 2022 00:00:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AqxF=T2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nTubn-0000VU-QL
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 00:00:15 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e12f54ee-a3f2-11ec-853b-5f4723681683;
 Tue, 15 Mar 2022 01:00:13 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1D754CE16F9;
 Tue, 15 Mar 2022 00:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82170C340E9;
 Tue, 15 Mar 2022 00:00:03 +0000 (UTC)
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
X-Inumbo-ID: e12f54ee-a3f2-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647302404;
	bh=qF2Kiv1yBWM6zFZu7vu4vkmgVsDPPK9bUwo+CMzG77s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CxQznLVvPAMHVLObot/GbKAGNBs3wp/Zo7J//e5fa5RGl/JAcrYpHk7dFYXJ+dCyc
	 yFp/t/ucQtYgdUQQRIyugjt0bw6neR65fWz4Mw2wQpqjjnNDOhxJr7SqJvB+dScWOI
	 FWaPNn7YRGzQ0CCDI4WX3HGCjk3WcedTK4ZKrUhQL/ZjI62kK/fSKVT6fnNg8LwsV7
	 O+N86nVOy9ALX/s25HJpQGYpv30ak+B6D/CFn8xWL4gwGSW9Q/HStnRPdXpxBq2xEr
	 XfmlQm0hAt72Py8IAnH8MpwztAqekJ4fXRmnodDkCqvESbpDzlwteZaCwLl1CvtOpX
	 4SrZDmHAzylBg==
Date: Mon, 14 Mar 2022 17:00:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christoph Hellwig <hch@lst.de>
cc: iommu@lists.linux-foundation.org, x86@kernel.org, 
    Anshuman Khandual <anshuman.khandual@arm.com>, 
    Tom Lendacky <thomas.lendacky@amd.com>, 
    Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>, 
    David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
    Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org, 
    xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org, 
    linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
    linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net, 
    linux-pci@vger.kernel.org
Subject: Re: [PATCH 13/15] swiotlb: merge swiotlb-xen initialization into
 swiotlb
In-Reply-To: <20220314073129.1862284-14-hch@lst.de>
Message-ID: <alpine.DEB.2.22.394.2203141659210.3497@ubuntu-linux-20-04-desktop>
References: <20220314073129.1862284-1-hch@lst.de> <20220314073129.1862284-14-hch@lst.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Mar 2022, Christoph Hellwig wrote:
> Reuse the generic swiotlb initialization for xen-swiotlb.  For ARM/ARM64
> this works trivially, while for x86 xen_swiotlb_fixup needs to be passed
> as the remap argument to swiotlb_init_remap/swiotlb_init_late.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

For arch/arm/xen and drivers/xen/swiotlb-xen.c

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

