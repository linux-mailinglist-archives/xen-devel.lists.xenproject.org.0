Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24513C198C8
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 11:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152582.1483124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE2z2-0008CD-BY; Wed, 29 Oct 2025 10:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152582.1483124; Wed, 29 Oct 2025 10:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE2z2-0008Ap-8p; Wed, 29 Oct 2025 10:00:48 +0000
Received: by outflank-mailman (input) for mailman id 1152582;
 Wed, 29 Oct 2025 10:00:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8R8D=5G=samsung.com=m.szyprowski@srs-se1.protection.inumbo.net>)
 id 1vE2z0-0008Ai-Ey
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 10:00:47 +0000
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fe18768-b4ae-11f0-980a-7dc792cee155;
 Wed, 29 Oct 2025 11:00:41 +0100 (CET)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20251029100039euoutp022901308f3eab82458d8910c81b526532~y7fTFrdGq2797727977euoutp027;
 Wed, 29 Oct 2025 10:00:39 +0000 (GMT)
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20251029100038eucas1p2fe4a84df0bc07dc1cd96f49b4f740618~y7fRb9PRk1129911299eucas1p2W;
 Wed, 29 Oct 2025 10:00:38 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251029100034eusmtip1f745a429892e79db9ec765d9fa07cdc8~y7fOJa_AZ2915029150eusmtip1F;
 Wed, 29 Oct 2025 10:00:34 +0000 (GMT)
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
X-Inumbo-ID: 1fe18768-b4ae-11f0-980a-7dc792cee155
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251029100039euoutp022901308f3eab82458d8910c81b526532~y7fTFrdGq2797727977euoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761732039;
	bh=Lz0Rir68dfVLNeA+kqLkIpgtVfATL7Zz4GqfoJVdUA8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Q8nA+g0P0Lp8yYsVx23P8MkKmaRp5d92Nf+2imBS2NlZqa8/5ThIee3tXBOiLNt99
	 PjQedQ0JFXgKyV+emfETcayFtfRKIpSeQMZ0pgMqy9Wn3IoNaAw6sZ7VjxwGv7ehjb
	 3V9ekRK8wOTbOvttHwAsGVylPABrI1wC7ZTCqE2c=
Message-ID: <5e6eb6f0-fbbb-4359-9c40-075b25231e0d@samsung.com>
Date: Wed, 29 Oct 2025 11:00:33 +0100
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
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251029100038eucas1p2fe4a84df0bc07dc1cd96f49b4f740618
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d
X-EPHeader: CA
X-CMS-RootMailID: 20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d
References: <CGME20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d@eucas1p2.samsung.com>
	<20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>

On 15.10.2025 11:12, Leon Romanovsky wrote:
> This series is a combination of previous two steps [1, 2] to reduce
> number of accesses to struct page in the code "below" DMA layer.
>
> In this series, the DMA .map_page/.map_resource/.unmap_page/.unmap_resource
> callbacks are converted to newly introduced .map_phys/.unmap_phys interfaces.
>
> Thanks
>
> [1] https://lore.kernel.org/all/cover.1758203802.git.leon@kernel.org
> [2] https://lore.kernel.org/all/cover.1759071169.git.leon@kernel.org

Applied to dma-mapping-for-next branch.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


