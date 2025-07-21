Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122BFB0C401
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 14:23:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051488.1419823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udpXL-0005pv-Pp; Mon, 21 Jul 2025 12:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051488.1419823; Mon, 21 Jul 2025 12:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udpXL-0005oK-NA; Mon, 21 Jul 2025 12:22:31 +0000
Received: by outflank-mailman (input) for mailman id 1051488;
 Mon, 21 Jul 2025 12:22:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cu2o=2C=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1udpXK-0005oE-Dj
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 12:22:30 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:2417::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dc488f6-662d-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 14:22:29 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 12:22:26 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Mon, 21 Jul 2025
 12:22:25 +0000
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
X-Inumbo-ID: 5dc488f6-662d-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqulLWs24YzQEb6WDSRd73tlyup85dckVfHj22WbrEW1rI/LnQeVC2ODcr4dw76cShkcqw4gYGORNTh+qVjKgw3pbdb31+czV28SEeTXO4eM0hJh94Di15808mW27J9o85oVmd0LP9y7t4Z5oEDgtRitwT+CfjpZ9R52gUCUaXLDl8dqB8FcNw4VLH4IxT/IcHl+P+OWfwrDG9cyGwuPpOYggETGpRQJoVESQev1WbASwTILVo2mD495K/CaRz0uhVdjiga4hkA0x05KTCSPKaSJFHcXvUX6OrRH2z5dZ7MPak2lyJ2EwweSMgdttUh6UKAXq7cAAlvRpMBP7DSoKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AcU5/24F/7iIlEt2AlrtFlfg2YxyyS6jB8r4D8Tea0=;
 b=ilE3PwHLtZsdmnLYzWDTFR1kiSDssFC63G6GXYqcp4D9BFvg2nd6YPtdPYUZEZq87XkiAOvEt13Mo6zzWnlsTixvQiVvAmtI9SV8x1QQEU2YefkG0085rBL4KYVPucbz+9obvlCyJakSo8tM1zHZ8/nRcTbreDBLhMmrHx9XPNPZTIfobZHLzMNPEcDgy9ViATQpAIZ9DrXHy9DiVUpvWT+4JKJIE+ZMiFqmkBQ5V13uRmLNN32UAZkXiCKrNVKZTrHRTfsTr86JsNDfbaZ7IEq0KpMLZKieao/ZhqrFq6kCkrkQF0HoSvRhLbmlgsByq8/94ldf2UWoCoCNjQLoOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AcU5/24F/7iIlEt2AlrtFlfg2YxyyS6jB8r4D8Tea0=;
 b=KaEhr7psC7uzywJMpRXDJIiVFVPl42K2hYJrQMuAacXMyyaNnJztToR3wvq3KXRb69CgDnGcTyKKvPgPdsprcsG1ziBPa4hE4JKiZqdFqkLu/sZwFQQObdHiY6JJl/MboQBWzqZPucoEG5OC5RCtgEtKuwEFI5jjnlCuP0WWJyU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <83e3cabe-a9bd-4f97-a599-134c3f47f413@amd.com>
Date: Mon, 21 Jul 2025 14:22:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/efi: Remove PrintMessage function
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20250718121106.34915-1-frediano.ziglio@cloud.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250718121106.34915-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0231.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::11) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH0PR12MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: e428ab03-eb28-44a2-edba-08ddc8513fd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3pzT01XWHpYbWN0S3JmaDRVc1RobVVwZHVuUTNqbUJtSlV5aFduV0xzYWY1?=
 =?utf-8?B?ck9lQjRVWGRjdENGTkFQcFdYZFNSUFR4M0N5QW41WHRlcW5HbUtJZEl3S25z?=
 =?utf-8?B?NS9DMFJ3dkxEQnpBTThPTGd0M2tqam5ZQm1XMndCZ0xEUkIwaTJwWnpiV2dp?=
 =?utf-8?B?N1BzREF1TmFveTlJUmxyQXRpc3lXTFVCVDZkOEhLWGFmY1FXOGpGYTRjNnhB?=
 =?utf-8?B?YVhtaTJjTEVZRldXV1J4UG5sYktpM3AvbmhsbllvaFo0cnlTM2YyakQ1NXRx?=
 =?utf-8?B?eURGbzZiS3dXUjBIcWJBRHdESGlqTGFFNzBPQkZhdVhCalQ3c2tJNHhScUlm?=
 =?utf-8?B?ZmFnclFsVEMxeGVvTmpsaXlIMm01UjB5MmJhYTF6U3B2K0FtZ3MySlp3Rzg4?=
 =?utf-8?B?T3ZGd1docXNGL3R3TWRaWEU4UFJOaHFLK2xOL251WUZOakpTcG9RMzJ6ZTlp?=
 =?utf-8?B?K3RHbjVXOWZiTTVKWlpybnVLa3owU2J5NTZLN2lLcTJuM2dQRjI5UVBuMk9U?=
 =?utf-8?B?UjBUYll4NXFhazhibGZYdFVVZVl3aGJzOHBTVEJvcERrcmtmZ0dRT1R6R0x4?=
 =?utf-8?B?M1JkMFhIMkxRcWRaNU5zV1g4MWxjdm5CY3F6bWZCU203K1drUysvVXVFSE5u?=
 =?utf-8?B?SjRGVUs1WkcvTUFkcFlKZS8yZHc3NTBzQ1RVWmJrVmVBa0JFTS9admtmZFp2?=
 =?utf-8?B?T0NpNDgyQkRNWkZKV1A0YmtkTlJMVHVTZVpGZjh0eWJyYTBDM1lmZDRsYmhw?=
 =?utf-8?B?cjRocnhCNkIwNXpYYmxlUC81ZE9CdXRVcVlySjhOMzNqSGY5ekh4QytJTTVm?=
 =?utf-8?B?b2p6WGt2SDNVY2FQYUxPaEt1TE9qaGxqSkNlVkEvc3JrSkx3NW9ORjEwS1M3?=
 =?utf-8?B?Wk84VVhhd1ZkNDhmVndaclV0ZDV4dXFIZW1ZM1JETzNPSWJXSVhsWFV3NVpi?=
 =?utf-8?B?V1VIeTlDNXFTT0tnV0psNyt3enFNSklWRDhmVFZndUp4ZXZMMi9rMS9HSjA4?=
 =?utf-8?B?eTdHZ2luSkZ5Y0h0eUlWZlZuUHNsYzBEOEgzMkYwWkZQaUx0WjJMakNnWGwy?=
 =?utf-8?B?dWZrcGdqM1JsbTd1U3dwdVczQm13cDVZcjJrM2NnMDR2cjNmeHhRbklMcStK?=
 =?utf-8?B?LzVHTjkwMFFIZFdmR0h5cWdwdWhSMjhzQlo5SElJRUJScStCdjNpN1ovaWJV?=
 =?utf-8?B?YStwbjlCSlNrcGZzS2dpeVRDNlV5NE1XVlM5WnhxMTFHTXRBRnUvUVI0c3ZD?=
 =?utf-8?B?NzRSZWpXQlB5UVVyU1pBeExGQ1UxR3VtRGxUa2NKSmR1a0crRE80MnhkR2Ew?=
 =?utf-8?B?ZFVnWDFITHRSdWFYNzgyZEJzeC9YaUhDOGNkZE1LbkphdUdYUG1MZTJtR05j?=
 =?utf-8?B?cjVEdmZuM0hKQjBGWTgwUE9EMFdNZENTd29IS1h1ZmFqcFZjREpJQlQyaXZ5?=
 =?utf-8?B?QUZhOXB1YU5zYTBSM3B6WjlsNllzQkxSRXJwVlhDaExkQndpeUNZajBZQldO?=
 =?utf-8?B?N1pJdXZ5WGV3Q2c3TTVXelBVM2FVbEZrbWIxV0t4eFpST3pnY1BJVjFYTENj?=
 =?utf-8?B?NDVaVWVYdjI2MlFYY3hHTmtoQ3VqRnhXQjN0cFZGTkdZMVI0WmJZS1hoYWdz?=
 =?utf-8?B?eUtzZjJRcmFFZDdoOVZ6U2ZFOTh4RDdkL0w0SVV2ZWVJRXo3L1p0NFF3YjRJ?=
 =?utf-8?B?MlkzK2txQW9YMFRNbm9ROEs1aGZWZlZQdGFpd3l5QzgxRWlXaDJYQlBoYkVt?=
 =?utf-8?B?L3loazJMNzdscXhqbkJKOFgxL1U5T1lpMlM0Mm4yYUZWd01xUVlHbGVVNy8x?=
 =?utf-8?B?UklKcTBPQUg4UDRYSkF4NFR2TDZQbGN6cEhWV3dCbXMwSFU4U0dVTFJ5dXV1?=
 =?utf-8?B?Z2IybjJJRXF2RTFINUwyVjdrdVJGMVZPYmxnd0lQYTNRVHhWV2I5OXlGZXU0?=
 =?utf-8?Q?uf9g3XoCAwM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnNZN2hkdDNpM1VqTkhJSU91Q1BCbHUwaVpwVU9HaHh5bEpjRmlTUCtnRVV2?=
 =?utf-8?B?cTJFZlpIN2JWcU9JU1oyaGkxc2syQ3VoYkxERjQxNTl5c01PZ0tpejRCRUhw?=
 =?utf-8?B?TDZpYld5bkpIYnhnUm5GZ0dGRjJsTDRPRzBUV3NOV1FvMTgrNkJ0Y3kvcmZ1?=
 =?utf-8?B?MVpDZHk0bWJuVXVVZFU3QWd0bk9Ua1VQcEJuTTE3U0RhTEw5ejcxZmFMY1hm?=
 =?utf-8?B?YmRrK2plRWl3THp5eldwSjZrQWZnMWNXamYzZlAwOUdQMm9IWDFaUDV0WThl?=
 =?utf-8?B?Vjh0K3BCY2IrMHB1WWJObHM1Z2VFL2hnd3ZPYVBVNEw4dnVSVU8vdzVGaUZj?=
 =?utf-8?B?b2RqaTc2R2c4RW9YT2sra2kwb29WVkFHYUVZQkZqRmZseHZlUFR5ajc3UUVS?=
 =?utf-8?B?Z1FSUG9TZk5qbnJibnc1blJEY1ZjWnk1SzdsL2R4SDRIdjQyVWZjb2llNTB6?=
 =?utf-8?B?Qm9PVkpya0RuZFZmSEhSakEybXNIbFNHWStOY2FpYm8wbFNWcWJ3TUdhOEpi?=
 =?utf-8?B?aHlqemx2UVFtbTNOLytaK1N3ZVlPaElmc0Y0ZURpWTJiRnlyRERYTjkvRkZJ?=
 =?utf-8?B?eEpEVjdzallNeC9sMWFveUVnZEdlK3hTMVhnTTNWZ2RyTXlad0QyejRvZWMv?=
 =?utf-8?B?M3J1MjVMTmM0Mm9Fc1IvVDJZTUNaZUV5eHlVVFpHSEZHekFpN2QzVndQNGFp?=
 =?utf-8?B?ZmgyZHdVS2EzN2xFQ012LzVsSlYxRWwwLzl0SW5SZjYvcmp0RUhHM2RzZFVN?=
 =?utf-8?B?dEMwSzRlc1dxYVZXNzlGSXJwUFZrSVE2aWFOUlRwMGN4YjJFSC9jam9UR1lz?=
 =?utf-8?B?SWRrbGRiZlFOV1NLZ1pLRFR2b3lnTHg5TFVVVHFKRUhjbWhZenhVbi9xL0VE?=
 =?utf-8?B?S0p1SlVleWFSbXdPNnk0S21KNExVdW1KREZ3WkQ1M1krMU51VzFaN2hkWi8r?=
 =?utf-8?B?Qk9MYTVVV09oTlZVVTRWOXlWbUgyOUxDOEF4OGJkanpZdVIwNk1sL0xReHpR?=
 =?utf-8?B?MHJpaEE4emlZV3psblg2N25JS1diaCtjd3oySk9vRSs2WVF5dFkzWVFERGUr?=
 =?utf-8?B?Q1pFUkhDR2JJcE45cnUzQ2FtTzJNUDhxNi9qZDlPRjFBYmdQM2VPZzU4ZTNX?=
 =?utf-8?B?emQ4ZGJlbzBZWmxUT2o4ek1kV1NVYmNWRitic3Y1KzNwVWYyeXVnUWNLR0Ez?=
 =?utf-8?B?bXo3RytEeTlYVjV5MStVZzcrK2tvY2src3VZc1oxS2l5VzlIaXpIdHlqRnJ6?=
 =?utf-8?B?Y2dWbzNaZEs5OGY5RXR4WmxmZm56R2F6ZHdJTkoreTE4YU9IQ016TEM4dUJN?=
 =?utf-8?B?Znk5aEc5WXhOOHFtM3dGTU51VGNmZDIyZUtIc1ZEZkZRbmpHMnhCNkJLdGRT?=
 =?utf-8?B?TkY2bDNRS2hTMkRrV3NqQkJYZDAxeTVJS0xXUVo2WHVmV0Q5UXpndWZ0ZzFD?=
 =?utf-8?B?Tkg0UVh6c1A2Y3RtTmhwdnhCT0Q4Si9zbUlXOGdUb09jU2FXZlBXYkJwVDFP?=
 =?utf-8?B?bWRrckU3OTdzNGk5VUlVZHlscmI4eVRqYkNkTlR0eVM3QUpRaW5mc3FkU1VL?=
 =?utf-8?B?UWVqQXowdnhvOS9aVzZaUEdMUytKOWtjWGJPZlMvYVNOa2ZGeFFxcjdsc0Y1?=
 =?utf-8?B?cFl5Q2czWEVmdXd6L0lFd1BvRG8zMHdmRmkySVVicHNzVlBaaVgvOWJ3czh6?=
 =?utf-8?B?NGlyM3NFeFVRU2QrRHVlQjJ0Q3dlMG1McXFsV2c4N1FweFVNNDNPanplMHdX?=
 =?utf-8?B?SzMrZ2daRnhJa0xMVjFJY0ozcUZ2MCtHMmsxRVpNclZralhldHdZSSsrbTdH?=
 =?utf-8?B?QlFpZFUvcmN2a21QYWFaU0xwU0pobjRGeFZVZWlVckxuT0ZBSTZhMXo2QitB?=
 =?utf-8?B?YVlWS3VzTGM2OC9CeDBLT3VqUEFBQmY4WFlCR2ZkeEJOWllUVlJBTmk3N1BJ?=
 =?utf-8?B?cXF4dzVFdFhmYTdJN213WHoxQ1gyZDlmaGwwYlU0YW9Sb3V5SEE0bVVXMDdT?=
 =?utf-8?B?eFNnNmd2TFJyQlVvZkdvVmUyTXhTZnJZcUFwTEFmWEluSlBhYWRVczdqNWpY?=
 =?utf-8?B?NVFpUlVOdE5FRitoTzN0dXVnK2t0NEZVSGhYNmVRRzVqdFNJSFppd3Z0UDdN?=
 =?utf-8?Q?mEo0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e428ab03-eb28-44a2-edba-08ddc8513fd2
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 12:22:25.8979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViZHtmtIItrZtn1jqYJ1+Edyr+W+32PYv+QG71DraTpNw8Lfo5LUZfq2KtncNx6h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7486



On 18/07/2025 14:11, Frediano Ziglio wrote:
> The function is similar to PrintStr with an implicit newline
> added to the string.
> In Xen this is not a common pattern and this is used in EFI
> ARM code only making it not much coherent with X86 code
> so use PrintStr directly to make the code more coherent.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


