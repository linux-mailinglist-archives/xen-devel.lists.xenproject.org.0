Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6622BBA73E6
	for <lists+xen-devel@lfdr.de>; Sun, 28 Sep 2025 17:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132527.1470861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2tCV-0001Tz-Sj; Sun, 28 Sep 2025 15:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132527.1470861; Sun, 28 Sep 2025 15:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2tCV-0001SW-PT; Sun, 28 Sep 2025 15:20:35 +0000
Received: by outflank-mailman (input) for mailman id 1132527;
 Sun, 28 Sep 2025 15:20:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vhgl=4H=ravnborg.org=sam@srs-se1.protection.inumbo.net>)
 id 1v2tCU-0001SQ-4w
 for xen-devel@lists.xenproject.org; Sun, 28 Sep 2025 15:20:34 +0000
Received: from mailrelay-egress4.pub.mailoutpod2-cph3.one.com
 (mailrelay-egress4.pub.mailoutpod2-cph3.one.com [2a02:2350:5:403::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acd3cc4d-9c7e-11f0-9d14-b5c5bf9af7f9;
 Sun, 28 Sep 2025 17:20:33 +0200 (CEST)
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net
 [2.105.16.150])
 by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id ab2e7cf9-9c7e-11f0-845a-494313b7f784;
 Sun, 28 Sep 2025 15:20:31 +0000 (UTC)
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
X-Inumbo-ID: acd3cc4d-9c7e-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1759072832; x=1759677632;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=Ghyryt2xK5vvnvf4Q2js9Uw55oy6LtaOfQDvQKr1uy0=;
	b=CtT4iU2T9YA3xTrD4cIA+BE+C15rUkNnZplc587YI58g+wt9Z/k8mKxjom62woRw7fEUsvfTw8Ego
	 OORUvh9fiJQumZdtSymONvY5MMtJ3KJXP3zsnj3KxJxk4Oiw+38jzutzIsRmg9a15NqXsODmCWj0BM
	 /EaEWRy/uNU7FXsutNnhv+ixhqzFL2HZhBJwBMscK6dVEUiiXxvphkGrAHhj1qC784KABlOh0D02mA
	 4cLaxB8a5GgAT75FDK3kfCkRHDAAi479jPbM5IFPQLlR8lLKW/rv/Z+yeGIJUaeXNjpvPYpXFP9UyV
	 lTS7L9y3fNmnKV3eKZ72pOl8CYKOBDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1759072832; x=1759677632;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=Ghyryt2xK5vvnvf4Q2js9Uw55oy6LtaOfQDvQKr1uy0=;
	b=J0+KaShsfwnmVbs3PB0EalU1KScQKZ0oCMj0q/S47VSr8rYDdT1FCDrtDwmZlUzToU5sipbu8KD09
	 RgZbdwtBQ==
X-HalOne-ID: ab2e7cf9-9c7e-11f0-845a-494313b7f784
Date: Sun, 28 Sep 2025 17:20:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
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
Message-ID: <20250928152030.GA136019@ravnborg.org>
References: <cover.1759071169.git.leon@kernel.org>
 <27727b8ef9b3ad55a3a28f9622a62561c9988335.1759071169.git.leon@kernel.org>
 <20250928151725.GA135708@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928151725.GA135708@ravnborg.org>

Hi Leon.

On Sun, Sep 28, 2025 at 05:17:25PM +0200, Sam Ravnborg wrote:
> Hi Leon.
> 
> On Sun, Sep 28, 2025 at 06:02:29PM +0300, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > After conversion of arch code to use physical address mapping,
> > there are no users of .map_page() and .unmap_page() callbacks,
> > so let's remove them.
> > 
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  include/linux/dma-map-ops.h |  7 -------
> >  kernel/dma/mapping.c        | 12 ------------
> >  kernel/dma/ops_helpers.c    |  8 +-------
> >  3 files changed, 1 insertion(+), 26 deletions(-)
> 
> It looks like you missed a few sparc32 bits:

They were included, but the patch is named sparc64,
which is why I missed it.

If you could rename the patch that would be nice.

	Sam

