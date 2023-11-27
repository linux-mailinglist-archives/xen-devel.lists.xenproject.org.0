Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 666917FA77A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 18:05:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642363.1001796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7f34-0006kA-CG; Mon, 27 Nov 2023 17:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642363.1001796; Mon, 27 Nov 2023 17:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7f34-0006hy-9f; Mon, 27 Nov 2023 17:05:30 +0000
Received: by outflank-mailman (input) for mailman id 642363;
 Mon, 27 Nov 2023 17:05:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gQ2W=HI=linux.microsoft.com=madvenka@srs-se1.protection.inumbo.net>)
 id 1r7f33-0006hs-A0
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 17:05:29 +0000
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 28fcc5d7-8d47-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 18:05:26 +0100 (CET)
Received: from [192.168.4.26] (unknown [47.186.13.91])
 by linux.microsoft.com (Postfix) with ESMTPSA id D60A120B74C0;
 Mon, 27 Nov 2023 09:05:23 -0800 (PST)
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
X-Inumbo-ID: 28fcc5d7-8d47-11ee-9b0e-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D60A120B74C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1701104726;
	bh=hQp9k1xmzkhJv53kIi+fGz0Bm7C0uUgSE5lwBZUzRAE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rJ8cBOmhMjU1LJ0/8Jcu8Zs0D7K0IoJJgYpooleweR4JPTx8RVu3i076OKuSc40H8
	 vQyhttx9sRNbXZhKrbp4uy9amwle/wkhxSgx+XSVVJGrDjkKV6ziAkv22z1oJr2gBV
	 BrN8A1ek3f3VLgDmEE47gJhsasnKPJeYvbYTTmRg=
Message-ID: <b1dc0963-ab99-4a79-af19-ef5ed981fa60@linux.microsoft.com>
Date: Mon, 27 Nov 2023 11:05:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 18/19] heki: x86: Protect guest kernel memory using
 the KVM hypervisor
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?=
 =?UTF-8?Q?n?= <mic@digikod.net>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Kees Cook <keescook@chromium.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Graf <graf@amazon.com>, Chao Peng <chao.p.peng@linux.intel.com>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 Forrest Yuan Yu <yuanyu@google.com>, James Gowans <jgowans@amazon.com>,
 James Morris <jamorris@linux.microsoft.com>,
 John Andersen <john.s.andersen@intel.com>,
 Marian Rotariu <marian.c.rotariu@gmail.com>,
 =?UTF-8?Q?Mihai_Don=C8=9Bu?= <mdontu@bitdefender.com>,
 =?UTF-8?B?TmljdciZb3IgQ8OuyJt1?= <nicu.citu@icloud.com>,
 Thara Gopinath <tgopinath@microsoft.com>,
 Trilok Soni <quic_tsoni@quicinc.com>, Wei Liu <wei.liu@kernel.org>,
 Will Deacon <will@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 Zahra Tarkhani <ztarkhani@microsoft.com>,
 =?UTF-8?Q?=C8=98tefan_=C8=98icleru?= <ssicleru@bitdefender.com>,
 dev@lists.cloudhypervisor.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 x86@kernel.org, xen-devel@lists.xenproject.org
References: <20231113022326.24388-1-mic@digikod.net>
 <20231113022326.24388-19-mic@digikod.net>
 <20231113085403.GC16138@noisy.programming.kicks-ass.net>
From: "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>
In-Reply-To: <20231113085403.GC16138@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Apologies for the late reply. I was on vacation. Please see my response below:

On 11/13/23 02:54, Peter Zijlstra wrote:
> On Sun, Nov 12, 2023 at 09:23:25PM -0500, Mickaël Salaün wrote:
>> From: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
>>
>> Implement a hypervisor function, kvm_protect_memory() that calls the
>> KVM_HC_PROTECT_MEMORY hypercall to request the KVM hypervisor to
>> set specified permissions on a list of guest pages.
>>
>> Using the protect_memory() function, set proper EPT permissions for all
>> guest pages.
>>
>> Use the MEM_ATTR_IMMUTABLE property to protect the kernel static
>> sections and the boot-time read-only sections. This enables to make sure
>> a compromised guest will not be able to change its main physical memory
>> page permissions. However, this also disable any feature that may change
>> the kernel's text section (e.g., ftrace, Kprobes), but they can still be
>> used on kernel modules.
>>
>> Module loading/unloading, and eBPF JIT is allowed without restrictions
>> for now, but we'll need a way to authenticate these code changes to
>> really improve the guests' security. We plan to use module signatures,
>> but there is no solution yet to authenticate eBPF programs.
>>
>> Being able to use ftrace and Kprobes in a secure way is a challenge not
>> solved yet. We're looking for ideas to make this work.
>>
>> Likewise, the JUMP_LABEL feature cannot work because the kernel's text
>> section is read-only.
> 
> What is the actual problem? As is the kernel text map is already RO and
> never changed.

For the JUMP_LABEL optimization, the text needs to be patched at some point.
That patching requires a writable mapping of the text page at the time of
patching.

In this Heki feature, we currently lock down the kernel text at the end of
kernel boot just before kicking off the init process. The lockdown is
implemented by setting the permissions of a text page to R_X in the extended
page table and not allowing write permissions in the EPT after that. So, jump label
patching during kernel boot is not a problem. But doing it after kernel
boot is a problem.

The lockdown is just for the current Heki implementation. In the future, we plan
to have a way of authenticating guest requests to change permissions on a text page.
Once that is in place, permissions on text pages can be changed on the fly to
support features that depend on text patching - FTrace, KProbes, etc.

Madhavan

