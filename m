Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FF8B96FCA
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 19:18:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128612.1468916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v16er-0005lc-H7; Tue, 23 Sep 2025 17:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128612.1468916; Tue, 23 Sep 2025 17:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v16er-0005jj-D8; Tue, 23 Sep 2025 17:18:29 +0000
Received: by outflank-mailman (input) for mailman id 1128612;
 Tue, 23 Sep 2025 17:18:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MsMN=4C=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1v16ep-0005ja-UK
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 17:18:27 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fc291af-98a1-11f0-9809-7dc792cee155;
 Tue, 23 Sep 2025 19:18:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4D74B447D6;
 Tue, 23 Sep 2025 17:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76194C4CEF5;
 Tue, 23 Sep 2025 17:18:22 +0000 (UTC)
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
X-Inumbo-ID: 4fc291af-98a1-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758647903;
	bh=1ANX/1Q+c1YQm6ycMdbCkLhJt5M0dGUVsHIE7DPPmR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5Jqi9yueMAnnH73toGC0xOJKxvg0qa4gga/SeRhYNDlfhLJMDwAYoyYF5OeZMllT
	 4wGYFwIT9tNhvxI7Fwmxeam4DFzzKoOpEvYF6KzT3sugNB9IZN5QFtnFbWNJKdyahQ
	 njhRkpS4V2fDEMCIbaKPb5Fvro/sH2PrgzN3QArdRquI6/hD8MqkvT+BpL3TaOekdf
	 ivzyZBCGcNieZxwvItwvCdr8sC9432gSLRdJ+Qt9NVztv9FJs9EoyOLvflbrcT7TLo
	 fCDKOXnJOo3pz8pFrFpZX02l/lSsNuJ1YSx2nfsXC1cIkAfhePf3pibh9dO8eHGKV8
	 GZaMzjVv7a/9Q==
Date: Tue, 23 Sep 2025 20:18:19 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Magnus Lindholm <linmag7@gmail.com>
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
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical
 address
Message-ID: <20250923171819.GM10800@unreal>
References: <cover.1758219786.git.leon@kernel.org>
 <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>

On Mon, Sep 22, 2025 at 11:04:06PM +0200, Magnus Lindholm wrote:
> On Thu, Sep 18, 2025 at 8:45 PM Leon Romanovsky <leon@kernel.org> wrote:
> >
> > From: Leon Romanovsky <leonro@nvidia.com>
> >
> > Alpha doesn't need struct *page and can perform mapping based on
> > physical addresses. So convert it to implement new .map_phys callback.
> 
> 
> Hi,
> 
> SInce this patch affects the Alpha platform I got curious and decided to
> try it out. The patch series requires some preparatory patches. Leon
> provided me with links to his dmabuf-vfio branch, which had the
> patches (and some prerequisite stuff) applied already.
> 
> Based on the dmabuf-vfio branch,  I've built a kernel and tested it on
> my ES40 Alphaserver, the kernel booted fine but after a while of
> moderate filesystem load I started seeing some ext3/4 related error
> messages in the system logs. Rebooting with my old kernel into
> single user mode, I was able to recover the filesystem using fsck.
> Clearly this set of patches breaks things (at least on Alpha).

I will try to setup Alpha architecture in QEMU in following days, but
would like to ask first. Did you test alpha on clean v6.17-rc5 (without
my patches) as a reference?

Thanks

