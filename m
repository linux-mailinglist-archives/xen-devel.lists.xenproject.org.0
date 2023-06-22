Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EBA739A97
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 10:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553411.863944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCG1I-0005EA-5E; Thu, 22 Jun 2023 08:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553411.863944; Thu, 22 Jun 2023 08:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCG1I-0005C4-1w; Thu, 22 Jun 2023 08:50:24 +0000
Received: by outflank-mailman (input) for mailman id 553411;
 Thu, 22 Jun 2023 08:50:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUks=CK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qCG1H-0005Bw-6v
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 08:50:23 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfbadf76-10d9-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 10:50:18 +0200 (CEST)
Received: from DS7PR05CA0001.namprd05.prod.outlook.com (2603:10b6:5:3b9::6) by
 SA1PR12MB7343.namprd12.prod.outlook.com (2603:10b6:806:2b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Thu, 22 Jun
 2023 08:50:14 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::48) by DS7PR05CA0001.outlook.office365.com
 (2603:10b6:5:3b9::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26 via Frontend
 Transport; Thu, 22 Jun 2023 08:50:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.41 via Frontend Transport; Thu, 22 Jun 2023 08:50:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 22 Jun
 2023 03:50:11 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 22 Jun 2023 03:50:09 -0500
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
X-Inumbo-ID: cfbadf76-10d9-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mw2vxKdA7i9Z6JH3DZ26N7F8S41BADGXlGFlRZRipaQtsjsbjoFxNKnF9XzIXxGjACSFOHOknqPVIuDgbTXZ9YWAY9t0mpLn0tYgeJMsvQCkoY3z87OPPyO1Z1u0E3eVAKN3GZ09OHsxZgZjp9arskG5V5f70TvdRAUNZc+E95c4NwCUFIN8zZ1E/n+7CAQ7k1028OAo0lfRG4dhE2j4O6bIsck6LRzmQismIrKuST6Fz42Gm2hyc+MoD5oGzF2AyuOHs8/Mi6Ilm2ufeaY+ILWFmf4kU6NS09IpnFU9+T//9XVMaQ/iB0E18tlb8+So3AwYdUut8Mk6vkuOxcpLbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXDmYE9KFWY2FURoM3XSsaKyH48Qaor7ysamwBm8/8A=;
 b=hNVr4U7z9BVI3VGqYVnPvMqRZEucfdD0IkQBmqncMU6z0P9N39NHakkzz/tvXDuQMMtoXVONPWYwSgiZ0hkwWMbFJ7GuJCVYPGv+5aqRG42SOk9qC301hTnTpZ2Gh/lMH/ydGgb8003kLIVdIxCUhrCJ9gZsq/ugN8gMDRAqHPj819GHtN+5HeUaaFMwAun+xniVcF25ZfeUTM4hBUF3KPcwUAJcK46MtK17mIbzC6Es5g0UgXT+d1j9ejANjLMNphrKeWVQ6lr/4OZ51d3cGRqkOsftDzlzSSoEh9uO9Qi9HmLV5hLeSgWP5Z47Js+WBFeNP6PTjUB/D9iQ1ns6lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXDmYE9KFWY2FURoM3XSsaKyH48Qaor7ysamwBm8/8A=;
 b=2DyGt3SZQmeuNXysq6nFX0WL4vHzpI5xWI3xgxoBajuFXr7f5odQm5jwH1wefyH5mAZ+TS1IcCiEBSK9nhMSBVeNqQY/9C1pC5IUmFhnXr0BIJh+AhcfefDjon/Q8eMVyvab5dVzz6wXxJNGFt/l+WpIzE1YifSJ4F464NvDBR4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ac5f3e6d-f953-d496-cc76-faff68f3e99e@amd.com>
Date: Thu, 22 Jun 2023 10:50:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH] xen/arm: fixed violations of MISRA C:2012 R8.3 on
 parameter names.
To: Julien Grall <julien@xen.org>, Federico Serafini
	<federico.serafini@bugseng.com>, <xen-devel@lists.xenproject.org>
CC: <consulting@bugseng.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cb0bbd89e169484ccd22da44bbcace56d5497c3e.1687420119.git.federico.serafini@bugseng.com>
 <7a48c49e-2998-9e34-45ef-a1c3431fbffe@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <7a48c49e-2998-9e34-45ef-a1c3431fbffe@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT054:EE_|SA1PR12MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a16107e-4d04-49e1-ebf6-08db72fdb19f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	34+RpUGKioxHeo/1cDgWGaucr+cSP8s6UdANtWZKjZaMmi6SR/beBd8HQq+v6iJcp1HTyZ9nx6CMzBi/PdMQl078ltL/SQKWCB3k1o6wjokljRCa3PZ4GlmiFTGxhh0qazca3Zc1GYSFYjuVN7kp2d7x2iPM7lqMKgBrds0QwyKFUTA4w5TbP2F0UVGLIUddb8rGBm8ZSGyse3WeDG114UP8eD/j1R30bXG0uU5uGOHtRtpAE/MfMwUF2LjXIWmmM+kPCDy4HNwpuhZsgnm5p0xXA9u85xPIOTNPJdlyl9lmrEiWMddoKE0sQ3heYhwSlRRZzToOPyEM3IozAyn8cV9WOr14B2xZnzr372ROPtQZNqeIn+GtdgYjZMKxh67KmMq/hzkhj1DvjCxmwVqliuh+7xYF51Pkru+8BLHbaUpRaxWYCk7F9PIJiF8tUOcJL65xdQqn37Dh3HIfvf4aeRhQ3erQMG1O/OVqda25IQDZasN9xWUwSXFte3T3lwLdoKK8RMAz8w9brylHk0Oepvl71I7Ou5zZseeQZgiQoAnsMzCsCLri2aSTeSrVDighJaWLRGNnPijjHs5IyBmA9OxeyYLsG7s6ucsbLSO4efAcnEb01rTG/F1c1lJTj64JerU3sjboS6USwUNWV3WgecyYDejAo1gLnKIwWlBOfQm09ualPvDKwSq1zlytllLejhzXNZoNjKOKRglRVp2m3fBwT3nwR4RYNvgswuYLCVjuSX19PL1fgedfHzGUIe1AHl+Z826C/1yYFJKTwoJx6dZdQvO9xX7VKfF1PEveVyzuwTcPgErRMUCE2QL5UidP8nqIuGQRLIfjzplNn5XhHw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(66899021)(47076005)(36860700001)(82740400003)(356005)(81166007)(40480700001)(16576012)(54906003)(478600001)(6666004)(966005)(2906002)(44832011)(5660300002)(70206006)(70586007)(316002)(41300700001)(4326008)(8676002)(8936002)(2616005)(83380400001)(426003)(110136005)(336012)(82310400005)(186003)(53546011)(26005)(31686004)(86362001)(36756003)(31696002)(40460700003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 08:50:13.4616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a16107e-4d04-49e1-ebf6-08db72fdb19f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7343

Hi Federico,

On top of Julien remarks, only one more from my side.

On 22/06/2023 10:37, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 22/06/2023 09:13, Federico Serafini wrote:
>> To comply with Rule 8.3 ("All declarations of an object or function
>> shall use the same names and type qualifiers") change the parameter
>> names of function declarations to be consistent with the names used
>> in the corresponding function definitions. >
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>>   xen/arch/arm/include/asm/event.h        | 2 +-
>>   xen/arch/arm/include/asm/fixmap.h       | 2 +-
>>   xen/arch/arm/include/asm/gic.h          | 2 +-
>>   xen/arch/arm/include/asm/gic_v3_its.h   | 5 +++--
>>   xen/arch/arm/include/asm/grant_table.h  | 6 +++---
>>   xen/arch/arm/include/asm/guest_access.h | 4 ++--
>>   xen/arch/arm/include/asm/irq.h          | 2 +-
>>   xen/arch/arm/include/asm/mm.h           | 2 +-
>>   xen/arch/arm/include/asm/regs.h         | 2 +-
>>   xen/arch/arm/include/asm/vgic.h         | 4 ++--
>>   10 files changed, 16 insertions(+), 15 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/event.h b/xen/arch/arm/include/asm/event.h
>> index b14c166ad6..fa54ef8869 100644
>> --- a/xen/arch/arm/include/asm/event.h
>> +++ b/xen/arch/arm/include/asm/event.h
>> @@ -3,7 +3,7 @@
>>
>>   #include <asm/domain.h>
>>
>> -void vcpu_kick(struct vcpu *v);
>> +void vcpu_kick(struct vcpu *vcpu);
> With this change we know have inconsistency in the arguments naming
> within the header. It is more common to denote a vCPU with 'v' so I
> would rather prefer if we modify the function definition in a patch before.
> 
>>   void vcpu_mark_events_pending(struct vcpu *v);
>>   void vcpu_update_evtchn_irq(struct vcpu *v);
>>   void vcpu_block_unless_event_pending(struct vcpu *v);
>> diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
>> index d0c9a52c8c..734eb9b1d4 100644
>> --- a/xen/arch/arm/include/asm/fixmap.h
>> +++ b/xen/arch/arm/include/asm/fixmap.h
>> @@ -30,7 +30,7 @@
>>   extern lpae_t xen_fixmap[XEN_PT_LPAE_ENTRIES];
>>
>>   /* Map a page in a fixmap entry */
>> -extern void set_fixmap(unsigned int map, mfn_t mfn, unsigned int attributes);
>> +extern void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags);
>>   /* Remove a mapping from a fixmap entry */
>>   extern void clear_fixmap(unsigned int map);
>>
>> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
>> index 76e3fa5dc4..f1ef347edc 100644
>> --- a/xen/arch/arm/include/asm/gic.h
>> +++ b/xen/arch/arm/include/asm/gic.h
>> @@ -257,7 +257,7 @@ int gic_remove_irq_from_guest(struct domain *d, unsigned int virq,
>>   extern void gic_clear_pending_irqs(struct vcpu *v);
>>
>>   extern void init_maintenance_interrupt(void);
>> -extern void gic_raise_guest_irq(struct vcpu *v, unsigned int irq,
>> +extern void gic_raise_guest_irq(struct vcpu *v, unsigned int virtual_irq,
>>           unsigned int priority);
>>   extern void gic_raise_inflight_irq(struct vcpu *v, unsigned int virtual_irq);
>>
>> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
>> index fae3f6ecef..c24d4752d0 100644
>> --- a/xen/arch/arm/include/asm/gic_v3_its.h
>> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
>> @@ -190,8 +190,9 @@ struct pending_irq *gicv3_its_get_event_pending_irq(struct domain *d,
>>                                                       uint32_t eventid);
>>   int gicv3_remove_guest_event(struct domain *d, paddr_t vdoorbell_address,
>>                                        uint32_t vdevid, uint32_t eventid);
>> -struct pending_irq *gicv3_assign_guest_event(struct domain *d, paddr_t doorbell,
>> -                                             uint32_t devid, uint32_t eventid,
>> +struct pending_irq *gicv3_assign_guest_event(struct domain *d,
>> +                                             paddr_t vdoorbell_address,
>> +                                             uint32_t vdevid, uint32_t eventid,
>>                                                uint32_t virt_lpi);
>>   void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
>>                                    uint32_t virt_lpi);
>> diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
>> index e13dfeefa5..bd4eea2317 100644
>> --- a/xen/arch/arm/include/asm/grant_table.h
>> +++ b/xen/arch/arm/include/asm/grant_table.h
>> @@ -36,10 +36,10 @@ static inline bool gnttab_release_host_mappings(const struct domain *d)
>>       return true;
>>   }
>>
>> -int create_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>> +int create_grant_host_mapping(unsigned long addr, mfn_t frame,
>>                                 unsigned int flags, unsigned int cache_flags);
>> -int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>> -                               unsigned long new_gpaddr, unsigned int flags);
>> +int replace_grant_host_mapping(unsigned long addr, mfn_t mfn,
>> +                               unsigned long new_addr, unsigned int flags);
> 
> I know you are focusing to use the same parameter names as the
> definitions. However, with the new name it is not clear anymore what
> type of address is expected.
> 
>  From my understanding, the interface is expecting a guest physical
> address. So I think we should stick with 'gpaddr'.
> 
> Also, I think there is another problem with this interface because a
> guest (and even host) address can be bigger than an 'unsigned long' on
> arm32. Anyway, this is something that could be dealt outside of this series.
> 
>>
>>   /*
>>    * The region used by Xen on the memory will never be mapped in DOM0
>> diff --git a/xen/arch/arm/include/asm/guest_access.h b/xen/arch/arm/include/asm/guest_access.h
>> index 4421e43611..c37cf7d871 100644
>> --- a/xen/arch/arm/include/asm/guest_access.h
>> +++ b/xen/arch/arm/include/asm/guest_access.h
>> @@ -12,11 +12,11 @@ unsigned long raw_clear_guest(void *to, unsigned int len);
>>
>>   /* Copy data to guest physical address, then clean the region. */
>>   unsigned long copy_to_guest_phys_flush_dcache(struct domain *d,
>> -                                              paddr_t phys,
>> +                                              paddr_t gpa,
>>                                                 void *buf,
>>                                                 unsigned int len);
>>
>> -int access_guest_memory_by_ipa(struct domain *d, paddr_t ipa, void *buf,
>> +int access_guest_memory_by_ipa(struct domain *d, paddr_t gpa, void *buf,
>>                                  uint32_t size, bool is_write);
> 
> The function namem suggests there would be a parameter called 'ipa'. But
> you are renaming it to 'gpa'. In this case, we should either renaming
> the parameter in the definition or the function name.
> 
> I am slightly leaning towards the latter because we don't tend to use
> 'ipa' very much in Xen (even though this is the Arm official terminology).
> 
>>
>>   #define __raw_copy_to_guest raw_copy_to_guest
>> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
>> index 11bc85d111..105b33b37d 100644
>> --- a/xen/arch/arm/include/asm/irq.h
>> +++ b/xen/arch/arm/include/asm/irq.h
>> @@ -76,7 +76,7 @@ void init_IRQ(void);
>>
>>   int route_irq_to_guest(struct domain *d, unsigned int virq,
>>                          unsigned int irq, const char *devname);
>> -int release_guest_irq(struct domain *d, unsigned int irq);
>> +int release_guest_irq(struct domain *d, unsigned int virq);
>>
>>   void arch_move_irqs(struct vcpu *v);
>>
>> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
>> index 4262165ce2..d78f7a183a 100644
>> --- a/xen/arch/arm/include/asm/mm.h
>> +++ b/xen/arch/arm/include/asm/mm.h
>> @@ -225,7 +225,7 @@ extern void setup_directmap_mappings(unsigned long base_mfn, unsigned long nr_mf
>>   /* Map a frame table to cover physical addresses ps through pe */
>>   extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
>>   /* map a physical range in virtual memory */
>> -void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int attributes);
>> +void __iomem *ioremap_attr(paddr_t pa, size_t len, unsigned int attributes)
> All the ioremap_* prototypes were consistent before this change. I have
> a slight preference if we stick we 'start' and therefore rename the
> parameter in the definition. But I would be ok with 'pa' so long all the
> other ioremap_* prototypes are updated accordingly.
> 
>>
>>   static inline void __iomem *ioremap_nocache(paddr_t start, size_t len)
>>   {
>> diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm/regs.h
>> index 0693a68131..ef34b38aa1 100644
>> --- a/xen/arch/arm/include/asm/regs.h
>> +++ b/xen/arch/arm/include/asm/regs.h
>> @@ -58,7 +58,7 @@ static inline bool guest_mode(const struct cpu_user_regs *r)
>>   }
>>
>>   register_t get_user_reg(struct cpu_user_regs *regs, int reg);
>> -void set_user_reg(struct cpu_user_regs *regs, int reg, register_t val);
>> +void set_user_reg(struct cpu_user_regs *regs, int reg, register_t value);
>>
>>   #endif
>>
>> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
>> index 328fd46d1b..aa9f49409e 100644
>> --- a/xen/arch/arm/include/asm/vgic.h
>> +++ b/xen/arch/arm/include/asm/vgic.h
>> @@ -355,8 +355,8 @@ bool vgic_evtchn_irq_pending(struct vcpu *v);
>>   int domain_vgic_register(struct domain *d, int *mmio_count);
>>   int domain_vgic_init(struct domain *d, unsigned int nr_spis);
>>   void domain_vgic_free(struct domain *d);
>> -int vcpu_vgic_init(struct vcpu *vcpu);
>> -int vcpu_vgic_free(struct vcpu *vcpu);
>> +int vcpu_vgic_init(struct vcpu *v);
>> +int vcpu_vgic_free(struct vcpu *v);
I know that new VGIC (files under arch/arm/vgic/) is not covered by the MISRA work, but
functions there reuse the same prototypes. So by changing the parameter names here, we
should also change the names in the following definitions for consistency:
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/vgic/vgic-init.c;h=ea739d081e7879b44c4b05c862ad32c301105732;hb=HEAD#l201
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/vgic/vgic-init.c;h=ea739d081e7879b44c4b05c862ad32c301105732;hb=HEAD#l242

I can do this by myself although it would be simpler to have all in one patch.

~Michal

