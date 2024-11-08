Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D709C26CF
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 21:49:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832954.1248262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9Vtz-0003rJ-9o; Fri, 08 Nov 2024 20:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832954.1248262; Fri, 08 Nov 2024 20:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9Vtz-0003pH-7B; Fri, 08 Nov 2024 20:48:19 +0000
Received: by outflank-mailman (input) for mailman id 832954;
 Fri, 08 Nov 2024 20:48:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8BGf=SD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t9Vtx-0003nq-9U
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 20:48:17 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2413::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3866bc3-9e12-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 21:48:11 +0100 (CET)
Received: from BN9PR03CA0787.namprd03.prod.outlook.com (2603:10b6:408:13f::12)
 by PH7PR12MB7795.namprd12.prod.outlook.com (2603:10b6:510:278::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Fri, 8 Nov
 2024 20:48:07 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:408:13f:cafe::cc) by BN9PR03CA0787.outlook.office365.com
 (2603:10b6:408:13f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Fri, 8 Nov 2024 20:48:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 20:48:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 14:48:06 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 14:48:05 -0600
Received: from [172.31.40.161] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 8 Nov 2024 14:48:05 -0600
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
X-Inumbo-ID: c3866bc3-9e12-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMzo6NjJmIiwiaGVsbyI6Ik5BTTEwLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImMzODY2YmMzLTllMTItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDk4ODkxLjI2MzkxNywic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkmNC9tdt7stt2I/izD1rlTV9Rjh/2dVC5ir2Pe8lHnkdXC2qiu9pYa09vHJdU2aQSTXkInHNeSJCFrcNXevJzRnnt4fIQmIukhnahyMMEuiBQV2PuED9QZA005jU5Xb17BccBJA+X+jKFzBE0M3XKCygi4NnD4CRNB0GBzPLvqMgMZcYwkbIE9rHgAMy7KGbp57OgmFpEHa/2yHEbvDVZAMnWnVyPUlF1degqm1ce4ddy16oOecyyDSVXeTgNO2TYsVCArysdiXM/pxdZlOyeVdQLcchy9nkq08lwpg8J2xKsNW/4XAp4jQQxRkKjlgKVd9vGjcEJaJt5Creu2ATw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOVogaPg211amCTXnanFw5x+1/S67p/VuCo4B1auadI=;
 b=pN7ldTgv4M88s14OxJ+xPCECtoa65xa9qDf5JCoPhKdZ1Q+eVPL/NH3FX//+4FV+8ZsAodSIryW3WAYoU/xVZ4zn9tt/U4tdOFnjUjK6wm2t4lzcARA1a8lJ6yhA3PL6zIhRjjbIdz3qhqaZnOgmzem8qnQTX0rAc0BRoUW4fUlqQZa7SSouZwqJN8ouU/hhbiHFbbKA1D09zlWrsM91JHCs3NC1gcn6CCjhtCKSAEOHM6HQk40fXG78SEei7gT+GRnVPdvimN6YcZ0MK022gkQIRN1RyTGrV3EkThlJXrPGkjtWQ2uSMUNTdDsyciABYu6jCm7Mmwem0jdhZOYFmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOVogaPg211amCTXnanFw5x+1/S67p/VuCo4B1auadI=;
 b=uSfsIgeVhc7MyorknSNxDggHON2OoQx6DHltZO8z6aYvqOeX8p7yauy5WA+mJG9AnO+MzbAlFL3TTDT3kwAIPgAIdewt9GpbFFA4FsP26UwWffC22WFnuiBIZARvcadI5QtUiBYptCB/KqDJ1x1/c7WzbpNkI7eslR+n94KFS38=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <54d9913f-55ff-46a8-b43c-2e20c5640985@amd.com>
Date: Fri, 8 Nov 2024 15:48:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] x86/boot: add start and size fields to struct
 boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-10-dpsmith@apertussolutions.com>
 <bd4fa542-7e05-463d-99d7-b5c57781a56e@amd.com>
 <c8d690f9-a357-44de-a6e5-4bbab4256c51@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <c8d690f9-a357-44de-a6e5-4bbab4256c51@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|PH7PR12MB7795:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc93915-76af-43e2-b387-08dd0036a5de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHJXU3I1Nzc5WWEzMndDTUxiNkwwcGh1OGcvM21uY0RGbUtpR3V0VldEQkxF?=
 =?utf-8?B?U3g4WjBkRjVOYjVlbG9VYVNmRURHTmU1Z0txaUlybGp5VlBVblhOczZtemti?=
 =?utf-8?B?cWZzdEtLU1gzaTZNeU9KTXRwU20xU3hFRUY0OXY4ZXRyS0RFdW16cURhMkts?=
 =?utf-8?B?MHd2ejFXZ1ZLOUVnbDBSekI5NnNmN3hJWmtzYjFzMDExQmVwUzJEc1M2Z1pC?=
 =?utf-8?B?SGVJdTYzaDVpK2tZWkk5SndpVklrRk1uTG5GR3hBQzRtNk9rSFhGYko0TUdN?=
 =?utf-8?B?Q0Q1czJUa3F4TVd1YTc5N3JLTjZLTHdBbUMvWUI0aURsVXJkeVprRk5NbmUx?=
 =?utf-8?B?YXh1TnlNdHBsdHVTRXZ1VEdiamZnYTMwZVNmY1FGVE1PMFplVm9MKzdMNXBK?=
 =?utf-8?B?SU9lOVM3K0pFNGVWQzNUMUUzL21VUy9mdWpOQ2xvaGYzVisrYk5ETGx6a1px?=
 =?utf-8?B?ai9iRUw0L1ZxM0RDUnRQaGRhMU5XWlgwb3llOGliczdLVnVqb1A4bVg4WmtN?=
 =?utf-8?B?YU1iRm1JMkFMdFdBdFZQb3N1M3lDekI0VVJDU2wveEEwOFdzNkdOeWxndUJz?=
 =?utf-8?B?TWovOGFOTHNXamRwVEkxcVBQQWYyUnF3WTdnK1RWVlNvbDJ5UlUxeU5xSVRa?=
 =?utf-8?B?RFlFWU5taGNZeTBxOWwxSng2Y1FmRnRmZWtXVDhvbVl0TGQyNUpJLzMxclcx?=
 =?utf-8?B?MUlRMkxNWlh4aUJqSlFZU005bm5RQkJObWlveDdZa2hrYUxMVUhKeVZXMEY5?=
 =?utf-8?B?QW1iUzJRN3JndkNKejkrVk9nNjIra0VoVWVKbVR0VzhDYW0rVzdtbGRaQjI3?=
 =?utf-8?B?dUxFS3ZuekNEZjdkMkdzK0NwcGVUeTE0ODA3SnVqb1F6NTFvSFZDOFRvYjMw?=
 =?utf-8?B?MXlIU1hRQVpza3RXQ1l2c05YL3ZMekNrSTFuY2l4cTFqQnZIZDh5NEVkWEdU?=
 =?utf-8?B?YTAxbDV5ZDU5aHBEQThVS3ErcGx0ZHlFTFdpMEJDRHZTODVlMi9yMTF0NFdW?=
 =?utf-8?B?cjgvZm1PNjlCNEl2UWY4Q1dZTUVxOHBNWDZCOE5kenB5YXFEOFFqcnZIZllh?=
 =?utf-8?B?WnFrL29CblIrY1J0UFoxOFpxSytBSHpXVlo0RWtpTkR4bUJZaER0MVBSejZx?=
 =?utf-8?B?enJ1WFR0aGRFYzgydkVhTjh6dDVHMmNCdEJJdURKOVFEbHpWTWtydHV6STVG?=
 =?utf-8?B?b0RrOUtiZEZRbEFHNGZENTlCT2dEUnhvMDU2OC9idU0zSlpUNFV4MWQwaEFr?=
 =?utf-8?B?ZnBpWFFLbWZVY01RZHY3OHdVSXRUL29mYkYzd1JkNGhXdXY4bTFrVThKbkNU?=
 =?utf-8?B?Q2h3YVNIU2NzaU1PMk82NXJNbkxVK0pxUEFBQitGdFRwNDJGQmpHSXk5T0lV?=
 =?utf-8?B?bEpEdkFpREl5a25HMmQ4U1Rkb29FUzJNRkhvTkFNdGhjMys3N2xKK0lZMG1z?=
 =?utf-8?B?aWdxUEJwMGNkdXVRWWtGU2N1cEhsTktuZjR3RklrSGJ1bVRldzFmOEtaaEtC?=
 =?utf-8?B?ckd6UUc1dllWK2RCaGx0aW1jUHlGb0FKc3RoN3Z2SUNxTHpnUkJ1c1luN0hQ?=
 =?utf-8?B?UEZtQzZXS2g0TVZ6enJLNC8rUjF1bG1HNHRhMGMrMGJiNHRDL0hYVFZkRnh4?=
 =?utf-8?B?RWs4UENNL1kvVjc5NlZaanJRUVBUTEJqREhRcjVDVzZuYmJpbFRvZ0V2YnFR?=
 =?utf-8?B?T3dsYlFTUUsxTmk4YU9ab3FVQ00zc1N3bWEvVVY1RnhNZ3FsY2FUMkdVak8w?=
 =?utf-8?B?elNTV2paNnhiV1RLM0pCQnFVcHh5dGtwSGpWL1JiRmp3QkRCbldSM3VVdDNP?=
 =?utf-8?B?N09CeHAxYlZOS2ovZXpKckUra1dFbkMyS1lkcUJvaXdyS29JTDMxYnVEK3Na?=
 =?utf-8?B?N2JQQWZLd0hKUTV4b2NZbUVVOEFzV3U1MkJ5VmFTY2tUN3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 20:48:06.7079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc93915-76af-43e2-b387-08dd0036a5de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7795

On 2024-11-08 14:17, Daniel P. Smith wrote:
> On 11/7/24 15:47, Jason Andryuk wrote:
>> On 2024-11-02 13:25, Daniel P. Smith wrote:
>>> @@ -1745,13 +1733,11 @@ void asmlinkage __init noreturn 
>>> __start_xen(void)
>>>       for ( i = 0; i < bi->nr_modules; ++i )
>>>       {
>>> -        const struct boot_module *bm = &bi->mods[i];
>>> +        unsigned long s = bi->mods[i].start, l = bi->mods[i].size;
>>> -        set_pdx_range(bm->mod->mod_start,
>>> -                      bm->mod->mod_start + PFN_UP(bm->mod->mod_end));
>>> -        map_pages_to_xen((unsigned long)mfn_to_virt(bm->mod- 
>>> >mod_start),
>>> -                         _mfn(bm->mod->mod_start),
>>> -                         PFN_UP(bm->mod->mod_end), PAGE_HYPERVISOR);
>>> +        set_pdx_range(paddr_to_pfn(s), paddr_to_pfn(s) + PFN_UP(l));
>>
>> This is fine today since s (.start) is checked for page alignment.  
>> The other option would be `paddr_to_pfn(s + l) + 1`, but I'm not sure 
>> that is an improvement.
> 
> Out of curiosity, why are you thinking that module start would never be 
> paged aligned?

I think you have an extra negation - the module start is always page 
aligned as checked elsewhere.

While reviewing, I was just noting that this code starts rounding 
addresses when it previously operated on pfns.  Non page-aligned s + l 
could then cross a page boundary.

Regards,
Jason

