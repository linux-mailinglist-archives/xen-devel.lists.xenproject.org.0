Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCC28BF64E
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 08:33:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718604.1121099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4aru-0004f3-Q1; Wed, 08 May 2024 06:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718604.1121099; Wed, 08 May 2024 06:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4aru-0004bI-Le; Wed, 08 May 2024 06:33:34 +0000
Received: by outflank-mailman (input) for mailman id 718604;
 Wed, 08 May 2024 06:33:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ompu=ML=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s4art-0004Zq-5b
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 06:33:33 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2bb35f7-0d04-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 08:33:31 +0200 (CEST)
Received: from CH2PR11CA0026.namprd11.prod.outlook.com (2603:10b6:610:54::36)
 by CY5PR12MB6552.namprd12.prod.outlook.com (2603:10b6:930:40::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Wed, 8 May
 2024 06:33:28 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::3e) by CH2PR11CA0026.outlook.office365.com
 (2603:10b6:610:54::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45 via Frontend
 Transport; Wed, 8 May 2024 06:33:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Wed, 8 May 2024 06:33:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 8 May
 2024 01:33:27 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 8 May
 2024 01:33:27 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 8 May 2024 01:33:26 -0500
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
X-Inumbo-ID: e2bb35f7-0d04-11ef-909c-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gO60bE+H/DC3jZl4CDEnzU+Eg4fQ9nEMgQb6wgKUhKHAnJ24xutCIWsyGTrvPt7zkh3QfzgXu05qKyzNNkcylMasBBZiJv5EbjsMAa1bEDRLc2/Q/RNjzyODHJuTNi6PSoJgkAk/6OJA0bTKnJNqQQzWePT//QHVWffsB2Tp6f0JEFe0nUqIQx6rZV7Eb+imfVB9D1VlvkRmGdBkji8Zyf139+NX1ieGebr2N4lUx83fSgKkroHbEIPjVCNLZlB9f1JeQUBYzutO+Fu/Mkq/wxCLeSv02EnvihEpoE1j3HWdH9l7GmexlXTlb5cIYXD3/GzJ3WwkHmzxuPl9GkvjiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHocSXdyfuCzYVEwjGoiSjVB03rI4Z4IWRghwYVOdPM=;
 b=WvlHi9gXtaVPwiyAeNjo5kmmH2sMMJhdWJH6upibiUjri1wrA5ufVWOYyEkYiuv0aUMxEYAspQaalVSy/SXqwyuPBdLcoQfHACyzQ9YTJrOSlOQNueD+0i08Tk7s+XQYgLKt8K2rM/nMrj+vgKOE5LDdSZsQS3vshFVFWEzP/yO0r71cmLAG6fBhI/+O33iYRezaVxFa2ppWCJIN9QfhG8/F+8wfXaQ603MJATuVZQZG8MsjD8qzrBYd2eb56t//K20BaxQirRjly0FXZeDnAZ7UDn8Ef/NQSwqXgZY/rNUNT7FhzV81sepGaXRR1fuFj76j1rF+pcjMMSGbmTTHiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHocSXdyfuCzYVEwjGoiSjVB03rI4Z4IWRghwYVOdPM=;
 b=AgSM+V7HI82sRjn3PfXq7KE0m3zOELK7t7P+V3b36f1L2Wpf2SeBbeTVtmkCh94W/oMbPcDAcAdmxPKlK5txD2D1Xw24qDUqB4A25P/iQw5wAM1HzO/lqLDT4Q4GiCiuRyBDsB3n7oi85UoNLq0/YU+d1pmMREZA2O6yYqKN9fY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <5ef0df0b-00c4-4a1e-8420-393d7ce1130a@amd.com>
Date: Wed, 8 May 2024 08:33:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] xen/arm: Wrap shared memory mapping code in one
 function
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-3-luca.fancellu@arm.com>
 <ef9b0a4d-134c-4eea-927d-5cce0b330aff@amd.com>
 <E429579D-8698-4A92-BD9A-CCD686D1720B@arm.com>
 <86e0857b-32f3-4e53-b869-604f7c6c82c6@amd.com>
 <3CCC6BD3-0A1A-4AE4-BF81-DFBE3A11364C@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <3CCC6BD3-0A1A-4AE4-BF81-DFBE3A11364C@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|CY5PR12MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: dba08317-adef-4f4f-e729-08dc6f28c591
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bTNtcEZhblhRK2JjeHViMkZNOGorWmhER091RGY3TFFyckIxMjhMZlR0a0Rt?=
 =?utf-8?B?aWFEeFRoYlhsM2tVQkFzWS84VVJqUjEvYUd4QmVZZGxUNFVXNFlnSWc1R1VU?=
 =?utf-8?B?dUQvbmV6LzhUUWt2UDF3T1lHdVl0Vi9wNllJSFl4ajlZL2F4VGgzREQyakVz?=
 =?utf-8?B?Y1ZzcGExcCtNd2xDRnlEWEhsd0JWQlBNTS9PcXg1RnNvZDdKcXNiRGx3d2Vl?=
 =?utf-8?B?UkpQSzhLOXJmNEcrTEhtcEczZzRoUTJpbk1zQkdCL0NwaVp0cEEvYzRHbkM5?=
 =?utf-8?B?dWdheUVlUTdvdnAydUFLbGw3Nloxb0NPUWVqbGY5cWcyMFFtUm01NStBQ1Qr?=
 =?utf-8?B?blRwdUpSVUdQOE1aL3FpN0JkaFM1NmY0V2xGZVArMXVpMjNveXNmb20vdWtm?=
 =?utf-8?B?elNiUmVlZmk3d2NkU1dTRWJnNHVXNk5jaHJBTzFTLzFZVDBwMWhkNjF4ZTkr?=
 =?utf-8?B?ODdOQ2Nqc3htdFNpR0ZVcGphSUQ4dzF3bnZ4RldjeEpaUHAxOStRV244N2tK?=
 =?utf-8?B?NWh3eHhmL25vemFXd2pwa3FEVUNTQk1mdGdLMzBreklkWGJxYThCWEdlNDVq?=
 =?utf-8?B?V0J1cG9NYU5aT01yMnVvdkxjZkJ4eHFZZVpuM2FaeGpvZmJSdzZoR3Ywd2RX?=
 =?utf-8?B?R0ZoTFV2Z3JFZWMwWXFINmZ0ZUVPRjczVkEzU3Q1OTVta2FxZGxsY1hhZ0hI?=
 =?utf-8?B?VGZGdFM3Zko0SWRrTzJzQzNnY1VRd1RjYXY2WTRERTV5dVZzcUJoUDk3VXUv?=
 =?utf-8?B?d1FieU5pdVpEK1JQNWhNVjFHRWE2KzdvNVhyOTA1YWR3OFc2OGpqQmQzOVNN?=
 =?utf-8?B?RFI0RlJvbk5xQkQ0MWZMRmluL0FWNE1zSVVDT3lXN2pacnlKVG9NM3I3Umg2?=
 =?utf-8?B?UTJrSWs5Y0hNcUIveFhRQXVHenlyZUVRRGZmSmFnUW1ocGRDRUcrbEZWTjk3?=
 =?utf-8?B?RDc1K0NBWEE3V0dvQXdEVFQvVDVQem1ld0ttRnRSdERvM21zYkxjMGlJRHI3?=
 =?utf-8?B?MDJheEJzWGNQSXArWW5xcTU1OEF1WjFONTY0ZTZEcVI4WEhjOUV0eUZQaWpv?=
 =?utf-8?B?N0dDdzVuWFRiN09yR2dxdm1VYzZodnMzcTBoTTVKTGhQeUt6cmQxTzg5WnlR?=
 =?utf-8?B?MldhOGdPM3N5ZkJQaCt1ZkF3cndVaWtqZ0E3NXcxVzJnMW15V2plVnZLQzZ0?=
 =?utf-8?B?eEpBS1h0UFVmL0Nrd2hHN09oNmN3d0ZMMFpDNUFlV1FZWjV2MmRIbHFYdHVS?=
 =?utf-8?B?S0dXZEtDTXBPU0dJSnhQdG9DWlp4K0xGMDdMWC9jUEJEQm16L2YxQjJnZVNN?=
 =?utf-8?B?Rk1ZT0YwTWhacDZ2NE5LWHd4MGN1Q0lacnYxQldQY2R3RkxhQ0xjeDFhc3Rp?=
 =?utf-8?B?NUV4WHhCdWZNQUhZREVWVHVLS0Q2WFYvWkJUZVVneFJQeHdaVUdLamFKeHVY?=
 =?utf-8?B?UzMrSUhtOTJFVXUyUjZrSzBWWi9pelZnUGllSytHTlppTk00UGV3ckF4K1BF?=
 =?utf-8?B?eVJsK2lya2hxak05WEt2MVhNYlVnNUhxQUI1ZVJ1blZBdjk0RlFCY3NYR3U3?=
 =?utf-8?B?REJTbzdYNnBBMVVUWDhrZmh4Z3RFeU1xM21zQ24vSmFBWTVtdDRCNkZOeWlt?=
 =?utf-8?B?ZE5HVUpQQmpHWU9Pb3RRd2dsUFJZZi9JMzBZbkZPdEhZMmNnM3RFQmRpRk1n?=
 =?utf-8?B?czB4SStaYzBZWWdUMk90azJ3eWlab2hIT3l1ZlFRWWdSUy80aUViT1JNZHpJ?=
 =?utf-8?B?c0RlL1RwZWhHS256czgwbC9pNS9tTVp3OGYxcFJGRC9HSDRvbVNkemxkd3N1?=
 =?utf-8?B?TitBNkZ5ZzFKdXlEQVhUamJjNTNhVXZSUzZoYnZIZlN0dmV3R1VScW5vUm1L?=
 =?utf-8?Q?+fUH3fHlY48+N?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 06:33:28.3034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dba08317-adef-4f4f-e729-08dc6f28c591
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6552



On 07/05/2024 16:15, Luca Fancellu wrote:
> 
> 
> Hi Michal,
> 
> 
>>>>>
>>>>> int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>>>>>                       const struct dt_device_node *node)
>>>>> {
>>>>> @@ -249,32 +290,10 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>>>>>        if ( dt_property_read_string(shm_node, "role", &role_str) == 0 )
>>>>>            owner_dom_io = false;
>>>> Looking at owner_dom_io, why don't you move parsing role and setting owner_dom_io accordingly to handle_shared_mem_bank()?
>>>
>>> I think I wanted to keep all dt_* functions on the same level inside process_shm, otherwise yes, I could
>>> pass down shm_node and do the reading of role_str in handle_shared_mem_bank, or I could derive
>>> owner_dom_io from role_str being passed or not, something like:
>>>
>>> role_str = NULL;
>>> dt_property_read_string(shm_node, "role", &role_str)
>>>
>>> [inside handle_shared_mem_bank]:
>>> If ( role_str )
>>>    owner_dom_io = false;
>>>
>>> And pass only role_str to handle_shared_mem_bank.
>>>
>>> Is this comment to reduce the number of parameters passed? I guess it’s not for where we call
>> In this series as well as the previous one you limit the number of arguments passed to quite a few functions.
>> So naturally I would expect it to be done here as well. owner_dom_io is used only by handle_shared_mem_bank, so it makes more sense to move parsing to this
>> function so that it is self-contained.
> 
> Ok I will, just to be on the same page here, you mean having dt_property_read_string inside handle_shared_mem_bank?
> Or the above example would work for you as well? That one would have role_str passed instead of shm_node.
I'm ok with the solution above to pass role_str.

~Michal

