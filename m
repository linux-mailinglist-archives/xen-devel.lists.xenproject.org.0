Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76F84C6A82
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 12:31:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280455.478401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOeEs-0005kn-B6; Mon, 28 Feb 2022 11:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280455.478401; Mon, 28 Feb 2022 11:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOeEs-0005hn-7q; Mon, 28 Feb 2022 11:30:50 +0000
Received: by outflank-mailman (input) for mailman id 280455;
 Mon, 28 Feb 2022 11:30:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hgP/=TL=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1nOeEq-0005hR-NM
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 11:30:48 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df9d61c1-9889-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 12:30:47 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1E95C68AFE; Mon, 28 Feb 2022 12:30:43 +0100 (CET)
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
X-Inumbo-ID: df9d61c1-9889-11ec-8eba-a37418f5ba1a
Date: Mon, 28 Feb 2022 12:30:42 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Cc: Christoph Hellwig <hch@lst.de>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"x86@kernel.org" <x86@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"tboot-devel@lists.sourceforge.net" <tboot-devel@lists.sourceforge.net>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 08/11] swiotlb: make the swiotlb_init interface more
 useful
Message-ID: <20220228113042.GA10570@lst.de>
References: <20220227143055.335596-1-hch@lst.de> <20220227143055.335596-9-hch@lst.de> <MN0PR21MB309816A344171B46735CA29CD7019@MN0PR21MB3098.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN0PR21MB309816A344171B46735CA29CD7019@MN0PR21MB3098.namprd21.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Feb 28, 2022 at 02:53:39AM +0000, Michael Kelley (LINUX) wrote:
> From: Christoph Hellwig <hch@lst.de> Sent: Sunday, February 27, 2022 6:31 AM
> > 
> > Pass a bool to pass if swiotlb needs to be enabled based on the
> > addressing needs and replace the verbose argument with a set of
> > flags, including one to force enable bounce buffering.
> > 
> > Note that this patch removes the possibility to force xen-swiotlb
> > use using swiotlb=force on the command line on x86 (arm and arm64
> > never supported that), but this interface will be restored shortly.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  arch/arm/mm/init.c                     |  6 +----
> >  arch/arm64/mm/init.c                   |  6 +----
> >  arch/ia64/mm/init.c                    |  4 +--
> >  arch/mips/cavium-octeon/dma-octeon.c   |  2 +-
> >  arch/mips/loongson64/dma.c             |  2 +-
> >  arch/mips/sibyte/common/dma.c          |  2 +-
> >  arch/powerpc/include/asm/swiotlb.h     |  1 +
> >  arch/powerpc/mm/mem.c                  |  3 ++-
> >  arch/powerpc/platforms/pseries/setup.c |  3 ---
> >  arch/riscv/mm/init.c                   |  8 +-----
> >  arch/s390/mm/init.c                    |  3 +--
> >  arch/x86/kernel/cpu/mshyperv.c         |  8 ------
> >  arch/x86/kernel/pci-dma.c              | 15 ++++++-----
> >  arch/x86/mm/mem_encrypt_amd.c          |  3 ---
> >  drivers/xen/swiotlb-xen.c              |  4 +--
> >  include/linux/swiotlb.h                | 15 ++++++-----
> >  include/trace/events/swiotlb.h         | 29 ++++++++-------------
> >  kernel/dma/swiotlb.c                   | 35 ++++++++++++++------------
> >  18 files changed, 56 insertions(+), 93 deletions(-)
> 
> [snip]
> 
> > 
> > diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
> > index 5a99f993e6392..568274917f1cd 100644
> > --- a/arch/x86/kernel/cpu/mshyperv.c
> > +++ b/arch/x86/kernel/cpu/mshyperv.c
> > @@ -336,14 +336,6 @@ static void __init ms_hyperv_init_platform(void)
> >  			swiotlb_unencrypted_base = ms_hyperv.shared_gpa_boundary;
> >  #endif
> >  		}
> > -
> > -#ifdef CONFIG_SWIOTLB
> > -		/*
> > -		 * Enable swiotlb force mode in Isolation VM to
> > -		 * use swiotlb bounce buffer for dma transaction.
> > -		 */
> > -		swiotlb_force = SWIOTLB_FORCE;
> > -#endif
> 
> With this code removed, it's not clear to me what forces the use of the
> swiotlb in a Hyper-V isolated VM.  The code in pci_swiotlb_detect_4g() doesn't
> catch this case because cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT)
> returns "false" in a Hyper-V guest.  In the Hyper-V guest, it's only
> cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) that returns "true".  I'm
> looking more closely at the meaning of the CC_ATTR_* values, and it may
> be that Hyper-V should also return "true" for CC_ATTR_MEM_ENCRYPT,
> but I don't think CC_ATTR_HOST_MEM_ENCRYPT should return "true".

Ok, I assumed that CC_ATTR_HOST_MEM_ENCRYPT returned true in this case.
I guess we just need to check for CC_ATTR_GUEST_MEM_ENCRYPT as well
there?

