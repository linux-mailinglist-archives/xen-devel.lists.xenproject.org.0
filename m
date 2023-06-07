Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BF87260D4
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 15:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544770.850760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6syF-0003QP-Pw; Wed, 07 Jun 2023 13:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544770.850760; Wed, 07 Jun 2023 13:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6syF-0003Oa-Kp; Wed, 07 Jun 2023 13:13:03 +0000
Received: by outflank-mailman (input) for mailman id 544770;
 Wed, 07 Jun 2023 13:13:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=27QN=B3=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1q6syE-0003OU-Q8
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 13:13:02 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06f042b7-0535-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 15:13:00 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 33B3F6732D; Wed,  7 Jun 2023 15:12:58 +0200 (CEST)
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
X-Inumbo-ID: 06f042b7-0535-11ee-8611-37d641c3527e
Date: Wed, 7 Jun 2023 15:12:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Christoph Hellwig <hch@lst.de>,
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
Message-ID: <20230607131257.GB19206@lst.de>
References: <20230518134253.909623-1-hch@lst.de> <20230518134253.909623-3-hch@lst.de> <ZGZr/xgbUmVqpOpN@mail-itl> <20230519040405.GA10818@lst.de> <ZGdLErBzi9MANL3i@mail-itl> <c5defff8-882e-3482-0de1-e50a4bcdfa99@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5defff8-882e-3482-0de1-e50a4bcdfa99@suse.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, May 22, 2023 at 10:37:09AM +0200, Juergen Gross wrote:
> In normal cases PCI passthrough in PV guests requires to start the guest
> with e820_host=1. So it should be rather easy to limit allocating the
> 64MB in PV guests to the cases where the memory map has non-RAM regions
> especially in the first 1MB of the memory.
>
> This will cover even hotplug cases. The only case not covered would be a
> guest started with e820_host=1 even if no PCI passthrough was planned.
> But this should be rather rare (at least I hope so).

So is this an ACK for the patch and can we go ahead with it?

(I'd still like to merge swiotlb-xen into swiotlb eventually, but it's
probably not going to happen this merge window)

