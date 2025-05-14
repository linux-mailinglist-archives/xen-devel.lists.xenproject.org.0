Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30473AB6329
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 08:31:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983777.1369954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF5eO-0002zb-DD; Wed, 14 May 2025 06:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983777.1369954; Wed, 14 May 2025 06:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF5eO-0002ws-AE; Wed, 14 May 2025 06:31:32 +0000
Received: by outflank-mailman (input) for mailman id 983777;
 Wed, 14 May 2025 06:31:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kjT3=X6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uF5eN-0002wk-Ah
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 06:31:31 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20629.outbound.protection.outlook.com
 [2a01:111:f403:240a::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1102a852-308d-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 08:31:29 +0200 (CEST)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 SN7PR12MB6864.namprd12.prod.outlook.com (2603:10b6:806:263::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Wed, 14 May
 2025 06:31:25 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%3]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 06:31:25 +0000
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
X-Inumbo-ID: 1102a852-308d-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/KWY1YitDAgJxoYQCLc/NzO2DsjGMz7a3YsqKfAUInUJgDx0cqStNwsp/qTeelLTJBgs0zU1z6tI7YIVnLLCPajKb3efULfdw7Tu1zYgSHu9octSQoe7U2YfJ8T7RB6WoBYP4COTuYIDDHaS1zNUoR6eIO0GXGORenQ8XigX1u0qsfV5HgA/+K6Q0BkLtmqwPbgtMnVqPG7uXvvE47TVNpwtmiI6WTwMUsWC/RuAMYWkRtI9BSFaRQo/K9uftKbdmLtdkh7RYh+gh2PAD8W9AqEKqA/V/FceGVLnsmAbvK6nqHm7ElnQXNxQ0PpMjCZXHTiiT+mLypImBQoPwgcxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyqIMwJgjaMMzEfSogplyejUU0rYkesUcAROsLfu/RI=;
 b=fB0hP4ZcAWQemyOmdfHcT0+1rkf3M6v4M7mEmXo235o3TdcNDg5mScmTQbu1MG+XkbNpV8qKlFVj4e9xE+FFTHM1gvM+1JaoiKwGo3oZM81wW0FSwzhEQvzvor6ql2/sVp76pZl+yJwstW77tMGvMoeQU/Lnl7R65r4S6hMLsV0dYFLMPCfshrwR3T2ctBX+Jb+SrZXKsT+im+W/xnU5dtrlfBPgegUr/uu5brOeJAZGHDGNoZnkMg3DmRJPKSfo9lWZCbHHAZrclUL5t6fjNCKk/Piw2o/0T7B1z/iAzCja0rfUXveaLJV+TB+1WkZAwpb+dPOZFtQmDWJO0uQ1Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyqIMwJgjaMMzEfSogplyejUU0rYkesUcAROsLfu/RI=;
 b=CJR009j2/lQo6AzbAEycJTXbAQoaORZt5qKmefRWfdG8XYeRfCqXdgpxRh2Q0Y4Mz11K4Oc0fI5I50/uueTOOZY72rtsjIduyHVR3Qcocd9lP3wf9Hg2ZwPqNdYuyJdWr4+tCIvC3oXTB0gS1IAfKtrCdElEl+UrG8CLpky6+CI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <cacb0002-dd6b-49e5-8019-2d323771e3e7@amd.com>
Date: Wed, 14 May 2025 08:31:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/dom0less: mark domain_p2m_set_allocation __init
To: Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250513171810.668370-1-stewart.hildebrand@amd.com>
 <alpine.DEB.2.22.394.2505131707020.368682@ubuntu-linux-20-04-desktop>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <alpine.DEB.2.22.394.2505131707020.368682@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0360.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::13) To DM4PR12MB5277.namprd12.prod.outlook.com
 (2603:10b6:5:390::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|SN7PR12MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: b7c0894f-f58b-49ef-31a9-08dd92b0f344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RG1kdEVYOGYwM1UzZkFGSmV0SXFWWkJ3NlR6ZkZERld2bG1vTkdxZC9vYjJB?=
 =?utf-8?B?bEVLOGFPRDIvbXhqK3FSa2Uyai9pNTJVZWlJRXh6TzdjNlFDOHlRTWNLU3k4?=
 =?utf-8?B?Qk5kcDFlSWlyc1FCRmJnVGEwSHR2bDZqeEtoRW02OWJoazUzSVEydWt5M3hZ?=
 =?utf-8?B?UVczVEwxSk5RTkEzRU1BQVZpekovSTNqSHRHVFpBK0FBMjgzQUpLM1VkVjF4?=
 =?utf-8?B?Tm5qSEhiSU1LZkVvZTRseVBFRzRZVDZnSEI1YUZCeENEWjNaLzVSSEErRyto?=
 =?utf-8?B?YmJSTEZLN28wTTZHTmNSVTRKTnYvSDUyVi9qZ3ZvTXNFSGlCRVdhb0xvOWgy?=
 =?utf-8?B?SS9WZDVnT3UrT0p2dStBdnVVUGk4bEVCWExSL0NrWVJaOWJEQXNiMmhhclJn?=
 =?utf-8?B?SHJkU1N0WHE3TnhieU42UjcwYmh2Z05seU5GcU1TeWZxdjFaYTZzRXNCWlAy?=
 =?utf-8?B?UnZLK0gweURpN21yblhEenNOZnN4R3hyYTlHY05YMnAvejlrdE10NkFnaCtL?=
 =?utf-8?B?VDNwbzFXUHVDMEZoMU8yTnMzWUkvRG9VVENBNE1Ja3ZOeDNtVUdrZWI5dDh4?=
 =?utf-8?B?dTRpOVM2WXlKeEVrMnlvb25aQTVrWlBmNkpjT2xYbWRtRGJ0L3hkNjZoS0pz?=
 =?utf-8?B?bENtakJTaUpRVjNQcWQzTUd1UmFRYXp3MVVTRGZhdTdqVUgwNnJpWEFMNjRP?=
 =?utf-8?B?djdPajNFaUZ6VlFXU3d3N0tIRnBvNzk1Ni9UODJQT0RWUjU1UUZRMTVhc3NI?=
 =?utf-8?B?dDlOSjRGK1dEMHVLbWxRWHMraUNueTI1TDVwL1g4MkNCVGJCOWwwNXh5Sy9W?=
 =?utf-8?B?WEQ4bUhNd3VyN0k1L1FyR2s3RU9uMmlwWnIrT0ZSSVpOSVFUWERTeUVDSDh4?=
 =?utf-8?B?b0Z2NEQydnJLVnU3bGhEbytEVEhoSE5nZEtuZTNSTndRVVZTQUplVjZMODFP?=
 =?utf-8?B?eEdCSFBtUWs5WWEvOG96dW9hZmpYd1orT1JhYzZmaFNXVFY4VlNHQjFGV2Jo?=
 =?utf-8?B?allCVGM5aVF2eXZmb1pvMGV3U0pkdENpaytlUHpVY1liSWoxbG1wT3dCNGdh?=
 =?utf-8?B?K01GUFZMWXV6Mjc3TlhnMzlhblgzWDV1YmR3UzhSZEg4UlNwazdaUkYvcXpr?=
 =?utf-8?B?MkFPZUpibXV3UW5PRXpHSDFiMUlaNktydC81UmtQdmFZNVpRTVVCYXVJbWQ1?=
 =?utf-8?B?OHVlRFFrelRYRHNWT0ZTbm1DUXAxVTNrVG1rQXFsMHZuNlFLaTBzRXo4SndY?=
 =?utf-8?B?MnZ4bjl2UjNXRWlmcUhVTy9hK1h3QUh5MzJhS3ZqdzlCdjQ4OTNTRnFueXVE?=
 =?utf-8?B?T0hqVmNtdU1OcDEwMFNlQU9HdHdNRnJYNHlDZ2RZSzFwVlhCeWl5L2dHR3Vo?=
 =?utf-8?B?R1I3YWhwL3U5dzdxeUt3MTFpaTY5R1Rkd1dzRXRnN0d1bFRKVzF6ZWpneEMx?=
 =?utf-8?B?QWFzdzdQYUR5OUhFTjd2M2dtQkttL0JpYk5lUm5IZ0ZKSUt5VEg2VWZ3NWtK?=
 =?utf-8?B?SDFmVzV2S1g4ck9OcW9kRU0xbWJmOWdWQXJUYVVXMklTYXV6SFNoeGxuS1RV?=
 =?utf-8?B?ZHZmV25IMm9Ic1M2Qm1RR0tZN0xUeWNnMW5Zb0RGbUZjY2lsVTMyNHNoUlZp?=
 =?utf-8?B?bENzZlJNK2ZDc0hIREhFZEUwR29LclU0SWFQQVBlNENOWWFiUDJIYXV3MTRC?=
 =?utf-8?B?UFp3OUI3M0hjaldaRFhzT2QweDRhN016ejd5SHZRekgvbnZ5QXc1bTBRdjd0?=
 =?utf-8?B?ZGtzZCt4L1ppYWgrWDJNdG1pTURXVXAwK3RZU3ZvU2szOW02N015UDBBeGhO?=
 =?utf-8?B?MkxxYzI3a2tXRkxWUktiNTBhazAvbnI3aXlJallqRzRYYnkzT3FTdEFwMGRK?=
 =?utf-8?B?LzBrNmwwcE9kT2JIOW9jL3l0TmlRTkRlaUhtTTZUT2psYjNrSjI4cVZRam43?=
 =?utf-8?Q?/L65FEvvOYs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enBJWkphTWJWUzJmdDFvZjh4S0pVNFF4MGhPbldSd2JFbXphVGdCY3pWQXhP?=
 =?utf-8?B?dE5qWjJtRHd0ZExST3phVzZEYXFNNGtrOWduRjhja29JcXNCcG84T25tOXg3?=
 =?utf-8?B?TFdhcENsYWdZc1JHdDJuZWZPNkhWQk12U0hVWlpBK0xJUFBoMS9sVno4MW45?=
 =?utf-8?B?bndNdllGZ0FVMVBTUjRxeVpLUFkyenlkdFRneVlyR3VhcWhjK2NGQi9CMEZa?=
 =?utf-8?B?K3hwNnhYQW1SakpQRDcvZHI1THI2dG95UW9McXF1akxDNjJkYlZWSCtHL08z?=
 =?utf-8?B?T0g2MFlQZUhQQ1cyREY4UWJqRm9Ec2FKcUFlRHh0cXJwZ3R1N2RNVU51YXRh?=
 =?utf-8?B?N3NrZUo5WnJSNGhpVFlyTFp2elg4MDhPdU4xdXIyTFJYdU12bVBvVFZMaDYx?=
 =?utf-8?B?Z1BNdG9GeWRhek92RDcvZkZNaEJqNTZWZTkvQ1gxNDNzSy9udS8vZ1A3Rng0?=
 =?utf-8?B?aS9zTFJRdjBOQUJnV0MvKzVUMDExSGNsQ1ZLRXNzdEszbTVUMnd3Q3JzaTBx?=
 =?utf-8?B?QmtxNGNhNmNQY1dPTmtWTHlVVzQvZG1kcExhVWZvR0E0eUpRZk1RUzcweUh1?=
 =?utf-8?B?WjkzcmpWZkFYWXpJUEluY0FETEI3cTNGYlRjWVdJN0c4MGE3RGkwOVcxS09O?=
 =?utf-8?B?dHkxbFI4Q3pOQnd2VG1iajFMQ0lyRlFKYm1wOFZkd1VZbW1QTktEWng0NnY1?=
 =?utf-8?B?algxa1Z6bkdUTklRbkdCaStHRElJM0lKUlFpLzhFNlcyWHArUytvL3VVSCtX?=
 =?utf-8?B?elRMZHgvUmY0MWd0WnBSbkorRHNrbTZEN2E1Z1JHdHNKWldOVk40d1YwVHcv?=
 =?utf-8?B?NDJqZDl3ZGwrUURpM3VGbGxaVFlTa0JkQWhqMndkeTZ5akQyQ1dKTmZIZmxT?=
 =?utf-8?B?R3JERUUwV0xtRytzNXZGdmo4Qmx4SUFVNy9iTTV1bGN3KzFWMTQzSGUxTy9Z?=
 =?utf-8?B?QklSMFJoOW9hdkRMSkNHRGdMZmFMWE1YcnBpVVNpMlRkZ1dKeVNpbEo0OTJ3?=
 =?utf-8?B?NFVnQU9yZ1dtUzJvdGhCTmZlM0hHYUpDWmJldGdNZEpta0VRTk5jclpubWdD?=
 =?utf-8?B?Vk1IcVRXK3IwWDJzYUFEWERwY2hxaWNKVjM4UjZYSnRrSFRoYjFnell3S3FI?=
 =?utf-8?B?WHJUcWJPNGlDUHN4VmJYeWRtZWtaZ1RUSVJEZnd0UEZMa3huQVBJRFVyMnc2?=
 =?utf-8?B?TkVVdWxuVXNQdzZldWlXeHJ5TStsb3Y3SHNyWHIxakh1a1FaaTdjR3plWmZO?=
 =?utf-8?B?eS9EZW1vTk4rSHhtc0I5emd1cmlMcTRQQ3VhbnhDaUQ4YTR4aVFqYWhTQW5M?=
 =?utf-8?B?VFF6cUlFeGpRZUFzS2YxbTV1YXhLaHlaYk1rZzRHOVU5OHdhWGJvZG1wMzAx?=
 =?utf-8?B?YkVDZFBEcmhXbEJQVG9nYXJXUGxnTzRwdWwwK1VaU056WXF4M1ZkZTBTNTI0?=
 =?utf-8?B?RFFManY3WkpMdjdPcW9tWmZManh0SmExSTNJL0U0OTBhcEY0Rk1RcThBZHpJ?=
 =?utf-8?B?SzliMjVQd1NESDBld01TTEg4VEVtc0hDeFd2S0g2TUVTUXVjT0FpaEl2d2Nj?=
 =?utf-8?B?bHQzNi81ZGZGWTlRelpkb05wQ3R3d0hjRUN6OENxSlFpbzFCWndnZnllTktB?=
 =?utf-8?B?MjZIN2lnOFMvUHp5R2pLVVZKVVhoeWlPT0szRVlUaW5mQWt0b2l2SHEyamNp?=
 =?utf-8?B?SFNvaXVnMFFVY2NlOVFudXE1aXlOTUovYzZTT0x3TVhSUWplYS9wOVV3WDJ0?=
 =?utf-8?B?UmZQSUVsWDJJTTlla0YyWnlncEc5MCtUOFlkRWNHaW1FSmZFVXk0Q0VpZ1RY?=
 =?utf-8?B?V0VSeXNjS2prVHI2Y0xjRzIrT21zTUxDZXZZcS9QSmE2QldqSWpIVWgyR0dM?=
 =?utf-8?B?cDZTU1o1TURsdlRQc1RoTHFXbVIyOEVpakluMW80M2IrRGtDSERZYmxISHZn?=
 =?utf-8?B?QmxhNG1DZ090Wkdoc3lySXJJd0czS1NuZStheVR6V1VtTzFENUptTG5JZVVa?=
 =?utf-8?B?SURLSFl2cWtpVG16dldNaWxPT0FYcVZ1NE44UVVQRlNWY0VPZTdYa0JkNWpq?=
 =?utf-8?B?UnZTaENQL3ZWRDRyNTFiZVZNSGNRUUp1T0U1eDFDRTB2SXNIQndodWRDWGlh?=
 =?utf-8?Q?SD9xgUWTGkiQGqwf2WvDsaDE9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c0894f-f58b-49ef-31a9-08dd92b0f344
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 06:31:25.2488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxNPWLTAm52TsTSNvNx1QYF3/bgV6QFHnROFl6Vv0voUNFMV1G+ifI07QDfG7fon
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6864



On 14/05/2025 02:07, Stefano Stabellini wrote:
> On Tue, 13 May 2025, Stewart Hildebrand wrote:
>> All functions in dom0less-build.c should be __init.
Why? This patch is first in your series and by that time there is no build time
enforcement. Together with the Fixes tag it implies that this is somehow an
issue (i.e. build/runtime issue) other than inconsistency for which we surely
don't need Fixes tag.

Same for the second patch.

>>
>> Fixes: 2705f1adb9df ("xen: introduce Kconfig ARCH_PAGING_MEMPOOL")
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
>> ---
>>  xen/common/device-tree/dom0less-build.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
>> index 2c56f13771ab..39cb2cd5c70e 100644
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -730,8 +730,8 @@ static int __init domain_p2m_set_allocation(struct domain *d, uint64_t mem,
>>      return rc;
>>  }
>>  #else /* !CONFIG_ARCH_PAGING_MEMPOOL */
>> -static inline int domain_p2m_set_allocation(struct domain *d, uint64_t mem,
>> -                                            const struct dt_device_node *node)
>> +static inline int __init domain_p2m_set_allocation(
>> +    struct domain *d, uint64_t mem, const struct dt_device_node *node)
>>  {
>>      return 0;
>>  }
>>
>> base-commit: 5873740e41acb8593f92623ddd03caebda2718f6
>> -- 
>> 2.49.0
>>

~Michal


