Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 041868CE608
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 15:21:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729551.1134750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAUrA-00049o-Ow; Fri, 24 May 2024 13:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729551.1134750; Fri, 24 May 2024 13:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAUrA-00047n-M2; Fri, 24 May 2024 13:21:12 +0000
Received: by outflank-mailman (input) for mailman id 729551;
 Fri, 24 May 2024 13:21:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sAUr9-00047h-AY
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 13:21:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAUr8-00025R-Vv; Fri, 24 May 2024 13:21:10 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAUr8-0003P6-R7; Fri, 24 May 2024 13:21:10 +0000
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
	bh=YtU9PpJWiO5LENmtkdVEs1npibNUMkg2mhdyNGLvFD8=; b=s0MMSNPjJ9ru2V4tgKlDWC3x5G
	L9KfZveGQWagPmhzc/IwspJCRpYjbtUzl/+qP2H1t5PRroCgwEhOtHnU5ViS9i1R1Su9L2tjQwDjF
	eYdxygPml/iZgKqbxGjKeeIW0ybFBx6T3ZVPJ5AoO9AvUDAOQBT53NkkjNoFtNjNgIJY=;
Message-ID: <4afe33f2-72e6-4755-98ce-d7f9da374e90@xen.org>
Date: Fri, 24 May 2024 14:21:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 4/5] xen/arm: translate virtual PCI bus topology for
 guests
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240522225927.77398-1-stewart.hildebrand@amd.com>
 <20240522225927.77398-5-stewart.hildebrand@amd.com>
 <Zk70udmiriruMt0r@macbook>
From: Julien Grall <julien@xen.org>
In-Reply-To: <Zk70udmiriruMt0r@macbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Sorry I didn't notice there was a v16 and posted comments on the v15. 
The only one is about the size of the list we iterate.

On 23/05/2024 08:48, Roger Pau Monné wrote:
> On Wed, May 22, 2024 at 06:59:23PM -0400, Stewart Hildebrand wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> There are three  originators for the PCI configuration space access:
>> 1. The domain that owns physical host bridge: MMIO handlers are
>> there so we can update vPCI register handlers with the values
>> written by the hardware domain, e.g. physical view of the registers
>> vs guest's view on the configuration space.
>> 2. Guest access to the passed through PCI devices: we need to properly
>> map virtual bus topology to the physical one, e.g. pass the configuration
>> space access to the corresponding physical devices.
>> 3. Emulated host PCI bridge access. It doesn't exist in the physical
>> topology, e.g. it can't be mapped to some physical host bridge.
>> So, all access to the host bridge itself needs to be trapped and
>> emulated.
>>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

For Arm:

Acked-by: Julien Grall <jgrall@amazon.com>

> 
> One unrelated question below.
> 
>> ---
>> In v15:
>> - base on top of ("arm/vpci: honor access size when returning an error")
>> In v11:
>> - Fixed format issues
>> - Added ASSERT_UNREACHABLE() to the dummy implementation of
>> vpci_translate_virtual_device()
>> - Moved variable in vpci_sbdf_from_gpa(), now it is easier to follow
>> the logic in the function
>> Since v9:
>> - Commend about required lock replaced with ASSERT()
>> - Style fixes
>> - call to vpci_translate_virtual_device folded into vpci_sbdf_from_gpa
>> Since v8:
>> - locks moved out of vpci_translate_virtual_device()
>> Since v6:
>> - add pcidevs locking to vpci_translate_virtual_device
>> - update wrt to the new locking scheme
>> Since v5:
>> - add vpci_translate_virtual_device for #ifndef CONFIG_HAS_VPCI_GUEST_SUPPORT
>>    case to simplify ifdefery
>> - add ASSERT(!is_hardware_domain(d)); to vpci_translate_virtual_device
>> - reset output register on failed virtual SBDF translation
>> Since v4:
>> - indentation fixes
>> - constify struct domain
>> - updated commit message
>> - updates to the new locking scheme (pdev->vpci_lock)
>> Since v3:
>> - revisit locking
>> - move code to vpci.c
>> Since v2:
>>   - pass struct domain instead of struct vcpu
>>   - constify arguments where possible
>>   - gate relevant code with CONFIG_HAS_VPCI_GUEST_SUPPORT
>> New in v2
>> ---
>>   xen/arch/arm/vpci.c     | 45 ++++++++++++++++++++++++++++++++---------
>>   xen/drivers/vpci/vpci.c | 24 ++++++++++++++++++++++
>>   xen/include/xen/vpci.h  | 12 +++++++++++
>>   3 files changed, 71 insertions(+), 10 deletions(-)
>>
>> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
>> index b63a356bb4a8..516933bebfb3 100644
>> --- a/xen/arch/arm/vpci.c
>> +++ b/xen/arch/arm/vpci.c
>> @@ -7,33 +7,53 @@
>>   
>>   #include <asm/mmio.h>
>>   
>> -static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
>> -                                     paddr_t gpa)
>> +static bool vpci_sbdf_from_gpa(struct domain *d,
>> +                               const struct pci_host_bridge *bridge,
>> +                               paddr_t gpa, pci_sbdf_t *sbdf)
>>   {
>> -    pci_sbdf_t sbdf;
>> +    bool translated = true;
>> +
>> +    ASSERT(sbdf);
>>   
>>       if ( bridge )
>>       {
>> -        sbdf.sbdf = VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
>> -        sbdf.seg = bridge->segment;
>> -        sbdf.bus += bridge->cfg->busn_start;
>> +        sbdf->sbdf = VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
>> +        sbdf->seg = bridge->segment;
>> +        sbdf->bus += bridge->cfg->busn_start;
>>       }
>>       else
>> -        sbdf.sbdf = VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
>> +    {
>> +        /*
>> +         * For the passed through devices we need to map their virtual SBDF
>> +         * to the physical PCI device being passed through.
>> +         */
>> +        sbdf->sbdf = VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
>> +        read_lock(&d->pci_lock);
>> +        translated = vpci_translate_virtual_device(d, sbdf);
>> +        read_unlock(&d->pci_lock);
> 
> I would consider moving the read_{,un}lock() calls inside
> vpci_translate_virtual_device(), if that's the only caller of
> vpci_translate_virtual_device().  Maybe further patches add other
> instances that call from an already locked context.
> 
>> +    }
>>   
>> -    return sbdf;
>> +    return translated;
>>   }
>>   
>>   static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>>                             register_t *r, void *p)
>>   {
>>       struct pci_host_bridge *bridge = p;
>> -    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
>> +    pci_sbdf_t sbdf;
>>       const unsigned int access_size = (1U << info->dabt.size) * 8;
>>       const register_t invalid = GENMASK_ULL(access_size - 1, 0);
> 
> Do you know why the invalid value is truncated to the access size.

Because no other callers are doing the truncation and therefore the 
guest would read 1s even for 8-byte unsigned access.

Cheers,

-- 
Julien Grall

