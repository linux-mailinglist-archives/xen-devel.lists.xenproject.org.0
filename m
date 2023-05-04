Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EED6F785E
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 23:55:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530190.825627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pugui-0007gP-Ak; Thu, 04 May 2023 21:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530190.825627; Thu, 04 May 2023 21:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pugui-0007dW-6B; Thu, 04 May 2023 21:55:00 +0000
Received: by outflank-mailman (input) for mailman id 530190;
 Thu, 04 May 2023 21:54:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vymz=AZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pugug-0007dQ-3M
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 21:54:58 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dd9c6aa-eac6-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 23:54:55 +0200 (CEST)
Received: from BN9PR03CA0441.namprd03.prod.outlook.com (2603:10b6:408:113::26)
 by DM4PR12MB5793.namprd12.prod.outlook.com (2603:10b6:8:60::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 21:54:52 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::aa) by BN9PR03CA0441.outlook.office365.com
 (2603:10b6:408:113::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26 via Frontend
 Transport; Thu, 4 May 2023 21:54:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.27 via Frontend Transport; Thu, 4 May 2023 21:54:52 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 4 May
 2023 16:54:51 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 4 May 2023 16:54:50 -0500
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
X-Inumbo-ID: 4dd9c6aa-eac6-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UI0rQ8W6fS9kZrnPWwZj57AG5PZnZD7JKDGWqEfTKxg2aI1i7ti+hVHccCnfqNxE9/KSDrwfcUr1oH8JXHUWRetuCxEssnvvVW1YQp6wG928ukXImat1WwxUma7qque+AI4v/qcOo0ZmZ06rH1+9KxZbgC6j4vDhL5memZLXfvWMQGIHHn01PsOsXmoGNz3e0GU3e6lIw1IhGvDFRPlC9e46TN54fESZUnzRMNLThudBpgbNfyjWZKVa9adPgNXdmR3phrxWU2yViIOcjlb5mZC6PQPBowbgFlwCMqYRIHQFbLbJlYCEzyXAzzLCOZs/9Pvheim9Xb/AitECu9FEZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xP4MQBh+A/JD/hKH7vXg1eF4/RVQQqOEgguvhZSqKE=;
 b=KSoCxzjhRRhYSLlJjLaimG7iTv+MLEzbhqTh4o6wu6u+gDLw3WSkccBK2Q2vUABsc1W9vy+QKIQ2O5PhH2Q2JJMuaLXZf7cqQtsS8LT5JhA9lV3Nu9zfWCWL9mWMYBuNQ5Dw6eQvYVZExQGKholy4oJFuuom+7qUWPCFzi+KCmJYnRRnYXuFdjMkXqUE2zZ3lVfhVKORyNbjcIKKQf08uqB6tq8URJMhkAeeuofOmlyUaPhry51VpZv4NwTV4HONcbi7V5Z2ci7SgW56Wm4EvFHwSNYLXt1a315UGAYdZAQptcL0UlywhUKZ0DSW7emjWit5jBYcJKzQrVr6NsaErQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xP4MQBh+A/JD/hKH7vXg1eF4/RVQQqOEgguvhZSqKE=;
 b=T2xg7h7s9Z8zssu5RDtw6pCYxUhsJq5hCa0RGbb3VHnEWmgEon+QfsgC3smuFWozsm0Y1XyhiLpWv85rUpyKcfbTlB04ncF85hQ7fkR1uz72WswSHEsx/kE+zElBKcMeuDFbmOb2labaR9icFJprxCC3IgliXLo1zSxggbFovnw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6758ef37-bf66-99c3-1fd4-f2edfc12513a@amd.com>
Date: Thu, 4 May 2023 17:54:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 3/6] iommu/arm: Introduce iommu_add_dt_pci_device API
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Paul Durrant
	<paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20230501200305.168058-1-stewart.hildebrand@amd.com>
 <20230501200305.168058-4-stewart.hildebrand@amd.com>
 <0e7404fe-e249-7b3f-0628-b8b8b1925765@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <0e7404fe-e249-7b3f-0628-b8b8b1925765@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT055:EE_|DM4PR12MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: cb11320b-1065-42ef-ed84-08db4cea308d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9JKO9b0GWg3yaN6BepGwU2af10lkd/Ise3Rwvw5IQ4eLfTfYtQxf1T3mzqTuAs7aKC4mCHREg549Ox+5CTmT3szg4t9J6ULSUQElBKBq8cev+DquwTlfvgQQy8o2hBm3PXzO8qcYjPrYlVz/6imNeLb+wmykjEG9uMIm8sfSFJt2bhfajB5wtivBxDv7gE92jCeAU+wsn3vCnOKxB5yGZpGDllXK/uoMmooNDXR6asccGfnCIPfJJxS6HuTDtk4hzcMct4kOxgWK+KAoLEjxII0SxM3968LLUeOO45cjVmjCnfwpgnmcfr48MTjsZVLW28w6RFheCW3R8U0R4L1+1yoLqOZj2sS6kcNlosQg9ngAPj9mCnY/Qk3mGY5U68Y67bpDKepNpJwib1baDza1jmCyGddBu16uVEwb54ixHG0EVc5UM9tt4ruYOYFfbKhx7rpJbZffyICFzGAImxVT8QAh9BtNizY/SZk2ofje3B4X2EQkSvnGQbUqG5tUfRnlAB2PcF7E6Xa5OD4HaCFbtcvuOGKo6O4MgiEl6wxba/ezsJqbVrJGyZyZIsmBytO5TeRG5xqHCEUoow5Q39pNe/tjH9TnJMzS8ASYCsy0YyFOnX2Vx+V7Ya3xF8EqzxRJdW+JPZfMiWr8/LK3HkE2pKKcc9c0n0XopKgQGDBqsOkqA3Pn0mRhLkv6X+ZmMvSNHriQb1pNOuAn3PKFVMFbGJgzxljcUQdItqh98uapiF7nkZ62+fj+30dG65EbkYLw
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199021)(46966006)(36840700001)(40470700004)(40480700001)(26005)(53546011)(44832011)(40460700003)(186003)(16576012)(82310400005)(478600001)(41300700001)(54906003)(966005)(6666004)(36756003)(81166007)(356005)(5660300002)(8936002)(8676002)(2616005)(70206006)(36860700001)(316002)(4326008)(6916009)(70586007)(2906002)(336012)(31686004)(83380400001)(86362001)(426003)(31696002)(47076005)(82740400003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 21:54:52.3254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb11320b-1065-42ef-ed84-08db4cea308d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5793

On 5/2/23 03:44, Jan Beulich wrote:
> On 01.05.2023 22:03, Stewart Hildebrand wrote:
>> @@ -228,6 +229,9 @@ int iommu_release_dt_devices(struct domain *d);
>>   *      (IOMMU is not enabled/present or device is not connected to it).
>>   */
>>  int iommu_add_dt_device(struct dt_device_node *np);
>> +#ifdef CONFIG_HAS_PCI
>> +int iommu_add_dt_pci_device(uint8_t devfn, struct pci_dev *pdev);
>> +#endif
> 
> Why the first parameter? Doesn't the 2nd one describe the device in full?

It's related to phantom device/function handling, although this series unfortunately does not properly handle phantom devices.

> If this is about phantom devices, then I'd expect the function to take
> care of those (like iommu_add_device() does), rather than its caller.

In the next patch ("[PATCH v1 4/6] pci/arm: Use iommu_add_dt_pci_device() instead of arch hook"), we will invoke iommu_add_dt_pci_device(devfn, pdev) from iommu_add_device(). Since iommu_add_device() iterates over the phantom functions, it would be redundant to also have such a loop inside of iommu_add_dt_pci_device().

If we are to properly handle phantom devices on ARM, the SMMU drivers (smmu.c/smmu-v3.c) would need some more work. In patches 5/6 and 6/6 in this series, we have:

if ( devfn != pdev->devfn )
    return -EOPNOTSUPP;

Also, the ARM SMMU drivers in Xen currently only support a single AXI stream ID per device, so some development would need to occur in order to support phantom devices.

Should phantom device support be part of this series, or would it be acceptable to introduce phantom device support on ARM as part of a future series?


Lastly, I'd like to check my understanding since phantom devices are new to me. Here's my understanding:

A phantom device is a device that advertises itself as single function, but actually has multiple phantom functions. These phantom functions will have unique requestor IDs (RID). The RID is essentially the BDF. To use a phantom device with Xen, we specify the pci-phantom command line option, and we identify phantom devices/functions in code by devfn != pdev->devfn.

On ARM, we need to map/translate a BDF to an AXI stream ID in order for the SMMU to identify the device and apply translation. That BDF -> stream ID mapping is defined by the iommu-map/iommu-map-mask property in the device tree [1]. The BDF -> AXI stream ID mapping in DT could allow phantom devices (i.e. devices with phantom functions) to use different stream IDs based on the (phantom) function.

So, in theory, on ARM, there is a possibility we may have a device that advertises itself as single function, but will issue AXI transactions with multiple different AXI stream IDs due to phantom functions. In this case, we will want each AXI stream ID to be programmed into the SMMU to avoid SMMU faults.

Please correct me if I've misunderstood anything.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt

