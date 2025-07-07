Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18615AFAE45
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 10:10:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035288.1407512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYgw3-0000hK-TY; Mon, 07 Jul 2025 08:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035288.1407512; Mon, 07 Jul 2025 08:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYgw3-0000er-Qe; Mon, 07 Jul 2025 08:10:47 +0000
Received: by outflank-mailman (input) for mailman id 1035288;
 Mon, 07 Jul 2025 08:10:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C52b=ZU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uYgw2-0000au-3G
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 08:10:46 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2413::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e00f3853-5b09-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 10:10:43 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by MW6PR12MB9017.namprd12.prod.outlook.com (2603:10b6:303:23b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Mon, 7 Jul
 2025 08:10:36 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 08:10:36 +0000
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
X-Inumbo-ID: e00f3853-5b09-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D91rR5stYrj5yj/DzlgBqVdNRq6e8prc6Oz5N7OY0HuitzMKwQtkKPFhS/poH4CpYIHJ8303YGq39RiiipnuU4E+lxVpjdGUzdO9bWOr8vcz7jwMSyMxt+VU2uezy36iIMq5YDc8Qc9fLv064TkKkIWPqLGgBqDgD9OrknFAq8X3euVuSuPPKhN9uBYckJORGaq59idGrJEvgjECpqzyiYP/UJjRmiObnVC5xBcB/AXmI7C/Jk8Mrm/IUu8q1vOWQWubumP1c46noUV3TimFt+aO2gZKhAaHgJysIOtM7o5DSdSFobT1515PJjENSvDlceGViTSAwjZx/A0Gnk2QcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPMqGddF6TVxE0mjaSIx0F96tU/UgIBYrGENvAv1vdo=;
 b=EmgcQjt9Y48QtlijTIXLkex6MPsfXPEvdVz1L3o6robKsIh/zGrFH8wIr/zskTt9MdM9042RJcLmWOdnun56yEwriQZDq1zg0vxxPJJIPD8iXOoKr/ILNEWN7lhxXz3pu2m/YExw4z7dzd7jao+Lh56LVKig+Yrv7wDt5UXTHAXO17tVOHFNVKdWnGj1XQqnS9Lzw01+C1JTwK0Vyv+hTloi2EmQYQsuYWem0NNzhn+OrXi0kHPQn31D1NVJ/fTsEckbudGb6X34mzrJd64sLetk+pr5jLWY1ePD/whUzAxMyCkDR3kfPyKXYSoYL0esGe36/EhVPfdlEdCAjKJuIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPMqGddF6TVxE0mjaSIx0F96tU/UgIBYrGENvAv1vdo=;
 b=aXDnd0cMy+Nxcd15Qk2ZDGYvWIei2pmaW0zF0h3XVttP94H0FZMM2Yc6Q3eTKRVq+86ZIbF98p1YYB55i96/IqNU0i8RHR6PUjk+Qoe3UBsDo7wTmPDq4lVgmBdV9hQugKY6xtAVZVRWibuK1LyGqwxFb4VzLPPR7Kz0ybzSea4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <93fd423e-b104-4679-8b50-69b982ae14a4@amd.com>
Date: Mon, 7 Jul 2025 10:10:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm/mpu: Populate a new region in Xen MPU mapping
 table
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <cover.1751464757.git.hari.limaye@arm.com>
 <5b67459af62106197fb551d35ef1708f0bb5beb6.1751464757.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <5b67459af62106197fb551d35ef1708f0bb5beb6.1751464757.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0231.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::11) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|MW6PR12MB9017:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d728348-c148-47b2-e726-08ddbd2dc095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjRwemo3aUx1MXRmOE40RnprM1FHUldkckM4T0tqU0NpU3RyNnFJaGpTTjRM?=
 =?utf-8?B?N2lXWWpVTCtDSDNFbFdnUkFYL0xHQW1xZUhuQWc4cUdlU2orRWhXcEZRNDMv?=
 =?utf-8?B?N1djeWt1cGxhWWE2NUNzaXhSYlYrQnI0bFJveCszbFpEOG5kOSs3clIwNWV0?=
 =?utf-8?B?UVVlT2VFMUlkWGtnbDhDV1IwcEoweHYwRmQxNk5uTkVDdGtTcmNUcFRBeG9a?=
 =?utf-8?B?ay92UFlKZDIrRUs2NnFuenFjeEJJdDU4RHUxMkw4UC9tZWdiNXZ3MWNWdzZL?=
 =?utf-8?B?aThHbU91amRwWElIYU4xNjhLVDQyWlhpN01vYTl4TnlnbEUrQ25CYWtkeC80?=
 =?utf-8?B?Y1BpOVRreW5CS2JEYloyRXp2Ui9SazJLd2dqREZ6Um5ZZ0JWL3NOY3JoOUd1?=
 =?utf-8?B?eFFXWlBHQzhpRTE4eG5jZlM3MkU3R3JOOGkrM1JHRGd5bHh3N0VlOHJqRW01?=
 =?utf-8?B?aWJUL0ZRWVcveWV0a20rb3JXM3NzOVVmanJIQWNqb2xSSHpMUHRxQjU5TEpW?=
 =?utf-8?B?eUpYL0d5T1hLMUMrY08rTThUYkR4RmhLZkFud08yR0NCRWZVQzNJZGhXdEJm?=
 =?utf-8?B?WjQvT0syUnptN2JBVk1QWTBzQ0hQeS94SW14L1BLUXlMTGtrTEVoWjBXcEl4?=
 =?utf-8?B?VHg4b0RHajU3SlJqWDR2T3o5ZVNyNUlxdlkwTllKdkM0V1FUUWtHOVAxYVFM?=
 =?utf-8?B?NWM5T0VLRmtqTGdOYWVaS3h6WXliSmdZYVZ6Q2djMXdjczk4QTFIL1p5T0w1?=
 =?utf-8?B?U3ZKQitNV0dmM0hxV0Y1RXg4TXNtREJqSzlKRHNBeC8xMkl3NzVOd3FSYjN6?=
 =?utf-8?B?VjdObk91NnVrQUhiYnlpdkFEcWljRmNMdkVCMVJpQVErVllyc3R0RFNXRWRG?=
 =?utf-8?B?NmdDVXFNUUdLWWo0bmtBT0VHS1UxU28rMEUwMG9UaTdQOGVCTUV3OEhiM202?=
 =?utf-8?B?bzNNcUlrMENaU1NrWGNEQWVHMXBPQWUwVlB1YWlRY1Q2bm45ZDVKZ3B5amp2?=
 =?utf-8?B?c1VWYXhpTjZLemdjd1I2dUtlckVneG5KS1hXNVRnV0U4Tk4wMFVJcHljYlBX?=
 =?utf-8?B?cXpBYXVUWjJBNHpBL2xlZk5jcHR4N1FINEJuZ2JSakRDZVBvakJEbmIyRHNI?=
 =?utf-8?B?UG9lYi9LeFdmOUlFUWdxK1ZsRlhWYzhUUVFWTlJOcVdYRzQ3bGNHLy9wM3Zh?=
 =?utf-8?B?Uno2Y0lybU9GVU1HUVNiUGFsdmJOZ3k0aFBSaHhYZDlHSmZMMktPTjEzN0Ra?=
 =?utf-8?B?QS9kVGUrRzYwcjdFUDZOUk5jeDRHV09hUTZIa0ZScms1QzB5TjVBc0V4WXRw?=
 =?utf-8?B?akdTWnY0U2tlK2ZmSXVqT3FjYUw0WGp4T1lDNjdnUCtxUFB0alpwYnZRdGJ1?=
 =?utf-8?B?YWFNRCtLVHF6WDFWTDFGdFZhOFQyWW9XSjZaVHBHUGFtUW5KaHhtUUJ5eHFR?=
 =?utf-8?B?Z0taY3UvblBNQ1RaTXk2QnBKblJTTWRiNUJMaGxocU9xK25vQ3RZVTBsMGJI?=
 =?utf-8?B?VW1nUS9wMys5dUptN3YzYzBQeG5XT20wT3JZZWV4QmJkTUhUTlVtbGloeE9j?=
 =?utf-8?B?WXlxMVQrR3BHekc4MVBmZWV3TWVDSGJ1dHFiRjlaZE82MmFvaisxNHdjYXdw?=
 =?utf-8?B?TnpqNkgvWnVaUFlxSU95N0RwSGJFQlphR2VJN25hZXpVOE40Q053Wkt2V0sr?=
 =?utf-8?B?cSs2QTh0Wk02c0d4VlJqVkNNV055eEp0eWdhWXQ5RUdYcTI0c1Q5QTQxNTVq?=
 =?utf-8?B?N2o4WTlnd2tLZzJlM0ZUY2FuYmg3Rm9PM1hFY1UwZFlZOC80N09JejFmUzFZ?=
 =?utf-8?B?UExYWC9VUG1VbDdzNEZBR1VXbTNBV0ExalcrTFhnMit1aWdlUWJOdU1CVUtv?=
 =?utf-8?B?WDlvZmpjbEdNTzZSQXY0SDd3b0VLS1Vlb1I4OGVIK21YRjBmT2dwejRxWlZE?=
 =?utf-8?Q?7tsrYIu6b+k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzR4VTRGU204dlEvaFBoY0VLSU9uV1VqbWUwaG42eWVVditsTGJGeUIveWxB?=
 =?utf-8?B?TnVRTjdGLzRUb0g5V0cvb2hlUDEyUitRTDZZZUZpUDhyZis3QnVVU3lUWDB0?=
 =?utf-8?B?aEc3MVZPRG44aXk4L21QcUdFOExNQkwzOFdIbWZ6VWRwVU9Zby90WDQwZjMy?=
 =?utf-8?B?V1l2djFOWWpnSW9VK3RVMWZLMWlRL0M1VXB3T09iMTNjaWY5dnBmSEpwVjJs?=
 =?utf-8?B?enRDS2lXV1NnWFljcDFFOCtvQ1MvQks3YkozRW1LSXRscmo2bzVPT1hpcjBp?=
 =?utf-8?B?U2k4U0lvOGU3cTBsNTFYSXdPN3ZHNE1oWkdJYzc0dG1IODF3dENLTW5CbTNJ?=
 =?utf-8?B?TXB1VnpxR0JNakxsOEZvZTBINFY5S25uY1RUWFNRVUtaaVViVzhjR2MrZWY4?=
 =?utf-8?B?SlEyYlN0bE44YVlNMjZvY1Z3c21OTytITyttQTlqeHF0SDdDRmtPdlRMS21D?=
 =?utf-8?B?RWtlOXNkeTUway84RWk4VE1hRS9WTERZWkFRT1hGV2ZzdmkwbTZHN3hRc2E0?=
 =?utf-8?B?ZXJtOXE2L2xPM0FVaWI0TFdEcGNxZEJYdUJjZWdRR3lnbW0weXNOK3FJTlEr?=
 =?utf-8?B?S0JHcFFhSGFyMURaZS9Ba29QMUdNZHFmanhRMysxUXpxVXZHalJ6SStRWnR0?=
 =?utf-8?B?aDMvdTdMTnk3NTRkcGtRQjBKbGJnUmNXZ1IyYmtwTkJ2akw2RHZ6ODNoMy9o?=
 =?utf-8?B?ZStlY0dSbUNob1dGZzB1YzZua3FQbWhaZDNsVFJNaUtwVUp1eUZ0NVpjYjZj?=
 =?utf-8?B?Rk5mR0IzeXd6REtaNkhWTzhjZXlzVXF3OFphdytUY25xOHA5eC9CeWM3WHJw?=
 =?utf-8?B?YWJvT055ZmFHTTBuVCtEcGpTV0dKcnVndnE3UHViaWhnWDNmS1IyZEpJSXVi?=
 =?utf-8?B?TDc2ekI2THRLSGRJUlRPQWxtck1qa1dUMTlaaEViTk5Gazh0VkszbVM3ME4x?=
 =?utf-8?B?K1VpUkQ2NDVHOWVXOFlvUmZwZmdDcFFSQVZWQVpGQUVMYUZKSmRXOHhjYmN4?=
 =?utf-8?B?SEJTbmowcDZhZUlRb1VDYkEwZU90TmdzcjNrK2dVcEdoeUZzbUJteVdQQkJI?=
 =?utf-8?B?OXBxOVdNRERQUzFkYzh0amlQUVRnMWZXNjUxQXVYRmNIbHhPczdQVlFlZmJz?=
 =?utf-8?B?c1phK0c3YUFiUFJQbzMxSFQycjhUTmFRd0RvbW9jWGRETGFHak8vRllIMWc3?=
 =?utf-8?B?RjcwTzh1d2dWWHFBQnoweTQxYmtzYXZWQkZHQjAzQUwzTEQ5U08rZmFKdFBG?=
 =?utf-8?B?MHlVeXlGVWRPTkFKWTE2SE5EY1FtenpzVkg2Z0dxSnNRSytReHdEZ05aZVZT?=
 =?utf-8?B?OEZrT09Hb3N3bEkyT0FwUi9DVTZ6Z1FiMTlJQnBwVy96S3hsZ3VubWUxVDMx?=
 =?utf-8?B?MHRCQ1lYMWpxdEZ0SGMrL2ErdEFXcWNwVUlDN0tpYmhUZGNiZmVoaGxiNDFK?=
 =?utf-8?B?UVpiRGhabG1FaEJvZUlHdDJVTm9tSDd5MXpMMWFlWGduQ1VQc1VKdi9NYWZa?=
 =?utf-8?B?WmZBSWMzSFZtYjlNWmt6NDBEcGNZbTUzck5lc0FmQk4vRzY4RDUxd1BOVDlQ?=
 =?utf-8?B?U3d5eW10SDFMRUJ0VjRGUDZXN0t0bDQ2TVgyR204VW1PWWg1Z1N3UTBKc1Y5?=
 =?utf-8?B?U0VEeXlGcEM2dGUzV1FDNkYwSTZPLzQyb3ZSbGNIUG85Z2NyK2dTclM1UU92?=
 =?utf-8?B?bVB3bU5ZcDhla3AxWU8xYnNGMWRXczliSmhvWUhhME0xVXNlTEhxdDZKcVZp?=
 =?utf-8?B?anhtK0QxSzAvK2xwNjJIaUx3TmowY1ZNQW5DYmg2VHhVdTBZNUwvUFUySldN?=
 =?utf-8?B?TUN2bHJVMDFpZEpXazljUys5RmpXa2VEWnlDWnFDTHYyZEdVMG5BZEpiY1Rm?=
 =?utf-8?B?RTBmZ2ZZd09tOGxaTi9RVDZwS0IzRVRURFdjcXNpU2RNMlpUODF0eklQODFG?=
 =?utf-8?B?bUw4TGpFQ3RSTjlhM0hrNEhGdTVxSVRHYjFGMW4xMkFiSUZsYUhsL053Tk1L?=
 =?utf-8?B?OXBZa2VBMzBxZDNMR1BnQTNSUnBpeUJ1T2MwVCtGRHdnd1hhVWg0K2VRbHV5?=
 =?utf-8?B?ZFU1Ny8zSHNqcWNEVzBLd3pDMC82MDV0UWV4Y2FYeUQwTk5HSzBuQy9taE84?=
 =?utf-8?Q?+0LM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d728348-c148-47b2-e726-08ddbd2dc095
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 08:10:36.1508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PiXU++hPawVTsPZ8rToI4U013mMeyx6SH1kUyRn7SAvwZUqOQa81K7f4pMRgvJlv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9017



On 02/07/2025 16:13, Hari Limaye wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> Introduce map_pages_to_xen() that is implemented using a new helper,
> xen_mpumap_update(), which is responsible for updating Xen MPU memory
> mapping table(xen_mpumap), including creating a new entry, updating
> or destroying an existing one, it is equivalent to xen_pt_update in MMU.
> 
> This commit only implements populating a new entry in Xen MPU memory mapping
> table(xen_mpumap).
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> ---
> Changes from v1:
> - Simplify if condition
> - Use normal printk
> - Use %# over 0x%
> - Add same asserts as in Patch 4
> ---
>  xen/arch/arm/include/asm/mpu/mm.h |  12 ++++
>  xen/arch/arm/mpu/mm.c             | 100 ++++++++++++++++++++++++++++++
>  2 files changed, 112 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index 81e47b9d0b..101002f7d4 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -64,6 +64,7 @@ static inline void context_sync_mpu(void)
>   * The following API requires context_sync_mpu() after being used to modify MPU
>   * regions:
>   *  - write_protection_region
> + *  - xen_mpumap_update
>   */
>  
>  /* Reads the MPU region (into @pr_read) with index @sel from the HW */
> @@ -72,6 +73,17 @@ void read_protection_region(pr_t *pr_read, uint8_t sel);
>  /* Writes the MPU region (from @pr_write) with index @sel to the HW */
>  void write_protection_region(const pr_t *pr_write, uint8_t sel);
>  
> +/*
> + * Maps an address range into the MPU data structure and updates the HW.
> + * Equivalent to xen_pt_update in an MMU system.
> + *
> + * @param base      Base address of the range to map (inclusive).
> + * @param limit     Limit address of the range to map (exclusive).
> + * @param flags     Flags for the memory range to map.
> + * @return          0 on success, negative on error.
> + */
> +int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags);
> +
>  /*
>   * Creates a pr_t structure describing a protection region.
>   *
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 25e7f36c1e..dd54b66901 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -6,6 +6,7 @@
>  #include <xen/lib.h>
>  #include <xen/mm.h>
>  #include <xen/sizes.h>
> +#include <xen/spinlock.h>
>  #include <xen/types.h>
>  #include <asm/mpu.h>
>  #include <asm/mpu/mm.h>
> @@ -29,6 +30,8 @@ DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGION_NR) \
>  /* EL2 Xen MPU memory region mapping table. */
>  pr_t __cacheline_aligned __section(".data") xen_mpumap[MAX_MPU_REGION_NR];
>  
> +static DEFINE_SPINLOCK(xen_mpumap_lock);
> +
>  static void __init __maybe_unused build_assertions(void)
>  {
>      /*
> @@ -162,6 +165,103 @@ int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
>      return MPUMAP_REGION_NOTFOUND;
>  }
>  
> +/*
> + * Allocate a new free EL2 MPU memory region, based on bitmap xen_mpumap_mask.
I would clarify that you allocate entry in bitmap, not a region.

> + * @param idx   Set to the index of the allocated EL2 MPU region on success.
> + * @return      0 on success, otherwise -ENOENT on failure.
> + */
> +static int xen_mpumap_alloc_entry(uint8_t *idx)
> +{
> +    ASSERT(spin_is_locked(&xen_mpumap_lock));
> +
> +    *idx = find_first_zero_bit(xen_mpumap_mask, max_mpu_regions);
> +    if ( *idx == max_mpu_regions )
> +    {
> +        printk(XENLOG_ERR "mpu: EL2 MPU memory region mapping pool exhausted\n");
> +        return -ENOENT;
> +    }
> +
> +    set_bit(*idx, xen_mpumap_mask);
Empty line here please.

> +    return 0;
> +}
> +
> +/*
> + * Update the entry in the MPU memory region mapping table (xen_mpumap) for the
> + * given memory range and flags, creating one if none exists.
> + *
> + * @param base  Base address (inclusive).
> + * @param limit Limit address (exclusive).
> + * @param flags Region attributes (a combination of PAGE_HYPERVISOR_XXX)
> + * @return      0 on success, otherwise negative on error.
> + */
> +static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
> +                                   unsigned int flags)
> +{
> +    uint8_t idx;
> +    int rc;
> +
> +    ASSERT(spin_is_locked(&xen_mpumap_lock));
> +
> +    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions, base, limit, &idx);
> +    if ( !(rc == MPUMAP_REGION_NOTFOUND) )
Why not ( rc != MPUMAP_REGION_NOTFOUND )?

> +        return -EINVAL;
> +
> +    /* We are inserting a mapping => Create new region. */
> +    if ( flags & _PAGE_PRESENT )
Wouldn't it make more sense to have this check before calling
mpumap_contains_region()?

> +    {
> +        rc = xen_mpumap_alloc_entry(&idx);
> +        if ( rc )
> +            return -ENOENT;
> +
> +        xen_mpumap[idx] = pr_of_addr(base, limit, flags);
> +
> +        write_protection_region(&xen_mpumap[idx], idx);
> +    }
> +
> +    return 0;
> +}
> +
> +int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags)
> +{
> +    int rc;
> +
> +    ASSERT(IS_ALIGNED(base, PAGE_SIZE));
> +    ASSERT(IS_ALIGNED(limit, PAGE_SIZE));
What's the purpose of these asserts given the exact same check a few lines below?

> +    ASSERT(base <= limit);
Hmm, given limit being exclusive and later subtraction to become inclusive, if
we pass base == limit, you will end up with limit being smaller than base. Also,
if limit == 0, you will underflow it.

> +
> +    if ( flags_has_rwx(flags) )
> +    {
> +        printk("Mappings should not be both Writeable and Executable\n");
> +        return -EINVAL;
> +    }
> +
> +    if ( !IS_ALIGNED(base, PAGE_SIZE) || !IS_ALIGNED(limit, PAGE_SIZE) )
> +    {
> +        printk("base address %#"PRIpaddr", or limit address %#"PRIpaddr" is not page aligned\n",
> +               base, limit);
> +        return -EINVAL;
> +    }
> +
> +    spin_lock(&xen_mpumap_lock);
> +
> +    rc = xen_mpumap_update_entry(base, limit, flags);
> +
> +    spin_unlock(&xen_mpumap_lock);
> +
> +    return rc;
> +}
> +
> +int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
> +                     unsigned int flags)
> +{
> +    int rc = xen_mpumap_update(mfn_to_maddr(mfn),
What do you expect to be passed as virt? I would expect maddr which could save
you the conversion here.

> +                               mfn_to_maddr(mfn_add(mfn, nr_mfns)), flags);
> +    if ( !rc )
> +        context_sync_mpu();
Shouldn't this be called inside xen_mpumap_update() and within the locked section?

> +
> +    return rc;
> +}
> +
>  void __init setup_mm(void)
>  {
>      BUG_ON("unimplemented");

~Michal


