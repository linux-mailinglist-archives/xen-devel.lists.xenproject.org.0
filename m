Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 557A2A7EA88
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 20:36:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940867.1340487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1rK3-00076F-F6; Mon, 07 Apr 2025 18:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940867.1340487; Mon, 07 Apr 2025 18:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1rK3-00074F-CL; Mon, 07 Apr 2025 18:35:51 +0000
Received: by outflank-mailman (input) for mailman id 940867;
 Mon, 07 Apr 2025 18:35:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rklv=WZ=linux-foundation.org=akpm@srs-se1.protection.inumbo.net>)
 id 1u1rK1-000749-C5
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 18:35:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e58b10f-13df-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 20:35:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF9495C276A;
 Mon,  7 Apr 2025 18:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B551C4CEDD;
 Mon,  7 Apr 2025 18:35:44 +0000 (UTC)
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
X-Inumbo-ID: 1e58b10f-13df-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744050944;
	bh=QiTncCnd55Ia4eac1kyaB9blDFvntz5XPVt6W64q1n0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kwvaeD/akigjGI7ZXDY52hZRNE3FRFEN6Uc6iHtJlTKxoE0UMkjLxBOD/fgvDHGq1
	 W4Ni/q9ZjLctOHi6rmPtAnUuHHHe57o4rpfiv0IL8Pp6Z02ulY8lFGXBs6yBBc7eYu
	 XifDovhU5NidAqljsBlmq7svSzYrmQnQBYrtwkdo=
Date: Mon, 7 Apr 2025 11:35:43 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Hugh Dickins
 <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>, Guenter Roeck
 <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>, Jeremy Fitzhardinge
 <jeremy@goop.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org
Subject: Re: [PATCH v1 0/4] mm: Fix apply_to_pte_range() vs lazy MMU mode
Message-Id: <20250407113543.6a43461e397d58471e407323@linux-foundation.org>
In-Reply-To: <cover.1744037648.git.agordeev@linux.ibm.com>
References: <cover.1744037648.git.agordeev@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  7 Apr 2025 17:11:26 +0200 Alexander Gordeev <agordeev@linux.ibm.com> wrote:

> This series is an attempt to fix the violation of lazy MMU mode context
> requirement as described for arch_enter_lazy_mmu_mode():
> 
>     This mode can only be entered and left under the protection of
>     the page table locks for all page tables which may be modified.
> 
> On s390 if I make arch_enter_lazy_mmu_mode() -> preempt_enable() and
> arch_leave_lazy_mmu_mode() -> preempt_disable() I am getting this:
>
> ...
>

Could you please reorganize this into two series?  One series which
should be fast-tracked into 6.15-rcX and one series for 6.16-rc1?

And in the first series, please suggest whether its patches should be
backported into -stable and see if we can come up with suitable Fixes:
targets?

Thanks.

