Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CE444ED08
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 20:05:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225393.389226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlbqc-0008CT-3s; Fri, 12 Nov 2021 19:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225393.389226; Fri, 12 Nov 2021 19:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlbqc-0008A5-0w; Fri, 12 Nov 2021 19:04:26 +0000
Received: by outflank-mailman (input) for mailman id 225393;
 Fri, 12 Nov 2021 19:04:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QmTF=P7=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1mlbqZ-00089z-9o
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 19:04:24 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55af7862-43eb-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 20:04:20 +0100 (CET)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlbqG-003lfG-2J; Fri, 12 Nov 2021 19:04:04 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id CFA2C986981; Fri, 12 Nov 2021 20:04:03 +0100 (CET)
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
X-Inumbo-ID: 55af7862-43eb-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sw9KzIf5vZUC10cdm21n9r6yeef7LSOGNJpq3h8tSms=; b=rLTlqUUlAiGbtl1O5iekR2GnJA
	sfAPhF9YEzCExNPlrXlMw8BrqfMh0Li2vHFgh5xp8GKOGscpg4J5eZ3cO9ezn38W+WFh8PNJ0Hxb+
	HUDq44vdhRD8qRY+b92H6sHJfm2K7+iub9UyXyrh4bSEb3S3Ixh6+Dgj6+tmq6IsKbJsVOEVclwdu
	YbDFoLHDBtzI9w3nxz8D2ACQxruoKSlXrPgf1NFcEZEMi/R0BxdBmk8Wzp/QXrGSPRkSWBvLe28+U
	BnrYs6BcByw78i/zr4kEEp4oVkMqv1+cQLkpqy6oC/72jrLO9ta+XPxsehu95/49P+CC3lrNTU663
	O3TXwQBw==;
Date: Fri, 12 Nov 2021 20:04:03 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 0/2] Nuke PAGE_KERNEL_IO
Message-ID: <20211112190403.GK174703@worktop.programming.kicks-ass.net>
References: <20211021181511.1533377-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021181511.1533377-1-lucas.demarchi@intel.com>

On Thu, Oct 21, 2021 at 11:15:09AM -0700, Lucas De Marchi wrote:
> Last user of PAGE_KERNEL_IO is the i915 driver. While removing it from
> there as we seek to bring the driver to other architectures, Daniel
> suggested that we could finish the cleanup and remove it altogether,
> through the tip tree. So here I'm sending both commits needed for that.
> 
> Lucas De Marchi (2):
>   drm/i915/gem: stop using PAGE_KERNEL_IO
>   x86/mm: nuke PAGE_KERNEL_IO
> 
>  arch/x86/include/asm/fixmap.h             | 2 +-
>  arch/x86/include/asm/pgtable_types.h      | 7 -------
>  arch/x86/mm/ioremap.c                     | 2 +-
>  arch/x86/xen/setup.c                      | 2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_pages.c | 4 ++--
>  include/asm-generic/fixmap.h              | 2 +-
>  6 files changed, 6 insertions(+), 13 deletions(-)

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

