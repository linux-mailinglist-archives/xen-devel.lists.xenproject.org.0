Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD015442D9
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 07:06:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344564.570115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzAMp-00012d-VI; Thu, 09 Jun 2022 05:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344564.570115; Thu, 09 Jun 2022 05:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzAMp-0000yi-Q6; Thu, 09 Jun 2022 05:05:59 +0000
Received: by outflank-mailman (input) for mailman id 344564;
 Thu, 09 Jun 2022 05:05:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmT3=WQ=bombadil.srs.infradead.org=BATV+a39afe573ddbd6ff3389+6864+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nzAMo-0000U6-4z
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 05:05:58 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8502d1d-e7b1-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 07:05:57 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nzAMl-00Gn4g-0a; Thu, 09 Jun 2022 05:05:55 +0000
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
X-Inumbo-ID: d8502d1d-e7b1-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lSjKiwGQP2bLdZmsJuNaLJfxZDGjC6fCq2g/NdyMPNA=; b=kyhL2c0fixHav+CSRIiyWMtFN7
	AtDNsnF/9FvWJ9TIx9fua/CrNv5rR8a9O7oji3ME60GbokDgdhgvD0ea2XdXEW/L1DOT//y9eaYzo
	JnuI00fO4ezPxNMBvHkQYYI5xIPoHzR9wnf4anfLqVEwyENKdzkr/7GIIOrh15zyrv+YMfLMdP9s5
	6Rvc7JdDtTpL7W2pcS0iqoBpYYs8PLlaD0HauJabPoVr7WpXOlJQlGsGN0JStdxSNMixCdQE7blhE
	RaUJDr2rfJW4kg5HofoJ8jqgC2HUgKr4MOCFxVgU1Mt6OJy/VvcugFl1p5U4yhYTwg9+HBWpohhZ5
	n20MR6mw==;
Date: Wed, 8 Jun 2022 22:05:54 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
	x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, hch@infradead.org,
	m.szyprowski@samsung.com, jgross@suse.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	sstabellini@kernel.org, mpe@ellerman.id.au, konrad.wilk@oracle.com,
	mst@redhat.com, jasowang@redhat.com, joe.jin@oracle.com
Subject: Re: [PATCH RFC v1 4/7] swiotlb: to implement io_tlb_high_mem
Message-ID: <YqF/sphJj6n+22Si@infradead.org>
References: <20220609005553.30954-1-dongli.zhang@oracle.com>
 <20220609005553.30954-5-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609005553.30954-5-dongli.zhang@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

All this really needs to be hidden under the hood.

