Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A99926FC519
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 13:36:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532124.828163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwLe0-00084F-GY; Tue, 09 May 2023 11:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532124.828163; Tue, 09 May 2023 11:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwLe0-00082Z-Dp; Tue, 09 May 2023 11:36:36 +0000
Received: by outflank-mailman (input) for mailman id 532124;
 Tue, 09 May 2023 11:36:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SDpd=A6=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pwLdy-00082T-ON
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 11:36:34 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfebc1a3-ee5d-11ed-b227-6b7b168915f2;
 Tue, 09 May 2023 13:36:34 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pwLdH-00678Y-0c; Tue, 09 May 2023 11:35:52 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8F613302F3D;
 Tue,  9 May 2023 13:35:48 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 6D04F20C342B1; Tue,  9 May 2023 13:35:48 +0200 (CEST)
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
X-Inumbo-ID: bfebc1a3-ee5d-11ed-b227-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9uy06VylNOBEAiDOc+c/ggtZsNSxY44p/M1PWpIHlTo=; b=AdPs8XtYEpkR3G25UQ9/ynnaJQ
	yoQ7TJHtTer78qTxQSruGfUSIJdNhTXt+0UcvF9ygN5qgsE6skCGKlKdAU+XGBlszdQLENogWL1pZ
	XLDEoXkr1kINeJ7StBwuvXlWsxIhr3i/RPNAsp79LBG8KMNp3MRdGeYKSudMDFtBS86uE8nzWEe5v
	a8CfaEawnbrmqXklNcksitW8TUN0x1wEip6a7zDZlkdKaRBllociBadnbaExT9c9ou3QCvpRH4AgG
	bSH5gSP2c1D5dxXxDWXZkTYGeRAN4a/hJ1z/YW9bJKB/4Im2NbAtVPF75WnxH6OHWaCKH0GsK31IY
	N6mfY+UQ==;
Date: Tue, 9 May 2023 13:35:48 +0200
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
Message-ID: <20230509113548.GD38236@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.240871842@linutronix.de>
 <20230509110722.GZ83892@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509110722.GZ83892@hirez.programming.kicks-ass.net>

On Tue, May 09, 2023 at 01:07:23PM +0200, Peter Zijlstra wrote:
> On Mon, May 08, 2023 at 09:43:55PM +0200, Thomas Gleixner wrote:
> 
> > +static inline void cpuhp_ap_update_sync_state(enum cpuhp_sync_state state)
> > +{
> > +	atomic_t *st = this_cpu_ptr(&cpuhp_state.ap_sync_state);
> > +	int sync = atomic_read(st);
> > +
> > +	while (!atomic_try_cmpxchg(st, &sync, state));
> > +}
> 
> Why isn't:
> 
> 	atomic_set(st, state);
> 
> any good?

Hmm, should at the very least be atomic_set_release(), but if you want
the full barrier then:

	(void)atomic_xchg(st, state);

is the much saner way to write the above.

