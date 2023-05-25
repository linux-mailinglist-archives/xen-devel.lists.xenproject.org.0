Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8EB710D34
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 15:25:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539593.840641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2AyG-00014V-3S; Thu, 25 May 2023 13:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539593.840641; Thu, 25 May 2023 13:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2AyG-00011T-07; Thu, 25 May 2023 13:25:36 +0000
Received: by outflank-mailman (input) for mailman id 539593;
 Thu, 25 May 2023 13:25:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uvvp=BO=digikod.net=mic@srs-se1.protection.inumbo.net>)
 id 1q2AyD-00010z-Sn
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 13:25:34 +0000
Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch
 [45.157.188.9]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fea07c7-faff-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 15:25:32 +0200 (CEST)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
 by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4QRphW6LYlzMqNXH;
 Thu, 25 May 2023 15:25:31 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4QRphL6y4hzMrvhL; Thu, 25 May 2023 15:25:22 +0200 (CEST)
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
X-Inumbo-ID: 9fea07c7-faff-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1685021131;
	bh=FnMYgGOtsnzYjWDK5xXufVoQQ5U2qAP20b96T/ZBHdg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N/UVINRRySa+8dk6MOPMQdB5xSfG70ugF/mQ8iSHsAXEhJ3x5cnQ644+BuQ9671BQ
	 zwHHW8JkLMYSrp/tJcXYwsHIYERU1eHBBUHAhpe4S2ynd7Zz3nYjsu9tDLnvH3P5lj
	 9BBmh81fJGEtVFfk8S66LDxQxXZ1KMberOvy83Ck=
Message-ID: <0b069bc3-0362-d8ec-fc2a-05dd65218c39@digikod.net>
Date: Thu, 25 May 2023 15:25:09 +0200
MIME-Version: 1.0
User-Agent:
Subject: Re: [RFC PATCH v1 0/9] Hypervisor-Enforced Kernel Integrity
To: Trilok Soni <quic_tsoni@quicinc.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
 <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Kees Cook <keescook@chromium.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>
Cc: Alexander Graf <graf@amazon.com>, Forrest Yuan Yu <yuanyu@google.com>,
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
 <1e10da25-5704-18ee-b0ce-6de704e6f0e1@quicinc.com>
Content-Language: en-US
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <1e10da25-5704-18ee-b0ce-6de704e6f0e1@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha


On 24/05/2023 23:04, Trilok Soni wrote:
> On 5/5/2023 8:20 AM, Mickaël Salaün wrote:
>> Hi,
>>
>> This patch series is a proof-of-concept that implements new KVM features
>> (extended page tracking, MBEC support, CR pinning) and defines a new API to
>> protect guest VMs. No VMM (e.g., Qemu) modification is required.
>>
>> The main idea being that kernel self-protection mechanisms should be delegated
>> to a more privileged part of the system, hence the hypervisor. It is still the
>> role of the guest kernel to request such restrictions according to its
> 
> Only for the guest kernel images here? Why not for the host OS kernel?

As explained in the Future work section, protecting the host would be 
useful, but that doesn't really fit with the KVM model. The Protected 
KVM project is a first step to help in this direction [11].

In a nutshell, KVM is close to a type-2 hypervisor, and the host kernel 
is also part of the hypervisor.


> Embedded devices w/ Android you have mentioned below supports the host
> OS as well it seems, right?

What do you mean?


> 
> Do we suggest that all the functionalities should be implemented in the
> Hypervisor (NS-EL2 for ARM) or even at Secure EL like Secure-EL1 (ARM).

KVM runs in EL2. TrustZone is mainly used to enforce DRM, which means 
that we may not control the related code.

This patch series is dedicated to hypervisor-enforced kernel integrity, 
then KVM.

> 
> I am hoping that whatever we suggest the interface here from the Guest
> to the Hypervisor becomes the ABI right?

Yes, hypercalls are part of the KVM ABI.

> 
> 
>>
>> # Current limitations
>>
>> The main limitation of this patch series is the statically enforced
>> permissions. This is not an issue for kernels without module but this needs to
>> be addressed.  Mechanisms that dynamically impact kernel executable memory are
>> not handled for now (e.g., kernel modules, tracepoints, eBPF JIT), and such
>> code will need to be authenticated.  Because the hypervisor is highly
>> privileged and critical to the security of all the VMs, we don't want to
>> implement a code authentication mechanism in the hypervisor itself but delegate
>> this verification to something much less privileged. We are thinking of two
>> ways to solve this: implement this verification in the VMM or spawn a dedicated
>> special VM (similar to Windows's VBS). There are pros on cons to each approach:
>> complexity, verification code ownership (guest's or VMM's), access to guest
>> memory (i.e., confidential computing).
> 
> Do you foresee the performance regressions due to lot of tracking here?

The performance impact of execution prevention should be negligible 
because once configured the hypervisor do nothing except catch 
illegitimate access attempts.


> Production kernels do have lot of tracepoints and we use it as feature
> in the GKI kernel for the vendor hooks implementation and in those cases
> every vendor driver is a module.

As explained in this section, dynamic kernel modifications such as 
tracepoints or modules are not currently supported by this patch series. 
Handling tracepoints is possible but requires more work to define and 
check legitimate changes. This proposal is still useful for static 
kernels though.


> Separate VM further fragments this
> design and delegates more of it to proprietary solutions?

What do you mean? KVM is not a proprietary solution.

For dynamic checks, this would require code not run by KVM itself, but 
either the VMM or a dedicated VM. In this case, the dynamic 
authentication code could come from the guest VM or from the VMM itself. 
In the former case, it is more challenging from a security point of view 
but doesn't rely on external (proprietary) solution. In the latter case, 
open-source VMMs should implement the specification to provide the 
required service (e.g. check kernel module signature).

The goal of the common API layer provided by this RFC is to share code 
as much as possible between different hypervisor backends.


> 
> Do you have any performance numbers w/ current RFC?

No, but the only hypervisor performance impact is at boot time and 
should be negligible. I'll try to get some numbers for the 
hardware-enforcement impact, but it should be negligible too.

