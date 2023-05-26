Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A59712B04
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 18:49:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540178.841753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2acz-0001Md-Mu; Fri, 26 May 2023 16:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540178.841753; Fri, 26 May 2023 16:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2acz-0001K3-JS; Fri, 26 May 2023 16:49:21 +0000
Received: by outflank-mailman (input) for mailman id 540178;
 Fri, 26 May 2023 16:49:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/nsh=BP=digikod.net=mic@srs-se1.protection.inumbo.net>)
 id 1q2acy-0001Jx-U3
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 16:49:20 +0000
Received: from smtp-8fae.mail.infomaniak.ch (smtp-8fae.mail.infomaniak.ch
 [83.166.143.174]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41a59e6f-fbe5-11ed-8611-37d641c3527e;
 Fri, 26 May 2023 18:49:19 +0200 (CEST)
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4QSW9963HFzMqBk5;
 Fri, 26 May 2023 18:49:17 +0200 (CEST)
Received: from unknown by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4QSW954GcnzMpq7x; Fri, 26 May 2023 18:49:13 +0200 (CEST)
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
X-Inumbo-ID: 41a59e6f-fbe5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1685119757;
	bh=aghhZZz/jAHNei4obfycQdpoNYo23x/hMTO/WYvr+D4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aNpuEEhr3qfgoQBoABl/c/Soy37k/dWbg29l53qY084NrLE1aBB96NeIw1GJ+t33V
	 pd9trvFbpyUukW/iVPpk0eBX/Jwsza/CoS5PoumlcDlW/vnInB0QV0Wjo7cpI7eeQk
	 00f3/lqql1UIb9Yq02grk2akHYn3y+PAXnI212IM=
Message-ID: <7671b432-569a-d176-315b-d5f66fe205ef@digikod.net>
Date: Fri, 26 May 2023 18:49:12 +0200
MIME-Version: 1.0
User-Agent:
Subject: Re: [PATCH v1 6/9] KVM: x86: Add Heki hypervisor support
Content-Language: en-US
To: Wei Liu <wei.liu@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Kees Cook <keescook@chromium.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Graf <graf@amazon.com>, Forrest Yuan Yu <yuanyu@google.com>,
 James Morris <jamorris@linux.microsoft.com>,
 John Andersen <john.s.andersen@intel.com>, Liran Alon
 <liran.alon@oracle.com>,
 "Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>,
 Marian Rotariu <marian.c.rotariu@gmail.com>,
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
 <20230505152046.6575-7-mic@digikod.net>
 <ZFlnJRsJh2fX3IJb@liuwe-devbox-debian-v2>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <ZFlnJRsJh2fX3IJb@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha


On 08/05/2023 23:18, Wei Liu wrote:
> On Fri, May 05, 2023 at 05:20:43PM +0200, Mickaël Salaün wrote:
>> From: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
>>
>> Each supported hypervisor in x86 implements a struct x86_hyper_init to
>> define the init functions for the hypervisor.  Define a new init_heki()
>> entry point in struct x86_hyper_init.  Hypervisors that support Heki
>> must define this init_heki() function.  Call init_heki() of the chosen
>> hypervisor in init_hypervisor_platform().
>>
>> Create a heki_hypervisor structure that each hypervisor can fill
>> with its data and functions. This will allow the Heki feature to work
>> in a hypervisor agnostic way.
>>
>> Declare and initialize a "heki_hypervisor" structure for KVM so KVM can
>> support Heki.  Define the init_heki() function for KVM.  In init_heki(),
>> set the hypervisor field in the generic "heki" structure to the KVM
>> "heki_hypervisor".  After this point, generic Heki code can access the
>> KVM Heki data and functions.
>>
> [...]
>> +static void kvm_init_heki(void)
>> +{
>> +	long err;
>> +
>> +	if (!kvm_para_available())
>> +		/* Cannot make KVM hypercalls. */
>> +		return;
>> +
>> +	err = kvm_hypercall3(KVM_HC_LOCK_MEM_PAGE_RANGES, -1, -1, -1);
> 
> Why not do a proper version check or capability check here? If the ABI
> or supported features ever change then we have something to rely on?

The attributes will indeed get extended, but I wanted to have a simple 
proposal for now.

Do you mean to get the version of this hypercall e.g., with a dedicated 
flag, like with the 
landlock_create_ruleset/LANDLOCK_CREATE_RULESET_VERSION syscall?


> 
> Thanks,
> Wei.

