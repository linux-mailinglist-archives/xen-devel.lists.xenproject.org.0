Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28651BA703E
	for <lists+xen-devel@lfdr.de>; Sun, 28 Sep 2025 13:59:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132332.1470711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2q3J-0002vm-A0; Sun, 28 Sep 2025 11:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132332.1470711; Sun, 28 Sep 2025 11:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2q3J-0002tg-7P; Sun, 28 Sep 2025 11:58:53 +0000
Received: by outflank-mailman (input) for mailman id 1132332;
 Sun, 28 Sep 2025 11:58:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zTFj=4H=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1v2q3I-0002t0-0E
 for xen-devel@lists.xenproject.org; Sun, 28 Sep 2025 11:58:52 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c485856-9c62-11f0-9809-7dc792cee155;
 Sun, 28 Sep 2025 13:58:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5115341742;
 Sun, 28 Sep 2025 11:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A70C4CEF0;
 Sun, 28 Sep 2025 11:58:43 +0000 (UTC)
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
X-Inumbo-ID: 7c485856-9c62-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759060724;
	bh=ckjBiIEK8WR9Yy3qbX0tVHWjgl/Q5LNywAArQuLUpqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U3I0kHgXcdhzV3J3cNm+QKWfB7QdY/mTy0ouL3HOv+J3sqJIvuS62SQl+z8PL8YWd
	 qfUAdkBs6D1YVhXVJ6bRrI78Xzyj0CsANEvMURlDviJn8dx5FGPrwxmhdVbcvknSpY
	 WdO4NFZz1RZzNrsKib9CkR4lkxgnoFLn75s77V+99fxEfk9i3VsSTBqugUgy80mDqz
	 s7XhyMEqmiXf1xj53ZxtEanbtM7nq83+tdm/Us5QkUfCxJcUjJXNQqj0gYs2gvwuDO
	 7AiJl/EpeN0s5CHrA/1lJBsV9nH+GOe/f6lIQ8rlBPFFhXVhSL5WKAz8toK1YCzvbK
	 VIIytYUCCbdng==
Date: Sun, 28 Sep 2025 14:58:38 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
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
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical
 address
Message-ID: <20250928115838.GF12165@unreal>
References: <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
 <20250923171819.GM10800@unreal>
 <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
 <20250923235318.GD2617119@nvidia.com>
 <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
 <CA+=Fv5Sze_BNmHqzypmCh8p2JO6gytXH4E6hXv3gZdfoSJsMUQ@mail.gmail.com>
 <CA+=Fv5TF+RTPEkQEmVd0_=B9xbqKycLz3ck3UwcPDqacezYfFQ@mail.gmail.com>
 <20250928105413.GE12165@unreal>
 <CA+=Fv5Rnk5RaGU9R_65izNOJOns9w_eEzetH9kBF_MaRgdhLAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+=Fv5Rnk5RaGU9R_65izNOJOns9w_eEzetH9kBF_MaRgdhLAA@mail.gmail.com>

On Sun, Sep 28, 2025 at 01:27:12PM +0200, Magnus Lindholm wrote:
> > Thanks for the effort.
> >
> > Can you please check the following change instead of reverting the patches?
> >
> 
> No problem, happy to assist. I think this did the trick! preliminary
> testing shows
> that this now works on alpha! I guess the offset information in paddr was lost
> by doing "paddr &= PAGE_MASK" before retrieving the offset, well spotted!
> 
> I'll keep running the system with some load to make sure there is nothing else
> we haven't spotted yet, but so far so good. I'll keep you posted.
> 
> Will you be putting out a v2 of this patchset with these updates?

Yes, will try to send today. 

Thanks again for your help.

> 
> Regards
> 
> Magnus Lindholm

