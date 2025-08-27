Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED33CB38B93
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 23:42:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097025.1451530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urNuI-0000T8-9e; Wed, 27 Aug 2025 21:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097025.1451530; Wed, 27 Aug 2025 21:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urNuI-0000R2-6e; Wed, 27 Aug 2025 21:42:14 +0000
Received: by outflank-mailman (input) for mailman id 1097025;
 Wed, 27 Aug 2025 21:42:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1urNuH-0000Qw-H8
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 21:42:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1urNuG-009QBV-0F;
 Wed, 27 Aug 2025 21:42:12 +0000
Received: from [2a02:8012:3a1:0:28ae:5dea:af6b:b961]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1urNuF-004lC7-3D;
 Wed, 27 Aug 2025 21:42:12 +0000
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
	bh=jZzG+YOW/6BIeuEgk0i6ENcFU5OgX9uP7NZtfGi9nL4=; b=YPfgWyeW2uZih1N4Jm5RCTw1yN
	4XZlQ9e6FXYedp4IYiIO3yBbt/UtC40ZlffrU+vT5AdStgqxn/RY3K+bTj9gFqhwLr4We4cZr4t0V
	2yWimm60LVquMk1CLkGoPeZ3uZWjClGZc3vr7m3ypq3wjX27UbAs2+ZGxjEUsJ6ka44c=;
Message-ID: <717da388-9382-4eaf-9275-27dd203dd492@xen.org>
Date: Wed, 27 Aug 2025 22:42:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: smmuv3: Add cache maintenance for non-coherent
 SMMU queues
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Dmytro Firsov <Dmytro_Firsov@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <24567cc1630b1577c33939ff71d67fb2ebe5572f.1754491424.git.dmytro_firsov@epam.com>
 <cff3e94c-4476-4103-ae7e-19656703e755@amd.com>
 <5d48d927-7e1e-4b11-b429-0b94259154ab@epam.com>
 <e0c2b06e-947a-4d1d-864f-5785cfe00b1c@xen.org>
 <474bffdc-f42e-4727-ab69-b11a67430adf@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <474bffdc-f42e-4727-ab69-b11a67430adf@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 26/08/2025 12:44, Orzel, Michal wrote:
> 
> 
> On 26/08/2025 12:48, Julien Grall wrote:
>> Hi,
>>
>> On 26/08/2025 10:47, Dmytro Firsov wrote:
>>> On 22.08.25 11:12, Orzel, Michal wrote:
>>> On 06/08/2025 16:58, Dmytro Firsov wrote:
>>>
>>>
>>> According to the Arm SMMUv3 spec (ARM IHI 0070), a system may have
>>> SMMU(s) that is/are non-coherent to the PE (processing element). In such
>>> cases, memory accesses from the PE should be either non-cached or be
>>> augmented with manual cache maintenance. SMMU cache coherency is reported
>>> by bit 4 (COHACC) of the SMMU_IDR0 register and is already present in the
>>> Xen driver. However, the current implementation is not aware of cache
>>> maintenance for memory that is shared between the PE and non-coherent
>>> SMMUs. It contains dmam_alloc_coherent() function, that is added during
>>> Linux driver porting. But it is actually a wrapper for _xzalloc(), that
>>> returns normal writeback memory (which is OK for coherent SMMUs).
>>>
>>> During Xen bring-up on a system with non-coherent SMMUs, the driver did
>>> not work properly - the SMMU was not functional and halted initialization
>>> at the very beginning due to a timeout while waiting for CMD_SYNC
>>> completion:
>>>
>>>     (XEN) SMMUv3: /soc/iommu@fa000000: CMD_SYNC timeout
>>>     (XEN) SMMUv3: /soc/iommu@fa000000: CMD_SYNC timeout
>>>
>>> To properly handle such scenarios, add the non_coherent flag to the
>>> arm_smmu_queue struct. It is initialized using features reported by the
>>> SMMU HW and will be used for triggering cache clean/invalidate operations.
>>> This flag is not queue-specific (it is applicable to the whole SMMU), but
>>> adding it to arm_smmu_queue allows us to not change function signatures
>>> and simplify the patch (smmu->features, which contains the required flag,
>>> are not available in code parts that require cache maintenance).
>>>
>>>
>>> There are already a few places advertising the SMMU coherency:
>>> 1) smmu->features
>>> 2) d->iommu->features
>>> 3) platform_features
>>>
>>> All of them are better places than queue struct (that as you pointed out is not
>>> specific to coherency). I'd suggest maybe to use 3) and removing ro_after_init
>>> if you don't have access to 1) and 2). All in all, providing yet another place
>>> for coherency flag seems a bit too much.
>>   > >
>>> First of all, thank you very much for review! I will consider using
>>> "platform_features" in next patch version, it looks more appropriate and
>>> should be available within the whole driver. Also, I believe "ro_after_init"
>>> is also OK, since I have no need to change it (only check if cache
>>> maintenance should be performed).
>>
>> I have to disagree with using "platform_features". Flushing the queue is
>> a per-SMMU decision. But looking at the code, I think passing the SMMU
>> to the caller would look wrong (what if you mistakenly pass the wrong
>> SMMU?). So I think a boolean per queue is the right appraoch.
> For my own understanding: don't we consider SMMU coherency globally, not per
> SMMU (hence why I suggested re-using the global flag)?
 > We set the coherency> feature in the flags if all SMMUs support it. 
Do we want to diverge now and do
> the flushing per SMMU?

The two contexts are quite different.

We need the global flag when cleaning the stage-2 page-tables because we 
don't always know at boot which SMMUs will be used for the devices 
attached (think PCI hotplug).

In the context of this patch, we know the queue is only used by a given 
SMMU. So i tis better to take this decision per-SMMU/queue to reduce the 
number of cache flush. This will be particularly important for the 
2-stage SMMU work because there will be a lot of commands sent on behalf 
of the guest (every TLB flushes will be command).

Cheers,

-- 
Julien Grall


