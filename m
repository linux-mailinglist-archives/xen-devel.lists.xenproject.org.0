Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C40579E2B9D
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 20:04:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848144.1263121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIYAa-0006Km-EQ; Tue, 03 Dec 2024 19:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848144.1263121; Tue, 03 Dec 2024 19:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIYAa-0006IL-BJ; Tue, 03 Dec 2024 19:02:48 +0000
Received: by outflank-mailman (input) for mailman id 848144;
 Tue, 03 Dec 2024 19:02:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rmlv=S4=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tIYAZ-0006ID-6U
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 19:02:47 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2414::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d182a84-b1a9-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 20:02:44 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by MN0PR12MB6270.namprd12.prod.outlook.com (2603:10b6:208:3c2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 19:02:39 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 19:02:39 +0000
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
X-Inumbo-ID: 2d182a84-b1a9-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7VmRKos0b6LcSMUOf1sFB+otFB6gPrqgC3h3k6c9Ha1kTUP3lXsmSY7qQAdr2hHW+EVzk+BzewM0VLrJRQz/l8AxfHks7Gi0ei487o8i+poRYZYuiVH6cO1ZEKxhn/PPLOeLTS3e/FLcwVivjxZQHR8bKr0u2nN5gUDoHo9zw4EclPfOS0I97WF5Aa4nqMAO5CYWb14qCrk9AWya2kI5XQ+OmJMn3B/ZmKLv0LguUYyL7fevK61MVs1W0xm5Px94Lsv9Bm+Fvs0FEF5DZqheG+4h0uZd3jZrT1wGfwtsTEX4fpgEtTZ12AhfHwAbQotj3VypVfn5DE36MFkVvAdsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftzR8sMcBRKNtfSrvzvZZugSVvuk50Hs8EIhto9ICKM=;
 b=vXdSCdD44iyCHVFVErFj6/lcnd+/b9iFv8Kev8QeQyfOBxHhzXSnusESuEIigDjwz135u7Q+nLzVAD5egh5CCEQLFfRr8C3WDvOsaeVSloUal2IlXHMUmGOxdYsebcsQaRL9Kd6oTPTGXW/PbMiJytal8URhaikrBrgEdn4BX/c5nUA/hMUyGFXGEALRmrFoqn4VR10FoheTxgViVVG/p+Anm3f8XgUXVa6QC2f3pZyoJnxnPLMyW+JPR5lV9SvrBLS6wv+Z4YjmfF+hYzx5CZIoasgz7JMvtzIEJ0enOAucX3eyWXJaPWI6jjf5LGr3zMIYc4p9nUeuMMhoS1U4Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftzR8sMcBRKNtfSrvzvZZugSVvuk50Hs8EIhto9ICKM=;
 b=wmyiwRLfcNkuYBJyyN7Z13nRCN+Y5fyPA4Tjgeu8TaibyuteJzqbh5lNyekP1UaL29cyRPEI9DlNKoj2AhVuiSikTgRvVPj1OqyGA8OpLmWpNzpQ0sL39yPwhMVnmFKj9zljb1PamMRMptcVCCEk9Vpbh3n7xXZ3GdOdhLPdWUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <048424f0-41ee-4bb7-b585-42ed82a337b4@amd.com>
Date: Tue, 3 Dec 2024 19:02:34 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/mpu: Map early uart when earlyprintk on
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241127183906.485824-1-ayan.kumar.halder@amd.com>
 <20241127183906.485824-2-ayan.kumar.halder@amd.com>
 <c44686fc-f4c0-428a-8a3f-ce17a7c589ae@xen.org>
 <41114d52-b618-4692-87f5-94de4b7ddeff@amd.com>
 <f62e511e-40ab-453a-a907-6d27d074adba@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <f62e511e-40ab-453a-a907-6d27d074adba@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0383.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::35) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|MN0PR12MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af21d10-573d-42fc-75ed-08dd13cd0ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RktGZGVmOFFEcVRyL2ZzN1NacWZvOHdabDRoN0pnNU9wWnk3TjUvOUlzSWhr?=
 =?utf-8?B?WUQ4d3pteTR4Um5yZFpJNmxSclBPTlYxOE5VUFhYZ1BJSUhuU2ZLcGpPQmdH?=
 =?utf-8?B?OUg2SGFubHYvVUNHTm1GNkMvVVpVUUNDR2o2bFhJNlNubmJSTGZySHZTYVF3?=
 =?utf-8?B?THpTWTJtMDVDSUtYbk5nMWpCem00dEs3T0c0VGQ3TXI5enFhYzhiamZwdXRk?=
 =?utf-8?B?ZXRxKzIxdGRMUWlIcDlOMW5tdjh4WVE0eTRlYTdUYStwS3JyOTBTVk1BOFJt?=
 =?utf-8?B?Tlhkd2NtcGgwcFRhV3ZuUkRTd3NXaFZQemh0YjlYeW9NTmN6cHRtOXZwakxz?=
 =?utf-8?B?SGlCUWpZazFGYnpFYnl0RjRENmR2eStMNnhhVWhUM09iZ2RLb1I1S3dzbFVO?=
 =?utf-8?B?SUZBVGZLbkh5R2FYU2Q3cDdUdmdyRWIwTHQyRUt6U2tQUHoyMEJqbnNmTVFu?=
 =?utf-8?B?Q1JOc3RMRDhsM0swcjdKQ21NdHJxSGlZSzlsRGQralJKTDhBV3pyWTFwaTlJ?=
 =?utf-8?B?bnI2cnBxZUlvVWMrM1NmSWRiRmRCck0yd2lwNzVyS1ZvMW1wT3hVNnFWT2Rw?=
 =?utf-8?B?VHJNVlQ2aXVxMSt5Z1YrSVBJNFNPR2ZwcG94WjNYOUJ4U3d3ajZLUFFmU2pU?=
 =?utf-8?B?cmpEKzF6ZUd2U0JnRDNGMEJMYWRBSjZkT0xmVWl0cXlwVkNRMHFiMy9CL0R6?=
 =?utf-8?B?NDFwcjRmSk5NRWVYQXgxOXdybldSUTRsR2tsRUF4N0JsbmhJNXNzR2FZWHZK?=
 =?utf-8?B?L0VlVE9saVlETXhmZ0NBazkvNXAwMjVEbE1kVjJaZUZDRldLNTE3bERJbVlr?=
 =?utf-8?B?Rk9ubXdqeE5qUTNpa1hVYWRoVjlQVzF4TUo0dVZiYWtBazNPUFp0RWE3WjJ5?=
 =?utf-8?B?S050Um8wWSt5eUxUeTVTSmpoUFRpODZIT0FHSC9Na1BYL3prSUg2OFBSczFW?=
 =?utf-8?B?cVgrbFBCcEdveXJCdkx1WDRWOFJScUxCVlpTY0JWdUQ3UEZzWkR1Kzc0ZmxV?=
 =?utf-8?B?eVk3VHdNSkRSMUcydTdCeTd1Z3NUL3NzYitFMUtHcExNbHFJaVU2eGs1cC9T?=
 =?utf-8?B?ajB6cjZNZWVwOVZZVTRRVVZTWFBhT0pXTk1ldzVaWnFwUWVVYWF0N0RYNFIr?=
 =?utf-8?B?R3B2OTBwLzVFUm9yektRdDk0YThXTWVnaHd5bTBtc0NWY2NvT1JodEFoc1dH?=
 =?utf-8?B?REM0NG9VKzNtYUNoa0c3bmlJNElGRjRRd09tNGt2aVY2SjBIZ3RyVEVoRXdI?=
 =?utf-8?B?OUhOcVRSazRFNEI4MjI4dXRDYjErVFEvOEJJK2U2cHRtWnYxNFNWS0ppOElm?=
 =?utf-8?B?Z29Ybmc3WGpuNWM2cGgrSUd0aXhUNWI4QkRpRHpHSjF2NEJnQi91NGNRS3dh?=
 =?utf-8?B?K0c4NXdodXltSGc1ZEZZdlQ1ZGxQSkNGMVA5Zi82N21EM29BbjF2N1hDRnRq?=
 =?utf-8?B?TXFqQ09FUGdvRzRucWFXdHFSYUJGTnR1Vi9sV1RYb21JZ3paUU1wM0dkd1Bn?=
 =?utf-8?B?L0NOd0pNclRzK3FzQnI5ZkdEelJNTjhGdVUzV0NEWitTUmtNb0pmWjhER3dx?=
 =?utf-8?B?UXFqdlY4Y2owMGhOSUFhQUdOWmd0eGtmSThLWWQ3N0VMNzhtSThwV3pDUkl5?=
 =?utf-8?B?N2FrOUpNd3RZS1ZQZkNwQzFpTDZEdzRGcHRYNGN6ME1vZEZDaTBsazBzUHJE?=
 =?utf-8?B?MHZrQjhJZ2lpV3hrc2NteFp4KytCSjhVNTJROGdIUkFmK2tmbzNSa0lCWlpx?=
 =?utf-8?B?OUsrY25MMGRKN2o5cXU3MURWd2p2T08yN0djUktQWWJMMjA2QjhwR0RoWmVN?=
 =?utf-8?Q?Ew7fClUyLABKfx0GSO1QNyykgxsEvPWegDFqM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eElHaldmcEZocWJZR3J6MWg0N08xdkNZNHlJSVRrTllxVWNlOWVlVWx3R2dZ?=
 =?utf-8?B?aUJxZko3UnJ5a28vYktoUVZkWHp4YTJIMnpMdklVYVU3bXVscSs4WlNmbmVD?=
 =?utf-8?B?WUhqLzFjVWl4eFc1MFN0V0lZOURRVDV3dmt6ZGxWL1JDVjcwQ0x4UEFIMXRK?=
 =?utf-8?B?Uy9HeVdIbm1RVWJpeXExMWlkN2hrMEsvUzRqa0pRQTlJUmpOWnJyTnFaRUlC?=
 =?utf-8?B?cmhJWmtQWXdadzBXQ2FkNTBkZmluc2tJYWY5djh0Q1NrTVIrUE9hK2dTTit2?=
 =?utf-8?B?Y3ljUDlkbDZyVmI3a1J3alhCSTErSGVYWnh3ZmZOOEdvZHliNi9TNEFPaGJh?=
 =?utf-8?B?NWJtVk16Y2R6NmxvQjcxVm5iRlM2ZWJiL1RKa1ZXYXRjT3JodGRmd0Q1NmtD?=
 =?utf-8?B?RGRCanhsQjJsd0lpMTZvam9zRXVHRWczbi9tT1lzNEtUckRTczB1VUVacG1Y?=
 =?utf-8?B?WjExNDB5aFlJak9aUkxLVXh1c24rZlZDdzRLYUtIYk0wOG41TjBvdjRVb25w?=
 =?utf-8?B?Q2FxZTJmUHB6ZE1XNzBneHRpK09TczNPOUJBcW5zWHExdGd3UHFRcjJLaUt5?=
 =?utf-8?B?end1SFRzb1I1Y01xZkYrK3pmV1lOc3BlUU5uTEhMUnJtbDhPWTNmTXFLZWtP?=
 =?utf-8?B?bmp1b3dSMkpHQ1RWUWJpVG0rNlRIbk55ODBQVkpsQ29LbzF5SEo3R2pyN2dh?=
 =?utf-8?B?V0NXbTU4dVQ2amZPMC9TOGd3UkJVamJQeFRnQUxyMVVOODRUVS80c003cGNJ?=
 =?utf-8?B?eElwMXJPeDkwVnVKSXlROFJBOWM4eDNuYXhvUDFCeFZqaVVKMWxRYnRVL2Zn?=
 =?utf-8?B?Y1l6VUhkZjdiQ21tbWZjVHlwLzFUSHBFdlBwUEhxY2tvYXhhb2lBNStYOEpx?=
 =?utf-8?B?anpVUGh6MjAyRnROMWNRYmtxdmlPNDhZNnN6L0hFdVpSd2dOak5XVVNvb0RO?=
 =?utf-8?B?YlNQbk85YTk4T3Y1aFpZb2RlVzFta0g2QytUV1lHaUQ0T0pJSlhRcXBJWFov?=
 =?utf-8?B?Q2hBaENXK0JiN3BsakE2aVZFRzFLUzZOMFpETW1YQXY0eWNjTFhDRVc1WFJh?=
 =?utf-8?B?Qm0vWGxONW15aDUyZDd0U0drK2QzTzREQ0Z1a1E1Z24yL09JWkZRNkJ1NUhO?=
 =?utf-8?B?WHlpVXFWaGljVjlTeTJQMjJNOEpxNlBONHA1OWN4WU5VWW4weGlJbmJXbzZU?=
 =?utf-8?B?NjYyT2Urcmc1Nk8ybmx5QXBCVU8vRnFtQXRpMlA4TENLMHVzZXJmM0dEQWMr?=
 =?utf-8?B?K01qYmhodDRHVFVRS0krR2JhV25Ma05KdDQrSWVLUTFMZFU0M1pQUnBLai83?=
 =?utf-8?B?bGljTG1nNDRUVXZ1WVlJdjZvb3N3bkx2YWh3NTgvQkhzOUJQSkpsODFWNWdr?=
 =?utf-8?B?N3IzQlk0WHZQLzNORnM4VElmRno5NDhaZUxrVWNTTXAzNFlBak5ibW83eVFV?=
 =?utf-8?B?L3lsRjJyWDdhby9WVDBYRVNwc1J6QTQzODlCQllwWGMvUUc4WkxWZ0t2djNG?=
 =?utf-8?B?a3k5MUxjRmlmQk1FWEVpUmJBMzBmSWsvQklhTzV4NUgzbHFmeE5wRDN5RzF4?=
 =?utf-8?B?Y3lqZGVja3VDUkk1VEVsalZGVXpIaEZVSEMvVkFJR21SNGc4Yzc5aUtEbEow?=
 =?utf-8?B?WXNLbUtZQmpVM2FxWUtmZzFzN25SZEg0MHhZcGJ5MzBNS0ZMNFA2ajdBR0Fz?=
 =?utf-8?B?T0hXQXlLMSsvR1dieGM5cnFrQnNIQlNxeXlJS0VLdXpCMGg3ZDFiKzlMTEFH?=
 =?utf-8?B?aFdwZUFXLzZERks5SWhjUENpbTVmYmlKSG1CbG16bzNibGxYc2h5dVhodGxZ?=
 =?utf-8?B?cnB3NGhjajVvT2RvQjJSaHdsSWU3bGlmZGVmVW9OOFRRY29vN2dyMjgyTzJ1?=
 =?utf-8?B?dDVsWEgvL0VoeWVCRVJRSmNFMkhsMzNsVWU3VkZCUWN2ZDM0MU1aOUhGbnpi?=
 =?utf-8?B?d2Z3T0dGL3BUeFkxNGpSTVorbERHMUx5a1p0N01TVzFFR1VRR1FKQ05SYy94?=
 =?utf-8?B?YnFzUjkxMjdpK2o0NUhkbUlQUExlMHNINmVTYXhsdHMzdEtJLytQWm9XMkZp?=
 =?utf-8?B?VUlYbWdSZHFjWEtTRUIyNWFvN3JaajRrcVFLQnUycmNzVDhLSE9nbVd6Nnpy?=
 =?utf-8?Q?hvOGWR0EW9mtuFDTW3HoSBhve?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af21d10-573d-42fc-75ed-08dd13cd0ec1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 19:02:39.6492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDsqEyoObCBEE6E4V43wMYAW9EmhX2Y0GmFzQznY+gQvO9MMYEdkSFMzz5KrCBuqsaFv7tKt3ZZ/eJm7mxpDog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6270

Hi Julien and Luca,

(Luca, I will respond to your other comment here)

On 03/12/2024 13:50, Julien Grall wrote:
>
>
> On 03/12/2024 13:34, Ayan Kumar Halder wrote:
>>
>> On 02/12/2024 20:53, Julien Grall wrote:
>>> Hi Ayan,
>> Hi Julien,
>>>
>>> On 27/11/2024 18:39, Ayan Kumar Halder wrote:
>>>> CONFIG_EARLY_UART_SIZE is introduced to let user provide physical 
>>>> size of
>>>> early UART. Unlike MMU where we map a page in the virtual address 
>>>> space,
>>>> here we need to know the exact physical size to be mapped.
>>>> As VA == PA in case of MPU, the memory layout follows exactly the 
>>>> hardware
>>>> configuration. As a consequence, we set EARLY_UART_VIRTUAL_ADDRESS 
>>>> as physical
>>>> address.
>>>>
>>>> EARLY_UART_BASE_ADDRESS and EARLY_UART_SIZE should be aligned to 
>>>> the minimum
>>>> size of MPU region (ie 64 bits) as per the hardware restrictions. 
>>>> Refer ARM
>>>> DDI 0600A.d ID120821 A1.3 "A minimum protection region size of 64 
>>>> bytes.".
>>>>
>>>> UART is mapped as nGnRE region (as specified by ATTR=100 , refer 
>>>> G1.3.13,
>>>> MAIR_EL2, "---0100 Device memory nGnRE") and Doc ID - 
>>>> 102670_0101_02_en
>>>
>>> I can't find the Doc you point online. Do you have a link?
>> https://developer.arm.com/documentation/102670/0101 - Cortex-R82 
>> processor TRM
>
> Thanks. But why are you quoting the Cortex-R82 TRM? 
> This code is meant to work on any Armv8-R processor.

You mean Armv8-R AArch64 processor.

Actually, I was looking for a reference to tell me if UART is to be 
mapped as a nGnRE or nGnRnE. Table 4-3 mentions that nGnRE corresponds 
to the device memory. So, I used this. I assumed that this behavior will 
apply to all Armv8-R AArch64 processors as it did not mention anything 
specific about R82.

To address Luca's comment

 >>"on Zephyr, the pl011 is mapped with nGnRnE".

I don't really have a good reason whether we should map it as nGnRnE or 
nGnRE other than what I have mentioned before (ie nGnRE corresponds to 
device memory). I am happy to change it to make it consistent with 
Zephyr and Linux 
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/include/asm/mpu.h?h=v6.13-rc1#n67 
, this is Armv8-R **AArch32** ).

Let me know which one you think is correct.

Other comment from Luca

 >>"Anyway, changing that to 0x01 (ATTR=0 EN=1) is giving me a weird 
issue in my branch:"

This is due to 
https://gitlab.com/xen-project/people/lucafancellu/xen/-/commit/4ec46883b1dffcbafd86c32732d1267102696d84 
, |ioremap_cache() in arm/mpu/mm.c . This can be fixed if we choose nGnRnE.|

|- Ayan|


