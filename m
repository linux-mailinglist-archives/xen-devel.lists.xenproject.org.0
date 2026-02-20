Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eI60HPRzmGkoIgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 15:47:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02032168839
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 15:47:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237196.1539592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtRmd-0007hJ-GK; Fri, 20 Feb 2026 14:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237196.1539592; Fri, 20 Feb 2026 14:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtRmd-0007fC-CO; Fri, 20 Feb 2026 14:47:07 +0000
Received: by outflank-mailman (input) for mailman id 1237196;
 Fri, 20 Feb 2026 14:47:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rFK=AY=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vtRmb-0007f2-SC
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 14:47:05 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03edc4fb-0e6b-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 15:47:03 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by MN2PR03MB5296.namprd03.prod.outlook.com (2603:10b6:208:1e8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Fri, 20 Feb
 2026 14:46:57 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 14:46:57 +0000
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
X-Inumbo-ID: 03edc4fb-0e6b-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5qIEu/kWONXfbVp6x9w0QqusZr1VQEpFOkSi5++iQB3c8trcVQ3Hcdk60mG+4dqHmEl7D+JBp5P2XWeDqcwxuOQbotZOKyKefu+5TpkMgXMlQ3R4zH5FPB1HyK+Q5UZk1k1FdodSyKryPVHRA1fzEsYLDFHj4GNGnTZ1axnt1t7ZSwgHq2hUDa45ztzaCxh3/3kM1uIIMB8irohYkkUyAVjbjmbR4QWYL9bg1d1imOvo+MNWR+psqAREy+IZDGfi4KnVrQ+GhCW6td5/l+Q6KtIP5I3gSMTAoU5+rs4Cyj+9IiROcbg0SpKlsGTl2NOcCEX5e/wveLohWVb4g7ZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmntXQHEJ+iFf7+Dfcb+d97jb9EG0GWnk4fEwY6MoRw=;
 b=V9PqvYbi1V159HGG0nsqOOT0aI2tfE0cyaugL8Vz/OSMYP/17XssdScutofJJBNdRI0HbQTGBWflFOLUQBM/cUe2yz1OfzZPwpdlQSUcu7/b7kSOVo93JRCu+dosWSXF9d4G1qttRPTgrixy/l6OGXKYYaTzH8I7N1xT3BE8ygwFHZoHmChRGABbUMSOXLtuNX6PP8iV5e22dfv3QoNGsQwqjRW9g94naBpHOiCjs6UQIIRWZmbKO7RFF2jlYXwb8Z2PCuo534Wkzb2/cyJEGekMsMnXyvBqxYE0DR4s+sO0sWKfs9k7BvJHpKgAMaLJx0FYAGyYOrU2pT98Og9r8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmntXQHEJ+iFf7+Dfcb+d97jb9EG0GWnk4fEwY6MoRw=;
 b=TXTwbCGUbClLcQ710JeV+P0Bfbh83zoOhugXWTociMlFrwT6UOL1ybbFJk4/XLJ1VO/lvPYHe5YvOHjMeOxvDKR0uTI1aSZPSdYGZXDBZB4vWyx7IzoxgxCuUdCBM5Ul/GVQ5a4xcaTQlO9jUHf/peEqFtZG7ijMYdbILD9F00A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cb2fc137-b9e4-40ee-8ae1-fb1e5449f997@citrix.com>
Date: Fri, 20 Feb 2026 14:46:54 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v3 03/12] x86/shadow: don't generate bogus "domain dying"
 trace entry from sh_page_fault()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
 <e3aead11-f7f5-2ccd-d598-3e6ea19a0ce6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <e3aead11-f7f5-2ccd-d598-3e6ea19a0ce6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0412.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::21) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|MN2PR03MB5296:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a55dfe2-fe47-485f-4cec-08de708ee599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVU3RGswWE54M0pRejl5OUpvZHpNNjZHOGs1VWJtSjdFQ1lGVDZJVFkwenRW?=
 =?utf-8?B?SFk0aktnNDRhc3JPbDloRWNWNjdIdSt2UEFjQm5uVzdvcHRTWlhlMGU1Sm1Q?=
 =?utf-8?B?TVQweHpucXJrYk5zUXYwenRGVnF2UnJtNENzTzc2WlZUTTBYRVkyRWtTc3hF?=
 =?utf-8?B?dm43VHlsSXR1TGJ4dmtYTkhvNDRGMVZHZkI1d1JhUHNyTlNiVTRBRE1KREc5?=
 =?utf-8?B?eGEwKy91eGNZTUdSZjY1ZTlEbDVqcE9IbWRhM2kwUmZmYXFaR3Vjb0RDUno1?=
 =?utf-8?B?cUFRdFZwU1FJbXQ1WUVaSGI1NVE0R25WS3FCd0xTWlp6ZHQxTnNYbU9oSTdG?=
 =?utf-8?B?S2YzQkl0NkZaSXlhQnZQT0V3YVNjQW55UlBkQVFTVmNFWkVHVFltbnY4eE1r?=
 =?utf-8?B?dDU0V3MvY2NuL1dYQUtSUWpkMDJxRzJ3SzNGZ2hUY2piTlExUGg1ZVMzaVlo?=
 =?utf-8?B?bWxJclpFNFNDcmFzNHhWODhONUcxT2k5cmc2a0E4TkVYek5wVUU1ZmU2Y1lC?=
 =?utf-8?B?V1duY3U5Y1BXUVJKbVkvV2hSZWZCYkNsS2lVQnRQN3lPSkRQN3M1YUE5ZjM0?=
 =?utf-8?B?OEFqdWV6SUZTR2RYSFVDM1RpYUNwcU1PelB5WWExbWJpWTFGV05xenp2MkQ5?=
 =?utf-8?B?MFZxU1Ixdmhveng4dnJySklRTTlheERaYjdLYk8zbTlUd0M4UjRMRllaQm5W?=
 =?utf-8?B?N2N2ZlNIV2dwaVNEZ3RmS0s4Y3RuWHFnaXNDRk9FYnM4ak1XUlVtRHpsTE1t?=
 =?utf-8?B?SHNBSy9KR1BDQUN0MFZGVElGTGpJQkxGUHc5c3BTZncxdWViVlcwVmZKQXh6?=
 =?utf-8?B?NTRFVDJHRmFxSVJ4Z0RtL0RFenpzMWlLU0VxeFlSNHNpaVp4MnlCa0JLTFVn?=
 =?utf-8?B?NWpBOUpCUU5iOVMySTJ1L3RXV2w5eDN1djFubXNNNnJPR2ErSWQwRFA3ZmZj?=
 =?utf-8?B?Yis0TU9na01sajFYVWpHdmRKbDZkOHVWb2JrdFV3WTJwZEVDQWM1ZHZOSHI4?=
 =?utf-8?B?dHNaZUlKRHNvdUp4a1ZGL0Q4eE1RTTZ4RnRjR1dtakFYVm0zdVZ6Q2J4L2tG?=
 =?utf-8?B?Qmh0MzlEVGdtamx6NUlnT1pmU0h1cnk1UUU4bkRNRU01eUlnT2lNV0kzN0RZ?=
 =?utf-8?B?c2dHQU1IQ0xKV3RYMjVjOG5Mc2pid0swQ3RqaVA2K05XdDNOSXpwQ2lrbGNt?=
 =?utf-8?B?Y1BxdlAxT211WS80YlRzNVczQTlZVTlxZlpwdEJHSTIwOVNYd1JjWjNpUUdQ?=
 =?utf-8?B?bG5xaEtSN0RuQVBGZitpRWU0MWdIRGdRMWphdVBQSGhBaU5GaHhiU1BYc0V1?=
 =?utf-8?B?dXRRTTlTdTFiS3BWbWFMOXorWWcyUzZzRk1rdE1wdlZocmV5M1lpRUdrYTEv?=
 =?utf-8?B?S0xKV0p0L0Rkblc2RE50RWZJMkpLMGRmdjVnT0dQM2F6RHk1Z2lxZFpwaERV?=
 =?utf-8?B?cXVuR2JRRmZCSjkyOCtvVDJiVitCc2ZLOXdSUkRLZjBzaENwUk5DZ0FmVDRD?=
 =?utf-8?B?aDQvNmtXUlBOUXR4aEpUKzRKTUhBUTliT3BWaGoyL2RmWUVhOGxTcEh0WDVm?=
 =?utf-8?B?ZUI3TDBHRUFsbFdIVk01bGVPdk4zalZ2bGRrZU9BZkpLMjhPUzBkMHR2Nksr?=
 =?utf-8?B?ZldWUnQ4bmlRbUlHZTR4SENPNk1nTVlxTTRNRWZNMlJIRy9zYUI1U0F3Rnpr?=
 =?utf-8?B?eTltNEVMZUxaYWw0dmY1YjZNS3pVY1NwUFZzYWhWWEtPZmN3NHBXakdvcVlG?=
 =?utf-8?B?NndEWHJuTTAwVjh1T3FtN2NaYjFyZ0pDYnNVT2crY3RZNGo0RG92WmdEM2N3?=
 =?utf-8?B?bmdQUjMxbWJxc3QvWk16eGY3cnJlN0RSWkhWWUdrL0ZZZ3NlbGxGc3VzcG0r?=
 =?utf-8?B?L2RUVG96RFNBeVdWTlk2YzFPR1FpYllzYzI2VElJa0tTZUNjd2NFY0MyUm1r?=
 =?utf-8?B?MHZnZ0tobjFmZzErb210Yjhua2k2VmozbUFwSnhHUmI0YUIxTW1zWkIrbVJG?=
 =?utf-8?B?c2xtcUJEUlNjaDFzZUxCcEs2U2N5UWRBcHJETUdsSCtWTmVDQTVXc2NZckhP?=
 =?utf-8?B?SnhSVDZkb1JPR2MyNVZJLzZVSGkyN05tZ3dPQ3lGaG9TN1M5WWtLT0tWOC9m?=
 =?utf-8?Q?k6XA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clVzMTdydFJOWWI2S3JRWngwQ25KQWcrSmR0SG41QzByR01QTDNrUHdDM2Q5?=
 =?utf-8?B?RlNWNXFPcURseHBwUlVJczVIZ2FYT0lEZWp1anhrVG9sUWcvb05YTEhYMXVQ?=
 =?utf-8?B?cTJSYW9USzV4OHJMd2FybC9lRVpQbTRZMW1USGJpMC8waFN6Mk4yQ0szcmVt?=
 =?utf-8?B?U1NNb2c3NkQ4V3FyQmZvNk4wUFE1Ui90Q0hmNUh3eXUxSE54S0xIZTBHS1dI?=
 =?utf-8?B?ek9iS2QvMFVwV2xNNWhyL0tETUx2Z0JOa2pzN0lZaTFjS0RIVHhuVmFYaFBn?=
 =?utf-8?B?NkhVMnhHZWN6VDRRanBkT0tORy9nanp5WWxXZUM3cDV2M05tcDRHTy9PcG51?=
 =?utf-8?B?MXFpM0wvN1ZHZ1dsMm14QU5rc0VRMFNxNU41SFFvT1RUcFBNaXNtSk5lUHZM?=
 =?utf-8?B?ZFpHK1I5QWs1L3UvM2N0TlJEekVrTk9ielFJZ3QveVh3Q1dBeE90OTBxaUdP?=
 =?utf-8?B?VUtLQ3QrME9PRUtLMklrT1JpRGR1dUZlQzBkdTE1cXVQYXppVm40aDRac1p4?=
 =?utf-8?B?K1RmYUZyNy8va3ZuTGtNU1c5QWdzRUkvS1BqVno5b2t1bHp3Z3JudDVQbWxW?=
 =?utf-8?B?bXFiSmh0NC8xeURmbXdFeUtTeElOc3U5U2xNTUZqbFVyZVJUOEpJQjN2WEth?=
 =?utf-8?B?U1AxVjE0c1pXZDhQNS9ablFzc3FKZmNuUFNETllyc1V3cjhuNnczZnFGWS9q?=
 =?utf-8?B?S1B4YTB2UGxpSGZVZDJQbHFocWtFZlZZM1FjcEZvSlh3Rk5xdXUvMVBwbW9i?=
 =?utf-8?B?MTZIbStmdXY2SENQY3NxREw1RGpLOFJIY0JiNVBzcUlRZ2k5eE1Sakx6U25I?=
 =?utf-8?B?aXM5U1JhMDk0cG9qb0JJaWZ3WDMwaVlkaGM2aWxYdk1sblRnWHJMcDc4cnNm?=
 =?utf-8?B?VHp5eVF6L2lxZWttb3RmN2VlSlRMT2ZjeGNDeGM2ZkVTNU5yQVM0aENIaFVL?=
 =?utf-8?B?NHQvbEJCSE9vem1YVnFzOWl0cmtLT1loWTNpb1ZGZjYrVG03c3VEZ2xPbWR0?=
 =?utf-8?B?ODNNRmc5eEtsK053RGF3aU9rQ0FLcFpkek9YMHVxU1dwSm1YVjNXNFlxRk1l?=
 =?utf-8?B?ejFQU1VSNmM1enFaa0pOWXhKQ1JoYXh5Y2hFcUUrUUYzaHpqZ0JoM0FvcFAy?=
 =?utf-8?B?aWpYUjhWeTBQOUxDZEEwc3ltQU9KL21QdEVBcDNwU2I2VXZDcDIwS09OdGRa?=
 =?utf-8?B?OEhCaDRnVmY3a1phM1dLMmV4ZkkvNjBoWm9Mci8xazlRcU85dWJnemg2enQv?=
 =?utf-8?B?d3ZJTmV0RWMxVXA3Q1FUZmNlcFRjL2lIZ2pRYkJNZHJRY2ZrblppclJ1VzBH?=
 =?utf-8?B?T3JXemF5SHVlc2hxY3grL1dzRTl5eDNUSHMwNjVPZ3U1ZDFOTUJJNjRGVGRz?=
 =?utf-8?B?ZXk2di81YWwrT2VQZ29TL0VSd2F6bGh1UmhlUW8vOE00RVNrWEdIUFdsbStN?=
 =?utf-8?B?dlVMYTJ5SFh1RW04UUxJeFcyYTZpNFM5N0hwNVg1RmN5YWpZM3Mwb0ExcU1m?=
 =?utf-8?B?aDQva3NVWXpXNTZtcFBmQ3BRNTVUbTQ2ZjFRTkRZQXErSFl2WnFDbFl2WGhN?=
 =?utf-8?B?dnR6blY1Qmg1d0twMHNtZW1YTStiM2JJL2R5bnFCK3IvMDhZRUZaREJET2xo?=
 =?utf-8?B?OWdoeFNaNThFVnBVNTJ6Qis0QUxBd2xUTnBVVWNGMXhoVkdhM2dnQXZNSnE5?=
 =?utf-8?B?c0RWU0Uyb3JYeHpkakgvMFBReVNQaHJsSE5pNWw5RmZHYTZxUVJlRmxvSVB1?=
 =?utf-8?B?RkF3UFZFNjJ1aGRzak5GZWpxOTBPNVN4VWIyamhkYmFIVm5VU1pzbEVUb0No?=
 =?utf-8?B?aEhpMS8zKytWY1JGaXZrbFNuTU8xVHdWV2ZIQldmUDN6NmJIQjEybFBReTJJ?=
 =?utf-8?B?ZTR2R2pXZUkwNVZ4MXczMld0OURUSFdaVDAxb0xqS3lTY0hVNVBvVVloMC8z?=
 =?utf-8?B?Mnd6ekdySkl2ZFM5SkFUbjAvTWpMcG83M2U4aHFMSk5wdjRIM2p4MzJWK05s?=
 =?utf-8?B?a0FjZEQ0TDFQM3JVRFQ3bTlaZ0xPU1NtVUExdlMzTFhrblM4ZEsxdDN5MUpl?=
 =?utf-8?B?aU9pZmFEK0hWb3ZmaE0rb3dmV2hlRlRtdnRKaXYzWEpuUzEvSmZqV1Z5OTJ1?=
 =?utf-8?B?UElHVVgzaGJiek5kbk9LZUlKQmpPd21XSG0rZlhPOVYxVWxLcXZTYjRZQngy?=
 =?utf-8?B?cEdKME03clFmdkJFeUNETmhESW94Qk5Fc1ZFdVNVVDFWUlFLZjdMbE1ZU25U?=
 =?utf-8?B?NHg2OFlodHRGdU1WaGJkc0xURnF1UllHRUkxTy9CcmZhSmh4Z2QzWVR3N1Yr?=
 =?utf-8?B?NzhkazEzQnJ0QXB1NHp3ZitTK0ovZllISzQzMVdFRzJDbnJiSUZMZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a55dfe2-fe47-485f-4cec-08de708ee599
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 14:46:57.3576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9CAGXiFsNP7p28wg5jvFItDVi8ApDo3r74XG98cit8JB286wQ1e1d3Hm3TyhleY5z5DcXRtBaXxuVc4BxRvHm8FhrdWaPxGpmSwFzCyH8s0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5296
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:wl@xen.org,m:roger.pau@citrix.com,m:george.dunlap@citrix.com,m:tim@xen.org,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 02032168839
X-Rspamd-Action: no action

On 16/05/2023 8:38 am, Jan Beulich wrote:
> When in 3-level guest mode we help a guest to stay alive, we also
> shouldn't emit a trace entry to the contrary. Move the invocation up
> into the respective #ifdef, noting that while this moves it into the
> locked region, emitting trace records with the paging lock held is okay
> (as done elsewhere as well), just needlessly increasing lock holding
> time a little.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

