Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6758B2E1F59
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 17:17:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58480.102881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks6ol-0006o0-Hu; Wed, 23 Dec 2020 16:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58480.102881; Wed, 23 Dec 2020 16:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks6ol-0006nc-Eh; Wed, 23 Dec 2020 16:16:51 +0000
Received: by outflank-mailman (input) for mailman id 58480;
 Wed, 23 Dec 2020 16:16:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ks6oj-0006nV-DA
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 16:16:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ks6oi-0002FS-Vr; Wed, 23 Dec 2020 16:16:48 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ks6oi-0007jn-O6; Wed, 23 Dec 2020 16:16:48 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=lQZqGhkugWov6odsmQGTbpfDqN3MieY0Ahu6c8Xudfs=; b=B0u/p6xRdv6tjkjk3Fqs8sXpTg
	VtkpzE57v5bGOAiFx/C5bQJc8eRwafDKrzlqShjKyIc3pYQ8aN8LDHCEVaoFqLX+UjEgf/a4FDBLf
	LZGjujWs/O6hNl46D00Q29gdcX9z07lDhLtCEhny1lT0cmakZRda1EKV1NbJZLuqKdwM=;
Subject: Re: [PATCH for-4.15 3/4] [RFC] xen/iommu: x86: Clear the root
 page-table before freeing the page-tables
To: Jan Beulich <jbeulich@suse.com>
Cc: hongyxia@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20201222154338.9459-1-julien@xen.org>
 <20201222154338.9459-4-julien@xen.org>
 <499e6d5a-e8ac-56db-1af9-70469b6a06b9@suse.com>
 <8b394c44-5bdb-9d82-b211-5a4ee3473568@xen.org>
 <19e92d90-ed9a-4bd6-79f4-b761b5a039c6@suse.com>
 <96ce1b10-9764-b71e-ac26-982ba8dcc34d@xen.org>
 <092e5199-7eab-2722-7f0b-43fb3c8b2065@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <281188a0-f632-c0a1-4591-0a66ef0068f5@xen.org>
Date: Wed, 23 Dec 2020 16:16:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <092e5199-7eab-2722-7f0b-43fb3c8b2065@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 23/12/2020 16:11, Jan Beulich wrote:
> On 23.12.2020 16:16, Julien Grall wrote:
>> On 23/12/2020 15:00, Jan Beulich wrote:
>>> On 23.12.2020 15:56, Julien Grall wrote:
>>>> On 23/12/2020 14:12, Jan Beulich wrote:
>>>>> On 22.12.2020 16:43, Julien Grall wrote:
>>>>>> This is an RFC because it would break AMD IOMMU driver. One option would
>>>>>> be to move the call to the teardown callback earlier on. Any opinions?
>>>>>
>>>>> We already have
>>>>>
>>>>> static void amd_iommu_domain_destroy(struct domain *d)
>>>>> {
>>>>>        dom_iommu(d)->arch.amd.root_table = NULL;
>>>>> }
>>>>>
>>>>> and this function is AMD's teardown handler. Hence I suppose
>>>>> doing the same for VT-d would be quite reasonable. And really
>>>>> VT-d's iommu_domain_teardown() also already has
>>>>>
>>>>>        hd->arch.vtd.pgd_maddr = 0;
>>>>
>>>> Let me have a look if that works.
>>>>
>>>>>
>>>>> I guess what's missing is prevention of the root table
>>>>> getting re-setup.
>>>>
>>>> This is taken care in the follow-up patch by forbidding page-table
>>>> allocation. I can mention it in the commit message.
>>>
>>> My expectation is that with that subsequent change the change here
>>> (or any variant of it) would become unnecessary.
>>
>> I am not be sure. iommu_unmap() would still get called from put_page().
>> Are you suggesting to gate the code if d->is_dying as well?
> 
> Unmap shouldn't be allocating any memory right now, as in
> non-shared-page-table mode we don't install any superpages
> (unless I misremember).

It doesn't allocate memory, but it will try to access the IOMMU 
page-tables (see more below).

> 
>> Even if this patch is deemed to be unecessary to fix the issue.
>> This issue was quite hard to chase/reproduce.
>>
>> I think it would still be good to harden the code by zeroing
>> hd->arch.vtd.pgd_maddr to avoid anyone else wasting 2 days because the
>> pointer was still "valid".
> 
> But my point was that this zeroing already happens. 
> What I
> suspect is that it gets re-populated after it was zeroed,
> because of page table manipulation that shouldn't be
> occurring anymore for a dying domain.

AFAICT, the zeroing is happening in ->teardown() helper.

It is only called when the domain is fully destroyed (see call in 
arch_domain_destroy()). This will happen much after relinquishing the code.

Could you clarify why you think it is already zeroed and by who?

Cheers,

-- 
Julien Grall

