Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE9970976B
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 14:42:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537045.835780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzzQF-0000Wr-Py; Fri, 19 May 2023 12:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537045.835780; Fri, 19 May 2023 12:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzzQF-0000Tx-NG; Fri, 19 May 2023 12:41:27 +0000
Received: by outflank-mailman (input) for mailman id 537045;
 Fri, 19 May 2023 12:41:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jOyF=BI=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1pzzQE-0000Tb-33
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 12:41:26 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75787794-f642-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 14:41:22 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A400368C7B; Fri, 19 May 2023 14:41:18 +0200 (CEST)
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
X-Inumbo-ID: 75787794-f642-11ed-8611-37d641c3527e
Date: Fri, 19 May 2023 14:41:18 +0200
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
Message-ID: <20230519124118.GA5869@lst.de>
References: <20230518134253.909623-1-hch@lst.de> <20230518134253.909623-3-hch@lst.de> <ZGZr/xgbUmVqpOpN@mail-itl> <20230519040405.GA10818@lst.de> <ZGdLErBzi9MANL3i@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZGdLErBzi9MANL3i@mail-itl>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, May 19, 2023 at 12:10:26PM +0200, Marek Marczykowski-Górecki wrote:
> While I would say PCI passthrough is not very common for PV guests, can
> the decision about xen-swiotlb be delayed until you can enumerate
> xenstore to check if there are any PCI devices connected (and not
> allocate xen-swiotlb by default if there are none)? This would
> still not cover the hotplug case (in which case, you'd need to force it
> with a cmdline), but at least you wouldn't loose much memory just
> because one of your VMs may use PCI passthrough (so, you have it enabled
> in your kernel).

How early can we query xenstore?  We'd need to do this before setting
up DMA for any device.

The alternative would be to finally merge swiotlb-xen into swiotlb, in
which case we might be able to do this later.  Let me see what I can
do there.

