Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD88B51888D
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 17:28:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319727.540084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nluRs-00037I-Lu; Tue, 03 May 2022 15:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319727.540084; Tue, 03 May 2022 15:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nluRs-00035P-HL; Tue, 03 May 2022 15:28:24 +0000
Received: by outflank-mailman (input) for mailman id 319727;
 Tue, 03 May 2022 15:28:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nluRq-00031C-EY
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 15:28:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nluRq-0005kL-3i; Tue, 03 May 2022 15:28:22 +0000
Received: from [54.239.6.185] (helo=[192.168.2.157])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nluRp-00087q-UE; Tue, 03 May 2022 15:28:22 +0000
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
	bh=+5TDtsr3usX74j/+t36ZEF0usP4W/TKLWvT5jR6Z8BM=; b=Z4YSrxB5dckiyPSM2+n9UZadVX
	vWNuUDQc1eHYNgrZzR7yTQvca+wWZjpMitA6iJOt+t3brRFj1Kt1MF5XJP6s6ok6Rmxxn/FeZGKL3
	nDXD7oE+t6PyCUKWNo64eVu+r/ziMjnTIcWU+Lrj5BlrdpjwKE0U1R9uyoYjV9Skc22w=;
Message-ID: <cfa06435-7054-d60b-1419-17b34a4d7fd9@xen.org>
Date: Tue, 3 May 2022 16:28:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH] arm/acpi: don't expose the ACPI IORT SMMUv3 entry to dom0
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <e11c57909782c60a6914d81e9c9893ff1712cc5b.1651075724.git.rahul.singh@arm.com>
 <c3b83cd4-7633-7aee-ab40-9eff26a4f801@xen.org>
 <780400E5-C22A-471E-BB19-C2F3B24112F1@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <780400E5-C22A-471E-BB19-C2F3B24112F1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/04/2022 19:18, Rahul Singh wrote:
> Hi Julien,

Hi Rahul,

>> On 27 Apr 2022, at 7:26 pm, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Rahul,
>>
>> On 27/04/2022 17:12, Rahul Singh wrote:
>>> Xen should control the SMMUv3 devices therefore, don't expose the
>>> SMMUv3 devices to dom0. Deny iomem access to SMMUv3 address space for
>>> dom0 and also make ACPI IORT SMMUv3 node type to 0xff.
>>
>> Looking at the IORT spec (ARM DEN 0049E), 255 (0xff) is marked as reserved. So I don't think we can "allocate" 0xff to mean invalid without updating the spec. Did you engage with whoever own the spec?
> 
> Yes I agree with you 0xff is reserved for future use. I didn’t find any other value to make node invalid.
> Linux kernel is mostly using the node->type to process the SMMUv3 or other IORT node so I thought this is the only possible solution to hide SMMUv3 for dom0
> If you have any other suggestion to hide the SMMUv3 node I am okay to use that.
The other solution is to remove completely the SMMUv3 node from the 
IORT. This would require more work as you would need to fully rewrite 
the IORT.

Hence why I suggested to speak with the spec owner (it seems to be Arm) 
to reserve 0xff as "Invalid/Ignore".

>>> + smmu = (struct acpi_iort_smmu_v3 *)node->node_data;
>>> + mfn = paddr_to_pfn(smmu->base_address);
>>> + rc = iomem_deny_access(d, mfn, mfn + PFN_UP(SZ_128K));
>>> + if ( rc )
>>> + printk("iomem_deny_access failed for SMMUv3\n");
>>> + node->type = 0xff;
>>
>> 'node' points to the Xen copy of the ACPI table. We should really not touch this copy. Instead, we should modify the version that will be used by dom0.
> 
> As of now IORT is untouched by Xen and mapped to dom0. I will create the IORT table for dom0 and modify the node SMMUv3 that will be used by dom0.
>>
>> Furthermore, if we go down the road to update node->type, we should 0 the node to avoid leaking the information to dom0.
> 
> I am not sure if we can zero the node, let me check and come back to you.

By writing node->type, you already invalidate the content because the 
software cannot know how to interpret it. At which point, zeroing it 
should make no difference for software parsing the table afterwards. 
This may be a problem for software parsing before hand and keeping a 
pointer to the entry. But then, this is yet another reason to no updated 
the host IORT and create a copy for dom0.

Cheers,

-- 
Julien Grall

