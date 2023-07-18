Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7825758391
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 19:36:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565423.883538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLobp-0001Ky-LH; Tue, 18 Jul 2023 17:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565423.883538; Tue, 18 Jul 2023 17:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLobp-0001Hc-I9; Tue, 18 Jul 2023 17:35:37 +0000
Received: by outflank-mailman (input) for mailman id 565423;
 Tue, 18 Jul 2023 17:35:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N9eI=DE=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qLobo-0001HW-6u
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 17:35:36 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ef413b5-2591-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 19:35:33 +0200 (CEST)
Received: from DS7PR06CA0041.namprd06.prod.outlook.com (2603:10b6:8:54::10) by
 DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.32; Tue, 18 Jul 2023 17:35:28 +0000
Received: from DM6NAM11FT113.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::39) by DS7PR06CA0041.outlook.office365.com
 (2603:10b6:8:54::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Tue, 18 Jul 2023 17:35:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT113.mail.protection.outlook.com (10.13.173.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.33 via Frontend Transport; Tue, 18 Jul 2023 17:35:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 18 Jul
 2023 12:35:27 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Tue, 18 Jul 2023 12:35:26 -0500
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
X-Inumbo-ID: 7ef413b5-2591-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ns+jQAxs0q+y8eAbKZAM8YaqFXuyrUpQDZnXzk79zTsovlxXXTV//fHJfZDDUVRPPEAkOtfyz2KiV8S48IC+MFZJ+8kRfAWDeU+HlzSaKKFSXeUI0v3dJAMwDTP3Jk1euVoFOQ/iisWFXSlPS/UeICoa8ttNLbVyl/5FY/rI6qLEMYBh4nDv6+m5Bxu1fXlP7X4EV4RoaXzpckH1y1dl3sJFhWyKfVVj570lJ5DhcXPLlNnUZkIqcybqe4pl4+qOcfoGEksbbbTm15QoUSSMNSl/RBDPBVljJibXzio96i9p9yOnPPA36k2Ez+HyPoa6+7YvZPx1WDqc/6HukqLk9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJKJwh24mPX1Bkhjmep1b5yYgJ1BO09AW7Zvfylv77A=;
 b=kQ/HWuDdeBjorOgrja51CdcvM1ZO2aJuUlSBxiIN36RrQuPEVi1JwzAJQ/Tat+WDM5ZoRbUQmJFDmYz9raWF5H+cV3ZwOwInRY+AGCNF4Nq2GfA7FvQH2dKj0rH0Pe5zlUxAN1N0MQnoH1aECT5ub09sjGUcF/gPuIO+8AmFlvJexo/3gofdaUJc2d7S/GhxOsDxp0EaBDa3v6ujG9UmjTBph1B/49QVIP2vLoCDoLKcql6UVH+Qr7bRPRejlLHwSKaPoHHQcFHtLJfoQrzuLOXgJosSwCXxQO4fE9eGRn6yIXseq7LirjxTo4A4EHi069pXekqehDDwTzWcll/Vag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJKJwh24mPX1Bkhjmep1b5yYgJ1BO09AW7Zvfylv77A=;
 b=xbvvquNx1kJCS4hJENeA7IWnATOXDtNoOpnySA0o4pXncUUvwC95aCwuSyUF/0SZOge0gTrmC0SmckXDnR0CYF0RpsKXfvWmIdLY/TrKPbQ75NnY8FxvlVn2Iwh65T6LA7Gm/FjFBEmzM/tJQCtxke8/OIVCJgb/eXiQm6am02A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1a8d7024-f881-a3f4-c575-240fb393555f@amd.com>
Date: Tue, 18 Jul 2023 13:35:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig
 option
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Artem Mygaiev <artem_mygaiev@epam.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-2-stewart.hildebrand@amd.com>
 <041323d2-9114-328f-40c6-f5fed60892a5@xen.org>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <041323d2-9114-328f-40c6-f5fed60892a5@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT113:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: ef3f24c3-2ff2-4d48-32fb-08db87b560a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xyxxI0egmuQGzxXEogvzx8+VemaAV2NfmnTgzFeZX8EQZfUgnnjHGNjp4+guF4AkrvrW2z0zlcgxtdQHuO/rwC5/veil/dcY/KSL6zD59MCDrpWhDQOaer0n4lqbtqw1SD0pJaPI/SDcEOs9/oFiXS3Jx6DJhqwgr83J/3yhn8zvSynTod5wj5kMPwC6e+3HqEELb4B7rwDTON4idpTHERG2g1JBgIJUvvuyIpNg8uhSjdYxJ7+zXn0edbLrXmXSbUbZaujk9n84Zkl6m7K/jnaYlfsFFw54tqIzczT9jQy8YPAipDHZMkikexB2VO5DoToRDeQEMRAgbxPgZqZNXDE0wjcL1+ZXu3mj7tnNYtHqE8ycpwAPp5LfaasGS6sQwAGfCgNNVA5ea/I4rArp4XGARZB8Nx66Vt6uzJ0wKRpI8d/qx652ZpNSZ6ZrScVZKl6LqqfZlLS94nxNzxsGo7m9gg0xBLmqhCWzGxs660/jL3Lx2caj7l3SXUdAEdcOV/qfPMYJHXVD8qUpD6NvT4bOYC0u4VnMe4M7nFiwD+7j+e8FKxqaP74FROXpi+LqjMmHY+TKzcKPKkWSPiwiIZTPH356DpxJ25UjWHTDEslzCEWcodMbiK3el0JAds3ljh9PfKlg54MxS4CMmGEcTx75QKPFxLTPQ2WqICEATN+FrPAQFgHOzCiCWndil92tqvXAwKBjiY/LPCkb4NhsNvN2Z3niyKVm5s5u14oceNYa3QJikLM1GCxRc/egrwhlnXLtsGiiTA5FWJoardcLvzYBdvFhgRGZZUIPsU2gvs0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199021)(82310400008)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(54906003)(110136005)(81166007)(16576012)(356005)(82740400003)(70206006)(41300700001)(8676002)(8936002)(316002)(478600001)(5660300002)(70586007)(4326008)(36860700001)(186003)(83380400001)(336012)(2616005)(26005)(53546011)(426003)(47076005)(36756003)(86362001)(31696002)(44832011)(2906002)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 17:35:28.2545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3f24c3-2ff2-4d48-32fb-08db87b560a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT113.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353

On 7/13/23 14:40, Julien Grall wrote:
> Hi Stewart,
> 
> On 07/07/2023 02:47, Stewart Hildebrand wrote:
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> Setting CONFIG_PCI_PASSTHROUGH=y will enable PCI passthrough on ARM, even though
>> the feature is not yet complete in the current upstream codebase. The purpose of
>> this is to make it easier to enable the necessary configs (HAS_PCI, HAS_VPCI) for
>> testing and development of PCI passthrough on ARM.
>>
>> Since PCI passthrough on ARM is still work in progress at this time, make it
>> depend on EXPERT.
> 
> While preparing the patch for committing, I noticed that HAS_PASSTHROUGH
> will now allow the user to select one of the IOMMU quarantine options.
> 
> There are three of them right now:
>   1. none
>   2. basic (i.e. faulting)
>   3. scratch page
> 
> The latter is unlikely to work on Arm because we don't setup the scratch
> page. AFAIU, for that, we would need to implement the callback
> quarantine_init().
> 
> I would expect 1 and 2 work. That said, I think 1. would behave like 2.
> because on Arm the device should not be automatically re-assigned to
> dom0. I know this is correct for platform device, but will it be valid
> for PCI as well?

In a system with dom0 where the guest is created from the xl toolstack, we rely on "xl pci-assignable-add". Upon domain destruction, the device automatically gets assigned to domIO. However, there's nothing preventing a user from attempting to invoke "xl pci-assignable-remove", which should assign the device back to dom0, but it is not automatic.

With dom0less, PCI devices are not deassigned from the domU.

> Overall, before enabling HAS_PASSTHROUGH, I think there would be a bit
> of tweaking necessary to at least prevent a user to select the option 3
> (either via Kconfig or the command line). And possibly update the
> Kconfig for IOMMU_QUARANTINE to reflect the behavior on Arm.

OK

