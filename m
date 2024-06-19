Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7E890E9FD
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 13:45:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743675.1150615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJtk6-0002KE-88; Wed, 19 Jun 2024 11:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743675.1150615; Wed, 19 Jun 2024 11:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJtk6-0002IL-55; Wed, 19 Jun 2024 11:44:46 +0000
Received: by outflank-mailman (input) for mailman id 743675;
 Wed, 19 Jun 2024 11:44:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5jEq=NV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sJtk4-0002IA-FZ
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 11:44:44 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 506743ab-2e31-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 13:44:41 +0200 (CEST)
Received: from SJ0PR05CA0196.namprd05.prod.outlook.com (2603:10b6:a03:330::21)
 by DS0PR12MB6463.namprd12.prod.outlook.com (2603:10b6:8:c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33; Wed, 19 Jun
 2024 11:44:36 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::7a) by SJ0PR05CA0196.outlook.office365.com
 (2603:10b6:a03:330::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.32 via Frontend
 Transport; Wed, 19 Jun 2024 11:44:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Wed, 19 Jun 2024 11:44:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Jun
 2024 06:44:34 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 19 Jun 2024 06:44:32 -0500
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
X-Inumbo-ID: 506743ab-2e31-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPsCyo/hTSKFLicXB9z+ddsRZgpsDYHKLh8wwc6QJ0ZvxpH1MeEuL95gsICqpuSeutEa4SwYkYikX1qLEY9VNOZRMIz8XbpTA79MmTCqcBFP/la5HccSstpqkyeB/GeUZcLo83Nnl6MQyUEGZK3JQsuvoJvh79U1gCCmuRwbVqKfa10vYDltSMQNKXXUv4tIl0aDGOLK6JxxDByZt73xwRjlF+eDYP6TfBtksxrr6FcwwLM4URCdEm7eeYOzdvDHwKkvafYb2vgrj4ZQxXefoZIf7FPav2LiZAbMs50ElWAuLXl8qznDL/sHdrLvyqRMXl73LyBtB/j/VEfaq9eJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leMPA/wXFypHYSB6ShGF1QFdxJ3xOOpa+MO6Y5fM4CM=;
 b=XVSIR/GY7AD9kOK86MFjVjy/44wrx+BsSJ3OZ13L+m7Uyu4v1vUi9HAUqFs4M052gFhJ24F9Dus+Al1cFaRccNRQ0wTGZUlmsJAA+545XMgyFOrquwC/LUmWKiuxf2iqL4VoDNX7j/b+lGdm/mUqyMdb7bH9h+mo6eCabR8h1gcawzlItfxkOCStEP9900aa1OuSdvm7RBgGJ4aHwFN781pDvwBq62XJpK39zx9l+y8aMBGHFG/hPWLzw6TqM0LxsPB5FeO5K/kYmf/b19B7MbkbUVU/UTVdcMLMGaK6UOjn/PXx1pbp0qag3gD/HJvdmrhrvKGyx2zUKcZt7ZBvXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leMPA/wXFypHYSB6ShGF1QFdxJ3xOOpa+MO6Y5fM4CM=;
 b=v5T6uc3FCa30yiUFeTbzyA4YXTYk1/8n0XaypSZ3Jdde/uMwkzRwomooNNoS4PpYe52PfedNFT/PVCf9E8LcGUwFga9Lsq/I6rwhLcV271TPMjvhB1K64adosFdWbQhdD+Jg6lxukOlgk9OKlYQDgS9jhtY0hLj5OZIvfTh5dkk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <66a5a0ec-b3df-41a7-9ba6-955259c7a45b@amd.com>
Date: Wed, 19 Jun 2024 13:44:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen/arm: static-shmem: fix "gbase/pbase used
 uninitialized" build failure
To: Julien Grall <julien@xen.org>, Oleksii K. <oleksii.kurochko@gmail.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240619064652.18266-1-michal.orzel@amd.com>
 <8C571FCD-3EAF-40B5-8694-625880176F8B@arm.com>
 <691f0bebe10e09f8fb46d0816fa20c61a9d9d3aa.camel@gmail.com>
 <4213a7b9-b2f8-4e3d-a63a-e8b7b53fd642@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <4213a7b9-b2f8-4e3d-a63a-e8b7b53fd642@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|DS0PR12MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: 2715500c-178c-4744-b895-08dc90553118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|36860700010|376011|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dG43Q1ovSmE4dVJYSkdLcTZoZnBNVGJDU0tBeXA4UXJsTHBvK0l1Z25xZ2xU?=
 =?utf-8?B?VEJ1ZldaZ2VVS2N6UHdpTlhCS3lCa1FJQWtBa0doWEFJVlphWk1EbU9ub3h4?=
 =?utf-8?B?SUVqbTRGUXlGL2U2Umdoc3R5WG1TU3phSXRYVUlQYy9URGR3Y243UDBqL096?=
 =?utf-8?B?QjY4WXl3cFVpZmlPZ01YQUJLeitubU95MkYvaFd0MzdOemo5K1g0N0VucEJy?=
 =?utf-8?B?OTh6YjVCYkZ0SUplcnZocDZYeXBKSVF1MjRtUitRcXpKRzB2QmczdVFic1Ny?=
 =?utf-8?B?UVpwbStrbUJQS0VyN3BoRThmckkvYUNEMU13UHA0ZzVoeEpwK3M0M25scjds?=
 =?utf-8?B?RTFoSTROamdKVjZ6YVZPbitGdEkwMDRFK3VabXp4MEwyczRwTldkOVJSMjBx?=
 =?utf-8?B?d0xPVnQxVXZvbXNsQXJCbUcxV3d5dEdRL2xPUTJkWTkvL3h0NzFGanQ0c0hl?=
 =?utf-8?B?TndjY3loTUJvdFBvQmdjcEtsajNjVmZITDlZK1NyN3Bkb3pTOERKK2xKODNV?=
 =?utf-8?B?d0toR2FGQitPYUtqTnh3Q1NmTnhiWi9FRkxIYnZUcUsxM2RRRUdlNU5QdE1s?=
 =?utf-8?B?a1BBZTI2TVdoOXYwaHBOaGFCa0IyYXdlekxHdUdXWHh3SURuaVRvVnlqNmNk?=
 =?utf-8?B?K3Q2ZEJuWm13b2t0ZWdramNOWFV2MFpiN2RlV1lhNndncC9TNGhJYUlpZ2di?=
 =?utf-8?B?UEdRTUd1SytyUWhNS1p5SnBPR1RvaE5EME9wNitWMVFiNGpHRVBDOUVJdEhK?=
 =?utf-8?B?MENRcFZ5MkdUM1UvSmhialFqaWh0L2hlV0huYlJwSUlLalVGWEF0KzJ2cFhv?=
 =?utf-8?B?ajZEK21PY1VteUhTa3pWK3B1UlgyNVZFd2c5WktCcjNmb2FCTHpCNmdBSTUr?=
 =?utf-8?B?dXZsV1h2c0h1SC9MYUh5ZHlGOFVMWTRiY1QrZjEvTTRlTXdRNTMwYjc4V3NY?=
 =?utf-8?B?MzN6R3ZYcmgrV3FYSXY4RW1lY3Z5VEI4d1pvbGtOMk9YbVd5bFd3eXVoL2FG?=
 =?utf-8?B?MENxUHo5bEMzYUFOTTJJM1RZNnIvbEY1VU1XYlM3V04wcXRWUXdVT1BhNGtC?=
 =?utf-8?B?cVN3L00zaWJwT2VSTXQwcDVqOGhjZFo2M3daRUVUWFF5alNSODN2eVNUb3NX?=
 =?utf-8?B?c3ZoZVd0UnM3cFA5b0JBdmp3ejVNQmMwY3ZwaTRMRzRmTVpkQlFNLytkYzNq?=
 =?utf-8?B?cW9hUDJ3enBnclNZL1E1emlaalN6NThMald2eTRHalpreVhVM1ZSQzRmU1ZC?=
 =?utf-8?B?NFM0QTBpcU9oUXY1U1h4QWNOZE00MlZBQlJFeWJkZXhqN1IzQkx0ZklRZHE0?=
 =?utf-8?B?cjBwWDBmS2RTaHl0TGFnclhXdllycGVJQ0g1MDFtQ0kvWjk2L3pqaWFmdVFI?=
 =?utf-8?B?V0U4M0dSdDIzaXNOMjlLeFBHcmFMOUZVbzhOalhROVRSaVFHeVdvOVlIVERy?=
 =?utf-8?B?dHNObDB2MDFJV3JlT1JRdlVtOHY3SFRWTHlJTGZ1Yis2WGJPcjJOdUxpWlVF?=
 =?utf-8?B?d0JoMVVaL0E2WGZUeUd5MjZnWWRpZHlQVFk5dkkzcFhZVHBubnpVQVRWbDFh?=
 =?utf-8?B?NGJzeEJWRVNqTGlKSzMxOVR3S2creEU5OVdWLzdiYjVPaDhOWC9DMEtzamsv?=
 =?utf-8?B?RHdyN2dpMWRMbWZhR0U2a1Y4REQzTzNBdmM5cExkZzFlSllKc1lhOW53OUNF?=
 =?utf-8?B?dlZVMkVTNXBhQ1FpbmhFdDNwTFE0emIrc1hTRzJaSTlSN1lrdkFkVFlnU0ZY?=
 =?utf-8?B?eEdMcFl2UWJMR2lyYmxxTjJMWHF1ZFo3ODFvRkg2b2dOMTBIK2ZoTFhPQXFs?=
 =?utf-8?Q?vEI0VtcMJp9fCSnyLoHwF6ltezV+rRmFQgLVg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(36860700010)(376011)(1800799021)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 11:44:34.8685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2715500c-178c-4744-b895-08dc90553118
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6463

Hi Julein,

On 19/06/2024 13:37, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 19/06/2024 12:19, Oleksii K. wrote:
>> Hi,
>> On Wed, 2024-06-19 at 09:02 +0000, Bertrand Marquis wrote:
>>> Hi,
>>>
>>> Adding Oleksii for Release ack.
>>>
>>> Cheers
>>> Bertrand
>>>
>>>> On 19 Jun 2024, at 08:46, Michal Orzel <michal.orzel@amd.com>
>>>> wrote:
>>>>
>>>> Building Xen with CONFIG_STATIC_SHM=y results in a build failure:
>>>>
>>>> arch/arm/static-shmem.c: In function 'process_shm':
>>>> arch/arm/static-shmem.c:327:41: error: 'gbase' may be used
>>>> uninitialized [-Werror=maybe-uninitialized]
>>>>   327 |         if ( is_domain_direct_mapped(d) && (pbase != gbase)
>>>> )
>>>> arch/arm/static-shmem.c:305:17: note: 'gbase' was declared here
>>>>   305 |         paddr_t gbase, pbase, psize;
>>>>
>>>> This is because the commit cb1ddafdc573 adds a check referencing
>>>> gbase/pbase variables which were not yet assigned a value. Fix it.
>>>>
>>>> Fixes: cb1ddafdc573 ("xen/arm/static-shmem: Static-shmem should be
>>>> direct-mapped for direct-mapped domains")
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> I have committed to unblock the CI. But I have some questions on the
> approach. I will ask them separately.
The CI failures as seen in:
https://gitlab.com/xen-project/xen/-/pipelines/1338067978
are due to 2 issues. This patch solves the first one. The other is related to Henry's xenstore
series that without a corresponding Linux patch, that has been merged into mainline, causes a regression.
And thus all the dom0less PV tests fail. We will need to revert the xenstore patches for now.

~Michal

