Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C71A70FF7C
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 22:53:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539217.839869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1vU6-0004um-E6; Wed, 24 May 2023 20:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539217.839869; Wed, 24 May 2023 20:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1vU6-0004sx-Aw; Wed, 24 May 2023 20:53:26 +0000
Received: by outflank-mailman (input) for mailman id 539217;
 Wed, 24 May 2023 20:53:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9d7M=BN=linux.microsoft.com=madvenka@srs-se1.protection.inumbo.net>)
 id 1q1vU5-0004sr-5F
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 20:53:25 +0000
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 059cc036-fa75-11ed-b230-6b7b168915f2;
 Wed, 24 May 2023 22:53:23 +0200 (CEST)
Received: from [192.168.4.26] (unknown [47.186.50.133])
 by linux.microsoft.com (Postfix) with ESMTPSA id E7B6E20FBA6D;
 Wed, 24 May 2023 13:53:19 -0700 (PDT)
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
X-Inumbo-ID: 059cc036-fa75-11ed-b230-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E7B6E20FBA6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1684961602;
	bh=jaoGaATWl6qH0LBuT7PMpFhq3wR8UB0SRjcinmr2MGw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gdGCklkn+W2FG8nWXMknVmZRf7MOqfBXFQSg1XVTieJjYv2pZpbSK13nBh6SaoEhT
	 jcL639wc1nVXAHEnmQmaX6AIuaD25yFRRA9zSSEUAf6N/FK7V8PguD80UGHHcNbtZY
	 /rfQmT61JJHHOojvC0XgtjYl2COQYPXjTiszLZkM=
Message-ID: <b1ffbf50-7728-64a1-5d46-10331a17530d@linux.microsoft.com>
Date: Wed, 24 May 2023 15:53:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 2/9] KVM: x86/mmu: Add support for prewrite page
 tracking
To: Sean Christopherson <seanjc@google.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?=
 =?UTF-8?Q?n?= <mic@digikod.net>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Kees Cook <keescook@chromium.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Graf <graf@amazon.com>, Forrest Yuan Yu <yuanyu@google.com>,
 James Morris <jamorris@linux.microsoft.com>,
 John Andersen <john.s.andersen@intel.com>, Liran Alon
 <liran.alon@oracle.com>, Marian Rotariu <marian.c.rotariu@gmail.com>,
 =?UTF-8?Q?Mihai_Don=c8=9bu?= <mdontu@bitdefender.com>,
 =?UTF-8?B?TmljdciZb3IgQ8OuyJt1?= <nicu.citu@icloud.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Thara Gopinath <tgopinath@microsoft.com>, Will Deacon <will@kernel.org>,
 Zahra Tarkhani <ztarkhani@microsoft.com>,
 =?UTF-8?Q?=c8=98tefan_=c8=98icleru?= <ssicleru@bitdefender.com>,
 dev@lists.cloudhypervisor.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 x86@kernel.org, xen-devel@lists.xenproject.org
References: <20230505152046.6575-1-mic@digikod.net>
 <20230505152046.6575-3-mic@digikod.net> <ZFUumGdZDNs1tkQA@google.com>
 <6412bf27-4d05-eab8-3db1-d4efa44af3aa@digikod.net>
 <ZFU9YzqG/T+Ty9gY@google.com>
Content-Language: en-US
From: "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>
In-Reply-To: <ZFU9YzqG/T+Ty9gY@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/5/23 12:31, Sean Christopherson wrote:
> On Fri, May 05, 2023, Mickaï¿½l Salaï¿½n wrote:
>>
>> On 05/05/2023 18:28, Sean Christopherson wrote:
>>> I have no doubt that we'll need to solve performance and scaling issues with the
>>> memory attributes implementation, e.g. to utilize xarray multi-range support
>>> instead of storing information on a per-4KiB-page basis, but AFAICT, the core
>>> idea is sound.  And a very big positive from a maintenance perspective is that
>>> any optimizations, fixes, etc. for one use case (CoCo vs. hardening) should also
>>> benefit the other use case.
>>>
>>> [1] https://lore.kernel.org/all/20230311002258.852397-22-seanjc@google.com
>>> [2] https://lore.kernel.org/all/Y2WB48kD0J4VGynX@google.com
>>> [3] https://lore.kernel.org/all/Y1a1i9vbJ%2FpVmV9r@google.com
>>
>> I agree, I used this mechanism because it was easier at first to rely on a
>> previous work, but while I was working on the MBEC support, I realized that
>> it's not the optimal way to do it.
>>
>> I was thinking about using a new special EPT bit similar to
>> EPT_SPTE_HOST_WRITABLE, but it may not be portable though. What do you
>> think?
> 
> On x86, SPTEs are even more ephemeral than memslots.  E.g. for historical reasons,
> KVM zaps all SPTEs if _any_ memslot is deleted, which is problematic if the guest
> is moving around BARs, using option ROMs, etc.
> 
> ARM's pKVM tracks metadata in its stage-2 PTEs, i.e. doesn't need an xarray to
> otrack attributes, but that works only because pKVM is more privileged than the
> host kernel, and the shared vs. private memory attribute that pKVM cares about
> is very, very restricted in how it can be used and changed.
> 
> I tried shoehorning private vs. shared metadata into x86's SPTEs in the past, and
> it ended up being a constant battle with the kernel, e.g. page migration, and with
> KVM itself, e.g. the above memslot mess.

Sorry for the delay in responding to this. I wanted to study the KVM code and fully
understand your comment before responding.

Yes, I quite agree with you. I will make an attempt to address this in the next version.
I am working on it right now.

Thanks.

Madhavan

