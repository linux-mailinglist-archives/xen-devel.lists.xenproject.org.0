Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0E0BA7437
	for <lists+xen-devel@lfdr.de>; Sun, 28 Sep 2025 17:31:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132554.1470881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2tMm-0004F9-4j; Sun, 28 Sep 2025 15:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132554.1470881; Sun, 28 Sep 2025 15:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2tMm-0004DX-1c; Sun, 28 Sep 2025 15:31:12 +0000
Received: by outflank-mailman (input) for mailman id 1132554;
 Sun, 28 Sep 2025 15:31:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zTFj=4H=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1v2tMk-0004DR-Ft
 for xen-devel@lists.xenproject.org; Sun, 28 Sep 2025 15:31:10 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2763bed2-9c80-11f0-9809-7dc792cee155;
 Sun, 28 Sep 2025 17:31:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7AB1A6218F;
 Sun, 28 Sep 2025 15:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FAEC4CEF5;
 Sun, 28 Sep 2025 15:31:06 +0000 (UTC)
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
X-Inumbo-ID: 2763bed2-9c80-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759073467;
	bh=lGCIsTrsyWZ8QOPIKq8I5fg/cOuQCrmM7ZcLWOcdn9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o16pSV0PpKM0QT5VYemmYPv3rNvw+gxL11Fj3yidIo2Gut35r6WcPhG9ZUyHgf10N
	 HDoUvAriBjQKKzLaUqSq/NvZQviTbP6Clkx6YJlm8tmGye4n+XchUKfL6k9zPTRZMV
	 TDipWjxyMkDPns3af7oj7M+e1Jre+95S/Gx9tN+Vm4PlrusP/lU9slnofDh6/ZsSSX
	 kT5XAqaDTqgR+UVNQA8g7H75XmRpBDadQzy2MAo6TwB1QXQn4VdvPL1TspAL2PuX9a
	 zblg3faGha9PBO5W1YWwMCeUXrGEmQnur9K8XOOjy19L+pJZmPK1bf0y+sm4i/+kU3
	 fsu9L2JRJahmg==
Date: Sun, 28 Sep 2025 18:31:03 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>, iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev, x86@kernel.org,
	xen-devel@lists.xenproject.org, Magnus Lindholm <linmag7@gmail.com>
Subject: Re: [PATCH v1 9/9] dma-mapping: remove unused map_page callback
Message-ID: <20250928153103.GB324804@unreal>
References: <cover.1759071169.git.leon@kernel.org>
 <27727b8ef9b3ad55a3a28f9622a62561c9988335.1759071169.git.leon@kernel.org>
 <20250928151725.GA135708@ravnborg.org>
 <20250928152030.GA136019@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928152030.GA136019@ravnborg.org>

On Sun, Sep 28, 2025 at 05:20:30PM +0200, Sam Ravnborg wrote:
> Hi Leon.
> 
> On Sun, Sep 28, 2025 at 05:17:25PM +0200, Sam Ravnborg wrote:
> > Hi Leon.
> > 
> > On Sun, Sep 28, 2025 at 06:02:29PM +0300, Leon Romanovsky wrote:
> > > From: Leon Romanovsky <leonro@nvidia.com>
> > > 
> > > After conversion of arch code to use physical address mapping,
> > > there are no users of .map_page() and .unmap_page() callbacks,
> > > so let's remove them.
> > > 
> > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > ---
> > >  include/linux/dma-map-ops.h |  7 -------
> > >  kernel/dma/mapping.c        | 12 ------------
> > >  kernel/dma/ops_helpers.c    |  8 +-------
> > >  3 files changed, 1 insertion(+), 26 deletions(-)
> > 
> > It looks like you missed a few sparc32 bits:
> 
> They were included, but the patch is named sparc64,
> which is why I missed it.
> 
> If you could rename the patch that would be nice.

Let's see if new version is required.

Thanks

> 
> 	Sam
> 

