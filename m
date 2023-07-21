Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D75175BD8A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 06:55:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567328.886219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMiA2-0005f1-RI; Fri, 21 Jul 2023 04:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567328.886219; Fri, 21 Jul 2023 04:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMiA2-0005ce-Nz; Fri, 21 Jul 2023 04:54:38 +0000
Received: by outflank-mailman (input) for mailman id 567328;
 Fri, 21 Jul 2023 04:54:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b4k+=DH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qMiA1-0005cY-Cq
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 04:54:37 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0bca03e-2782-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 06:54:36 +0200 (CEST)
Received: from BYAPR07CA0030.namprd07.prod.outlook.com (2603:10b6:a02:bc::43)
 by IA1PR12MB8311.namprd12.prod.outlook.com (2603:10b6:208:3fa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Fri, 21 Jul
 2023 04:54:31 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a02:bc:cafe::b0) by BYAPR07CA0030.outlook.office365.com
 (2603:10b6:a02:bc::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28 via Frontend
 Transport; Fri, 21 Jul 2023 04:54:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6609.28 via Frontend Transport; Fri, 21 Jul 2023 04:54:30 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 20 Jul
 2023 23:54:30 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 20 Jul 2023 23:54:29 -0500
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
X-Inumbo-ID: b0bca03e-2782-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcSpQ+OGNAKtrF1HXugAD5VWwb2LglxckMYcshsRAj0Cxm2sBQOoVsmnHFfH+Pc+bldW5QIciuFu5e0au+25Dvq48y7WR7Zxh8LuN4vEKoDOgqH31A9Ay5tbJ2Urw1G5QacEx7rigOFDXvUNiTrA3L4FAEmlOTrn0+gt0aWWFftH065TIA7IMDhZWWrLdwHmqOAXEgQH5yk2rhQoutiH/+AuAAIishypfd1PBgV9x++QJoiCSxZ15yQYpB4mUJ4HRjVA6qUeTgz2P7zkUsF3zD0jOkcH8EfHtXV4Rb/McW2tcUpkM3t0Xjzpj69OVg7VZ93bFwAnPtpDhL0ZMOlBYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4El6l6pMp5WQlZxGqtNTmB12qi+0jy/P8LrSTccuQI=;
 b=fe6yOgo1iw1K4fqNxvct90jJFa8HqpJ02xXld5UGL9ZzL4S85GheLHunKH4bmIvtaBXqe5Ncf91gDp1VhJZPrwsvDO/oX7mgg+17IhgVrkC/uX/gET1j2ez3g67uiZhg0cncRW59GP/VnuygowsN/MU0H1BqTCImB2gNq5a0N6tXvrVprhWl7OVpqFMKfw7LGm8us6J6ASqjroTk9i3rw9AltohwuXPgckCx/n6Q6plvSrmfsK3DC4xjb/PbHGMRsB0+z+jb6YaWEvIrxD0VFwcTVhA5F22oW0sOcruBfgXzkghMqVLqZYelUVFWxywbZUMZHIku/tC/aVqRbtcrhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4El6l6pMp5WQlZxGqtNTmB12qi+0jy/P8LrSTccuQI=;
 b=pNm8fucMEzSRSwiUz5OSJ6WXhqRcNMRhRk1MOdHJq72mt6yWzMI9OuHaVs2ZHHOggC/kTyZ3FT8ctMAuVHrlP4BdT0ZOQMynxhn4Z40eoGC/GDSR30m1As8gyuHRkny1+Rf5j8HIF6e9Qa5OF76/ii1SffKCDk4+eWlW8OHXJgA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <38cdc3b4-76de-d657-7fc7-f098ebea9d32@amd.com>
Date: Fri, 21 Jul 2023 00:54:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/3] [FUTURE] xen/arm: enable vPCI for domUs
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Artem Mygaiev <artem_mygaiev@epam.com>
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-4-stewart.hildebrand@amd.com>
 <9A14CA15-2706-4907-A3D3-9A670CF9BAED@arm.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <9A14CA15-2706-4907-A3D3-9A670CF9BAED@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT027:EE_|IA1PR12MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f82d0da-3ceb-4012-051c-08db89a691f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UE3tRCQpkkwqfRjlZ/d76zo7mciYWbzFIXEX9gkuO8NYPIJrOisdGUVq4Bah5mumUxbM1sTqvfg+LSHL6y/hq5+PSTuRUi7isg3iVFT7/hPp1MdZ6GpshwWueY28JIE4yzf2NwaWkxoD3kSLsF18Jr1RZE2VoWcbGp1d8Ge81dsr3sUZL6gaU9BSPUM2C8ifdDDphnfZJhwlxCQliT00yc8YPgqdZVUc9g+8PmetrB+POL/WCnNCQ55BlER94TN11bqEF++UCx8Lho2SLPtH6KDMh2M35VnAHZSIIgrYVr0rHrmu4wJY4/Si+dO0/jBSxr0qKPce7SQdaHR8L4XUbT6jOYgAI6GTA+W9Jf7dAvD3ibUFZvsxtnlBTp/ucZv4TSPlURJmftg/AMpez6BDTbESWLSeE3OCJUE8PK/0BRDfiHaBioCRNXDzfSMJ/KTCsHIK8euTF2CtDEnlr0C9U2xUcsDwSAY32uRidBv2N2vFzwEyPNk2sU9g8uhTSQfBme/0L0HTU3EIaB+N8W9xFOA+Tw62TEFigw4orxdPBSjoHQP6Mz3CkqGkQis5yiz2+ucU3DTNXiR1DWzRQ72TaxWxzf0VMhr6swv2PZg5qTVVRAqoqE3CWHeZNuol9OiN9wCOjP+y/q7Vou+83OHtjcpdci7xZLXRbeiyIkeAv87OrgyrUF1pJhaNE+juIOcRU6ziDpMlFV56NFVjkLa0OzOzBdzL2VLuDWJGeRwLCTNjSsfL9S5TpCM7VOOO2Rxnr4KZBgOjQInYfDHWJNgfdnZAJA2/7lddkOH7V6zlyOI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(396003)(82310400008)(451199021)(36840700001)(46966006)(40470700004)(4326008)(426003)(36860700001)(70586007)(2906002)(6916009)(8676002)(44832011)(5660300002)(966005)(8936002)(356005)(31686004)(31696002)(70206006)(41300700001)(16576012)(47076005)(82740400003)(478600001)(316002)(81166007)(54906003)(40480700001)(186003)(2616005)(26005)(86362001)(40460700003)(36756003)(336012)(66899021)(53546011)(83380400001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 04:54:30.8802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f82d0da-3ceb-4012-051c-08db89a691f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8311

On 7/7/23 07:04, Rahul Singh wrote:
> Hi Stewart,
> 
>> On 7 Jul 2023, at 2:47 am, Stewart Hildebrand <Stewart.Hildebrand@amd.com> wrote:
>>
>> Remove is_hardware_domain check in has_vpci, and select HAS_VPCI_GUEST_SUPPORT
>> in Kconfig.
>>
>> [1] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg00863.html
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> As the tag implies, this patch is not intended to be merged (yet).
>>
>> Note that CONFIG_HAS_VPCI_GUEST_SUPPORT is not currently used in the upstream
>> code base. It will be used by the vPCI series [1]. This patch is intended to be
>> merged as part of the vPCI series.
>>
>> v1->v2:
>> * new patch
>> ---
>> xen/arch/arm/Kconfig              | 1 +
>> xen/arch/arm/include/asm/domain.h | 2 +-
>> 2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 4e0cc421ad48..75dfa2f5a82d 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -195,6 +195,7 @@ config PCI_PASSTHROUGH
>> depends on ARM_64
>> select HAS_PCI
>> select HAS_VPCI
>> + select HAS_VPCI_GUEST_SUPPORT
> 
> I tested this series on top of "SMMU handling for PCIe Passthrough on ARM” series on the N1SDP board
> and observe the SMMUv3 fault.

Thanks for testing this. After a great deal of tinkering, I can reproduce the SMMU fault.

(XEN) smmu: /axi/smmu@fd800000: Unhandled context fault: fsr=0x402, iova=0xf9030040, fsynr=0x12, cb=0

> Enable the Kconfig option PCI_PASSTHROUGH, ARM_SMMU_V3,HAS_ITS and "iommu=on”,
> "pci_passthrough_enabled=on" cmd line parameter and after that, there is an SMMU fault
> for the ITS doorbell register access from the PCI devices.
> 
> As there is no upstream support for ARM for vPCI MSI/MSI-X handling because of that SMMU fault is observed.
> 
> Linux Kernel will set the ITS doorbell register( physical address of doorbell register as IOMMU is not enabled in Kernel)
> in PCI config space to set up the MSI-X interrupts, but there is no mapping in SMMU page tables because of that SMMU
> fault is observed. To fix this we need to map the ITS doorbell register to SMMU page tables to avoid the fault.
> 
> We can fix this after setting the mapping for the ITS doorbell offset in the ITS code.
> 
> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
> index 299b384250..8227a7a74b 100644
> --- a/xen/arch/arm/vgic-v3-its.c
> +++ b/xen/arch/arm/vgic-v3-its.c
> @@ -682,6 +682,18 @@ static int its_handle_mapd(struct virt_its *its, uint64_t *cmdptr)
>                                           BIT(size, UL), valid);
>          if ( ret && valid )
>              return ret;
> +
> +        if ( is_iommu_enabled(its->d) ) {
> +            ret = map_mmio_regions(its->d, gaddr_to_gfn(its->doorbell_address),
> +                           PFN_UP(ITS_DOORBELL_OFFSET),
> +                           maddr_to_mfn(its->doorbell_address));
> +            if ( ret < 0 )
> +            {
> +                printk(XENLOG_ERR "GICv3: Map ITS translation register d%d failed.\n",
> +                        its->d->domain_id);
> +                return ret;
> +            }
> +        }
>      }

Thank you, this resolves the SMMU fault. If it's okay, I will include this patch in the next revision of the SMMU series (I see your Signed-off-by is already in the attachment).

> Also as per Julien's request, I tried to set up the IOMMU for the PCI device without
> "pci_passthroigh_enable=on" and without HAS_VPCI everything works as expected
> after applying below patches.
> 
> To test enable kconfig options HAS_PCI, ARM_SMMU_V3 and HAS_ITS and add below
> patches to make it work.
> 
>     • Set the mapping for the ITS doorbell offset in the ITS code when iommu is enabled.
>     • Reverted the patch that added the support for pci_passthrough_on.
>     • Allow MMIO mapping of ECAM space to dom0 when vPCI is not enabled, as of now MMIO
>       mapping for ECAM is based on pci_passthrough_enabled. We need this patch if we want to avoid
>      enabling HAS_VPCI
> 
> Please find the attached patches in case you want to test at your end.
> 
> 
> 
> Regards,
> Rahul
> 
>> default n
>> help
>>  This option enables PCI device passthrough
>> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
>> index 1a13965a26b8..6e016b00bae1 100644
>> --- a/xen/arch/arm/include/asm/domain.h
>> +++ b/xen/arch/arm/include/asm/domain.h
>> @@ -298,7 +298,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>>
>> #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>>
>> -#define has_vpci(d) ({ IS_ENABLED(CONFIG_HAS_VPCI) && is_hardware_domain(d); })
>> +#define has_vpci(d)    ({ (void)(d); IS_ENABLED(CONFIG_HAS_VPCI); })
>>
>> struct arch_vcpu_io {
>>     struct instr_details dabt_instr; /* when the instruction is decoded */
>> --
>> 2.41.0
>>
>>
> 

