Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD7E710DC1
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 16:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539617.840701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2BVP-0007Qd-UE; Thu, 25 May 2023 13:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539617.840701; Thu, 25 May 2023 13:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2BVP-0007NN-QY; Thu, 25 May 2023 13:59:51 +0000
Received: by outflank-mailman (input) for mailman id 539617;
 Thu, 25 May 2023 13:59:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uvvp=BO=digikod.net=mic@srs-se1.protection.inumbo.net>)
 id 1q2BVO-0007N8-76
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 13:59:50 +0000
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch
 [185.125.25.15]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 689a30aa-fb04-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 15:59:47 +0200 (CEST)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
 by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4QRqS21ymJzMqR7q;
 Thu, 25 May 2023 15:59:46 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4QRqRs62HQzMrvhY; Thu, 25 May 2023 15:59:37 +0200 (CEST)
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
X-Inumbo-ID: 689a30aa-fb04-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1685023186;
	bh=dkxhZ1HkwQnup1ntsnpZMoLqXeEGTbS0hUQ4TXONwZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=z7dLLPtoGNMkprHSpGt6xiWHcyKmtDBlHRXiVa8nrKOQpQVJaMTM9UlR6ArI194Tz
	 QXVWg9U8wg3ep4cqLdnYovLTDgvCD2x6qehmxK+0nYNikwoJuBw6oD50iugwe2xhqn
	 Gl2TgNvsZgLXncnPn3fvZ8S1jZ3eCH7T1FazAaIE=
Message-ID: <facfd178-3157-80b4-243b-a5c8dabadbfb@digikod.net>
Date: Thu, 25 May 2023 15:59:35 +0200
MIME-Version: 1.0
User-Agent:
Subject: Re: [RFC PATCH v1 0/9] Hypervisor-Enforced Kernel Integrity
Content-Language: en-US
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "Christopherson,, Sean" <seanjc@google.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "wanpengli@tencent.com" <wanpengli@tencent.com>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "yuanyu@google.com" <yuanyu@google.com>,
 "jamorris@linux.microsoft.com" <jamorris@linux.microsoft.com>,
 "marian.c.rotariu@gmail.com" <marian.c.rotariu@gmail.com>,
 "Graf, Alexander" <graf@amazon.com>,
 "Andersen, John S" <john.s.andersen@intel.com>,
 "madvenka@linux.microsoft.com" <madvenka@linux.microsoft.com>,
 "liran.alon@oracle.com" <liran.alon@oracle.com>,
 "ssicleru@bitdefender.com" <ssicleru@bitdefender.com>,
 "tgopinath@microsoft.com" <tgopinath@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>, "will@kernel.org"
 <will@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dev@lists.cloudhypervisor.org" <dev@lists.cloudhypervisor.org>,
 "mdontu@bitdefender.com" <mdontu@bitdefender.com>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "nicu.citu@icloud.com" <nicu.citu@icloud.com>,
 "ztarkhani@microsoft.com" <ztarkhani@microsoft.com>,
 "x86@kernel.org" <x86@kernel.org>
References: <20230505152046.6575-1-mic@digikod.net>
 <93726a7b9498ec66db21c5792079996d5fed5453.camel@intel.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <93726a7b9498ec66db21c5792079996d5fed5453.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha


On 25/05/2023 00:20, Edgecombe, Rick P wrote:
> On Fri, 2023-05-05 at 17:20 +0200, Mickaël Salaün wrote:
>> # How does it work?
>>
>> This implementation mainly leverages KVM capabilities to control the
>> Second
>> Layer Address Translation (or the Two Dimensional Paging e.g.,
>> Intel's EPT or
>> AMD's RVI/NPT) and Mode Based Execution Control (Intel's MBEC)
>> introduced with
>> the Kaby Lake (7th generation) architecture. This allows to set
>> permissions on
>> memory pages in a complementary way to the guest kernel's managed
>> memory
>> permissions. Once these permissions are set, they are locked and
>> there is no
>> way back.
>>
>> A first KVM_HC_LOCK_MEM_PAGE_RANGES hypercall enables the guest
>> kernel to lock
>> a set of its memory page ranges with either the HEKI_ATTR_MEM_NOWRITE
>> or the
>> HEKI_ATTR_MEM_EXEC attribute. The first one denies write access to a
>> specific
>> set of pages (allow-list approach), and the second only allows kernel
>> execution
>> for a set of pages (deny-list approach).
>>
>> The current implementation sets the whole kernel's .rodata (i.e., any
>> const or
>> __ro_after_init variables, which includes critical security data such
>> as LSM
>> parameters) and .text sections as non-writable, and the .text section
>> is the
>> only one where kernel execution is allowed. This is possible thanks
>> to the new
>> MBEC support also brough by this series (otherwise the vDSO would
>> have to be
>> executable). Thanks to this hardware support (VT-x, EPT and MBEC),
>> the
>> performance impact of such guest protection is negligible.
>>
>> The second KVM_HC_LOCK_CR_UPDATE hypercall enables guests to pin some
>> of its
>> CPU control register flags (e.g., X86_CR0_WP, X86_CR4_SMEP,
>> X86_CR4_SMAP),
>> which is another complementary hardening mechanism.
>>
>> Heki can be enabled with the heki=1 boot command argument.
>>
>>
> 
> Can the guest kernel ask the host VMM's emulated devices to DMA into
> the protected data? It should go through the host userspace mappings I
> think, which don't care about EPT permissions. Or did I miss where you
> are protecting that another way? There are a lot of easy ways to ask
> the host to write to guest memory that don't involve the EPT. You
> probably need to protect the host userspace mappings, and also the
> places in KVM that kmap a GPA provided by the guest.

Good point, I'll check this confused deputy attack. Extended KVM 
protections should indeed handle all ways to map guests' memory. I'm 
wondering if current VMMs would gracefully handle such new restrictions 
though.


> 
> [ snip ]
> 
>>
>> # Current limitations
>>
>> The main limitation of this patch series is the statically enforced
>> permissions. This is not an issue for kernels without module but this
>> needs to
>> be addressed.  Mechanisms that dynamically impact kernel executable
>> memory are
>> not handled for now (e.g., kernel modules, tracepoints, eBPF JIT),
>> and such
>> code will need to be authenticated.  Because the hypervisor is highly
>> privileged and critical to the security of all the VMs, we don't want
>> to
>> implement a code authentication mechanism in the hypervisor itself
>> but delegate
>> this verification to something much less privileged. We are thinking
>> of two
>> ways to solve this: implement this verification in the VMM or spawn a
>> dedicated
>> special VM (similar to Windows's VBS). There are pros on cons to each
>> approach:
>> complexity, verification code ownership (guest's or VMM's), access to
>> guest
>> memory (i.e., confidential computing).
> 
> The kernel often creates writable aliases in order to write to
> protected data (kernel text, etc). Some of this is done right as text
> is being first written out (alternatives for example), and some happens
> way later (jump labels, etc). So for verification, I wonder what stage
> you would be verifying? If you want to verify the end state, you would
> have to maintain knowledge in the verifier of all the touch-ups the
> kernel does. I think it would get very tricky.

For now, in the static kernel case, all rodata and text GPA is 
restricted, so aliasing such memory in a writable way before or after 
the KVM enforcement would still restrict write access to this memory, 
which could be an issue but not a security one. Do you have such 
examples in mind?


> 
> It also seems it will be a decent ask for the guest kernel to keep
> track of GPA permissions as well as normal virtual memory pemirssions,
> if this thing is not widely used.

This would indeed be required to properly handle the dynamic cases.


> 
> So I wondering if you could go in two directions with this:
> 1. Make this a feature only for super locked down kernels (no modules,
> etc). Forbid any configurations that might modify text. But eBPF is
> used for seccomp, so you might be turning off some security protections
> to get this.

Good idea. For "super locked down kernels" :) , we should disable all 
kernel executable changes with the related kernel build configuration 
(e.g. eBPF JIT, kernel module, kprobes…) to make sure there is no such 
legitimate access. This looks like an acceptable initial feature.


> 2. Loosen the rules to allow the protections to not be so one-way
> enable. Get less security, but used more widely.

This is our goal. I think both static and dynamic cases are legitimate 
and have value according to the level of security sought. This should be 
a build-time configuration.

> 
> There were similar dilemmas with the PV CR pinning stuff.

