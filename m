Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 275FD7BEA5D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 21:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614432.955489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpveo-00032B-S5; Mon, 09 Oct 2023 19:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614432.955489; Mon, 09 Oct 2023 19:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpveo-0002zb-Oq; Mon, 09 Oct 2023 19:11:10 +0000
Received: by outflank-mailman (input) for mailman id 614432;
 Mon, 09 Oct 2023 19:11:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjZ2=FX=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qpven-0002zV-9W
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 19:11:09 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20629.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9667b4fc-66d7-11ee-9b0d-b553b5be7939;
 Mon, 09 Oct 2023 21:11:03 +0200 (CEST)
Received: from CH0PR03CA0441.namprd03.prod.outlook.com (2603:10b6:610:10e::34)
 by MN6PR12MB8489.namprd12.prod.outlook.com (2603:10b6:208:474::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.41; Mon, 9 Oct
 2023 19:10:58 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::bd) by CH0PR03CA0441.outlook.office365.com
 (2603:10b6:610:10e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29 via Frontend
 Transport; Mon, 9 Oct 2023 19:10:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 9 Oct 2023 19:10:57 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 14:10:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 14:10:56 -0500
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 9 Oct 2023 14:10:55 -0500
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
X-Inumbo-ID: 9667b4fc-66d7-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGphredbcp03qISj2Vyl5t4UVlij/3g4tGMmg11yeHkh4iAJulzrLjubH4beSvlVTcWZW4zlgAu0vCcABc2SQam/CwWXdk0oHqAyN/SCbTizY8aew2l7jy+gJ8tTwo+FiaklmRPX+/yOsjatz5QhMZ8aRjUpH5u07B9mS9SUlYscUHI7j2T5QHB5uttsMxJyD0QWJGRELSCXEvluCTiN0o61KFP6+o9P3UKaHCzAT8zn2G9wKBiyQNCcW0PUqxPSsA5AmhgtR/P8STOWefCORfemWUtqN2cXJZVjOsm8g1dHLxaMZdRS+vSqQsqSeTwmUedf4Cfcbew2Ne6TDn6vGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGvupoSa9xWkw736Jziut1T+NiF+SMfbhTpjHqbLNCg=;
 b=bUeu7EE9o+8uj9nXk/riQGXJyZ0/eoOkc6vqwceRSQOJGmeeQ9fgz5fnF9QzwOr+YkpgrNrlKXOJqwqKvYnhXbLwkSt/6ndFvvBHTC8i7udsb4F9oq7t8n0BHPLDPqDudxB5PK3L8TaZaopzVszack3D37K/8mumEK+CUkT/hjKaPGzU3wCN/cXApGmhOXDH5or5bJElHRl+yZpjtR+dLYIlOSWd2q1n/NtLyOUqwTC6QmsognOrnci2OinZ8zLhJ9gduyu9Dzae5H+6Z1RhrrMeYj3F60Sf4ufh9gjQWjTkaviDNC999Ran+m6WLXL7QGKuMBOMterWoy5WY1Rf1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGvupoSa9xWkw736Jziut1T+NiF+SMfbhTpjHqbLNCg=;
 b=L8xxTF0s1ICM8NeUTlbWX9l8U0ojpYPSe3Z+6nJUbaRW8YQ91211OAxSXP4hWuwR4oYxQWpK/H1Z3nMtRG7DVsN2e09cZc+0KodUQDQcnwaTA+d3OBhpTaafBKtiPYDhrO3M7UFHSoaH+jp08u2ZX9WCzmxTmlYIz+7DWJivqN0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f92f9302-64a7-44db-8cba-dc98670de417@amd.com>
Date: Mon, 9 Oct 2023 15:11:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v2 2/3] xen/arm: make has_vpci depend on CONFIG_HAS_VPCI
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Artem Mygaiev <artem_mygaiev@epam.com>,
	Rahul Singh <rahul.singh@arm.com>
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-3-stewart.hildebrand@amd.com>
 <d7964e48-4461-2126-5570-3425cbe5ce24@xen.org>
Content-Language: en-US
In-Reply-To: <d7964e48-4461-2126-5570-3425cbe5ce24@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|MN6PR12MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: a0161676-35a0-4108-c23e-08dbc8fb77f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jBKVb3fKUNsvwbcneyZ2UsoUsphUjM+pxJq/uNCXHUXaSiayE5ftAOKDchVyur6yG5YN/cABuV1cbBcjxVWFv81lscdSB4Ix1a8bqAmG5VmSCAhqIs5fA5U8t8Cnv5PEZq/a9JNHQDcqOE9OliKhNQp1PnxckkyR/e7T+OcghTKRTjpSf+15KFPhRzws861HEP0Xok6CoOb4J01IKTmtPrPL5UjCqK+1/gChvVkZnsE/AZkum+LFvuQYu5XOVYvkzs94qRZg2sXKozO72m9UeiS/XzROYFk2uw8/XA0a+nzwgm/2o6zhi6/Vgp9hVn7uKVZFSyQVaYsm5JPejCFgKUQuXu3GVyAe2IBwVeL83nhDAS9MZRGTNeQkKVDiAuUPnVN0QbdDlOY0ou7rSYuewPBQuxHQ4o2Kaeo0vLOqqEbtnUg2s9AmGADP6AL972aajGms4GIUni3YBFeO0MmCzmGxZmmzRT0shfwUJCKhbu31iYiqccuK8WdMhqYipmv63DimmwsNtqKTB4br3l0MKsvJirPDAUsvOsyivAz1qTb/T6H9POUYayXWrCWkX1SSIXsHnc+d3ylEXOzD6FIOHp+oLj6k0FGbcpZZvHcCfzHdFGwbR+Orjg73kbZliLHdCWYEhLUcn/1Y1ao+nQVlqP17OWY2gKpvaAwnCvEoEYaxdN832/uP2+CHEr/6YpFX0PfrfW4+7mc4eOdPJLl9MnnOJfb8lKicQvEy9Q1YstxVEVy5Bodk5KmSsYhvVmeQzXeSB4A1q7Mat503FD3GQmCEsppKomTdPVqn7s0p4kZxUkyzGN0CCw1s2HnxvjpT6v7LdLk2Rq0Wt1NQNcIFWg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(64100799003)(451199024)(82310400011)(186009)(1800799009)(36840700001)(46966006)(40470700004)(2616005)(40480700001)(31686004)(40460700003)(53546011)(6666004)(478600001)(966005)(82740400003)(86362001)(31696002)(47076005)(81166007)(356005)(41300700001)(7416002)(8936002)(426003)(36756003)(316002)(336012)(2906002)(26005)(83380400001)(110136005)(8676002)(36860700001)(5660300002)(4326008)(54906003)(16576012)(44832011)(70206006)(70586007)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 19:10:57.6889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0161676-35a0-4108-c23e-08dbc8fb77f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8489

On 7/7/23 04:55, Julien Grall wrote:
> Hi,
> 
> On 07/07/2023 02:47, Stewart Hildebrand wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> VPCI is disabled on ARM. Make it depend on CONFIG_HAS_VPCI to test the PCI
>> passthrough support. Also make it depend on is_hardware_domain for now. The
>> is_hardware_domain check should be removed when vPCI is upstreamed.
>>
>> While here, remove the comment on the preceding line.
>>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> There are two downstreams [1] [2] that have independently made a version this
>> change, each with different Signed-off-by's. I simply picked one at random for
>> the Author: field, and added both Signed-off-by lines. Please let me know if
>> there are any objections.
>>
>> v1->v2:
>> * add is_hardware_domain check. This will need to be removed after the vPCI
>>    series [3] is merged.
>>
>> downstream->v1:
>> * change to IS_ENABLED(CONFIG_HAS_VPCI) instead of hardcoded to true
>> * remove the comment on the preceding line
>>
>> [1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/27be1729ce8128dbe37275ce7946b2fbd2e5a382
>> [2] https://github.com/xen-troops/xen/commit/bf12185e6fb2e31db0d8e6ea9ccd8a02abadec17
>> [3] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg00863.html
>> ---
>>   xen/arch/arm/include/asm/domain.h | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
>> index 99e798ffff68..1a13965a26b8 100644
>> --- a/xen/arch/arm/include/asm/domain.h
>> +++ b/xen/arch/arm/include/asm/domain.h
>> @@ -298,8 +298,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>>
>>   #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>>
>> -/* vPCI is not available on Arm */
>> -#define has_vpci(d)    ({ (void)(d); false; })
>> +#define has_vpci(d) ({ IS_ENABLED(CONFIG_HAS_VPCI) && is_hardware_domain(d); })
> 
> So in v1, I asked whether we should use is_hardware_domain() or
> d->arch.pci. I see you went with the former, but wouldn't this mean that
> the vPCI is always enabled for dom0 when CONFIG_HAS_VPCI=y?

Yes...

> Shouldn't this instead be conditional to pci_passthrough_enabled?

That could be a possibility, however, in v5 of the PCI ARM SMMU series [4], we propose removing the pci_passthrough_enabled flag (as a way to use PCI devices in dom0 without pci-passthrough=yes). If pci_passthrough_enabled is gone, the conditions under which vpci should be enabled for dom0 aren't entirely clear to me (other than CONFIG_HAS_VPCI=y).

[4] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00210.html

> So you could return d->arch.pci in has_vcpi(). The field would be set by
> domain_create() based on the flags passed by the caller. I would
> properly plumb to xen_domctl_createdomain and has a check in
> arch_sanitise_domain_config() to confirm the flag can be set.

I'll plumb this for v3 of this series.

> 
> Cheers,
> 
> -- 
> Julien Grall

