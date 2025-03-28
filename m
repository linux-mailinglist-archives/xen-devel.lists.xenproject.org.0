Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FC4A74598
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 09:39:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930290.1332937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5FB-0005vj-H1; Fri, 28 Mar 2025 08:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930290.1332937; Fri, 28 Mar 2025 08:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5FB-0005tX-EK; Fri, 28 Mar 2025 08:39:13 +0000
Received: by outflank-mailman (input) for mailman id 930290;
 Fri, 28 Mar 2025 08:39:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=huHb=WP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ty5FA-0005tR-PW
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 08:39:12 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2408::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e85f764-0bb0-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 09:39:11 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH7PR12MB7428.namprd12.prod.outlook.com (2603:10b6:510:203::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 08:39:07 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8534.045; Fri, 28 Mar 2025
 08:39:07 +0000
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
X-Inumbo-ID: 1e85f764-0bb0-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6aJZ71lj8uc51e+KxufhGmr1YZcYYdmrALaHTvVtVC2Pkro1wQ2JHruTCdM1cy7YL1BzmQ1f/OkoFTFCRJW4uN6xFX3bf/zdBX/RhHi+vcppZgWDYlXroW187olkoRzIA6j7qip9H/+eVWSppYXeHKqzLzbjCmRYHHtvHnTdlcXUrlBkv+At9ckkqq3OAWFTUPchSDHdcKnoYhZ6koyVZg8D3KFmhvpnrdHJi/zrGubqRWnitf7WofltZIypGX2XnYWKgNU0bhnHwY6V8WPSLiU23LCjLfuzWnQmz148K03J29Ed1UIr1B4u3yYt1YEf7tFq4kocFYIPsnxykexQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGziEdvweAICu4Ffc36G8wKPzlvm9wWtKpxgPc8DBLI=;
 b=e+Bi6k7CGRm5I69g9Fr7yIcUnzsrbFV0+3lUnWbhBqjDVMGm7R29AGcq2aT4DCBPVscF7F/340Po5ZknvFlQE8Q1yOXpdXVk97rTDKg00XV1ZkP+vZQb/HyCOGRAdqlhriE5uMxpnHS83J7U7tGo7dMDxBahOusBSZrwmlxmMbbz0/x3DxrOQRe6rRMTABDZmstizCtUmesmTUI65qXYnihxf1AEgfdNgmnKGacZY/w76TKuvDuOv2mgJIltqLVCx8Rnj8yqoSbO6fErF8rCGOvgijl5C9nPomuWjNvjVomweJrZMpG+08TuqPqyrigwq63hspxy7VMTZPp85s8x+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGziEdvweAICu4Ffc36G8wKPzlvm9wWtKpxgPc8DBLI=;
 b=ETYOUg/6SEGMjGK/X5pSGKu8gkJVkaxlrvma6CzcPZrxIRcQKmRRx1iGoW5XoCLXs04v66NPifWDs/zboHa2w6iK6QD0EUl8H3btfiAZqI6kgMLsGWNC/80+SeXJ/WxrFJv2SBt6WsPL2ghPvZ9GYgjlZKjV23RRsHj5/lggjeg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d5c15760-c6cd-4f20-b296-a9f9fd44ab0d@amd.com>
Date: Fri, 28 Mar 2025 09:39:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/char: implement suspend/resume calls for SCIF driver
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>
References: <800acb5c8447153e6c451c8df316ff678fbb4087.1743114879.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <800acb5c8447153e6c451c8df316ff678fbb4087.1743114879.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0228.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::9) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH7PR12MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: 56777f51-b6bc-480f-52be-08dd6dd400b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlBsM1JOMTRQeSsxTEFVRExaYjVqd0cwY2ZmZjF2YlZMWTgrZ1ozVHJ5N05C?=
 =?utf-8?B?WjVOWkRnb0R1RFpGNC8zalRvQ1dwcXRqRlBHbVRkRHhTZXRDZWJLeVY0dkxQ?=
 =?utf-8?B?amV0dDRyUGVOS210Y3BOSDdRSmRZSURsRjhlSTNzYW40YXNHTC8yVWNNWkxj?=
 =?utf-8?B?R0plU0wzaGd3VEVKZFpMS0EvNVlVZkVvc0IrQnMvNktBbDlsTHNoZkJoeGlo?=
 =?utf-8?B?ajk5S1E4WXlNTGlXU3pUaThuQUtWQmNVUVRKcVpLY0c2dlhXL2NObFd0b2RV?=
 =?utf-8?B?bkJTa1JPMmFpV2pxZkQ3U1pLdGR0dnh1VjRUeUx6STkycjlqSEJwVGNOaXFt?=
 =?utf-8?B?RENXV1JxUHYrY2hhSFRvS1R1SWlHVHJ6ekY2b1prSzFTZFVnTTE0RmxJU3do?=
 =?utf-8?B?dVN4elFhaUF3U2gzM1pSdzhYcHNzc01nWS90YnZEeitEdlNTb2l5bHVzZVlp?=
 =?utf-8?B?RlBRbGZ6cDViOTl6ZmtYZjBsaDVwT1c1UTMxc1JreU4xakRjWHYyc1RQeVZE?=
 =?utf-8?B?ek1SOSsvTHJvSlk4K002ZXQ2Y21CWEJsVjNkY3l1QzVscWo0b0JYMkxvY2Jv?=
 =?utf-8?B?WTgwd1UralpwZ0lRd3I1KzRuaGpXVnlVOVdrNEllUmFUZ2w5Nkp3YmQwSEJL?=
 =?utf-8?B?UHVNL2U5ZVkxejVYQ1drM0F5QStKQUR1amlYN3JVcm5sc1JIM2VKOXpjQXRy?=
 =?utf-8?B?OW1zOFpvbGtIQXpRVm55ajlKVk8wazFKUlBlNmFrYjE2eC9YeDdmS0xRVXBz?=
 =?utf-8?B?RWtCZndSZk5Bd2dNTElhejFoTEIvU1h3SEM3QmFWdVhlcE9KRXpKVG5DOU1l?=
 =?utf-8?B?Q2xNWFVpb2lGZ082TlA0VTlJTzYxQ3ViOXBoTkY0d2tWWHBPeHRWbmoydnVk?=
 =?utf-8?B?U2hzcXRkYngxelhqQTJBOE5RSW8wN3ZUYVBiYmQ0V2s5Q3llYkhiWmJDcDBa?=
 =?utf-8?B?YWxxeEU0MEtYcXBtQ2hZbTMvaVliTk42eldSZExLNHpoQmJLUEJTak43Wkc3?=
 =?utf-8?B?R0h3Sk5Ycm9qUTRCdDBMUDRRdTh0ZzZkMmcrQncxell1UVlZYzVkZGZrNTc2?=
 =?utf-8?B?d3hFUmZrS291UFhldTZKZFJEZDFzUE81bUJQQnBUWndnK2VzZXkvMGlMYUNw?=
 =?utf-8?B?RVNkQU4zMzVTblIzV21Zc0VLMDIxbzZOc0pEd0g4bHczV1hBbGtWUVpIZ0Jr?=
 =?utf-8?B?QzY4dFd0ZkhNTjd3OGJadmd6Q2wzNXlQbU5PV005b0lKZWhqMzY2TGdTQnF1?=
 =?utf-8?B?Z0RkUGpEOFdvYTBpVUY5b2ZPTU1XUFJaQjNqU01jWUQvZGV6eXcxbzBpcHJq?=
 =?utf-8?B?SFMyZUdjSTJvSGFmNnlScVN1Z0JpU1FpUVVpdk5QdUdpaHhhdnNta3poM2Rn?=
 =?utf-8?B?S2pwbmZZZ0N3VU1abVJmckR5bHFESDFVdXJNOVBNampsT2V0YldnYnBRRklE?=
 =?utf-8?B?cUMzYlZkK3dpUlllMFB1WFdoTllETFVuSG5zUzVBaEJNTzFIalJSeWNSMmNF?=
 =?utf-8?B?Yjhpckl6Ry8wak9OcmovL3Y2dmh6RHNJbWJHNEIrcU1mVlJPZDZud0J0b2JL?=
 =?utf-8?B?MVF6T0hibkhteVJVNzU4d0JpZXhTbWgwa3RtQnY0RDlIRkxOazZ1a0FDcjlo?=
 =?utf-8?B?bVM3QUFlNlVYc051UTRENzVoVnlOVDJ2enE1WjVtZTJpR2cxUkhRNzA2eUp1?=
 =?utf-8?B?RVJBd3VtTS91bUJKMUNDK0hYMjFlL0d2ajJ3QW5McjFMZktnNm9WVW9xcXdm?=
 =?utf-8?B?WkRKMDhvWlVYWlJZcWh3VkZZQnZyY01PMVhyMjlxbEdHNmhPemt6Y3pGZWMw?=
 =?utf-8?B?bWhGbTdMUFl0cldnYXV4aUVEYzlhWFBhbkZVdEUyODFwTHFSZXYzcWdQd0lk?=
 =?utf-8?Q?w/zJQP0xTsZuy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG01UmpUK2NCODhNNG9zZG5QWUpsdUxQNGNjeDh2Q3BocTJiSWlnWTlWRDMx?=
 =?utf-8?B?ME0zd2pWbzFmQ2pKMUErNlJPb1dJVG5NMjV2QW9qY3VvRjRGZ3FLWXk4SHZU?=
 =?utf-8?B?TXRIU20zeEhUbVJLcUNHNFRDOU1WYTRrMkFIWWswZWYyME1TQThVZzRzbGdQ?=
 =?utf-8?B?VmxqVkt3ZHU2NWRqa1F1cjhTbHk5ZDdSNDBqNklXbFppWC9mbnp3NEdBa3VR?=
 =?utf-8?B?SHVydTFQZDFyRlozTkd4TUZzWm9PR0gwSjhjWGxoaUQ1UVprZHBwZW5GWHRj?=
 =?utf-8?B?R1g1czNnc21TSlF3aE5WVFRTU2JFVGlpemZDd1VtSEhyTElHZk04dzVZWDkv?=
 =?utf-8?B?MXU1SkhXaVlpU2Fib0pQaDFXUmF1aEFac0lMTDBMMEpVZk5Bd1QrUWpnWEZr?=
 =?utf-8?B?ZUpkMjlnUUU0SXh2eDE5N0ExNUx4MXplTGtiMVlBa1pWSmd2NzBrdlNyWWlJ?=
 =?utf-8?B?OXdxRnVMRFFkMUNIbTRoNmZBUzdHRC9jTjQzZmROaCtHengzS0lpTUUzQjdO?=
 =?utf-8?B?OTltUnVpZ1hrVXI1UFdGM3g3UnhKb2hVVVpvS0p4aEZIQVJOWmpldnVTQmNM?=
 =?utf-8?B?Y3dpNldLc29JNkovb2w0a3NVM0U4cENsWTk4R0lSNk1RU2hwY1FkL21xNHR6?=
 =?utf-8?B?MjhERTVZZFZvNnV6cTBNSjNhK1drcnFBNlRWUWQ0R1Q5UURNV1JTM0o1RHd4?=
 =?utf-8?B?U1VOWk5aTHA4NTQrS1dvMjBCQlY3UDUvK2ZwNnhuUVB2ZHNpbkcwc0VCUFBa?=
 =?utf-8?B?Y1hBZDNNWk1oWG5GSHVqVlBSLzh1WU9FZUx2QVlZcmh3dVhKT2FTaG9KbFJE?=
 =?utf-8?B?ZmVsd1BuaThCZXBzejhHSW9Ca3lYKzNlZXQ4WkNjY0trV2JZNVRNSDNtbjJF?=
 =?utf-8?B?cmxuUVl5eGR5U1M3YW9YUjJaRVNGVmJjNG5zaW5KTmFiOGhvRUVFQ0NOQ2hm?=
 =?utf-8?B?c3VVbTY1N0w0a3FpcWFtQVNYRlVjaG52MldOajk1d3Jnb3ZCUzFFQWN5SytW?=
 =?utf-8?B?cGF6NDBTL3ZNN0s3YjdGT3EzWXBkY0hIOEtRQjlFaUo4bmRPYzAwcGRoSUxq?=
 =?utf-8?B?ZmcySmlKY0E5VVU4SWQwM2JMMWFrU0FBSk96REo3VEV2OVNPNytrWWszMmZP?=
 =?utf-8?B?UWw0U1dzRHRtMFJnUzYzaGRtdCtJYUVoSGVJaGw1bHdUeHpQV3ZueUs1Q0dR?=
 =?utf-8?B?WnRPem1VcXFndUxBYzFBTHJBS1BVUmxaank1RXBrdFZjSVhpekhRdVZzZ2kw?=
 =?utf-8?B?ck9hRkdQOVpxQ0NzMHgrU1daUDdOZFRyNUZ1bkI5YU5nTzJlYm50QnRPQXM4?=
 =?utf-8?B?K1phMThDbFNNYlp4VkhISXd4c3B4eWt6Mk9MWlNpYnptZWl6V0RsMTAyT3Fs?=
 =?utf-8?B?VWh6M05ndS8rYXJBTXRseWJJMmUwaUlOUFpYTlltMDFZV0lydmYwVi9EdWoy?=
 =?utf-8?B?Y0x4VUdPOFJIb3ZzM3pUNFZOWWNPTkVkQlVNTE5BcVVuSDJXNXZITk9tdlRE?=
 =?utf-8?B?dm1rTmJUVy82UDh1TVVrN1o4YkVvS01Nb0tacEdxdzhZQjhnMHdJakNuNjc0?=
 =?utf-8?B?Q3N5Y0IvMkF3NHFPWjAvTVkrRzJkR1RWRUMyUHVGdzZZa1hEdzhsT0V6ZVcz?=
 =?utf-8?B?NklrL3MwUVVMRmE5VXZKLzIxWjVXQnJiMWhmVG9zNk1zeDZWT2lUT0c3U1px?=
 =?utf-8?B?M25QUW1xMktJQ0xwdGd3a0Y1YU52aTd0QktpdEc0MURCM3QyWUxNeTJYV0ps?=
 =?utf-8?B?bkVIVEFZdVZ2WVFIeW05d0lVNFFrTmkwTnlkeVF2WU9La2V6dGE2eEt4eE1h?=
 =?utf-8?B?UTRuazEyQytDdzg0L3VyNDkyZ3c1dHdqd0kweUtxZG5aWmlhQXZ0SWVwaG8x?=
 =?utf-8?B?NVdhczFFWURvQjNYNkVvM24zTDh0WEpBdFVVOG1qZHpHbk1rdG9maVlNdFBH?=
 =?utf-8?B?MVdFZHpYNzZKcE1MaFk0K0lwQ1FKbVVMNko1NE8wTE5qVG12S3ZSb2FGd28z?=
 =?utf-8?B?MnZrdy9maGhQMHlPTVNmbXFnNWppS0E2bkwyVSsrVDdJMGZKM2Jab3Ivc1VM?=
 =?utf-8?B?QVU3cHgvcnNDTVVUNW9pL280S0Q3ampzb29vRW5EY1o3QkM5ZXVGa2d0WkI1?=
 =?utf-8?Q?7q3Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56777f51-b6bc-480f-52be-08dd6dd400b6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 08:39:07.0612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fabKn/amKxqbjBaKeWBMME19XTLB+LVNjPcn0TULkkPVNnX+ndD9/Wg5SwkIimVt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7428



On 28/03/2025 08:08, Mykola Kvach wrote:
> 
> 
> From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> The changes have been tested only on the Renesas R-Car H3 Starter Kit board.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
I'm afraid that without a suspend feature on Arm merged, this is just
introducing a dead code which we try to eliminate both for MISRA and safety.
I'd prefer to wait for the suspend feature to be merged first.

~Michal


