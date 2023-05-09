Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FFC6FC3BA
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 12:20:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532072.828063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwKRi-00038y-Ra; Tue, 09 May 2023 10:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532072.828063; Tue, 09 May 2023 10:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwKRi-00036Z-Od; Tue, 09 May 2023 10:19:50 +0000
Received: by outflank-mailman (input) for mailman id 532072;
 Tue, 09 May 2023 10:19:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SDpd=A6=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pwKRg-00036R-Sg
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 10:19:48 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0512a847-ee53-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 12:19:45 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pwKQx-00F95R-HR; Tue, 09 May 2023 10:19:03 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4B1FF300451;
 Tue,  9 May 2023 12:19:02 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 29A6F20B21BBE; Tue,  9 May 2023 12:19:02 +0200 (CEST)
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
X-Inumbo-ID: 0512a847-ee53-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PKLh6UaLISIjcUauhr3iF6UlbMhF5g8Vn0HXFbC39j0=; b=K8SrgFC3k1Pze4pOS36EiCmG5X
	E4mGhrJh8Tp4MMzIggJmmXSFDZoSRoQqK8ZUoW5YCSL9s//gW2n7gBpJeQTN7vOfD2LUm3mpTdcjL
	DTdVl75NGlZb4DOM8Wve9/AenoFUKmgzoAxcsYqONDoeb7PPUXjOxPipqJ24L4IRLmGatnmIZpg2K
	HOlNGraQ3bkXrLYD9MfaMGh6bgWxWd7JPQwv1bSEkvzLwsfu5SOyXdDbvpO1kezDEFG52JV23LZ25
	KZPTC+yVvXc+uJTxC9FqAeTMucXuRrB9TjfoerWv5xB7Ih77dPE2yMPM9BF4mN/7ksbc1OfszoqR+
	0x9nU15w==;
Date: Tue, 9 May 2023 12:19:02 +0200
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
Message-ID: <20230509101902.GV83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185217.671595388@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508185217.671595388@linutronix.de>


Again, not really this patch, but since I had to look at this code ....

On Mon, May 08, 2023 at 09:43:39PM +0200, Thomas Gleixner wrote:
> @@ -1048,60 +1066,89 @@ static int do_boot_cpu(int apicid, int c

	/*
	 * AP might wait on cpu_callout_mask in cpu_init() with
	 * cpu_initialized_mask set if previous attempt to online
	 * it timed-out. Clear cpu_initialized_mask so that after
	 * INIT/SIPI it could start with a clean state.
	 */
	cpumask_clear_cpu(cpu, cpu_initialized_mask);
	smp_mb();

^^^ that barrier is weird too, cpumask_clear_cpu() is an atomic op and
implies much the same (this is x86 after all). If you want to be super
explicit about it write:

	smp_mb__after_atomic();

(which is a no-op) but then it still very much requires a comment as to
what exactly it orders against what.


	/*
	 * Wake up a CPU in difference cases:
	 * - Use a method from the APIC driver if one defined, with wakeup
	 *   straight to 64-bit mode preferred over wakeup to RM.
	 * Otherwise,
>  	 * - Use an INIT boot APIC message
>  	 */
>  	if (apic->wakeup_secondary_cpu_64)
> +		return apic->wakeup_secondary_cpu_64(apicid, start_ip);
>  	else if (apic->wakeup_secondary_cpu)
> +		return apic->wakeup_secondary_cpu(apicid, start_ip);
>  
> +	return wakeup_secondary_cpu_via_init(apicid, start_ip);
> +}

