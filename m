Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F207129B3
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 17:36:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540146.841693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2ZTv-0007cg-2R; Fri, 26 May 2023 15:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540146.841693; Fri, 26 May 2023 15:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2ZTu-0007ZK-VQ; Fri, 26 May 2023 15:35:54 +0000
Received: by outflank-mailman (input) for mailman id 540146;
 Fri, 26 May 2023 15:35:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/nsh=BP=digikod.net=mic@srs-se1.protection.inumbo.net>)
 id 1q2ZTt-0007ZE-Nh
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 15:35:53 +0000
Received: from smtp-bc0c.mail.infomaniak.ch (smtp-bc0c.mail.infomaniak.ch
 [2001:1600:4:17::bc0c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe589af6-fbda-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 17:35:51 +0200 (CEST)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4QSTXP6kHdzMqPDr;
 Fri, 26 May 2023 17:35:49 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4QSTXL3K3rz1Sjg; Fri, 26 May 2023 17:35:46 +0200 (CEST)
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
X-Inumbo-ID: fe589af6-fbda-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1685115349;
	bh=IVLXl6zuTaxu1Zgxrh25RMUzIB63fNH4/OIZK2HDhZ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kVMTGpVqhamFd/35Tv8GgGxW+MQc9ut6C15rUQoLevvrCTeKGaS+bLkhx73UqS/CF
	 F+QUQYt6dTBHCqDv3OJzGYoC8livFVhydjlyIX+RYotxBnPtUyqUMczbhbmQDNz+Be
	 GJfCUWCNzFZiETlN+G79KrUNM0ssQag3MigoVxSk=
Message-ID: <caa8c89c-cae4-5a40-d6a1-f93ba7045d83@digikod.net>
Date: Fri, 26 May 2023 17:35:45 +0200
MIME-Version: 1.0
User-Agent:
Subject: Re: [RFC PATCH v1 0/9] Hypervisor-Enforced Kernel Integrity
Content-Language: en-US
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "Christopherson,, Sean" <seanjc@google.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "bp@alien8.de" <bp@alien8.de>, "keescook@chromium.org"
 <keescook@chromium.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "wanpengli@tencent.com" <wanpengli@tencent.com>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "liran.alon@oracle.com" <liran.alon@oracle.com>,
 "marian.c.rotariu@gmail.com" <marian.c.rotariu@gmail.com>,
 "Graf, Alexander" <graf@amazon.com>,
 "Andersen, John S" <john.s.andersen@intel.com>,
 "madvenka@linux.microsoft.com" <madvenka@linux.microsoft.com>,
 "ssicleru@bitdefender.com" <ssicleru@bitdefender.com>,
 "yuanyu@google.com" <yuanyu@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tgopinath@microsoft.com" <tgopinath@microsoft.com>,
 "jamorris@linux.microsoft.com" <jamorris@linux.microsoft.com>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "will@kernel.org" <will@kernel.org>,
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
 <facfd178-3157-80b4-243b-a5c8dabadbfb@digikod.net>
 <7cb6c4c28c077bb9f866c2d795e918610e77d49f.camel@intel.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <7cb6c4c28c077bb9f866c2d795e918610e77d49f.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha


On 25/05/2023 17:52, Edgecombe, Rick P wrote:
> On Thu, 2023-05-25 at 15:59 +0200, Mickaël Salaün wrote:
> [ snip ]
> 
>>> The kernel often creates writable aliases in order to write to
>>> protected data (kernel text, etc). Some of this is done right as
>>> text
>>> is being first written out (alternatives for example), and some
>>> happens
>>> way later (jump labels, etc). So for verification, I wonder what
>>> stage
>>> you would be verifying? If you want to verify the end state, you
>>> would
>>> have to maintain knowledge in the verifier of all the touch-ups the
>>> kernel does. I think it would get very tricky.
>>
>> For now, in the static kernel case, all rodata and text GPA is
>> restricted, so aliasing such memory in a writable way before or after
>> the KVM enforcement would still restrict write access to this memory,
>> which could be an issue but not a security one. Do you have such
>> examples in mind?
>>
> 
> On x86, look at all the callers of the text_poke() family. In
> arch/x86/include/asm/text-patching.h.

OK, thanks!


> 
>>
>>>
>>> It also seems it will be a decent ask for the guest kernel to keep
>>> track of GPA permissions as well as normal virtual memory
>>> pemirssions,
>>> if this thing is not widely used.
>>
>> This would indeed be required to properly handle the dynamic cases.
>>
>>
>>>
>>> So I wondering if you could go in two directions with this:
>>> 1. Make this a feature only for super locked down kernels (no
>>> modules,
>>> etc). Forbid any configurations that might modify text. But eBPF is
>>> used for seccomp, so you might be turning off some security
>>> protections
>>> to get this.
>>
>> Good idea. For "super locked down kernels" :) , we should disable all
>> kernel executable changes with the related kernel build configuration
>> (e.g. eBPF JIT, kernel module, kprobes…) to make sure there is no
>> such
>> legitimate access. This looks like an acceptable initial feature.
> 
> How many users do you think will want this protection but not
> protections that would have to be disabled? The main one that came to
> mind for me is cBPF seccomp stuff.
> 
> But also, the alternative to JITing cBPF is the eBPF interpreter which
> AFAIU is considered a juicy enough target for speculative attacks that
> they created an option to compile it out. And leaving an interpreter in
> the kernel means any data could be "executed" in the normal non-
> speculative scenario, kind of working around the hypervisor executable
> protections. Dropping e/cBPF entirely would be an option, but then I
> wonder how many users you have left. Hopefully that is all correct,
> it's hard to keep track with the pace of BPF development.

seccomp-bpf doesn't rely on JIT, so it is not an issue. For eBPF, JIT is 
optional, but other text changes may be required according to the eBPF 
program type (e.g. using kprobes).


> 
> I wonder if it might be a good idea to POC the guest side before
> settling on the KVM interface. Then you can also look at the whole
> thing and judge how much usage it would get for the different options
> of restrictions.

The next step is to handle dynamic permissions, but it will be easier to 
first implement that in KVM itself (which already has the required 
authentication code). The current interface may be flexible enough 
though, only new attribute flags should be required (and potentially an 
async mode). Anyway, this will enable to look at the whole thing.


> 
>>
>>
>>> 2. Loosen the rules to allow the protections to not be so one-way
>>> enable. Get less security, but used more widely.
>>
>> This is our goal. I think both static and dynamic cases are
>> legitimate
>> and have value according to the level of security sought. This should
>> be
>> a build-time configuration.
> 
> Yea, the proper way to do this is probably to move all text handling
> stuff into a separate domain of some sort, like you mentioned
> elsewhere. It would be quite a job.

Not necessarily to move this code, but to make sure that the changes are 
legitimate (e.g. text signatures, legitimate addresses). This doesn't 
need to be perfect but it should improve the current state by increasing 
the cost of attacks.

