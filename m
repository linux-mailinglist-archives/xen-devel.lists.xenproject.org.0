Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1A76FC43A
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 12:50:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532094.828105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwKv7-0000iY-T4; Tue, 09 May 2023 10:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532094.828105; Tue, 09 May 2023 10:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwKv7-0000fB-Q5; Tue, 09 May 2023 10:50:13 +0000
Received: by outflank-mailman (input) for mailman id 532094;
 Tue, 09 May 2023 10:50:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SDpd=A6=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pwKv5-0000f5-UP
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 10:50:12 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 447996ec-ee57-11ed-b227-6b7b168915f2;
 Tue, 09 May 2023 12:50:10 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pwKuD-0066WL-1Q; Tue, 09 May 2023 10:49:19 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C2CAA300023;
 Tue,  9 May 2023 12:49:15 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A111020B0882C; Tue,  9 May 2023 12:49:15 +0200 (CEST)
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
X-Inumbo-ID: 447996ec-ee57-11ed-b227-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8P7wZHGsQrdcODAexcyC5HmNjq7UyxY+a/r9BHYLyPc=; b=LZcrlvoWgQ+AuQIzSKoAbD0LMI
	b6BHDQIQNgv1TgrA6LONLCnHui8tdPe3S7PqOkv3sYRCrscZ+XMID94S8/TszoyfPgDPSAtQ+UTEb
	h4a3MCLNpB/XRmwM0n8A1ogc7k4Bpmn3jlbth/DX7axlvB31Yl6fCYMH6bJHqtyrRocreKHmePIjY
	oGkzR9e3lZU/07+fFI0IW2dT3qtKo/wVGsmWPmVsGg8bTZtIl1kVM5ehFmk3qTLmzEE7S3RcUzrrq
	Hzf61paJrYytBCotmCbO9yxt1Ffzzoe6S7f87moZIuIvJFRKis9FFf32XMpNwcYOWQPfdMZxjOYjd
	W8dWFyOA==;
Date: Tue, 9 May 2023 12:49:15 +0200
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
Subject: Re: [patch v3 13/36] x86/smpboot: Remove cpu_callin_mask
Message-ID: <20230509104915.GX83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185217.956149661@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508185217.956149661@linutronix.de>

On Mon, May 08, 2023 at 09:43:47PM +0200, Thomas Gleixner wrote:

> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c

> @@ -167,21 +166,16 @@ static inline void smpboot_restore_warm_
>   */
>  static void smp_callin(void)
>  {
> -	int cpuid;
> +	int cpuid = smp_processor_id();
>  
>  	/*
>  	 * If waken up by an INIT in an 82489DX configuration
> -	 * cpu_callout_mask guarantees we don't get here before
> -	 * an INIT_deassert IPI reaches our local APIC, so it is
> -	 * now safe to touch our local APIC.
> -	 */
> -	cpuid = smp_processor_id();
> -
> -	/*
> -	 * the boot CPU has finished the init stage and is spinning
> -	 * on callin_map until we finish. We are free to set up this
> -	 * CPU, first the APIC. (this is probably redundant on most
> -	 * boards)
> +	 * cpu_callout_mask guarantees we don't get here before an
> +	 * INIT_deassert IPI reaches our local APIC, so it is now safe to
> +	 * touch our local APIC.
> +	 *
> +	 * Set up this CPU, first the APIC, which is probably redundant on
> +	 * most boards.
>  	 */
>  	apic_ap_setup();
>  
> @@ -192,7 +186,7 @@ static void smp_callin(void)
>  	 * The topology information must be up to date before
>  	 * calibrate_delay() and notify_cpu_starting().
>  	 */
> -	set_cpu_sibling_map(raw_smp_processor_id());
> +	set_cpu_sibling_map(cpuid);
>  
>  	ap_init_aperfmperf();
>  
> @@ -205,11 +199,6 @@ static void smp_callin(void)
>  	 * state (CPUHP_ONLINE in the case of serial bringup).
>  	 */
>  	notify_cpu_starting(cpuid);
> -
> -	/*
> -	 * Allow the master to continue.
> -	 */
> -	cpumask_set_cpu(cpuid, cpu_callin_mask);
>  }
>  
>  static void ap_calibrate_delay(void)
> @@ -268,11 +257,6 @@ static void notrace start_secondary(void
>  	rcu_cpu_starting(raw_smp_processor_id());
>  	x86_cpuinit.early_percpu_clock_init();
>  
> -	/*
> -	 * Sync point with wait_cpu_callin(). The AP doesn't wait here
> -	 * but just sets the bit to let the controlling CPU (BSP) know that
> -	 * it's got this far.
> -	 */
>  	smp_callin();
>  
>  	/* Otherwise gcc will move up smp_processor_id() before cpu_init() */

Good riddance to that mask; however is smp_callin() still an appropriate
name for that function?

Would smp_starting() -- seeing how this kicks of CPU_STARTING not be a
better name?

