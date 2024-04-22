Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 301A48AC8E0
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 11:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709829.1108822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rypx4-0005Fo-5z; Mon, 22 Apr 2024 09:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709829.1108822; Mon, 22 Apr 2024 09:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rypx4-0005E3-2v; Mon, 22 Apr 2024 09:27:06 +0000
Received: by outflank-mailman (input) for mailman id 709829;
 Mon, 22 Apr 2024 09:27:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QqOW=L3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rypx3-0005Dn-2H
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 09:27:05 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7983f054-008a-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 11:27:02 +0200 (CEST)
Received: from CH0PR04CA0108.namprd04.prod.outlook.com (2603:10b6:610:75::23)
 by MW6PR12MB8707.namprd12.prod.outlook.com (2603:10b6:303:241::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 09:26:56 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::6b) by CH0PR04CA0108.outlook.office365.com
 (2603:10b6:610:75::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.33 via Frontend
 Transport; Mon, 22 Apr 2024 09:26:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Mon, 22 Apr 2024 09:26:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 22 Apr
 2024 04:26:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 22 Apr
 2024 04:26:55 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 22 Apr 2024 04:26:54 -0500
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
X-Inumbo-ID: 7983f054-008a-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLdD+ype6py5gVGaoicDhsHOAMyxdqvVvg6869bcMWk1nty+smzTXDrVWDYoEirjECMZzgfo8Z8OPpl8YdxAWhNcZTUc/FbYomvx2vXaz1SaaFDJ+TS+MfaDUv5zDNL7rxmik2scHmKgleE+oo6CNvMbSUgSNU9LokT90+mk9DCYzAuZjDo7+PkfxktdNxeE8oMtnuI8XPtPbUeUBa/SBXDTYhzgGNy1HuTH0l5Il5MuPJP+VKqil8Bh1/HpQKOXRaolZGUqhkkq71SFw+Rt2iK0Bcfgo1V35zTcCYtd6SMd2Nku2uIuN+jkS/6GhsxdhlBWL+sCRkR7FeH9NMcsyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tSWwnfVAXAPalkjwBuZS0h5iZQym3eXOTw9h6kQ9Ts=;
 b=BCyF/ecnTq0863acp/nGETFBvMUFakRg5THvzp+vHgjSBTon7DN2EkF6GSilXfkGYDSgwescM3o2s0tIA7ymudqtYYB6N+JqWejVuSaqTnOo6CcIb7wFX/VFkzHjkSmEKMTmWPeX2mieSiC3DpJPEhnMFI7JInDWRFM3r/S7dkU1aEfFuFCAk0oIv5vSyj1H8DYFtStD6yojL5pg0edxPl3qP1OKaglVxYNCpFkWLdsO7DwafPS2ZwYulTS7TORur5xwu6YmrTq3QHQ9LAbO4zv0EdBcatBoLnAFSk4AwWaqXllPnRC7liOCw3sdbq56UkhOAwYwzLdglSQiB4tFdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tSWwnfVAXAPalkjwBuZS0h5iZQym3eXOTw9h6kQ9Ts=;
 b=mrRQVmGPAEvv6bz0p8BLF1oMLgswZHcJN8qOwwm1gQ5g+z7ea/fZSmwegFodrJa8bHFVpe5H8f84sMHYA/Czs43S30TyEtK4v+Y+Z7N1xyCgG8+Ssfji9S3RDpaVYtPvxW1mSeyuAn3gl+GoPlEQXbt2zdoXnOBg4o0KJxjEqK4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f7318988-85fa-4a40-8242-67db3305a397@amd.com>
Date: Mon, 22 Apr 2024 11:26:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] xen/arm: List static shared memory regions as
 /memory nodes
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240418073652.3622828-1-luca.fancellu@arm.com>
 <20240418073652.3622828-13-luca.fancellu@arm.com>
 <a46e7e41-cbb8-44e8-9c69-533b949f6a4a@amd.com>
 <9A107B24-E606-4926-BE1C-6FC0C6E86CF7@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <9A107B24-E606-4926-BE1C-6FC0C6E86CF7@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|MW6PR12MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba89bb8-7235-4920-1b7f-08dc62ae5a84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDQ5Z09NcDJhYWJYQTU0L0NuVUpsTDAwYXU2WkdXZWdNMmczQUYyYUs4UU5p?=
 =?utf-8?B?TXBSSVN0K25ZQzdYMmlvSENNZFMrS2NCSENWWnpBaXg2Y09Dd0w2c0c5YmdR?=
 =?utf-8?B?U2h6bDB0UHJIZWVMTmtCU1dlSjdab1FBZnpWR1h3aWNPRGFKTTJuR3dBV0Vt?=
 =?utf-8?B?eWxBTEtMTjFCemxrSHVHUENZUWpSYUloeEtOQ3BlVVhudDRhT3I1d1hWUG5k?=
 =?utf-8?B?dStIeVlaQWt2czBVZlRUK2xtSlorUFlKdmFPc3lTU2VtQWxwMDB2MVdBNkkx?=
 =?utf-8?B?b01ob3VNbXNHbWFpOUx6a3hVMVBzMllUekpkUysxMHJpMUNOa3MrSkl1K3Fh?=
 =?utf-8?B?Y1k2aC85TVFQS0xOYytJdUVQYjNlYVJ4dW5iYzMxVEdtYTF2Rk1vT1pCczg3?=
 =?utf-8?B?NU90ZFJRcHN3OWZoTklGbWdJN25uWk5hSjlBaHg1YXNyVWw4MnYvZW5xN09l?=
 =?utf-8?B?OFg4N1k4V2Rrb3BrcERhZk1McTY0N3hiQS82Q2pkT3hXTUhLc2FDSFlld3NT?=
 =?utf-8?B?K3pyYWtnc2pjeXg4OXJxZUlGQmVTYUZucUJWM2xOWnZ6LzMwd3JWeElQMU9v?=
 =?utf-8?B?UnUzVDBtTTcyUjJPZW9FS1lUY0xDS1YyeUJyaHlTblU5TmYwRVFPR05kMm9q?=
 =?utf-8?B?SlVlaitiOFFJMzNWVE8vTkZwc3hIWnJsNkp6dlNRM1NmOU90OHNYTjhiR1ZF?=
 =?utf-8?B?L3U4WDdJMkloMEZ2TG4va2FRZlRhQmIwd1NDd3hxeWd1RkNYeC96eU84Yjhx?=
 =?utf-8?B?cTJvMEhwdDhrZ1lEM2tGVHJqWG52T3dXckV6a2UzQUUxdUtITWt0cTZwVHgz?=
 =?utf-8?B?aFNJUGl3RHVyS3BMaDlkdzRsWkZlbkRTdmxLUXpzVndJNzd6OHRrS0ltZllo?=
 =?utf-8?B?c1JqaVlSOG5CWU5yWG80bFp6ZmtJNk9lTG9JWit1VW1DQW5tb01ZUG5qd2x6?=
 =?utf-8?B?WFFWTjZ0aHN3QWt4WVVYUnJwZXlqV2R4d0Z2dWRvZm10UUFNbXRMUkI0Nk5v?=
 =?utf-8?B?TFdTK1hZdHFvaStDYzJUY08vd3BuRUQyWm53SHAzTmpKaDdWZm1xMFJZSitq?=
 =?utf-8?B?TVh0Z2VtZ0wwT3JTZ21yeFpkdFhvOGMrRVlrZkRzTSt5TmpyS0VXa2JMem5E?=
 =?utf-8?B?b1l3UFV2VHVnZFBQdnJnRWRHTzNWdEpVWFRHUWRORklYWmptazVjQXdsQWFK?=
 =?utf-8?B?bVJCdE1YYXJmN2ZZNFh3eHZ3NEJkOXVzR1RwU1NxRkdleW9jSkZxcWlMRDdT?=
 =?utf-8?B?MTJIOGc0eXBDWmhpcDVjemsvdmhVTzl5blp2MWRBL3Z2MXkrSjJ3RmplVjE2?=
 =?utf-8?B?U3d1MmZJdnN2c3gyaGJvN2czdVFEczhkMmVZRVVDWkhXQmlsdUE0bUtEZGJw?=
 =?utf-8?B?VCs4UXcyd1MyOGNPZzBqeHNldHk5ZE9yM2MxaFlsYyt0cyt3aU5UMTB1d0la?=
 =?utf-8?B?Q3FpaXRtb2cwaVYwN3FsQUlnQUxSRzhPWGhWckZ4a2NMT3hnRG1JS3FhOHFy?=
 =?utf-8?B?WHdBcmRUSWxqM3o4SE1XTVAvVnMvRDlmV0ZPcGtNTHZiT1cxMk1uNWt0NmQ1?=
 =?utf-8?B?MXZvdVZlV25NQ0hXNE13K2pBK25DbWY3cDZyZHRiNlF5eHJiNmZ1YTlwZ0l1?=
 =?utf-8?B?aHV1UXNWZXd4ZkFPVU43dkpTV3NyMlgvUGN6MEVabnRXWWdIMlBwUXREZ253?=
 =?utf-8?B?cnRjZjA3VDZyQXBEWDFFdEFnd3haWnpaZmY0OXNWMkVGQlVSUzJJUGZyQ3hu?=
 =?utf-8?B?dVBGcWlPWGJBNC95RThIakt6WExsSE1ESEZDd3E1YTRHRG9jaDkrcWRDVWVq?=
 =?utf-8?B?a3lsMld0VktENzNjT2ZOZm81MnZmRzhybmFzcWE0bVlrNzU2dGNWNnB3UWU4?=
 =?utf-8?Q?Sx2Jalfga19Cy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 09:26:56.1581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba89bb8-7235-4920-1b7f-08dc62ae5a84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8707



On 22/04/2024 10:07, Luca Fancellu wrote:
> 
> 
> Hi Michal,
> 
>>> +    for ( cells = reg, i = 0; cells < reg + nr_cells; i++, cells += reg_size )
>>> +    {
>>> +        u64 start = dt_read_number(cells, addrcells);
>> We should no longer use Linux derived types like u64. Use uint64_t.
>>
>>> +        u64 size = dt_read_number(cells + addrcells, sizecells);
>>> +
>>> +        dt_dprintk("  Bank %d: %#"PRIx64"->%#"PRIx64"\n",
>>> +                   i, start, start + size);
>> i is unsigned so the correct format specifier should be %u
> 
> Right, should have been more careful when copying the code from above
> 
>>>
>>> +void __init shm_mem_node_fill_reg_range(const struct kernel_info *kinfo,
>>> +                                        __be32 *reg, int *nr_cells,
>>> +                                        int addrcells, int sizecells)
>>> +{
>>> +    const struct membanks *mem = &kinfo->shm_mem.common;
>>> +    unsigned int i;
>>> +    __be32 *cells;
>>> +
>>> +    BUG_ON(!nr_cells || !reg);
>>> +
>>> +    cells = &reg[*nr_cells];
>>> +    for ( i = 0; i < mem->nr_banks; i++ )
>>> +    {
>>> +        u64 start = mem->bank[i].start;
>> ditto
> 
> Will fix, here paddr_t should be ok isn’t it?
yes

> 
>>
>> Rest LGTM:
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> Thanks, I will send the next one shortly.
I don't think there is a need to respin the whole series just for these fixes.
You should wait for the committers opinion.

~Michal

