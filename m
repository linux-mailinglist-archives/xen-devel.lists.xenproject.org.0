Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 446E973214E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 23:06:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549902.858698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9uAC-0003py-TT; Thu, 15 Jun 2023 21:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549902.858698; Thu, 15 Jun 2023 21:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9uAC-0003mv-QC; Thu, 15 Jun 2023 21:05:52 +0000
Received: by outflank-mailman (input) for mailman id 549902;
 Thu, 15 Jun 2023 21:05:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lj72=CD=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1q9uAB-0003mp-Dd
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 21:05:51 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66fe624e-0bc0-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 23:05:49 +0200 (CEST)
Received: from DS0PR17CA0018.namprd17.prod.outlook.com (2603:10b6:8:191::18)
 by PH7PR12MB8153.namprd12.prod.outlook.com (2603:10b6:510:2b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 21:05:42 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:8:191:cafe::b4) by DS0PR17CA0018.outlook.office365.com
 (2603:10b6:8:191::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27 via Frontend
 Transport; Thu, 15 Jun 2023 21:05:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.27 via Frontend Transport; Thu, 15 Jun 2023 21:05:41 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 15 Jun
 2023 16:05:39 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 15 Jun
 2023 14:05:39 -0700
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 15 Jun 2023 16:05:37 -0500
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
X-Inumbo-ID: 66fe624e-0bc0-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lPfvWVKBMpuv+fDYTkYeT21Y8weIDK89PvKyesuaJgFAEOZEC9sw4nQV8z689MfjdahnEnAdWGWToYxHuv0tIkbZxoNm8KFB51vTgNRwrE0q+IMKIbrzSMCvaRxHIRhYTCxQQkr8a99LwIw3mhM1lmuKq3eDyX8pzH3HQg6LjSjtmuoCcO+qT284NCUwMuDn6MIqfILvqG9rPI17clr35p856c90ajfiqEYIjLh3q+PdEAk6zNl6vhrtXHvhsPgcSH6vJVHU62hM+gK5C4OW+tLeJ2c1xTBULb9t6uUJuDPR0arOIBLgxADj0ysscqeQNj/N/vOAXz+Nw+T2ZM+xTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQPJ9QqgCTW3fJ/mcojhhSDZWlbD3+QB+jX8citFzqU=;
 b=RJ+sw+CeQkXU/O0q7GfAwBUarLAmg8Dq7Vb5QeCNP8uCHAnbdB4VX/+BbjRWUBoKIhOGjeOejcIL/SGi/gTnONE/MTfU9boMr1ui6aMpHYa9I72n0iqq74zUSm2xpT0gZzwztwPv0wbVCyZ1KPTUrXXdblcPDj/Eqh+wT7kniehw4i5FCFZyOHnbdQfA1t32KoblFFlq9CeeEY2wagbRq0o/h+emAzIDuwM7f4KXCkGPdoRmMenzuwX2E4+eX8QmF+yojNFAWTEUBTdG7g8qSoiX+IUFia9oraXE/FZtv2rhu/AlkeUCfULbywC6Ot72LbA3I4BBLGLRM0pa/+++fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQPJ9QqgCTW3fJ/mcojhhSDZWlbD3+QB+jX8citFzqU=;
 b=ralqJ9srQ7G+CjsZbdZ6gNQaleUjT7ol8dsWekBCRkxcLWIB3xU37K7lYzFzrvChz99Ix+iZEqBx/aNnkjXeDLNZtIyxST25gAe4DNBMDQnUBIXWesxmT3a608mdAGHUdFJgC3P65DHrvey277rNtgRoZveLfizDFwFp9dbpFEA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4b08b38e-3beb-6b72-83fb-6dd8c8702718@amd.com>
Date: Thu, 15 Jun 2023 17:05:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v4 0/7] SMMU handling for PCIe Passthrough on ARM
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>, Jan Beulich <jbeulich@suse.com>, "Paul
 Durrant" <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
 <1f5aa53c-a9ed-41c3-2a4d-38538912cdd5@xen.org>
Content-Language: en-US
In-Reply-To: <1f5aa53c-a9ed-41c3-2a4d-38538912cdd5@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|PH7PR12MB8153:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f243ab1-a7e5-4b6c-53db-08db6de44706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xl2Io5cgylZq9VPSQk86CBE5bE8PmCfxbRKpM0iUFUD/GTmjHroCpA0/+EVBaQIK8Z8u9hF5Di8Qx/qmfRP1SK+ikdfIBZzTLDR+Qx7hJjlZioxTRxrCcT+Z4Tq+STaGIMt9B4Fj0dhPHb7bW7D3yo+/E963m2iBzRcDTUmMsBE7oz8uVAlwzcM/CcfK0zRYGlmy9fwkkggScqyYYpqSUWkTWcfUxa0lO8ytUK+R7ZkBXBH3tWUyM8+nIAbVrh9YuSd8aAB7q8FQkID1mU4TzQsgvlkXxwHABeEAahfx5rfDRDixVnxBTQ+qOhAjLkehfcOxds/lfuSuAzQogHDXDUOZNLDlAFnTDTOJ4rp9Qm93VrSocpzHE4MEhEq7vois7eyxfIWe0wpTdC6FaiZxsb7Saf3UeYBrtS+8OG5bPgYAgi+In07B0PbdLE0RJo35o7u1gom6EJ2xEFqE5IMncGLL2I42TMqTwbp26tYwvPiZ36BLDMAXHj1llZSdMV4sZV5M9LGkSDzRc8ZR4JhvKv1hVSYINAB7VpgAFQqMr2ZU3XhdNlUETd6+zgXmyolS4fjknF5Rw3PsGLDozW9HRVU3HYlVTHW5ezDjHOY5N+01rPnD28JOEx6KPW3P3n/8Thp/hfH+ch5gFEltihGs8TrVp6j7ZzyuIb/Wo2RiaCrfGjGrJbXUq5V/3Zni1CKG4sS5VKTjlpu0+Ftfdr6YpHxsSnHWQ3gfOpbWdNgkMd4CmconU19Ot7AGO3QF4urAUWSNXDAktdCsUNl9tBMo0SnUr6kVSkn8jlONu+sJNmONEnDNJHSiqtZeKPa2/FjaDwAEzzb+ElJiCJelx1ZICQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199021)(46966006)(40470700004)(36840700001)(40480700001)(40460700003)(110136005)(54906003)(16576012)(82740400003)(81166007)(356005)(478600001)(8676002)(41300700001)(8936002)(5660300002)(70206006)(2616005)(316002)(4326008)(70586007)(36860700001)(186003)(47076005)(966005)(336012)(83380400001)(53546011)(26005)(426003)(31696002)(86362001)(82310400005)(44832011)(2906002)(36756003)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 21:05:41.3219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f243ab1-a7e5-4b6c-53db-08db6de44706
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8153

On 6/7/23 03:19, Julien Grall wrote:
> Hi Stewart,
> 
> On 07/06/2023 04:02, Stewart Hildebrand wrote:
>> This series introduces SMMU handling for PCIe passthrough on ARM. These patches
>> are independent from (and don't depend on) the vPCI reference counting/locking
>> work in progress, and should be able to be upstreamed independently.
> 
> Can you clarify how this code was tested? Does this require code not yet
> upstreamed?

I'm testing the series standalone (+ config changes) by using a PCI device in dom0, and also in combination with the vPCI series [3] [4] for passthrough to a domU.


Here are some more details on the test cases I'm using.


1. Using the PCI device in dom0 with the pci-passthrough=yes arg. In this case a couple of additional config changes [1] [2] are needed to select CONFIG_HAS_PCI=y, CONFIG_HAS_VPCI=y, and make has_vpci() return true. Aside from this series itself and the config changes, nothing else not-yet-upstreamed is required for this test case. It is on my TODO list to upstream these config changes, which I think will be useful on their own, not necessarily as part of any other series.

Actually, your question prompted me to look at my test cases a bit more carefully, and I discovered a case that v4 of this series doesn't handle right. In order for the PCI device to be usable in dom0, it should be assigned by default to dom0/hardware domain during PHYSDEVOP_pci_device_add. But v4 of this series doesn't assign it by default to dom0/hardware domain. I initially missed this because I happened to assign the stream ID of the PCI device to dom0 by the iommus property.

In other words, I initially tested with this:

&pcie {
    iommus = <&smmu 0x4d0>;
    iommu-map = <0x0 &smmu 0x4d0 0x10000>;
    iommu-map-mask = <0x0>;
};

But I should be testing with this (i.e. omitting the iommus property):

&pcie {
    iommu-map = <0x0 &smmu 0x4d0 0x10000>;
    iommu-map-mask = <0x0>;
};

Omitting iommus currently breaks using a PCI device in dom0 in v4. I'll fix this in v5.


2. To test the phantom bits, since I don't have a phantom device readily available, I use the pci-phantom arg and a carefully constructed iommu-map property. The PCI device's stream ID is actually 0x4d0, but I put 0x4ce in the iommu-map to make it appear as if it's one of the phantom functions generating the DMA traffic.

pci-phantom=01:00,1

&pcie {
    /* phantom test */
    iommu-map = <0x0 &smmu 0x4ce 0x10000>;
    iommu-map-mask = <0x7>;
};


3. Passthrough to a domU. In this case the vPCI series is needed [3], and an MSI series not yet submitted to the list [4] (or another way to hack/assign the IRQ to the domU), in addition to the 2 config changes [1] [2]. The procedure is described at [5].

[1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/9a08f1f7ce28ec619640ba9ce11018bf443e9a0e
[2] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/27be1729ce8128dbe37275ce7946b2fbd2e5a382
[3] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg00863.html
[4] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commits/poc/pci-passthrough
[5] https://lists.xenproject.org/archives/html/xen-devel/2022-12/msg00682.html

