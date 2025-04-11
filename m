Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEBFA85766
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 11:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946879.1344632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3ALL-0008Tl-04; Fri, 11 Apr 2025 09:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946879.1344632; Fri, 11 Apr 2025 09:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3ALK-0008QX-Ql; Fri, 11 Apr 2025 09:06:34 +0000
Received: by outflank-mailman (input) for mailman id 946879;
 Fri, 11 Apr 2025 09:06:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Klsp=W5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u3ALJ-0008QR-7X
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 09:06:33 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20617.outbound.protection.outlook.com
 [2a01:111:f403:2412::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41064aeb-16b4-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 11:06:31 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by PH7PR12MB6935.namprd12.prod.outlook.com (2603:10b6:510:1b9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 09:06:26 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8632.017; Fri, 11 Apr 2025
 09:06:25 +0000
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
X-Inumbo-ID: 41064aeb-16b4-11f0-9ead-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5FkeuNtUN3K7gRnYawYDI/b1IKQDPhY2+v9J4thWXufJmq4FNjn3y8DiCOdFQw69danJwrKmmOU85m1YNKh+c3L/kF0tHYf96ylJNA+87kD4PSWQXU4o67FHCKE17GYcW3E6HcvlCmunwtEIEfH37S6CPfOejY4INyb0cu7C4gwBRKm30iIqbaKkT3hM0GBiiSEfUANx+HUofjKMXnWiWRY+Ah/9FJC8+xGYlKespU41lBCE48sEKrZjV44Hg+2Vs8RxT1WIUr8E0jZo5M5U3D5Xgxtx4jCnZ4lrX8xYSm+SfPy5fzcPjkbVzXt+L+KvPVQN+Va4Q0BpFxcTzneZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfLQjhbuK5ApXC2Y7jnFbEdq599rmP4xYvSbXDdRYLw=;
 b=m5yfg5KyqaXC4ZWU01zVY+c6P3PFcXZucLbIq5/WmR+WCjeLB7u/zf0rjSnPJbQZ3f35Hs8M53VVvUPgiFxT7BrkFxZt2ELUgcgJal9gftjJHN1F/8p6X3iAUm711WAchSxKquyQxr0Bo3AVqUF+EnxGfrLWlpxOrLQ2YvFUrB7IDfDFgm1sSCnITw4hMSZzRi56XX/E6ZRQFMyDnhfQKfLs2RGc8ZiFkbzwIL9aPAAv7tJW/0IMP4x9OThMBZ3LbT6B3ivOQQYh12NsmolyTwYWoY1McfcKMUORx1v8WkEV3SeKedX80+ccI8WcKxrtKTwra633cyA/qvVh1KBjVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfLQjhbuK5ApXC2Y7jnFbEdq599rmP4xYvSbXDdRYLw=;
 b=12L7ubnbYbXEUxqWkV3sOYxoz54wuH9/SlAbLdpj/N2MZ9xnaF9l7+jzZZFaAYPN6X02X2ayF5QGj7rUxbC24U3UhF9nzcVMi32MzNuhF3w6DchshMV/UKVMOi8Zvhb91Pr07bmOFBkOpvFNr+3nhPwR+wn84jl0Wl9vig/iniE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <78020588-d948-47fe-9eb5-255ddf6ac73e@amd.com>
Date: Fri, 11 Apr 2025 10:06:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] xen/arm32: Create the same boot-time MPU regions
 as arm64
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250407184443.1790995-1-ayan.kumar.halder@amd.com>
 <20250407184443.1790995-3-ayan.kumar.halder@amd.com>
 <1a58517e-e882-4ca6-898a-923d8a8fa8cd@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <1a58517e-e882-4ca6-898a-923d8a8fa8cd@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0282.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::14) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|PH7PR12MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aafbfbf-9eac-4e87-1e45-08dd78d8232d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TE9zU3ZxRWV2RnNnZ0NVaW5WUWFNOTJUcWxGQktVdStkd3dwcGVnd2g5c3ZF?=
 =?utf-8?B?UngzU2tYZ0RJZEhGVmw5MElkZEdMNnBEZURDM3VEWktYaTZwS0kyRS8rMkNm?=
 =?utf-8?B?UmYrZ083NVg0Z0FTb2Y0MStzM1MzVllXZzN2UWtPMXlDRkVwSjdTT0gyNk5P?=
 =?utf-8?B?UEVJTVh6a0pKb3AvaGFCSXB0TUo4cnVsYlhMWHEwWE9NODZLSGJld2N6djQw?=
 =?utf-8?B?WGtNSnNPeVBsOG84bjF5U3puSEVCNERrVlZRR1YxZ2hzNFljUlNVdmNlcDJr?=
 =?utf-8?B?bUJSM0JENk5nTHk0N2dqZHc0M01reGhjNzZ1T1cwcmtZaWNWb0FDS1hhZjlz?=
 =?utf-8?B?cVJHQnJSQ2pOU3M3UnZNeVlHVmM4MnllcUFmZU1JdEtwc3dPNXhaRmtONlMz?=
 =?utf-8?B?ZGJJdGpwNWJGbmNEbjc4dXM3RHBpNVF6clp6blJ1VUVLMlRoV0VxN2xLWFMz?=
 =?utf-8?B?QlF0ZllCZFFHVnI2OFB3UWdlWFB1c3JTYUF6ZGxhd0xFSUJKT2NEZ2ZITXZN?=
 =?utf-8?B?L3NLaWl5WWY2a1VNUnF5eDQ3Tzh1c3hLMjBzYUVVSjF1blZVNEJXMTgrZ0lp?=
 =?utf-8?B?M2RyYTBuWWZ1R2U0TEo5c1QyS3JtbWc3d0hlMjRFMWJlQTBLUFA5NFpuU3hN?=
 =?utf-8?B?SktpRTZmQUJmOTFBK0liMDh3TmxzNk93SlhaZTJsY2ttR1hBeW5QSkx6MStq?=
 =?utf-8?B?TnUvdnFLNks1ZkFNTnVlclNyWGRHUkFiazlwZ2YzUy9zN3cwOTd4bHUzbmEw?=
 =?utf-8?B?ckd6NmFIV2NoUFlFNHVOUEJ0TDdsUGhMc3NVNnFpeHZJclVlSWFFaE5oN29Q?=
 =?utf-8?B?TWpIdFVGblp6YksvQzV6MmpzdzlIdTZKYmR4T0UrQXNiSFdHc0h4NDZIUnBz?=
 =?utf-8?B?d0VneDVYWHlMRnAwZk1ZN25DTVhTMVJqaENaVUUzbENpSENEL1Rqekxtd1l5?=
 =?utf-8?B?TUpHTXhaNjBIVXJ0dmRPdDRlQTZuQVZ6R1pxMklEZC9KNXhCcUduSlJTRkFO?=
 =?utf-8?B?MXZrNHJpUncvMHpNc0F0M0VKdE5GNUNpRER2Z1FsRzhmaEJmcWZ4cmdSWHVa?=
 =?utf-8?B?Ni9CMkFXaVlwOENDdk9udHdFTm85TTlia3JtK3k0K0YzbG1ZZmNlZy9hV0dr?=
 =?utf-8?B?djd3NWY0Y2pMd0tHdi9yVndaempiQnpRZ0pENy9wdGpGL0NQWTJESlAvaDFo?=
 =?utf-8?B?YUUyRytQd2RZbENuTFVxczFJdlNaV0hNL0lxQWJlSmY0SzhRdnZPQ2ZnYlhR?=
 =?utf-8?B?aTNKcFpNRnFJck9tSTdyVXQ4SzRrYTNTaUY5SXJrOTdTVTNkYmxhcHA4bTRy?=
 =?utf-8?B?a0pZS1lISi9FdUQrK1REM1p2WGlwOUQybWVDUHBWMFUwbG5ENUZzTmNqTHd5?=
 =?utf-8?B?Qk55a1lNMFBLc0JEMlhTaTBpZ3pwWXF1Z2xiYzZHVjNyWmdrblBVZDhzTjI2?=
 =?utf-8?B?YXBYY3NMNCtOamUxeTFVYlFMcjIzM3BZcTlLV0NsWCtXRGQ2QWQ4cm1ORTBF?=
 =?utf-8?B?VURESTU5OVJyN0s0bC93d25mK1ZHSGQ4a2dZNGtSY2E5WGhGeEVySVAxWk5n?=
 =?utf-8?B?b2hGekwwT0pieDdxQS9FblFXY3Nhc2FnWGUwandlTWw2U21IZDU5UHcxZWI4?=
 =?utf-8?B?MTU4OGhnbW52ZUtlQ1JyUEJtSXJpMVdTOVVkaWFhME5vT3MxK2laOWRSOGJV?=
 =?utf-8?B?QkhwTDlvOWc3ZXI5N1hKazJiZEhzTHY5NFhzcWRERnJMUi80ZEpyZEw1elFW?=
 =?utf-8?B?ZTVVUXpqMW5JQitBbUZJNjhialgxUncxWHNSeE00eEZGa1BIdFlVSnhLZE81?=
 =?utf-8?B?NGhTQzZyc2FyeWFZK1NUQ21iZ2hyRlpBUmlVVzlSb0FheE4zcW5vZEM1aTRs?=
 =?utf-8?B?b2svdVA1U1NVSmc3YnFJTENRRlpJWEZuL2hQUXBNNDQvZHBpT21ndGNJNzZm?=
 =?utf-8?Q?p5KtENcPgIY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekhuOSsrQUVpUWpQSnhuY3ZRSlZsQjBDNXZhNHZtelpzMVQxa1FQS3M0RUxM?=
 =?utf-8?B?ZllBcEcvL1Q5bW54WlZKV3cvT1ZwZmlTT0xQYkdYWnp1ZTc3VS9qR0dBMGpZ?=
 =?utf-8?B?VENhQVFIdnpOU1NjWThuL3FkekZVV2ZKR0Q1RjFYVzhNMmc0NzRIVVFlaStL?=
 =?utf-8?B?dGlCMktUVnV1TWEza0c2ZGNNRXpGQVhsNkhsNFFYdlRVeHBTb0szbmlEa3VN?=
 =?utf-8?B?MmZYMEtVZG5rTVpWQUhIbFhIWnBuSW9PWlJBRDBDdUd6QlA0YnFSY25YUFlr?=
 =?utf-8?B?STBSaE5rSTZ6dFV3T0ZXSzd1MXpGZURhdnJiNThwME55a3cxczJaZTZxTzVW?=
 =?utf-8?B?NUQ1V0hGamVXaTJ6eVAvYitIVzFVMmlCNEJyc1lSdFpQUW45YzNNZGZleUZN?=
 =?utf-8?B?TXlSMldWV2hLRkNEMVQ1NFZJUlZqR09Qd1RleC9uQVYwTEp3YnRkbmNRc2x0?=
 =?utf-8?B?RjFuMkVlV1krZnhxb3hjTmdmSTE1akNuL0t4KzFEQnFYUGNET1RsUy8rdDhK?=
 =?utf-8?B?cEhxWHArMGUyNnZZR2hpd2cyL282dzVRTlZhMVFVcm1ud2NXWDljS3M2Z2Mr?=
 =?utf-8?B?TGtuN0ZRTTc5VFl1c1JzUytKVEFnM2I4QXZGWVQ4S1ZYNFFGOERYZTBmTkJI?=
 =?utf-8?B?WjA5S0cvSEQ5S04zVDdyWnplamVpU0xTRDlNUlRKbjVxZDN3ckNTTlF6ek1r?=
 =?utf-8?B?c0t2dlk0aGlpY285amtQUkhmbzJxKzI2RTJpeDdwWkU4YjFKZUhMbGRHWGJS?=
 =?utf-8?B?WkRsRzRWVnFyaE8vd1VkejZ6YW82VE9WYjlIZ0doZVFYdDV5MldQdUYvbU0z?=
 =?utf-8?B?WFZNZTdiWEcvM1B3ZWNaV3BZT1dvOERXWXZ6anlIYytkWTk3UTdsWEl2OTV0?=
 =?utf-8?B?UU9pREZRRDBLYWI4M2l4NmhVcXg5Y3lqRjhOUkwyKzdQcW54cEhpcnFvdlhv?=
 =?utf-8?B?eFkvUWxIOEQ4b29BSDhsNjJwWnREeTFzQVVsTVFtdHhKYTJjZUZuSWg4K1dm?=
 =?utf-8?B?MGRoMitBbkd2a1JCV0pscFRrTE93djJjQWtQdStwelc2M3ZwNDhrNGNvK1Nm?=
 =?utf-8?B?YmJLb01WTGY1OURTTCtkL2J2VUhkU2FWMExPYUNpbDJ3M1c5a0wvUGtmajJD?=
 =?utf-8?B?blVrSm5oUHA3NVQ1TXY2L25vRUZLdFZWSGRMMnZNcXI3RnlUcG5xSkpQOGl0?=
 =?utf-8?B?WjdtdmJpU3BrU3pvTnZ1UDliOGhDN0pXaWhLOU8xR3JraW80S3grSjNkTVgv?=
 =?utf-8?B?ZkhGb1RISmloeTBVa0N6N3F6SlhkNkhvY0dBTEJ1YjA1NW5SQWVXSlNzZkQw?=
 =?utf-8?B?YzJlUHp0NU9FcnhFWXpuWGowRkdGbmRBVkdZa1dRQ1R3ZTdHOEVZeWt1QWJZ?=
 =?utf-8?B?dE9ZUXBZV09uZnVsS1ozc1hVNnVTTDN1d1RGQW45cVdxNE9FcWhpaWtWZWlE?=
 =?utf-8?B?OEk4ajFJa0pyK0VkOW5IeUtQMGJ2Y1p4dzVyTVhHZ01pWGFXbGFHMWt4Y3lJ?=
 =?utf-8?B?TGd1d1JNYWxoR1hNN1FBeURlV3pCd09qYkpHNUo0ZFJOMy95NS9DSFFnSEl4?=
 =?utf-8?B?ZG9NMlJXd2hEc2NzVnlSdG9SdDRYeFJGbnAzKzhjRnAzSWZjOTk0dU41K2pi?=
 =?utf-8?B?VEg5QUhHTjF0Tk9CQk16NllUSUx1NThzbkNOWEpXWEsyNkVOZUdMMUplNTJU?=
 =?utf-8?B?dFI2Q2JRd1ZOY25hM0JqZlB4b3dwcFZCTmxaMFZPeEJEVXN3bm1ucUdRdUFm?=
 =?utf-8?B?SVhibm9PWGhtZHNPRlBWaWlhV2FFRTBtWDBMdE1Mb0phR3pGVUk1cUxPK3RW?=
 =?utf-8?B?aGdTOG1uN1hrVGdBam1FOWZPSU9lT01ab3RXbEY4QS9TZWcvb1R3NEZyT3VP?=
 =?utf-8?B?ZU5tNHQvTFRCZFVRSjlQVkxUMzIyZDRaaStYemxXMndoZ2hOaCtSYXExVXhx?=
 =?utf-8?B?SFJZejZ2VzZqRWZVaVF4MDV5SytCSWRJdzY3c2JobFRhVVZzQ2t2bG1zQXpD?=
 =?utf-8?B?YXlZcXptekhMaVhhNnUxS0NRMi9ucGxBcmY0c1p6eFB5NGFtR0FDSlFYRXRO?=
 =?utf-8?B?Nk5WeTBQa0Zndk5KVDRNd1A4d0xsZS9oUklNSmwzK1NxM3ZrUlRGZWFZUmlB?=
 =?utf-8?Q?9a6RVSjrQPByFQCmV9BxLXD/I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aafbfbf-9eac-4e87-1e45-08dd78d8232d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 09:06:25.7395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgHE6Cm7pEzZGtXtsIHkdJ4QBVdlxu3Hw8qL4tTJg/CW4kskqn9lvsfo0v5XD7vy3tSScYbOhk/NBWNnonCf1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6935

Hi,

On 08/04/2025 10:13, Orzel, Michal wrote:
>
> On 07/04/2025 20:44, Ayan Kumar Halder wrote:
>> We have created the same boot-time MPU protection regions as Armv8-R AArch64.
>> Also, we have defined *_PRBAR macros for arm32. The only difference from
>> arm64 is that XN is 1-bit for arm32.
>> The macros have been defined in mpu/cpregs.h.
> NIT: Describe your changes in imperative mood
>
>> Also defined WRITE_SYSREG_ASM() to write to system registers in assembly.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from
>>
>> v1 -
>>
>> 1. enable_mpu() now sets HMAIR{0,1} registers. This is similar to what is
>> being done in enable_mmu(). All the mm related configurations happen in this
>> function.
>>
>> 2. Fixed some typos.
>>
>> v2 -
>> 1. Include the common prepare_xen_region.inc in head.S.
>>
>> 2. Define LOAD_SYSREG()/STORE_SYSREG() for arm32.
>>
>> v3 -
>> 1. Rename STORE_SYSREG() as WRITE_SYSREG_ASM()
>>
>> 2. enable_boot_cpu_mm() is defined in head.S
>>
>> v4 -
>> 1. *_PRBAR is moved to arm32/sysregs.h.
>>
>> 2. MPU specific CP15 system registers are defined in mpu/cpregs.h.
>>
>>   xen/arch/arm/arm32/Makefile              |   1 +
>>   xen/arch/arm/arm32/mpu/Makefile          |   1 +
>>   xen/arch/arm/arm32/mpu/head.S            | 101 +++++++++++++++++++++++
>>   xen/arch/arm/include/asm/arm32/sysregs.h |   7 ++
>>   xen/arch/arm/include/asm/cpregs.h        |   4 +
>>   xen/arch/arm/include/asm/mpu/cpregs.h    |  24 ++++++
>>   6 files changed, 138 insertions(+)
>>   create mode 100644 xen/arch/arm/arm32/mpu/Makefile
>>   create mode 100644 xen/arch/arm/arm32/mpu/head.S
>>   create mode 100644 xen/arch/arm/include/asm/mpu/cpregs.h
>>
>> diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
>> index 40a2b4803f..537969d753 100644
>> --- a/xen/arch/arm/arm32/Makefile
>> +++ b/xen/arch/arm/arm32/Makefile
>> @@ -1,5 +1,6 @@
>>   obj-y += lib/
>>   obj-$(CONFIG_MMU) += mmu/
>> +obj-$(CONFIG_MPU) += mpu/
>>   
>>   obj-$(CONFIG_EARLY_PRINTK) += debug.o
>>   obj-y += domctl.o
>> diff --git a/xen/arch/arm/arm32/mpu/Makefile b/xen/arch/arm/arm32/mpu/Makefile
>> new file mode 100644
>> index 0000000000..3340058c08
>> --- /dev/null
>> +++ b/xen/arch/arm/arm32/mpu/Makefile
>> @@ -0,0 +1 @@
>> +obj-y += head.o
>> diff --git a/xen/arch/arm/arm32/mpu/head.S b/xen/arch/arm/arm32/mpu/head.S
>> new file mode 100644
>> index 0000000000..84e9f1f8ec
>> --- /dev/null
>> +++ b/xen/arch/arm/arm32/mpu/head.S
>> @@ -0,0 +1,101 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Start-of-day code for an Armv8-R MPU system.
> That's exactly the same text as for Aarch64. At least write Armv8A-R-AArch32.
Ack
>
>> + */
>> +
>> +#include <asm/arm32/macros.h>
>> +#include <asm/mpu/common.inc>
>> +#include <asm/page.h>
>> +
>> +/*
>> + * Set up the memory attribute type tables and enable EL2 MPU and data cache.
>> + * If the Background region is enabled, then the MPU uses the default memory
>> + * map as the Background region for generating the memory
>> + * attributes when MPU is disabled.
>> + * Since the default memory map of the Armv8-R AArch32 architecture is
>> + * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.
>> + *
>> + * Clobbers r0 - r1
>> + */
>> +FUNC_LOCAL(enable_mpu)
>> +    /* Set up memory attribute type tables */
>> +    mov_w r0, MAIR0VAL
>> +    mov_w r1, MAIR1VAL
>> +    mcr   CP32(r0, HMAIR0)
>> +    mcr   CP32(r1, HMAIR1)
> Is there really a need to do these 2 writes one after another?
> Why can't we use only r0 and save one clobbered reg?
> mov_w r0, MAIR0VAL
> mcr   CP32(r0, HMAIR0)
> mov_w r0, MAIR1VAL
> mcr   CP32(r0, HMAIR1)
I just copied it as it is from head.S. :) I will change it in v6.
>
>> +
>> +    mrc   CP32(r0, HSCTLR)
>> +    bic   r0, r0, #SCTLR_ELx_BR       /* Disable Background region */
>> +    orr   r0, r0, #SCTLR_Axx_ELx_M    /* Enable MPU */
>> +    orr   r0, r0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
>> +    mcr   CP32(r0, HSCTLR)
>> +    isb
>> +
>> +    ret
>> +END(enable_mpu)
>> +
>> +/*
>> + * Maps the various sections of Xen (described in xen.lds.S) as different MPU
>> + * regions.
>> + *
>> + * Clobbers r0 - r5
>> + *
>> + */
>> +FUNC(enable_boot_cpu_mm)
>> +    /* Get the number of regions specified in MPUIR_EL2 */
>> +    mrc   CP32(r5, MPUIR_EL2)
>> +    and   r5, r5, #NUM_MPU_REGIONS_MASK
>> +
>> +    /* x0: region sel */
>> +    mov   r0, #0
>> +    /* Xen text section. */
>> +    mov_w   r1, _stext
>> +    mov_w   r2, _etext
>> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
>> +
>> +    /* Xen read-only data section. */
>> +    mov_w   r1, _srodata
>> +    mov_w   r2, _erodata
>> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_RO_PRBAR
>> +
>> +    /* Xen read-only after init and data section. (RW data) */
>> +    mov_w   r1, __ro_after_init_start
>> +    mov_w   r2, __init_begin
>> +    prepare_xen_region r0, r1, r2, r3, r4, r5
>> +
>> +    /* Xen code section. */
>> +    mov_w   r1, __init_begin
>> +    mov_w   r2, __init_data_begin
>> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
>> +
>> +    /* Xen data and BSS section. */
>> +    mov_w   r1, __init_data_begin
>> +    mov_w   r2, __bss_end
>> +    prepare_xen_region r0, r1, r2, r3, r4, r5
>> +
>> +#ifdef CONFIG_EARLY_PRINTK
>> +    /* Xen early UART section. */
>> +    mov_w   r1, CONFIG_EARLY_UART_BASE_ADDRESS
>> +    mov_w   r2, (CONFIG_EARLY_UART_BASE_ADDRESS + CONFIG_EARLY_UART_SIZE)
>> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
>> +#endif
>> +
>> +    b    enable_mpu
>> +END(enable_boot_cpu_mm)
>> +
>> +/*
>> + * We don't yet support secondary CPUs bring-up. Implement a dummy helper to
>> + * please the common code.
>> + */
>> +FUNC(enable_secondary_cpu_mm)
>> +    PRINT("- SMP not enabled yet -\r\n")
>> +1:  wfe
>> +    b 1b
>> +END(enable_secondary_cpu_mm)
>> +
>> +/*
>> + * Local variables:
>> + * mode: ASM
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
>> index 22871999af..a90d1610a1 100644
>> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
>> @@ -20,6 +20,13 @@
>>    * uses r0 as a placeholder register. */
>>   #define CMD_CP32(name...)      "mcr " __stringify(CP32(r0, name)) ";"
>>   
>> +#define REGION_TEXT_PRBAR       0x18    /* SH=11 AP=10 XN=0 */
>> +#define REGION_RO_PRBAR         0x1D    /* SH=11 AP=10 XN=1 */
>> +#define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
>> +#define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
>> +
>> +#define WRITE_SYSREG_ASM(v, name) mcr CP32(v, name)
> Same comment as for previous patch.
Ack.
>
>> +
>>   #ifndef __ASSEMBLY__
>>   
>>   /* C wrappers */
>> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
>> index aec9e8f329..6019a2cbdd 100644
>> --- a/xen/arch/arm/include/asm/cpregs.h
>> +++ b/xen/arch/arm/include/asm/cpregs.h
>> @@ -1,6 +1,10 @@
>>   #ifndef __ASM_ARM_CPREGS_H
>>   #define __ASM_ARM_CPREGS_H
>>   
>> +#ifdef CONFIG_MPU
> NIT: Do we really need to protect this include? I thought we do the ifdefery if
> we need to include either mmu or mpu. Here we don't have a choice and afaict
> there's nothing problematic in mpu/cpregs.h
Ack.
>
>> +#include <asm/mpu/cpregs.h>
>> +#endif
>> +
>>   /*
>>    * AArch32 Co-processor registers.
>>    *
>> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
>> new file mode 100644
>> index 0000000000..6b20c7ceae
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
>> @@ -0,0 +1,24 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef __ASM_ARM_MPU_CPREGS_H
>> +#define __ASM_ARM_MPU_CPREGS_H
>> +
>> +/* CP15 CR0: MPU Type Register */
>> +#define HMPUIR          p15,4,c0,c0,4
>> +
>> +/* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
>> +#define HPRSELR         p15,4,c6,c2,1
>> +#define PRBAR_EL2       p15,4,c6,c3,0
>> +#define PRLAR_EL2       p15,4,c6,c8,1
>> +
>> +#define MPUIR_EL2       HMPUIR
>> +#define PRSELR_EL2      HPRSELR
> AFAIK, these macros are there to use AArch64 sysreg names in common code when
> compiling Arm32. This would mean they should be protected with #ifdef CONFIG_ARM_32.

In the case of Arm64, the MPU system registers are defined by the 
compiler. So, these definitions are overridden.

I will enclose this within CONFIG_ARM_32 for better readability.

@Luca - I will keep your R-b unless you object. The changes are mostly 
style related. :)

- Ayan

>
> ~Michal
>

