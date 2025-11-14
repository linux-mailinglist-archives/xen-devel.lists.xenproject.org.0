Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AF7C5CE5D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 12:41:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162506.1490136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJsAX-0005If-Qz; Fri, 14 Nov 2025 11:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162506.1490136; Fri, 14 Nov 2025 11:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJsAX-0005Fm-OH; Fri, 14 Nov 2025 11:40:45 +0000
Received: by outflank-mailman (input) for mailman id 1162506;
 Fri, 14 Nov 2025 11:40:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Irg0=5W=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJsAW-0005Fg-Jz
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 11:40:44 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfaa5b3f-c14e-11f0-980a-7dc792cee155;
 Fri, 14 Nov 2025 12:40:42 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB7523.namprd03.prod.outlook.com (2603:10b6:408:196::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 11:40:39 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 11:40:39 +0000
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
X-Inumbo-ID: bfaa5b3f-c14e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3O4YUSnaSLqmfqzJV/kwBekOrxS04JMehtE3XmNGy05hPjEfzk1rmewtcPTE2BVk59jPRrXkpr7NRIMqBZ2FvD3CiXgPo9qcl4vAqD5c6JudV44sOfdgJwyY/8X7ZRWnIhRMYSlCho+xioO5RzCufKicC66vpP/pBpUaVv/+PjTg6zoQc4578d/SPuJ1FSm0rFuw2VGR5spw0Nr//e21TqnqubfPVxlkIFBrEQ58oZQmxtAhOmKyoPxTMly/yHzBxgZIBcgVux/xH1ncREWdXtdJ8K74JYDN+vZ9QwXTUatwiStXWOOtGQ3gSe9Dkv8AyX59QoAGcU9l1imIk1qmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W19MrCDoPbtirXsMWA1QzvxUL8kXqHyIggKzu+m6Jxc=;
 b=KS0WYVHAsp+mEuleYVPCFyu7tR0NuILCajZ0Ia1zXtKAIEOj8bCEf16WSTaai8kD4qTsAEsDuBnNz2bjdKPW96+BXBU8kR0yIevwazdf9DDYALCFcg9UInpKfkkiFA3p948qQGnF+8WPVjkoziNaI6kSSR5BGPqWNCXgyrPmKA8HDwgWzZzvY76jSfi5hCvzSdLIo6DUg+yzs9mxcUQNTbURLGvC2mN/oe+5nUrDpJ8whgov/K4fXzU/EoARrfRd0pf5zpsgvbqIcm+anLgjatPpZ472hprOKojwNTmZrt4ND8h/hLObldNIa4uNCRfQHAg3suhkijJ+8EKywYzDxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W19MrCDoPbtirXsMWA1QzvxUL8kXqHyIggKzu+m6Jxc=;
 b=xiiux80xD20psiplsYPIE8v1zOkRhNUgUKp8TY6VEvDBOK3rV3n4Da6ozGOpRs7ue1PJzZYaDQFYXtQF0J0QadTSyCzAYKufafiDAYT+vcRHUkTzDDp+dvO5Y7NeIgEblIYKE+0/UXVYfFHXGaKMNj3IfA9k/P67ihG6JCon+yM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7e24823f-cce1-4430-83f1-ebde6986efa4@citrix.com>
Date: Fri, 14 Nov 2025 11:40:30 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] docs: replace @xxx@ markers at build time
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-3-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251114113238.9279-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0336.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::36) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 1beba3b8-ef77-44a8-23f8-08de2372a250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEVkUGZ0UEtPN1pUeVEwQWVNR3lrOUV1eThFS0RpSHFmZWR1K3hWcHBwcVJu?=
 =?utf-8?B?OExBYnY3NFhmWC94bTRuRDJibGZicjAyWlJSdWltMnNleVBZMVppUVVMT3gx?=
 =?utf-8?B?RDZoZTZPZTJCRFhBbjZ2andPY1RZYTNITjlwSnJibE54S1lNZmFzaDdxOFJO?=
 =?utf-8?B?ZFRiNUVpRlF1OStJU1hCSjNYTStBS3o0bzRDVTQxa1NOdks4bVZDdHFHS29B?=
 =?utf-8?B?am10NTlBRGxXZ2E2QlRHQ1VSRWR0OG1mMUgzT3d5ajdQRmpXaG9Va2lNWkh1?=
 =?utf-8?B?eVNzdzZXSUNmNVdpL0ZtM1BFZC85b1RxNW1HN25WeE5iVlBrTEx6RzRmNSt4?=
 =?utf-8?B?UjB2S21uYzNja0paT0V2dUl2dEpteXlXYWhGNklXVkQ2M3pFOUgzaGlCMFh1?=
 =?utf-8?B?MXVwbFBVRHR0ZWhNM1BZSXdRQ1luRSs3a3JNV3pmekpwY0hrTW1RRUVYY1F0?=
 =?utf-8?B?cjJCekswYmRyQjg2aWI4QzJXVE9EZ0dnRVpGcUI0OS9DTldlNnRRVWlxaC9I?=
 =?utf-8?B?RHRCdjBmYUxCdXFHQ1NLM1MwTGdYY3hHaUROMGl5M1ZTdjk5RVVzOU1UNk55?=
 =?utf-8?B?VzUxenpMSE1IVm5oZWtLVWg0WXhTK0o3Rit2TXc5R29iYnlnVHc4dkJReVVJ?=
 =?utf-8?B?WmhnUjFuN0tyRDNqbmwxUU9NOTFzSm5YbDQvZDdMV1VLalVSTGlSYkdHNVk5?=
 =?utf-8?B?MU9RVXJPOG5vYVlSYy9SUUtlbTBYSUdaeWFUVC9yMGhPT3U4THpMaGRpempQ?=
 =?utf-8?B?MjdFY2IrVFZvUUtKSkRwWEQ3RGVLRlUzSXNVRGFtU1FCUVJma2pKaU1Fb3lm?=
 =?utf-8?B?bUhSUFJWVGZQSTBIaitFc0N0K0ZNblBPMTYyTys1UTRsRkNvalRLREFrU1NY?=
 =?utf-8?B?TWpnVjAyM3pYMTdPbDVCUnpJUnBNL24yTi9XOGs1aFl1YVovaHMzZDV4VC84?=
 =?utf-8?B?OU9mUENFbXB5RS80OHhZTURYZDNMdENwUFh6akNPcDJqZGIya3dxdGVqZUZM?=
 =?utf-8?B?ckp3cmJZS0cxWHR1b2h0Wm1BcXRjSlBNeVgyVm9wUkg5c1lkQnlicXZ2RHZt?=
 =?utf-8?B?YU1xZCtpMDBmYkhMS09zMWZpT3JaamdFQ1pRZzkwVlhQOFA4MFVYZytENS9Y?=
 =?utf-8?B?R0ZRdDVNODZGYTdCWHlIbFFFRXI1RGwwM011cmRUc2VvS3dDTDdraHFXMndD?=
 =?utf-8?B?dmVDQjVQL3lnTWU3eHlxV2NHcE5vblBqbU5SNndYTkxyTG9qVUtaM1NVb0Nz?=
 =?utf-8?B?UFRVZmJOMmhtNjhHaER2UEJLeUdVRk9jTlRoMEdxamhqbTJMMGgzY0diS3Y1?=
 =?utf-8?B?TUtvVm9oRy90WWdqajlTeTFuMjVqSmxqejNUaUlzajVEd1NNVSt5N1ZlMnRQ?=
 =?utf-8?B?Z0xLQksxNktITzZCa2hadWE1RTNTRFRWVmpyL3FsS0dnZ0ZsWGs3SWUzWkdy?=
 =?utf-8?B?TDArTTJVQkgwVG9VbjJXNWZUQ3Q2MjJha09xdGxoQmJFOC9ZSG9EL2Qxa2No?=
 =?utf-8?B?YlJNZk9PdTQvYitsY3hQazJJT1YxY0t1UGxoa2hGMUttMXRjOVR2V1ZmanN3?=
 =?utf-8?B?eUdJamVyS08yTVIvMEhjdGx2QjlEWmtkYlIzMUtsTkZibklTMzVhNnRqU1l0?=
 =?utf-8?B?N2VoUDUzQUJaNXlyWUZRdTZVcU9YVDlxZ0szWmpHTG1uLy81endaWmxYRmFI?=
 =?utf-8?B?MXlTYVU3eHFzY2liQzl5V2pYZzBkVi9LYjRLNFZlOGhXK3g2a0pJM2Vac054?=
 =?utf-8?B?NjR3VGxPMExyWDZaa2hITzRDUGpzUlV3RkUrRURMdVdOYlFLSVEwTlg2L1hN?=
 =?utf-8?B?cnNVeFBlNUJNNko5QytBVkJSMk52SzhZVXFCRWlDdGR1ZTQwelZqOTgvb3JS?=
 =?utf-8?B?Yys3cnZaUmhKVjhwM1p2NWw1eHBwbG9lMk90V0p2eENpWldnU0Z3RmdlZERW?=
 =?utf-8?Q?3ynlFgByHgxRIVOgTWNqnON8jSAFtp6w?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2pvekJpTC9BVllaaHZCQlQxc2M3TXN2cEhGNmw2Z2JMUHdETWNqaUl3Z3FF?=
 =?utf-8?B?dHltMitsNnpXZE5YcUwxYkhsYmR0UHF6R2F0OFVFeTVwN25YaFBTcHVLWkFs?=
 =?utf-8?B?YmUwWnVYUEFZOEZQYnhUUElJT20yM1A0RXRqUzkySUhBNDVoOTJQT1NDaVQx?=
 =?utf-8?B?VWlKK3JBc282Wk80akNwUndvVjR0d2d4YU0vZktObFdsQytXc1RqWFNjODlG?=
 =?utf-8?B?a1Z5d3g1cENTNnMvckIvUUhZZzJHaGhRRDFiNnRyeXhnaHM1d2dPdHRQV0Q5?=
 =?utf-8?B?OHpEV0NJTU1mZGJEQ0VDNFVyN0hYbFZ6a3lXTkJMUGx5UVhqWnVFdFJDcVdn?=
 =?utf-8?B?QnRHR2FhNDl4SXFObmZYejdhbkRaOTBsR2ZNUTF1ckNWdldwYk9FMUZHZytJ?=
 =?utf-8?B?OGhhQVlTbHRUdWN2QjZrZHB6WDlDckJySjBnUld2TVdGQk9IS1JuWEhEV21B?=
 =?utf-8?B?QUt1dVkxQmhGRCtiOVJsVVZWWVRjM2gzdk9GbklETklnblFkQ1RBRWVsRkly?=
 =?utf-8?B?d3R4d1RlK0p0aStRZ1R4V2dMQjBROEJiNkNxMkEydWVvaDN6VGdsNFZ4MEdD?=
 =?utf-8?B?YWg1VDdSWmNvSGFXaG5IYWZ1aVFMOUE0bGpGUUJJM0xqcVcvTmFFTWcxek9K?=
 =?utf-8?B?REZYWFJ5SmhaUUZLUWJQdlhrN1ZEWDNjUXlPSEpuVUlMWVVnWVVFWWVWdW96?=
 =?utf-8?B?Mmd0ODN1cGF4Vkp0T2o1WTV0Q0Q5aHUyOGZrRTVlcWFTQlBTV3Vhc240Uy9Q?=
 =?utf-8?B?M0cyZnI3U3J6WitqQllPKzcvbHpvRldlR0JlRlExV3EwbnhYMEtHR1JWS2M2?=
 =?utf-8?B?UDBabGV5TEpWdVpCS2hDVUZXVkVsSGhYOEplMXJjNVdEZW5FSit4aEltRGVq?=
 =?utf-8?B?Y2x6aXMzYjQ4aXc3Nk9HbE9HcURFWnJyVm00VTRacjhabDRTZHNmb2I2S0lw?=
 =?utf-8?B?dHkzM240aTFYY1R6c2pkYzhuR0lyVHVLQXVIRS9iWGF1enVXa0FDdk5uRkZX?=
 =?utf-8?B?VUE0blFKMzcwelFGd3lpZWxtVlN4WHlzd1hOcVlXdktZVUlUT2pWNTEwTDNE?=
 =?utf-8?B?U2tTR21aNTVRSWpYRGx4cFdqZUVhOTJZTGZxNkFvQWxUbkU4R0JhK2ljVVJ2?=
 =?utf-8?B?b0FYa2FlWk9KTzlQb2FOd2RnYk93T2hpdUh2V0xFMS9Uc005UmxHU1o1dFNw?=
 =?utf-8?B?ZVlYYzhoVmtaZ3ZYaGtBT2xWK2Vhd2NxM0wvSnRhVlNRaFR5ajVLbTdUOExo?=
 =?utf-8?B?dmw2QW45UWp6V0hRR205cW5RTnhvaUh4L2ZyMkZaMTh0bENUZFBMb242L3NP?=
 =?utf-8?B?NFN2aDlGRkY5Y05ESmZtMmdkUnRMWXpsalNMRUVyOUduL1ZZejE2aFl1Nlhz?=
 =?utf-8?B?TVRJeER4RVhUT1MvN01tenJvdW1lUjgvY05oNmNMSXRhazNOYjBmdTh2VnV4?=
 =?utf-8?B?Q21rOGNiWEN2ZGtSVlZPWFVyS0JYM1VqZnFpYUs0YTJMMXpLMG96eDV5b0Rq?=
 =?utf-8?B?Wk5wbDNBSjVHZ3hVdDQwdVdiWkI5YVVMSWx1c0hERVZSdllVbkpiSVkvNGFo?=
 =?utf-8?B?dDhiZXdjZ2tJcHptUTN4QWsvbWdNQ0JRZ2E5WWVyNCtJaU9LVGZWQnJHTnFW?=
 =?utf-8?B?aXFIR0tKMVJKMUtEdTdSNm5NM0Fia1l2aWY0R2lMMC8rckN2ampKSWhoeE9C?=
 =?utf-8?B?MDVhRk43emFyMVNMMlJKR0dQMWVHRHlwQUwwS1RrUW9Qb05DcjVIUkdtcm45?=
 =?utf-8?B?a3Mzbm5VdWdYZHFrb2RsbmFIVFlUNVI0SDNUeVVPQjhlVWwxYkxEd3Flckxn?=
 =?utf-8?B?azJxeFVtZDRwcnFLUXZLWlp1dXAzWmE5U0MwcWR0M2wwTmZvQ0NqZ3pvS2hL?=
 =?utf-8?B?ZnNnQzJiZnhnVHVnYWlDZGozZWdXM1BUOEFSZ3NhVmhWUVJRSDVnYzFtTC9Y?=
 =?utf-8?B?eDdXVUwxMFlnMEQxM3M1VlYwZzdzNEJnTUpUb2hjM0kxalFFejB4bkdSYnhk?=
 =?utf-8?B?M0pkVjRENEFqL0NWZDdkdTc0OWY2TnVtTUJrZTg0blRRRFZoN0trNngwVi9y?=
 =?utf-8?B?cHNNcXBaMU1qNmtjSWdxNnZZc25nNWVRUXExdlErcHRtcVpvNXpUU1pTYnlp?=
 =?utf-8?B?WHBwYmNiRU05MjI4ZDdxak9XNm9QdEhHaWdRT0dpcytNcnlvT0NHdXhNeWlT?=
 =?utf-8?B?L3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1beba3b8-ef77-44a8-23f8-08de2372a250
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 11:40:39.1311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qlNw7FThJYSVahsyTdyUW+J5/GVL/RJL+BlUPAWYhTHBM8xmskojARDr6j5+JTa41tvZrSwnQ0iIwFvWiu3zP1ZzMcrYwRgN4lrwQQ/t8ro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7523

On 14/11/2025 11:32 am, Juergen Gross wrote:
> diff --git a/docs/Makefile b/docs/Makefile
> index 37776d303c..e5f4a8ca86 100644
> --- a/docs/Makefile
> +++ b/docs/Makefile
> @@ -8,8 +8,11 @@ DATE		:= $(call date,"+%Y-%m-%d")
>  DOC_ARCHES      := arm ppc riscv x86_32 x86_64
>  MAN_SECTIONS    := 1 5 7 8
>  
> +IN_FILES := man/xl-disk-configuration.5.pod man/xl-network-configuration.5.pod
> +IN_FILES += man/xl.1.pod man/xl.cfg.5.pod man/xl.conf.5.pod

Sorry, I meant to say this on the previous revision.  Can we please list
these one per line, for the future ease of inserting/removing.

Is IN_FILES really correct?  These are the generated (non-.in) files,
rather than the .in files themselves.  GEN_FILES from v1 would seem to
be a better fit.

But, overall I think this is a nicer change.

> +
>  # Documentation sources to build
> -MAN-SRC-y := $(sort $(basename $(wildcard man/*.pod man/*.pandoc)))
> +MAN-SRC-y := $(sort $(basename $(wildcard man/*.pod man/*.pandoc) $(IN_FILES)))

Doesn't the man/*.pod wildcard do this already ?

~Andrew

