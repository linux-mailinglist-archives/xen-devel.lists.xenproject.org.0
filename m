Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B2983A7A5
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 12:21:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670931.1044026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSbJp-0001jj-VY; Wed, 24 Jan 2024 11:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670931.1044026; Wed, 24 Jan 2024 11:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSbJp-0001hd-Sh; Wed, 24 Jan 2024 11:21:21 +0000
Received: by outflank-mailman (input) for mailman id 670931;
 Wed, 24 Jan 2024 11:21:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rSbJo-0001hW-Lw
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 11:21:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rSbJo-0002gF-76; Wed, 24 Jan 2024 11:21:20 +0000
Received: from [15.248.2.233] (helo=[10.24.67.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rSbJo-0006BZ-0s; Wed, 24 Jan 2024 11:21:20 +0000
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
	bh=5258zXnY+iOkzZaQbQTpzYAZdBhmz4JigGJ0CznOVDQ=; b=24CT8SBo7VIH/USEWFeSCln4RF
	nPCGulWRhXimYFJZFu4q6PQr0NxO1lzjH4OVx7+Lcge1ql/rygHl+oRE46m0x7zFIvmYn6vZBjSWi
	/0GGqx49JYRutZrLHTJ0E2iiMvQ1mNFAIGl/cooDzsZNzpGvpTag/WfhScMZ68hZ1dIQ=;
Message-ID: <6424dda2-3274-4ff9-b409-a46dd139ebee@xen.org>
Date: Wed, 24 Jan 2024 11:21:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm: vgic: Add the ability to trigger MSIs from the
 Hypervisor
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1705066642.git.mykyta_poturai@epam.com>
 <e109a4092d80a825256d26a8e56dbb5a2ae6d04e.1705066642.git.mykyta_poturai@epam.com>
 <alpine.DEB.2.22.394.2401231711160.2287888@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2401231711160.2287888@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/01/2024 01:17, Stefano Stabellini wrote:
> On Sun, 14 Jan 2024, Mykyta Poturai wrote:
>> Add the vgic_its_trigger_msi() function to the vgic interface. This
>> function allows to inject MSIs from the Hypervisor to the guest.
>> Which is useful for userspace PCI backend drivers.
>>
>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>> ---
>>   xen/arch/arm/include/asm/vgic.h | 11 +++++++++++
>>   xen/arch/arm/vgic-v3-its.c      | 35 +++++++++++++++++++++++++++++++++
>>   2 files changed, 46 insertions(+)
>>
>> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
>> index 922779ce14..4695743848 100644
>> --- a/xen/arch/arm/include/asm/vgic.h
>> +++ b/xen/arch/arm/include/asm/vgic.h
>> @@ -317,6 +317,17 @@ extern bool vgic_migrate_irq(struct vcpu *old, struct vcpu *new, unsigned int ir
>>   extern void vgic_check_inflight_irqs_pending(struct domain *d, struct vcpu *v,
>>                                                unsigned int rank, uint32_t r);
>>   
>> +#ifdef CONFIG_HAS_ITS
>> +int vgic_its_trigger_msi(struct domain *d, paddr_t doorbell_address,
>> +                                u32 devid, u32 eventid);
>> +#else
>> +static inline int vgic_its_trigger_msi(struct domain *d, paddr_t doorbell_address,
>> +                                u32 devid, u32 eventid)
>> +{
>> +    return -EOPNOTSUPP;
>> +}
>> +#endif /* CONFIG_HAS_ITS */
>> +
>>   #endif /* !CONFIG_NEW_VGIC */
>>   
>>   /*** Common VGIC functions used by Xen arch code ****/
>> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
>> index 70b5aeb822..683a378f6e 100644
>> --- a/xen/arch/arm/vgic-v3-its.c
>> +++ b/xen/arch/arm/vgic-v3-its.c
>> @@ -1484,6 +1484,41 @@ static int vgic_v3_its_init_virtual(struct domain *d, paddr_t guest_addr,
>>       return 0;
>>   }
>>   
>> +int vgic_its_trigger_msi(struct domain *d, paddr_t doorbell_address,
>> +                                u32 devid, u32 eventid)
>> +{
>> +    struct vcpu *vcpu;
>> +    struct virt_its *pos, *temp;
>> +    struct virt_its *its = NULL;
>> +    uint32_t vlpi;
>> +    bool ret;
>> +
>> +    list_for_each_entry_safe( pos, temp, &d->arch.vgic.vits_list, vits_list )
>> +    {
>> +        if ( pos->doorbell_address == doorbell_address )
>> +        {
>> +            its = pos;
>> +            break;
>> +        }
>> +    }
>> +
>> +    if ( !its )
>> +        return -EINVAL;
>> +
>> +    spin_lock(&its->its_lock);
>> +    ret = read_itte(its, devid, eventid, &vcpu, &vlpi);
>> +    spin_unlock(&its->its_lock);
>> +    if ( !ret )
>> +        return -1;
>> +
>> +    if ( vlpi == INVALID_LPI )
>> +        return -1;
> 
> We need a better error code, maybe EINVAL or ENOENT ?

EINVAL tends to be overloaded. I would prefer ENOENT.

Cheers,

-- 
Julien Grall

