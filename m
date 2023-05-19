Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3417097DE
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 14:59:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537057.835809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzzhH-0002nH-Jh; Fri, 19 May 2023 12:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537057.835809; Fri, 19 May 2023 12:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzzhH-0002kK-GK; Fri, 19 May 2023 12:59:03 +0000
Received: by outflank-mailman (input) for mailman id 537057;
 Fri, 19 May 2023 12:59:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jOyF=BI=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1pzzhF-0002kE-IN
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 12:59:01 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec76cf31-f644-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 14:59:00 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 725BF68C7B; Fri, 19 May 2023 14:58:57 +0200 (CEST)
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
X-Inumbo-ID: ec76cf31-f644-11ed-b22d-6b7b168915f2
Date: Fri, 19 May 2023 14:58:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>,
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
Message-ID: <20230519125857.GA6994@lst.de>
References: <20230518134253.909623-1-hch@lst.de> <20230518134253.909623-3-hch@lst.de> <ZGZr/xgbUmVqpOpN@mail-itl> <20230519040405.GA10818@lst.de> <ZGdLErBzi9MANL3i@mail-itl> <20230519124118.GA5869@lst.de> <8617570c-6dc4-74f5-7418-98f04f7e0ece@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8617570c-6dc4-74f5-7418-98f04f7e0ece@citrix.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, May 19, 2023 at 01:49:46PM +0100, Andrew Cooper wrote:
> > The alternative would be to finally merge swiotlb-xen into swiotlb, in
> > which case we might be able to do this later.  Let me see what I can
> > do there.
> 
> If that is an option, it would be great to reduce the special-cashing.

I think it's doable, and I've been wanting it for a while.  I just
need motivated testers, but it seems like I just found at least two :)

