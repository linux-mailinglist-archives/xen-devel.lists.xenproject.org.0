Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 622418C20A9
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 11:18:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719616.1122442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5MNh-0008P8-Mv; Fri, 10 May 2024 09:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719616.1122442; Fri, 10 May 2024 09:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5MNh-0008N9-Jn; Fri, 10 May 2024 09:17:33 +0000
Received: by outflank-mailman (input) for mailman id 719616;
 Fri, 10 May 2024 09:17:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rhO=MN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s5MNg-0008N3-SP
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 09:17:32 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f3f8b27-0eae-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 11:17:29 +0200 (CEST)
Received: from MN2PR06CA0027.namprd06.prod.outlook.com (2603:10b6:208:23d::32)
 by CH3PR12MB7642.namprd12.prod.outlook.com (2603:10b6:610:14a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Fri, 10 May
 2024 09:17:25 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::5a) by MN2PR06CA0027.outlook.office365.com
 (2603:10b6:208:23d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48 via Frontend
 Transport; Fri, 10 May 2024 09:17:25 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Fri, 10 May 2024 09:17:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 04:17:24 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 10 May 2024 04:17:23 -0500
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
X-Inumbo-ID: 1f3f8b27-0eae-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHTSkPXUlMFH8qve5zWU2dBDrvX11MwR2iGINpbw4HPzOwiIQnt6E+BH6cXIKEzDF57WSvyE0HBJdnEwLWmueH/Om+25w08SBSuVvBlHNIJIeNH8v4wlwgacrFNq352zuje4GvtUkTW7vTvXyEBjL0Pp8fIRuOXfsqg/v0PqC6USc1npWE7SLr+/pJf2SWGIBekTzi+VjcotKGqfaV7e7K9X+yxJQdpLPCj3bu3Y9bHUtuw7Mcx6HK30SxoJFynjU9+08IyGJ4zZJvlcmlIY/tt08hhvPHBPwMsYJyHtUFAgYjjVIs8nmh8rD7VzjbK6ioH7D9mVfvz4Lz3D3LYlSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lj+U8YqWUH/kMLeIlkE57KNm9IA8QVsOtwHc4YUjnbc=;
 b=Q9EvgGhsJ+koIWWVzLR7f2WA3SywTeZwOyzb5vYC2UeKGN7PouJaxwGv4Ai6EiR07u513OkDsRVaz4SN0duV5S6dlCRyzhwVDamI9u9tdVK/0q5K89SC5YWDOhdUHqNGP5AGv+5mJ0WABNLKhiiZCOg/k5AiCkmcuqZJ1T8WLkCaNohrRZn95yCfHeaZpDLMy+U4tNMnOTTedt8wsbCUIUP02NCQyI7EMFBSmDcT9KRW+o/dDXKhO7R9AbUMsgx9wHbHUohbdl8mfSHY/OQcllvy1uIUB92W0E8RCzVpyrz/AFs7YT8TRPqKb6bQIV0nO0hKVrjBXqT/vVfWSBJvLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lj+U8YqWUH/kMLeIlkE57KNm9IA8QVsOtwHc4YUjnbc=;
 b=VDCBChkBDReMc5EPL1qYR4ZdGCafCYau2bONPGTmflSLtcIm5c3wSUCkJSHHDQ+2Hc5Ih7bGPwsXdh/qGqZIWuxepJMmOfjSb8zfFkxYdXA4U1TvbOAJlJaKHG9MyfOJc0+ioebtZdd/fYetAWObkZi4eq9DdICyf0VSW938Ugw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <cb496741-dd76-4536-818a-cbfdbd496b0d@amd.com>
Date: Fri, 10 May 2024 11:17:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] xen/arm: Implement the logic for static shared memory
 from Xen heap
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-7-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240423082532.776623-7-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|CH3PR12MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cce3d4c-d0f3-4ac5-2667-08dc70d201ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0k0Y1JPa2ZrVk4yc1BueVFVVm9zaDZhUjMyc3ZvY1dUZml1SlExY3ZObzR1?=
 =?utf-8?B?VjB4ejNnWFVpVDBwQXZPV01LNWZHMVpIa2R2Nk96SWRHbEdQMzRTZGtNdzBW?=
 =?utf-8?B?QXdnTVlabllDdUlYTzdMN0F1VHF5TmIyWWljQTFScW5WNTA1WG1MVVZMWWFS?=
 =?utf-8?B?Z2swRTF1dE5kUm9aZTB1VWk0eDlhdm5acXF2dUI2SmM0KytielRpM1NFZVhB?=
 =?utf-8?B?d2l0UVo5R2pIUnpGQ2kxcDQwZ0ZnV0pIM2pkbmlET3IwSjdnSmlZTkdGWERG?=
 =?utf-8?B?ajMwTC9hWkM1TE1zNWQ4K1Z4bEtDNzJ3ejJQRWh1bDZGc05zbERFTkhvSW5Z?=
 =?utf-8?B?U0hIajVBU0pTd2RYYWovaXNDZWRrTzVYZkdSK1c0akpBaEc2SnNNRDQ2NkRa?=
 =?utf-8?B?ODhCVm11bEdkeVdxMFVhN3BVOTJpOHBuNnBLY2hsWFY3QzhCRGxwd3ArejFD?=
 =?utf-8?B?cUl6R25scDZRY1RkVG8yeWFwTXUrK1QyNk1Wa1RPTUN3SVRIKzk5U0FMc1Ux?=
 =?utf-8?B?TkdTcFNHbGw1RzdkcW1ZZHNlaHlXMjd4aGFDM1NWMDVObWxKZWxEQVZKM2du?=
 =?utf-8?B?ZHlCL2NwWkw5MnlPcnArcG1sZC82Uy95S1dYRThHVllnakZyb3Q3bGFDc3B1?=
 =?utf-8?B?VzQ1UHJBOC9FMUtQOG5lTnpTWW45aUFKRWptSUY3U3RvOE4zZnFuVUxmaFNV?=
 =?utf-8?B?YXRtMlZUcm1VaTNtRVM1Rk1zOGhNZUFwMlJhM25pcHJIcEJsNmhXSkRCblpx?=
 =?utf-8?B?UTQwRWY0RFNhajFuK0tpUm5aUmVsZDVzd3ZHTlBPNFNRUHJxMTBsS0pXbkNB?=
 =?utf-8?B?NjVjTnRTNlNieCtGSUQvUTczSGlIWjJHellSY3pCKzZTeXNydU5KTnluTUVk?=
 =?utf-8?B?VHh1KzQrUDIvaTFhVm1VY2trYTFycnRnekxVUGVIQis4SmU3dGhmQzNhTUFi?=
 =?utf-8?B?U3FISyt4cExnSlMwNUwrUjZxYnorQnJXRGNMbzQxejNsUWpDTzR0OHU0aDFB?=
 =?utf-8?B?SzJsbGRVRENDbDA3YTVSTVliMzdzYW40U1ZFYWowY0RjaWY3bW1kNnZhRG9M?=
 =?utf-8?B?RENVdmdWbXovdTMwRUU1NERQY3JHU2VyNDRtMUJ0aTlLaFJPZ1UwUEN6U3h0?=
 =?utf-8?B?TGJFR1o4cEFKUE9aZUVYd2VacS9ScTJmWlh6bVRRNCs4TUNOdjNGQXRSLzVN?=
 =?utf-8?B?Sy9Yb1ZJNU8wdVR0NURxaWhURVhtRmdxQ0lxTHNiNnlwK2FGV3B0aWdCK2Z1?=
 =?utf-8?B?MWFJdGkvRC9odmlMMFU5VE5kakV4VmU4N0FTS2lUVlVrQjR6c2xEbFNvb2Ji?=
 =?utf-8?B?dWtXMXIzdE85NkIxcWQ0L2JLWXZuVXF4Wks0TDc1TjZsUXFGbkNnVzdXckwx?=
 =?utf-8?B?Z2xlcjdPZ0UwOC85NnZJbWhDMXc1eEdQTUhMZnZzTUlUNG9LRExQQUd2TE9m?=
 =?utf-8?B?MDNEYkxGUXZYNktBOFVoRHdXZm9SYUFVb2tMQ1k3ck03VmdIMm52MFVJMUV4?=
 =?utf-8?B?SW9pNG9paDNPZmYxWmhuYVV1Ylg3QXp0Z1FJaHlyTTlnZzZtVUIvZ3c0bGZP?=
 =?utf-8?B?S0RoclVSL3VmOGp1NGp2WWFWQzZVbitDeU5OazkxeDhzZGo4RlIxY2IyUHZW?=
 =?utf-8?B?MTBUMGozRm9UWVBxQUZuNElIdGhYVUxMNmg3dVVvalZkUXYyQ0VwQ08reXBH?=
 =?utf-8?B?ZG16K1pDYmNhbE01clZuZXp2ZUNReFFYdXN4YnJoVE9lbFVxSWU0a1p1NjJC?=
 =?utf-8?B?cWlna0J3TjBzUDI4WUEyd3JkWldjckt5QU1qUDRyUWw2MXErL0lEbkd4S2Fk?=
 =?utf-8?Q?LSKUY8hZ+NzhYmu4EkPVPxbswS1aJ+mcUzMQw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 09:17:25.2735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cce3d4c-d0f3-4ac5-2667-08dc70d201ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7642

Hi Luca,

On 23/04/2024 10:25, Luca Fancellu wrote:
> 
> 
> This commit implements the logic to have the static shared memory banks
> from the Xen heap instead of having the host physical address passed from
> the user.
> 
> When the host physical address is not supplied, the physical memory is
> taken from the Xen heap using allocate_domheap_memory, the allocation
> needs to occur at the first handled DT node and the allocated banks
> need to be saved somewhere, so introduce the 'shm_heap_banks' static
> global variable of type 'struct meminfo' that will hold the banks
> allocated from the heap, its field .shmem_extra will be used to point
> to the bootinfo shared memory banks .shmem_extra space, so that there
> is not further allocation of memory and every bank in shm_heap_banks
> can be safely identified by the shm_id to reconstruct its traceability
> and if it was allocated or not.
> 
> A search into 'shm_heap_banks' will reveal if the banks were allocated
> or not, in case the host address is not passed, and the callback given
> to allocate_domheap_memory will store the banks in the structure and
> map them to the current domain, to do that, some changes to
> acquire_shared_memory_bank are made to let it differentiate if the bank
> is from the heap and if it is, then assign_pages is called for every
> bank.
> 
> When the bank is already allocated, for every bank allocated with the
> corresponding shm_id, handle_shared_mem_bank is called and the mapping
> are done.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

I tested this patch and it resulted in assertion:
Assertion 's <= e' failed at common/rangeset.c:189

I checked and in find_unallocated_memory(), given that start is ~0UL (host address not provided),
start + size would overflow. Did you test this patch?

~Michal

