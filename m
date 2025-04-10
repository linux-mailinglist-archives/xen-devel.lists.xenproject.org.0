Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC18A84FCD
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 00:48:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946487.1344367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u30gZ-0006do-7u; Thu, 10 Apr 2025 22:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946487.1344367; Thu, 10 Apr 2025 22:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u30gZ-0006b4-3U; Thu, 10 Apr 2025 22:47:51 +0000
Received: by outflank-mailman (input) for mailman id 946487;
 Thu, 10 Apr 2025 22:47:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sQhE=W4=linux-foundation.org=akpm@srs-se1.protection.inumbo.net>)
 id 1u30gX-0006ay-I0
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 22:47:49 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2ae8c65-165d-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 00:47:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B03A260008;
 Thu, 10 Apr 2025 22:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DF3C4CEDD;
 Thu, 10 Apr 2025 22:47:45 +0000 (UTC)
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
X-Inumbo-ID: d2ae8c65-165d-11f0-9ead-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744325266;
	bh=1tnfPuvkdBHhkMd126G0IxK9k3gsj3KHkqYbgp6rqwk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e6xef16qlSCuaWmvesXMrxudpX3PdJoqdNQrXzsVNJrRRrc/hIgkchadNM34Ppb4j
	 YRP22ogIXwogTnAqDkh7D1n1YtKcQftorM0XAqg0S2/V4Yun6qCg+vGECTW9UKKua2
	 l9Tu9D3P64Os0dK/iz7clScFQuOJTR8wIZOF5Qj8=
Date: Thu, 10 Apr 2025 15:47:44 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Hugh Dickins
 <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>, Guenter Roeck
 <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>, Jeremy Fitzhardinge
 <jeremy@goop.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mm: Protect kernel pgtables in
 apply_to_pte_range()
Message-Id: <20250410154744.44991b2abe5f842e34320917@linux-foundation.org>
In-Reply-To: <Z/fauW5hDSt+ciwr@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <cover.1744128123.git.agordeev@linux.ibm.com>
	<ef8f6538b83b7fc3372602f90375348f9b4f3596.1744128123.git.agordeev@linux.ibm.com>
	<Z/fauW5hDSt+ciwr@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Apr 2025 16:50:33 +0200 Alexander Gordeev <agordeev@linux.ibm.com> wrote:

> On Tue, Apr 08, 2025 at 06:07:32PM +0200, Alexander Gordeev wrote:
> 
> Hi Andrew,
> 
> > The lazy MMU mode can only be entered and left under the protection
> > of the page table locks for all page tables which may be modified.
> 
> Heiko Carstens noticed that the above claim is not valid, since
> v6.15-rc1 commit 691ee97e1a9d ("mm: fix lazy mmu docs and usage"),
> which restates it to:
> 
> "In the general case, no lock is guaranteed to be held between entry and exit
> of the lazy mode. So the implementation must assume preemption may be enabled"
> 
> That effectively invalidates this patch, so it needs to be dropped.
> 
> Patch 2 still could be fine, except -stable and Fixes tags and it does
> not need to aim 6.15-rcX. Do you want me to repost it?

I dropped the whole series - let's start again.

