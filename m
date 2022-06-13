Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A99F547F57
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 08:06:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347733.574059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0dC6-0001li-GF; Mon, 13 Jun 2022 06:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347733.574059; Mon, 13 Jun 2022 06:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0dC6-0001jJ-DD; Mon, 13 Jun 2022 06:04:58 +0000
Received: by outflank-mailman (input) for mailman id 347733;
 Mon, 13 Jun 2022 06:04:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vSO8=WU=bombadil.srs.infradead.org=BATV+6ef1cfbcd5439e194ca7+6868+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1o0dC4-0001jD-CX
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 06:04:57 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd865bcc-eade-11ec-bd2c-47488cf2e6aa;
 Mon, 13 Jun 2022 08:04:53 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o0dBu-001aZ9-At; Mon, 13 Jun 2022 06:04:46 +0000
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
X-Inumbo-ID: bd865bcc-eade-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=b1PoY1uKlcNqy2edTiTsVL/coyRDE9FCOo38ncps/ZM=; b=asqORLv9fFtRmH0mbdAsX62PEY
	2oM2wjfo4NwjYVsp3GvIcXnsJO9DKRj8XCXW1E4suTxpr2g8LP73vdRMEKnbzqlgoyXVfnbMS54bD
	FBTwd3vKQ1myxZku0vIkaOTi9LwMJKMefz6tfktugd6A88h7XFJ8zVDM64ozYM6Q5rABwX6AKb2fa
	8zxSLwNzq9CLLB7mjw/mVXMIKzM5UZnMYu4GyUGLrYpMbVB2c2wQRdURbri0g+CmKZJ4dWe95IH7X
	ApNaap56yK/FeNrP1odSM3lUI36xBVvmY3EYL/xIb/6e2D8T1L0tLE8e0+gIuJwvSLdsxahG1pSYz
	SAgdlhuA==;
Date: Sun, 12 Jun 2022 23:04:46 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, x86@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
	jgross@suse.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, sstabellini@kernel.org,
	mpe@ellerman.id.au, konrad.wilk@oracle.com, mst@redhat.com,
	jasowang@redhat.com, joe.jin@oracle.com
Subject: Re: [PATCH RFC v1 4/7] swiotlb: to implement io_tlb_high_mem
Message-ID: <YqbTfi/h2P24ynQZ@infradead.org>
References: <20220609005553.30954-1-dongli.zhang@oracle.com>
 <20220609005553.30954-5-dongli.zhang@oracle.com>
 <YqF/sphJj6n+22Si@infradead.org>
 <e6345c27-78fd-be72-9551-1d1fd5db37a4@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6345c27-78fd-be72-9551-1d1fd5db37a4@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Jun 10, 2022 at 02:56:08PM -0700, Dongli Zhang wrote:
> Since this patch file has 200+ lines, would you please help clarify what does
> 'this' indicate?

This indicates that any choice of a different swiotlb pools needs to
be hidden inside of ѕwiotlb.  The dma mapping API already provides
swiotlb the addressability requirement for the device.  Similarly we
already have a SWIOTLB_ANY flag that switches to a 64-bit buffer
by default, which we can change to, or replace with a flag that
allocates an additional buffer that is not addressing limited.

