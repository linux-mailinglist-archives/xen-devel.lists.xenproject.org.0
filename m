Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9347FEE03
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 12:34:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644557.1005710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8fJ6-0000EL-81; Thu, 30 Nov 2023 11:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644557.1005710; Thu, 30 Nov 2023 11:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8fJ6-0000Bv-5I; Thu, 30 Nov 2023 11:34:12 +0000
Received: by outflank-mailman (input) for mailman id 644557;
 Thu, 30 Nov 2023 11:34:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jK1W=HL=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1r8fJ4-0008OR-6k
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 11:34:10 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 600473df-8f74-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 12:34:09 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r8fIC-00EON3-R9; Thu, 30 Nov 2023 11:33:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id EE982300293; Thu, 30 Nov 2023 12:33:15 +0100 (CET)
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
X-Inumbo-ID: 600473df-8f74-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LyNe9cq/euZtRPSb3aioeZtMybHFVA3zxzbs+Z/bjGA=; b=kvYIC9LL0g1DtJPaX0R6PB3Hzs
	WJoc77vbRw4by7nd4F36TBnJ3T4MI9wdD7aXSPOehJlXlC/pWK+8n2z0lyxmIeom49Fq14fiWDLPi
	aeXJavXkXYJ5TXk3JFMiuM5yCmh3Z1fNGfwOqorYOzov6OJHhvEfGC6J2W+k21Mb2d45DW/SJjG55
	hXNSu7aJ+ccY2N3V7hGH5qNtY48YsH1Ay2pRTRGIIC7nAr6OzIV4MUebHtOW2bJ8WohvfYFEEkA36
	B5JdK+v24H1zWokWmH+erLMEiMEIgHVmGKZCY7RaZV+99vWq5oBYrsMdSM9TFbIUPH+2WK6BZszLl
	ZhGhcUHQ==;
Date: Thu, 30 Nov 2023 12:33:15 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Kees Cook <keescook@chromium.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Alexander Graf <graf@amazon.com>,
	Chao Peng <chao.p.peng@linux.intel.com>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	Forrest Yuan Yu <yuanyu@google.com>,
	James Gowans <jgowans@amazon.com>,
	James Morris <jamorris@linux.microsoft.com>,
	John Andersen <john.s.andersen@intel.com>,
	Marian Rotariu <marian.c.rotariu@gmail.com>,
	Mihai =?utf-8?B?RG9uyJt1?= <mdontu@bitdefender.com>,
	=?utf-8?B?TmljdciZb3IgQ8OuyJt1?= <nicu.citu@icloud.com>,
	Thara Gopinath <tgopinath@microsoft.com>,
	Trilok Soni <quic_tsoni@quicinc.com>, Wei Liu <wei.liu@kernel.org>,
	Will Deacon <will@kernel.org>,
	Yu Zhang <yu.c.zhang@linux.intel.com>,
	Zahra Tarkhani <ztarkhani@microsoft.com>,
	=?utf-8?Q?=C8=98tefan_=C8=98icleru?= <ssicleru@bitdefender.com>,
	dev@lists.cloudhypervisor.org, kvm@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
	qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
	x86@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH v2 17/19] heki: x86: Update permissions counters
 during text patching
Message-ID: <20231130113315.GE20191@noisy.programming.kicks-ass.net>
References: <20231113022326.24388-1-mic@digikod.net>
 <20231113022326.24388-18-mic@digikod.net>
 <20231113081929.GA16138@noisy.programming.kicks-ass.net>
 <a52d8885-43cc-4a4e-bb47-9a800070779e@linux.microsoft.com>
 <20231127200841.GZ3818@noisy.programming.kicks-ass.net>
 <ea63ae4e-e8ea-4fbf-9383-499e14de2f5e@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea63ae4e-e8ea-4fbf-9383-499e14de2f5e@linux.microsoft.com>

On Wed, Nov 29, 2023 at 03:07:15PM -0600, Madhavan T. Venkataraman wrote:

> Kernel Lockdown
> ---------------
> 
> But, we must provide at least some security in V2. Otherwise, it is useless.
> 
> So, we have implemented what we call a kernel lockdown. At the end of kernel
> boot, Heki establishes permissions in the extended page table as mentioned
> before. Also, it adds an immutable attribute for kernel text and kernel RO data.
> Beyond that point, guest requests that attempt to modify permissions on any of
> the immutable pages will be denied.
> 
> This means that features like FTrace and KProbes will not work on kernel text
> in V2. This is a temporary limitation. Once authentication is in place, the
> limitation will go away.

So either you're saying your patch 17 / text_poke is broken (so why
include it ?!?) or your statement above is incorrect. Pick one.


> __text_poke()
> 	This function is called by various features to patch text.
> 	This calls heki_text_poke_start() and heki_text_poke_end().
> 
> 	heki_text_poke_start() is called to add write permissions to the
> 	extended page table so that text can be patched. heki_text_poke_end()
> 	is called to revert write permissions in the extended page table.

This, if text_poke works, then static_call / jump_label / ftrace and
everything else should work, they all rely on this.


> Peter mentioned the following:
> 
> "if you want to mirror the native PTEs why don't you hook into the
> paravirt page-table muck and get all that for free?"
> 
> We did consider using a shadow page table kind of approach so that guest page table
> modifications can be intercepted and reflected in the page table entry. We did not
> do this for two reasons:
> 
> - there are bits in the page table entry that are not permission bits. We would like
>   the guest kernel to be able to modify them directly.

This statement makes no sense.

> - we cannot tell a genuine request from an attack.

Why not? How is an explicit call different from an explicit call in a
paravirt hook?

From a maintenance pov we already hate paravirt with a passion, but it
is ever so much better than sprinkling yet another pile of crap
(heki_*) around.

