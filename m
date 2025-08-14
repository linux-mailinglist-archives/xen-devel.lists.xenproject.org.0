Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06115B25EAB
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 10:24:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081054.1441187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTG7-0006ba-45; Thu, 14 Aug 2025 08:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081054.1441187; Thu, 14 Aug 2025 08:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTG7-0006ZI-13; Thu, 14 Aug 2025 08:24:27 +0000
Received: by outflank-mailman (input) for mailman id 1081054;
 Thu, 14 Aug 2025 08:24:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t1VE=22=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1umTG5-0006Z8-KR
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 08:24:25 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2412::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15c5a4bf-78e8-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 10:24:24 +0200 (CEST)
Received: from SN6PR16CA0037.namprd16.prod.outlook.com (2603:10b6:805:ca::14)
 by CY8PR12MB8299.namprd12.prod.outlook.com (2603:10b6:930:6c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Thu, 14 Aug
 2025 08:24:19 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:805:ca:cafe::8f) by SN6PR16CA0037.outlook.office365.com
 (2603:10b6:805:ca::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Thu,
 14 Aug 2025 08:24:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Thu, 14 Aug 2025 08:24:18 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 03:24:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 14 Aug
 2025 01:24:18 -0700
Received: from [10.71.195.192] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 14 Aug 2025 03:24:17 -0500
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
X-Inumbo-ID: 15c5a4bf-78e8-11f0-a328-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HeuHauD+ZYxrgHe1vtZGC+GeDjjg9i3Ts0dwlyXyZqXxfLhFV/+gaMm85TA2I8GdyWW1z1pTAENUQFskWQtcUrT/1FSqne4g3ene2zvCwA58cC0RjIrN4QqKo2N/V4/bgs9PI1HgVA2ZTqvpBjaAEwhVo8nxAxufh2CVPJ6KnpkPr+Y3TsNqoML6ocC43TkwSpEUbxpQzFlxInkP4c50T9c1eDO/zCXrqeAfHZ8UaWWw/yys9JhKaFcGDJw+Mb8tOFJXPQdGM/XYZYOEN43ce2p+fh18RyocDkQkAkGCpenXReN+bJo++mrdz7kEImW+LN9cbyWqSW/W8sTOFXDJ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTZRlmrjVB346LvvpDuM1xxZqrvi3ClpQsGJNcNnxSw=;
 b=nj+Ci50fXUV3pHKSU0JLn5XUFVQCrQ1Rsjz0dtlEubV4Q2oLHn0U+MnEuo5Jylm1IeXCVcvF2f7AIAUHEG3oAfAGzoMfWb7kVsZOhlyrK+D5pmvR3IRCAEEJ5BW9NsOR7w+meDNkIXeenRD3gPEQ7yNZ2GN+dQFL6l9OKAsVYvvIKiKRO/b8kmMa0bPdz1RcMahwJ/S+Hh1Ae2nLpzQe034VAbcjAs9Yz064x3PHTDKswJb4hJjnk8l9TOPn6lZBWpwHqUrAr+j8UrLJirEBKrvj8mAUHHfmO18CEsxh5jJBCiBDl0yAY4IIDOuoiRrkO1zMBS9iw//BHWret8zYcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTZRlmrjVB346LvvpDuM1xxZqrvi3ClpQsGJNcNnxSw=;
 b=mv4gXNKli2oUFhEFnleCtU/gkiSvNlkTlmDx7sVW8dxhuB9cPjh4p3xGKU9RHt0dDEmpQIyebPiGSPRoaJPHX0je16IaotPsxlMG6JlsUz/q15kGccz3Y0xWNS5WuEYV0kDt2jJsZyYCpkAdr1QYE6G3Or0Ks4UOz4y90ByRZJ0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0496ce54-84b5-43a1-871a-b77d15460427@amd.com>
Date: Thu, 14 Aug 2025 09:24:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm/mpu: Enable is_xen_heap_page and co for ARM_32
To: Hari Limaye <hari.limaye@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20250807174529.595577-1-ayan.kumar.halder@amd.com>
 <20250807174529.595577-2-ayan.kumar.halder@amd.com>
 <ka6nb4b7xnqdbumg5rtwudf2ybvsblw7lgs3lk3wz6czoji7k5@p37x2tochoph>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <ka6nb4b7xnqdbumg5rtwudf2ybvsblw7lgs3lk3wz6czoji7k5@p37x2tochoph>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|CY8PR12MB8299:EE_
X-MS-Office365-Filtering-Correlation-Id: 922bf963-9926-4daa-05ab-08dddb0bf6e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTBtazRiV0R2aDJpaEpqd3phQmgvODdqSC84VGhkRThxSWpVUUFUM1Z3MXFa?=
 =?utf-8?B?VTNucTRHL1Q4cE05T1JOeWJnQjl4TU5PQlFRVU5BVUtFcUdRZmU0RkVPMW1h?=
 =?utf-8?B?bGlGdEZ0bm1zS21IYS9MUU9DczVjdnlVMmNjSUpvUHN1RUdEdXkyWkE1eEx5?=
 =?utf-8?B?QW9kSnMvYWEwbUNJVHE3SllqVlQ3UG5RRE54ZlZ4ck9CeTdTL3pEMU1LZ3M2?=
 =?utf-8?B?VG5OVEt0eDNaUVplRHYyOFZ5Wm9xaXpaM00xeUlPZmE0aDZ1WW1DSUVSZmI0?=
 =?utf-8?B?TlZGb3VDb3lxeHU3YTdDVDk4ZkFORUNYelM3L29HdEpJWGNnNEprMVRhejdJ?=
 =?utf-8?B?UGZIUkt3ZlJGUk5xVGlFZWk4dTBIMXFzbk1Ed2pWZXBTalkzY3BkM3BBMDEw?=
 =?utf-8?B?bFF0K29kak5GbTJiL1ZZWUF4QnBUYmFVUFFOMU9BZnFpZGV3dGlwamVySWFx?=
 =?utf-8?B?M3hvSFlvSFFVZW9Bd0ZDWWdFRjJocklVRm9QUkhRZFU5ZTAwNjZuZnBtQS9z?=
 =?utf-8?B?TWQ2em5jcXpVZmg0TnlyOS8yZzc1UWs3Q2N5eGZzWDZhV2FKSlh2NWJvdUdI?=
 =?utf-8?B?L0cvMkkxSHZ2czBocE1mV3dFMGVkazFpeVIxdTl6bGZtT0V3eFhWRHlDVWF6?=
 =?utf-8?B?NWRhWDdjTXVwSjFPVnJEeTUrT2tLUU5jMmluOFNQbWpWMWFSZUxhRjg4MitR?=
 =?utf-8?B?K2JtNWFvb3FEY25XR1VMc2NnYWppYVo2Um5UTlcyalIyOHdIdVJDSDBzMk5B?=
 =?utf-8?B?ZFlzbUorQWNTeVF3TGlGN0dldEs2YVcxTE5zZlhmVUFiTGZGdHd1a0Q0OUli?=
 =?utf-8?B?OHB3bHh6Vy9yRnBGdDAvMkpPYU5Va0Y3ZFd3MFBJSDJEay9lN1hBdXpGdTBX?=
 =?utf-8?B?RCtRa2U3WFhmT09YUUVqd1l6aXpHQzZTaXBac0Njbjl3NFVTMHZpZU1KVnVH?=
 =?utf-8?B?cXkzMDJlZ3JmeVZPQ3dRN1duWUJ5MzArbG9SbytMcUNXYkZwalBHOG1WTFN6?=
 =?utf-8?B?TzlVS1V6ZzJ4ZmM0ZXFHUGhKaGgrWHdJSVYzN3pkNm4zRm4xQ3R4N2pHMDk2?=
 =?utf-8?B?ODB3YWxaZHU4VjE2WGowRVdaMGVubkhDbGU4NmZ1RXV6V2EwOEdRajR1REZW?=
 =?utf-8?B?Vzl3MnhmbnVEeWVrMzhFWnoxa3JRMmVaYndzeGtQcDZyS1Y0dnlrU1JUOWRa?=
 =?utf-8?B?eVIrdHk1VTNIY3JTNHRVeWE3bFd5VU10aWtaUnd4OWRmUVJkejdvQlJ4TUlw?=
 =?utf-8?B?c2hweDVqRFlicDl4QmpsTzlrWFUvdjFQTlZ4MFJ2dzNMNjh0OWdpN05kWDNQ?=
 =?utf-8?B?NGQ3MGwveC8vOFNjcmxYQStGbTYyTk1OM0JTS3AycjNDOVN6ZTRWOXh6UWw0?=
 =?utf-8?B?L0ZYZHR3TUVTSm45Ynp5NGRHTEhXUDFZTjcrSGpuQVVMcDk1N1RxTFA3WGlS?=
 =?utf-8?B?YTc2U1Azb01hVlBVWlFkNW9RWjZMdVdIcUlyZzhxclBud3RQT1htN0Q1T3c1?=
 =?utf-8?B?Zkg5Q3E2eGowdUg3aXFnQmxRbGphL2ZQQXVNZCtLcHd2bnhYWUJja01uZGc4?=
 =?utf-8?B?dU1Cay81SVIrb3dkRDcrVURLZmt1ODZudm5aR3dVZUxsaGdpcXV5QXpRald0?=
 =?utf-8?B?RlViRWhLYUJXQ0dta05OYjhaakcwd0N5T09YN1Q5QWJhaGNWcXZSeWp3TjNG?=
 =?utf-8?B?cE5Jclp1WWl5UjBqc2FORVdtQlNuRG1KeXNDWTViSXBEd2FZdDhJeFd3MGVR?=
 =?utf-8?B?cUJqZVNvZFlkc08xVncwekZHQVRyK0F1dllqU2dxZVpDbjZkZDhWelFwSCti?=
 =?utf-8?B?bFRDRDhaTjVqNUdFaHZKWXZDM0szcTNNWXB3NTB6OWtIdmp2andtdU1jc2t2?=
 =?utf-8?B?RlNxWi9SMlFvb0lxUTVwaHVCMW1qVGt4bFEyM2IyOWlLUWNYZFpCcXROODBk?=
 =?utf-8?B?WEdaaGtFclFqQWo4cERDL3lBNm42WWRmWGE0T3hhc2lDOXpmRFVrWG5yS00w?=
 =?utf-8?B?SllLQ1dnNGhPK3ZyWVFyR0h6VkMzT0ZNWUtNUkN1NUVHV0VoS1lEWi9IenNS?=
 =?utf-8?B?WGhJcnVzUzE5cDdXSGxRSlVpR3ZkeCtJcTdaQT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 08:24:18.9088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 922bf963-9926-4daa-05ab-08dddb0bf6e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8299


On 12/08/2025 11:30, Hari Limaye wrote:
> Hi Ayan,
Hi Hari,
>
>> On Thu, Aug 07, 2025 at 06:45:28PM +0000, Ayan Kumar Halder wrote:
>> In case of ARM_32, all of the RAM will be covered by a permanent contiguous
>> mapping (where VA == PA) and there will be a single heap. Thus, the memory
>> allocated from Xen heap uses PGC_xen_heap.
>> This is similar to the scenario described for
>> "CONFIG_SEPARATE_XENHEAP=n W/ DIRECT MAP OF ALL RAM" in common/page_alloc.c.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
> This patch breaks the build for ARM_32, CONFIG_MMU targets due to
> multiple definition of `is_xen_heap_page` and `is_xen_heap_mfn`. The
> pre-existing definitions are located at xen/arch/arm/include/asm/mmu/mm.h:30:9

Thanks for checking this and apologies for the build break. I should 
have tested this before sending.

I have sent out

[PATCH v2 0/2] R52 MPU support (for "Third series for R82 MPU")

This time I tested 
https://gitlab.com/xen-project/people/ayankuma/xen/-/pipelines/1982700286 
<https://gitlab.com/xen-project/people/ayankuma/xen/-/pipelines/1982700286> :)

- Ayan

