Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4277A8C55E9
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 14:16:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721454.1124875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6r4X-0000fS-FS; Tue, 14 May 2024 12:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721454.1124875; Tue, 14 May 2024 12:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6r4X-0000dN-CT; Tue, 14 May 2024 12:15:57 +0000
Received: by outflank-mailman (input) for mailman id 721454;
 Tue, 14 May 2024 12:15:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/uDt=MR=digikod.net=mic@srs-se1.protection.inumbo.net>)
 id 1s6r4W-0000dF-52
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 12:15:56 +0000
Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch
 [2001:1600:4:17::190c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4eb066d-11eb-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 14:15:52 +0200 (CEST)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch
 [10.7.10.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4VdwLH3dTwzN03;
 Tue, 14 May 2024 14:15:51 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4VdwLD3B6RzB4h; Tue, 14 May 2024 14:15:48 +0200 (CEST)
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
X-Inumbo-ID: b4eb066d-11eb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1715688951;
	bh=6cLb3jtwfOqoRKJtvZPYLahhceLlkxg39lBtYJITgWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KRT/ov4rWMykef9xMhIwSZhHfcSSN6GQwPRDurzMGPbliQsS0VO6zSHgJ9Wbadi3l
	 OGIHTWGzorzDqVpD81oSg4u9D970KQGA1j7nSMc8pi7COPs75RE7gvSRn175mFw02a
	 0K4edTjsnRc2MHxsDF/mZpD6rApUOvuun3U3rT6U=
Date: Tue, 14 May 2024 14:15:46 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Sean Christopherson <seanjc@google.com>, 
	Nicolas Saenz Julienne <nsaenz@amazon.com>
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
Message-ID: <20240514.OoPohLaejai6@digikod.net>
References: <20240503131910.307630-1-mic@digikod.net>
 <20240503131910.307630-4-mic@digikod.net>
 <ZjTuqV-AxQQRWwUW@google.com>
 <20240506.ohwe7eewu0oB@digikod.net>
 <ZjmFPZd5q_hEBdBz@google.com>
 <20240507.ieghomae0UoC@digikod.net>
 <ZjpTxt-Bxia3bRwB@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZjpTxt-Bxia3bRwB@google.com>
X-Infomaniak-Routing: alpha

On Tue, May 07, 2024 at 09:16:06AM -0700, Sean Christopherson wrote:
> On Tue, May 07, 2024, Mickaël Salaün wrote:
> > > Actually, potential bad/crazy idea.  Why does the _host_ need to define policy?
> > > Linux already knows what assets it wants to (un)protect and when.  What's missing
> > > is a way for the guest kernel to effectively deprivilege and re-authenticate
> > > itself as needed.  We've been tossing around the idea of paired VMs+vCPUs to
> > > support VTLs and SEV's VMPLs, what if we usurped/piggybacked those ideas, with a
> > > bit of pKVM mixed in?
> > > 
> > > Borrowing VTL terminology, where VTL0 is the least privileged, userspace launches
> > > the VM at VTL0.  At some point, the guest triggers the deprivileging sequence and
> > > userspace creates VTL1.  Userpace also provides a way for VTL0 restrict access to
> > > its memory, e.g. to effectively make the page tables for the kernel's direct map
> > > writable only from VTL1, to make kernel text RO (or XO), etc.  And VTL0 could then
> > > also completely remove its access to code that changes CR0/CR4.
> > > 
> > > It would obviously require a _lot_ more upfront work, e.g. to isolate the kernel
> > > text that modifies CR0/CR4 so that it can be removed from VTL0, but that should
> > > be doable with annotations, e.g. tag relevant functions with __magic or whatever,
> > > throw them in a dedicated section, and then free/protect the section(s) at the
> > > appropriate time.
> > > 
> > > KVM would likely need to provide the ability to switch VTLs (or whatever they get
> > > called), and host userspace would need to provide a decent amount of the backend
> > > mechanisms and "core" policies, e.g. to manage VTL0 memory, teardown (turn off?)
> > > VTL1 on kexec(), etc.  But everything else could live in the guest kernel itself.
> > > E.g. to have CR pinning play nice with kexec(), toss the relevant kexec() code into
> > > VTL1.  That way VTL1 can verify the kexec() target and tear itself down before
> > > jumping into the new kernel. 
> > > 
> > > This is very off the cuff and have-wavy, e.g. I don't have much of an idea what
> > > it would take to harden kernel text patching, but keeping the policy in the guest
> > > seems like it'd make everything more tractable than trying to define an ABI
> > > between Linux and a VMM that is rich and flexible enough to support all the
> > > fancy things Linux does (and will do in the future).
> > 
> > Yes, we agree that the guest needs to manage its own policy.  That's why
> > we implemented Heki for KVM this way, but without VTLs because KVM
> > doesn't support them.
> > 
> > To sum up, is the VTL approach the only one that would be acceptable for
> > KVM?  
> 
> Heh, that's not a question you want to be asking.  You're effectively asking me
> to make an authorative, "final" decision on a topic which I am only passingly
> familiar with.
> 
> But since you asked it... :-)  Probably?
> 
> I see a lot of advantages to a VTL/VSM-like approach:
> 
>  1. Provides Linux-as-a guest the flexibility it needs to meaningfully advance
>     its security, with the least amount of policy built into the guest/host ABI.
> 
>  2. Largely decouples guest policy from the host, i.e. should allow the guest to
>     evolve/update it's policy without needing to coordinate changes with the host.
> 
>  3. The KVM implementation can be generic enough to be reusable for other features.
> 
>  4. Other groups are already working on VTL-like support in KVM, e.g. for VSM
>     itself, and potentially for VMPL/SVSM support.
> 
> IMO, #2 is a *huge* selling point.  Not having to coordinate changes across
> multiple code bases and/or organizations and/or maintainers is a big win for
> velocity, long term maintenance, and probably the very viability of HEKI.

Agree, this is our goal.

> 
> Providing the guest with the tools to define and implement its own policy means
> end users don't have to way for some third party, e.g. CSPs, to deploy the
> accompanying host-side changes, because there are no host-side changes.
> 
> And encapsulating everything in the guest drastically reduces the friction with
> changes in the kernel that interact with hardening, both from a technical and a
> social perspective.  I.e. giving the kernel (near) complete control over its
> destiny minimizes the number of moving parts, and will be far, far easier to sell
> to maintainers.  I would expect maintainers to react much more favorably to being
> handed tools to harden the kernel, as opposed to being presented a set of APIs
> that can be used to make the kernel compliant with _someone else's_ vision of
> what kernel hardening should look like.
> 
> E.g. imagine a new feature comes along that requires overriding CR0/CR4 pinning
> in a way that doesn't fit into existing policy.  If the VMM is involved in
> defining/enforcing the CR pinning policy, then supporting said new feature would
> require new guest/host ABI and an updated host VMM in order to make the new
> feature compatible with HEKI.  Inevitably, even if everything goes smoothly from
> an upstreaming perspective, that will result in guests that have to choose between
> HEKI and new feature X, because there is zero chance that all hosts that run Linux
> as a guest will be updated in advance of new feature X being deployed.

Sure. We need to find a generic-enough KVM interface to be able to
restrict a wide range of virtualization/hardware mechanisms (to not rely
too much on KVM changes) and delegate most of enforcement/emulation to
VTL1.  In short, policy definition owned by VTL0/guest, and policy
enforcement shared between KVM (coarse grained) and VTL1 (fine grained).

> 
> And if/when things don't go smoothly, odds are very good that kernel maintainers
> will eventually tire of having to coordinate and negotiate with QEMU and other
> VMMs, and will become resistant to continuing to support/extend HEKI.

Yes, that was our concern too and another reason why we choose to let
the guest handle its own security policy.

> 
> > If yes, that would indeed require a *lot* of work for something we're not
> > sure will be accepted later on.
> 
> Yes and no.  The AWS folks are pursuing VSM support in KVM+QEMU, and SVSM support
> is trending toward the paired VM+vCPU model.  IMO, it's entirely feasible to
> design KVM support such that much of the development load can be shared between
> the projects.  And having 2+ use cases for a feature (set) makes it _much_ more
> likely that the feature(s) will be accepted.
> 
> And similar to what Paolo said regarding HEKI not having a complete story, I
> don't see a clear line of sight for landing host-defined policy enforcement, as
> there are many open, non-trivial questions that need answers. I.e. upstreaming
> HEKI in its current form is also far from a done deal, and isn't guaranteed to
> be substantially less work when all is said and done.

I'm not sure to understand why "Heki not having a complete story".  The
goal is the same as the current kernel self-protection mechanisms.

