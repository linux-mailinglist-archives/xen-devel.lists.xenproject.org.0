Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C417E67C2B2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 03:15:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484666.751369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKrmI-0006Ou-FP; Thu, 26 Jan 2023 02:14:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484666.751369; Thu, 26 Jan 2023 02:14:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKrmI-0006MG-Ak; Thu, 26 Jan 2023 02:14:14 +0000
Received: by outflank-mailman (input) for mailman id 484666;
 Thu, 26 Jan 2023 02:14:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NEHk=5X=csail.mit.edu=srivatsa@srs-se1.protection.inumbo.net>)
 id 1pKrmG-0006MA-VO
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 02:14:12 +0000
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu
 [128.30.2.78]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1db40a11-9d1f-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 03:14:09 +0100 (CET)
Received: from c-24-17-218-140.hsd1.wa.comcast.net ([24.17.218.140]
 helo=srivatsab3MD6R.vmware.com)
 by outgoing2021.csail.mit.edu with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <srivatsa@csail.mit.edu>) id 1pKrm9-00HW0d-KX;
 Wed, 25 Jan 2023 21:14:05 -0500
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
X-Inumbo-ID: 1db40a11-9d1f-11ed-b8d1-410ff93cb8f0
To: Sean Christopherson <seanjc@google.com>,
 Igor Mammedov <imammedo@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 amakhalov@vmware.com, ganb@vmware.com, ankitja@vmware.com,
 bordoloih@vmware.com, keerthanak@vmware.com, blamoreaux@vmware.com,
 namit@vmware.com, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Wyes Karny <wyes.karny@amd.com>,
 Lewis Caroll <lewis.carroll@amd.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, Juergen Gross <jgross@suse.com>, x86@kernel.org,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20230116060134.80259-1-srivatsa@csail.mit.edu>
 <20230116155526.05d37ff9@imammedo.users.ipa.redhat.com> <87bkmui5z4.ffs@tglx>
 <ecb9a22e-fd6e-67f0-d916-ad16033fc13c@csail.mit.edu>
 <20230120163734.63e62444@imammedo.users.ipa.redhat.com>
 <Y8rfBBBicRMk+Hut@google.com>
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Subject: Re: [PATCH v2] x86/hotplug: Do not put offline vCPUs in mwait idle
 state
Message-ID: <c3304b18-533b-4845-0ca8-b2680bfd715d@csail.mit.edu>
Date: Wed, 25 Jan 2023 18:14:01 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <Y8rfBBBicRMk+Hut@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit


Hi Igor and Sean,

On 1/20/23 10:35 AM, Sean Christopherson wrote:
> On Fri, Jan 20, 2023, Igor Mammedov wrote:
>> On Fri, 20 Jan 2023 05:55:11 -0800
>> "Srivatsa S. Bhat" <srivatsa@csail.mit.edu> wrote:
>>
>>> Hi Igor and Thomas,
>>>
>>> Thank you for your review!
>>>
>>> On 1/19/23 1:12 PM, Thomas Gleixner wrote:
>>>> On Mon, Jan 16 2023 at 15:55, Igor Mammedov wrote:  
>>>>> "Srivatsa S. Bhat" <srivatsa@csail.mit.edu> wrote:  
>>>>>> Fix this by preventing the use of mwait idle state in the vCPU offline
>>>>>> play_dead() path for any hypervisor, even if mwait support is
>>>>>> available.  
>>>>>
>>>>> if mwait is enabled, it's very likely guest to have cpuidle
>>>>> enabled and using the same mwait as well. So exiting early from
>>>>>  mwait_play_dead(), might just punt workflow down:
>>>>>   native_play_dead()
>>>>>         ...
>>>>>         mwait_play_dead();
>>>>>         if (cpuidle_play_dead())   <- possible mwait here                                              
>>>>>                 hlt_play_dead(); 
>>>>>
>>>>> and it will end up in mwait again and only if that fails
>>>>> it will go HLT route and maybe transition to VMM.  
>>>>
>>>> Good point.
>>>>   
>>>>> Instead of workaround on guest side,
>>>>> shouldn't hypervisor force VMEXIT on being uplugged vCPU when it's
>>>>> actually hot-unplugging vCPU? (ex: QEMU kicks vCPU out from guest
>>>>> context when it is removing vCPU, among other things)  
>>>>
>>>> For a pure guest side CPU unplug operation:
>>>>
>>>>     guest$ echo 0 >/sys/devices/system/cpu/cpu$N/online
>>>>
>>>> the hypervisor is not involved at all. The vCPU is not removed in that
>>>> case.
>>>>   
>>>
>>> Agreed, and this is indeed the scenario I was targeting with this patch,
>>> as opposed to vCPU removal from the host side. I'll add this clarification
>>> to the commit message.
> 
> Forcing HLT doesn't solve anything, it's perfectly legal to passthrough HLT.  I
> guarantee there are use cases that passthrough HLT but _not_ MONITOR/MWAIT, and
> that passthrough all of them.
> 
>> commit message explicitly said:
>> "which prevents the hypervisor from running other vCPUs or workloads on the
>> corresponding pCPU."
>>
>> and that implies unplug on hypervisor side as well.
>> Why? That's because when hypervisor exposes mwait to guest, it has to reserve/pin
>> a pCPU for each of present vCPUs. And you can safely run other VMs/workloads
>> on that pCPU only after it's not possible for it to be reused by VM where
>> it was used originally.
> 
> Pinning isn't strictly required from a safety perspective.  The latency of context
> switching may suffer due to wake times, but preempting a vCPU that it's C1 (or
> deeper) won't cause functional problems.   Passing through an entire socket
> (or whatever scope triggers extra fun) might be a different story, but pinning
> isn't strictly required.
> 
> That said, I 100% agree that this is expected behavior and not a bug.  Letting the
> guest execute MWAIT or HLT means the host won't have perfect visibility into guest
> activity state.
> 
> Oversubscribing a pCPU and exposing MWAIT and/or HLT to vCPUs is generally not done
> precisely because the guest will always appear busy without extra effort on the
> host.  E.g. KVM requires an explicit opt-in from userspace to expose MWAIT and/or
> HLT.
> 
> If someone really wants to effeciently oversubscribe pCPUs and passthrough MWAIT,
> then their best option is probably to have a paravirt interface so that the guest
> can tell the host its offlining a vCPU.  Barring that the host could inspect the
> guest when preempting a vCPU to try and guesstimate how much work the vCPU is
> actually doing in order to make better scheduling decisions.
> 
>> Now consider following worst (and most likely) case without unplug
>> on hypervisor side:
>>
>>  1. vm1mwait: pin pCPU2 to vCPU2
>>  2. vm1mwait: guest$ echo 0 >/sys/devices/system/cpu/cpu2/online
>>         -> HLT -> VMEXIT
>>  --
>>  3. vm2mwait: pin pCPU2 to vCPUx and start VM
>>  4. vm2mwait: guest OS onlines Vcpu and starts using it incl.
>>        going into idle=>mwait state
>>  --
>>  5. vm1mwait: it still thinks that vCPU is present it can rightfully do:
>>        guest$ echo 1 >/sys/devices/system/cpu/cpu2/online
>>  --              
>>  6.1 best case vm1mwait online fails after timeout
>>  6.2 worse case: vm2mwait does VMEXIT on vCPUx around time-frame when
>>      vm1mwait onlines vCPU2, the online may succeed and then vm2mwait's
>>      vCPUx will be stuck (possibly indefinitely) until for some reason
>>      VMEXIT happens on vm1mwait's vCPU2 _and_ host decides to schedule
>>      vCPUx on pCPU2 which would make vm1mwait stuck on vCPU2.
>> So either way it's expected behavior.
>>
>> And if there is no intention to unplug vCPU on hypervisor side,
>> then VMEXIT on play_dead is not really necessary (mwait is better
>> then HLT), since hypervisor can't safely reuse pCPU elsewhere and
>> VCPU goes into deep sleep within guest context.
>>
>> PS:
>> The only case where making HLT/VMEXIT on play_dead might work out,
>> would be if new workload weren't pinned to the same pCPU nor
>> used mwait (i.e. host can migrate it elsewhere and schedule
>> vCPU2 back on pCPU2).


That makes sense. Thank you both for the detailed explanation!
Let's drop this patch.

Regards,
Srivatsa
VMware Photon OS

