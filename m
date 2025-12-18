Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A4ACCAF35
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 09:40:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189325.1510118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vW9YT-0004C6-Mp; Thu, 18 Dec 2025 08:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189325.1510118; Thu, 18 Dec 2025 08:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vW9YT-000491-Ji; Thu, 18 Dec 2025 08:40:13 +0000
Received: by outflank-mailman (input) for mailman id 1189325;
 Thu, 18 Dec 2025 08:40:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRjX=6Y=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1vW9YR-00048t-U7
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 08:40:11 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28a7b22b-dbed-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 09:40:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9D01A4405A;
 Thu, 18 Dec 2025 08:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4B5C4CEFB;
 Thu, 18 Dec 2025 08:40:06 +0000 (UTC)
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
X-Inumbo-ID: 28a7b22b-dbed-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766047207;
	bh=ofPz3WZxF0qhrxc5N6KO0WklVZWUMGP/4at4uzuCx5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rmVVJePJGXR+kQkm3+r1Kbt0GyikF3QfUnymI7CCZrHKsRgARfO2o2ba2kB+bpPCT
	 UHrvTWZoxuQAIRQXxc9I5NeoAcCrZBmmcrAlJnug5BaQTQvVwVqvaJjDuY33ZMzoy6
	 BAr6jLOIpi2I8WC82e6kp81I8nrCa8WqCHQlSBTqZwv7g1LhXawg+JG4WGZSyz9t7l
	 lUOt/NCn0KCw0dStvCGVQTawL+HWAy5Lrwn0Gx39IwmYRZLbytZdLLUDYSPzigtubq
	 ZxR25apmkkEWekeoA8W1U6GFN06j4Og1ARDAkIDWxQbraNlGOfxULa77Gl1qMs8cke
	 OZqPmHVBTqbAw==
Date: Thu, 18 Dec 2025 10:40:02 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
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
	Jason Gunthorpe <jgg@ziepe.ca>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v5 09/14] parisc: Convert DMA map_page to map_phys
 interface [qemu test failure]
Message-ID: <20251218084002.GD39046@unreal>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
 <20251015-remove-map-page-v5-9-3bbfe3a25cdf@kernel.org>
 <b184f1bf-96dc-4546-8512-9cba5ecb58f7@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b184f1bf-96dc-4546-8512-9cba5ecb58f7@roeck-us.net>

On Wed, Dec 17, 2025 at 04:17:38AM -0800, Guenter Roeck wrote:
> Hi,
> 
> On Wed, Oct 15, 2025 at 12:12:55PM +0300, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Perform mechanical conversion from .map_page to .map_phys callback.
> > 
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> 
> This patch causes all my 32-bit parisc qemu tests with C3700 machine
> to fail. Network interface tests fail, and all boot attempts from
> any kind of hard drive (scsi, usb) fail with this patch in the tree.

Thanks for the report. I have a fix ready; I'll clean it up and send it out
by EOD.

> 
> Guenter

