Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B6F7FAADB
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642510.1002039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hpz-0005Ko-8R; Mon, 27 Nov 2023 20:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642510.1002039; Mon, 27 Nov 2023 20:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hpz-0005IJ-5V; Mon, 27 Nov 2023 20:04:11 +0000
Received: by outflank-mailman (input) for mailman id 642510;
 Mon, 27 Nov 2023 20:04:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GbWF=HI=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1r7hpw-0005GB-VH
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:04:09 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d1cb228-8d60-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 21:04:07 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r7hp0-00BhJQ-Ds; Mon, 27 Nov 2023 20:03:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id B60BD3002F1; Mon, 27 Nov 2023 21:03:08 +0100 (CET)
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
X-Inumbo-ID: 1d1cb228-8d60-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HKdTKht77swWp6IqbMhOYILRR0g0Evek+a+XDBEGFI4=; b=VlhbNNJtOQjRl9xNXhif3pyBI3
	Yp697PDT+1EY5w8uqPMVRgSViNRDlwsEBioaXw3hqY3eTB8lhCbqt0zd3cnGZiqHwqP840guPwjV2
	oriE6LXZ82ilVLw6slHwTwphcRMD/0Nd1NsiEuOe9r4lBzOcT6SSF2nX3osd+EUhPcnLH6Ranfo9H
	Bv1hzhp/gFFn6ry0jRZXH/H0Gc8LitSNJ60ue7C967EBwiz7XA/OdUI9oaNSFUlcKQNcT7WMTubkf
	R85oEhWPha2wXYJ4yiCw7hSoq1yPIGJKgfABhWmW6p9IKG8obBpzJRziZFbyBKuL64aiz/cSiRsQN
	YX0jqE5A==;
Date: Mon, 27 Nov 2023 21:03:08 +0100
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
Subject: Re: [RFC PATCH v2 18/19] heki: x86: Protect guest kernel memory
 using the KVM hypervisor
Message-ID: <20231127200308.GY3818@noisy.programming.kicks-ass.net>
References: <20231113022326.24388-1-mic@digikod.net>
 <20231113022326.24388-19-mic@digikod.net>
 <20231113085403.GC16138@noisy.programming.kicks-ass.net>
 <b1dc0963-ab99-4a79-af19-ef5ed981fa60@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1dc0963-ab99-4a79-af19-ef5ed981fa60@linux.microsoft.com>

On Mon, Nov 27, 2023 at 11:05:23AM -0600, Madhavan T. Venkataraman wrote:
> Apologies for the late reply. I was on vacation. Please see my response below:
> 
> On 11/13/23 02:54, Peter Zijlstra wrote:
> > On Sun, Nov 12, 2023 at 09:23:25PM -0500, Mickaël Salaün wrote:
> >> From: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
> >>
> >> Implement a hypervisor function, kvm_protect_memory() that calls the
> >> KVM_HC_PROTECT_MEMORY hypercall to request the KVM hypervisor to
> >> set specified permissions on a list of guest pages.
> >>
> >> Using the protect_memory() function, set proper EPT permissions for all
> >> guest pages.
> >>
> >> Use the MEM_ATTR_IMMUTABLE property to protect the kernel static
> >> sections and the boot-time read-only sections. This enables to make sure
> >> a compromised guest will not be able to change its main physical memory
> >> page permissions. However, this also disable any feature that may change
> >> the kernel's text section (e.g., ftrace, Kprobes), but they can still be
> >> used on kernel modules.
> >>
> >> Module loading/unloading, and eBPF JIT is allowed without restrictions
> >> for now, but we'll need a way to authenticate these code changes to
> >> really improve the guests' security. We plan to use module signatures,
> >> but there is no solution yet to authenticate eBPF programs.
> >>
> >> Being able to use ftrace and Kprobes in a secure way is a challenge not
> >> solved yet. We're looking for ideas to make this work.
> >>
> >> Likewise, the JUMP_LABEL feature cannot work because the kernel's text
> >> section is read-only.
> > 
> > What is the actual problem? As is the kernel text map is already RO and
> > never changed.
> 
> For the JUMP_LABEL optimization, the text needs to be patched at some point.
> That patching requires a writable mapping of the text page at the time of
> patching.
> 
> In this Heki feature, we currently lock down the kernel text at the end of
> kernel boot just before kicking off the init process. The lockdown is
> implemented by setting the permissions of a text page to R_X in the extended
> page table and not allowing write permissions in the EPT after that. So, jump label
> patching during kernel boot is not a problem. But doing it after kernel
> boot is a problem.

But you see, that's exactly what the kernel already does with the normal
permissions. They get set to RX after init and are never changed.

See the previous patch, we establish a read-write alias and write there.

You seem to lack basic understanding of how the kernel works in this
regard, which makes me very nervous about you touching any of this.

I must also say I really dislike your extra/random permssion calls all
over the place. They don't really get us anything afaict. Why can't you
plumb into the existing set_memory_*() family?

