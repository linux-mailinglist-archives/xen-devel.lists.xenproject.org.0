Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3867A8B974
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 14:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955975.1349508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u525h-0001eU-Dt; Wed, 16 Apr 2025 12:42:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955975.1349508; Wed, 16 Apr 2025 12:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u525h-0001cH-BF; Wed, 16 Apr 2025 12:42:09 +0000
Received: by outflank-mailman (input) for mailman id 955975;
 Wed, 16 Apr 2025 12:42:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kp/+=XC=infradead.org=willy@srs-se1.protection.inumbo.net>)
 id 1u525f-0001ZY-CR
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 12:42:08 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2efc800e-1ac0-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 14:42:03 +0200 (CEST)
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1u525P-0000000A7kU-0pso;
 Wed, 16 Apr 2025 12:41:51 +0000
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
X-Inumbo-ID: 2efc800e-1ac0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dwsf2a+LAeqnu6EO1zimyir940pvQziq2A6xZuIziWs=; b=R3V+osM/35c6CJLXnCxO9rd9YF
	mPiqXkqMd34Lab6bF4vHeTMnnRWggeMyYoYJgcXMTak/W8L4GOX5X+41Bg97VQCBU1VFdyQXzJZf+
	Ugzs/XZlXikcENVE6rB6BSLHNi+D0j1U+CEqU5OZRMIG1vqSsk2pgR604F7gPk053S5E5qvfr1O4+
	Ntzgzr3UxSgTaqeEo/eL29uL8JfDTkb9bC46fd/NM8j2h3qEYF8uOGnKa+TUqapFI+adgfZrQeFNe
	CUsVfEreUUwctEGkpq7AZUZBEo5LcLKd+VRU8hwv9tvlBOFHxmDkBUI01aiGO871cGgGA/ju//TQ/
	W9IZZ0SA==;
Date: Wed, 16 Apr 2025 13:41:51 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Petr =?utf-8?B?VmFuxJtr?= <arkamar@atlas.cz>
Cc: linux-kernel@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	x86@kernel.org, xen-devel@lists.xenproject.org,
	linux-arch@vger.kernel.org
Subject: Re: Regression from a9b3c355c2e6 ("asm-generic: pgalloc: provide
 generic __pgd_{alloc,free}") with CONFIG_DEBUG_VM_PGFLAGS=y and Xen
Message-ID: <Z_-lj5kCg084MXRI@casper.infradead.org>
References: <202541612720-Z_-deOZTOztMXHBh-arkamar@atlas.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202541612720-Z_-deOZTOztMXHBh-arkamar@atlas.cz>

On Wed, Apr 16, 2025 at 02:07:20PM +0200, Petr Vaněk wrote:
> I have discovered a regression introduced in commit a9b3c355c2e6
> ("asm-generic: pgalloc: provide generic __pgd_{alloc,free}") [1,2] in
> kernel version 6.14. The problem occurs when the x86 kernel is
> configured with CONFIG_DEBUG_VM_PGFLAGS=y and is run as a PV Dom0 in Xen
> 4.19.1. During the startup, the kernel panics with the error log below.

You also have to have CONFIG_MITIGATION_PAGE_TABLE_ISOLATION enabled
to hit this problem, otherwise we allocate an order-0 page.

> The commit changed PGD allocation path.  In the new implementation
> _pgd_alloc allocates memory with __pgd_alloc, which indirectly calls 
> 
>   alloc_pages_noprof(gfp | __GFP_COMP, order);
> 
> This is in contrast to the old behavior, where __get_free_pages was
> used, which indirectly called
> 
>   alloc_pages_noprof(gfp_mask & ~__GFP_HIGHMEM, order);
> 
> The key difference is that the new allocator can return a compound page.
> When xen_pin_page is later called on such a page, it call
> TestSetPagePinned function, which internally uses the PF_NO_COMPOUND
> macro. This macro enforces VM_BUG_ON_PGFLAGS if PageCompound is true,
> triggering the panic when CONFIG_DEBUG_VM_PGFLAGS is enabled.

I suspect the right thing to do here is to change the PF_NO_COMPOUND to
PF_HEAD.  Probably for all of these:

/* Xen */
PAGEFLAG(Pinned, pinned, PF_NO_COMPOUND)
        TESTSCFLAG(Pinned, pinned, PF_NO_COMPOUND)
PAGEFLAG(SavePinned, savepinned, PF_NO_COMPOUND);
PAGEFLAG(Foreign, foreign, PF_NO_COMPOUND);
PAGEFLAG(XenRemapped, xen_remapped, PF_NO_COMPOUND)
        TESTCLEARFLAG(XenRemapped, xen_remapped, PF_NO_COMPOUND)

Could you give that a try?

