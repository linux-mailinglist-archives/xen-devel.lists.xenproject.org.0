Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB24722DE3
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 19:50:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543841.849154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6ELf-0001Jb-RU; Mon, 05 Jun 2023 17:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543841.849154; Mon, 05 Jun 2023 17:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6ELf-0001Go-Oa; Mon, 05 Jun 2023 17:50:31 +0000
Received: by outflank-mailman (input) for mailman id 543841;
 Mon, 05 Jun 2023 17:50:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8u0v=BZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1q6ELe-0001Gi-1W
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 17:50:30 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20630.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73decb13-03c9-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 19:50:27 +0200 (CEST)
Received: from MW4PR03CA0254.namprd03.prod.outlook.com (2603:10b6:303:b4::19)
 by DS0PR12MB8366.namprd12.prod.outlook.com (2603:10b6:8:f9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 17:50:23 +0000
Received: from CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::ab) by MW4PR03CA0254.outlook.office365.com
 (2603:10b6:303:b4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Mon, 5 Jun 2023 17:50:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT065.mail.protection.outlook.com (10.13.174.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.33 via Frontend Transport; Mon, 5 Jun 2023 17:50:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Jun
 2023 12:50:21 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 5 Jun 2023 12:50:20 -0500
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
X-Inumbo-ID: 73decb13-03c9-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgasPQ1EvOwxTCa2B9lzcZxnsF5OA7wZrV2/3F4oP1Nh6foZyw4qvWTvVG9eW3OqEaOdPFr2twq0jC5vpx0HckMS1f8U+FYxF6AyyI8kOeC2SZ51DlyJdQ6GT5U4xxjE+HjNq8UXgzh85AkO1o0+ANlgApgR9X2Z5EqqOEyntjse+IivV/zUOmZcdBaOyf5AhArb/a6C/AimM95xnARQxhYps3+BvHBM51xYDEM76bj4T2Rw84kdsQt65Nj/oKMeVbH+BNHyXW5VoEMbaxsRvFMIweQfiVFs3hbay8uYjo8YsFE3/u1AQzt1fnzCzdJ9M4+iT1tb6eqHv04I5ffzGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAbcGzmtVBTCC2KkGolv8uxFTfs2q7whkhgxrrlLj0U=;
 b=C9LjFx+tlpw2WAJ1UhVcS8vbcpWh/0h8UQry3DORXwv1T6SzWHIHQ0AAFNY9gfMkaE5/xIDXVMUDVuaVNvw7OtRaLjtWkvrDGHPS5+ifp0H/XlhvpLmFO9o6yN6GHBu42bBK5FwlVuYmMQuOH/Typ+syqu6TnSXWoFVrqTRKdRWyzFOiSf9HIxzv3jx9EI7mXcECJICFu7nx1tYeCVt0MYe0EtPNKDRoJnTl0m0ffXbLpJv46eY0F8xVQE+keIZy1aIxF2aO/aWlfxdcXHkMCEah8YSaCpRCOyG3i8dYdLzwwdJwocYwDTL1VQgeEqtZvk6AFUbxLwk/HeQs9YuODA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAbcGzmtVBTCC2KkGolv8uxFTfs2q7whkhgxrrlLj0U=;
 b=peZV35k9yhC1LwUdYkb1YgMjC/kgzvdf2kVSqoADEZm1CzrX77w5KWgoSKGY/3w3pksh/LTICj0lWkpyHZU5RAZywslRqBfukHwR5xVYshuPCu7BrQQRSp9XAdlr9eQhIK29ycYWV3NgcyV0M0AIgjdiLB0mFVzcmXOk7p/g1kc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9548b7c7-478f-186d-a2f9-584d432dad1b@amd.com>
Date: Mon, 5 Jun 2023 13:50:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/6] iommu/arm: Add iommu_dt_xlate()
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Rahul Singh
	<rahul.singh@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230518210658.66156-1-stewart.hildebrand@amd.com>
 <20230518210658.66156-3-stewart.hildebrand@amd.com>
 <c6dd2581-7dd9-a0da-8b27-3523744349c0@amd.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <c6dd2581-7dd9-a0da-8b27-3523744349c0@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT065:EE_|DS0PR12MB8366:EE_
X-MS-Office365-Filtering-Correlation-Id: f9f5f40a-1f7c-4233-5316-08db65ed55a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DIpyRd8MgWFPsKwfikty/EbpugkL4X6jFqUQmujEzUXKMY95Ok1BKj6n813YaKzBotN4Dt3z3F819ig9tavvxe0OQpjqqxljaDWag3LZV+2dVQHdtW4hJprpT02X5KRVD27jQXv50MCgV6iQ53PCxsiI4y9Ke34QKOENSgB0sRdqW3modM8MQYNj9ccnRWb4mXgfGHC98eto1exvLYmrNP6iQ97Nu807FalqzyYnENzccRV7Gv0Si7f8oFlKtdINPAmzPnulzO3oyg2F83afXT5vN4ZbzR10Ntj9yPFXpl5fMSCui0Q0AZQVw/Xyvqajx4Ow6XxvVyawW2HRU+8HdKX+Y+XYrJTCGnTvefVOccKv44CLTZkE7B111wCoYd3Ck9xkvve3LiGfK9TTiavbiGNJRxh9DniJehk0SW9DDraa+mSMbIDsWMnKWy/LuLS86fMIlVejMbvrj31AkMMBZwqLkwxwGewqQPIoxNSi3OLZtN3w8FUoNwS1KJyppTNFXRiZTHZysuWDD3ixEZHTQihDJX65IZb6rqRMJQoNtM1s7t0yNAuYUfMnjxPPSPqgPvRtCfC+7CE9N/Ql7uR2g71WWPKBQy7PeZfLDZfRMzXfiM1rwKhXfRC32bQzzUo588LMIWahD3oYcR1kroSgj8uK13MVENlpQBlikF5DxCXAMXOqG9jul3y3MfX8RTI8TalXFlzT+88RlY7wr55jwx6eqjdz7BH0jOAHFKGYRZmRvdy4/BaNixGYJ5kjkObhfQKD3dQctTQNz+LODgx5IRl8Fyii3Vt3cH/do5/loFk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199021)(36840700001)(46966006)(40470700004)(47076005)(83380400001)(966005)(336012)(426003)(44832011)(110136005)(54906003)(82740400003)(40480700001)(40460700003)(478600001)(8676002)(8936002)(41300700001)(316002)(70586007)(70206006)(356005)(81166007)(31696002)(5660300002)(4326008)(86362001)(16576012)(36756003)(2906002)(36860700001)(82310400005)(26005)(186003)(31686004)(53546011)(2616005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 17:50:22.0465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f5f40a-1f7c-4233-5316-08db65ed55a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8366

On 5/22/23 10:48, Michal Orzel wrote:
> Hi Stewart,
> 
> On 18/05/2023 23:06, Stewart Hildebrand wrote:
>>
>>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Move code for processing DT IOMMU specifier to a separate helper.
>> This helper will be re-used for adding PCI devices by the subsequent
>> patches as we will need exact the same actions for processing
>> DT PCI-IOMMU specifier.
>>
>> While at it introduce NO_IOMMU to avoid magic "1".
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com> # rename
>> ---
>> v2->v3:
>> * no change
>>
>> v1->v2:
>> * no change
>>
>> downstream->v1:
>> * trivial rebase
>> * s/dt_iommu_xlate/iommu_dt_xlate/
>>
>> (cherry picked from commit c26bab0415ca303df86aba1d06ef8edc713734d3 from
>>  the downstream branch poc/pci-passthrough from
>>  https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
>> ---
>>  xen/drivers/passthrough/device_tree.c | 42 +++++++++++++++++----------
>>  1 file changed, 27 insertions(+), 15 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
>> index b5bd13393b56..1b50f4670944 100644
>> --- a/xen/drivers/passthrough/device_tree.c
>> +++ b/xen/drivers/passthrough/device_tree.c
>> @@ -127,15 +127,39 @@ int iommu_release_dt_devices(struct domain *d)
>>      return 0;
>>  }
>>
>> +/* This correlation must not be altered */
>> +#define NO_IOMMU    1
>> +
>> +static int iommu_dt_xlate(struct device *dev,
>> +                          struct dt_phandle_args *iommu_spec)
> I think iommu_spec can be const.

Yes, good catch

>> +{
>> +    const struct iommu_ops *ops = iommu_get_ops();
>> +    int rc;
>> +
>> +    if ( !dt_device_is_available(iommu_spec->np) )
>> +        return NO_IOMMU;
>> +
>> +    rc = iommu_fwspec_init(dev, &iommu_spec->np->dev);
>> +    if ( rc )
>> +        return rc;
>> +
>> +    /*
>> +     * Provide DT IOMMU specifier which describes the IOMMU master
>> +     * interfaces of that device (device IDs, etc) to the driver.
>> +     * The driver is responsible to decide how to interpret them.
>> +     */
>> +    return ops->dt_xlate(dev, iommu_spec);
> Wouldn't it be better to move the check (!ops->dt_xlate) from iommu_add_dt_device to this helper?
> After all it is the only function that calls dt_xlate so for me it would be a natural placement.
> Looking at the next patch it will also reduce the similar check in iommu_add_dt_pci_sideband_ids.

Yes, I will move it

