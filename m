Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBC67137E1
	for <lists+xen-devel@lfdr.de>; Sun, 28 May 2023 07:49:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540378.842103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q39GL-000295-S2; Sun, 28 May 2023 05:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540378.842103; Sun, 28 May 2023 05:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q39GL-00026o-Ol; Sun, 28 May 2023 05:48:17 +0000
Received: by outflank-mailman (input) for mailman id 540378;
 Sun, 28 May 2023 05:48:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1NL0=BR=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q39GK-00026i-Oy
 for xen-devel@lists.xenproject.org; Sun, 28 May 2023 05:48:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c1d6599-fd1b-11ed-8611-37d641c3527e;
 Sun, 28 May 2023 07:48:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A7A4B60B63;
 Sun, 28 May 2023 05:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2385C433D2;
 Sun, 28 May 2023 05:48:05 +0000 (UTC)
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
X-Inumbo-ID: 3c1d6599-fd1b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685252892;
	bh=bkuMHroVl9TlOSFo6p59v17X6rAsvGxb3kzfT5vZogM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/fA88QDLAPfI5+3dlnjis0mHISdgNRk033rp1tEp/+Mnh4pdPF6GyqhT2d0f44ZM
	 O9W0HkIZYw4XGrrX1f3tUzE0jNE3oALs8Cn992s+EfmiHsu8hfXhu3DkQX9TcwN2oj
	 7E7N3KWaDItcFkwUQzuLHOiQy27MUurhgxG80g7TkNYefeCpTsWvx1dhgZiE8imgx7
	 3iInnTBsRh7R7es7uW5hUx43VvmKiGSLfYpxMoZFKFBm9CDY8XYAON1aC4gzYndzuk
	 JoH7BurJumWuV7HAw5lKspfn5I/oVTTKuKbhXpKROtOf7xIXSt3aAHLO5P0Ikkt3g7
	 bN8aIuRcKOvMA==
Date: Sun, 28 May 2023 08:47:45 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
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
Message-ID: <20230528054745.GI4967@kernel.org>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-6-vishal.moola@gmail.com>
 <20230525090956.GX4967@kernel.org>
 <CAOzc2pxSH6GhBnAoSOjvYJk2VdMDFZi3H_1qGC5Cdyp3j4AzPQ@mail.gmail.com>
 <20230525202537.GA4967@kernel.org>
 <CAOzc2pxD21mxisy-M5b_SDUv0MYwNHqaVDJnJpARuDG_HjCbOg@mail.gmail.com>
 <20230527104144.GH4967@kernel.org>
 <ZHIdK+170XoK2jVe@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHIdK+170XoK2jVe@casper.infradead.org>

On Sat, May 27, 2023 at 04:09:31PM +0100, Matthew Wilcox wrote:
> On Sat, May 27, 2023 at 01:41:44PM +0300, Mike Rapoport wrote:
> > Sorry if I wasn't clear, by "page table page" I meant the page (or memory
> > for that matter) for actual page table rather than struct page describing
> > that memory.
> > 
> > So what we allocate here is the actual memory for the page tables and not
> > the memory for the metadata. That's why I think the name ptdesc_alloc is
> > confusing.
> 
> But that's going to be the common pattern in the Glorious Future.
> You allocate a folio and that includes both the folio memory descriptor
> and the 2^n pages of memory described by that folio.  Similarly for all
> the other memory descriptors.

I'm not arguing with that, I'm not happy about the naming. IMO, the name
should reflect that we allocate memory for page tables rather than for the
descriptor of that memory, say pgtable_alloc() or page_table_alloc().

-- 
Sincerely yours,
Mike.

