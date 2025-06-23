Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C10EBAE36BE
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 09:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022050.1397754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTbZ2-0007wU-U0; Mon, 23 Jun 2025 07:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022050.1397754; Mon, 23 Jun 2025 07:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTbZ2-0007uq-Q4; Mon, 23 Jun 2025 07:26:00 +0000
Received: by outflank-mailman (input) for mailman id 1022050;
 Mon, 23 Jun 2025 07:25:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqlE=ZG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uTbZ0-0007uk-V0
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 07:25:59 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20609.outbound.protection.outlook.com
 [2a01:111:f403:2407::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cd34663-5003-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 09:25:56 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH7PR12MB6562.namprd12.prod.outlook.com (2603:10b6:510:212::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Mon, 23 Jun
 2025 07:25:52 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 07:25:51 +0000
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
X-Inumbo-ID: 4cd34663-5003-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzA04K424lka1oquFfBW2T/m6eQOk5i55rzQg6lK7vWaDad/v+NxutLd7Mn4AfMd2To+hhmN+YAQQH4wCL5DWZxlWk68t74rHbDH7JcXZZCSwSkztywZ+y8c6RoFmALaHoxHxrVi7Md/nYQkicJkACQVeMWPDf6ApLWVo0sfjJCSw2ys+B/JTQsHAPvewmltvLa48Mn0JJ29M7aYLz1+IM29cB3r2hJ4EVSJuK6O4IZV6I8Hzbr0KBZIeZY+Ma4DD5V57wZygFg4VLXxGHINuWxpUK4pQAKC4xREbG6qQqcZJlS1seMwGaawwwn0kdKVplLVwau7g7VB75GERYW3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQ8K5CW1iSp6wsw3fww2lA0NxfyiVxbhq2O0EC8zilU=;
 b=w3Qch6CSNaUGz32+XodX8lGFctrdYwANAHDodX/yJiJsD5E7eLMyng0Rq2sHUZMpgETNOSW5pkxMbh6hyJqZS0v2bL8+2CKplLzjH9P/2yeAyMbOhNXTmV1umX6F5j+EfXtcyaY1d4CnKODuo2bUIELdPRF19DoCMhGtqWArz6YkNKgC1AQZRo7YywtqOLbuiv0RoPEdABEMs891tM6ZpHDJbdR8LPRlJ1kkWcLD4/3udRsX8ZGfKF0s9EqBGzes+oMA+G2l5RdiPizXdfKjQUtYEhVAqsVphKm0KXB87wCqsudaFYcFRW4RXwQP2XEUA47sc/0x/HVAAadVRvHlIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQ8K5CW1iSp6wsw3fww2lA0NxfyiVxbhq2O0EC8zilU=;
 b=EG+eYDDzxQARSRiXTvjG74FigC0GvE2w1Ur2wypXuhtS1pgdpz8+GlMSIgpv68yCgEZ7SySxnoumLivS3BBrLcdcJhUl9VKBQmlOyzdZoP11rPOxmQFlwt+8U/AO7NDDJMgX3dCr0O4ZWIbmUbHpwzOCX80j4G6nvJfF0ROZyBg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <445c5594-a003-4cd8-aa46-8544c0543b1c@amd.com>
Date: Mon, 23 Jun 2025 09:25:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Enhance IPMMU-VMSA driver robustness and debug
 output
To: Jahan Murudi <jahan.murudi.zg@renesas.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250620103123.2174529-1-jahan.murudi.zg@renesas.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250620103123.2174529-1-jahan.murudi.zg@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0266.eurprd05.prod.outlook.com
 (2603:10a6:20b:493::7) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH7PR12MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 6665f1fd-ecd7-464d-5a8c-08ddb2272edd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3J4ajBYWitHUis1dllPZmJtdjBya0pHbDRRTG5Rd2oyM0VTY0tFM0F2QUZ1?=
 =?utf-8?B?UENiQ21lWk4vUHNOeWxxWEJYMVZDRjVEV05LemMycGhhMUlidEdvUVJydW9r?=
 =?utf-8?B?Nll3Z2FuNEJicG9PTGZoWHVhVUdqYkVrZzBiWm8rd2V1MjREVCthWTdoOFZu?=
 =?utf-8?B?NHE0MmVsN2pvOVBYbDc3MFZHa0xtUm1QL3hqOFJqQzliZnZhZ3pjeENmekJk?=
 =?utf-8?B?ZU56R0JRU09YbEZ6YkczZU81bnpXYjRvbW9SU2x4VENXRkRsQlhiYzZ3MDlP?=
 =?utf-8?B?WVN5WU5ZT1VJQ0tCeE9QZTU4M2NmWldTVEI2aU5acldzdXhQTWVtWi80TlM4?=
 =?utf-8?B?NkdPZkV6SUc0djBPbkJsSW1KVW1kV05DSVMzb3pDVjd1SVY3MHdCbFhUNmRa?=
 =?utf-8?B?TTBwU0J4V3h1dGlRbmE3NHBDRHU1NDRGbVpGQTBuSFdJTWRZblRpOC9qdHhk?=
 =?utf-8?B?Q21QdTA5RVpCUEZld1ExcHNkNEYrYzJ3dEZrRGp4OTZvTEtJY09sMkpaUVZK?=
 =?utf-8?B?NVRyeWIrWWd1eERPVDdtZ21hcUExQm15TUcwdFRlRk1GWkdpMlg2YlhUbmpp?=
 =?utf-8?B?eUgrN2puZy9aMWY5bHJQSVUvZExmOUhHdWVvMzczTUpDOUtzK3dpVlYzbmhK?=
 =?utf-8?B?d0F4K0RzVXFXOGJDOE4rT1ZacjFxVUNzSkNTdGNrdERTWit2TWZiYU5hc1No?=
 =?utf-8?B?b3hIK2VDakFWNjUxdG5MN1pwa2pBWGdSMUxXVnVRdVJrTE5vcXlFMjBaZW9l?=
 =?utf-8?B?OVMxN0RXdzdBcmlDbGhlaVVXM2JIZ1lKWkl4aHJOdlZlYlhzQmVHTFZiMnpF?=
 =?utf-8?B?c0ZFN1JabDBxV1BIdjc3RlVEcktZclRrK2hDVW53bi9mWkhGRko1TnFTaVFS?=
 =?utf-8?B?U3FzdTdNYXpYMG1MNUpGQ3FUVTFHREJEYlhlZEhKejU4dmxNeVdWYUoycmww?=
 =?utf-8?B?SE9Ib1piYkdrclVUL3VYRmo4RWc3Z3Jpclk5OHJSUXZCcVlYWW1ZdXYwN2Rh?=
 =?utf-8?B?VjBvSE8xVVVqb1h6Q2FUeDdSbFRkSERFSzFYbVhMRmoyMU1yaU9IdDRRaHRV?=
 =?utf-8?B?Vyt2UStwVHdpa3RFb0NQL2JLRnNyN2V6Y0ozRWluNUpENmxkRDEzZ3l0VVNp?=
 =?utf-8?B?VDEwTXhRcS9ERlUzNWFtTWJSb2NlRmduSmVnR2FpYU5Ta3RMbVRsWEdBc2Iw?=
 =?utf-8?B?OWFoWEpJNHJTT1BmOGVCUVZ5YTVoeVgvejNtQlBHWW1sRFdEeXBHaTltNkM0?=
 =?utf-8?B?OHBNSEZjWXNJZFpUZjNwOUVhRG96M05ZVUhHcjM0OHhJbzZXN2pGRGl4SENR?=
 =?utf-8?B?TnVvaTdFMDE4LzlwVElFckhQbHBiTWJnUCt3N2packVBWmJ2V1loYzA4RUhU?=
 =?utf-8?B?dzV2ZVJ6NnowVmp6N1I2bjZvM2svK040cHY4bW5ManUrR0RMaUNHMHNmOTJW?=
 =?utf-8?B?OGF5ZUh0U0FJYWQwSFRwS3NTTTQzU2ZkNjZqald6TG96STVjQm42VnFDOXJZ?=
 =?utf-8?B?cFc3ejVGVFNNNW9QZnhSY0RCZVZYdG1tcjRVSmNZbnl6VmhRTEFJVGt5RUJQ?=
 =?utf-8?B?Vm15QnpPVWpCaDI5QWs1bnZRSENVaWQ5bnRvc2h2QW5xWmwwcXpoSGtkbXR4?=
 =?utf-8?B?UlRFNG1jTFZJMG4yUFdaRytia2MwZ0EzVGJPd1V5aUIvRWovQjdFeldvaFd4?=
 =?utf-8?B?b2w2OW41KzZUZFYwSHpsVDdzcWVMT1h2WmRCU2lNaU1OVXZSSDlpTWZISXVr?=
 =?utf-8?B?bS9sTTJRckxiYnRzRm82cldVakdMSjRybU40bVUvZW1LZWhqdGRLTnc3Njhs?=
 =?utf-8?B?Qis4NTgxb09xLytvZVhLUnpPbFpES2lBWVBJUWNlYy9RQVd2dG80WGlJc253?=
 =?utf-8?B?c1JuR0M2dGRSWnkwNElqQnViS3RjYnB6Rk4vbUN4OE1WU1ZDMFZZcTdDaXYv?=
 =?utf-8?Q?H7KPwXCu08c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cks4eS9BdUJLZkRoSjZTaFdvL1NON2pxd1hhYXNXRlhrM0NIOWkySTFCQUdt?=
 =?utf-8?B?S0ZGQjl1T0MvWUtLV1NwMjNjb3NZREdsWGpSYWhVcnZXcWF4N1BWMEQ4MFox?=
 =?utf-8?B?Tmt0by9KK1dxcmF0M2xnUHhiQmFhbVVPeUs2U3d0OCtzL0tTeC9zTmczK3hR?=
 =?utf-8?B?bmNQcnMvSFBmRTFFbWlhM1hRN1NMdU5FZ1pZakg1SFcyalZFU1hFakMzUldC?=
 =?utf-8?B?T2YrbGJKb1Y3dFpZVkY1cUp0NXl1c1VCN3JKNUErUjdJandIaE1jdGN5dlRH?=
 =?utf-8?B?VWRoa2VGdW0wUUFFTnh3NGlIdnE2ZGwwcmNCcHZ4bmRBT1drclJCYk81a25M?=
 =?utf-8?B?Q1YxYXMvVDFzVUl3UEpNMlU1bEFGSjJ1UFhiaHNMa1A3dU9URDUwVm80bUxp?=
 =?utf-8?B?QXh0SElDS2xmRUI1WWd2aDNaS0pYcTBFNHI5Y0o5Ym5vUDFjSTBkMDNrRTBR?=
 =?utf-8?B?SlZ0WlJiYU1HS0VSRDJ5Zi9neUhBZjN4QWRsUC9abDM3WmdnYVFZcTJSZHov?=
 =?utf-8?B?VmRNV3FkVmtITDlLZU5RZE8xS1ZPdy9xNXA3bktoOC80YmZYbjlDd1VyN242?=
 =?utf-8?B?YkZieWh6S2o4MW05U2d3NW1kbS9MOHFMaUhsTGtMbVhNOWVvMU1KUlhUUnFF?=
 =?utf-8?B?dnpGSHNtQ1Jic2tqTXZoeVRYL3VlQmJMdWdwcjZTWmQxZlB3cC9TL09tWURx?=
 =?utf-8?B?YTdWQllFdHhJSEVDTGZGUFkzeDdETFRKUHNJWUpKbXdMYnU3bTVXdzRMT3B3?=
 =?utf-8?B?bDlGYlgyMDZ6NUNQYjRMOUNieTJuZm5rdzRPM3hieEV3cGJ1c0d5M3E2ZXpX?=
 =?utf-8?B?V2tzRDZ2eVJ2RFU4M0piMlNQczFUNHNnYVdNdDZaMUpCY3BNOXowcUhtTWhQ?=
 =?utf-8?B?ZDhnRHFuMTVCek11a1BJMGpOa2tCdktyaVU0dURSc3huT0RwcmcrREZwb1hW?=
 =?utf-8?B?Q3gzaFVHRHU5QmFad3YzaWI4RG5FRnlWVUtLa2VSUU1FZzcxd29wczRNaWlF?=
 =?utf-8?B?MDIxSFE4UXpOZ1RQRU0xWG5VVDhMaXowamJuVEhYWndlR1ZPcGNWTDhBRzQx?=
 =?utf-8?B?ZTM4OXlNVWM2OVZFUXh4aHI0TkJHVDZiVXRxOUlmWWd2NWFCMm1WOTRFQU1C?=
 =?utf-8?B?WDh6dkpEbzFLeHBQbWc5NUk0U1h2bGt6cGZFK2hJVEYwRFlQTkcyVDZSNDdV?=
 =?utf-8?B?MUgydk95dGRHKzhPM1E1NjlkWUhSZkRnSDR0OTMxeTJHcFVCd0F1V0V3OWIx?=
 =?utf-8?B?cmE4UkRXSWM1NU9peDFySG5iOWhPWkcxVHUwbkJrZURkR00yL2p5bUZHQTVI?=
 =?utf-8?B?NG0wZ3lEZE1uOTJCbHdVN2VtdGJvQnVRT05HVlp4S01saTNHbW5QQ1U3aFZj?=
 =?utf-8?B?bXRsak9PbHFqVnpBdHlEZmIwMGZaOGlQdG81RzBKN0ZpL21GdE5lLys0RDBO?=
 =?utf-8?B?V21mUnRhZEJLQ25Fd1B5N1A5ZFliY3RqdElKVFlXTXFheWpJeXc0dEEzVnVs?=
 =?utf-8?B?c1ZnM2QzVVZLbFVDTDFQNUxsUUdtd3Y0VVBOYzZRK1FISk9WZURHK0ppZHJo?=
 =?utf-8?B?U2hWSjlLWUpoU29udituMWt4RmszWWlQTUxkaWdJQVNjTCtOdUpaRTVoRmsx?=
 =?utf-8?B?dCtaUTVYLzBOZVR0ck5KYjc0ZHg5cVJ4K2c4NS80d3JDRCtrTUhzL2JMMXVW?=
 =?utf-8?B?WEFlaTJZUHZVelpJeXViTFdkREswRlVGa0Q1MCtBNjJGSHl3WUlpMTB4bTZ6?=
 =?utf-8?B?cjNZL1pmZEl0Nmo1dWE4WlhtdGJOeWR4NUd1K0c1YTlnNnlQdkdSZDB0Q2Ny?=
 =?utf-8?B?bDFWSjcrV0V0czVzUmc3cmhjSFp1MzJMUHdDbEVtSEhubDF2OVdveDk3RTJS?=
 =?utf-8?B?Q2RzUTZaMVNCYzhMV1ltaDE4d2VaS05yczlWRm9ZdlNuNXBUUkcyZHBnS055?=
 =?utf-8?B?Yk1DMGxwT3hmZFRhRWwwVFhHVHpEYTRpOTBtS3FPZ3A4d2JlZ3FDTlBQVEly?=
 =?utf-8?B?L3lXYW9mSGNtWUc3M2lqSXI0V2p3VU5Vdlgzcjlkd0xYeHRFeUo0OGtKcVhW?=
 =?utf-8?B?YzR5VEprb2ErNklFUThuWEJ4QXFMcUtEZUNxVkFlb2svSExlSEFoYWl2Sm83?=
 =?utf-8?Q?sGbA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6665f1fd-ecd7-464d-5a8c-08ddb2272edd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 07:25:51.8161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBmuH9s5lQ+yfZYrXvPGTgj6MhassJ8SbjTLV50dVDgFfg7E9nNT2hWvzUH98D4Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6562



On 20/06/2025 12:31, Jahan Murudi wrote:
> - Fix typo in source comment ("you can found" -> "which can be found").
> - Add dsb(sy) after IMCTR write to ensure flush is complete before polling.
> - Add dev_info() log in ipmmu_device_reset() to indicate the number of disabled contexts.
> 
> These changes improve memory operation ordering, code readability, and runtime traceability
> for IPMMU on R-Car Gen3/Gen4 SoCs
> 
> Signed-off-by: Jahan Murudi <jahan.murudi.zg@renesas.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

> ---
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> index d828d9cf6a..dac0dd6d46 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -13,7 +13,7 @@
>   *
>   * Based on Linux's IPMMU-VMSA driver from Renesas BSP:
>   *    drivers/iommu/ipmmu-vmsa.c
> - * you can found at:
> + * which can be found at:
>   *    url: git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git
>   *    branch: v4.14.75-ltsi/rcar-3.9.6
>   *    commit: e206eb5b81a60e64c35fbc3a999b1a0db2b98044
> @@ -433,6 +433,8 @@ static void ipmmu_tlb_invalidate(struct ipmmu_vmsa_domain *domain)
>      data |= IMCTR_FLUSH;
>      ipmmu_ctx_write_all(domain, IMCTR, data);
>  
> +    /* Force IMCTR write to complete before polling to avoid false completion check. */
> +    dsb(sy);
Any clue why Linux (mainline) does not do that?

~Michal


