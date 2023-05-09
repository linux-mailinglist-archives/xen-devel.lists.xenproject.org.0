Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A05F6FC854
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 15:59:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532228.828313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwNrP-0005UY-Hg; Tue, 09 May 2023 13:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532228.828313; Tue, 09 May 2023 13:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwNrP-0005SN-F4; Tue, 09 May 2023 13:58:35 +0000
Received: by outflank-mailman (input) for mailman id 532228;
 Tue, 09 May 2023 13:58:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SDpd=A6=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pwNrN-0005SH-ID
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 13:58:34 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9465cec7-ee71-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 15:58:31 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pwNqk-0069ad-04; Tue, 09 May 2023 13:57:54 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 51BE730026A;
 Tue,  9 May 2023 15:57:49 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 3402820B08835; Tue,  9 May 2023 15:57:49 +0200 (CEST)
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
X-Inumbo-ID: 9465cec7-ee71-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hI8/gqpI8woXdIossg1TLqD9QGRFHNBoUAZE5mW3mjQ=; b=GG2RnOQApmwDBLG6Gsm3njtVQf
	QxqK9VGUrgp9oG3wZracPmQrcB+PBRcVxw73VjgtK1EMmZyecLmKDRZHvAfJpdPcc5RHZtTaq4xJD
	Mbjqc7jH+sKLynVrQ64G6thUi4zwqh8rCYsg9Lp1iTW79Slo5Qe2L9QpI3n9DvhT3p7bA6TVmgAX9
	8FkXE5EqF+OkD2XK8OFB/cQwLHDQ75opJ0AVpsGCIfoG/ikF4CYJw/Z3nYXvLfqJ6eD5BtnvJz2Bw
	RLxcdIrVYS3ih1v97QwYZHxN2Pa2PpFaGa3IzYQuFTqIQDj8U8Z4tCDPnIp0p0jNTeEO6UhbNFTql
	XWuyju0w==;
Date: Tue, 9 May 2023 15:57:49 +0200
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
Subject: Re: [patch v3 35/36] x86/smpboot: Support parallel startup of
 secondary CPUs
Message-ID: <20230509135749.GB83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185219.176824543@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508185219.176824543@linutronix.de>

On Mon, May 08, 2023 at 09:44:23PM +0200, Thomas Gleixner wrote:
> +	/*  APIC ID not found in the table. Drop the trampoline lock and bail. */
> +	movq	trampoline_lock(%rip), %rax

Again:

	movl	$0, (%rax)

is sufficient for unlock.

> +	lock
> +	btrl	$0, (%rax)

