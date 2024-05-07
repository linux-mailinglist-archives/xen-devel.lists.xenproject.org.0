Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA66F8BDE4A
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 11:31:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717942.1120445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4H9c-0005Zr-Ff; Tue, 07 May 2024 09:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717942.1120445; Tue, 07 May 2024 09:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4H9c-0005XN-Cz; Tue, 07 May 2024 09:30:32 +0000
Received: by outflank-mailman (input) for mailman id 717942;
 Tue, 07 May 2024 09:30:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SDgQ=MK=digikod.net=mic@srs-se1.protection.inumbo.net>)
 id 1s4H9b-0005XH-AI
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 09:30:31 +0000
Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch
 [185.125.25.14]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71aeadee-0c54-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 11:30:29 +0200 (CEST)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch
 [10.7.10.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4VYY0h64rLzhcB;
 Tue,  7 May 2024 11:30:28 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4VYY0d4NWlzhxd; Tue,  7 May 2024 11:30:25 +0200 (CEST)
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
X-Inumbo-ID: 71aeadee-0c54-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1715074228;
	bh=N7C083XW9HErJ1+R52TKnyEZNzil5v9FCazYyr/JQx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4cR8t/iRRSN5giqF0Iwy3XXWNCfhqE/qqqfoxy0lSmFuyqhdQ4FyOhVfsBJ5BFWv
	 xFaM80SdAPMBtmnCReKLZkFRcwvBisebzGQz+PahxsjXN1dm1r13uXB5fKC058GUn5
	 E40tFjEfU9DKYpAc1PGGy+RZ3L2pJN9bZLXwuqBg=
Date: Tue, 7 May 2024 11:30:24 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Sean Christopherson <seanjc@google.com>
Cc: Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Kees Cook <keescook@chromium.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Alexander Graf <graf@amazon.com>, 
	Angelina Vu <angelinavu@linux.microsoft.com>, Anna Trikalinou <atrikalinou@microsoft.com>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Forrest Yuan Yu <yuanyu@google.com>, 
	James Gowans <jgowans@amazon.com>, James Morris <jamorris@linux.microsoft.com>, 
	John Andersen <john.s.andersen@intel.com>, "Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>, 
	Marian Rotariu <marian.c.rotariu@gmail.com>, Mihai =?utf-8?B?RG9uyJt1?= <mdontu@bitdefender.com>, 
	=?utf-8?B?TmljdciZb3IgQ8OuyJt1?= <nicu.citu@icloud.com>, Thara Gopinath <tgopinath@microsoft.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, =?utf-8?Q?=C8=98tefan_=C8=98icleru?= <ssicleru@bitdefender.com>, 
	dev@lists.cloudhypervisor.org, kvm@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org, 
	x86@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH v3 3/5] KVM: x86: Add notifications for Heki policy
 configuration and violation
Message-ID: <20240507.ieghomae0UoC@digikod.net>
References: <20240503131910.307630-1-mic@digikod.net>
 <20240503131910.307630-4-mic@digikod.net>
 <ZjTuqV-AxQQRWwUW@google.com>
 <20240506.ohwe7eewu0oB@digikod.net>
 <ZjmFPZd5q_hEBdBz@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZjmFPZd5q_hEBdBz@google.com>
X-Infomaniak-Routing: alpha

On Mon, May 06, 2024 at 06:34:53PM GMT, Sean Christopherson wrote:
> On Mon, May 06, 2024, Mickaël Salaün wrote:
> > On Fri, May 03, 2024 at 07:03:21AM GMT, Sean Christopherson wrote:
> > > > ---
> > > > 
> > > > Changes since v1:
> > > > * New patch. Making user space aware of Heki properties was requested by
> > > >   Sean Christopherson.
> > > 
> > > No, I suggested having userspace _control_ the pinning[*], not merely be notified
> > > of pinning.
> > > 
> > >  : IMO, manipulation of protections, both for memory (this patch) and CPU state
> > >  : (control registers in the next patch) should come from userspace.  I have no
> > >  : objection to KVM providing plumbing if necessary, but I think userspace needs to
> > >  : to have full control over the actual state.
> > >  : 
> > >  : One of the things that caused Intel's control register pinning series to stall
> > >  : out was how to handle edge cases like kexec() and reboot.  Deferring to userspace
> > >  : means the kernel doesn't need to define policy, e.g. when to unprotect memory,
> > >  : and avoids questions like "should userspace be able to overwrite pinned control
> > >  : registers".
> > >  : 
> > >  : And like the confidential VM use case, keeping userspace in the loop is a big
> > >  : beneifit, e.g. the guest can't circumvent protections by coercing userspace into
> > >  : writing to protected memory.
> > > 
> > > I stand by that suggestion, because I don't see a sane way to handle things like
> > > kexec() and reboot without having a _much_ more sophisticated policy than would
> > > ever be acceptable in KVM.
> > > 
> > > I think that can be done without KVM having any awareness of CR pinning whatsoever.
> > > E.g. userspace just needs to ability to intercept CR writes and inject #GPs.  Off
> > > the cuff, I suspect the uAPI could look very similar to MSR filtering.  E.g. I bet
> > > userspace could enforce MSR pinning without any new KVM uAPI at all.
> > > 
> > > [*] https://lore.kernel.org/all/ZFUyhPuhtMbYdJ76@google.com
> > 
> > OK, I had concern about the control not directly coming from the guest,
> > especially in the case of pKVM and confidential computing, but I get you
> 
> Hardware-based CoCo is completely out of scope, because KVM has zero visibility
> into the guest (well, SNP technically allows trapping CR0/CR4, but KVM really
> shouldn't intercept CR0/CR4 for SNP guests).
> 
> And more importantly, _KVM_ doesn't define any policies for CoCo VMs.  KVM might
> help enforce policies that are defined by hardware/firmware, but KVM doesn't
> define any of its own.
> 
> If pKVM on x86 comes along, then KVM will likely get in the business of defining
> policy, but until that happens, KVM needs to stay firmly out of the picture.
> 
> > point.  It should indeed be quite similar to the MSR filtering on the
> > userspace side, except that we need another interface for the guest to
> > request such change (i.e. self-protection).
> > 
> > Would it be OK to keep this new KVM_HC_LOCK_CR_UPDATE hypercall but
> > forward the request to userspace with a VM exit instead?  That would
> > also enable userspace to get the request and directly configure the CR
> > pinning with the same VM exit.
> 
> No?  Maybe?  I strongly suspect that full support will need a richer set of APIs
> than a single hypercall.  E.g. to handle kexec(), suspend+resume, emulated SMM,
> and so on and so forth.  And that's just for CR pinning.
> 
> And hypercalls are hampered by the fact that VMCALL/VMMCALL don't allow for
> delegation or restriction, i.e. there's no way for the guest to communicate to
> the hypervisor that a less privileged component is allowed to perform some action,
> nor is there a way for the guest to say some chunk of CPL0 code *isn't* allowed
> to request transition.  Delegation and restriction all has to be done out-of-band.
> 
> It'd probably be more annoying to setup initially, but I think a synthetic device
> with an MMIO-based interface would be more powerful and flexible in the long run.
> Then userspace can evolve without needing to wait for KVM to catch up.
> 
> Actually, potential bad/crazy idea.  Why does the _host_ need to define policy?
> Linux already knows what assets it wants to (un)protect and when.  What's missing
> is a way for the guest kernel to effectively deprivilege and re-authenticate
> itself as needed.  We've been tossing around the idea of paired VMs+vCPUs to
> support VTLs and SEV's VMPLs, what if we usurped/piggybacked those ideas, with a
> bit of pKVM mixed in?
> 
> Borrowing VTL terminology, where VTL0 is the least privileged, userspace launches
> the VM at VTL0.  At some point, the guest triggers the deprivileging sequence and
> userspace creates VTL1.  Userpace also provides a way for VTL0 restrict access to
> its memory, e.g. to effectively make the page tables for the kernel's direct map
> writable only from VTL1, to make kernel text RO (or XO), etc.  And VTL0 could then
> also completely remove its access to code that changes CR0/CR4.
> 
> It would obviously require a _lot_ more upfront work, e.g. to isolate the kernel
> text that modifies CR0/CR4 so that it can be removed from VTL0, but that should
> be doable with annotations, e.g. tag relevant functions with __magic or whatever,
> throw them in a dedicated section, and then free/protect the section(s) at the
> appropriate time.
> 
> KVM would likely need to provide the ability to switch VTLs (or whatever they get
> called), and host userspace would need to provide a decent amount of the backend
> mechanisms and "core" policies, e.g. to manage VTL0 memory, teardown (turn off?)
> VTL1 on kexec(), etc.  But everything else could live in the guest kernel itself.
> E.g. to have CR pinning play nice with kexec(), toss the relevant kexec() code into
> VTL1.  That way VTL1 can verify the kexec() target and tear itself down before
> jumping into the new kernel. 
> 
> This is very off the cuff and have-wavy, e.g. I don't have much of an idea what
> it would take to harden kernel text patching, but keeping the policy in the guest
> seems like it'd make everything more tractable than trying to define an ABI
> between Linux and a VMM that is rich and flexible enough to support all the
> fancy things Linux does (and will do in the future).

Yes, we agree that the guest needs to manage its own policy.  That's why
we implemented Heki for KVM this way, but without VTLs because KVM
doesn't support them.

To sum up, is the VTL approach the only one that would be acceptable for
KVM?  If yes, that would indeed require a *lot* of work for something
we're not sure will be accepted later on.

> 
> Am I crazy?  Or maybe reinventing whatever that McAfee thing was that led to
> Intel implementing EPTP switching?
> 

