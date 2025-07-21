Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4F0B0BFB9
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 11:11:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051244.1419553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udmXR-0008Vs-Sb; Mon, 21 Jul 2025 09:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051244.1419553; Mon, 21 Jul 2025 09:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udmXR-0008Tp-Pg; Mon, 21 Jul 2025 09:10:25 +0000
Received: by outflank-mailman (input) for mailman id 1051244;
 Mon, 21 Jul 2025 09:10:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cu2o=2C=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1udmXQ-0008Th-Nz
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 09:10:24 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20626.outbound.protection.outlook.com
 [2a01:111:f403:2408::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84f3a666-6612-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 11:10:18 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY8PR12MB7610.namprd12.prod.outlook.com (2603:10b6:930:9a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 09:10:14 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Mon, 21 Jul 2025
 09:10:14 +0000
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
X-Inumbo-ID: 84f3a666-6612-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBkLpIIc2D/O62zh/OJCrS4yaxAX399ImB1mueDkL5R+bgVZHOdmdF7sz0ANn6Mw/OTU7qHDHvkBmVwlv+72/q0/xBYsxdIDFTcUWUFPv3+wCOoBsmo95ae6mhKIgj1y93NLyiJF+9lgwXVeDq3KVCxtiabyYIobxulF5eXLzchlyd4V7XdZFE+IUzctV7O2H/jVDIqFxjwH0OLu8nk32lmbP/JMFbxbT+DMSbOHbgr5zWZ3/DvnhGKuDLUcqbBZM+uvCrUh4Y94sr46EQx1joQMMae2qNInHlba8XmE2gqBKjBqdgr04Iqdptoi8D77u3orxcMCIGC0RPD+6CGuMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7QuHqKKOhGRzHovIliT7Fr4i0zxUmG96yspF54BzX8=;
 b=qRG0ogfeMTN84d8SdrpqsXE6axk/GYfzSZXBxNTZSK/GFABBSF/i7vdaCf9k3hnuQP+l9FZ/zeEKqkMRjIhQO81Xv97b5p49FsxeHpTZb5c+WeYW2GjE2Onx+SyGAhr9AofMESdinFGolSFvSuiP0InGTFVnS6ZXtjuXutvreG5XmbLCo+STgWsNh06KeMDIMFOhnxV74aLLiyBypo17FzlAHcB0SiR6vKHcUYSxxYcn/gmZA5uOFBwe+5j7usihsKa7mTcdRbkVjdijyNVkpVCsoUGHi8po9ApBFMllgYe4ulacelbUnJVvynigmvSaZyfQLTJM+KgxUJchUZeFdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7QuHqKKOhGRzHovIliT7Fr4i0zxUmG96yspF54BzX8=;
 b=ytNd7TlhX3EpVKHO6bmUPfeaFan/outQp2RmkWbzxdIIOVD/H9pfvalpYqrqIMTnTUFIIBtN4i/JRTA9GLV9lpsdwqDdSc8hsT8/mPTDEqFmciSc+dWmyBELttpcE13HmcCiQeurpSyFyRvWXmGEdHtN6Ka1fRt9vQS5nCgIToo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <704db270-650a-497c-b536-2951b35a8102@amd.com>
Date: Mon, 21 Jul 2025 11:10:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm/mpu: Destroy an existing entry in Xen MPU
 memory mapping table
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <cover.1753084737.git.hari.limaye@arm.com>
 <7050dc0abf9efb69958a8b4fcc1c325d2e937fea.1753084737.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <7050dc0abf9efb69958a8b4fcc1c325d2e937fea.1753084737.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0280.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::16) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY8PR12MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c689381-8fda-4817-21f8-08ddc836672d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3NtVXh5cnMyNDZYbVhjUlUvb1BURjUzVWJjKzNVV1Y3Qmp1OWlLQnFiTkw1?=
 =?utf-8?B?Mm9vQUNBWVI4b1k4WERqMXA1R3VOQ29GV21kckdZUVUvWXJXTm8yNmxZRG41?=
 =?utf-8?B?KzkzN2hKQmVtaVppWkVTV0JTQlAwZUFvQXMrRFcyYkt3QWNGdFkxZjF3cHc1?=
 =?utf-8?B?SW9Ya2h2cWphSXdDMVpwMVMrT3owaWE4eEdEMXlvRDBRdVl0cUxlOGlLYlFZ?=
 =?utf-8?B?L1U5WVFlbkNieWlEZkd1OW1hdUI5T0gxNkhQMzF4cU0wTEhZVFRrbUx3QUVs?=
 =?utf-8?B?SGRsV00rTEsyYThsZUVSd0xmcmdnRW1SQnpNbE9tZThzNUp4WHBmdFlybXZS?=
 =?utf-8?B?MytHKzRNaGZBWDkraEdQU0Z3Z21jaVNKV3J4cVNQRHVuZ3dWTmh2OW4yNjBi?=
 =?utf-8?B?MDV5bnBCMHhuOUxHRjB5NGc3OHUweUZNejZXUFpZdFJRQ2lZMm9Kc3hMcm5v?=
 =?utf-8?B?Q0JDK1lha2ROQ3NNV1UwOFdNWEMwWWlBV1pDWTVZNEJGUGk4czd1Mko4YlVz?=
 =?utf-8?B?a1I1RTlyNGZic2twQ0I5WXB0WnpsRGtHVHNaNXdSa1A5V29ORlNPaTF2dzJ2?=
 =?utf-8?B?dEplWm1JVFE5RVBDTjNrckR1UUVjZm15QjhoSEpvcUZ2RnhVNXBFc29qOFJ0?=
 =?utf-8?B?YysxSndhSnFrT2NncEI4TDhQQmZUMVRON1A1aDdPUGdqMnNiZFVGcmwvVGNL?=
 =?utf-8?B?d1EvRndEbWZZdXhpRXZxbG5qYlVvZ0RTWjlsbUU3UnU5WVFycGluRWY5SldL?=
 =?utf-8?B?QnMxdWRqd1Y5RGVMMHJpUVEvVlBGdHdzazdBN2MrMlhkdU1KeGNFRDhnK25p?=
 =?utf-8?B?WEd2OWg2enJ6Wkd6NVdaT2t5QkNOZW04UW9wQlhJZkNrdnp2WVk1RzRUNG5G?=
 =?utf-8?B?bjhkNm5iRExEMnNucExnOUZ5czZONzRzdDcvOHVNYmtTZGZWYkxYZXdJZU5F?=
 =?utf-8?B?T0VxZG5IZm55MXNLZkloQWNwdmhEaCtLUTRGeTRqZXhGVVJsZ2xhSno2WHF0?=
 =?utf-8?B?MVQ2UllZVGVjNWxGOFVnUjhTZzFsdTdnQXhtQ3Y4UG52TWtuQnEyN1NENnRT?=
 =?utf-8?B?elRqOXIxUUZDeTUwbmJNREFqU3dxaENmSUVtVCtZY1pyd3p1WW4wRGVWZS9y?=
 =?utf-8?B?SHNJTnY1TFZ4QlgwVnpIOXFQV3R1eURzQmJTa1ZNV0Q4V2NyV1FGN3lMSEI4?=
 =?utf-8?B?NGkyWGZKbnV6V1FBWk5kQzExS3FXT2VDMEpueTFYNzdLbzE4TFNndWVJdFM5?=
 =?utf-8?B?TjBFcG5CUTU5V1o1U3hEaG1iNFNrMmlFWmJzZlVMVU1leXptVEF4aHNQTlVS?=
 =?utf-8?B?SUpHS0VzTS9vd1htRStoQktwUmxtV3NVSVBBSUh5QlFuUGF3eWg1OTVPQmNV?=
 =?utf-8?B?U0QzUGpmdTExL0hNS2hnTmM1c3BqdEVwMVo1SjBTNlluTW03Ny9sa2xCVDRK?=
 =?utf-8?B?VjNZS3MzN3JzSFExdFkzZzB2em5zeUtjVWZkTi9sZWUxWEVYeXhGL1dZRFg2?=
 =?utf-8?B?clJnNVF1a1ZBUHhYckwxNldyTGpvYmNxTm5FMjVmaUd4T0JBQWRZRjVUUzkx?=
 =?utf-8?B?WXhNWWs1ZmFFZ0pQRDl0REV0YWxJTXlFZnZXQzlZMlBJd3BZbFN4UnA5MktJ?=
 =?utf-8?B?WTVqYkQzRitKclVkWGFPWllnUjRTdkpzYXdYcEw3eFZnRXNtQlFTb0ozbG9s?=
 =?utf-8?B?QU1neldrZEtCOFUwUXAvc2Q2VzA4SWxGK1Q3ZTJPZ3dBVUdhTlAxRXhwaWlY?=
 =?utf-8?B?ZkdGMUwvZDFSWlEvMXd5SXUwNnAwTFBza3N4RDJieTg5U2dDdTdzL3ZZWmsv?=
 =?utf-8?B?aER1VXpQNmYyRTZDVEdnc2dncS9XMWl1VkIvT3I2eHppemowaEFEdzUyZzda?=
 =?utf-8?B?a3pKWEtTcHJieUcxRDF2b2VHZ1Q4dDd3amhPZEtYQjhYMU1hU1Z0YXBMczh6?=
 =?utf-8?Q?upu4ykDJy4o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bi9xVjRZSTRRRXFuQ1RmaGtoNUIyMHRVT24ybURkVUsrTXlsaW5vSVNSTkIv?=
 =?utf-8?B?WUkzelVncnkvc2o4TmpLSDhQY3RjdERnVzc4MmVUQ3ZjNTRDTUlyRlNzcVpq?=
 =?utf-8?B?Slk4YzY0a1NDd0ZZbkcvQ1RxdXJRMGRWdmJqcG5QbVRUN29JR2pHN1ZvN1BT?=
 =?utf-8?B?NE9aN3hLTVFHdytXWGFoN3I5Rm5VbWc0YzNJVWpTbGs5M2FYQ0FsY3BCQjhz?=
 =?utf-8?B?NDlVbkNLTHNETS9jMllsTDV5WGNPc0c3bTVBTkh2eDE0THpEc3hYRjBraHps?=
 =?utf-8?B?YVpJZGVJSHlzQjBTYnBaUlNYNUpDQWVqZXFlSStXOG9rcnhyK2M4aFhNMFR4?=
 =?utf-8?B?d0NxOEh3MlFOVXlURkIyK1hJUmZuS29vbWVWdmJoYVBsZFRyRy9hSnpYaEkz?=
 =?utf-8?B?MmdUSDR1UnNvWkRuMnpENDkxMzBHSVlON2J3YzhNWmdPbUNjZHpFVnJPcDVU?=
 =?utf-8?B?dS9yY3ZBUWF4V1hXS2hVdFMzcDBBZzNlNTRadENPRzROT0xOT2VyR2lPZFZi?=
 =?utf-8?B?cEt0NEdNOXV3ZjFqQitLV3p5RU13SUdjWEtPeU9GU0hqdm15SncxN0l4dHdG?=
 =?utf-8?B?ZHBTMTJHcTArWExuWDJuNkd0blZTcVZtWWlnejNORFhCam9DSnhBemVaYU51?=
 =?utf-8?B?bUkzUUNtMWh4Mkd1TVBzSzZmaUlFM090RUlkK0tmcXcwTVRGYUZ3TnVKb1Vy?=
 =?utf-8?B?Q05JaWcxUVVxalJXZnhBemJGTVZJVTZ4NFRqNE1RME9FYjRnZURJRmFWemo3?=
 =?utf-8?B?Rkg2OW1YKzVBa09IdDRBVUlxUDl3VUFxN0xDU3NxazBjVFE2Q0pjVDdGWEgv?=
 =?utf-8?B?QlpVV0w4dlpPd05UQzZOdlZDZU5mRFRVZThaM2ZSOWFHN0JjTkRBN2xCYUd4?=
 =?utf-8?B?TUFXYUJPRGlUaW1Vb3RsSGdKUHpBV2hJZi9kYnBqUHdkdndrZWQrSU9sNU9m?=
 =?utf-8?B?SklQMFhUdGpXcDJHem96MHhBV04wZ0pZRUdOWk1tanJFVnZyME95RE1PdHgr?=
 =?utf-8?B?dUhzbGZoNHZmTXN5RktYeTArQmI1ZW9kdkZrQnhaeFFDUEJKYk5kSXUyMjNT?=
 =?utf-8?B?RWxKa2h0TDVjUSsrUW10NDhLTUlPd3VXeUVrZmlLQm54cktldGhaR3ZudUZ4?=
 =?utf-8?B?ajZwR0h3TnVuY2c2bmhQSWJBNy9KNGJrU055R2JHZ1pyMHJxUVB2UFg1QWt3?=
 =?utf-8?B?K1VtT05Wc1JLZEEyS0xlZitWNzR5bnNNQWZsek1oVHhRVnN2d2pDUjRXejZY?=
 =?utf-8?B?OEk5YkptbmdFUHE4R2tlY2owbXlyTjNaNGFUeVRwbVFnMGFRNUlKZGxseEFt?=
 =?utf-8?B?Yno2cW1hUjhueGZ4bVhrcGRFQWVzeDZtREcvZUtWNzU0NHZNV2NvMjZEUWJt?=
 =?utf-8?B?TVE4bFVES1JVMTI1clJjS0wyMUI4UXBsd2RpSmsyQklyUFdrOU94MW1qY0xL?=
 =?utf-8?B?WWxsV09RaWtUbjdTc0d6WWNOcHNKOENHenFQQnlkT0l2UjFzQmF3ak9VR1NK?=
 =?utf-8?B?UWxDU1ZjT2RTQjcva0JYNnZ1WlExWXdVbjVzSjdZL3Y1RnQ5eFdiYXFWRWZn?=
 =?utf-8?B?WlpNZDJNdkxGNlN1OGxHSlNpSUt5SHZrK0YyNG9JdDhEZUcvWkdwSUU4Qkln?=
 =?utf-8?B?SjB4TExld1hUVXNGdWk1MUJSQnlDeURWS0R5ZmZoSlJ3MnFXei9UZUhSbWtK?=
 =?utf-8?B?NWUwbVRNVGxaQzB3S0xBRC9VUG9IOXUwUjNJUWpuSW1QN084Q0UzL2JzOURL?=
 =?utf-8?B?YzNPU1NGTkEyUE54RXJoTUZidzlPRUZ4Y0MxWVREZVh0NkJGNy9RbkZGV1NP?=
 =?utf-8?B?VUhrbDduWTUwVStwcXEyWUFhSzJvVWlEMU5SMkZOQkpxVndQVStHM21RUlZh?=
 =?utf-8?B?cnQ2NGtweG1SbXFHM3c3NTNYaEhaV1BTUVZwUHpjcGJlMHpWNitwWFp1RnBn?=
 =?utf-8?B?dWhhMndlWmNkeUNjUWlGSHZ6WXV5WExCVm40aU1HSFJaRU13MWNVZVJCWFFK?=
 =?utf-8?B?K1d2STU3ZUgwWGg3dnA5RHJFRnBRVWxzek12dzN6YXNIR0xDcHNLSDBrV0hs?=
 =?utf-8?B?eGhuWHMvdlMwWGpzZDBVWithNUNmSENxVURJNXNVQ1hTNmlVL0c0OFNSQjJL?=
 =?utf-8?Q?kycE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c689381-8fda-4817-21f8-08ddc836672d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 09:10:14.3514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLK/BKw0iQWG64sSC8unYuvLxZ0C+/s7wMMTNG44YTIyec+qUtdw8NI8mo1kJVr2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7610



On 21/07/2025 10:31, Hari Limaye wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> This commit expands xen_mpumap_update/xen_mpumap_update_entry to include
> destroying an existing entry.
> 
> We define a new helper "disable_mpu_region_from_index" to disable the MPU
> region based on index. If region is within [0, 31], we could quickly
> disable the MPU region through PRENR_EL2 which provides direct access to the
> PRLAR_EL2.EN bits of EL2 MPU regions.
> 
> Rignt now, we only support destroying a *WHOLE* MPU memory region,
> part-region removing is not supported, as in worst case, it will
> leave two fragments behind.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> ---
> Changes from v1:
> - Move check for part-region removal outside if condition
> - Use normal printk
> 
> Changes from v2:
> - Fix assert from `ASSERT(s <= e)` -> `ASSERT(s < e)`
> - Remove call to context_sync_mpu
> - Use register_t
> - Improve sanity checking to catch modification & removing non-existent
>   entries
> - Update check for MPUMAP_REGION_INCLUSIVE to be generic
> 
> Changes from v3:
> - Move early return for modifying case above MPUMAP_REGION_INCLUSIVE
>   check
> - Add bool variable to store `flags & _PAGE_PRESENT`
> - Remove calls to `virt_to_maddr`
> ---
>  xen/arch/arm/include/asm/mpu.h        |  2 +
>  xen/arch/arm/include/asm/mpu/cpregs.h |  4 ++
>  xen/arch/arm/mpu/mm.c                 | 95 ++++++++++++++++++++++++---
>  3 files changed, 92 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index 63560c613b..5053edaf63 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -23,6 +23,8 @@
>  #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
>  #define MAX_MPU_REGION_NR       NUM_MPU_REGIONS_MASK
>  
> +#define PRENR_MASK  GENMASK(31, 0)
> +
>  #ifndef __ASSEMBLY__
>  
>  /*
> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
> index bb15e02df6..9f3b32acd7 100644
> --- a/xen/arch/arm/include/asm/mpu/cpregs.h
> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
> @@ -6,6 +6,9 @@
>  /* CP15 CR0: MPU Type Register */
>  #define HMPUIR          p15,4,c0,c0,4
>  
> +/* CP15 CR6: Protection Region Enable Register */
> +#define HPRENR          p15,4,c6,c1,1
> +
>  /* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
>  #define HPRSELR         p15,4,c6,c2,1
>  #define HPRBAR          p15,4,c6,c3,0
> @@ -82,6 +85,7 @@
>  /* Alphabetically... */
>  #define MPUIR_EL2       HMPUIR
>  #define PRBAR_EL2       HPRBAR
> +#define PRENR_EL2       HPRENR
>  #define PRLAR_EL2       HPRLAR
>  #define PRSELR_EL2      HPRSELR
>  #endif /* CONFIG_ARM_32 */
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index d5426525af..2154b3720d 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -189,6 +189,42 @@ static int xen_mpumap_alloc_entry(uint8_t *idx)
>      return 0;
>  }
>  
> +/*
> + * Disable and remove an MPU region from the data structure and MPU registers.
> + *
> + * @param index Index of the MPU region to be disabled.
> + */
> +static void disable_mpu_region_from_index(uint8_t index)
> +{
> +    ASSERT(spin_is_locked(&xen_mpumap_lock));
> +    ASSERT(index != INVALID_REGION_IDX);
> +
> +    if ( !region_is_valid(&xen_mpumap[index]) )
> +    {
> +        printk(XENLOG_WARNING
> +               "mpu: MPU memory region[%u] is already disabled\n", index);
NIT: In this patch you start adding mpu: prefix, even though other messages do
not have it. I don't think it's needed.

Otherwise:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


