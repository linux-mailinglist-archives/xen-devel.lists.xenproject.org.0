Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB1D807569
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 17:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649363.1013800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAuxf-0003uK-0x; Wed, 06 Dec 2023 16:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649363.1013800; Wed, 06 Dec 2023 16:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAuxe-0003sK-U3; Wed, 06 Dec 2023 16:41:22 +0000
Received: by outflank-mailman (input) for mailman id 649363;
 Wed, 06 Dec 2023 16:41:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d4zt=HR=linux.microsoft.com=madvenka@srs-se1.protection.inumbo.net>)
 id 1rAuxd-0003sE-GB
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 16:41:21 +0000
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 47c9375a-9456-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 17:41:19 +0100 (CET)
Received: from [192.168.4.26] (unknown [47.186.13.91])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9333C20B74C0;
 Wed,  6 Dec 2023 08:41:15 -0800 (PST)
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
X-Inumbo-ID: 47c9375a-9456-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9333C20B74C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1701880877;
	bh=kHlojawRkHSQzesoLwKgfjTuxP60iVUKEMogJbbgpvk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h5nzkQNQJ8Hkz9bfJUOKRk94jCH5u+61xKvm7uHbxDDbh9IZdWwgEbKwTn78PkoLZ
	 V/SvaTVRXbbegDsONVIBC1/e+Ph1euNy4EsDx3Olm8uf4UsqwQwJOXfeBOjvjh60yW
	 V40mz9ekf0xV/7t/xQurUWeNCSJJTn4OO98i49pg=
Message-ID: <db9c5049-70b5-4261-b7e8-cd371c50aaea@linux.microsoft.com>
Date: Wed, 6 Dec 2023 10:41:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 17/19] heki: x86: Update permissions counters
 during text patching
Content-Language: en-US
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "peterz@infradead.org" <peterz@infradead.org>
Cc: "ssicleru@bitdefender.com" <ssicleru@bitdefender.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "mic@digikod.net"
 <mic@digikod.net>, "marian.c.rotariu@gmail.com"
 <marian.c.rotariu@gmail.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "tgopinath@microsoft.com" <tgopinath@microsoft.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jgowans@amazon.com" <jgowans@amazon.com>,
 "ztarkhani@microsoft.com" <ztarkhani@microsoft.com>,
 "mdontu@bitdefender.com" <mdontu@bitdefender.com>,
 "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "jamorris@linux.microsoft.com" <jamorris@linux.microsoft.com>,
 "seanjc@google.com" <seanjc@google.com>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "Andersen, John S" <john.s.andersen@intel.com>,
 "yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>,
 "nicu.citu@icloud.com" <nicu.citu@icloud.com>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "Graf, Alexander" <graf@amazon.com>,
 "wanpengli@tencent.com" <wanpengli@tencent.com>,
 "dev@lists.cloudhypervisor.org" <dev@lists.cloudhypervisor.org>,
 "will@kernel.org" <will@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "yuanyu@google.com" <yuanyu@google.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 "quic_tsoni@quicinc.com" <quic_tsoni@quicinc.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
References: <20231113022326.24388-1-mic@digikod.net>
 <20231113022326.24388-18-mic@digikod.net>
 <20231113081929.GA16138@noisy.programming.kicks-ass.net>
 <a52d8885-43cc-4a4e-bb47-9a800070779e@linux.microsoft.com>
 <20231127200841.GZ3818@noisy.programming.kicks-ass.net>
 <ea63ae4e-e8ea-4fbf-9383-499e14de2f5e@linux.microsoft.com>
 <4103d68b07bb382e434cdaf19ab1986f9079b0bb.camel@intel.com>
From: "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>
In-Reply-To: <4103d68b07bb382e434cdaf19ab1986f9079b0bb.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/30/23 18:45, Edgecombe, Rick P wrote:
> On Wed, 2023-11-29 at 15:07 -0600, Madhavan T. Venkataraman wrote:
>> Threat Model
>> ------------
>>
>> In the threat model in Heki, the attacker is a user space attacker
>> who exploits
>> a kernel vulnerability to gain more privileges or bypass the kernel's
>> access
>> control and self-protection mechanisms. 
>>
>> In the context of the guest page table, one of the things that the
>> threat model translates
>> to is a hacker gaining access to a guest page with RWX permissions.
>> E.g., by adding execute
>> permissions to a writable page or by adding write permissions to an
>> executable page.
>>
>> Today, the permissions for a guest page in the extended page table
>> are RWX by
>> default. So, if a hacker manages to establish RWX for a page in the
>> guest page
>> table, then that is all he needs to do some damage.
> 
> I had a few random comments from watching the plumbers talk online:
> 
> Is there really a big difference between a page that is RWX, and a RW
> page that is about to become RX? I realize that there is an addition of
> timing, but when executable code is getting loaded it can be written to
> then and later executed. I think that gap could be addressed in two
> different ways, both pretty difficult:
>  1. Verifying the loaded code before it gets marked 
>     executable. This is difficult because the kernel does lots of 
>     tweaks on the code it is loading (alternatives, etc). It can't 
>     just check a signature.
>  2. Loading the code in a protected environment. In this model the 
>     (for example) module signature would be checked, then the code 
>     would be loaded in some sort of protected environment. This way 
>     integrity of the loaded code would be enforced. But extracting 
>     module loading into a separate domain would be difficult. 
>     Various scattered features all have their hands in the loading.
> 
> Secondly, I wonder if another way to look at the memory parts of HEKI
> could be that this is a way to protect certain page table bits from
> stay writes. The RWX bits in the EPT are not directly writable, so more
> steps are needed to change things than just a stray write (instead the
> helpers involved in the operations need to be called). If that is a
> fair way of looking at it, then I wonder how HEKI compares to a
> solution like this security-wise:
> https://lore.kernel.org/lkml/20210830235927.6443-1-rick.p.edgecombe@intel.com/
> 
> Functional-wise it had the benefit of working on bare metal and
> supporting the normal kernel features.

Thanks for the comments. I will think about what you have said and will respond
soon.

Madhavan

