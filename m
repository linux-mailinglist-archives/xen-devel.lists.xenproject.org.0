Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CDB623D3F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 09:18:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441521.695632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot2lF-0006Xf-4p; Thu, 10 Nov 2022 08:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441521.695632; Thu, 10 Nov 2022 08:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot2lF-0006Ut-2C; Thu, 10 Nov 2022 08:18:09 +0000
Received: by outflank-mailman (input) for mailman id 441521;
 Thu, 10 Nov 2022 08:18:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PT5E=3K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ot2lD-0006Un-RZ
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 08:18:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33ec9801-60d0-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 09:18:06 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8923.eurprd04.prod.outlook.com (2603:10a6:20b:40a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Thu, 10 Nov
 2022 08:18:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 08:18:04 +0000
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
X-Inumbo-ID: 33ec9801-60d0-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpNzGYyq8RFcDidnfGqmU9tbBK+ozJ90XtnM3dCUYXpNmlrCDwl59jug2b0M7rD8PBIKb0LoMgeDcdLNUJ1OAgYuwI2E4YuYS3zLD1PD2sXUXYCWLoDdWXCPyn8/LONxU91+1Hrf27JDkx1UvXktyDioA2sYpAdCXCKYAStFJZE0rUIqqRt/5qmIKbTJiwmuvVInj6RJTwDyYtJeiEn4sFZa13pMHOVu93dUoGpcXtAhHygu5dTMICsgeYS4Aw6D3v+knmUppeEVWzhx0D/7+yAy8uMkro+m6zPw7i950N16VCu0RSmFPvjz/w6/8nRFN00yH+aWGc1AnnonaxaPow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXy8ox5LfHt1uiC0vqAPAoNcGahR2Lyw6PIIp80UN1c=;
 b=HGi4Qpz1XyxaK8tMI0rp6wm2oh2HefymCVCwc09R5t3yb6enRikE5PyGu0TpwCW1wPQDUTwWTcd4hT0N/l4b+4vpi1mnlrQuKMv9s7lC4s7+NJomGFiOc8xyLjtMwvxf2kKtMV5vc0GVbFkJEfZK0M9mXcQj7obshVDoR5sF03MAWuWk3RZMbRMfTfWdZ2Cx1VDID3pq3J19PTl+ViCpnNTkczc3YIoHBByfwLlwcXJzqc9SdZA5BwsUNZVZGUB75RqnLRs8Prp0xH1V5nwIK6k/GFJ1jOHh9xzcywx2bQTkd3hnylBJxugZCXpzwo1B//ScHoos70MOOlIIg1x7QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXy8ox5LfHt1uiC0vqAPAoNcGahR2Lyw6PIIp80UN1c=;
 b=JYCFo2tf7pcLjPjNfzaZFUUX/FGHrS7QrueZSTU2JF33j1lIiVOatj91wuaUv4iwiuXKDb/0ijMB0A9I/wi13a+wd0PxTu5B60nQYrI18UX98ErZ5BIbBRj3li3vcoGhf8833ffmGYKXjRIHWV6daheO9B9fbZiX4XCKVBA02e25YIPpqyfVmRzLUM2J4R/JYNW1MRAw2SAuelcAlwYwM3Gka6LnuFMp2jtB2l91B40E154SLG42RqKAeuKkACF/GX80ZN37K9sEVsY6rH2sJ2pYT0Kkv92AtkIS4QcYour3s2kx3PuKMgueOtompCc4fO8nZWSbZuLPVeRyzUJ/TQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0fe79723-d279-9744-b6c5-8c43e6bb29cd@suse.com>
Date: Thu, 10 Nov 2022 09:18:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [linux-5.4 test] 174684: regressions - FAIL
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <osstest-174684-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-174684-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8923:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2269f3-3f5c-40f4-11ef-08dac2f416f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w5+tKFXSNVtET/gyVF+9PUvcKZFWc4mXv17Qt/nWgrwojiHnbMSwnKE1P+TMVuXSs5ZY4CBTlZc1CTLo28O/GB55jhxw2do+kCKxElMDzCcuIgfOO9sYW5mixj861dYknTMvpiv72h5PnVmwmjJUMOCjBTFdcbPeLDOTjzB+06TdfuTbv5MzEIQXbdBA8X0VEB5HnJbtN2IYU5o//94TuklKDslk6Y14GwFkrMYrhxz/OLPbFsv8jVMsxt806Qa77p7+D7MY9aMd+4Yh5U/wLrXRnUjJGxFe/9xnnGJBQEQk6Tibo1AUNaiWti0PzuX573IKypy4J3O7w+e2hULFpk63fQmwJDVlaNLnBa/wzh/mNzDj2W/lLs+wNwJTfP6//RhiN1yr5gSE8Eh6QW1r9x1q+T6YszfxOVuZNC7bMY15oefM8WvnYzhgsbzFV9qTrnoEvz799W3US88lBLyT9Ay+nS1Wu6v0vgjR0nbPNF8fn24CT+LCL8HrQorKBM6hIM/CXi7GYjMkNFZ3J1waK49oWJ4iehw8ykcJ4Yj7QbWGicoKv9oQzOeaTVXefrgEuRSNzIyx20WpWWkANl7AhPPIYWahhm15EZri4NR/bxw5IceFLh/zMN8qMUNucUt36yowSD5DkZc7IZ8ZmzRocAw4XqF3W+0sJsBfjHxWFO4bO5X1A2N/vqH4W/9C8yJJteIoontG6BieHHNhBa3dih7BbxGCH8+Tq90HhK7y/14ZXnC1nwKSHP+QxzwS2+pxk47cDVUA+7hvHLPOR+oYjsSVAa2gg/sAf43s+U6UXX9xUxDyBTO7Cu5eYDhsI6oTzR6IgD5WydQDlMbtGSEq9w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(39860400002)(136003)(366004)(346002)(451199015)(86362001)(5660300002)(4326008)(83380400001)(186003)(38100700002)(316002)(66556008)(66946007)(110136005)(8676002)(66476007)(31696002)(8936002)(41300700001)(53546011)(26005)(6512007)(31686004)(6506007)(966005)(478600001)(36756003)(2906002)(6486002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NS9xMkp2NURyak5kUXJ2VWtidXcyRXY3U0Y0cFlNQWovZ2Rwc3k0T3YwV2ZD?=
 =?utf-8?B?YXVxemNVWGhyaVNsSjluNHRCY29QTkZIRXlteTFCM0FkNW1EN25CZUs1Q1Er?=
 =?utf-8?B?MGNCRFUyeld5cXNPQU5pZ0VyY3ZaeDUzMHBZdjR2ZTlGMi9oVUFiaGp6akRy?=
 =?utf-8?B?TjJjNVBtOVg0VmM2SE1Kb0N2SkRnWHRCN3grK1BEWjU4SUlVM1UxYkVucldG?=
 =?utf-8?B?VXRaVWdodksvU1NIZlNjQmdIWFdSd2pGVDYrSU45RDZSUXhCN2dyM0hmWnUx?=
 =?utf-8?B?Nm9SeUV1QVBNWTlOTHBMMzMybkRicWJIbTAycnF6ZEJZazEra1FvLzhSOG1Y?=
 =?utf-8?B?S1d3eVIvYmRMTzN1bFhRYTJWaFN3ZzB5TkU2d3BOUVYwTldEdTM3Um1hL3Bt?=
 =?utf-8?B?U2JRdnJDSUlJbkxOOE1pNmh0OWx0QzB0L0o4UmZiSFdQYkNFVXM0OFBDN0pJ?=
 =?utf-8?B?RU8yL05Sd3ZwTW9OVkE4Tm44WllhNVByc0c3Z1dFTDI2UGpKZGtYaXRaTjNv?=
 =?utf-8?B?c2czeWZDVEh5S3NDb1VVRlMxQXZhM2crbmM1My9KYmZQUkQ0WUpVV1c0QVg0?=
 =?utf-8?B?bTBJbUZNWG1qUFNqL1FaTHU4dFhEbXNqbnBQNEFjTnkwKzludjQ5SlhiN1V6?=
 =?utf-8?B?R1pRT1BOVncwOGdORlRhY2QrS3JQalFCZW1zZ2t2NTd4OCtJVGFzU3IwRzFz?=
 =?utf-8?B?Z0FVMVpkekhxcmxrT2VsVDNCdHhWWmZxcmFHdVFHUFJnVGNjNnJQOG9oT3RB?=
 =?utf-8?B?aThVZUljcDhtUkN3OUthcnVRV1d6bWkxNktpeU9qYWhtb1B1YXp3WFQ5cXdQ?=
 =?utf-8?B?Q3lHd2xNZWxZaTBYYUpOUkRlZVgvOUQ0cDBzL1ErWHZsam5mdTl2L05oUFEy?=
 =?utf-8?B?U3U2MnpLa2ZDZVVaSzRmTnZyaVdYV0NtSzlaWUtOclN6SXN3ZnorM3JvM0Fu?=
 =?utf-8?B?U2F0UFlWVGthbjYwYnFCK0RxdDhEcDh4S0xMZ0pMbE80Q1dtWVJFUktkVjUz?=
 =?utf-8?B?M1MwdUxpekRvNzRWK3ZENXNQcy9lbnpXZ2NLR0xCUG4reGFKei9yL3lGRnVx?=
 =?utf-8?B?TW9pSnU5M1pBcXBwMVlseVdXanZGSWxTekZ4V29qNUVmUVgxWUc0Q3owRVcx?=
 =?utf-8?B?Z1NsR3RBVzcwUTJaZUlsK2dKK1Z2YTJORWxLd1FHMFR6R2dkNDJ4Z1JKRU1i?=
 =?utf-8?B?M01JaE5KT0ZIV2JzRkFRK2JLOVBuekl0SlhwL21mK1crL2VLUmZLd0dBSGpy?=
 =?utf-8?B?RCt3SUYyb0tVYk5oYWcwNENneldTN3pzaGYybndwVGtVTGFNcGt1dDRma0l5?=
 =?utf-8?B?YWFDdzJWQ0cvV3dmWTdsZ1k0MWdrdVJ6ODlWeWFkeGJGV0t3QjYyM1VtT093?=
 =?utf-8?B?Q3o5TjJhaE9QRnFid1hPODZEcmMvZ0hIV1d4TUFmKzlsODBDd2tWZExMNm0v?=
 =?utf-8?B?TjdsYkhkZ1ZLb1c5NTNlT1pvS0tDb2hkOHV4ZVJya2JOQmdkVnAyL29Qb0M0?=
 =?utf-8?B?djYvTXRPQUk4eGlMVHU1Sk0zNFZsYzZ5cWw1VERRdTRSR0t5Um9ERlRBQi93?=
 =?utf-8?B?aHZnSnBxNlpQK0hsY1VEL0Y1VkQvdFdoOFVQaUNwQTJCc0lncEszbmsrK2RJ?=
 =?utf-8?B?RzR0WFRGRTg1MFFVMFJxckFETEFiTklaeE9XZnNzWEwrdHdBaFlqbEJNZW1n?=
 =?utf-8?B?TjkvRUZzWnA3a2RQQlJPVmhCZzVFVFlQbkQ2YkZpaEpqWUlRa1RDZ2ZoMmY5?=
 =?utf-8?B?U05OVE1jUkVCV3MyanZTOVJSZU5hc1hhUUovQ2tMT0VvVExQem9NNXprYUpr?=
 =?utf-8?B?S0VmZ3VYUDJGeHk0T0x6YzdvZ3hKRHJiZXhGd2VITUV1aHorcm10SGNWQmdp?=
 =?utf-8?B?TVVxTUE0ZzJsSnhaWUlnWUl5UnZMTmNmTHovb1ZlS1F4ZkJXMitJVXdVUkln?=
 =?utf-8?B?alpZTWRwL0RpZDZraDJmZDlBWGo2VnhXWDAyWEFIS3F1ZkhuZVNpcGM0VXdx?=
 =?utf-8?B?U3FhblFBWExrOXdhUEJCclo4elZCcFJKU0ZmZUNNTU0xa01YTk1MaHMvVlNx?=
 =?utf-8?B?cGlxSzZwSG43MFFTbHRzSkdtai9VaE1lT05TakN0ZVhTemZQbHNqODh3cUY4?=
 =?utf-8?Q?IEHNQVVHULJexn8WzUmOMLnPs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2269f3-3f5c-40f4-11ef-08dac2f416f0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 08:18:04.0705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jg3V+Pj3OKfosIJo5+zT1vyEqTAUxVu//nv8+D6tv5LhIeeQHfwMkGTInxZ1NIvBYVnN6vDHD9LEfhYqGZ1RPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8923

On 10.11.2022 03:48, osstest service owner wrote:
> flight 174684 linux-5.4 real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/174684/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-armhf-armhf-xl-credit2 18 guest-start/debian.repeat fail REGR. vs. 174540

This now looks to be failing relatively frequently (about every other flight),
and I'd rather suspect it to point at a hypervisor issue than a Linux one.
Looking at the log I found

(XEN) d5v0: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) arch/arm/traps.c:1985:d5v1 HSR=0x80000006 pc=00000000 gva=0 gpa=0000000000000000
(XEN) arch/arm/traps.c:1985:d5v1 HSR=0x80000006 pc=0x00000c gva=0xc gpa=0x0000000000000c
(XEN) arch/arm/traps.c:1985:d5v1 HSR=0x80000006 pc=0x00000c gva=0xc gpa=0x0000000000000c

with the last two messages then repeated over and over, many dozen times a
second. Which makes me wonder whether that verbosity alone is causing a
problem.

Jan

