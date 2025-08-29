Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FB1B3BD45
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 16:13:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101500.1454546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urzqp-0005oF-KM; Fri, 29 Aug 2025 14:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101500.1454546; Fri, 29 Aug 2025 14:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urzqp-0005lN-H7; Fri, 29 Aug 2025 14:13:11 +0000
Received: by outflank-mailman (input) for mailman id 1101500;
 Fri, 29 Aug 2025 14:13:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ygma=3J=bounce.vates.tech=bounce-md_30504962.68b1b571.v1-dd6999c02dca4e5a854cb5b08c11e3e1@srs-se1.protection.inumbo.net>)
 id 1urzqn-0005lH-QL
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 14:13:10 +0000
Received: from mail180-6.suw31.mandrillapp.com
 (mail180-6.suw31.mandrillapp.com [198.2.180.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48867209-84e2-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 16:13:07 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-6.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4cD0bj5tCBz2K23lM
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 14:13:05 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 dd6999c02dca4e5a854cb5b08c11e3e1; Fri, 29 Aug 2025 14:13:05 +0000
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
X-Inumbo-ID: 48867209-84e2-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756476785; x=1756746785;
	bh=kAEN+eWtgHOy6UQP9yE2az89wh+Dh7LQuiy7kOxQfGs=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ogt4Q29aknVNxLiwUwP0tI/PlDX8NyP0YQg3R2z8tvhF8ZwiVJMT3iWxwRx7yb/rQ
	 7t3to7/JK2naU+iCiOfkuE6okfizu0Fp73UWn413qPr411q2IsHRkHSh9w3JuiqwQh
	 umawy/AeznZngixwjPM4p9pXYUuZWlkvKm4gaAcdCEz6jg7tVZeZe0toKRRWuggMqq
	 kgrisLzsKnPpUSvGlEaoz0dPsP0iBZxC+zWGisL+haMHdKsjaGPXTzb/LGudCqBFbQ
	 kEHQbYIEr5t9wOHiVFBsT+rBj2TIJ8J5+L//oH6JFuId40lI15413rpXVNSIbXvfxY
	 57GtLnXVGTcOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756476785; x=1756737285; i=teddy.astie@vates.tech;
	bh=kAEN+eWtgHOy6UQP9yE2az89wh+Dh7LQuiy7kOxQfGs=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=tDBzhBIXt1/IPYLLlBXPfIcmdAvMSXuMvNF6S5MkhZFNaSS1O1mQ0t2EWyFhBZNWF
	 Mm6S3jFwqDJqpADhJITV1QrSsEbMmRBuOdiLfQZEzVvC9Opg6+xpG3t9akaRHJARfo
	 S/lSwDoPlevL7HMTjY9VsJVgi61MOj6MQb6/nQdSJuXgMdNUZpA+AKdvDCxk7Yh6yw
	 BooYiRDAtRSk6Yr1/jOM6jifGv/wDjfF2r0FbISWbROtvukq8tcwxPInQGS0dBXg73
	 NOvxOvfFjWcbQvneD4i9zW5fbaQr7WxQ/rrY+fT2HA6YTeC2Lwm+z23vGU4tFRHXFO
	 CO4Do/T6/LMjw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=20v3=203/3]=20x86/hvm:=20Introduce=20Xen-wide=20ASID=20allocator?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756476784413
Message-Id: <2c16b9f8-580e-4df2-9790-1c3e327b349d@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Vaishali Thakkar" <vaishali.thakkar@suse.com>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1750770621.git.teddy.astie@vates.tech> <81169a40fdc8c124b1656e451ac2e81f4e8edd2d.1750770621.git.teddy.astie@vates.tech> <7d9fd72a-39b7-43b0-875f-859a7a45c4fb@suse.com>
In-Reply-To: <7d9fd72a-39b7-43b0-875f-859a7a45c4fb@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.dd6999c02dca4e5a854cb5b08c11e3e1?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250829:md
Date: Fri, 29 Aug 2025 14:13:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 28/08/2025 =C3=A0 15:05, Jan Beulich a =C3=A9crit=C2=A0:
> On 26.06.2025 16:01, Teddy Astie wrote:
>> From: Vaishali Thakkar <vaishali.thakkar@suse.com> (formely vates.tech)
>>
>> Currently ASID generation and management is done per-PCPU. This
>> scheme is incompatible with SEV technologies as SEV VMs need to
>> have a fixed ASID associated with all vcpus of the VM throughout
>> it's lifetime.
>>
>> This commit introduces a Xen-wide allocator which initializes
>> the asids at the start of xen and allows to have a fixed asids
>> throughout the lifecycle of all domains. Having a fixed asid
>> for non-SEV domains also presents us with the opportunity to
>> further take use of AMD instructions like TLBSYNC and INVLPGB
>> for broadcasting the TLB invalidations.
>>
>> Introduce vcpu->needs_tlb_flush attribute to schedule a guest TLB
>> flush for the next VMRUN/VMENTER. This will be later be done using
>> either TLB_CONTROL field (AMD) or INVEPT (Intel). This flush method
>> is used in place of the current ASID swapping logic.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> Signed-off-by: Vaishali Thakkar <vaishali.thakkar@suse.com> (formely vat=
es.tech)
> 
> Not sure whether you may legitimately alter pre-existing S-o-b. In
> any event the two S-o-b looks to be in the wrong order; like most
> other tags they want to be sorted chronologically.
> 

Yes, I misordered it, will fix it for the next version.

>> ---
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> Should the ASID/VPID/VMID management logic code being shared accross
>> x86/ARM/RISC-V ?
> 
> If all present and future architectures agree on how exactly they want
> to use these IDs. Which I'm unsure of. RISC-V is now vaguely following
> the original x86 model.
> 
>> Is it possible to have multiples vCPUs of a same domain simultaneously
>> scheduled on top of a single pCPU ? If so, it would need a special
>> consideration for this corner case, such as we don't miss a TLB flush
>> in such cases.
> 
> No, how would two entities be able to run on a single pCPU at any single
> point in time?
> 

It was more concerning regarding having 2 vCPUs of the same domain (thus 
sharing the same ASID) running consecutively, e.g having on the same core
   dom1.vcpu1 -> dom1.vcpu2

without a appropriate TLB flush; because the address space may not be 
consistent between 2 vCPUs.

I found a approach to fix it by tracking per domain which vCPU last ran 
on each pCPU so that in case of mismatch, we need to TLB flush. Along 
with explictely flush the TLB when the vCPU is migrated, because in the 
case too the TLB can be inconsistent for the ASID.

>> I get various stability when testing shadow paging in these patches, uns=
ure
>> what's the exact root case. HAP works perfectly fine though.
>>
>> TODO:
>> - Intel: Don't assign the VPID at each VMENTER, though we need
>>    to rethink how we manage VMCS with nested virtualization / altp2m
>>    for changing this behavior.
>> - AMD: Consider hot-plug of CPU with ERRATA_170. (is it possible ?)
>> - Consider cases where we don't have enough ASIDs (e.g Xen as nested gue=
st)
>> - Nested virtualization ASID management
> 
> For these last two points - maybe we really need a mixed model?
> 

Mixed model would not allow future support for broadcast TLB 
invalidation (even for hypervisor use) with e.g AMD INVLPGB or (future) 
Intel Remote Action Request.

>> ---
>>   xen/arch/x86/flushtlb.c                |  31 +++---
>>   xen/arch/x86/hvm/asid.c                | 148 +++++++++----------------
>>   xen/arch/x86/hvm/emulate.c             |   2 +-
>>   xen/arch/x86/hvm/hvm.c                 |  14 ++-
>>   xen/arch/x86/hvm/nestedhvm.c           |   6 +-
>>   xen/arch/x86/hvm/svm/asid.c            |  77 ++++++++-----
>>   xen/arch/x86/hvm/svm/nestedsvm.c       |   1 -
>>   xen/arch/x86/hvm/svm/svm.c             |  36 +++---
>>   xen/arch/x86/hvm/svm/svm.h             |   4 -
>>   xen/arch/x86/hvm/vmx/vmcs.c            |   5 +-
>>   xen/arch/x86/hvm/vmx/vmx.c             |  68 ++++++------
>>   xen/arch/x86/hvm/vmx/vvmx.c            |   5 +-
>>   xen/arch/x86/include/asm/flushtlb.h    |   7 --
>>   xen/arch/x86/include/asm/hvm/asid.h    |  25 ++---
>>   xen/arch/x86/include/asm/hvm/domain.h  |   1 +
>>   xen/arch/x86/include/asm/hvm/hvm.h     |  15 +--
>>   xen/arch/x86/include/asm/hvm/svm/svm.h |   5 +
>>   xen/arch/x86/include/asm/hvm/vcpu.h    |  10 +-
>>   xen/arch/x86/include/asm/hvm/vmx/vmx.h |   4 +-
>>   xen/arch/x86/mm/hap/hap.c              |   6 +-
>>   xen/arch/x86/mm/p2m.c                  |   7 +-
>>   xen/arch/x86/mm/paging.c               |   2 +-
>>   xen/arch/x86/mm/shadow/hvm.c           |   1 +
>>   xen/arch/x86/mm/shadow/multi.c         |  12 +-
>>   xen/include/xen/sched.h                |   2 +
>>   25 files changed, 227 insertions(+), 267 deletions(-)
> 
> I think I said this to Vaishali already: This really wants splitting up s=
ome,
> to become halfway reviewable.
> 

Indeed, I am looking for a approach for splitting the change without 
breaking things in-between patches.

> Jan
> 

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



