Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7319AEB338
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 11:46:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027463.1402095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV5ec-0002Bl-Jq; Fri, 27 Jun 2025 09:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027463.1402095; Fri, 27 Jun 2025 09:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV5ec-00029L-GK; Fri, 27 Jun 2025 09:45:54 +0000
Received: by outflank-mailman (input) for mailman id 1027463;
 Fri, 27 Jun 2025 09:45:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXb5=ZK=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uV5ea-00029F-JQ
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 09:45:52 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2414::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81d1df37-533b-11f0-b894-0df219b8e170;
 Fri, 27 Jun 2025 11:45:50 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SA5PPF7F0CA3746.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 27 Jun
 2025 09:45:47 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 09:45:46 +0000
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
X-Inumbo-ID: 81d1df37-533b-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtBlBujmc8Qj0843bEWBJcLbUSl28NJfLBiMBCpICEK+MjlT9pRpGC9iRntKQUG8ATtnnLtMO8lLvMMr0eWQIEsI1+y/aWOPjOU3H1MdtMVOAtgcMKZ5gVbuNFxcewZhpiBErh31wHVssBkMbiByAuZ4dyX7FO4s84iR0fYwEyxtIwSoCH8PRchAfDI9Om8GGi4wg3wTwiIl1IxjvXZX59t0koCwMVZktQYi2Hlkl+7EbXdGkVOPdhAhd2pxhPDOQHjjtwKNU7WlhcWjlaXLoaNm/staypVj3N+J/ca0NbgI+GiH9Xa3RoKiOYMSDm6XPmjoUngvX6oduxnqYLijKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zp1T56vdfDLeGsSCs4+c5SbFfzuggScv3Ukf+R6U4+4=;
 b=xvZlgkvrlEqANMe6Yks2keNg1JWFDqUJZ49ZxocC3Vt/4cGnD4Hhdy2J3iJngqoYUe4x5sduD3XHRa7Oqs7UWcTuVeAudOBROax3HQB8UQKtSvK1kO0gi1PoqsW7xZjMV8ja25tsR1MAYdfrd9tjm8a3NSDPvJMNFQdMLCmCsoWsB1i9MHt+Wpn4YrXeI2uPTsKvYU8PsCHXMb5SEGcGe2ZD6HiEY8EFlGERzpHfXtXPHkzoKXmyEmzzxJUsg+7dTljWWMITcLcVGTX14jI3n93oP8geZYFQ/X9CqpuJpHPnM+aYsEi/FN7hD2TgZcpY1ggxee23HZjI9u9jNjEX6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zp1T56vdfDLeGsSCs4+c5SbFfzuggScv3Ukf+R6U4+4=;
 b=bl1se0+DBZfjA+QNGzejCXU2UdY/pWGSaq1k7d4gWcUH2ysYUp1I966YhcOBtA56tg66kuF8FhHfrB5G059hPKQ8AW9puDBw+WuGRtSgfbqUuRhxx07TEdbwCvXAuwMfmbIn45BPwiMIRNKKTW/y0SmiVqG6NOB2mo9bH59NrrU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d1717cae-f5a1-4af8-8962-f4fdad1baa55@amd.com>
Date: Fri, 27 Jun 2025 10:45:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Drop frametable_virt_end
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250627084334.45172-1-michal.orzel@amd.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20250627084334.45172-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8PR06CA0004.eurprd06.prod.outlook.com
 (2603:10a6:10:100::17) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SA5PPF7F0CA3746:EE_
X-MS-Office365-Filtering-Correlation-Id: 45dae592-7957-44a4-2cd7-08ddb55f6432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnlPMTJMMWhiUDNTL0hnaC9uRGh1TlR6QlFRSEJpamJ3QTg3bXNWN09vUzJT?=
 =?utf-8?B?K29NUUp6WDAwY21HcCt6Q2pCRy96aTZpY3pjbXUza3kzQUVuVjRNRytTbkJn?=
 =?utf-8?B?Qnh3a09nemFBN3F6SHB2cm5yem5rWk9qVzJhMGVzdE1aVEZkNjZDbjhWZWFo?=
 =?utf-8?B?cUJWdXlQVFF1TGppYnVEVlhaV0tQcUk1S05XNlQ4SWZWQjA4RzV3SmRoeWlo?=
 =?utf-8?B?a0JmK1ArRVJwQ29FRVlnMUt5dUZ6eHQ3R21ZemNBZkxEU2UvQUlMZEhsV21o?=
 =?utf-8?B?d3lVa0ZqZmV2d0FTTVdmei84NHBLZFgyY0Z5M1pUZXFlNGRhNXdRcHRiV2gy?=
 =?utf-8?B?SWtKYXJhSWVWMG9EVDZVZmZWQXM3UUp6bFBiRld6Q1R3bFpTVnJENVI1RWZ2?=
 =?utf-8?B?T2RhMk0vaFU2Y2NwVDg3UXZvWHRhL1lFYzh3RWdDTDBzM3ZnNlh1alFuU2xj?=
 =?utf-8?B?dVlSNjZ6Z1BmVjlNK3U3SUMvaVNib09scFdFVEU1dHc0R3MrYkx2aGFSZ1VB?=
 =?utf-8?B?bGpKZGFXWGN1Y0s0azI4bnF6YzgvZ2JwMEtWM081SU9INnJ1ZnBXSlk1b0hv?=
 =?utf-8?B?R2RVT1EzODZtTlZ1dWd4Z3ltVFMza1pscm5HZTUvWG5qSHdrYWpGZUZjVFBo?=
 =?utf-8?B?aWF6YVY3dysyTnhnblNIVXpnYjY3eGZ6ZXJGeFRQNnpBQldIN3NMSlcyMmdE?=
 =?utf-8?B?MDJjVjNhY3o1alBGbXkzaklPYkZrS0VOMURYY3hVc0F0ckg0ZXlxdHpxK0tv?=
 =?utf-8?B?NCtpS3F2eVJnYjN1MFhVU28rblluSzUwQ0hRZy9YSFRSZkQyNUdqZnpSdUMr?=
 =?utf-8?B?RHB1bUVQSFBxalk4UXhQa3BjNEpTbEx3Z3AvdTkxd3RNcmpsNlRWK1dsbExZ?=
 =?utf-8?B?bXBIQ1k1NnBMenkrZ0psalNUd3hYbG50ekx5TnlkTDgwZy9mTDZEYUJ3OXR4?=
 =?utf-8?B?cWxESlBPd3JTOHQzMmZ4VHN4bFQxRm5ieEJObTkvc0ZHS3dNTFF6RDgrSmJJ?=
 =?utf-8?B?SnAvNVFsNnNEUjhSc3ZXcmx2QlhDb3N2NGFydVVZS0xIVHN1Tk9wcDdSbkRn?=
 =?utf-8?B?TzYrYkphNXpFNHdVeW01Tm55NG5oSWZ0czFJSFZPbi9rSklyVHd6RU8wbTl1?=
 =?utf-8?B?dnZQeHhoL0ozU3NuU0dyM2dTeGdWc1RPbXdOd0l1djdGOGJobHEyTEsyQ1VC?=
 =?utf-8?B?ejUyWnVHOWVpV285OGhLL21vVUtYSmtNTVpGZG85cGRTRk5HcWR3aWdVQ3hO?=
 =?utf-8?B?SGJFOXFWU3IrZ094bE5nMmZBQ3E4aDc4QUh0QmlxbWxCZ3EzTTBYemxNTjdF?=
 =?utf-8?B?OGhNeC9zVStBOVMvdGgzOHBTVkRXL2dUdDA0d3FML1FhZ0ZEZS9EaW8xRjlH?=
 =?utf-8?B?R2k2UEdMTUw0UXRmbGhzQm5vVllxaE1tbmlzUEpGYU84aEZ4VUNGeHFHQWN2?=
 =?utf-8?B?dGhETHFmRGxRNUN5L3gwTTZiWVJ1TmdoS3VnRnN1TzQ3UXNOeSt3cGlwYWlO?=
 =?utf-8?B?eGJnVHI0M0hSaXJJY0s2SmhuTmdPanBsdWlaVThPYnlMb3A1RVNzSGs2eU9U?=
 =?utf-8?B?N0VCL1VpTkNxdDRjOFZDdy9pN2lYNFZVUGI1LzJXMGE4SExwYkRjUkhmbWNL?=
 =?utf-8?B?SlhFcW5NRGk2aDNVL0MwMzhQMmx2Vy9kWEtqRFVKMFk3WXMrMGNnQ0pVVFpy?=
 =?utf-8?B?SUx3Z1dGemFUWjIzdU9BS3JlS0k2WEI4NjAyOGthdS9NeXdDZ1BKekxhZWZl?=
 =?utf-8?B?YUxUb3NPWjVJV0pwelVpOHNlVVJYVm5lbGpFOExuS1Y3ZFhRYkQ4N3dTeU4x?=
 =?utf-8?B?VEJoZ1VsVzdzVVJ1YUtvaFYwVG42SjBqYXQ5eFlrM0dhdHllajcrcStsTXBZ?=
 =?utf-8?B?c042NFl6SWs4a2VvUTcvRDhidWMwNWJMQzRmY3NNLzY5OFVkVUIvR1BlMTZ4?=
 =?utf-8?Q?MOUKzS6fcLI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkMvWkNubzl6SzhvT24vRDg3Z2Fkd1RUUHB2MWFrSXNteWd5ZHpYOU9tU1Iz?=
 =?utf-8?B?TU9EeXhqNm9Ud25xYXZZcVVyOTFUWnpCdzhUUnNQNzVVNndUR1E2N1I4L0du?=
 =?utf-8?B?emc4dlBEMVpTMkFUWFd3em9hN3BmT2M4SHNvQjBHaTIyTGhHNFVMcUg4Rll2?=
 =?utf-8?B?WEViMmtRQ0hJQXBPaDU4RHgrQUQxVldjQnJHZkdzQkJRbnRRMkxCcFFLN2Ns?=
 =?utf-8?B?UytlRXVxL3k1b0NKSVdBLy96MUQ5bVgwczdkU0cyOUpJZ2ovRGFHL3gyL2h5?=
 =?utf-8?B?OGRjbkx5b0FwbWtWNENRNWJacmNZWHZBL1hDbGQvVm5ibUc4cWhTVGMzUitX?=
 =?utf-8?B?UVNvWkwwa0JEOFVoRER2Nlk3VGxCM0xJbFRCZk5JUlRVVmJoUXZhK0I4SGE3?=
 =?utf-8?B?WHowNnM2MmJjU0FLOGE1UmRTSndSbm0rd3JPNVVBZ1NMZlp2cjZiYkZyeFhQ?=
 =?utf-8?B?Z0ZNa29nVEF0dkZvSGZodktXMFRmb3kvTXNYT1FSeHk1VVd6cHNHMWtRR3Uy?=
 =?utf-8?B?S1JVQjlLQXFkdnI1bi9HV3lOWW4ydjRMR2J3d2oyL0lLNTl3VDhMdHNzS0tI?=
 =?utf-8?B?dnVwUm10cVRVRHBKZGZoRmx6QXVONkx0R2NrNVhZcUdtbVRLdXRTazJRV3l3?=
 =?utf-8?B?blg3MlBuYzNxUFduUFVaOWFGSlc0WWNwa0xxY0dyWXJxcVZ2K0JGb0JFaTgw?=
 =?utf-8?B?UldmL1BUM0E1R3FFcW5kMXVJVm5ySmxTenZReTFqeXVjY3JidXplSERCZ0k2?=
 =?utf-8?B?b1dXMGxpVy81VElnOU8yZW9lSnhvY2NkY0diTVV5ZW9KSnpvWnphaWFHaXNZ?=
 =?utf-8?B?QWRSNSttYUQ2L3hGSlhQaEdYczJnTXo5cGI4YUY5ZnJybWlGaDIxdUEvUWJX?=
 =?utf-8?B?VXI0dmNkRndlZ09MS1ZlUEovQWw1RmZXdU0xcWNCOFpIYTRJdXJVaC96TWx5?=
 =?utf-8?B?ejJyNkhUcUE3TlRkQnQ0RktzclNSUnpvUnJvZndQbWxlSk9FM3VvbUtNK2JQ?=
 =?utf-8?B?VmNvNVRqVElhb05xdmswVEdMalU2TXB0SzhwdEZDTDZnNHRkNStBcnVESGlJ?=
 =?utf-8?B?Y0Z1SHdRZVlyeVZCOXF4bzdKaTVtUDV5NENrSkRyN1hWeDZuVE1BTFQ1ZXRM?=
 =?utf-8?B?bGRJTGxWREVxZmJsK1RyaFl5T2J6dGR4b2U0V2hLQTVOMjljcnAxVkRCTDQv?=
 =?utf-8?B?R2IyUW8wNDZkNUNTMGhLSFFXYVVWZFJEK0ZLc3NFSDZad0I4by8yRFZFY3d6?=
 =?utf-8?B?UnBsdnUxci83SktPM0JWOGlvMy9VWTNkZzdmRXc0b282RFBzNnVPNXh1N2hi?=
 =?utf-8?B?WThEelZLb2JrUzhSZTU4alcvM2xwc3JzUjdTWFBHSEtWWFBZZkNIRHVMeUZT?=
 =?utf-8?B?L005anpkUTZhUzFaeGJMdVd3VmJHWUxxR3lFWG15MGs4Q1VqZGREckxleEpM?=
 =?utf-8?B?NEJmblIrUVl2MlN2Ny9EYTh3eC90OHFQYjArS0ZQbUZTb3NXeUhyUkllUXNh?=
 =?utf-8?B?UjA0OEplRnZkTk5VNVlJakFkaUJvcTYvOE81NVF0eGZacit0OVJjcUJqc2k2?=
 =?utf-8?B?SFA0aCtFNG5pdmgrc01hUzVNdnFQV1l1RThsbVFhQU5mNjl3b2RmNTQrSk5m?=
 =?utf-8?B?MmRxVFNwWGpUNjEyN0JONXJRWEZJcmlaYk83cHlRWDJIRFZlUW5vZ1YzTm15?=
 =?utf-8?B?UzZuTCtBTlVDSEpYZDVTUTgxU2t2S2FEV3ZqZjJ2S29tVkZHSG5MZTByWmNu?=
 =?utf-8?B?N3RnaWs4RWU3VUtWbUJrTndsWm5PWkJiUjFUSVRacVphUFI5OUNjSXYrNFBQ?=
 =?utf-8?B?NWMyQkxNZjhEVFI4bXM1UTlVUFkrSE9rZVJKZmJQOUNLY3BJc3RlKzU0Slk1?=
 =?utf-8?B?amgyQkNkNjJqemNnYWJVVE1OQ1dhakF1SkNyR1dKVitkRnhYSnVRZ1FROERZ?=
 =?utf-8?B?b3U1eDdxbyttMUlobUpGNHZETElibWs4Mkh0aXArMk10djgvUFVoTFRLeE1r?=
 =?utf-8?B?aStsbTExY3FWZ1lKUzgxWFFPVEhRZzI5L3p0S1lrem9Oc1o3YUJKbEs0UlBM?=
 =?utf-8?B?eFRBd1lUa1gwclJZOG9EM3RHdzg5S0sxUnJxMkFsaG9zV0UzS3N3dnVqSS9R?=
 =?utf-8?Q?QUFMKM0//C7SwAcn6Bv6n5NLG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45dae592-7957-44a4-2cd7-08ddb55f6432
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 09:45:46.5651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKQQ8eSGYN8hlmKWrGtqxFO43MKqPrW/eaaf4nRpzHszgf2YuWB+V4Alb7/nlN80nqeuKMS1Sq6n42BiTk5PGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF7F0CA3746

Hi Michal,

On 27/06/2025 09:43, Michal Orzel wrote:
> It has never been used since the introduction and is technically a dead
> code violating MISRA C.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

- Ayan

