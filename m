Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E40BA77D9A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 16:23:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934457.1336152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzcWC-0002kr-QT; Tue, 01 Apr 2025 14:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934457.1336152; Tue, 01 Apr 2025 14:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzcWC-0002jE-Mg; Tue, 01 Apr 2025 14:23:08 +0000
Received: by outflank-mailman (input) for mailman id 934457;
 Tue, 01 Apr 2025 14:23:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yHas=WT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tzcWA-0002j6-Kb
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 14:23:06 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2415::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1f77215-0f04-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 16:23:03 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY8PR12MB7731.namprd12.prod.outlook.com (2603:10b6:930:86::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 14:22:57 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 14:22:57 +0000
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
X-Inumbo-ID: d1f77215-0f04-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wm0Cwi5bUBmeSViwy6rORGgQEKmHkdoVw8TcJSdlhWVvYWzh7xTtrqQQKT3vSD2u7XVqB5K5laxAhudVazFTNKQfclQtW6ddESHXqCuR3mhGFwO4gt8uIeCL0kqKKZWbxAGW2Ur8KRdcgccBfskMLJmHtXd0qhO9WlX/R/MedLlA9GvfCBFkC41f3tVh+kW6MC5y32daRgSfKlr6ITg+uBIAdlLky+xK626u/lQdRj4F6VIo2/8DDZcjayEW6h1tlattWSrn3xuHud9HqHAaV+Z/jkLo64+VvnCK1F0WgFERl31ys4NV6zESDoWLoW8q0k2o3rv9M2jlIPC3DugGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjyrndyVo2+ZlN/22DnDdyVsBvHEPlDTRQGZAvj5WAM=;
 b=RqSYbMshHQy+7lhC3db1du7zRoaYIjEde/OEVYJD008xSWQL0m4rAa4ratUoZ4b/BKKGTgpXvA9ZKg2WkWHKKplSxeM5/1p8dmnjmEGiF7IbJ/NVx3JZBSMfKq3Af1ltVxKCbk59JujZi7/oTVC9SvsreYAqu9sRqCSNDueTPwvtD8OCrIT8/6IhNjKkLQZi/yxFJw2dZzeUHH9EDv3hWtFTgl8A1GUAedJAMvJm2/nWbsr7YVdlDE+amSFlF8wYMSNCw3s0d0dySIdaJGZ4SM9mB1uxW75/UlBzM6qZmxD+CF3G8XfSsGuCtkwO7LfdhGD3kBFftYj68AZS36ATSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjyrndyVo2+ZlN/22DnDdyVsBvHEPlDTRQGZAvj5WAM=;
 b=PSybFa1WaPP0GmB0Iuk/OM3pc0Lq60jT4klUgr4IEpP6AKQRnHNlX7ZmtC+gf5zAyOt9leEUGCK1IVi6fMbu1MB2+zR67qU10ttgsOwrHfGsw7HXnJWaYwDGK2bNqb4d/LfgYWzHC/uOpYOuvhYe0FYkU+iNnIWP2w5htnldwwc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f7a6dd50-28d9-409b-8740-f4433f2fd72e@amd.com>
Date: Tue, 1 Apr 2025 16:22:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Drop process_shm_chosen()
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250401090937.105187-1-michal.orzel@amd.com>
 <3D313BC0-75C9-4208-9067-C1F6153B3859@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <3D313BC0-75C9-4208-9067-C1F6153B3859@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0227.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::8) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY8PR12MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fd7debd-6593-47ba-f23f-08dd7128b320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEUwbzdjWnlEVEk3UjR6V2hETGtsVmhhMGJVVXExQzhIa1A4RlFKS3hQd3Iz?=
 =?utf-8?B?bzF4UWtScExoTi9JUnR4WFFBaHBndkp5KzE0NlB3RzRlUzNsYlEwK0RENEwr?=
 =?utf-8?B?MEdVb2hoYzJEV3BVQXc1VzNsQTh1RDNqdEhXajZHZDZPczkrZlRLdlZOOUtw?=
 =?utf-8?B?OVRTcEd2WFEwODBPNHJGK3c2Qml5d2FhSXAya1VqMGpLZzNLRWMxbkFlcUVE?=
 =?utf-8?B?Z1o0N21VRDhqbXQydlU3V3RhLzFmRXZDVWlqTWFEaTlyMjZ4SGM3L3dKcFFT?=
 =?utf-8?B?a0F0dHZ4NytkNzdsaGhuV0lVUXhwZy83b2E3RksrV2cyYUJpQmJmdEhKUytl?=
 =?utf-8?B?d3UwWTRiQ3ZxRUphbFE4eHh0WTZubVlJLzZKQ2VIRmhnVDVFU1E0bE9pdG5D?=
 =?utf-8?B?bU1KNVoybTEvREg1dkRSelppdXVsU040bHlnbFJrL25MU3ZES3ZWRi9qSjRX?=
 =?utf-8?B?QUZCK1o3ODQ3Y0VISmQ5emY3WTdHZ2U0blJWUnFPemUyYWdRT3E1ZUZhdXFx?=
 =?utf-8?B?ajJ1WFpoVWYweFdhS1ZIVFV3Mjk2aVhKaWJKeGllMWZsTWFzV2Z5dFRNV21p?=
 =?utf-8?B?V2c5Rnl5enFSSVFRRUhMbXNMd2ptSjdXWHhEQU9ITEduMis2S3dhbWczRmNw?=
 =?utf-8?B?bmxWMm44Q3lpSWgzOTVRQVNYdFdjY0IrZWZWaUxmTzNJY05OUzUxU0NmVmkv?=
 =?utf-8?B?citMUDBaMW9FdnVMMEVUblFxaGUzQ3N5Z0FVU1NCV3VPOGhHelNySmo3YnA1?=
 =?utf-8?B?K0lrZjJ1RE1GSFY4bTRaNkpxNzlGWjM5eFEvZzYzU3p3emtYMllEeHNXRlAx?=
 =?utf-8?B?TXhjSDhxYXRyQ3oyaWc2MUhzUEJuNHVoT3RZeGx0VGtTUjl3a3RwRUVNblZE?=
 =?utf-8?B?YlMyeVYxME9BSFNhMk9nbTJSQlE0N2ExUmtZbjNHR1I0bng0dDdZdXpKRzRz?=
 =?utf-8?B?NGtBYWNUVmE3OHp1OHhnN3U3THRRV1VpZEZsNUx3NDdwZ0RCdXpacU9sN2Uv?=
 =?utf-8?B?aE1oK05SYzNYblliMys0WnQybFpmVXZkUENWZFU1MnFpS3FoMURXblAzNXFM?=
 =?utf-8?B?bUZPSFhZeUl6a29laG1adVg3Ylo4azNJNDZ2WXp2TWZ0QXVLU2d1dWZnbVND?=
 =?utf-8?B?bWRiWCt5ZitqN0s5M054THl5S1R2VFNPaFNmQUFYdVFBRGxtajhFaCtqU1Rv?=
 =?utf-8?B?enUxV3VmR0c1QjU3VmVmNjNiVXpTaXNtZGNiamRiVHU0dzJUT2lMWDNiSEZS?=
 =?utf-8?B?Uk9uYzgwVmhlK0l1cC9OYk5HdXhxOHUyd0xMS3lOdTZMY2phdDMwemRnR01M?=
 =?utf-8?B?WDZuUW9DdStsaUtkM3hZVUNFaktRMWIxb1JUV1o1QjBlYTkyaEhodGJOa080?=
 =?utf-8?B?Rmo4TnJYY2dteXVjbHNFQzBrbUliN2RmQmVSRVVzNTU2M2xZNjV3d2JtNzYy?=
 =?utf-8?B?ZURyL1Q1c0pESGlVZ3c5eFZMVWdiU21rVlUwWU94QmhpaTJzNmxWVXZzanZz?=
 =?utf-8?B?bFFqcGdFSHdONDJoRUJEY21qcnczMFlmcXlDcTlhL2hYSldtbXlIRWNhMEpp?=
 =?utf-8?B?ZkFrOWZ5LzRaVGZxSWVRWEh3WS9SMktRdjJ0NmhmQlI1SlNqdnNJM2lhdGM4?=
 =?utf-8?B?QTZQWkdZem1qY3cxWEZEdUNOSkF6MTNzTnZXZEplM2ZFVGVzWjQzMHV2cUd0?=
 =?utf-8?B?RDQ2QXZWUitSd1JNSTdlenlVcDFYSXVXM2NHcGZISFV3QklSZVl4ZEVnSXZt?=
 =?utf-8?B?OHVQcHpDTmg4U2M1VHFEZlJZT05iSjE2bGUxOU5oQlFtaVBWMUxMWWphOXNt?=
 =?utf-8?B?SFJ2aHJZYVlyYldXWEFiOUx1VklObFV2dnNZbUR6VGNsbzJTQS9VSk5URWkv?=
 =?utf-8?B?OGlIcTNhbFdOZ3diU3N6Uy83MU5Tc0J6RFVtRDFEL1RxVFRwMnM3MG9UbWR4?=
 =?utf-8?Q?FMhOKPt6Sog=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUR0WnBTV2JxYUxPK2VEK3V2ZGx3MFZiZGcwTVExYkNGeDBUaVdmQUdGQUVj?=
 =?utf-8?B?dHdWUnhqcGF3eXhkQlVxOGc1K28rYnAxRC8zOEJXaFRLOG1OMm04Q2hhZzgr?=
 =?utf-8?B?bVBHV2x1bkRHRHpqY1E4dTBPeXFSUCtxUWFFek50bHBFMlNBV0VaQk1XbWxU?=
 =?utf-8?B?ZEx0cTNNVkgyTzdpaDkvK1ZJbWl1VnNmNUZ4OXg3dzg0Ky9vNHQwSnlsSC9p?=
 =?utf-8?B?Sm9xakFNVkg5NzdOYjEzcTh0UWlUT1U0TlJwa3FIRHB5Tm5PK1FFWWpHaVVQ?=
 =?utf-8?B?UkNUNkJxZHlOWDZCTnpyRDB6WnE5VXpBaTlZV0Y3SnMrZzh6WGNXdEVkWG9O?=
 =?utf-8?B?ckZlWnh1WnpjMUhuUzU4VCtJSjQwd3RGL253RGpXVk5vQjVSTTAzNjI0a3Vx?=
 =?utf-8?B?V243U3U4S00rMnZ3ZmNLZW5Oa0JtVkhrRWNESmVNb3VxV3VFMHZxTy9EWTNH?=
 =?utf-8?B?S1FibTJ2SWZ4Z2o3MS9PWTJsbnNiZmxBRFVKb3RPNjJSVmFrQUEvMWoxc0RM?=
 =?utf-8?B?d1JHbEk4d2hPOU8xSm54UjR4ZWRMV1puUU5EQm5WYUF4UFBhdThGUFZZS1VF?=
 =?utf-8?B?TFY1M0I4OSs4NjVGaDg2cmtGYlJsRlB0TUJqd2R1cU1jWEZTMnRITUxWRmxF?=
 =?utf-8?B?ODdzMU5HL2NuZEQ4a0s3WWdYTFljalhHT0FFL1VvaXdFM3FzbW9SdTRSQnBp?=
 =?utf-8?B?cWhQcWtVSXVHRU1ZK1JlODhLSzI1Q0pWdFNWa2NmUkZQYjlEdkplVDlGRmFN?=
 =?utf-8?B?UFhEamhYQTkxMFZwLzhYbVphTUlBV3dMalJKYUpDOThpUWFacU5LL2hEVC81?=
 =?utf-8?B?Z1VGU0lpK2pzMXlpblFjN05OY1RRbEg2OUNlRThVSTlreE9uY01FN3ExVWh3?=
 =?utf-8?B?SDU1YmNBRUNrUVMwanpnWTRENW9LOEdzZDROMldGVE9XZnhWUmJ1M0RqNm5t?=
 =?utf-8?B?YlJXMVhhOGE2c3M4WXYwVThITWFVb2ljbk8ySjhHV3RiT1BkbWw3dVZlcERU?=
 =?utf-8?B?U2ZFTUtoUi9Xd3BXTFBON3FGMTdpM2FqU0NEcnZVVEUrT0puUTN4MWE1Zm5Y?=
 =?utf-8?B?U1hUcVNBVmxLUW11VTZLcFpYMWxQdFhFQmZ2RjhSeHQ5dFlFZkJYWjEwMU1K?=
 =?utf-8?B?a3NPSEhwZzh3TUh3cUJjK2k4UkFBT1haby9oTUdtY2RBb1BjcDY2SUovcUI3?=
 =?utf-8?B?VS9hNkgrVjZUZXg5RTB0MGMzR3VUaVp6RnpSK0dhLzVtNE5SVWJGMFJDdnR6?=
 =?utf-8?B?V2ZnbThOYkNqanJvM3lUTGtLcWxIbDd6Z1F6emEzZUV4UXByb0g0N1o0OUhk?=
 =?utf-8?B?OWlEeVk1bFQvcFU5TExpUDdjNk5ubEMrQUN5b3ZpVHBBajhiM1Y2WU12ODlD?=
 =?utf-8?B?OFpjSG1CaGY4MHZENnV3SXExcTYxODVkcmw3ekhWeklPVENrb2ZTcEVicUpl?=
 =?utf-8?B?M0pzZitjY0o5WVhyQnhnU3hXcFllWk8yS2RzQ2JFYkp0ckJGVFZESmVodVR0?=
 =?utf-8?B?TVIyOStUdjFPN2o3bFczazFvSFE4SzFWVVJaYWk2UDl6N0ZFOFUvcUdmSUpK?=
 =?utf-8?B?aFlSazU0R1R5K2dQUjMxbWNicEhKRFJWeCtyazNUenRGaWpVV3lONEowQnBx?=
 =?utf-8?B?Nmdxb2dhRU1HalNObXNhSG1KK29IYXhWL21PQUMwU2xCQzJPTldkcVlMYVNv?=
 =?utf-8?B?UlJkT0U1Qi9lLzRjellPQmdvZ1pSWVlwbmU1L0xhVG9ldno5blJTcGFta0pj?=
 =?utf-8?B?S2VUYkdBNGdMK0tpam1YYk9iVUd6RVpRNGxtL2wzRVdubUE2SlBLajlwb2Z4?=
 =?utf-8?B?NExBYTZEL2ZHaDl6Zm1wSWFOQW5KcnJvK2JRS2poTCtYVjE5RnpaRUo4dERP?=
 =?utf-8?B?eko2ak9YRzdJYi9abTJ2bWc4Q2dWa08vdG92N1AwWDMvd1IwK3RUMzJGUDV0?=
 =?utf-8?B?K2t5YzlQYm1idVUxRU96QVY2TzYxZUthSG9Bd0ZORWxMcUtUcFRPM0o1ME9W?=
 =?utf-8?B?Z1ZoWktZZUJlYy80cks5Z0RSV0w1RDg2bWhzb1MzREVZTEx2cFpsMlJNMWtW?=
 =?utf-8?B?d3NrbExpeFVaZmF4cWRxVkdYem5TbGZVSkNZNXAvZ25QY0lPdlB5TDRNNlpT?=
 =?utf-8?Q?SR93VyZ4kDT6nY4VJAV4PaAHA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd7debd-6593-47ba-f23f-08dd7128b320
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 14:22:57.6040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUJVzI9Stmo0WhMl2wXAEyLVEonoN3rvaR2XdkQ8GvOAZbgGqmlh8ajH1iY+tcm3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7731



On 01/04/2025 14:57, Bertrand Marquis wrote:
> 
> 
> Hi Michal,
> 
>> On 1 Apr 2025, at 11:09, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> There's no benefit in having process_shm_chosen() next to process_shm().
>> The former is just a helper to pass "/chosen" node to the latter for
>> hwdom case. Drop process_shm_chosen() and instead use process_shm()
>> passing NULL as node parameter, which will result in searching for and
>> using /chosen to find shm node (the DT full path search is done in
>> process_shm() to avoid expensive lookup if !CONFIG_STATIC_SHM). This
>> will simplify future handling of hw/control domain separation.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> xen/arch/arm/domain_build.c             |  2 +-
>> xen/arch/arm/include/asm/static-shmem.h | 14 --------------
>> xen/arch/arm/static-shmem.c             |  4 ++++
>> 3 files changed, 5 insertions(+), 15 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 2b5b4331834f..7f9e17e1de4d 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -2325,7 +2325,7 @@ int __init construct_hwdom(struct kernel_info *kinfo)
>>     else
>>         allocate_memory(d, kinfo);
>>
>> -    rc = process_shm_chosen(d, kinfo);
>> +    rc = process_shm(d, kinfo, NULL);
>>     if ( rc < 0 )
>>         return rc;
>>
>> diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
>> index fd0867c4f26b..94eaa9d500f9 100644
>> --- a/xen/arch/arm/include/asm/static-shmem.h
>> +++ b/xen/arch/arm/include/asm/static-shmem.h
>> @@ -18,14 +18,6 @@ int make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
>> int process_shm(struct domain *d, struct kernel_info *kinfo,
>>                 const struct dt_device_node *node);
>>
>> -static inline int process_shm_chosen(struct domain *d,
>> -                                     struct kernel_info *kinfo)
>> -{
>> -    const struct dt_device_node *node = dt_find_node_by_path("/chosen");
>> -
>> -    return process_shm(d, kinfo, node);
>> -}
>> -
>> int process_shm_node(const void *fdt, int node, uint32_t address_cells,
>>                      uint32_t size_cells);
>>
>> @@ -74,12 +66,6 @@ static inline int process_shm(struct domain *d, struct kernel_info *kinfo,
>>     return 0;
>> }
>>
>> -static inline int process_shm_chosen(struct domain *d,
>> -                                     struct kernel_info *kinfo)
>> -{
>> -    return 0;
>> -}
>> -
>> static inline void init_sharedmem_pages(void) {};
>>
>> static inline int remove_shm_from_rangeset(const struct kernel_info *kinfo,
>> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
>> index c74fa13d4847..cda90105923d 100644
>> --- a/xen/arch/arm/static-shmem.c
>> +++ b/xen/arch/arm/static-shmem.c
>> @@ -297,6 +297,10 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>> {
>>     struct dt_device_node *shm_node;
>>
>> +    /* Hwdom case - shm node under /chosen */
>> +    if ( !node )
>> +        node = dt_find_node_by_path("/chosen");
>> +
> 
> I would have 2 questions here:
> - what if a NULL pointer is passed, wouldn't you wrongly look in the main device tree ?
Do you mean from hwdom or domU path? In the former it is expected. In the latter
it would be a bug given that there are several dozens of things that operate on
this node being a /chosen/domU@X node before we pass node to process_shm().

> - isn't there a NULL case to be handled if dt_find_node_by_path does not find a result ?
It wasn't validated before this change. It would be catched in early boot code
so no worries.

> 
> Couldn't the condition also check for the domain to be the hwdom ?
I could although we have so many /chosen and hwdom asserts in the tree in the
dom0 creation that I find it not necessary.

~Michal


