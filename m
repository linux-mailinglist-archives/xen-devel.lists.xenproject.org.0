Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D36366FC4A0
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 13:09:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532114.828144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwLCq-00047D-5g; Tue, 09 May 2023 11:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532114.828144; Tue, 09 May 2023 11:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwLCq-00044K-2R; Tue, 09 May 2023 11:08:32 +0000
Received: by outflank-mailman (input) for mailman id 532114;
 Tue, 09 May 2023 11:08:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SDpd=A6=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pwLCm-000449-Ga
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 11:08:30 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2a659d2-ee59-11ed-b227-6b7b168915f2;
 Tue, 09 May 2023 13:08:27 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pwLBl-00FBZV-VA; Tue, 09 May 2023 11:07:26 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 20197300023;
 Tue,  9 May 2023 13:07:23 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0504E20B0882C; Tue,  9 May 2023 13:07:22 +0200 (CEST)
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
X-Inumbo-ID: d2a659d2-ee59-11ed-b227-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jRJqPjkZDLfU3CkfoL3myLBABJzadgOWoNWDI32Y8LI=; b=vSapig8PT+X9FleUgN3U0CZtui
	relRtn1zPe77P0WIAsoYme9WGw5tkGy2jBjW361caFHw1VfseDENIJEioGXGsAlXDL56EYU9zLoKK
	sYtsAQy08WKeWKCMyQFs1KJSr/OyChBFdzqL/MxK7qab9fpOnk7H5jh5WbiYQN/4wFh+Pj/AmUjtw
	QaFbJledlkQi5f022TKkXoXPhIOBe4yd/n6XLOTCL2wmgcVNokN/6W7o9qCPn/qVvfH0K0rQjHZ6A
	RGMSVi/rBgBEn6a8OS6m8fLIOlG3fUbF/IUlHnmjqIk+2Iwkmd+PWpBK1wBJ3ULFWthvylMJrnGnM
	mBfXf0KA==;
Date: Tue, 9 May 2023 13:07:22 +0200
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
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>
Subject: Re: [patch v3 18/36] [patch V2 18/38] cpu/hotplug: Add CPU state
 tracking and synchronization
Message-ID: <20230509110722.GZ83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.240871842@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508185218.240871842@linutronix.de>

On Mon, May 08, 2023 at 09:43:55PM +0200, Thomas Gleixner wrote:

> +static inline void cpuhp_ap_update_sync_state(enum cpuhp_sync_state state)
> +{
> +	atomic_t *st = this_cpu_ptr(&cpuhp_state.ap_sync_state);
> +	int sync = atomic_read(st);
> +
> +	while (!atomic_try_cmpxchg(st, &sync, state));
> +}

Why isn't:

	atomic_set(st, state);

any good?


