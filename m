Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6764C7F36B0
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 20:13:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638125.994453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5WB9-0008Od-TT; Tue, 21 Nov 2023 19:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638125.994453; Tue, 21 Nov 2023 19:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5WB9-0008Mf-Qf; Tue, 21 Nov 2023 19:12:59 +0000
Received: by outflank-mailman (input) for mailman id 638125;
 Tue, 21 Nov 2023 19:12:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/0D=HC=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r5WB8-0008MZ-G7
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 19:12:58 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8bb5e98-88a1-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 20:12:55 +0100 (CET)
Received: from MN2PR07CA0023.namprd07.prod.outlook.com (2603:10b6:208:1a0::33)
 by PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 19:12:46 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::e0) by MN2PR07CA0023.outlook.office365.com
 (2603:10b6:208:1a0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Tue, 21 Nov 2023 19:12:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 19:12:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 13:12:44 -0600
Received: from [172.28.214.164] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 21 Nov 2023 13:12:43 -0600
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
X-Inumbo-ID: f8bb5e98-88a1-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7Dwh2NhJg8WSeqJH0+j91qera9iiII1uEQiaYoUN1Ns+BYhsWz3WQ3rRICIpYA/ia85SsrcCdAQU06mdjD0IAsEltELQa9EfgnWcAxUgrPEhpA+3G8OPqLMnQiEDvIL/iQLyYjYSxN8P0X++uqlogkSQVQmLt+4IIUn9XK1mHn4cJeaGMmRaz8N1UgEIziIenOLWLzZeHjXUccoTmjjTLYnuNatBm588vh0vyDob+X09aAmuvsxwe5KbqmPM9hzP0NhQW+6xpjjDiHEgcZIvzJjrL2LYlrZKaW0Zl3+fo4RtEfvuEM0CGHm69Z3RClsxQF9Gr4crlSi8aOM8HF2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3WJgwiZ/bCWh4OmX+UYiRM2a7J7Qi4PhjkLtwxxxVQ=;
 b=jd13nVAO3CSqwCkFNJFYUK+q+ixCzr5cNKebilTKUE4yHWIInf9LewlnzLFnLLDQUppjDvyz65r3UXvWbyPHixksG8yhRkHVT1b1RS5MjAqnhO9oAklzM5uxpSzIE556OZ2EhYh0WTXGfrDEEcLcd+SO7fLnClzTO1BnJVUujCnZa9S6iBYkxzAn9jN+wuWCLPxisSBqKQfEXUOWemgy1RsJqrlao+Sr3IsuwEA1lZdt4sRSt62r/ER1aISA/MGeiN/Em32FJjLzYrSssnZDmxQnPXahJU9OP1AH7resLZv7Ahz0f2TpoRlK6coKxnCLhuFuJ+pp+/+i4CMpxw6bKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3WJgwiZ/bCWh4OmX+UYiRM2a7J7Qi4PhjkLtwxxxVQ=;
 b=XqM9p+tlIVpXuGJpE5XWcyzKsvtiaIFI3oxcXPbxVTHfX844HnOIEUWPqrOHxxHa8AgzweBLeTzHaexij86xxeUZz36DC8dhfZ2PzFTWwBkwTgv4r8ceglqtWtakC3qvkzC+EkQA0/1g/ZkX8gWsV0trQBa5d1i3xw7KiokVz5M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <54294601-76fe-4994-9500-e6a9999dba73@amd.com>
Date: Tue, 21 Nov 2023 14:12:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
Content-Language: en-US
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
CC: Julien Grall <julien@xen.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "vikram.garhwal@amd.com"
	<vikram.garhwal@amd.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
 <20231115112611.3865905-3-Sergiy_Kibrik@epam.com>
 <f4523916-f8aa-4f3c-a148-2fc73b0c5fa4@xen.org>
 <a5ce647b-f372-41ee-b1d2-b6ff16c3d1a0@epam.com>
 <alpine.DEB.2.22.394.2311151518500.160649@ubuntu-linux-20-04-desktop>
 <78c59979-5110-4fa3-855d-e0fa6df116f0@amd.com>
 <a96732c2-cdfb-43fb-9e88-1cd54994eab4@epam.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <a96732c2-cdfb-43fb-9e88-1cd54994eab4@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 549eeb41-2a49-4666-a484-08dbeac5d7ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sESaOU6veG/YPk2ajaYFsi9AKlStEe9kjY/CnXMPP4V+3ah8XPKAjAbHvN/KBawNvyoZkANyH8D3asQ0iuNg0Srr/hOi2zxu2BRUpzAE6BAsR4EHVywVuRFe48D4pup/tABCq4SHbbsJ2B0QEGK+T8Y4GbvBR4gnOaWqfy29v+MOVHLRf5L9XgZLpxZxYDbGczOEBgeFIxLGfDK5ZGOQ12C7Gu/CwwFNKg6pig9VcTQzaT8NnGuYEzOpsqmjEn705KBiFq/lqOPhr759aOz3mR685HVGgHOhnwaBSnca8nhXJe4IwnfX1+SXydhFrmqBwu/sgKeJx9/gCt60DgAkhviEiQPK0XBOMHb+Kl3YqBrDu5JiEilzF0kCkqzNDxh7YrJ2gPoe7FHWv/y4CCCfU0R+L3QBBBZnqJd0Xw+ipieBd0VbHYD779JMJeBiPqLbxaEXxbq2PTAqgmxWGNw/mhVFX2XpuSEVz3mLAZuA2g2QE6CkSqueHobxaGi0RV/iHIALSsSzpefMVzHdu0404SADdmB/bvKy/FwXG1c4Me1TMBRNtp0TZllvL4nt4fmugM7n/MdHMeY5+Dx45HR+pwL4GWls2KIYTyxkrU6BIOHk9LX6UTw91vxNFZGQd31IeYOai6SCQTJl3/TGfV3iicolGkA2+wKGq9jNy8ZJiaLi7QzPsdSIPC8+nqvOBCgP02j7zwSk631TPiVjhtUYoTGe3AHT3cZ3HBoWb8Xr7iyuGMAv2VtrORzpKuxbmMTEdwG+r/Nuyss2ft/8qZwOS8q34KPQsVtLOqaaIYfYJ2QRn6xdaZ1jdZstLnWiDm24TRfMHuR8GM5CKe0oDvSg4g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(451199024)(82310400011)(64100799003)(186009)(1800799012)(40470700004)(46966006)(36840700001)(6916009)(40460700003)(70586007)(70206006)(54906003)(316002)(16576012)(53546011)(36756003)(426003)(336012)(478600001)(2616005)(26005)(966005)(31696002)(81166007)(82740400003)(356005)(83380400001)(36860700001)(47076005)(86362001)(5660300002)(40480700001)(44832011)(31686004)(2906002)(41300700001)(8676002)(8936002)(4326008)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 19:12:45.4942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 549eeb41-2a49-4666-a484-08dbeac5d7ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8013

On 11/17/23 03:11, Oleksandr Tyshchenko wrote:
> 
> 
> On 17.11.23 05:31, Stewart Hildebrand wrote:
> 
> Hello Stewart
> 
> [answering only for virtio-pci bits as for vPCI I am only familiar with 
> code responsible for trapping config space accesses]
> 
> [snip]
> 
>>>
>>>
>>> Let me start by saying that if we can get away with it, I think that a
>>> single PCI Root Complex in Xen would be best because it requires less
>>> complexity. Why emulate 2/3 PCI Root Complexes if we can emulate only
>>> one?
>>>
>>> Stewart, you are deep into vPCI, what's your thinking?
>>
>> First allow me explain the moving pieces in a bit more detail (skip ahead to "Back to the question: " if you don't want to be bored with the details). I played around with this series, and I passed through a PCI device (with vPCI) and enabled virtio-pci:
>>
>> virtio = [ "type=virtio,device,transport=pci,bdf=0000:00:00.0,backend_type=qemu" ]
>> device_model_args = [ "-device", "virtio-serial-pci" ]
>> pci = [ "01:00.0" ]
>>
>> Indeed we get two root complexes (2 ECAM ranges, 2 sets of interrupts, etc.) from the domU point of view:
>>
>>      pcie@10000000 {
>>          compatible = "pci-host-ecam-generic";
>>          device_type = "pci";
>>          reg = <0x00 0x10000000 0x00 0x10000000>;
>>          bus-range = <0x00 0xff>;
>>          #address-cells = <0x03>;
>>          #size-cells = <0x02>;
>>          status = "okay";
>>          ranges = <0x2000000 0x00 0x23000000 0x00 0x23000000 0x00 0x10000000 0x42000000 0x01 0x00 0x01 0x00 0x01 0x00>;
>>          #interrupt-cells = <0x01>;
>>          interrupt-map = <0x00 0x00 0x00 0x01 0xfde8 0x00 0x74 0x04>;
>>          interrupt-map-mask = <0x00 0x00 0x00 0x07>;
> 
> 
> I am wondering how you got interrupt-map here? AFAIR upstream toolstack 
> doesn't add that property for vpci dt node.

You are correct. I'm airing my dirty laundry here: this is a hack to get a legacy interrupt passed through on a ZCU102 board (Zynq UltraScale+), which doesn't have GICv3/ITS. In a system with a GICv3/ITS, we would have an msi-map property (this is also not yet upstream, but is in a couple of downstreams).

> 
>>      };
>>
>>      pcie@33000000 {
>>          compatible = "pci-host-ecam-generic";
>>          device_type = "pci";
>>          reg = <0x00 0x33000000 0x00 0x200000>;
>>          bus-range = <0x00 0x01>;
>>          #address-cells = <0x03>;
>>          #size-cells = <0x02>;
>>          status = "okay";
>>          ranges = <0x2000000 0x00 0x34000000 0x00 0x34000000 0x00 0x800000 0x42000000 0x00 0x3a000000 0x00 0x3a000000 0x00 0x800000>;
>>          dma-coherent;
>>          #interrupt-cells = <0x01>;
>>          interrupt-map = <0x00 0x00 0x00 0x01 0xfde8 0x00 0x0c 0x04 0x00 0x00 0x00 0x02 0xfde8 0x00 0x0d 0x04 0x00 0x00 0x00 0x03 0xfde8 0x00 0x0e 0x04 0x00 0x00 0x00 0x04 0xfde8 0x00 0x0f 0x04 0x800 0x00 0x00 0x01 0xfde8 0x00 0x0d 0x04 0x800 0x00 0x00 0x02 0xfde8 0x00 0x0e 0x04 0x800 0x00 0x00 0x03 0xfde8 0x00 0x0f 0x04 0x800 0x00 0x00 0x04 0xfde8 0x00 0x0c 0x04 0x1000 0x00 0x00 0x01 0xfde8 0x00 0x0e 0x04 0x1000 0x00 0x00 0x02 0xfde8 0x00 0x0f 0x04 0x1000 0x00 0x00 0x03 0xfde8 0x00 0x0c 0x04 0x1000 0x00 0x00 0x04 0xfde8 0x00 0x0d 0x04 0x1800 0x00 0x00 0x01 0xfde8 0x00 0x0f 0x04 0x1800 0x00 0x00 0x02 0xfde8 0x00 0x0c 0x04 0x1800 0x00 0x00 0x03 0xfde8 0x00 0x0d 0x04 0x1800 0x00 0x00 0x04 0xfde8 0x00 0x0e 0x04>;
>>          interrupt-map-mask = <0x1800 0x00 0x00 0x07>;
> 
> 
> that is correct dump.
> 
> BTW, if you added "grant_usage=1" (it is disabled by default for dom0) 
> to virtio configuration you would get iommu-map property here as well 
> [1]. This is another point to think about when considering combined 
> approach (single PCI Host bridge node -> single virtual root complex), I 
> guess usual PCI device doesn't want grant based DMA addresses, correct? 
> If so, it shouldn't be specified in the property.

Right, a usual PCI device doesn't want/need grant based DMA addresses. The iommu-map property [2] is flexible enough to make it apply only to certain vBDFs or ranges of vBDFs. Actually, it looks like ("libxl/arm: Reuse generic PCI-IOMMU bindings for virtio-pci devices") already has the logic for doing exactly this. So it should be fine to have the iommu-map property in the single root complex and still do regular PCI passthrough.

Presumably, we would also want msi-map [3] to apply to some vBDFs, not others. msi-map has the same flexible BDF matching as iommu-map (these two bindings actually share the same parsing function), so we should be able to use a similar strategy here if needed.

We would also want interrupt-map [4] to apply to some vBDFs, not others. The BDF matching with interrupt-map behaves slightly differently, but I believe it is still flexible enough to achieve this. In this case, the function create_virtio_pci_irq_map(), added in ("libxl/arm: Add basic virtio-pci support"), would need some re-thinking.

In summary, with a single virtual root complex, the toolstack needs to know which vBDFs are virtio-pci, and which vBDFs are passthrough, so it can create the [iommu,msi,interrupt]-map properties accordingly.

[2] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt
[3] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-msi.txt
[4] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/host-generic-pci.yaml

> 
> 
>>      };
>>
>> Xen vPCI doesn't currently expose a host bridge (i.e. a device with base class 0x06). As an aside, we may eventually want to expose a virtual/emulated host bridge in vPCI, because Linux's x86 PCI probe expects one [0].
>>
>> Qemu exposes an emulated host bridge, along with any requested emulated devices.
>>
>> Running lspci -v in the domU yields the following:
>>
>> 0000:00:00.0 Network controller: Ralink corp. RT2790 Wireless 802.11n 1T/2R PCIe
>>          Subsystem: ASUSTeK Computer Inc. RT2790 Wireless 802.11n 1T/2R PCIe
>>          Flags: bus master, fast devsel, latency 0, IRQ 13
>>          Memory at 23000000 (32-bit, non-prefetchable) [size=64K]
>>          Capabilities: [50] MSI: Enable- Count=1/128 Maskable- 64bit+
>>          Kernel driver in use: rt2800pci
>>
>> 0001:00:00.0 Host bridge: Red Hat, Inc. QEMU PCIe Host bridge
>>          Subsystem: Red Hat, Inc. QEMU PCIe Host bridge
>>          Flags: fast devsel
>>
>> 0001:00:01.0 Communication controller: Red Hat, Inc. Virtio console
>>          Subsystem: Red Hat, Inc. Virtio console
>>          Flags: bus master, fast devsel, latency 0, IRQ 14
>>          Memory at 3a000000 (64-bit, prefetchable) [size=16K]
>>          Capabilities: [84] Vendor Specific Information: VirtIO: <unknown>
>>          Capabilities: [70] Vendor Specific Information: VirtIO: Notify
>>          Capabilities: [60] Vendor Specific Information: VirtIO: DeviceCfg
>>          Capabilities: [50] Vendor Specific Information: VirtIO: ISR
>>          Capabilities: [40] Vendor Specific Information: VirtIO: CommonCfg
>>          Kernel driver in use: virtio-pci
>>
>> 0000:00:00.0 is a real passed through device (corresponding to 0000:01:00.0 in dom0).
>> 0001:00:00.0 is the qemu host bridge (base class 0x06).
>> They are on different segments because they are associated with different root complexes.
> 
> 
> Glad to hear this patch series doesn't seem to break PCI passthrough in 
> your environment.
> 
> 
>>
>>
>> Back to the question: Sure, avoiding reserving more memory from the preciously small lowmem virtual memory layout is probably a good idea. With everything in a single virtual root complex (segment), it's probably possible to come up with some vBDF-picking algorithm (+ user ability to specify) that works for most use cases as discussed elsewhere. It will always be in a single fixed segment as far as I can tell.
>>
>> Some more observations assuming a single virtual root complex:
>>
>> We should probably hide the qemu host bridge(s) from the guest. In other words, hide all devices with base class 0x06, except eventually vPCI's own virtual host bridge. If we don't hide them, we would likely end up with multiple emulated host bridges on a single root complex (segment). That sounds messy and hard to manage.
>>
>> We have a need to control the vBDF exposed to the guest - can we force qemu to use particular BDFs for its emulated devices?
> 
> 
> Yes, it is possible. Maybe there is a better way, but at
> least *bus* and *addr* can be specified and Qemu indeed follows that.
> 
> device_model_args=[ '-device', 
> 'virtio-blk-pci,scsi=off,disable-legacy=on,iommu_platform=on,bus=pcie.0,addr=2,drive=image', 
> '-drive', 'if=none,id=image,format=raw,file=/dev/mmcblk1p3' ]
> 
> virtio=[ "backend=Domain-0, type=virtio,device, transport=pci, 
> bdf=0000:00:02.0, grant_usage=1, backend_type=qemu" ]
> 
> root@h3ulcb-domd:~# dmesg | grep virtio
> [   0.660789] virtio-pci 0000:00:02.0: enabling device (0000 -> 0002)
> [   0.715876] virtio_blk virtio0: [vda] 4096 512-byte logical blocks 
> (2.10 MB/2.00 MiB)
> 
> root@h3ulcb-domd:~# lspci
> 00:00.0 Host bridge: Red Hat, Inc. QEMU PCIe Host bridge
> 00:02.0 SCSI storage controller: Red Hat, Inc. Virtio block device (rev 01)
> 
> Also there is one moment for current series: bdf specified for 
> virtio-pci device only makes sense for iommu-map property. So 
> bdf=0000:00:02.0 in virtio property and bus=pcie.0,addr=2 in 
> device_model_args property should be in sync.
> 
> [1] 
> https://patchwork.kernel.org/project/xen-devel/patch/20231115112611.3865905-5-Sergiy_Kibrik@epam.com/
> 
> 
> [snip]

