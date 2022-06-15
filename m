Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0E554CA12
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 15:44:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350127.576358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1TIj-0006rU-Qp; Wed, 15 Jun 2022 13:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350127.576358; Wed, 15 Jun 2022 13:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1TIj-0006o2-Nd; Wed, 15 Jun 2022 13:43:17 +0000
Received: by outflank-mailman (input) for mailman id 350127;
 Wed, 15 Jun 2022 13:43:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGfn=WW=bombadil.srs.infradead.org=BATV+cd04db8a85bff7cd13dc+6870+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1o1TIh-0006nv-9g
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 13:43:16 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1956d14c-ecb1-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 15:43:13 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o1TIc-00ElmM-Nl; Wed, 15 Jun 2022 13:43:10 +0000
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
X-Inumbo-ID: 1956d14c-ecb1-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9m0Yel3mKJUR0/9WLy9YG0v6kS0HnL5HFztBLkukfhU=; b=l5pMXoObGe9qCoN1JNmE4rMH8z
	CptrHdOdY0cHpAWepueUiYpA9ETdVP8UOjDY3K6o2t+eaxcm3lmVTzhQfxmAiRDh5s6GklPirU7qc
	7ItQTcUBhxkYiBo455aSSoG68s+N4EKRxBFhfDWelNWPOE1w3kOg0eYS18ESpI2iQwLAJHWmsN4iF
	PdbDG+CjA5QulntLirJsSzM9fKo7qUXPNgDWagSbJtr5R4znSLP1Gra8zg/HL7JXLdR/QCQHPggMG
	3j2UL7hEyIHJ8BuZ8rshW8HmAUOh7wJO1zCXDgpfqC3zV/6c6BS72/yDmGVaddn7Zq5ycCgaZ4DNy
	cpqCY3lA==;
Date: Wed, 15 Jun 2022 06:43:10 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: Christoph Hellwig <hch@infradead.org>, xen-devel@lists.xenproject.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] xen: don't require virtio with grants for non-PV guests
Message-ID: <Yqnh7vjO8iT4/fiK@infradead.org>
References: <20220615084835.27113-1-jgross@suse.com>
 <YqnBZhiLOHnoalbC@infradead.org>
 <9b9785f5-085b-0882-177f-d8418c366beb@suse.com>
 <YqnCZ+EKZeZ5AEnr@infradead.org>
 <c5a521e0-26b1-b1d6-7f7d-00aa9b4b1e0e@suse.com>
 <YqnIWCXxsGzkfQp7@infradead.org>
 <ab0653bc-7728-e24c-5d83-78cee135528c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab0653bc-7728-e24c-5d83-78cee135528c@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Jun 15, 2022 at 02:53:54PM +0200, Juergen Gross wrote:
> On 15.06.22 13:54, Christoph Hellwig wrote:
> > On Wed, Jun 15, 2022 at 01:39:01PM +0200, Juergen Gross wrote:
> > > No, it doesn't. I'm working on a qemu patch series enabling the qemu
> > > based backends to support grants with virtio. The code is working fine
> > > on x86, too (apart from the fact that the backends aren't ready yet).
> > 
> > The code right now in mainline only ever sets the ops for DMA.  So
> > I can't see how you could make it work.
> 
> Ah, you are right. I was using a guest with an older version of the series.
> Sorry for the noise.

No problem.  But whatever you end up using to enable the grant DMA
ops n x86 should also require the platform access feature.  We already
have that information so we can make use of it.

