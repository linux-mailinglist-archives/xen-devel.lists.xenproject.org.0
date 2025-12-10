Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB50CB3861
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 17:49:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183069.1505855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTNNc-0004cy-Ls; Wed, 10 Dec 2025 16:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183069.1505855; Wed, 10 Dec 2025 16:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTNNc-0004aT-Il; Wed, 10 Dec 2025 16:49:32 +0000
Received: by outflank-mailman (input) for mailman id 1183069;
 Wed, 10 Dec 2025 16:49:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11gW=6Q=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vTNNa-0004aN-JG
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 16:49:30 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 303db9a9-d5e8-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 17:49:27 +0100 (CET)
Received: from CH0PR03CA0400.namprd03.prod.outlook.com (2603:10b6:610:11b::20)
 by CH2PR12MB9458.namprd12.prod.outlook.com (2603:10b6:610:280::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 16:49:20 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::a8) by CH0PR03CA0400.outlook.office365.com
 (2603:10b6:610:11b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.15 via Frontend Transport; Wed,
 10 Dec 2025 16:49:22 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 16:49:20 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Dec
 2025 10:49:20 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Dec
 2025 08:49:20 -0800
Received: from [172.17.249.106] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Dec 2025 08:49:18 -0800
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
X-Inumbo-ID: 303db9a9-d5e8-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RstK2kT4OmMipvxKkCa/spFJT/HuVHpEpt2wnNqKDj3oXoKH6NYefuZFjYPAFmkrdbsFfPB6igA23ecb3NFHlAfhwdi9W6yiodpNx092WZYDGEBPhh63QGgG+zP3ia6/mQZyJbHat4PUSmCOk7us33OF1zRCyuffDIYD6b+QgaafScCxiFSa3yYu+7qF6MRb6vMFFAYmMiG6lbyiD+fs7FVmGe/VZpr5c0ixp/0wDvweLHldCLc4eWrQ/Q2sfB0ILUycKi/ccWpAgWOVZFtsZ3VzyPNtXl6QtzYSvKSQ/2UfkVWSQCEQNUnS5nMCjWtpm0tJR4/MsgB6uhq93zw2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dE1wPnvndGFxY46NPEZk1yugpaOagy3WdNTA+mwjpmM=;
 b=TjhemlgXm2rPJR1DOJbUc/EJFFPN8A5jk31jMq6Rnt45mewIL+1XiIvro+OH+6vLW0+niwo8tIuVAjtNHOEjoy357D30tvfAhbdroddpO8GiFg4EsC1t/AQDRTfy/7VoPhD2lwcxup0A1NPICppcuOfvCg8XQhvljuLJz7V48DOYiMU/JQPO2a320WPf9vxZeO0QDpz1JtZOqQyoeDfMzkwFKYHoZL7uKVsZlfT2UwfiSvAs53sVTzQfVYW4FsRys3zLm3us2oUIlqM5pUnb/zBrWeZe16gtIByPBHCg5lcyhdxWFH6FMTsOqN72zeQUX3TU2XvAkiAoMQfIqfaOvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dE1wPnvndGFxY46NPEZk1yugpaOagy3WdNTA+mwjpmM=;
 b=22HxR7mUtmwmnpCwEcWFCViz81kxKFdYaSYxj9rhW8cK3UD/TNQanMvMemen9phYKgNFqu8uID85egPV2Yyibm21/HNqFnfVxcjzt8vir0L2VMKhsUWDw5IL/tA10qo8Z4xXzYfYhvbR8LWHaa6ziI/gq4GneJtUmzIOP7qIaN4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <bac80e40-bcd8-497b-bb33-8bde16b9972d@amd.com>
Date: Wed, 10 Dec 2025 11:49:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen: Centralize scheduler linker definition
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: Victor Lira <victorm.lira@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, <xen-devel@lists.xenproject.org>
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-2-jason.andryuk@amd.com>
 <be7e41df-992a-408e-ad45-c29b4666cb9e@suse.com>
 <a3651fde-77e1-4233-a1f0-e4a5b2cff3d6@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <a3651fde-77e1-4233-a1f0-e4a5b2cff3d6@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|CH2PR12MB9458:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e1ec99d-2b9a-4044-df01-08de380c10eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rno0SWxtMU4vMDZJMUYvTGQwVUlNTFFtL0wwK3BjKzhJZmhpaWpsaFBCMVE3?=
 =?utf-8?B?TEtmb3J0Z0ZmVTlFd3Nob2ZHZWpwQzI1Z2VUTmw1Z0lLamwyYnR6WEFXc2Jm?=
 =?utf-8?B?YVo1cThyeDMzb0hhL2tybFl3VXlBaW5KRC9nRkNVRldFbXNyclRiVzFMOTd6?=
 =?utf-8?B?Y1IzQVYyaUpEUHIzNjdWclU5c1M2QlVyeWtpWGJTcnFja1BsYkFPZllkcVJj?=
 =?utf-8?B?UGlJY242TEQwVlJMQ0dUZXdMVEZwdDhKbzBrMk9rd2tWUU9yUCtTUXM5czd4?=
 =?utf-8?B?Si95MlVlNWdLcmdSWFlDNTlLSU00Yi9LWTlMSUNLQkJTRGFwdUh5ZkwwNGp0?=
 =?utf-8?B?c1NPdUNwRmtSbjdNbmFGQnVWekY2dmJXZEdNUmt2V0xDZ2Joai9iZmZKZkRw?=
 =?utf-8?B?WWpoSUlMS2xocnhJTVVDT1E3bnNpeFhuV0IrWjRJR21SeUI4dDZ6YVZ5anRL?=
 =?utf-8?B?dmVoUlBqM1NWQUdqbUNEMDRZLzVZK3l5dGRhNjc1SmhwbnVSR3B4YWkyR0ZN?=
 =?utf-8?B?ZXBwZlJLUXdkdkFoaXlBZ0hNYUhScUVUT3AzYlA2TkVNUElQN21CdVVIWkVj?=
 =?utf-8?B?WVRlT0o0MU1TUWxTOStXczVGZis3MjY2bGdiYnIxdzFFU0xSVjM2WmFRTTU1?=
 =?utf-8?B?RXhwaHJHS3k3a0ptMFd2OXIzT0NwcUc5c01rcjRxdG1mNjE2OW03clpQaU9j?=
 =?utf-8?B?TVkxTEwyYmdQSTFUVWJlVjdvL2VjbllSb2l2c1B4eTBJRzJGbDRkYTFzZG1y?=
 =?utf-8?B?eUVmZEFKRHhyU2tZNzRGTnFxU3QwQnBuVDVOa2RtWUVLWTlEanlldDR6YmQ0?=
 =?utf-8?B?Szh1UURIcGozRElXYXoxNTZtVHprNSthMHNaSGh4MFd0UlhHMThqOTZxYlhO?=
 =?utf-8?B?dWFDQktCTkRzWkNydDNLcW9FZCtxamt4LzlpMzdsbWVuL1VNd2ZTbzdMMStw?=
 =?utf-8?B?WkdkeWtLSTZEL1E2ZzZmRFI2WXZRWkIweEpVQ0ZOZVdmTVkwdDczUzVRaTJO?=
 =?utf-8?B?cnlFQ3JxejRTU3ErQkpHUWlHdk9zTW9tYXIzd1oxMEVXY3RhbXVpd3ZULzIw?=
 =?utf-8?B?b0hKdDdlSEFNV2Z3YWJSYWhzTmRlV0w1b0c5L08zc1F6OVYvZXNHVHVEcFU2?=
 =?utf-8?B?OVNxVy9Fb0dseDN2TXNSa1dabTR5UmpuR1BQdDFZcmZ1OGxVak9UT3BGNkhT?=
 =?utf-8?B?azE1Nm9KQXJ4K1QyNm8ycHYvVDBvVVJFZFUydXd6aDlCSmZmV3pmME9iZTFV?=
 =?utf-8?B?OFVyeVJJcUdtUWl1Vy9pQ0NrQWJzRmZBanY5UmFWUG5iOG1FRUM4ZHZxbmhV?=
 =?utf-8?B?VXAwQ2w2VGhBYjRkUVg4dXhoL0duTUl6YjBIeUhyaDhoc3lnRFJFNm4yWHpO?=
 =?utf-8?B?SHZkYXpIK3dHM0x4K3B2SzBVeUw0MTQvQTROVjhQZ05VeHNabXZWL1FFM1JW?=
 =?utf-8?B?U1RuWlhmVFdXR05zclJiMzF5MTY3aFVKb243ZUNPdld1aVBkRjFXamh3Vmdh?=
 =?utf-8?B?ZHhEbkM2ZzJXemVwY3A2NzZUb0JUNmxGNWJta3FuSW56UjhQQ0cxTktKWitv?=
 =?utf-8?B?YkxDSGVWYkc1dHUxUDFHOHdIQkY5L2pCbUNFVGNvY3ltOE1DOHdGYURkRVg5?=
 =?utf-8?B?V2IwNFBZenRRSk1lMnhqZ0R4WTB4ZHBoeFFWNEJlWFU3MG12emRRd2hHb01m?=
 =?utf-8?B?eXYycytRZzg2UUdLVjZxTlVCeVQ3YW93TFpUazZrYnpRbnRqeko3ZFFPUUZS?=
 =?utf-8?B?T2x2ckg4emJWU0xuRkpFQlZ2cmNxdnRJZ3dhaXNZZDBzVnRtaDhwdFFlNVZ2?=
 =?utf-8?B?VGhuVUQ2NUxGYXhsUXNVMHNFV0x6TllDdkZVcWF3MkJwLzdtRnBHeDFrL0FG?=
 =?utf-8?B?ZWpEK2I1WTJiL255WktIVWpMSGtiZ2ZEbCtXRm1PYkZtVmE3KzJ6R2lNeW5j?=
 =?utf-8?B?V1dzQmhDenhvaUp1bjYzZDMwTnIvT3JEMWF6OXNQN3VpYjRjaHFmaVZrSnMw?=
 =?utf-8?B?ZXQ1MjN1T2FVbThuRGFQa3FXK0QxWHM0b3llVE5Dd3FkK3NjV0pqd0NrQ0dP?=
 =?utf-8?B?US8waEVkMUdqb2YrOXQ0Kys3NzQ4QnNPaFh3b1JHSnhHcnJaRkZOV1hZalBL?=
 =?utf-8?Q?8Nr8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 16:49:20.7285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1ec99d-2b9a-4044-df01-08de380c10eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9458

On 2025-12-10 11:32, Andrew Cooper wrote:
> On 10/12/2025 8:08 am, Jan Beulich wrote:
>> On 09.12.2025 22:47, Jason Andryuk wrote:
>>> --- a/xen/include/xen/xen.lds.h
>>> +++ b/xen/include/xen/xen.lds.h
>>> @@ -173,6 +173,12 @@
>>>          _edevice = .;        \
>>>     } :text
>>>   
>>> +#define SCHEDULER_ARRAY              \
>>> +       . = ALIGN(8);                 \
>> While indeed it was 8 in all original locations, I question that for Arm32
>> (and a possible future RV32, for example); imo it wants to be ...
>>
>>> +       __start_schedulers_array = .; \
>>> +       *(.data.schedulers)           \
>>> +       __end_schedulers_array = .;
>>> +
>>>   #ifdef CONFIG_HYPFS
>>>   #define HYPFS_PARAM              \
>>>          . = ALIGN(POINTER_ALIGN); \
>> ... exactly like this. Preferably with that change (happy to carry out while
>> committing, alongside a respective addition to the description, so long as
>> there's agreement):
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> I thought the same.  struct scheduler is entirely pointers, and one
> unsigned int.
> 
> I'm pretty sure that this "array" predates the introduction of
> POINTER_ALIGN.
> 
> So yes, with it converted to POINTER_ALIGN, Reviewed-by: Andrew Cooper
> <andrew.cooper3@citrix.com>

Converting to POINTER_ALIGN works for me.

Thanks,
Jason

