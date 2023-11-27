Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AA47FAB06
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:09:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642579.1002162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7huz-0003LZ-T0; Mon, 27 Nov 2023 20:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642579.1002162; Mon, 27 Nov 2023 20:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7huz-0003IR-Py; Mon, 27 Nov 2023 20:09:21 +0000
Received: by outflank-mailman (input) for mailman id 642579;
 Mon, 27 Nov 2023 20:09:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GbWF=HI=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1r7huy-0003IH-JN
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:09:20 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d89a8bba-8d60-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 21:09:18 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r7huM-00Bhd4-E7; Mon, 27 Nov 2023 20:08:42 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 12A193002F1; Mon, 27 Nov 2023 21:08:42 +0100 (CET)
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
X-Inumbo-ID: d89a8bba-8d60-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0g8rmOmWV3gIvWc7PsUFJZCK/mjDmfDlEjIfQZ9fLpw=; b=eDWXIpgRHK0l6Kp1zvM8AozfOF
	C6Od0RZKcBiM1TpdWu2XQUTQBZigv/lVFcp4wmzQVJpUa30ta0VAtD86zKeO0v7pZOLiVWQRr4KN8
	hk4FOzx8yGdiIasjtANlRLndmWRJMvBdSEMGCKmqSYLag0ay+cj9SgXrs1vld5SS+8dkv6bWq3SV5
	MDYEEFDnBglQijN9WYMxBEuwTpC4pfbqpYLSGbfh3mrMun861qNxt0UbAxZ6eZUufig+63zyL2qSO
	J7adiJq4wNyrGWs8soFqK96nVJbz6xxEW1NnrEo4DM5u7kBaGizRWOoC4Gn534kdhjeQxjkmw2wur
	fASu7jhg==;
Date: Mon, 27 Nov 2023 21:08:41 +0100
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
Message-ID: <20231127200841.GZ3818@noisy.programming.kicks-ass.net>
References: <20231113022326.24388-1-mic@digikod.net>
 <20231113022326.24388-18-mic@digikod.net>
 <20231113081929.GA16138@noisy.programming.kicks-ass.net>
 <a52d8885-43cc-4a4e-bb47-9a800070779e@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a52d8885-43cc-4a4e-bb47-9a800070779e@linux.microsoft.com>

On Mon, Nov 27, 2023 at 10:48:29AM -0600, Madhavan T. Venkataraman wrote:
> Apologies for the late reply. I was on vacation. Please see my response below:
> 
> On 11/13/23 02:19, Peter Zijlstra wrote:
> > On Sun, Nov 12, 2023 at 09:23:24PM -0500, Mickaël Salaün wrote:
> >> From: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
> >>
> >> X86 uses a function called __text_poke() to modify executable code. This
> >> patching function is used by many features such as KProbes and FTrace.
> >>
> >> Update the permissions counters for the text page so that write
> >> permissions can be temporarily established in the EPT to modify the
> >> instructions in that page.
> >>
> >> Cc: Borislav Petkov <bp@alien8.de>
> >> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> >> Cc: H. Peter Anvin <hpa@zytor.com>
> >> Cc: Ingo Molnar <mingo@redhat.com>
> >> Cc: Kees Cook <keescook@chromium.org>
> >> Cc: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
> >> Cc: Mickaël Salaün <mic@digikod.net>
> >> Cc: Paolo Bonzini <pbonzini@redhat.com>
> >> Cc: Sean Christopherson <seanjc@google.com>
> >> Cc: Thomas Gleixner <tglx@linutronix.de>
> >> Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
> >> Cc: Wanpeng Li <wanpengli@tencent.com>
> >> Signed-off-by: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
> >> ---
> >>
> >> Changes since v1:
> >> * New patch
> >> ---
> >>  arch/x86/kernel/alternative.c |  5 ++++
> >>  arch/x86/mm/heki.c            | 49 +++++++++++++++++++++++++++++++++++
> >>  include/linux/heki.h          | 14 ++++++++++
> >>  3 files changed, 68 insertions(+)
> >>
> >> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> >> index 517ee01503be..64fd8757ba5c 100644
> >> --- a/arch/x86/kernel/alternative.c
> >> +++ b/arch/x86/kernel/alternative.c
> >> @@ -18,6 +18,7 @@
> >>  #include <linux/mmu_context.h>
> >>  #include <linux/bsearch.h>
> >>  #include <linux/sync_core.h>
> >> +#include <linux/heki.h>
> >>  #include <asm/text-patching.h>
> >>  #include <asm/alternative.h>
> >>  #include <asm/sections.h>
> >> @@ -1801,6 +1802,7 @@ static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t l
> >>  	 */
> >>  	pgprot = __pgprot(pgprot_val(PAGE_KERNEL) & ~_PAGE_GLOBAL);
> >>  
> >> +	heki_text_poke_start(pages, cross_page_boundary ? 2 : 1, pgprot);
> >>  	/*
> >>  	 * The lock is not really needed, but this allows to avoid open-coding.
> >>  	 */
> >> @@ -1865,7 +1867,10 @@ static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t l
> >>  	}
> >>  
> >>  	local_irq_restore(flags);
> >> +
> >>  	pte_unmap_unlock(ptep, ptl);
> >> +	heki_text_poke_end(pages, cross_page_boundary ? 2 : 1, pgprot);
> >> +
> >>  	return addr;
> >>  }
> > 
> > This makes no sense, we already use a custom CR3 with userspace alias
> > for the actual pages to write to, why are you then frobbing permissions
> > on that *again* ?
> 
> Today, the permissions for a guest page in the extended page table
> (EPT) are RWX (unless permissions are restricted for some specific
> reason like for shadow page table pages). In this Heki feature, we
> don't allow RWX by default in the EPT. We only allow those permissions
> in the EPT that the guest page actually needs.  E.g., for a text page,
> it is R_X in both the guest page table and the EPT.

To what end? If you always mirror what the guest does, you've not
actually gained anything.

> For text patching, the above code establishes an alternate mapping in
> the guest page table that is RW_ so that the text can be patched. That
> needs to be reflected in the EPT so that the EPT permissions will
> change from R_X to RWX. In other words, RWX is allowed only as
> necessary. At the end of patching, the EPT permissions are restored to
> R_X.
> 
> Does that address your comment?

No, if you want to mirror the native PTEs why don't you hook into the
paravirt page-table muck and get all that for free?

Also, this is the user range, are you saying you're also playing these
daft games with user maps?

