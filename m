Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 066B071181B
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 22:26:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539866.841159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2HXE-0003Tn-0w; Thu, 25 May 2023 20:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539866.841159; Thu, 25 May 2023 20:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2HXD-0003Qm-Tu; Thu, 25 May 2023 20:26:07 +0000
Received: by outflank-mailman (input) for mailman id 539866;
 Thu, 25 May 2023 20:26:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JOix=BO=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q2HXC-0003Qg-9E
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 20:26:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5eb24711-fb3a-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 22:26:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EBF4A600BE;
 Thu, 25 May 2023 20:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185ECC433D2;
 Thu, 25 May 2023 20:25:55 +0000 (UTC)
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
X-Inumbo-ID: 5eb24711-fb3a-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685046362;
	bh=q0CSXKuNpY/cOn/THS8/5Wy4aJR83TTmgU6zxWwJSXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SQE8oA8lQRwEus253i9PgXAYxS+1hfEWgxQkG8dNMuK5+C2MzFWHC2gCVa/sCTaIh
	 mINB5DgFECw+pGenAIWbq/ant+MDQxcFaxJeNamZqmWfH2SE50ljnoCt5WDkZMFN/y
	 zSsFGUWBnPo7WzVzFj57OnJKTLZv8v06II8J4E2+FMu/J0lzw0cg8/Um5wKRhTuiBz
	 M1a9kePx9hC6/XnF66pTT3tDmfydVWOZ+PUuN61Pd1nQtUDi8l6wozX8HGFWMhSLig
	 QS2F5MDwxfui88OZl1d4xhMuIeMffwSLM7NnRPkICdlmFaTyYVH5nOaWhDuFI01iqL
	 PEjExdKRm1jxQ==
Date: Thu, 25 May 2023 23:25:37 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vishal Moola <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Subject: Re: [PATCH v2 05/34] mm: add utility functions for ptdesc
Message-ID: <20230525202537.GA4967@kernel.org>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-6-vishal.moola@gmail.com>
 <20230525090956.GX4967@kernel.org>
 <CAOzc2pxSH6GhBnAoSOjvYJk2VdMDFZi3H_1qGC5Cdyp3j4AzPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOzc2pxSH6GhBnAoSOjvYJk2VdMDFZi3H_1qGC5Cdyp3j4AzPQ@mail.gmail.com>

On Thu, May 25, 2023 at 11:04:28AM -0700, Vishal Moola wrote:
> On Thu, May 25, 2023 at 2:10 AM Mike Rapoport <rppt@kernel.org> wrote:
> > > +
> > > +static inline struct ptdesc *ptdesc_alloc(gfp_t gfp, unsigned int order)
> > > +{
> > > +     struct page *page = alloc_pages(gfp | __GFP_COMP, order);
> > > +
> > > +     return page_ptdesc(page);
> > > +}
> > > +
> > > +static inline void ptdesc_free(struct ptdesc *pt)
> > > +{
> > > +     struct page *page = ptdesc_page(pt);
> > > +
> > > +     __free_pages(page, compound_order(page));
> > > +}
> >
> > The ptdesc_{alloc,free} API does not sound right to me. The name
> > ptdesc_alloc() implies the allocation of the ptdesc itself, rather than
> > allocation of page table page. The same goes for free.
> 
> I'm not sure I see the difference. Could you elaborate?

I read ptdesc_alloc() as "allocate a ptdesc" rather than as "allocate a
page for page table and return ptdesc pointing to that page". Seems very
confusing to me already and it will be even more confusion when we'll start
allocating actual ptdescs.
 
-- 
Sincerely yours,
Mike.

