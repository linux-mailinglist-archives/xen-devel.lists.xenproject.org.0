Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 086727EEB74
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 04:32:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634833.990366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3pa2-0005pW-KV; Fri, 17 Nov 2023 03:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634833.990366; Fri, 17 Nov 2023 03:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3pa2-0005nG-Gg; Fri, 17 Nov 2023 03:31:42 +0000
Received: by outflank-mailman (input) for mailman id 634833;
 Fri, 17 Nov 2023 03:31:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v4FF=G6=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r3pa0-0005nA-FK
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 03:31:40 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d020114c-84f9-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 04:31:38 +0100 (CET)
Received: from CYXPR03CA0014.namprd03.prod.outlook.com (2603:10b6:930:d0::13)
 by SA1PR12MB7293.namprd12.prod.outlook.com (2603:10b6:806:2b9::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Fri, 17 Nov
 2023 03:31:34 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:930:d0:cafe::a8) by CYXPR03CA0014.outlook.office365.com
 (2603:10b6:930:d0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23 via Frontend
 Transport; Fri, 17 Nov 2023 03:31:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.20 via Frontend Transport; Fri, 17 Nov 2023 03:31:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 16 Nov
 2023 21:31:33 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 16 Nov
 2023 21:31:21 -0600
Received: from [172.28.214.164] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 16 Nov 2023 21:31:20 -0600
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
X-Inumbo-ID: d020114c-84f9-11ee-98dc-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXjbuF3iNbCskYoxjUP7tbR15TV5xrpjWgMemL7yu25oeen05bU6A75TXIOawVVzKCfZGnSa+W8w1lGCoroNLXmL6dzmMWxGZEhZKlNFg+2BAE3Pr8w7EJeTserFtc4SKso4EV8Rt5e8XBFs/vBTH9WhIFrBbvaBlV+KByOxSZqxCXSjURQBd+No/h//Ofw/FZy+iw5ZxiwRvbEAfYsV0lu89xqC0PAuA8YNrM6a52gP5kwGgaGumdnWwZxs9Dl2w7Yip4ZqjDp28kl66MW1PHQbhX3o6g1UVNfZkRWcdkfJC7JH/Lknzv580nujV7TNm7ramZTzZ5cNiCg2wpOGfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oK27nuh428oob/1SIdJSmarK0sYhkeAoxH8rFz8poYo=;
 b=iOwFGNfq34d737jHqd+4Wz7kdz8nihrvVvY8WE6l/xZBtck00C6ZaDgcbXc5TDykuQS7ysP78GEAMTUW1KYdrOO7X/InNUSqS+SVEAwNubqQ5gT8MGZPNIweODJGmU8P3ubGyvKpUzXEMxRG7XHfAeN5ptM5efcI8dc1ftYgTsnyXJl/b0HLMN0MMpL6aTdGUM1JhJmqMu3UxpwIkte5p8+PxYUPOze60e/ng2XMp3lhhhCyGgVXQOBqeeaLM+3wkalNNm2GGXqWppIxSgGhnDt1KE8XUuKhU9W9GOUlBYlnFDY6ImpewvBeKdEBKK6uW89b4ROT826FdnTQMSBM6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oK27nuh428oob/1SIdJSmarK0sYhkeAoxH8rFz8poYo=;
 b=0vWwoJwbarWt38tnS/8ru06dhXIGuIHBpynbi6fLBCMeyE8fwWAhV1kTz2esgjR08jpTnlcR+PPlhY2OQ7PfMoSA5YjF0bfF/BkkiMlDsX5yHi9tYFOw0rdNqqN2VHZm0CRNMI9zQ/CMOinXt44r6U1cpoeEdOIqtnBgvTGCkWc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <78c59979-5110-4fa3-855d-e0fa6df116f0@amd.com>
Date: Thu, 16 Nov 2023 22:31:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>
CC: Julien Grall <julien@xen.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, <vikram.garhwal@amd.com>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
 <20231115112611.3865905-3-Sergiy_Kibrik@epam.com>
 <f4523916-f8aa-4f3c-a148-2fc73b0c5fa4@xen.org>
 <a5ce647b-f372-41ee-b1d2-b6ff16c3d1a0@epam.com>
 <alpine.DEB.2.22.394.2311151518500.160649@ubuntu-linux-20-04-desktop>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2311151518500.160649@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|SA1PR12MB7293:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a37d16-e4f7-4fd9-ec19-08dbe71db29a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yQzFEuuFy8NG3SNRWUdh/QjvhH/GRd+3biVKMNhuBfywd8AAzhc3F+0nVa356MtVCD/kF5HMe1oLHaHxRbNCWtX5gRWOZU4aJKWfIrlEIpH7Mv5J1q++Y/zsNyiPpq53ONWd4WV5WW7wPdK9bZdmGdrGY/KIpKyVn+GvH2Ny+2cALGuoLkHrkCjQnfbU71BwXxTu587w5V5R99d3vHY/UA2GfsJEjnPPxkHxiRYzpcV2xZ7gmYhBZ9DY3JYH1D3JmnUEWcsSSmMkuQxnxN1lk4fBmTzbt2/AhF8nopecRGLiJHo7AXusSdw8gk2rxwIXB/D4FoOLyXLmLnmOM8PrtVaBqJyr7N6f7cDEexMjdfJo513zYhkZVgOZsYOTqXvZ1Sg2FdMxMYdxN8+k6q0zjuIhIZpkEMmWxnFAHBjmG1NE3P61jNuxjCiyllPScuGfaqmvKxKE3Xb0AVbCXZr9bvirThm1JDmWt/7FRj5Vo5aFQbE0+d7B5l8ZbzqI/jT0FJhErdYPrH06uCKuHZboythl5CP6O2wLjZWy0SeghouGfbmHXgnSW/jSoTl5p9pFOavbT8+Ia2e2NmkqvpyIqXvBFDiewzMPs+i5vWfaqW6NvjzOjPIfQWxKppEYryjTD3a3cJRQb3VVsqETvpgVtXUx8NcMlWwcH5ncMsu+tFka8gYXrF6rB8/a9S290vloku39XAocm/S1TdWt9po8nw0b6KHOMPi6eLIrL+nmI8wt9ufcXTKeOYwp0N/frgDtlSnB0bx9/chvJYidjMmLky0gCcnmrr0O0IcZDwHkALo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(64100799003)(1800799009)(451199024)(82310400011)(186009)(46966006)(36840700001)(40470700004)(8676002)(53546011)(8936002)(31696002)(40480700001)(4326008)(966005)(70206006)(70586007)(86362001)(316002)(110136005)(478600001)(16576012)(54906003)(83380400001)(44832011)(82740400003)(31686004)(426003)(2616005)(26005)(336012)(47076005)(36860700001)(2906002)(40460700003)(5660300002)(41300700001)(81166007)(36756003)(356005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 03:31:33.8059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a37d16-e4f7-4fd9-ec19-08dbe71db29a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7293

On 11/15/23 18:28, Stefano Stabellini wrote:
> + Stewart, Vikram
> 
> On Wed, 15 Nov 2023, Oleksandr Tyshchenko wrote:
>> On 15.11.23 14:33, Julien Grall wrote:
>>> Thanks for adding support for virtio-pci in Xen. I have some questions.
>>>
>>> On 15/11/2023 11:26, Sergiy Kibrik wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> In order to enable more use-cases such as having multiple
>>>> device-models (Qemu) running in different backend domains which provide
>>>> virtio-pci devices for the same guest, we allocate and expose one
>>>> PCI host bridge for every virtio backend domain for that guest.
>>>
>>> OOI, why do you need to expose one PCI host bridge for every stubdomain?
>>>
>>> In fact looking at the next patch, it seems you are handling some of the 
>>> hostbridge request in Xen. This is adds a bit more confusion.
>>>
>>> I was expecting the virtual PCI device would be in the vPCI and each 
>>> Device emulator would advertise which BDF they are covering.
>>
>>
>> This patch series only covers use-cases where the device emulator 
>> handles the *entire* PCI Host bridge and PCI (virtio-pci) devices behind 
>> it (i.e. Qemu). Also this patch series doesn't touch vPCI/PCI 
>> pass-through resources, handling, accounting, nothing. From the 
>> hypervisor we only need a help to intercept the config space accesses 
>> happen in a range [GUEST_VIRTIO_PCI_ECAM_BASE ... 
>> GUEST_VIRTIO_PCI_ECAM_BASE + GUEST_VIRTIO_PCI_TOTAL_ECAM_SIZE] and 
>> forward them to the linked device emulator (if any), that's all.
>>
>> It is not possible (with current series) to run device emulators what
>> emulate only separate PCI (virtio-pci) devices. For it to be possible, I 
>> think, much more changes are required than current patch series does. 
>> There at least should be special PCI Host bridge emulation in Xen (or 
>> reuse vPCI) for the integration. Also Xen should be in charge of forming 
>> resulting PCI interrupt based on each PCI device level signaling (if we 
>> use legacy interrupts), some kind of x86's XEN_DMOP_set_pci_intx_level, 
>> etc. Please note, I am not saying this is not possible in general, 
>> likely it is possible, but initial patch series doesn't cover these 
>> use-cases)
>>
>> We expose one PCI host bridge per virtio backend domain. This is a 
>> separate PCI host bridge to combine all virtio-pci devices running in 
>> the same backend domain (in the same device emulator currently).
>> The examples:
>> - if only one domain runs Qemu which servers virtio-blk, virtio-net, 
>> virtio-console devices for DomU - only single PCI Host bridge will be 
>> exposed for DomU
>> - if we add another domain to run Qemu to serve additionally virtio-gpu, 
>> virtio-input and virtio-snd for the *same* DomU - we expose second PCI 
>> Host bridge for DomU
>>
>> I am afraid, we cannot end up exposing only single PCI Host bridge with 
>> current model (if we use device emulators running in different domains 
>> that handles the *entire* PCI Host bridges), this won't work.
>  
> 
> We were discussing the topic of vPCI and Virtio PCI just this morning
> with Stewart and Vikram. We also intend to make them work well together
> in the next couple of months (great timing!!)
> 
> However, our thinking is to go with the other approach Julien
> suggested: a single PCI Root Complex emulated in Xen by vPCI. QEMU would
> register individual PCI devices against it.
> 
> Vikram, Stewart, please comment. Our understanding is that it should be
> possible to make QEMU virtio-pci work with vPCI with relatively minor
> efforts and AMD volunteers to do the work in the next couple of months
> on the vPCI side.
> 
> 
> Although it should be possible to make both approaches work at the same
> time, given that it would seem that EPAM and AMD have very similar
> requirements, I suggest we work together and collaborate on a single
> approach going forward that works best for everyone.
> 
> 
> Let me start by saying that if we can get away with it, I think that a
> single PCI Root Complex in Xen would be best because it requires less
> complexity. Why emulate 2/3 PCI Root Complexes if we can emulate only
> one?
> 
> Stewart, you are deep into vPCI, what's your thinking?

First allow me explain the moving pieces in a bit more detail (skip ahead to "Back to the question: " if you don't want to be bored with the details). I played around with this series, and I passed through a PCI device (with vPCI) and enabled virtio-pci:

virtio = [ "type=virtio,device,transport=pci,bdf=0000:00:00.0,backend_type=qemu" ]
device_model_args = [ "-device", "virtio-serial-pci" ]
pci = [ "01:00.0" ]

Indeed we get two root complexes (2 ECAM ranges, 2 sets of interrupts, etc.) from the domU point of view:

    pcie@10000000 {
        compatible = "pci-host-ecam-generic";
        device_type = "pci";
        reg = <0x00 0x10000000 0x00 0x10000000>;
        bus-range = <0x00 0xff>;
        #address-cells = <0x03>;
        #size-cells = <0x02>;
        status = "okay";
        ranges = <0x2000000 0x00 0x23000000 0x00 0x23000000 0x00 0x10000000 0x42000000 0x01 0x00 0x01 0x00 0x01 0x00>;
        #interrupt-cells = <0x01>;
        interrupt-map = <0x00 0x00 0x00 0x01 0xfde8 0x00 0x74 0x04>;
        interrupt-map-mask = <0x00 0x00 0x00 0x07>;
    };

    pcie@33000000 {
        compatible = "pci-host-ecam-generic";
        device_type = "pci";
        reg = <0x00 0x33000000 0x00 0x200000>;
        bus-range = <0x00 0x01>;
        #address-cells = <0x03>;
        #size-cells = <0x02>;
        status = "okay";
        ranges = <0x2000000 0x00 0x34000000 0x00 0x34000000 0x00 0x800000 0x42000000 0x00 0x3a000000 0x00 0x3a000000 0x00 0x800000>;
        dma-coherent;
        #interrupt-cells = <0x01>;
        interrupt-map = <0x00 0x00 0x00 0x01 0xfde8 0x00 0x0c 0x04 0x00 0x00 0x00 0x02 0xfde8 0x00 0x0d 0x04 0x00 0x00 0x00 0x03 0xfde8 0x00 0x0e 0x04 0x00 0x00 0x00 0x04 0xfde8 0x00 0x0f 0x04 0x800 0x00 0x00 0x01 0xfde8 0x00 0x0d 0x04 0x800 0x00 0x00 0x02 0xfde8 0x00 0x0e 0x04 0x800 0x00 0x00 0x03 0xfde8 0x00 0x0f 0x04 0x800 0x00 0x00 0x04 0xfde8 0x00 0x0c 0x04 0x1000 0x00 0x00 0x01 0xfde8 0x00 0x0e 0x04 0x1000 0x00 0x00 0x02 0xfde8 0x00 0x0f 0x04 0x1000 0x00 0x00 0x03 0xfde8 0x00 0x0c 0x04 0x1000 0x00 0x00 0x04 0xfde8 0x00 0x0d 0x04 0x1800 0x00 0x00 0x01 0xfde8 0x00 0x0f 0x04 0x1800 0x00 0x00 0x02 0xfde8 0x00 0x0c 0x04 0x1800 0x00 0x00 0x03 0xfde8 0x00 0x0d 0x04 0x1800 0x00 0x00 0x04 0xfde8 0x00 0x0e 0x04>;
        interrupt-map-mask = <0x1800 0x00 0x00 0x07>;
    };

Xen vPCI doesn't currently expose a host bridge (i.e. a device with base class 0x06). As an aside, we may eventually want to expose a virtual/emulated host bridge in vPCI, because Linux's x86 PCI probe expects one [0].

Qemu exposes an emulated host bridge, along with any requested emulated devices.

Running lspci -v in the domU yields the following:

0000:00:00.0 Network controller: Ralink corp. RT2790 Wireless 802.11n 1T/2R PCIe
        Subsystem: ASUSTeK Computer Inc. RT2790 Wireless 802.11n 1T/2R PCIe
        Flags: bus master, fast devsel, latency 0, IRQ 13
        Memory at 23000000 (32-bit, non-prefetchable) [size=64K]
        Capabilities: [50] MSI: Enable- Count=1/128 Maskable- 64bit+
        Kernel driver in use: rt2800pci

0001:00:00.0 Host bridge: Red Hat, Inc. QEMU PCIe Host bridge
        Subsystem: Red Hat, Inc. QEMU PCIe Host bridge
        Flags: fast devsel

0001:00:01.0 Communication controller: Red Hat, Inc. Virtio console
        Subsystem: Red Hat, Inc. Virtio console
        Flags: bus master, fast devsel, latency 0, IRQ 14
        Memory at 3a000000 (64-bit, prefetchable) [size=16K]
        Capabilities: [84] Vendor Specific Information: VirtIO: <unknown>
        Capabilities: [70] Vendor Specific Information: VirtIO: Notify
        Capabilities: [60] Vendor Specific Information: VirtIO: DeviceCfg
        Capabilities: [50] Vendor Specific Information: VirtIO: ISR
        Capabilities: [40] Vendor Specific Information: VirtIO: CommonCfg
        Kernel driver in use: virtio-pci

0000:00:00.0 is a real passed through device (corresponding to 0000:01:00.0 in dom0).
0001:00:00.0 is the qemu host bridge (base class 0x06).
They are on different segments because they are associated with different root complexes.


Back to the question: Sure, avoiding reserving more memory from the preciously small lowmem virtual memory layout is probably a good idea. With everything in a single virtual root complex (segment), it's probably possible to come up with some vBDF-picking algorithm (+ user ability to specify) that works for most use cases as discussed elsewhere. It will always be in a single fixed segment as far as I can tell.

Some more observations assuming a single virtual root complex:

We should probably hide the qemu host bridge(s) from the guest. In other words, hide all devices with base class 0x06, except eventually vPCI's own virtual host bridge. If we don't hide them, we would likely end up with multiple emulated host bridges on a single root complex (segment). That sounds messy and hard to manage.

We have a need to control the vBDF exposed to the guest - can we force qemu to use particular BDFs for its emulated devices? If not, we will need to do SBDF translation in vPCI for virtio-pci devices. Meaning virtio-pci would then be dependent on the vPCI series [1]. I think that's okay. Hmm - if a qemu SBDF clashes with a real hardware SBDF, is that an issue?

vPCI and virtio-pci devices will be sharing a single ECAM range, so it looks like we must rely on vPCI to intercept the accesses that need to be forwarded to ioreq.

Initially, it looks like we would be adding some sort of support for legacy interrupts in vPCI, but for virtio-pci devices only. Eventually, we may also want to consider virtio-pci with MSI/MSI-X, but it's probably okay to wait.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/x86/pci/direct.c?h=v6.6.1#n186
[1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00660.html

