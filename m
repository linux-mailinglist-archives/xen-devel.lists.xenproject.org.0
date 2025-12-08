Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF733CACF54
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 12:10:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180384.1503575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSZ8D-0007UM-E9; Mon, 08 Dec 2025 11:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180384.1503575; Mon, 08 Dec 2025 11:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSZ8D-0007Rh-BT; Mon, 08 Dec 2025 11:10:17 +0000
Received: by outflank-mailman (input) for mailman id 1180384;
 Mon, 08 Dec 2025 11:10:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TwXn=6O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vSZ8B-0007Rb-VN
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 11:10:16 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7745acc4-d426-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 12:10:13 +0100 (CET)
Received: from SJ0PR05CA0092.namprd05.prod.outlook.com (2603:10b6:a03:334::7)
 by BL1PR12MB5970.namprd12.prod.outlook.com (2603:10b6:208:399::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 11:10:08 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::4) by SJ0PR05CA0092.outlook.office365.com
 (2603:10b6:a03:334::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Mon, 8
 Dec 2025 11:10:08 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 8 Dec 2025 11:10:07 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Dec
 2025 05:10:07 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Dec
 2025 03:10:07 -0800
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 8 Dec 2025 03:10:06 -0800
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
X-Inumbo-ID: 7745acc4-d426-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+Waz8yIBh4giaDMIbob1Ch55OOSPpk2KM6YOCIlV/FvTEt60bVErPAP1DZo0uOLAypWKXGHE7Y19lQfpo+tN38edm0xHm2B2PLPNyd0o3vAAAX+pVCSkUZRVwjXxbRGN5biaOKgth/5AQmQPPkaQargZ1WKdHP4VzrQgDFdbhpOVx7xAWpkN/qP6lL/YI3t4UhAwplI86fMVyg3xdBE5OYw456ITHiZok3b2y56K6/NzLekBr5zmnYMTzw/ZtD9k7sDTLOnaXe8I21t/EUGNsi4rwx4TLrx427qTvYHjH9X6vwnVhTIY3nb2ZqINjDUtkbgciTzYhRiCts6XZhl5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3IXhYZrqjgWlFE/m8Jp9W2Vh/NZkuZOInmNfg0aCoU=;
 b=Xv/LBUIjCgTtYAgsCBTUMW0iqaUweFukv6Mp2jmpirQVfr/8DE7OG+3QHUpAWtWIuUWGqRkZ0Ktt0KNQHXHAuBLfDiFY1wLLZ5CzGoKkNXUOcIx3LYDg/MwdW/SULsaXHGu78H4LqHBetn8ckT1tisd28+ia1QbMkwT3IvJOFYdn8Ib8+XLxcQ0ROeXvP+dfv+TpKgdFRo1In+01809HiTk0KwvBfcFgr+QSDsEGauStjMLz+Aegrwj4Iz/G5Nx1nQLwnrbk61J0yVrpmZIBAguOzWstE1Xcd8SCOvw7PTEmnCzLFtkDLcwOwWFT4jxOvgaOSUct/KS2DuA/Gn6NOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3IXhYZrqjgWlFE/m8Jp9W2Vh/NZkuZOInmNfg0aCoU=;
 b=0lMnMUBsTslXcooO221BmOlc9lZ888eevx9CJ63Cro77luznx35DQboLujRy14214GH7w5/HO1vASHp3PxGsOr/t4V9be+6Sb4dYbtRlAKNEBELC2hrmGtpDivCV19cT4TRAJ87kL5cNLFuU00oKPWMOsxNVH5vY7LW/MMlssxg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <3f021486-8750-4f56-8dba-db771f98fe5d@amd.com>
Date: Mon, 8 Dec 2025 12:10:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm/mpu: Implement vmap functions for MPU
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Harry Ramsey <Harry.Ramsey@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20251128095859.11264-1-harry.ramsey@arm.com>
 <20251128095859.11264-3-harry.ramsey@arm.com>
 <3c0a4987-81ef-4cf1-a1ad-bd8872a0dd67@amd.com>
 <04784EBA-BB67-495B-894E-A20A10569D8F@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <04784EBA-BB67-495B-894E-A20A10569D8F@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|BL1PR12MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f6d8d05-0070-408e-e901-08de364a58f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STVHSithTG5vL3pwTHlVZmpKNERSYndtSmNMSm9UVmcxa0lmRW10Q3BSRG5U?=
 =?utf-8?B?K2RMUGU1dkNoRnVTenlmd3psNldMUWtRWGZ4WUZ6WVkyelQxTW1IWFcraDg0?=
 =?utf-8?B?ZlJSaFFXUktBcUlPS2NGc1lTV3RCeTg2R1dORHM2VHJxd3QwaXYvYnJWWDhi?=
 =?utf-8?B?b01YK2h5SzlGTjRWSlBySktqK2g0b0lGcVYvR3F2TXdXdUdFMVVqbmRPMWtQ?=
 =?utf-8?B?enlYbklqRVI1b0lxdjFDQWsra3RORGZUWU9QTVRGanhtcU5kZnZlOUxIVmVv?=
 =?utf-8?B?OVhtMXovTXZwd0RMSHFHeGJJaDk3cnZ0SUtLMllJNUNMVy8yRG5TVDFjSm5F?=
 =?utf-8?B?Nm5zcXBRbTUzbXE0Q2dGK2N4ZUducEZnSGlPU011NVFYMmd0dlZkVXhYOVFR?=
 =?utf-8?B?bXRFdGd6MWxKb2tlVUJiMXNGODhuSTJSM3ZlRkxScmRNUFRIczdtczJjV3JM?=
 =?utf-8?B?MDd1WitkckFybFIwMG1yR20yY1RjMjJyZFB3SnllOUhCUXI3Q3NQVlh3YzNX?=
 =?utf-8?B?OFFNZnlqQjlKQkxVNWdKYzE0K3RZZnZiRFdlOTJESURpMUZVMDdJajZ6cE0z?=
 =?utf-8?B?MnczQWxEVmpTeXFiUlAzeEM2cURZR29TdTkrcDRFR3pQYlRkbXZMRENMY3lp?=
 =?utf-8?B?bU5JTDZMRlNyczlTZU9IcmlWWDZBZWRpaGY3bTkxb3FHdXpvNFdZaG5IR25G?=
 =?utf-8?B?ZDFHcUxPWFZod3VXbldNQ0o4WGFzSDZ5KzAwSytNSVhKWHZEanYvTXY1d0xv?=
 =?utf-8?B?TFgyeDM2dTBuTHhETkRJTy9LRCtzT01aVG1KeitUamY4Q2psb1ZsODAvbjV1?=
 =?utf-8?B?UzMzdnhhM052bFk1UTdyRElhczVrRW5FSkxGWUVpT0Q0eDNYRzBUeHhkR2VZ?=
 =?utf-8?B?eUQ5VXJIK0szbEluUTNOUUNtSGNuWnBUYWM1ZVFLQWxRY1lKaXoveVFwdUhu?=
 =?utf-8?B?YmFqME1VUnlScnBxM1NPa3ltOUx2bU1KclNmZGdMb3FzVTN1UjhRWjY2LzhF?=
 =?utf-8?B?N2FRR1A2ckdwaFR5N2VOYTBwQ1Byd1R0NmNRNTFZNUFGVVg1d09pMmg4bnhh?=
 =?utf-8?B?UnJXL0pHMEZjUmM2U3FHR0k1MlZKWjJNemlWMFZKdHBjU1JEejl2WEI3QXdW?=
 =?utf-8?B?SjZ0dS9yRjJaME5xbTBPYnFYTTJ2VnJEK2Y4Z2ppRmVPb1BhanJESk9tV05W?=
 =?utf-8?B?Q2pYNm4wb0wyRlVnTXhtN21GRWd1SS9EUmw3eFhaTmxxRGxKbk5rdGZoNzRM?=
 =?utf-8?B?TFBrbENqSGN1SGhRdmFZOUhTTkFWWjNjT29iTjE0L0hPK3MrV3kzc0R0VnJn?=
 =?utf-8?B?KzZhcEc5VlhtTlVWdUhqdDFCRElRdTZCSW42N3FXSG53QjVNc1pyQStSVzRm?=
 =?utf-8?B?TWdrUUJmaCtTYTcrTnNmbGpGY2xXL0o0S0xUYUdhVk9yTmpKMGw4K1ZUVmwz?=
 =?utf-8?B?bDdJTUlCdllKSHJHaFQ5cGVxOWdYVVFIR1lxc25ObW1SYWVLT0taREIwZzZS?=
 =?utf-8?B?bkpMVSt6ZGxIU1Q5L0YwR0d3MUpPR3RsL1pTeC8rU3NkcU85SnJMSnFEdmFh?=
 =?utf-8?B?Tk9tbHVXb2hkMXFEd2F6S0piRGVleFByMmhZRlg4WFBKL0F6N1hrckY4YUpa?=
 =?utf-8?B?MDBhZG9nQkFDYUtHdVFYTGVwdXNpOGNlakpRL2RBM0pLYTdHZnhyWFU4ZC9L?=
 =?utf-8?B?NmMzQnJGcE9seUtoOW9uTmFtYU10RmJGbENDdy9mNlRlVWErMUVvRVloYVpH?=
 =?utf-8?B?Tm9vZ002QzBhNnB4VUZqRUlMdzlYV0RaMkNrWnN6K2V6VVdoaUxERUlNZnJP?=
 =?utf-8?B?Y1liM1pMUmtxNy9uR1JNUG9RNjZqZUpSUy9zUlA1V3pyR0MzUDNSamNOMFFF?=
 =?utf-8?B?TGJEUWt2WW83cHByNjZOdDRnZmFORCtHdWE3OWxyVVU5M0psRFlhZG1WdGRM?=
 =?utf-8?B?b3A1anRJa0IvQ3FycG1qQUtFd1ZkQjhxU1h2NnJVVWp2NCtZTG9ITTNSeit3?=
 =?utf-8?B?b29DWkdUSUdkSU1mSDNNZmZmQWhTUU1CbVB0QlhTdVhHV1J3NWZjSTJlU2hS?=
 =?utf-8?B?MGZBNHdmRDBhQnhyT1pCMzlVOUdEYmV0WTBHbUhoTzB2dWx2Q0lRbnZkREp4?=
 =?utf-8?Q?oqRI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 11:10:07.9764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6d8d05-0070-408e-e901-08de364a58f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5970



On 08/12/2025 11:20, Luca Fancellu wrote:
> Hi Michal,
> 
> thanks for your review, I’ll answer only few of your points and I’ll let Harry take the rest.
> 
>> On 8 Dec 2025, at 09:53, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>>
>>
>>
>> On 28/11/2025 10:58, Harry Ramsey wrote:
>>> From: Luca Fancellu <luca.fancellu@arm.com>
>>>
>>> HAS_VMAP is not enabled on MPU systems, but the vmap functions are used
>> Just as a reminder, we don't intend to support VMAP on MPU? Asking because it
>> would otherwise be a duplicate effort to implement only these two helpers.
> 
> Yes we are not going to support VMAP on MPU, here we want only to provide the
> implementation of these two helper so that we don’t touch the common code using these.
> Are you suggesting some rewording or was it only a curiosity on your side?
It was a question to check whether we are aligned.

> 
>>>
>>> +/*
>>> + * Free a xen_mpumap entry given the index. A mpu region is actually disabled
>>> + * when the refcount is 0 and the region type is MPUMAP_REGION_FOUND.
>>> + *
>>> + * @param idx                   Index of the mpumap entry.
>>> + * @param region_found_type     Either MPUMAP_REGION_FOUND or MPUMAP_REGION_INCLUSIVE.
>> Both of these are unsigned, so why the parameter is int?
> 
> Uhm, good catch, I think this is a documentation issue because it might be also MPUMAP_REGION_OVERLAP which is
> -1, we should not mandate which value might be here, we should only say MPUMAP_REGION_* values.
> 
> 
>>>
>>>
>>> void vunmap(const void *va)
>>> {
>>> -    BUG_ON("unimplemented");
>>> +    paddr_t base = virt_to_maddr(va);
>>> +
>>> +    if ( destroy_entire_xen_mapping(base) )
>>> +        panic("Failed to vunmap region\n");
>> Looking at common vunmap() we ignore the return code from
>> destroy_xen_mappings(). Is it ok to diverge?
> 
> In our tests it’s ok, I asked Harry to have this so that we can catch any vunmap that is not balanced
> with a prior mapping. To be fair I’m not really sure why in the vmap.c implementation we are not
> reading the error codes from destroy_xen_mappings.
I'm ok with that. I don't know why we don't check the rc there. If you look at
x86 destroy_xen_mappings calls, none seem to be checked against rc. It can be
that it's impossible scenario there.

~Michal

> 
> Cheers,
> Luca
> 


