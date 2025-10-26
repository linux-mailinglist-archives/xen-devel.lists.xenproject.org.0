Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A45F5C0A436
	for <lists+xen-devel@lfdr.de>; Sun, 26 Oct 2025 08:39:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151312.1481938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCvKp-0006Og-Sd; Sun, 26 Oct 2025 07:38:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151312.1481938; Sun, 26 Oct 2025 07:38:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCvKp-0006MH-PP; Sun, 26 Oct 2025 07:38:39 +0000
Received: by outflank-mailman (input) for mailman id 1151312;
 Sun, 26 Oct 2025 07:38:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W+PR=5D=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1vCvKo-0006MB-Km
 for xen-devel@lists.xenproject.org; Sun, 26 Oct 2025 07:38:38 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6eca9b4-b23e-11f0-9d16-b5c5bf9af7f9;
 Sun, 26 Oct 2025 08:38:35 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 10582602B6;
 Sun, 26 Oct 2025 07:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBEC0C4CEE7;
 Sun, 26 Oct 2025 07:38:31 +0000 (UTC)
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
X-Inumbo-ID: c6eca9b4-b23e-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761464312;
	bh=tE6duDWkMhf/izPfcVJAu0QGF5RniuWMZJNurHMPV4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m+Fmvy/TkbKsHE/ly3nNuV5cMvplX6wPfLQ8hDaDmyX3wLacnUE7JOG/nZvuUxvmv
	 CczVISfw5M2fl/jL4dxMpQZjR+1heTwgUYiFF7wTs743d7UeCv0GILFXzjGlxgVBC0
	 oE76qdMbU/6QmYSolZLhh/1ehXnuAH4Wfx1TxENucSoXAohh6TFciSEQZaKMP7NYm1
	 JNqz8+TYhassoC4ST69Mi5FA0Qr+hRmr+2UhbjR5EKFyOegX19oAs4ZZ/0v57u0VQ0
	 /l9R6yk8RlGVj+rmA/30TcaUiEVUwLELSxYEgJrK1wn3ZV8WITcnHNlOkzodvgsSHW
	 uuxeQvWuJFb7A==
Date: Sun, 26 Oct 2025 09:38:28 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	Magnus Lindholm <linmag7@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v5 00/14] Remove DMA map_page/map_resource and their
 unmap callbacks
Message-ID: <20251026073828.GC12554@unreal>
References: <CGME20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d@eucas1p2.samsung.com>
 <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
 <4a47088d-6542-45f2-917b-c91f7dd1eb1a@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a47088d-6542-45f2-917b-c91f7dd1eb1a@samsung.com>

On Mon, Oct 20, 2025 at 06:27:32PM +0200, Marek Szyprowski wrote:
> Dear All,
> 
> On 15.10.2025 11:12, Leon Romanovsky wrote:
> > This series is a combination of previous two steps [1, 2] to reduce
> > number of accesses to struct page in the code "below" DMA layer.
> >
> > In this series, the DMA .map_page/.map_resource/.unmap_page/.unmap_resource
> > callbacks are converted to newly introduced .map_phys/.unmap_phys interfaces.
> 
> I would like to have some acks from respective arch maintainers before 
> applying this patchset.

If to judge by git log and lore for some of these arch (didn't check all),
you won't get any response and will need to make a call by yourself.

Thanks

> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 

