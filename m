Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD154CC976
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 23:49:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283778.482891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPuGN-00051y-Hm; Thu, 03 Mar 2022 22:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283778.482891; Thu, 03 Mar 2022 22:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPuGN-0004zj-Dy; Thu, 03 Mar 2022 22:49:35 +0000
Received: by outflank-mailman (input) for mailman id 283778;
 Thu, 03 Mar 2022 22:49:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tUyt=TO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nPuGM-0004zV-2Z
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 22:49:34 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3123fe05-9b44-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 23:49:32 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EF430B826F7;
 Thu,  3 Mar 2022 22:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF27C004E1;
 Thu,  3 Mar 2022 22:49:29 +0000 (UTC)
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
X-Inumbo-ID: 3123fe05-9b44-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646347770;
	bh=8T7CokGxWBKJfPW1pG0VCMscny/1l39AXb6Fw4feFiI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mDE8XGmJRPXC3FhUExxfC/Tg8r8q5kqje46aVpKcSpgATjCrTOmm8dyL5+N0ARFUl
	 igEkDLka8/5AR112e4UmftTK6LTw6MIVEq72/1WbVxD/BN6jvq1CQNSmYNX2eOZkoM
	 C7Y6r4k/M1DH2K4tAUOZ5dfMEE8n9On9bbDAQYejM/m/pVednlfOiQ+0ILLxk+xuq6
	 0Hivc3idTv5Og15E95hL8KOwRNZ6gfWfd8YTyoWKgbowpFGJ7UwyLwEnr/Ub/zQ8kx
	 OW2VcyhCSn0JN1ypiUZLYah5Kofhllw9xygmCFN3oPTfqf6bSdXRFiDe95KnoglrOU
	 yMQm9xneH86Yg==
Date: Thu, 3 Mar 2022 14:49:29 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christoph Hellwig <hch@lst.de>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    iommu@lists.linux-foundation.org, x86@kernel.org, 
    Anshuman Khandual <anshuman.khandual@arm.com>, 
    Tom Lendacky <thomas.lendacky@amd.com>, 
    Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>, 
    David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
    Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org, 
    xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org, 
    linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
    linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net, 
    linux-pci@vger.kernel.org
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
In-Reply-To: <20220303105931.GA15137@lst.de>
Message-ID: <alpine.DEB.2.22.394.2203031447120.3261@ubuntu-linux-20-04-desktop>
References: <20220301105311.885699-1-hch@lst.de> <20220301105311.885699-12-hch@lst.de> <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop> <20220302081500.GB23075@lst.de> <alpine.DEB.2.22.394.2203021709470.3261@ubuntu-linux-20-04-desktop>
 <20220303105931.GA15137@lst.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Mar 2022, Christoph Hellwig wrote:
> On Wed, Mar 02, 2022 at 05:25:10PM -0800, Stefano Stabellini wrote:
> > Thinking more about it we actually need to drop the xen_initial_domain()
> > check otherwise some cases won't be functional (Dom0 not 1:1 mapped, or
> > DomU 1:1 mapped).
> 
> Hmm, but that would be the case even before this series, right?

Before this series we only have the xen_swiotlb_detect() check in
xen_mm_init, we don't have a second xen_initial_domain() check.

The issue is that this series is adding one more xen_initial_domain()
check in xen_mm_init.

