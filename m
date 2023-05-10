Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 515A16FD9B1
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 10:41:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532705.828973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwfNa-0002tO-3E; Wed, 10 May 2023 08:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532705.828973; Wed, 10 May 2023 08:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwfNZ-0002qd-WC; Wed, 10 May 2023 08:40:57 +0000
Received: by outflank-mailman (input) for mailman id 532705;
 Wed, 10 May 2023 08:40:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+mX7=A7=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pwfNX-0002qX-Vp
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 08:40:56 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ebe99fe-ef0e-11ed-8611-37d641c3527e;
 Wed, 10 May 2023 10:40:52 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pwfM6-00G6ee-Fz; Wed, 10 May 2023 08:39:26 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3F365300338;
 Wed, 10 May 2023 10:39:24 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 2636720B04BA2; Wed, 10 May 2023 10:39:24 +0200 (CEST)
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
X-Inumbo-ID: 5ebe99fe-ef0e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kxXv2WqVS/N/AXpDGiSycxgzS2fMDzLbIFoszm9gQVI=; b=fruh6dMZerc8uTfAzuh9A7hIbP
	VvgdR1RS3pjBRGcpa6fHyCQvCR0Aq9ej79UowH+YJhhpMQFyqHZlLAYo85qDixs7AYee0NKygZtCT
	6hOzrcLL6lgbJ6CDMnHBTG+URFob7oahukW020DEiWDlSZvO3aCqWhyjd0R6lOQ+0xUt6NrsA7nY+
	t53+xab78Blhuyo9AdcouXah9dFIKssJhlWxI1vvizbNnJh1T+Up3Djmr8Kx45ZXR0w42rN3xa+Wj
	vQG7RFMGQeTTvgV6Pll4zRWoLGjolJBp4/QvccMTRYfaN+G127v+dF7n6q9sjrP5Au/LmGKAAaAB2
	nqiPFvtw==;
Date: Wed, 10 May 2023 10:39:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Brian Gerst <brgerst@gmail.com>,
	Arjan van de Veen <arjan@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul McKenney <paulmck@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Piotr Gorski <lucjan.lucjanov@gmail.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	linux-csky@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Sabin Rapan <sabrapan@amazon.com>,
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [patch v3 08/36] x86/smpboot: Split up native_cpu_up() into
 separate phases and document them
Message-ID: <20230510083924.GI4253@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185217.671595388@linutronix.de>
 <20230509100421.GU83892@hirez.programming.kicks-ass.net>
 <87fs85z2na.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fs85z2na.ffs@tglx>

On Tue, May 09, 2023 at 10:11:05PM +0200, Thomas Gleixner wrote:
> On Tue, May 09 2023 at 12:04, Peter Zijlstra wrote:
> > On Mon, May 08, 2023 at 09:43:39PM +0200, Thomas Gleixner wrote:
> > Not to the detriment of this patch, but this barrier() and it's comment
> > seem weird vs smp_callin(). That function ends with an atomic bitop (it
> > has to, at the very least it must not be weaker than store-release) but
> > also has an explicit wmb() to order setup vs CPU_STARTING.
> >
> > (arguably that should be a full fence *AND* get a comment)
> 
> TBH: I'm grasping for something 'arguable': What's the point of this
> wmb() or even a mb()?
> 
> Most of the [w]mb()'s in smpboot.c except those in mwait_play_dead()
> have a very distinct voodoo programming smell.

Oh fully agreed, esp. without a comment these things are hugely suspect.
I could not immediately see purpose either.

My arguably argument was about IF it was needed at all, then it would
make more sense to me to also constrain loads. But I'd be more than
happy to see the whole thing go. But perhaps not in this series?

