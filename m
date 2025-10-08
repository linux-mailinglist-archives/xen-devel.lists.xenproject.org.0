Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFA0BC56F7
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 16:31:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139818.1475043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6VCB-0005Kd-Fu; Wed, 08 Oct 2025 14:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139818.1475043; Wed, 08 Oct 2025 14:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6VCB-0005Hz-CU; Wed, 08 Oct 2025 14:31:11 +0000
Received: by outflank-mailman (input) for mailman id 1139818;
 Wed, 08 Oct 2025 14:31:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tb2B=4R=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v6VC9-0005Ht-Cl
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 14:31:09 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a68d49d-a453-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 16:31:04 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by PH0PR03MB5847.namprd03.prod.outlook.com (2603:10b6:510:35::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 14:30:59 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 14:30:58 +0000
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
X-Inumbo-ID: 6a68d49d-a453-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tO1906pJCLJCHlwjXwGpVSayICCX4rtYqmbNIBaBMincS3poOf8XoTqrjFtGfKNOXGQf54qtaTRT+j4xwNfZ3gfRvYZPwJFLpQvIdlih6Zp91eaXWsyK+DFGDgmCZ3zNPsGjrhznyBjMDs2UIS7FT+OxK1LLwxFyd4Cv7HQXmq8iMkNzO1G3Fd2TOg9yIeguHOJq2VOXZX6bsZi02+Q/3A1MVPW9r5H8JG2zD9h9E5Wal5ahSebVVHb1EQqghmgXkHrk211aDkA+mcXuuDRr5kLbsv66YEPguABRAU4kEKcHQDYQ23RCVDDW/Q+Y5/0FoqcWxpKA39mTyU9fG0LQ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0T/49iL4XtKUCsUuioCjoDjicGoXpBpKyIYChh0SVs=;
 b=heUSgDrYMDuRgV+7l7GtNaOMSXYYZCkwN6T683S3Cm3sWdTDA8Kr+IIk8/ZuoJQ73qdOb3L3/vUIbUs17BsIpl17LdvL3qnokoz+fdFJZd4dfflhykWdOrO2mme5UKo9PKK00HrbyMGlswTuqESY2sEOHJBBA2qN3sBUwqbflVT9/jpe8X1ySKleXu8VUlkanGfRb50gCG2mEoSYS758+qZgUFu5J/Q157+Jtbdc0nAG/5alSgnGZ+XLi9cvaKcpxYH0oE00Pc5C7Hb+VhY6sE0EpqzbupY3V8awT5wbw6R6cEn3DLXHL5DryFG9+7sllccDp/hN4CxYXON9SAMkHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0T/49iL4XtKUCsUuioCjoDjicGoXpBpKyIYChh0SVs=;
 b=qAGL4iEtGS9U6DyX6if9dl2zb8LH6ouy5hX7rAc1ihhh3WXcHS1KmQrgqhMuxkuHdVjFQ/GeBb+E/FbNew6AwqFON3ttaziykWcQrEo27NIC0Kwyf0RolLVVnCFhtNjMLk8fE2fER1xKQ0a7C9lBgaF/5D+IlSlbJwNSe8F7mVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 8 Oct 2025 16:30:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21] tools/tests: don't pass -E to sed
Message-ID: <aOZ1nneO_4-KvvVK@Mac.lan>
References: <4d985a6f-59e2-45ea-bc3d-ecd2da032a17@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d985a6f-59e2-45ea-bc3d-ecd2da032a17@suse.com>
X-ClientProxiedBy: BN9PR03CA0886.namprd03.prod.outlook.com
 (2603:10b6:408:13c::21) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|PH0PR03MB5847:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a1f978b-e9ed-40eb-d890-08de06774be8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUtjUmZ3U2piNjl5eUVjYlZ3aXQvcnRsY0RTVGwwS2t0dlhXRkUwdFl4dnA0?=
 =?utf-8?B?cHpIdzFRRVpVU01xRFBaVm56cmRnVEswdTdHOGlJTlROdW9HY0Y2S1FxV0NI?=
 =?utf-8?B?NlZRZ1prVDQ5eEFvQVNmQXBtNTR3WmorSzg3T1QxbEw4OE80bGZJZXB4ZG1Y?=
 =?utf-8?B?RUdhMytseXZoRm5qaXBnYWFSYzdKd2pnMlZmeFdjTitGbWVwQlRoUkl4UXl2?=
 =?utf-8?B?MmFsZFhKeVp6bzBNc29jSFNVWlBVd00ra3lXbWdyWUNVQnJvS3BtbkEzOHFL?=
 =?utf-8?B?c1NnY0RmT2JRMWJsWUwzOW5ydmNkZTVTS1hHejQ2ekZsNENxZ0ZYUytlY2Qz?=
 =?utf-8?B?dUgxbVRUQUUvZ1Z5N2pHb0crMWhJb0k5T0hqUTB6bWxRYmxYUEUyNmJrVFhz?=
 =?utf-8?B?VkZRYW8xQ1NiK1FQWlF3MVdHQ1Q5UkY0dCtIUzZ2R0xpVmdHNXlsQmVzWWtT?=
 =?utf-8?B?K3hWTGcvMG5mUFdiT1FXVkk3MHFhZUtLUjhLeEx4WFlYMnM5VVNjMVJxUm9K?=
 =?utf-8?B?Mm5LZzdRMWt4ZUNVcUhid1JUaHNEQkhIajZONnozRWRFd1FJSEVCbVNRSVpj?=
 =?utf-8?B?bEJPRUpmaURraXlVT0NJZHk3QldUMEVLVC9wKzVTOFR0TnhOUHkzQTBrT1dT?=
 =?utf-8?B?dFhtOWd0NjFYMGdpeE81RElLdld2SkQycTl2NisrWXJqZTJFTXhqOTkwbFRJ?=
 =?utf-8?B?RWxWS01Sc01EdU41QjBwcjZkN1g3SFdRcTdFNU9IckxZUTRVR1lod2JOQ2l3?=
 =?utf-8?B?L0N5VGRpVzgxMGE0VnRBeWJ6bmphR0ZFai8yYXEzcGU2WndrVmVNOUFLdHY1?=
 =?utf-8?B?ajk0b2JndjE1RFVCc3pVUEorTTR5Z2lHU09pZ1hXV0ZQYVowS2lTNXFHUUUy?=
 =?utf-8?B?c3FreUVYZExmdGllQjlPem5HRGtURE1SUWVlT2NHZzZwY1FUaWhpZDc2eUE4?=
 =?utf-8?B?My8xQkloRmJlTW9HZzdNVTZwUHBqaWMrVWUwSU1QcUgvTFhhNXFncThkendv?=
 =?utf-8?B?ODhjRWl6anRSdnFlMEVhNWJPOWdvWUdtUk1qUnF5OXJTUmcwcUpmdUY0UjF6?=
 =?utf-8?B?UnBNaVBZZ28zbm95RFBpRXhCczhCdE10N2N5SlE3V0tMYkpHSnlCS3ZRaEJ2?=
 =?utf-8?B?dENxOUl6NnJUL2xxaTF0NlBTYjY0aHpjVUEzd3BMVGtQQ0hmekdhSkcxOFBF?=
 =?utf-8?B?amJSdzA4RGNxL253eUQ1U0hBQkFGMG9oRXFqK0QvaHRKT0puTWl4azZoaEd5?=
 =?utf-8?B?Q1J0WDJiRWY2SnhSSGp3YjRoS3pPMCtwU0RuM2ZDU2JFekY0ZlMwaVFpOE5E?=
 =?utf-8?B?T3U3VW5Wais1SFg4UHNLRTR0R1BkWE1GaWZLb21PRWIvbmppZU5id0JCVmJV?=
 =?utf-8?B?WFBmR2NOanlzSTVhOGRTMlMrdjVSdk5CeTlCbWhRd2huRXY1SWVVMG9kNjVt?=
 =?utf-8?B?ckh5a3BFeGxsazIzaWplTXhWZzBjSzRNUk43ZmZuenVEeUtoQjlxbmlrR3Qv?=
 =?utf-8?B?S0dITEZ6Qm1LZnVuL29rQ3FYMGFzaU1qTXB1T3FlMnllRU8vcllnbHJaalBK?=
 =?utf-8?B?VDdMdk9iWnJGY0FRTjFZNExYdytPL2lvb2pWMEtyZyt3WGZ3YUJzVUVoQjdP?=
 =?utf-8?B?cWppUFozM3BtNmlIRmtQc21iWmEwNEhGOU45R2xaZFR5QUdXUm5MM2hZOUhF?=
 =?utf-8?B?dmh0VUJGcGNUSVU1U0RVZW55SW14MERPRVhBVVBlTUtwVzlkdXg4TjVsSTFT?=
 =?utf-8?B?OGYxWkxUZ053U2FvT1FMWmRuTGE5UVdkWXY0eDREcDdOMVVvUzVzQ0xMcGF4?=
 =?utf-8?B?NmFYQXArbUZ0dERvWk5WN0NxUWNmcHEvaGxjK1pxUERzQnNXZWtTSVRrbDRV?=
 =?utf-8?B?ZHgvUzh3dEphNlBLdklML3F6WkhlaEg1eDMyVUQwTTJCWnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEdiQnFKT3pKWnBvOXhZd1ZOSnFjMWkvK0lsUStDd3h4b2FFNVp4VHZTQm8r?=
 =?utf-8?B?N3VlRVRrcWNIRTRwM3E0WGRkNDU1Q2FuYUhGZTNjZzRNWHBWU0FQVmxwNHFi?=
 =?utf-8?B?MWlnYkJEOFVsUGJ4VDhudTY4bDAyL1lPMUVTWFlrdVNNd3dRV1kzaUxPblAy?=
 =?utf-8?B?NlRuZ0hCbDZrT3NjREdtVEZEaGkrYUhTQkduVU9PNVR3TDl6VlRtdFp4TXBL?=
 =?utf-8?B?L25SdllxaldXc0IydnBtOG1vU08xK3RPdy9UYW01Y2F4WjMxRXNnNmVqcG5i?=
 =?utf-8?B?MzRUT2ZvSDBnMWwyZGZRWGY2RjNKc3JhbHloY0tHTjNpMjVIbndYVTlrbDhu?=
 =?utf-8?B?K2hrR0VxSXV4MXNCMDA4dDdqbHNpVjRtL2RuQ0hBVHVXVzJ4MkU0QUlPM0xZ?=
 =?utf-8?B?TXZsVzF0bm92VHFoVWh2dXh4MVVGZnJXUTRHMGppTCthUEY4WXYxTkxERUQ3?=
 =?utf-8?B?cFVvYnA4MloveS9rSWpGVE5nSnRQVUdwK0VVMFRzbk1KblI3Z1FqaE9DaWRk?=
 =?utf-8?B?ajRCVE5VK1luV2IyVFhBaXlHUCtXNUJneFhlbnl5SUdpcWNQclF5NG9nZXhN?=
 =?utf-8?B?R01Xb3RyOXpWMVlSU2tJS0pUM3Mwc3IwQS9sSlo1U3RkSTFrMVFKUURhNjRJ?=
 =?utf-8?B?SjdkVGJQZU1lbG5XcEJhQnVJRHZLbHVTZG5Yek1pM2hrT2FmZHFzQ0VpNjVi?=
 =?utf-8?B?RFZiS2lRQ2poakcraGtxanNJSGIyb2pDNVNmODdsOHliNnBnNTh4RVBzRWRZ?=
 =?utf-8?B?dEhyeDlaZGJ2Tlkzc0FXeHEzUTRPQTRCa29pVDdyNmIrQlErREZjRWIrK2s5?=
 =?utf-8?B?bDF5NjhISm0zQ0xXYmtTZXNGbDlBS1RqQ2JHOVU0Z2wvS0lrN3laVThtRXJF?=
 =?utf-8?B?Sk4wT0YzbUFpSXZiRllDY0lLM3E0QitXeXZ0SG1WWkdzNWR2d2dwRGUwaXFj?=
 =?utf-8?B?U09nMnh4UkU0WVl5azN6Rlk1VlBmNWJ1MEx3TnZYdm4vZW5lS2svc3BGcWFq?=
 =?utf-8?B?UlY1VzV5Y25rNnYrMVBLSmdVN2txMkI0MExFb05QMllFV2E2WEMydE8xY0RV?=
 =?utf-8?B?OUJXWVQ1SlVUaEhGZ3NSL29haXBCQkttVmVvMnpzTWVqQ2Vhc3ovL1dwbUpn?=
 =?utf-8?B?Vk95Ym9WK3ZjN0h6eXZUQlVhbDhPQ2ZJZ2JqOHBTR3dmZmtGN0VmSzFBb3NS?=
 =?utf-8?B?YVYzQmNBcnZMUXVJelhGMVpxbm1NV1VIUzZzKzdFWHY3aERSaG1Bc1JnbmpF?=
 =?utf-8?B?enhWK3A5S3JOTVl3L1diZ3RsRm5oT2FFMzV5bENHZGRGKzh2ODdadnF1L3ZT?=
 =?utf-8?B?ZHd5cnp0MnFYY1ZqVVB6K3hxNkErcUxVa01rN2lRUWwvMGp1MXd4a0NpblJ4?=
 =?utf-8?B?N0k5M0xQZklRR1BVNnpWM2hoM2dvYWx6WWY2WmppMEZxcVFwbkVyclZ4MEw5?=
 =?utf-8?B?bG5SY2JCMGZkWDB6MVhFbzF0THR5cnFYZUg0U3A3bnFOVm15VjhVQjVZem5L?=
 =?utf-8?B?S3lHcnE3VHFOZnlZb0ZMRGxJV2RhVFN4VTY5ZE1GQUVsTEZBd2thZ0EyR3Z1?=
 =?utf-8?B?cU96d2R5L0g2ZzgvOUxPSm9WTjdwaDdkcVNaKzBCMllldzQyRm1Ba1Via040?=
 =?utf-8?B?Q3VwdWRBY3VVUkZRZlFJbi9Yb0lhNDJENDQxcXY4QzVOeXZWYlR6VU1SeHBM?=
 =?utf-8?B?OTRTcmxQT0JxK2NLdHpoNkFjSkw0b291d0VhUWVlS2UwWkQ1THEvSldQUFVH?=
 =?utf-8?B?MjNnQldycFNHOW9WSFRCdkhKcDFCcUJtdkUrZ1pKWHRGSzg3ODN3cHBuZjVv?=
 =?utf-8?B?TWlIektyMlNHU2tCZ3RMZlhubWlpbG1QZUErbXU1RHJuOXkxd2ltRjRZUkRE?=
 =?utf-8?B?L1U1b0l3M2U1NTRXME5uK3ZWOVB1Ym96M05POXp3d25oWmM1cVhackpBVXRU?=
 =?utf-8?B?cjRiL3NidG1IbGpYUzdISTA5R1hzMVJyOHNscEUxZk1xTVlUUUNDaFZUelRX?=
 =?utf-8?B?bXNKZGgzK2xzSHV6bHhlVjhlaHlUNmZiS2hkSENqbDU4S0U5bVNqV2toWW9G?=
 =?utf-8?B?NG94N1BQczJmNWxOcGE4ZDFzM25HeUorNktZbXpid1JhOUJDRUNsS0s1MUVS?=
 =?utf-8?Q?gtof34+oPe7Q8rKiaYphqCyL3?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1f978b-e9ed-40eb-d890-08de06774be8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 14:30:58.0058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2U2vPKjvdu+2gvU9ZbBYqV8Smtn85oMnueK/IYOr8i+Dk8I/TR05szErf/X4FO/CROqgMCeIRIzJbumTXKKRfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5847

On Wed, Oct 08, 2025 at 11:47:05AM +0200, Jan Beulich wrote:
> Even the 2018 edition of The Open Group Base Specifications Issue 7 [1]
> doesn't name -E as a standard option; only Issue 8 [2] does. As there's
> nothing "extended" about the expression used, simply drop the -E.
> 
> [1] https://pubs.opengroup.org/onlinepubs/9699919799/
> [2] https://pubs.opengroup.org/onlinepubs/9799919799/
> 
> Fixes: cb50e4033717 ("test/pdx: add PDX compression unit tests")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I think the -E was carried over from a previous expression, that was
indeed extended.

> ---
> In principle the -e could be dropped too, for being redundant.
> 
> Hitting the problem with an older sed pointed out another problem here as
> well: The failed invocation left a 0-byte pdx.h, which upon re-invocation
> of make was (obviously) deemed up-to-date, thus causing the build to fail
> again (until the bad file was actually removed).

Hm, we could do something like:

sed -e '/^#[[:space:]]*include/d' <$< >$@ || $(RM) $@

Thanks, Roger.

