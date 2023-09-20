Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358CA7A7955
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 12:32:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605520.943115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiuVK-0008AC-PC; Wed, 20 Sep 2023 10:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605520.943115; Wed, 20 Sep 2023 10:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiuVK-00088P-Lr; Wed, 20 Sep 2023 10:32:22 +0000
Received: by outflank-mailman (input) for mailman id 605520;
 Wed, 20 Sep 2023 10:32:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uJQT=FE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qiuVJ-00088J-JC
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 10:32:21 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9abdc28-57a0-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 12:32:19 +0200 (CEST)
Received: from DM6PR07CA0120.namprd07.prod.outlook.com (2603:10b6:5:330::10)
 by DM4PR12MB5844.namprd12.prod.outlook.com (2603:10b6:8:67::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Wed, 20 Sep
 2023 10:32:01 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:330:cafe::63) by DM6PR07CA0120.outlook.office365.com
 (2603:10b6:5:330::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.30 via Frontend
 Transport; Wed, 20 Sep 2023 10:32:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Wed, 20 Sep 2023 10:32:00 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 20 Sep
 2023 05:31:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 20 Sep
 2023 03:31:40 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 20 Sep 2023 05:31:38 -0500
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
X-Inumbo-ID: f9abdc28-57a0-11ee-8789-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCzBnFibti7smYJiVyp1K1vepNQU/NrycRpPgBLIuoPzT7JncUTighLtcgqY8QD7q/t81x5ZGlAPEHxN8b9IvDJmp6F/C3uip+RSb6F7Pk5MGDmS/2NU6Kj9AfFWLO2QQzFyqXZDpRsUcJJBVCTSH8CX42sFWj+0bnvkWhCEs9tgOIEf7nXyB8kG3uyIVIMDKkETcoG2lIAzP17CiXcxe2NgsVuTbQ3NURHSAjYTpuJ75UEXAKaVrSgSH0Wta9VLwvUtnNoaZRY2QUdmqFiZyipgTid6DSuSXBvcM99WjX+fGxNy0ajbA8lU975Nthp66TXzqeScYx6UR22YpBPUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQ3UqlTwNaGsFpptNp2ZFomxaCbBAtVt0GvsqRflZHo=;
 b=ekuQ5TBc1q58aTgdN+x00IIcbjMknsV93jDyu/U77ZAa9OlM6dB3UkSF3SjzA8Is+SIJDVWR6+hTsQSzcO2u2O/2b8b0IBBMTna8ev1gprjkcMk/uCZGUP4Lt58JbxaTEpANdGUdcAPKavQKw6Q7Q6M8EJEvp4R/K4d1XFb61otsbwm1euZd3s+P65p0Y3OGIYc0Meo+0ysAloKBQlow+LYL8CwIT/d2rEDuwi7t/B0PngR1TLqZ4B+QC5W3aUvNEyTHtDfob69/xpKj9OZlFe6NlIm61uWvCvHsugK4vpqsHGmXpXE6Ah2hR9F+uLpt+k0R2+BstFU3TSnrLxIa7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQ3UqlTwNaGsFpptNp2ZFomxaCbBAtVt0GvsqRflZHo=;
 b=xIdQTgu+kRQsLXTyaTF38wF1aaJzAwwtaBOLOKgdfXJaW8HEBB5X/WRSBsqCZ5w24FH5M7BHhJFhNRX4tnpimDbP+YjjwcNOnHHxlPIVlr/wCMIS+EbKX8WLmOfO7kWAjDwPmRv3V3XyaZNTgh4KfPLaFIraxAVwWpyljgh3SCw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6c59477f-d133-4cab-4f4e-afd8e710453c@amd.com>
Date: Wed, 20 Sep 2023 12:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: RFC: arm64: Handling reserved memory nodes
Content-Language: en-US
To: Leo Yan <leo.yan@linaro.org>, Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Henry
 Wang" <Henry.Wang@arm.com>, Penny Zheng <penny.zheng@arm.com>
References: <20230914081607.GA1400758@leoy-huanghe.lan>
 <23a0185e-428d-496b-96b6-d5082800bfd4@xen.org>
 <20230916081541.GA3291774@leoy-huanghe.lan>
 <561f8b9d-3877-4251-8cf7-7cdf313254bb@xen.org>
 <20230920100344.GA71044@leoy-huanghe>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230920100344.GA71044@leoy-huanghe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|DM4PR12MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd86273-78c2-4275-1d53-08dbb9c4d322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y15tlox76IJPnZ5I9h4/hcNLwdHO6IrepBnJ2jrjnB0J5jDl2y+Dv6JWMtY3B5xxvK4YDuNnSMR7cfHXGkxMxO9oOeP1MQVA9IDY5oHcbbv84KFK7c9O6AckZ5QHtBByLSnVq2gmuKMTBvNLqkmnOT+jmxFy4Uywnkfl/MpOBKnH04iFslx3iK2WvFOn8UQ9Xjjg8IRomKHXvQ0F8jwfnleXxwk0elksTIIAVwKWBmIkv7oo6joKXSSOzkoM7zscsjpMXwWUrP6BsuWe82+JjwL7Rc3L+w20HOsESdpZZSTwZTz9pk/z8BaZxzb4qim5/N189Yp5RWmlsmFlQEl3RS4kDV7W0Qq80LA61LlLAlg/NzAq4CqHHGKoZ7Q57Bg8BXgfTKGoS9iCg91/ConcVPwS9DILuHNTcBWfVnDjbKmaEJZpaVtffBvU8otvpgUkVorNBPEcky/imCYJcd2BHFiO5l4BVDmPq69SCgRUNQ2JUnFEi9Rv4x48cdPCt4x/ObggchMGFmAolZrV05qQT4TZm63OL+06ENLyEmvKsF43Cxkojzrylj+rK8X28zOynreSYnc4mhT0l9KJPlTXEDpKMq1tYb+YvH+Q0Nez/HF+5eGktHU3rbF98nLM1FCF53sx5D4XppM48lJhoLJdieHtLn8Wmc+2ps55croFu81wyGVBzkwTPORSvXgZ3V6DXKRkggkZ0ruw9G8Z9vx0lly5agtxQbcWv2odGf/VQLAcefBoAF0te6uSwqdyoSoqEsn0n5InJkDRCp//yeKiPJc7xNyEyFGj1eaI6/B438QI9iOp2PQE+z43aLlhqSls
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199024)(1800799009)(82310400011)(186009)(40470700004)(36840700001)(46966006)(31686004)(53546011)(40460700003)(356005)(86362001)(82740400003)(40480700001)(81166007)(36756003)(36860700001)(31696002)(2616005)(26005)(2906002)(426003)(336012)(47076005)(83380400001)(44832011)(478600001)(4326008)(8676002)(110136005)(5660300002)(8936002)(316002)(41300700001)(70206006)(16576012)(54906003)(70586007)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 10:32:00.9232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd86273-78c2-4275-1d53-08dbb9c4d322
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5844

Hello,

On 20/09/2023 12:03, Leo Yan wrote:
> 
> 
> Hi Julien,
> 
> On Mon, Sep 18, 2023 at 08:26:21PM +0100, Julien Grall wrote:
> 
> [...]
> 
>> ... from my understanding reserved-memory are just normal memory that are
>> set aside for a specific purpose. So Xen has to create a 'memory' node *and*
>> a 'reserved-memory' region.
> 
> To be clear, Xen passes the 'reserved-memory' regions as normal memory
> nodes, see [1].
> 
>> With that the kernel is supposed to exclude all the 'reserved-memory' from
>> normal usage unless they have the node contains the property 'reusable'.
>> This was more clear before the binding was converted to YAML in [1].
> 
> Linux kernel reserves pages for memory ranges in the 'reserved-memory'
> node, no matter the 'no-map' property for a range is set or not (see the
> function memmap_init_reserved_pages() -> __SetPageReserved() in Linux
> kernel).
> 
> If a reserved memory range is set with 'no-map' property, the memory
> region will be not mapped in the kernel's identical address space.  This
> avoids the data corruption caused between the memory speculative fetch
> with cachable mapping and the same memory region is used by devices
> (e.g. for DMA transferring).
> 
> [...]
> 
>>> Here the problem is these reserved memory regions are passed as normal
>>> memory nodes to Dom0 kernel, then Dom0 kernel allocates pages from
>>> these reserved memory regions.  Apparently, this might lead to conflict,
>>> e.g. the reserved memory is used by Dom0 kernel, at the meantime the
>>> memory is used by another purpose (e.g. by MCU in the system).
>>
>> See above. I think this is correct to pass both 'memory' and
>> 'reserved-memory'. Now, it is possible that Xen may not create the
>> device-tree correctly.
> 
> Agreed that now Xen wrongly create DT binding for 'reserved-memory'
> node, more specific, the reserved memory nodes are wrongly passed as
> normal memory nodes (again, see [1]).
> 
>> I would suggest to look how Linux is populating the memory and whether it
>> actually skipped the regions.
> 
> The Linux kernel reserves the corresponding pages for all reserved
> memory regions, which means the kernel page management (buddy
> alrogithm) doesn't allocate these pages at all.
> 
> With 'no-map' property, the memory range will not be mapped into the
> kernel identical address space.
> 
>>> Here I am a bit confused for "Xen doesn't have the capability to know
>>> the memory attribute".  I looked into the file arch/arm/guest_walk.c,
>>> IIUC, it walks through the stage 1's page tables for the virtual
>>> machine and get the permission for the mapping, we also can get to
>>> know the mapping attribute, right?
>>
>> Most of the time, Xen will use the HW to translate the guest virtual address
>> to an intermediation physical address. Looking at the specification, it
>> looks like that PAR_EL1 will contain the memory attribute which I didn't
>> know.
>>
>> We would then need to read MAIR_EL1 to find the attribute and also the
>> memory attribute in the stage-2 to figure out the final memory attribute.
> 
>> This is feasible but the Xen ABI mandates that region passed to Xen have a
>> specific memory attributes (see the comment at the top of
>> xen/include/public/arch-arm.h).
> 
> If you refer to the comment "All memory which is shared with other
> entities in the system ... which is mapped as Normal Inner Write-Back
> Outer Write-Back Inner-Shareable", I don't think it's relevant with
> current issue.  I will explain in details in below.
> 
>> Anyway, in your case, Linux is using the buffer is on the stack. So the
>> region must have been mapped with the proper attribute.
> 
> I think you may misunderstand the issue.  I would like to divide the
> issue into two parts:
> 
> - The first question is about how to pass reserved memory node from Xen
>   hypervisor to Dom0 Linux kernel.  Currently, Xen hypervisor coverts
>   the reserved memory ranges and add them into the normal memory node.
> 
>   Xen hypervisor should keep the reserved memory node and pass it to
>   Dom0 Linux kernel.  With this change, the Dom0 kernel will only
>   allocate pages from normal memory node and the data in these pages
>   can be shared by Xen hypervisor and Dom0 Linux kernel.
> 
> - The second question is for memory attribute for the reserved memory
>   node.  Note, the reserved memory ranges are not necessarily _shared_
>   between the Xen hypervisor and Dom0 Linux kernel.  I think in most
>   cases, the reserved memory will be ioremaped by drivers (for stage-1);
>   and the Xen hypervisor should map P2M with the attribute
>   p2m_mmio_direct_c, or we can explore a bit based on different
>   properties, e.g. for 'no-map' memory range, we map P2M with
>   p2m_mmio_direct_c; for 'reusable' memory range, we map with
>   attribute 'p2m_ram_rw'.
> 
> To simplify the discussion, I think we can firstly finalize the fixing
> for the fist question and hold on the second question.  After we fix
> the first one, we can come back to think about the second issue.
> 
>>> Another question for the attribute for MMIO regions. For mapping MMIO
>>> regions, prepare_dtb_hwdom() sets the attribute 'p2m_mmio_direct_c'
>>> for the stage 2, but in the Linux kernel the MMIO's attribute can
>>> be one of below variants:
>>>
>>> - ioremap(): device type with nGnRE;
>>> - ioremap_np(): device type with nGnRnE (strong-ordered);
>>> - ioremap_wc(): normal non-cachable.
>>
>> The stage-2 memory attribute is used to restrict the final memory attribute.
>> In this case, p2m_mmio_direct_c allows the domain to set pretty much any
>> memory attribute.
> 
> Thanks for confirmation.  If so, I think the Xen hypervisor should
> follow the same attribute to map the reserved regions with attribute
> p2m_mmio_direct_c.
> 
>>> If Xen hypervisor can handle these MMIO types in stage 2, then we should
>>> can use the same way to map stage 2 tables for the reserved memory.  A
>>> difference for the reserved memory is it can be mapped as normal memory
>>> with cacheable.
>>
>> I am a bit confused. I read this as you think the region is not mapped in
>> the P2M (aka stage-2 page-tables for Arm). But from the logs you provided,
>> the regions are already mapped (you have an MFN in hand).
> 
> You are right.  The reserved memory regions have been mapped in P2M.
> 
>> So to me the error is most likely in how we create the Device-Tree.
> 
> Yeah, let's firstly focus on the DT binding for reserved memory nodes.
> 
>>> The DT binding is something like (I tweaked a bit for readable):
>>
>> Just to confirm this is the host device tree, right? If so...
> 
> Yes.
> 
>>>     memory@20000000 {
>>>             #address-cells = <0x02>;
>>>             #size-cells = <0x02>;
>>>             device_type = "memory";
>>>             reg = <0x00 0x20000000 0x00 0xa0000000>,
>>>                        <0x01 0xa0000000 0x01 0x60000000>;
>>>     };
>>
>> ... you can see the reserved-regions are described in the normal memory. In
>> fact...
>>
>>>
>>>
>>>     reserved-memory {
>>>             #address-cells = <0x02>;
>>>             #size-cells = <0x02>;
>>>             ranges;
>>>
>>>             reserved_mem1 {
>>>                     reg = <0x00 0x20000000 0x00 0x00010000>;
>>>                     no-map;
>>>             };
>>>
>>>             reserved_mem2 {
>>>                     reg = <0x00 0x40000000 0x00 0x20000000>;
>>>                     no-map;
>>>             };
>>>
>>>             reserved_mem3 {
>>>                     reg = <0x01 0xa0000000 0x00 0x20000000>;
>>>                     no-map;
>>>             };
>>
>> ... no-map should tell the kernel to not use the memory at all. So I am a
>> bit puzzled why it is trying to use it.
> 
> No, 'no-map' doesn't mean the Linux kernel doesn't use it, I quote from
> the kernel documentation
> Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml:
> 'no-map' means the kernel "must not create a virtual mapping of the
> region". The reserved memory regions are still "under the control of the
> device driver using the region".
> 
>> I would suggest to check if somehow Linux doesn't understand the
>> reserved-memory nodes we wrote.
> 
> Could you confirm the Xen does write reserved memory nodes?  Or Xen
> converts the reserved memory nodes to normal memory nodes as I
> describe above :)

Xen passes the /reserved-memory node unchanged from host device tree to dom0 fdt.
Apart from that it creates an additional memory node covering the reserved ranges.
Take a look at this example run(based on qemu):

Host dt:
memory@40000000 {
    reg = <0x00 0x40000000 0x01 0x00>;
    device_type = "memory";
};

reserved-memory {
    #size-cells = <0x02>;
    #address-cells = <0x02>;
    ranges;

    test@50000000 {
        reg = <0x00 0x50000000 0x00 0x10000000>;
        no-map;
    };
};

Xen:
(XEN) MODULE[0]: 000000004ac00000 - 000000004ad65000 Xen
(XEN) MODULE[1]: 000000004ae00000 - 000000004ae03000 Device Tree
(XEN) MODULE[2]: 0000000042c00000 - 000000004aa8ea8b Ramdisk
(XEN) MODULE[3]: 0000000040400000 - 0000000042b30000 Kernel
(XEN)  RESVD[0]: 0000000050000000 - 000000005fffffff
...
(XEN) BANK[0] 0x000000c0000000-0x00000100000000 (1024MB)

Linux dom0:
[    0.000000] OF: reserved mem: 0x0000000050000000..0x000000005fffffff (262144 KiB) nomap non-reusable test@50000000

cat /proc/iomem:
50000000-5fffffff : reserved
c0000000-ffffffff : System RAM

dtc from Linux dom0:

memory@c0000000 {
    device_type = "memory";
    reg = <0x00 0xc0000000 0x00 0x40000000>;
};

memory@50000000 {
    device_type = "memory";
    reg = <0x00 0x50000000 0x00 0x10000000>;
};

reserved-memory {
    #address-cells = <0x02>;
    #size-cells = <0x02>;
    ranges;

    test@50000000 {
        reg = <0x00 0x50000000 0x00 0x10000000>;
        no-map;
    };
};


~Michal

