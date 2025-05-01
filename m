Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB83FAA60F8
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 17:51:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974229.1362146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAWBo-0007Iy-LM; Thu, 01 May 2025 15:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974229.1362146; Thu, 01 May 2025 15:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAWBo-0007H1-Id; Thu, 01 May 2025 15:51:08 +0000
Received: by outflank-mailman (input) for mailman id 974229;
 Thu, 01 May 2025 15:51:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YcoR=XR=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1uAWBn-0007Fd-Ib
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 15:51:07 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 164c51e8-26a4-11f0-9eb4-5ba50f476ded;
 Thu, 01 May 2025 17:51:05 +0200 (CEST)
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uAWBP-00000000vWm-1k5y; Thu, 01 May 2025 15:50:43 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 04927300642; Thu,  1 May 2025 17:50:43 +0200 (CEST)
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
X-Inumbo-ID: 164c51e8-26a4-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=P3VRTKEBNLquqRhFZYT5aVzDoqfQbBS2lj2/Gfm1dd8=; b=Vvw1f1nb4tZTNYWo7mO6z9pHzV
	MDmnoqAqu2hmb0i0BZCMhG/WDMQlC58Cw73kwpES9YsUR9uVYBATrwEJOHRNIo/+tiKLtb+lnOGfX
	3RQDTcQJHo8yw/zOwlj2RzWNFYXhC2VQIUF/gJjLBZWYPMdo4SndGy1x8v2X1nLPEmzP9XY04eDER
	6wiFSA1LKBYitCkX2q34LCGcLleraMkw5CpiczInfDqlRcnA1DkoaezY3MLQ7ZnDpb3tBsrvLAH0S
	h83K01vh+L05Z2s0lZBeMEnAZ2cFAgQ3S5nprdKJg8w8nz2cckeve7tiH0FBgOln3Yo1AMJl2OmyX
	jjUfpXpQ==;
Date: Thu, 1 May 2025 17:50:42 +0200
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
Message-ID: <20250501155042.GR4198@noisy.programming.kicks-ass.net>
References: <20250429-noautoinline-v3-0-4c49f28ea5b5@uniontech.com>
 <20250429123504.GA13093@lst.de>
 <D9KW1QQR88EY.2TOSTVYZZH5KN@google.com>
 <20250501150229.GU4439@noisy.programming.kicks-ass.net>
 <D9KXE2YX8R2M.3L7Q6NVIXKPE9@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9KXE2YX8R2M.3L7Q6NVIXKPE9@google.com>

On Thu, May 01, 2025 at 03:22:55PM +0000, Brendan Jackman wrote:

> Whereas enlarging the pool of functions that you can _optionally target_
> for tracing, or nice reliable breakpoints in GDB, and disasm that's
> easier to mentally map back to C, seems like a helpful improvement for
> test builds. Personally I sometimes spam a bunch of `noinline` into code
> I'm debugging so this seems like a way to just slap that same thing on
> the whole tree without dirtying the code, right?

Dunno, I'm more of the printk school of debugging. Very rarely do I
bother with GDB (so rare in fact that I have to look up how to even do
this).


