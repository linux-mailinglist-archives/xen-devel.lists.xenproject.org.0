Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6531D6FC475
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 13:03:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532103.828124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwL7t-0002pK-8F; Tue, 09 May 2023 11:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532103.828124; Tue, 09 May 2023 11:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwL7t-0002m2-54; Tue, 09 May 2023 11:03:25 +0000
Received: by outflank-mailman (input) for mailman id 532103;
 Tue, 09 May 2023 11:03:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SDpd=A6=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pwL7s-0002lw-13
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 11:03:24 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c09315e-ee59-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 13:03:21 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pwL6v-0066iJ-0M; Tue, 09 May 2023 11:02:25 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 2422B300451;
 Tue,  9 May 2023 13:02:24 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 057BF201DB6CD; Tue,  9 May 2023 13:02:24 +0200 (CEST)
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
X-Inumbo-ID: 1c09315e-ee59-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JF1V+c3UL+N9ld1zX5rd8Mu0N4lob7gKoBwZz1mVIMw=; b=aql03NPFGAMO5Kl80coujejdq3
	VXWbx83fXzAKkdlxYwSALK8eVIvquLc6Ikp1W0vcqSV2KZFsK0+H7qSrgqzM5hHqyQaI6c6dtK5Bo
	uua/mR63aSWOGyFaB0ob+GKwxTQPCDfzgAhA8c/Y3JJbxMLyT0F0HwllrurWg1mR1JDZsedVWxS9j
	FAK3tthBDoVdkkdMJDLY3MllM6CGIfUH146sLI/18R1vwH5QDSoPiTiUXSiyb2KYPpHMa/vs9cEhb
	BfS09qrwDutlOjjfAgyNrNhgddilyXlvHpPbGL7Qr4vOvio7lk2WWrZ7JrQu/SxY7BUXwYFCQ9zlK
	wcsdOk9g==;
Date: Tue, 9 May 2023 13:02:23 +0200
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
Subject: Re: [patch v3 14/36] [patch V2 14/38] cpu/hotplug: Rework sparse_irq
 locking in bringup_cpu()
Message-ID: <20230509110223.GY83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.013044883@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508185218.013044883@linutronix.de>

On Mon, May 08, 2023 at 09:43:49PM +0200, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> There is no harm to hold sparse_irq lock until the upcoming CPU completes
> in cpuhp_online_idle(). This allows to remove cpu_online() synchronization
> from architecture code.

Uuuuuhh.. damn. Can you at the very least ammend the comment near
irq_lock_sparse() to mention these extra duties?


