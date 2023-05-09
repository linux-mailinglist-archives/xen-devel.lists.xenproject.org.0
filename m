Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E762E6FC5F3
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 14:10:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532154.828214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwMAU-0006JI-CQ; Tue, 09 May 2023 12:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532154.828214; Tue, 09 May 2023 12:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwMAU-0006Fy-9T; Tue, 09 May 2023 12:10:10 +0000
Received: by outflank-mailman (input) for mailman id 532154;
 Tue, 09 May 2023 12:10:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5VI=A6=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pwMAS-0004sZ-DP
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 12:10:08 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fcd4982-ee62-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 14:10:06 +0200 (CEST)
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
X-Inumbo-ID: 6fcd4982-ee62-11ed-8611-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683634206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VtDcNKByG3QGqBaMWteEmBlx8o79YaY4wIW5CrphOKI=;
	b=ozV/VUOhCbdvdcwqxdtfXZdcaA90ARKwOnYQBRouWIahnMXGWDMqDNjRrHC/BBYWjq5SZl
	0zVkjwMN1HrH8Nj5PlcDw7JkrmEq1wl2opWaW4iHlUWYz9rS55vTCEV7bvHci0YQS0msKe
	OiKR9k0tA7izR2CPXGYcFUsQfK7A+x/0KRvkRZX+qrF7KiQIDhvs0oyXBpq1rxJdGhfGCh
	MYC6WnITSxgPyRjiVJDU49KaDy0xrS7hBHILcujYL+/hxIaH+NoGh3k9eNjkZ5FjVDbyZQ
	FdCg0ek5JAc2T8OI8FHkzUUTTsC4j7rKC+fqFmbcQZsqVeexs2oybxw7tmiGyQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683634206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VtDcNKByG3QGqBaMWteEmBlx8o79YaY4wIW5CrphOKI=;
	b=ZLjODydBGy8cvSTodcStIAcmZAy/XrGuM8TLpXQA6c10hgPy1SCLXFLe3hFmS5CqBcJDXp
	pZHsXusMPUdgkGCg==
To: Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, Paul
 Menzel <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>, Usama
 Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>
Subject: Re: [patch v3 14/36] [patch V2 14/38] cpu/hotplug: Rework
 sparse_irq locking in bringup_cpu()
In-Reply-To: <20230509110223.GY83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.013044883@linutronix.de>
 <20230509110223.GY83892@hirez.programming.kicks-ass.net>
Date: Tue, 09 May 2023 14:10:06 +0200
Message-ID: <87ednp1za9.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 09 2023 at 13:02, Peter Zijlstra wrote:
> On Mon, May 08, 2023 at 09:43:49PM +0200, Thomas Gleixner wrote:
>> From: Thomas Gleixner <tglx@linutronix.de>
>> 
>> There is no harm to hold sparse_irq lock until the upcoming CPU completes
>> in cpuhp_online_idle(). This allows to remove cpu_online() synchronization
>> from architecture code.
>
> Uuuuuhh.. damn. Can you at the very least ammend the comment near
> irq_lock_sparse() to mention these extra duties?

Will do.

