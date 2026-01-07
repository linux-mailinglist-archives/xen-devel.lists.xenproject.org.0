Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B026CFCE31
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 10:36:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196610.1514385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdPxF-0002gU-Ta; Wed, 07 Jan 2026 09:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196610.1514385; Wed, 07 Jan 2026 09:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdPxF-0002dO-QJ; Wed, 07 Jan 2026 09:35:49 +0000
Received: by outflank-mailman (input) for mailman id 1196610;
 Wed, 07 Jan 2026 09:35:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K00X=7M=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vdPxE-0002dI-QC
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 09:35:48 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cb65ea5-ebac-11f0-9ccf-f158ae23cfc8;
 Wed, 07 Jan 2026 10:35:44 +0100 (CET)
Received: from BLAPR03CA0178.namprd03.prod.outlook.com (2603:10b6:208:32f::32)
 by SJ0PR12MB6831.namprd12.prod.outlook.com (2603:10b6:a03:47d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:35:37 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:208:32f:cafe::37) by BLAPR03CA0178.outlook.office365.com
 (2603:10b6:208:32f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 09:35:35 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 09:35:36 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 03:35:36 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 03:35:36 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 7 Jan 2026 03:35:34 -0600
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
X-Inumbo-ID: 3cb65ea5-ebac-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWmKmC+xtl4FlV3ewO0AWiC4ufL2KW75CVLmQvgXsKTWxajTSF6JfAc6YCY34SlqugMY1YwB6r+fjv4FdHwf351dCr2uXL6qNTo4/bZKb6b4PJqDCirgxCQD1xxx4674XvoHTbE+nRG4vGI69jn9HXYRfYJygXjD4iw++E35jiXkaXG+G0MYG6l9innt+1t1MFWAt+K5J9zy4i1Bn1QkfwURibvq5Fj1XoIN8Y6DfIl+GNi+KQIgCVqJRP0r7vbFTddjBn6rD0+86PmNNZ8Ykrbpu3Ty1YnZTzPSNEzhxuZV4rWovmUHGtURs3gbhwpbXjZ8izbnUudDfS+cJhokpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6dzk1RcH/YjBJRmi/iv0tZ38UcDJzSMginZO8W/FMY=;
 b=KxLMcZP8YXBf1O2heeGRhfTuyIv4a+Ro6Jz9xUZn/spDyiSurHdKlymwBzIY7eue7KRX6wAvhGef4mKWhR3GBTAoLVRU+rptlIGIalFU4PAQjytjt4cQQ+m+5H6ccK60634aCyy9Gh0AJBLelogrGN2iSSnaeJFzPLgLPb+6CrdVxlJJhwYAuDpZqdaCEcaDOgwSbIcopJFZnXee28UozShe6TS3MTnrRt8/uYOgWKe9bkyEgk0RibPAFQb8mvFHrDYCkpxIw6f+J60wJ4VSWqjl1cvyxJDU3gTjezafU3wkTPxXEe/LMnB4bNZTjbnt5DPLZU1/+C3rB2qyyTJlcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6dzk1RcH/YjBJRmi/iv0tZ38UcDJzSMginZO8W/FMY=;
 b=s3Jmr4PBjqlkN8vAOv9A9syxzC4V3UX8/8FY1yfnIklWGMIeOh5KbHHBou4rO6KiRF6wHAbXiPZ8/xWIKQ1MD+eK23kHvCt6B7I1kTdXJz4K0JUtemmS6V4ggW/Us1h3MJKxmEtMZwGUklZxhN30E5imXms32efzgeF5cJGxCRs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <0ffa723d-9391-4539-bd73-f05e1484726a@amd.com>
Date: Wed, 7 Jan 2026 10:35:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] arm/mpu: Implement copy_from_paddr for MPU systems
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Hari Limaye
	<hari.limaye@arm.com>
References: <20260105113503.2674777-1-harry.ramsey@arm.com>
 <20260105113503.2674777-2-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260105113503.2674777-2-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|SJ0PR12MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: c54fdcbb-3a3d-477c-ec1f-08de4dd01cd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnVIZlRHREJHM1k2VzlkeTVycHMzOUxMV25JVmpmWm1vdlVvbFo3VDR0Q1Vm?=
 =?utf-8?B?aENHbm53Y2JnWXdPSUpscDJPaWlYME9UNXFtYzBuV2VzN1NRaW5jdlBUdXhK?=
 =?utf-8?B?U0NFT3BVamN4VDJVZzRrTU1BZ2JabmlHL1g2c3pmcXJWWmdCM0ZKUzRNcGRP?=
 =?utf-8?B?UEtUclFuZTMrZ3hBYnpDaTVJV1VvQXVwM0R0ZWR3OHNGUHRabEZFUzZFSk5i?=
 =?utf-8?B?MEZ4N1cwMGhuRHMxc3FMMG5BemJGL2hQUzR3UU1Ya29QVzVGNHUwRDBKVjlS?=
 =?utf-8?B?eVhxNTlXOEorTzZyL0JIZGhQaUg0VXZBeVpqVTVuU1JoWHg4SDZGVE8xMUw4?=
 =?utf-8?B?emtFSHF4WnRWTmF0YVkyMHZJNDVoWHRhR3o1ZER3bXliWTFvNUw3MDk1TnlV?=
 =?utf-8?B?RHhRTG1rUU1aMmxwSjhQckZsMkZwRWdlc21wTDl3MmJQdVZiUEtPU1RzREtF?=
 =?utf-8?B?dXNrbWxVQXBWWWx2bTUxdmlQc25uTlp5YzNWRERodmNvQzZQNlgzblcrc3VZ?=
 =?utf-8?B?Qjg4ejFmSTFvTUVhQmhhTTFsR3Vsakt2UVY5clRrRXJvb2pCWXROSkUwczdN?=
 =?utf-8?B?UDdQS2lUandEWk0yckt5SzZMWkxZaUQwazF4aHYzY0YxOTcvTzlKSTh0cENz?=
 =?utf-8?B?cTdhcm1GdDFyUWtzd1puRm5UellXYUprNUFrOEQwS3FySWFiWlJGOU5kS2xS?=
 =?utf-8?B?eDlLWStGaFdCcExnczYzdG5OZisxYnJsOTl0TWhFeDlrRHNyL08yOW5RRVQw?=
 =?utf-8?B?ZHhTcVNrdVRkUEc3NGxOV3FwWEFweWtRWGVBSitxbWhwUFVzRzdSYnozcUJ2?=
 =?utf-8?B?S2pXYkRLRjZoclJPdndDOTlrcWZuVThYWkltUTdza3ZRc3Z5Y3JpY0lSK3c2?=
 =?utf-8?B?N1BITlJ1UzFzU2NFRStTT3IraGVlVnFSZnFtU1lWZG9mOVM4WmV3cVNrTFd1?=
 =?utf-8?B?cmYySEh2L0tzTGFHYnpneDhEbzVETkswV0NXdEVlZUVIZ1lqbGhQQXBBNFlj?=
 =?utf-8?B?dTFQSmI1TTRGbWdmT3Q3RzhDQ2NDOG9GMmlMNlE1UFQ4bXhqSFZBWlVqd1c0?=
 =?utf-8?B?NVRLeWdkMmlDa3U5dENlS1NQRTJFdTd4em9mTHhhNWF4aEthSFV6dEJTL0dX?=
 =?utf-8?B?d0F1SmtKbUErMnFLZzdCazVlSldodmVRcnZkbWR5V2lxNnMvRHYyOHY0d2dV?=
 =?utf-8?B?WXp0UVA4SHd0dmlaSklWcVVjMGpHWmhJeE9yYnl0NDhSSlVzR2pmMHIzOGlu?=
 =?utf-8?B?U09hOFhnK1B5T1MxK2M2LzU4djRHNXhXeGNHLzhndWZnQkR0L0lGVG1GSFpr?=
 =?utf-8?B?azRESGhTczdQc2RzUFZyQVFBeG4rZitON05oWmJhWitIRDF1aUVUbVdqVGcr?=
 =?utf-8?B?WmVEV3J4L2hqL09ORVhHZkRRV0JKOE00SXlHYTd4YVRic2dXbkt6TjFVVjRY?=
 =?utf-8?B?aFFRTGRDUHFnS0xQL0J0VG5VQjJIcmdzTisxbUMwOUNnWGkvN20xM2Uxc0Nu?=
 =?utf-8?B?WHk3MHV1UmZhdTlUb0RUamtia3h2anhwSXNJOVgzQzJ3RFJ4OTBOUzYwWld2?=
 =?utf-8?B?VCtOU08veXBQemdkVDRueW8wZ2tLRk5iQy9vRlUra1RCclJ3cmUycWhuRkdR?=
 =?utf-8?B?QnhHZ0ozYndwMWtNZHA5VTFxaE5xbUFGVklHRExYMVJidHJNTmkxbmdQdzFB?=
 =?utf-8?B?WU1udktRQUJYN3U4STRwNTNhSW1SRW9wRzRTb0ozTEJkeWlXNmxqbldHVTU1?=
 =?utf-8?B?bTJBSmNBOE5xdUdNczJQRmo1b25rS1pnT2VCVVBWaERSaDVaSCtWbDFXeWVy?=
 =?utf-8?B?RDRUU1FxZjdnQlMzNXBDZ2dndUFucUM4c3dDeitWb0FScDB2QW1SNkN6TE96?=
 =?utf-8?B?SmxUQWtpYlVBV0ZlMmJZOE1IMm1sQjBGVHU5ODY1QzJaZ00vL3MzNzN5SkNa?=
 =?utf-8?B?RUg3SVFiSURiamZaYUJlVXBBTm90c1c1VlhRMnhqTUV6ZnJxdFJFR0dieTA2?=
 =?utf-8?B?TU01WFBZV1U3QmdjS29RWGNUN25DR1hTNXBLL05aNXVFNEo0K296YS8yQjdR?=
 =?utf-8?B?djRqMzRNZDVJTXBaZTk0YzBwbGxYdEdPekh5d0V4bFgwZlJNTTNGNktRdWhJ?=
 =?utf-8?Q?fcKA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:35:36.4884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c54fdcbb-3a3d-477c-ec1f-08de4dd01cd2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6831



On 05/01/2026 12:34, Harry Ramsey wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Implement the function copy_from_paddr variant for MPU systems, using
> the map_pages_to_xen/destroy_xen_mappings to temporarily map the memory
> range to be copied.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> Reviewed-by: default avatarMichal Orzel <michal.orzel@amd.com>
This tag looks to be broken.

~Michal


