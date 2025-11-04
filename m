Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D94D8C30B3B
	for <lists+xen-devel@lfdr.de>; Tue, 04 Nov 2025 12:19:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155680.1485121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGF4A-0004Om-LK; Tue, 04 Nov 2025 11:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155680.1485121; Tue, 04 Nov 2025 11:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGF4A-0004NN-IX; Tue, 04 Nov 2025 11:19:10 +0000
Received: by outflank-mailman (input) for mailman id 1155680;
 Tue, 04 Nov 2025 11:19:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vGF49-0004NH-Sa
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 11:19:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vGF48-000mnq-2p;
 Tue, 04 Nov 2025 11:19:09 +0000
Received: from [2a02:8012:3a1:0:2858:32e7:18b8:3bf]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vGF48-00B8d1-2i;
 Tue, 04 Nov 2025 11:19:08 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=jqbD74s3/qNZLgvgB77u3cd0QSM7CyeZ6Lct70A8kxg=; b=RB7o644sUUZxMpHN07gtiRiukP
	PaLBuiVSlEAIYwG+/R/Tn/90RHuseGbGIkdp2cpeytj0Diw9W4WcJGfLU+GvXvGmmEIyAKCWIeO6K
	Xzh4+/VTod0vW57LKTOMAPHi0nPmW1dy/8EY1MGIa4UF0Jp2VfFdfT98Rk8Zf3HA8+/M=;
Message-ID: <752d8a52-653b-481b-aa66-2f875aff3d87@xen.org>
Date: Tue, 4 Nov 2025 11:19:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Implement CPU hotplug on Arm
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1760083684.git.mykyta_poturai@epam.com>
 <CAGeoDV-=ON+WSvCQnjaa9zU_74RuFHXrqa5+p8dAjM9fxpomxw@mail.gmail.com>
 <2728d969-06fa-4f35-95a1-a79dd441242f@epam.com>
 <CAGeoDV-0VVDzR-+OkK0y+_=xs-dzZnc2ZcQSs7DTUVOJn72QLA@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAGeoDV-0VVDzR-+OkK0y+_=xs-dzZnc2ZcQSs7DTUVOJn72QLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 20/10/2025 19:00, Mykola Kvach wrote:
> Thank you for your answers
> 
> On Mon, Oct 20, 2025 at 5:15 PM Mykyta Poturai <Mykyta_Poturai@epam.com> wrote:
>>
>> On 15.10.25 20:30, Mykola Kvach wrote:
>>> Hi Mykyta,
>>>
>>> Thanks for the series.
>>>
>>> It seems there might be issues here -- please take a look and let me
>>> know if my concerns are valid:
>>>
>>> 1. FF-A notification IRQ: after a CPU down->up cycle the IRQ
>>> configuration may be lost.
>>
>> OPTEE and FFA are marked as unsupported.
> 
> Understood, thanks. Would it be worth documenting this?

This must be documented. OP-TEE, FFA and ITS will eventually be 
supported. So we need to know the gap.

I think it would also be worth to have a Kconfig indicating whether CPU 
hotplug (and soon suspend/resume) can be used with the documentation. So 
CPU hotplug will gracefully fail rather than putting the system in a 
undefined state.

>>
>>> 2. GICv3 LPIs: a CPU may fail to come back up unless its LPI pending
>>> table exists (is allocated) on bring-up. See
>>> gicv3_lpi_allocate_pendtable() and its call chain.
>>
>> ITS is marked as unsupported. I have a plan to deal with this, but it is
>> out of scope of this series.
 > > Thanks for the clarification. Should we document this somewhere?
> 
>>
>>> 3. IRQ migration on CPU down: if an IRQ targets a CPU being offlined,
>>> its affinity should be moved to an online CPU before completing the
>>> offlining.
>>
>> All guest tied IRQ migration is handled by the scheduler. Regarding the
>> irqs used by Xen, I didn't find any with affinity to other CPUs than CPU
>> 0, which can't be disabled. I think theoretically it is possible for
>> them to have different affinity, but it seems unlikely considering that
>> x86 hotplug code also doesn't seem to do any Xen irq migration AFAIU.
> 
> What about arm_smmu_init_domain_context and its related call chains?
> As far as I can see, some of these paths touch XEN_DOMCTL_* hypercalls,
> and my understanding is they can be issued on any CPU.

You are right. The SMMU can be configured from any pCPU. When 
request_irq() is called, it will route the IRQ to the current pCPU.

Those IRQs are not guest interrupts, so from my understanding, they 
would not be migrated.

> Should we add a
> check that no enabled (e)SPIs owned by Xen are pinned to the offlining
> CPU?

This would be good. But I also think we should aim to migrate those 
interrupts.

>>
>>> 4. Race between the new hypercalls and disable/enable_nonboot_cpus():
>>> disable_nonboot_cpus is called, enable_nonboot_cpus() reads
>>> frozen_cpus, and before it calls cpu_up() a hypercall onlines the CPU.
>>> cpu_up() then fails as "already online", but the CPU_RESUME_FAILED
>>> path may still run for an already-online CPU, risking use-after-free
>>> of per-CPU state (e.g. via free_percpu_area()) and other issues
>>> related to CPU_RESUME_FAILED notification.
>>>
>>
>> There don't seem to be any calls to disable/enable_nonboot_cpus() on
>> Arm.

Yet. There is a patch series to use the functions as part of 
suspend/resume. In fact this series is a pre-requisite for the 
suspend/resume series.

> If we take x86 as an example, then they are called with all domains
>> already paused, and I don't see how paused domains can issue hypercalls.

The Arm version will also freeze all the domains before calling 
disable_nonboot_cpus(). So there should be no race on Arm as well.

Cheers,

-- 
Julien Grall


