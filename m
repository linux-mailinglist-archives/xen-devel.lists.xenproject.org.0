Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A81CAA606D
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 17:04:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974202.1362126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAVRb-0007sf-88; Thu, 01 May 2025 15:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974202.1362126; Thu, 01 May 2025 15:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAVRb-0007rD-4W; Thu, 01 May 2025 15:03:23 +0000
Received: by outflank-mailman (input) for mailman id 974202;
 Thu, 01 May 2025 15:03:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YcoR=XR=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1uAVRY-0007r7-3T
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 15:03:21 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6403bcca-269d-11f0-9ffb-bf95429c2676;
 Thu, 01 May 2025 17:03:13 +0200 (CEST)
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uAVQk-00000000oH8-33tB; Thu, 01 May 2025 15:02:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1B7DC30072F; Thu,  1 May 2025 17:02:30 +0200 (CEST)
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
X-Inumbo-ID: 6403bcca-269d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SknNweDJMYv6Cc7JXUCuginAJHi4T0ZKllMpOn1Yf9A=; b=QE9K7S0FqJXdRMiI2MUQfyFVKN
	zJkaOZZAvX0UK9xBOJnD6xr1oo4dLko0vESRIIkP4sjHHPxZkleb2D8Zai321exEYA2JJr82ElX7s
	y72vsCa48dbNhj3sR2u6AvvpDc6GUftTpqrd7fLDiVr8l4ZJcPOvCc/B4Kso/X5VwtY001koeorb7
	w0lpR1LpdbzQwtNNGzQXqNnli6Sbl3pH+QAdCVePhkf3FUFd/ngVNiv41q8dPOdm8t1mbTM/UmJ5P
	NuryBBTCcNBBOjT/+JRWnUfQQL+DhMwA+igl0308JTBNEPRBnnqN+OImNHFtw2Imib6YH9ERSKUcP
	cmUpe09A==;
Date: Thu, 1 May 2025 17:02:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Christoph Hellwig <hch@lst.de>, chenlinxuan@uniontech.com,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	kvm@vger.kernel.org, virtualization@lists.linux.dev,
	linux-integrity@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev, Winston Wen <wentao@uniontech.com>,
	kasan-dev@googlegroups.com, xen-devel@lists.xenproject.org,
	Changbin Du <changbin.du@intel.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH RFC v3 0/8] kernel-hacking: introduce
 CONFIG_NO_AUTO_INLINE
Message-ID: <20250501150229.GU4439@noisy.programming.kicks-ass.net>
References: <20250429-noautoinline-v3-0-4c49f28ea5b5@uniontech.com>
 <20250429123504.GA13093@lst.de>
 <D9KW1QQR88EY.2TOSTVYZZH5KN@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9KW1QQR88EY.2TOSTVYZZH5KN@google.com>

On Thu, May 01, 2025 at 02:19:47PM +0000, Brendan Jackman wrote:
> On Tue Apr 29, 2025 at 12:35 PM UTC, Christoph Hellwig wrote:
> > On Tue, Apr 29, 2025 at 12:06:04PM +0800, Chen Linxuan via B4 Relay wrote:
> >> This series introduces a new kernel configuration option NO_AUTO_INLINE,
> >> which can be used to disable the automatic inlining of functions.
> >> 
> >> This will allow the function tracer to trace more functions
> >> because it only traces functions that the compiler has not inlined.
> >
> > This still feels like a bad idea because it is extremely fragile.
> 
> Can you elaborate on that - does it introduce new fragility?

given it needs to sprinkle __always_inline around where it wasn't needed
before, yeah.

Also, why would you want this? function tracer is already too much
output. Why would you want even more?



