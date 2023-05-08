Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F2D6FB25B
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 16:13:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531585.827348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw1bh-0004iL-Of; Mon, 08 May 2023 14:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531585.827348; Mon, 08 May 2023 14:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw1bh-0004gd-Kn; Mon, 08 May 2023 14:12:53 +0000
Received: by outflank-mailman (input) for mailman id 531585;
 Mon, 08 May 2023 14:12:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CHwn=A5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pw1bf-0004gX-Q5
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 14:12:51 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 698ea6ab-edaa-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 16:12:50 +0200 (CEST)
Received: from BN8PR04CA0019.namprd04.prod.outlook.com (2603:10b6:408:70::32)
 by DM6PR12MB4090.namprd12.prod.outlook.com (2603:10b6:5:217::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 14:12:44 +0000
Received: from BN8NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::26) by BN8PR04CA0019.outlook.office365.com
 (2603:10b6:408:70::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32 via Frontend
 Transport; Mon, 8 May 2023 14:12:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT087.mail.protection.outlook.com (10.13.177.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.33 via Frontend Transport; Mon, 8 May 2023 14:12:44 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 8 May
 2023 09:12:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 8 May
 2023 07:12:42 -0700
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 8 May 2023 09:12:42 -0500
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
X-Inumbo-ID: 698ea6ab-edaa-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXQyMI35v3ND2QJyPMNGVlEIRsOUo+Io2Rj/9CeUuGSe+0OVfaKmOKnzoRKcYufRRgyGTHralB96HNGX68B06LzTda+N4lh3IVMNosqCafD1ZI6qOGA6i/MgBsROtllKNf7gi2KPf7ENdThnui/l6V3I5hqWx74FbJHRv0xgpSKNopOwkzxk8wUuvoeClJBBptnTFuMgUm/xWwBH4opFjuNNS6cJdeKYhVotDYDn8Fi7dXDE/WRu2eTdRrzpaE1brwRtULEzTXf+wHAi+8YfDAdd0pmCwyfGO3zghPRA8ffEPL7zsi9e8+veLUyeSe02jFLH/Q8LGkBpd4yEyDw85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GeJaDIJJReWZD9EkDq23oZ61Jfq8KZPalADMHBqnzQ4=;
 b=JnunmsxoHvie1DOg1XFccF+Kjz81S3R3CLZejx5z5VmzjKIN7okwyTIVzAHGy0VByGfQapo5cpPoJ3pO1P3mjxrlD9Z59Zf5A1cN6XHUg0QFtKJ0Tnr0Rzq5/iAzPi+lHeUenbSyq/oxegVkLBKZ5Y8JTgd4MHPknNNoCGuV+3/yUTPHd1qxUDhTwxD2WU+9BRquFE1MP1ug46fBrd7rtwr+2nMtNFmAAxoIkFoxcaBg5mpAdpg8Gff/74U7/xtBnfx/Gtl92mHyxdU2UhFaxnKiospUoEjl2NW4iqEQHXrr8xtSvTK/Ng4Sq48v7NixP6OiyQdrYfkuokjV1EmMcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GeJaDIJJReWZD9EkDq23oZ61Jfq8KZPalADMHBqnzQ4=;
 b=y1KpK0j85jCbv77MCwgciHaenNWmaUVPRIHBzMK2NsJapOqmYVcrspMO6xTPEafmeD2YfCsBc0C4vrzdA5gDLL7mnk2KgQQGEmJWTpseVl4eitBgSaPKkpMGxJ7um3L0kowyYNyl62I4M3WGMnIFGu3+hmME7hjH23Jb4Lnt85E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <fffda0cc-0074-69b0-b8c6-cb867ff4c5a5@amd.com>
Date: Mon, 8 May 2023 10:12:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 3/6] iommu/arm: Introduce iommu_add_dt_pci_device API
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Paul Durrant
	<paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20230501200305.168058-1-stewart.hildebrand@amd.com>
 <20230501200305.168058-4-stewart.hildebrand@amd.com>
 <0e7404fe-e249-7b3f-0628-b8b8b1925765@suse.com>
 <6758ef37-bf66-99c3-1fd4-f2edfc12513a@amd.com>
 <39f9548b-6a07-3d74-1975-8f17153f2d14@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <39f9548b-6a07-3d74-1975-8f17153f2d14@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT087:EE_|DM6PR12MB4090:EE_
X-MS-Office365-Filtering-Correlation-Id: 948428bc-5a85-461c-5224-08db4fce4ae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2zcNkg+heGGd2LLiqpDI0siIXoSAMirqCqHYo7ObFYnZ2Lxb65Ec5wXCnDRab6Lu/piTCOa1Sww77QGi3BbU0RpbwPDPrTxKHfFfiegVidnFaraZEy6ntWznQarx5/Yj58WlrRLNpFmNoAbN/utjg3uBwZ39uanVtk1jnb3FwfOQUQdgCkefzp99clLe7BxGrZZpvHHa5OidXlU89kie8eYIcLRRgDwaGwUwPhqLK9xCZYW1xDJCdtZJMsWlvqIWw5WCMU6qS8UXS4RSVouWCOavz2UV5wgvkOPB30kgVwhMf+NMXu9zoSRV35l9saGux9AFonEqLFvxAuQOTthn6niv19+pP365wIzgW1ksC2MjTlKvCP1k9enxi2sjzftkIuxF2UsDFEWM/LaDnS/XtDurIKtSqFCBNyuTgCzlrEVhX/SmrJATSCPd4VGBhKgDDRPJvSdeW52myBHqJxhoC9l32ITTfkGKLkPD4NvKb/yURn+L6q4rmuTtdxvCIV/y90e/SsYs2xqD8fU8rujB5EuhA/rpPoWDHoNq9QgV91dDR6bnfbhQvnfdPKHKpeY2b/a3c493b0aiP8dyiOxga52KCXcFisthMl2LL9rQLg4ZrPtEP6eq+1j/AWfkErhmho0UTU3F7Ol/NLdxR7UBI6EE5c5fV6AMXGmZStcQ6v0yrb5gJYXZYfOYvu6Azqs5b9QbvhxeV6sgJ7UmUSifDAIVvdQVD9hUM9cTC0RuH4rctfpiXlLWpmrUeDFcbaPx+n3XjnhsEGEMjUzwAN/VqQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199021)(40470700004)(36840700001)(46966006)(53546011)(26005)(83380400001)(336012)(40480700001)(426003)(36860700001)(36756003)(2616005)(81166007)(356005)(86362001)(31696002)(82310400005)(82740400003)(186003)(40460700003)(47076005)(41300700001)(16576012)(2906002)(54906003)(31686004)(5660300002)(6916009)(4326008)(316002)(8936002)(8676002)(478600001)(44832011)(70586007)(70206006)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 14:12:44.1406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 948428bc-5a85-461c-5224-08db4fce4ae9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4090

On 5/5/23 02:20, Jan Beulich wrote:
> On 04.05.2023 23:54, Stewart Hildebrand wrote:
>> On 5/2/23 03:44, Jan Beulich wrote:
>>> On 01.05.2023 22:03, Stewart Hildebrand wrote:
>>>> @@ -228,6 +229,9 @@ int iommu_release_dt_devices(struct domain *d);
>>>>   *      (IOMMU is not enabled/present or device is not connected to it).
>>>>   */
>>>>  int iommu_add_dt_device(struct dt_device_node *np);
>>>> +#ifdef CONFIG_HAS_PCI
>>>> +int iommu_add_dt_pci_device(uint8_t devfn, struct pci_dev *pdev);
>>>> +#endif
>>>
>>> Why the first parameter? Doesn't the 2nd one describe the device in full?
>>
>> It's related to phantom device/function handling, although this series unfortunately does not properly handle phantom devices.
>>
>>> If this is about phantom devices, then I'd expect the function to take
>>> care of those (like iommu_add_device() does), rather than its caller.
>>
>> In the next patch ("[PATCH v1 4/6] pci/arm: Use iommu_add_dt_pci_device() instead of arch hook"), we will invoke iommu_add_dt_pci_device(devfn, pdev) from iommu_add_device().
> 
> Which I think I said there already I consider wrong.

Okay, I'm following now. Right, so, the first parameter is not needed.

>> Since iommu_add_device() iterates over the phantom functions, it would be redundant to also have such a loop inside of iommu_add_dt_pci_device().
>>
>> If we are to properly handle phantom devices on ARM, the SMMU drivers (smmu.c/smmu-v3.c) would need some more work. In patches 5/6 and 6/6 in this series, we have:
>>
>> if ( devfn != pdev->devfn )
>>     return -EOPNOTSUPP;
>>
>> Also, the ARM SMMU drivers in Xen currently only support a single AXI stream ID per device, so some development would need to occur in order to support phantom devices.

I spoke too soon, the SMMU drivers do appear to support multiple IDs.

>>
>> Should phantom device support be part of this series, or would it be acceptable to introduce phantom device support on ARM as part of a future series?
> 
> I wouldn't view this as a strict requirement, so long as it is made clear in
> respective patch descriptions.

After doing a little more investigation, I should be able to add in the plumbing to iterate over the phantom functions in iommu_add_dt_pci_device(). Stay tuned for v2 of this series.

>> Lastly, I'd like to check my understanding since phantom devices are new to me. Here's my understanding:
>>
>> A phantom device is a device that advertises itself as single function, but actually has multiple phantom functions. These phantom functions will have unique requestor IDs (RID). The RID is essentially the BDF. To use a phantom device with Xen, we specify the pci-phantom command line option, and we identify phantom devices/functions in code by devfn != pdev->devfn.
> 
> The command line option is there only to work around errata, i.e. devices
> behaving as if they had phantom functions without advertising themselves
> as such. See our use of PCI_EXP_DEVCAP_PHANTOM. As you can see, this being
> PCIe only, and legacy PCI device bevaing this way would require use of the
> command line option.
> 
>> On ARM, we need to map/translate a BDF to an AXI stream ID in order for the SMMU to identify the device and apply translation. That BDF -> stream ID mapping is defined by the iommu-map/iommu-map-mask property in the device tree [1]. The BDF -> AXI stream ID mapping in DT could allow phantom devices (i.e. devices with phantom functions) to use different stream IDs based on the (phantom) function.
>>
>> So, in theory, on ARM, there is a possibility we may have a device that advertises itself as single function, but will issue AXI transactions with multiple different AXI stream IDs due to phantom functions. In this case, we will want each AXI stream ID to be programmed into the SMMU to avoid SMMU faults.
> 
> Right, which of course first requires that you know the mapping between
> these IDs.

Thanks for clarifying!

Stewart

