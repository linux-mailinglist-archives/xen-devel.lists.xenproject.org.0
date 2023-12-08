Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF5880AC54
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 19:42:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650782.1016564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBfnC-0005gj-1d; Fri, 08 Dec 2023 18:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650782.1016564; Fri, 08 Dec 2023 18:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBfnB-0005er-U4; Fri, 08 Dec 2023 18:41:41 +0000
Received: by outflank-mailman (input) for mailman id 650782;
 Fri, 08 Dec 2023 18:41:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BEQE=HT=linux.microsoft.com=madvenka@srs-se1.protection.inumbo.net>)
 id 1rBfnA-0005eX-9B
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 18:41:40 +0000
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6a3f9f55-95f9-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 19:41:36 +0100 (CET)
Received: from [192.168.4.26] (unknown [47.186.13.91])
 by linux.microsoft.com (Postfix) with ESMTPSA id B588020B74C0;
 Fri,  8 Dec 2023 10:41:32 -0800 (PST)
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
X-Inumbo-ID: 6a3f9f55-95f9-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B588020B74C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1702060894;
	bh=AnIC6fr2QG8zWjE8bckg2NFATj2evZRXlwuerxjzhrk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YFYB3WmwcuV32c52iaz4igd8ovlIWvHBEPQVmbIZEw3i94LbeUVkav4NsxSNfPmIk
	 iUXKkjZRomhyqjplJTf78F4BLpGH4vEdrl44twJ+PBdhRrhrueH+3FqPyjppZtB4ge
	 /VJ2zHgNQUxArYnpRJ/nZXtyaTbYEsmb8Xq9ZQ7A=
Message-ID: <eb41ec87-8e46-4880-9d94-d86849ddadd2@linux.microsoft.com>
Date: Fri, 8 Dec 2023 12:41:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 17/19] heki: x86: Update permissions counters
 during text patching
To: Peter Zijlstra <peterz@infradead.org>
Cc: =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Kees Cook <keescook@chromium.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Alexander Graf <graf@amazon.com>,
 Chao Peng <chao.p.peng@linux.intel.com>,
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
 <20231113022326.24388-18-mic@digikod.net>
 <20231113081929.GA16138@noisy.programming.kicks-ass.net>
 <a52d8885-43cc-4a4e-bb47-9a800070779e@linux.microsoft.com>
 <20231127200841.GZ3818@noisy.programming.kicks-ass.net>
 <ea63ae4e-e8ea-4fbf-9383-499e14de2f5e@linux.microsoft.com>
 <20231130113315.GE20191@noisy.programming.kicks-ass.net>
 <624a310b-c0d2-406c-a4a7-d851b3cc68f5@linux.microsoft.com>
 <20231206185134.GA9899@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>
In-Reply-To: <20231206185134.GA9899@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/6/23 12:51, Peter Zijlstra wrote:
> On Wed, Dec 06, 2023 at 10:37:33AM -0600, Madhavan T. Venkataraman wrote:
>>
>>
>> On 11/30/23 05:33, Peter Zijlstra wrote:
>>> On Wed, Nov 29, 2023 at 03:07:15PM -0600, Madhavan T. Venkataraman wrote:
>>>
>>>> Kernel Lockdown
>>>> ---------------
>>>>
>>>> But, we must provide at least some security in V2. Otherwise, it is useless.
>>>>
>>>> So, we have implemented what we call a kernel lockdown. At the end of kernel
>>>> boot, Heki establishes permissions in the extended page table as mentioned
>>>> before. Also, it adds an immutable attribute for kernel text and kernel RO data.
>>>> Beyond that point, guest requests that attempt to modify permissions on any of
>>>> the immutable pages will be denied.
>>>>
>>>> This means that features like FTrace and KProbes will not work on kernel text
>>>> in V2. This is a temporary limitation. Once authentication is in place, the
>>>> limitation will go away.
>>>
>>> So either you're saying your patch 17 / text_poke is broken (so why
>>> include it ?!?) or your statement above is incorrect. Pick one.
>>>
>>
>> It has been included so that people can be aware of the changes.
>>
>> I will remove the text_poke() changes from the patchset and send it later when
>> I have some authentication in place. It will make sense then.
> 
> If you know its broken then fucking say so in the Changelog instead of
> wasting everybody's time.. OMG.

It is not broken. It addresses one part of the problem. The other part is WIP.

I am preparing a detailed response to your comments. I ask you to be patient until then. In fact, I would appreciate your input/suggestions on some problems we are trying to solve in this context. I will mention them in my response.

Madhavan


