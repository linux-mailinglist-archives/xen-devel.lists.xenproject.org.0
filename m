Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8809D6E4538
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 12:32:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521946.810968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poM9l-0005qB-5l; Mon, 17 Apr 2023 10:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521946.810968; Mon, 17 Apr 2023 10:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poM9l-0005oS-2t; Mon, 17 Apr 2023 10:32:21 +0000
Received: by outflank-mailman (input) for mailman id 521946;
 Mon, 17 Apr 2023 10:32:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6fLN=AI=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1poM9j-0005oK-1J
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 10:32:19 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f98c3ae-dd0b-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 12:32:17 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1poM8N-00BF8h-AH; Mon, 17 Apr 2023 10:30:55 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E90B63002A3;
 Mon, 17 Apr 2023 12:30:50 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id B6C8B24209FD2; Mon, 17 Apr 2023 12:30:50 +0200 (CEST)
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
X-Inumbo-ID: 1f98c3ae-dd0b-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Cn+6pHKXj0VgnZYFnmy9b6moWoCaDLSiP4wWF3jJhpk=; b=eFjpJ43H0H0+AtZ/3zOGdj6Vd6
	OueCbYqge93774y/hDVMyg9JOeSPYaoz588QMxpqE7X2BrsdzYXm1eiqUkP7r5hy1uMf6j5nNTJjv
	A9RRC/WSRjF825s0T8GA0lQebZ3dp9M9IyU3teuq/dI8X2XZaUTdNuoTFxBGKCMOZfl0s4hJ10bJE
	wildSkhs3WJwK8286wr1oqCiRM+g4dc162upctej4aFx3Lq869pJvyLudFHd9czfvyLxuQYKNwfz9
	DnxilytX62HF8vLXmxZCch6S6pEDTaIL2gQ1g0bQsLMq4QE1xuAYGgNXpzurzPjqHGFuZgvEc/Dhj
	UcZ+ecNg==;
Date: Mon, 17 Apr 2023 12:30:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw@infradead.org>,
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
	David Woodhouse <dwmw@amazon.co.uk>,
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
	Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
Message-ID: <20230417103050.GF83892@hirez.programming.kicks-ass.net>
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414225551.858160935@linutronix.de>

On Sat, Apr 15, 2023 at 01:44:13AM +0200, Thomas Gleixner wrote:

> Background
> ----------
> 
> The reason why people are interested in parallel bringup is to shorten
> the (kexec) reboot time of cloud servers to reduce the downtime of the
> VM tenants. There are obviously other interesting use cases for this
> like VM startup time, embedded devices...

...

>   There are two issue there:
> 
>     a) The death by MCE broadcast problem
> 
>        Quite some (contemporary) x86 CPU generations are affected by
>        this:
> 
>          - MCE can be broadcasted to all CPUs and not only issued locally
>            to the CPU which triggered it.
> 
>          - Any CPU which has CR4.MCE == 0, even if it sits in a wait
>            for INIT/SIPI state, will cause an immediate shutdown of the
>            machine if a broadcasted MCE is delivered.

When doing kexec, CR4.MCE should already have been set to 1 by the prior
kernel, no?

