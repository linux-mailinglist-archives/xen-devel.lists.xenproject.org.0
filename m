Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 838C2807540
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 17:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649358.1013780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAuu4-0001UD-CC; Wed, 06 Dec 2023 16:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649358.1013780; Wed, 06 Dec 2023 16:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAuu4-0001Rl-8O; Wed, 06 Dec 2023 16:37:40 +0000
Received: by outflank-mailman (input) for mailman id 649358;
 Wed, 06 Dec 2023 16:37:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d4zt=HR=linux.microsoft.com=madvenka@srs-se1.protection.inumbo.net>)
 id 1rAuu3-0001Qa-GF
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 16:37:39 +0000
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id c3f2529f-9455-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 17:37:37 +0100 (CET)
Received: from [192.168.4.26] (unknown [47.186.13.91])
 by linux.microsoft.com (Postfix) with ESMTPSA id 8823E20B74C0;
 Wed,  6 Dec 2023 08:37:34 -0800 (PST)
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
X-Inumbo-ID: c3f2529f-9455-11ee-98e5-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8823E20B74C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1701880656;
	bh=1wQFnh2bPx3Ra+HT0vuTvJh3mkp2WmHQjZ5XzPfzvKU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s6K+9Yl89Z3KgwoiYSQZ2dvP0uHj6IpQUthOWrczE2xRQB83yQa/TT5PF6Hy3U1sa
	 8E05mbqFUb33ePDO+wVm37jwLQyxQau0SjCjOt7vH/QkttsTN3Z9GdmbJ5scmpsxun
	 Ibo6TwIr6zVmB49da7xmGxwKzie0382EULwJL3Ko=
Message-ID: <624a310b-c0d2-406c-a4a7-d851b3cc68f5@linux.microsoft.com>
Date: Wed, 6 Dec 2023 10:37:33 -0600
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
Content-Language: en-US
From: "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>
In-Reply-To: <20231130113315.GE20191@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/30/23 05:33, Peter Zijlstra wrote:
> On Wed, Nov 29, 2023 at 03:07:15PM -0600, Madhavan T. Venkataraman wrote:
> 
>> Kernel Lockdown
>> ---------------
>>
>> But, we must provide at least some security in V2. Otherwise, it is useless.
>>
>> So, we have implemented what we call a kernel lockdown. At the end of kernel
>> boot, Heki establishes permissions in the extended page table as mentioned
>> before. Also, it adds an immutable attribute for kernel text and kernel RO data.
>> Beyond that point, guest requests that attempt to modify permissions on any of
>> the immutable pages will be denied.
>>
>> This means that features like FTrace and KProbes will not work on kernel text
>> in V2. This is a temporary limitation. Once authentication is in place, the
>> limitation will go away.
> 
> So either you're saying your patch 17 / text_poke is broken (so why
> include it ?!?) or your statement above is incorrect. Pick one.
> 

It has been included so that people can be aware of the changes.

I will remove the text_poke() changes from the patchset and send it later when
I have some authentication in place. It will make sense then.

> 
>> __text_poke()
>> 	This function is called by various features to patch text.
>> 	This calls heki_text_poke_start() and heki_text_poke_end().
>>
>> 	heki_text_poke_start() is called to add write permissions to the
>> 	extended page table so that text can be patched. heki_text_poke_end()
>> 	is called to revert write permissions in the extended page table.
> 
> This, if text_poke works, then static_call / jump_label / ftrace and
> everything else should work, they all rely on this.
> 
> 
>> Peter mentioned the following:
>>
>> "if you want to mirror the native PTEs why don't you hook into the
>> paravirt page-table muck and get all that for free?"
>>
>> We did consider using a shadow page table kind of approach so that guest page table
>> modifications can be intercepted and reflected in the page table entry. We did not
>> do this for two reasons:
>>
>> - there are bits in the page table entry that are not permission bits. We would like
>>   the guest kernel to be able to modify them directly.
> 
> This statement makes no sense.
> 
>> - we cannot tell a genuine request from an attack.
> 
> Why not? How is an explicit call different from an explicit call in a
> paravirt hook?
> 
>>From a maintenance pov we already hate paravirt with a passion, but it
> is ever so much better than sprinkling yet another pile of crap
> (heki_*) around.

I only said that the idea was considered.

We can resume the discussion on this topic when I send the text_poke() changes in a later
version of the Heki patchset.

Madhavan

