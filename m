Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D31798BD423
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 19:51:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717779.1120279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s42To-0005rr-5S; Mon, 06 May 2024 17:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717779.1120279; Mon, 06 May 2024 17:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s42To-0005q4-1U; Mon, 06 May 2024 17:50:24 +0000
Received: by outflank-mailman (input) for mailman id 717779;
 Mon, 06 May 2024 17:50:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Sp3F=MJ=digikod.net=mic@srs-se1.protection.inumbo.net>)
 id 1s42Tm-0005py-Lp
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 17:50:23 +0000
Received: from smtp-8fab.mail.infomaniak.ch (smtp-8fab.mail.infomaniak.ch
 [83.166.143.171]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19a3e8bd-0bd1-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 19:50:18 +0200 (CEST)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch
 [10.4.36.108])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4VY87s1JrnzP8k;
 Mon,  6 May 2024 19:50:17 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4VY87p5F0GzB95; Mon,  6 May 2024 19:50:14 +0200 (CEST)
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
X-Inumbo-ID: 19a3e8bd-0bd1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1715017816;
	bh=FeafhCaExu57qsacTj62dWRUdrBXKjPBuLT9vOLipXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mGwJTwDHmCYyRVABfvivVlR645+s55YE3ikqtGU8J06uhEpc53bUE7Ls8lVECmSJY
	 ZoGZR6nkUaCWIF86rf6UUOQ30vsnFTU+oyKVa5juk1cYq6aZPMMxOD7Adtf6s6Qe8Z
	 /vj4j5MGtH+BC89lqOLDnwO6/+q161VQ+b28m63o=
Date: Mon, 6 May 2024 19:50:13 +0200
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
Message-ID: <20240506.ohwe7eewu0oB@digikod.net>
References: <20240503131910.307630-1-mic@digikod.net>
 <20240503131910.307630-4-mic@digikod.net>
 <ZjTuqV-AxQQRWwUW@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZjTuqV-AxQQRWwUW@google.com>
X-Infomaniak-Routing: alpha

On Fri, May 03, 2024 at 07:03:21AM GMT, Sean Christopherson wrote:
> On Fri, May 03, 2024, Mickaël Salaün wrote:
> > Add an interface for user space to be notified about guests' Heki policy
> > and related violations.
> > 
> > Extend the KVM_ENABLE_CAP IOCTL with KVM_CAP_HEKI_CONFIGURE and
> > KVM_CAP_HEKI_DENIAL. Each one takes a bitmask as first argument that can
> > contains KVM_HEKI_EXIT_REASON_CR0 and KVM_HEKI_EXIT_REASON_CR4. The
> > returned value is the bitmask of known Heki exit reasons, for now:
> > KVM_HEKI_EXIT_REASON_CR0 and KVM_HEKI_EXIT_REASON_CR4.
> > 
> > If KVM_CAP_HEKI_CONFIGURE is set, a VM exit will be triggered for each
> > KVM_HC_LOCK_CR_UPDATE hypercalls according to the requested control
> > register. This enables to enlighten the VMM with the guest
> > auto-restrictions.
> > 
> > If KVM_CAP_HEKI_DENIAL is set, a VM exit will be triggered for each
> > pinned CR violation. This enables the VMM to react to a policy
> > violation.
> > 
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: H. Peter Anvin <hpa@zytor.com>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Sean Christopherson <seanjc@google.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
> > Cc: Wanpeng Li <wanpengli@tencent.com>
> > Signed-off-by: Mickaël Salaün <mic@digikod.net>
> > Link: https://lore.kernel.org/r/20240503131910.307630-4-mic@digikod.net
> > ---
> > 
> > Changes since v1:
> > * New patch. Making user space aware of Heki properties was requested by
> >   Sean Christopherson.
> 
> No, I suggested having userspace _control_ the pinning[*], not merely be notified
> of pinning.
> 
>  : IMO, manipulation of protections, both for memory (this patch) and CPU state
>  : (control registers in the next patch) should come from userspace.  I have no
>  : objection to KVM providing plumbing if necessary, but I think userspace needs to
>  : to have full control over the actual state.
>  : 
>  : One of the things that caused Intel's control register pinning series to stall
>  : out was how to handle edge cases like kexec() and reboot.  Deferring to userspace
>  : means the kernel doesn't need to define policy, e.g. when to unprotect memory,
>  : and avoids questions like "should userspace be able to overwrite pinned control
>  : registers".
>  : 
>  : And like the confidential VM use case, keeping userspace in the loop is a big
>  : beneifit, e.g. the guest can't circumvent protections by coercing userspace into
>  : writing to protected memory.
> 
> I stand by that suggestion, because I don't see a sane way to handle things like
> kexec() and reboot without having a _much_ more sophisticated policy than would
> ever be acceptable in KVM.
> 
> I think that can be done without KVM having any awareness of CR pinning whatsoever.
> E.g. userspace just needs to ability to intercept CR writes and inject #GPs.  Off
> the cuff, I suspect the uAPI could look very similar to MSR filtering.  E.g. I bet
> userspace could enforce MSR pinning without any new KVM uAPI at all.
> 
> [*] https://lore.kernel.org/all/ZFUyhPuhtMbYdJ76@google.com

OK, I had concern about the control not directly coming from the guest,
especially in the case of pKVM and confidential computing, but I get you
point.  It should indeed be quite similar to the MSR filtering on the
userspace side, except that we need another interface for the guest to
request such change (i.e. self-protection).

Would it be OK to keep this new KVM_HC_LOCK_CR_UPDATE hypercall but
forward the request to userspace with a VM exit instead?  That would
also enable userspace to get the request and directly configure the CR
pinning with the same VM exit.

