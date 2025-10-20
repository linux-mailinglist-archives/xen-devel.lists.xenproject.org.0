Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE564BF26B9
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 18:28:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146808.1479170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsjd-0006sj-Vl; Mon, 20 Oct 2025 16:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146808.1479170; Mon, 20 Oct 2025 16:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsjd-0006pT-TD; Mon, 20 Oct 2025 16:27:49 +0000
Received: by outflank-mailman (input) for mailman id 1146808;
 Mon, 20 Oct 2025 16:27:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y5of=45=samsung.com=m.szyprowski@srs-se1.protection.inumbo.net>)
 id 1vAsja-0006o6-Va
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 16:27:48 +0000
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b12a7174-add1-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 18:27:39 +0200 (CEST)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20251020162737euoutp01a7ea5ea3a3593576d6931ec88825e51e~wP9lezYs81013510135euoutp01e;
 Mon, 20 Oct 2025 16:27:37 +0000 (GMT)
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20251020162736eucas1p1ef138572570fd17f7ba8cf6e6bc78ba6~wP9lIhm7s0044200442eucas1p1L;
 Mon, 20 Oct 2025 16:27:36 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20251020162733eusmtip2068f969d861135995e1cd515194afc64~wP9hxNWHW2552125521eusmtip2Y;
 Mon, 20 Oct 2025 16:27:33 +0000 (GMT)
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
X-Inumbo-ID: b12a7174-add1-11f0-980a-7dc792cee155
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251020162737euoutp01a7ea5ea3a3593576d6931ec88825e51e~wP9lezYs81013510135euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760977657;
	bh=e1+m70MIpIyLz0CgkjVmG+Zs9EMNilUICX9qZOez4wM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=KX6ZcktJJB15hpYlnrrgQKN5QMQizY7xdPAAhwp/El6wk7EM1ZJ6O6Pj837PofyJ0
	 migBg+i6L8vxe8bZ5F9hMcPUSOwsRbNZdnHxT7YLQRx589Age6y9jtnUV7j+rxCbcf
	 lscFl8Zw2Bwk6HlnV8xYW2UgmAXjN9fs/Wr5RS2Y=
Message-ID: <4a47088d-6542-45f2-917b-c91f7dd1eb1a@samsung.com>
Date: Mon, 20 Oct 2025 18:27:32 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v5 00/14] Remove DMA map_page/map_resource and their
 unmap callbacks
To: Leon Romanovsky <leon@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Richard Henderson
	<richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Geoff Levand <geoff@infradead.org>, "David S.
 Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Thomas
	Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
	Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org,
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org, Magnus Lindholm <linmag7@gmail.com>, Jason
	Gunthorpe <jgg@ziepe.ca>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251020162736eucas1p1ef138572570fd17f7ba8cf6e6bc78ba6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d
X-EPHeader: CA
X-CMS-RootMailID: 20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d
References: <CGME20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d@eucas1p2.samsung.com>
	<20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>

Dear All,

On 15.10.2025 11:12, Leon Romanovsky wrote:
> This series is a combination of previous two steps [1, 2] to reduce
> number of accesses to struct page in the code "below" DMA layer.
>
> In this series, the DMA .map_page/.map_resource/.unmap_page/.unmap_resource
> callbacks are converted to newly introduced .map_phys/.unmap_phys interfaces.

I would like to have some acks from respective arch maintainers before 
applying this patchset.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


