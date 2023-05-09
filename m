Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D216FC833
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 15:48:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532218.828303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwNgq-0003yN-Ji; Tue, 09 May 2023 13:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532218.828303; Tue, 09 May 2023 13:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwNgq-0003vr-Gr; Tue, 09 May 2023 13:47:40 +0000
Received: by outflank-mailman (input) for mailman id 532218;
 Tue, 09 May 2023 13:47:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5VI=A6=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pwNgp-0003vl-Nx
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 13:47:39 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f278ad7-ee70-11ed-b229-6b7b168915f2;
 Tue, 09 May 2023 15:47:38 +0200 (CEST)
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
X-Inumbo-ID: 0f278ad7-ee70-11ed-b229-6b7b168915f2
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683640056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EiOLX/A8rFePD0DrbaikIW8S9TmO2h3FaFar7PON5hU=;
	b=IDDtornM7g68QBrYy4uAnmWXjYq0L0EFNdR49PbDsHqDTgeml6v7RJL2t0m5sUXtVghPxN
	Y9xm+Z8m/e3hKUrE5pyar8/KK0qEKQPlYka0/Tb3iMx+mgfeyMNL/O25jjjjRzlsdTv+0Z
	8shI/utWzvYwqBv97NrrZDv7w4aKvhnGNE6KrmZ++Tu6qGaUft6vGLNO3kbS/OKo+Q0Re5
	6QCYNHWmtfZwiB9EeOwWBrdDOurFiMNsscJ4jOZMujRqBwDip8CpD7bfEN2VdQMrgNJt2m
	19jTmwkZ2nc1PLZHDKShrWj69L1Yd8FKDMqN/Q3H65LVSvPfuBkvDkQSP/O+tg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683640056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EiOLX/A8rFePD0DrbaikIW8S9TmO2h3FaFar7PON5hU=;
	b=Qut7XwyPl0DgMnjgEWltV14QsYg9li7QYZrUkmEwn/8iVTGLbJy2fiNLjt0flPIbrA0rho
	MvlgsTmYsK7KiKDA==
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
 <mikelley@microsoft.com>, David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [patch v3 34/36] x86/smpboot: Implement a bit spinlock to
 protect the realmode stack
In-Reply-To: <20230509131340.GA83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185219.123719053@linutronix.de>
 <20230509131340.GA83892@hirez.programming.kicks-ass.net>
Date: Tue, 09 May 2023 15:47:36 +0200
Message-ID: <87v8h1zkef.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 09 2023 at 15:13, Peter Zijlstra wrote:
> On Mon, May 08, 2023 at 09:44:22PM +0200, Thomas Gleixner wrote:
>
> Do we really care about performance here; or should we pick the simpler
> form? Also, 'lock' is a prefix, not an instruction.

Right. KISS is the way to go.

