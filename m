Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D6E713569
	for <lists+xen-devel@lfdr.de>; Sat, 27 May 2023 17:10:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540326.842033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2vYM-0006E4-7R; Sat, 27 May 2023 15:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540326.842033; Sat, 27 May 2023 15:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2vYM-0006Bi-3o; Sat, 27 May 2023 15:09:58 +0000
Received: by outflank-mailman (input) for mailman id 540326;
 Sat, 27 May 2023 15:09:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PCBS=BQ=infradead.org=willy@srs-se1.protection.inumbo.net>)
 id 1q2vYJ-0006Bc-UP
 for xen-devel@lists.xenproject.org; Sat, 27 May 2023 15:09:56 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88cde50a-fca0-11ed-b231-6b7b168915f2;
 Sat, 27 May 2023 17:09:54 +0200 (CEST)
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1q2vXv-003tpc-6G; Sat, 27 May 2023 15:09:31 +0000
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
X-Inumbo-ID: 88cde50a-fca0-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=u50hcZSLxjXk+ZnHObIQ29gSZuYnejTLeMWOgyxvfyQ=; b=kvDbU0q2z5jUTh3d5nQNpnIto9
	5xrW767Q1PCPoDvq7cJx36GAZEG2mizda3DrQtiBOGyiytCq2OMTOEXq8TWh2LZ+xzaLqiKD9V9Eb
	EJX8E77j208rlnFcLKHX2rZvcHGssHh261tJ08qNlv2+zYnLCkftBGtSrrF/p39TJSIPJr0ITg4/l
	1g7Vh1u4qG6tN9I49LGc4DG6JUJ0KFWAYdrSkVV8XgiRrI/avMqTujLKkfiEnrTSZ/y+N3Nd9R9D8
	/OJnFeU9SGlsUclnIO5MUMB9v4WCZl1IYBNx4a3hMv/KnLwfYzmktawxgr1m6qrMuAbL8hw04B8Os
	8rYGwubA==;
Date: Sat, 27 May 2023 16:09:31 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Vishal Moola <vishal.moola@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Subject: Re: [PATCH v2 05/34] mm: add utility functions for ptdesc
Message-ID: <ZHIdK+170XoK2jVe@casper.infradead.org>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-6-vishal.moola@gmail.com>
 <20230525090956.GX4967@kernel.org>
 <CAOzc2pxSH6GhBnAoSOjvYJk2VdMDFZi3H_1qGC5Cdyp3j4AzPQ@mail.gmail.com>
 <20230525202537.GA4967@kernel.org>
 <CAOzc2pxD21mxisy-M5b_SDUv0MYwNHqaVDJnJpARuDG_HjCbOg@mail.gmail.com>
 <20230527104144.GH4967@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230527104144.GH4967@kernel.org>

On Sat, May 27, 2023 at 01:41:44PM +0300, Mike Rapoport wrote:
> Sorry if I wasn't clear, by "page table page" I meant the page (or memory
> for that matter) for actual page table rather than struct page describing
> that memory.
> 
> So what we allocate here is the actual memory for the page tables and not
> the memory for the metadata. That's why I think the name ptdesc_alloc is
> confusing.

But that's going to be the common pattern in the Glorious Future.
You allocate a folio and that includes both the folio memory descriptor
and the 2^n pages of memory described by that folio.  Similarly for all
the other memory descriptors.

