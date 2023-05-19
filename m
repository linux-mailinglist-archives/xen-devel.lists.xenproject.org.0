Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C05A708E88
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 06:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536655.835200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzrLf-0004tZ-C4; Fri, 19 May 2023 04:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536655.835200; Fri, 19 May 2023 04:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzrLf-0004qM-8k; Fri, 19 May 2023 04:04:11 +0000
Received: by outflank-mailman (input) for mailman id 536655;
 Fri, 19 May 2023 04:04:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jOyF=BI=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1pzrLe-0004qG-DW
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 04:04:10 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34096fef-f5fa-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 06:04:08 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6AB6268AFE; Fri, 19 May 2023 06:04:05 +0200 (CEST)
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
X-Inumbo-ID: 34096fef-f5fa-11ed-b22d-6b7b168915f2
Date: Fri, 19 May 2023 06:04:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Christoph Hellwig <hch@lst.de>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 2/4] x86: always initialize xen-swiotlb when
 xen-pcifront is enabling
Message-ID: <20230519040405.GA10818@lst.de>
References: <20230518134253.909623-1-hch@lst.de> <20230518134253.909623-3-hch@lst.de> <ZGZr/xgbUmVqpOpN@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZGZr/xgbUmVqpOpN@mail-itl>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, May 18, 2023 at 08:18:39PM +0200, Marek Marczykowski-Górecki wrote:
> On Thu, May 18, 2023 at 03:42:51PM +0200, Christoph Hellwig wrote:
> > Remove the dangerous late initialization of xen-swiotlb in
> > pci_xen_swiotlb_init_late and instead just always initialize
> > xen-swiotlb in the boot code if CONFIG_XEN_PCIDEV_FRONTEND is enabled.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Doesn't it mean all the PV guests will basically waste 64MB of RAM
> by default each if they don't really have PCI devices?

If CONFIG_XEN_PCIDEV_FRONTEND is enabled, and the kernel's isn't booted
with swiotlb=noforce, yes.


