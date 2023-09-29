Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC797B37FE
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 18:32:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610625.950072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmGPD-0001in-Sd; Fri, 29 Sep 2023 16:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610625.950072; Fri, 29 Sep 2023 16:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmGPD-0001gZ-Pp; Fri, 29 Sep 2023 16:31:55 +0000
Received: by outflank-mailman (input) for mailman id 610625;
 Fri, 29 Sep 2023 16:31:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w1P3=FN=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qmGPC-0001gT-Jf
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 16:31:54 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20628.outbound.protection.outlook.com
 [2a01:111:f400:7eab::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b16a2247-5ee5-11ee-878c-cb3800f73035;
 Fri, 29 Sep 2023 18:31:52 +0200 (CEST)
Received: from CH0PR13CA0043.namprd13.prod.outlook.com (2603:10b6:610:b2::18)
 by IA0PR12MB7555.namprd12.prod.outlook.com (2603:10b6:208:43d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 16:31:48 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::bb) by CH0PR13CA0043.outlook.office365.com
 (2603:10b6:610:b2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.15 via Frontend
 Transport; Fri, 29 Sep 2023 16:31:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Fri, 29 Sep 2023 16:31:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 29 Sep
 2023 11:31:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 29 Sep
 2023 11:31:43 -0500
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 29 Sep 2023 11:31:42 -0500
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
X-Inumbo-ID: b16a2247-5ee5-11ee-878c-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Su+F8ZccrkeCm6fZZH5Np9zXRw57nVgjisonX2tX7HNrkShCfciI3+OsVlpWwrbr5srKPJ0+1+XpGLFZMBMaN7qL9JlyPFBB8R3nxKcdzbtR2l98u/a2Gjy+0jEuEd3lMATdYXFHMecwetb40ZT2Jgo+LqPEm7jXIbXvoJrWhJawigiKBZuyzoLO0JdFndq4qQIPJH51NPqlKAOKO2+DD4Yn6HspVdZjiV5y0ePpjzmmy1Rk5xINwYLi6bcoTAn4TsRwki98svYM2begZe6TciqrU5iM2XRUy/5QPQ+fY20SI++f2IB1D2Mte2pDWYH4gLR95E1sootsFfKGGfXKhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0c1jMchONhmdqpDYGTTgvy9A6jxz/UVnQE7QmhbfraU=;
 b=gp4imKRY9y3/qMdOrT5PlkSaxgwxQE+ueoSAt5uC/A0B8b0FnO4vYC680b4QUHtCeFYUfMzDNxzL9cqR4nOc6XJZFz35SW8pUJS6PVELH4Pumc2SlCWc7StGmlt0TqmrwmRrn7QHTNlG+AaMzKgA6L98sL3u4+tTSVxcJ5OgqOizAlHrH8LvBs3X+OcM6vX33l8nImZpPAX4dp1eIpP9/cxOIiVcy1GvSJS8+PSd/tUpRr2SzJeCvwQQcKJHPLsw/yggZu06bUyVTbwCSWjYZ4lmeW5nWX4eCtvn6DOr85nbMykBw/8Xwv7nsVt1L2qxU69H3FseC1efMbcObgE3bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0c1jMchONhmdqpDYGTTgvy9A6jxz/UVnQE7QmhbfraU=;
 b=HUoKLfP2sq4Uwo9T8hQBHgc0+Ej2d4yl8remLcyox1ONzz07AC/860blWxM0F8uhazwNDQj7VZM6MZ5JJKFgzPtH8BmLL27kWfVm43nypTS3nUJ4NDOgMqY8FzMfeWkHhPlALS1HPOjdRkZxdprcRdylONZZEido/3VVCQF0O8k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <af5e49e2-7c37-8539-716e-928ae9ccd2f5@amd.com>
Date: Fri, 29 Sep 2023 12:31:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 3/7] iommu/arm: Add iommu_dt_xlate()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
 <20230607030220.22698-4-stewart.hildebrand@amd.com>
 <eaec93ad-bd6d-aef6-fa46-d1830f2b65ff@xen.org>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <eaec93ad-bd6d-aef6-fa46-d1830f2b65ff@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|IA0PR12MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d16a29b-eaf9-4720-2f3a-08dbc10991cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g+EKWCDz+9kMm/q9TBooYL0a7uaz3QcYQWDGhuoFhsM45gWAuaqxDWkvYayES1bZRlEk5nB0DzSMYcTkwNCZC06y/ayUzf/YOnGooqqfbHz5zI0xzjGSzuG071xoS8VSYRCraBIOS4bYJZfgXq6X4LEjr+D+TQM/DKXvuQSqYZ8mc+U+qI01jHE/yHJ9rQFIOljJhIIL59KiWYjanXkpTYqI2S18lx3Vb+Sw116Ox25iVt0y81ulW25uuCw3OrljTqRYUJPY3NgD5yEUJTU9+kmKGnf9U2W1eFl0GHSIO2lnlEHUSlRVKxqHlkCV9zShh6S5a8wFsTKVMnSe3FtbCYEXepEgC+1Wtup10JR0Iw0Hgn2jLXiilU10Y6Cn9GgEBgJ2fhX0KOxUhQzM+tJRi3fAInFaqJv6svEGpzIjXGtdsF/jZoZ1GgKT8mtRcjMgdLKa2WuNaSE3EnMpo6HHt7AqkW77vmWcPH9SHJ3reiyfYvFYuytRWziHPbkbaY9fQl7ECGwj/xTfX0e9KjL1eduIbaXfeZWRnbCW9/674LQIZpKKyd0iCajV7n6STzxiPNZD47ZGVRZDPTX8KRpB/ECczRRrxsiK28x+VDQ6bufIF6mey+gNgVr8hdug1tyA1cIYiJcXvT35s3Q6NK1Eh2ejdP3SuGN0AjuMzqYPDEgQl8syzOU+/zsuOMNVg3+4wefY0+a6yes98lc2MrP0lwRwD0Nbw9PgebsAmA1TpC+BmTCz3jhqS+pfDMlwrWw4Y/jbVE5M8vgBmudvWZJ1toz17nni3u/8twhWxuDkYG0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(186009)(64100799003)(1800799009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(2906002)(44832011)(5660300002)(31686004)(4326008)(8936002)(8676002)(26005)(40480700001)(2616005)(36756003)(41300700001)(316002)(16576012)(54906003)(40460700003)(110136005)(356005)(83380400001)(70586007)(70206006)(478600001)(966005)(336012)(426003)(47076005)(53546011)(36860700001)(81166007)(82740400003)(31696002)(86362001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 16:31:44.7285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d16a29b-eaf9-4720-2f3a-08dbc10991cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7555

On 6/29/23 18:29, Julien Grall wrote:
> Hi Stewart,
> 
> On 07/06/2023 04:02, Stewart Hildebrand wrote:
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
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> v3->v4:
>> * make dt_phandle_args *iommu_spec const
>> * move !ops->add_device check to helper
>>
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
>>   the downstream branch poc/pci-passthrough from
>>   https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
>> ---
>>   xen/drivers/passthrough/device_tree.c | 47 ++++++++++++++++++---------
>>   1 file changed, 31 insertions(+), 16 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
>> index c60e78eaf556..ff9e66ebf92a 100644
>> --- a/xen/drivers/passthrough/device_tree.c
>> +++ b/xen/drivers/passthrough/device_tree.c
>> @@ -127,15 +127,42 @@ int iommu_release_dt_devices(struct domain *d)
>>       return 0;
>>   }
>>
>> +/* This correlation must not be altered */
> 
> Please expand why.

I don't have any insight regarding the rationale for why the comment was added. I don't believe the comment is adding any value, so I'll remove it.

>> +#define NO_IOMMU    1
> 
> Given that the value is returned, should not this be moved to an header
> and used by the callers?

Moving it to a header: yes. I'll move it to xen/include/xen/iommu.h, as that is where the iommu_add_dt_device() prototype also lives.

Used by callers: the callers currently are checking for error by comparing ( rc < 0 ). I think that's okay to leave as is since the comment in iommu.h by the prototype describe the possible return value for iommu_add_dt_device() as:
 * Return values:
 *  0 : device is protected by an IOMMU
 * <0 : device is not protected by an IOMMU, but must be (error condition)
 * >0 : device doesn't need to be protected by an IOMMU
 *      (IOMMU is not enabled/present or device is not connected to it).

>> +
>> +static int iommu_dt_xlate(struct device *dev,
>> +                          const struct dt_phandle_args *iommu_spec)
>> +{
>> +    const struct iommu_ops *ops = iommu_get_ops();
>> +    int rc;
>> +
>> +    if ( !ops->dt_xlate )
>> +        return -EINVAL;
>> +
>> +    if ( !dt_device_is_available(iommu_spec->np) )
>> +        return NO_IOMMU;
>> +
>> +    rc = iommu_fwspec_init(dev, &iommu_spec->np->dev);
>> +    if ( rc )
>> +        return rc;
>> +
>> +    /*
>> +     * Provide DT IOMMU specifier which describes the IOMMU master
>> +     * interfaces of that device (device IDs, etc) to the driver.
>> +     * The driver is responsible to decide how to interpret them.
>> +     */
>> +    return ops->dt_xlate(dev, iommu_spec);
>> +}
>> +
>>   int iommu_add_dt_device(struct dt_device_node *np)
>>   {
>>       const struct iommu_ops *ops = iommu_get_ops();
>>       struct dt_phandle_args iommu_spec;
>>       struct device *dev = dt_to_dev(np);
>> -    int rc = 1, index = 0;
>> +    int rc = NO_IOMMU, index = 0;
>>
>>       if ( !iommu_enabled )
>> -        return 1;
>> +        return NO_IOMMU;
>>
>>       if ( !ops )
>>           return -EINVAL;
>> @@ -163,22 +190,10 @@ int iommu_add_dt_device(struct dt_device_node *np)
>>            * The driver which supports generic IOMMU DT bindings must have
>>            * these callback implemented.
> 
> The 's' was missing to callback. But now, I think you want to replace
> 'these' with 'this' as you move the second check.

I will fix it

>>            */
>> -        if ( !ops->add_device || !ops->dt_xlate )
>> +        if ( !ops->add_device )
>>               return -EINVAL;
>>
>> -        if ( !dt_device_is_available(iommu_spec.np) )
>> -            break;
>> -
>> -        rc = iommu_fwspec_init(dev, &iommu_spec.np->dev);
>> -        if ( rc )
>> -            break;
>> -
>> -        /*
>> -         * Provide DT IOMMU specifier which describes the IOMMU master
>> -         * interfaces of that device (device IDs, etc) to the driver.
>> -         * The driver is responsible to decide how to interpret them.
>> -         */
>> -        rc = ops->dt_xlate(dev, &iommu_spec);
>> +        rc = iommu_dt_xlate(dev, &iommu_spec);
>>           if ( rc )
>>               break;
>>
> 
> Cheers,
> 
> -- 
> Julien Grall

