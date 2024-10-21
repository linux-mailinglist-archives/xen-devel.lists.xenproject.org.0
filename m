Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 239659A65C6
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 13:03:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823338.1237315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2qBi-0007gw-DB; Mon, 21 Oct 2024 11:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823338.1237315; Mon, 21 Oct 2024 11:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2qBi-0007fS-9c; Mon, 21 Oct 2024 11:03:02 +0000
Received: by outflank-mailman (input) for mailman id 823338;
 Mon, 21 Oct 2024 11:03:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uLLp=RR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t2qBh-0007fM-2E
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 11:03:01 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20628.outbound.protection.outlook.com
 [2a01:111:f403:2416::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 083675f5-8f9c-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 13:03:00 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DS7PR12MB6120.namprd12.prod.outlook.com (2603:10b6:8:98::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.28; Mon, 21 Oct 2024 11:02:55 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 11:02:55 +0000
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
X-Inumbo-ID: 083675f5-8f9c-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rqK8g0xdPP/TW/uYysbCoqlJfWsAwbSIhaKIkW2OhSBQvocKNbzK95QllzRWdH8mS0vKJVJhCOyfi89HSr7qQl/DsSrdehZtZCELEiS9AIrFLmO1vNxRfeNMgKRJ7Lh0df547BLICDz0TV01POJPyfFnowlvi9JKb0FuzQiNMl6Rlg4ICtTNBKj86HTa0qkoutBOTMhf6PzxYIhhfBG7tANUpIFiNYLXwcNhFfrX0dWzOsFxxWpqeV0B4UOgSahbGrb6YwzVb+vB5k/LSpW/wUul/H70CfCzkd/Vx6ftocGGLcVJnB/CE4t7ZvCjlVqlNQlUmWiguD0CKiq0Q0hrVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gu3+tSqcU7KtepL///lS71wax8NI7Od2LlMsiW3swo=;
 b=Kg4YPmxLbumiZmqb8kNF7DdMa+uLfGdr7s3+1fC52rTLIDCfBwTDeBpKoPXydujplBqhCx3QJM7pz9LNwXm5EznES3oluiC5bxhcfh42nlbOlFonGAizWtIf8Ne+N2iHOXEdOXwXpGxE2tDUP7n65LK+dxjkeYTrkyNLnvt42rwQ5vULYNAdB7GNCusZLgT2qa3wSmHm450Q6/Z/YbrayNdWfrIDtXS/nh81RpM3RpiiafynKMwYjNMIJhevkOL9F7rS5wRSP8WQ8ILQnf/E/HGzXmjBck2/nlUGjpYoiKEU8vd3EW3l+DHtfzNfkm9R+Huq9GeiWfU0XeXu+9puPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gu3+tSqcU7KtepL///lS71wax8NI7Od2LlMsiW3swo=;
 b=Hj3qp7GN3o8iJ6rkhDEKuqdc6Wnl4jLtlamN1NWQa8qmfjhqVCYxSjSGHam+oilovTeYii1O5UBN6QhGWG33+WOP9XuS5Q3jI0hGLaouEwxUQQaAQhy/QhxvwtcwLaaNdkaRaLMMbum2OCG/lBS9zsJudeK+UWAQg681yzlAhCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <eeea2dd9-56de-4ec1-a1fe-c3480a5aa35e@amd.com>
Date: Mon, 21 Oct 2024 12:02:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Enable early bootup of AArch64 MPU systems
To: oleksii.kurochko@gmail.com, Ayan Kumar Halder
 <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <1915f5c78a9282d4b00c330c59749f22e6dd4ef8.camel@gmail.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <1915f5c78a9282d4b00c330c59749f22e6dd4ef8.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0034.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34b::15) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DS7PR12MB6120:EE_
X-MS-Office365-Filtering-Correlation-Id: fbaabbc7-662c-4929-18c0-08dcf1bfea6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmZ1UklxTUUzazhrQzlJVWFleW9uYVcvRWo2U0tPeEE4MnphelJwK3p1R0lP?=
 =?utf-8?B?YWxwMi82S3REaU1rOE9scEw0WkZVRnMxZzViRXhocnpRbGJEZUQ3S2RrbXMw?=
 =?utf-8?B?V0pNTGhWSFUwSm9UNDJhRUFJS1hpTHorTTFLaGkreUZtYTlaSXV4dlNlZWVy?=
 =?utf-8?B?T2c1NHdxNHlpc0NmYlpiZkRDRU9KV0hBTkJZZmo4aVcveWRhY3NXT0YyRkVs?=
 =?utf-8?B?LzBFTDdWQkd6aHNnK0lBT3BoaDN1bU04NXhUQ3VhUHZVaUhKWnlYZXpsMDRa?=
 =?utf-8?B?eFVZanh4dnFScnBnRlF1OWNhSTRvaENRYzBjWWxiRm45TElxbjVzWHJTV3g5?=
 =?utf-8?B?aDlmZzRKcFJxaWtDS1J2TkVVMVNkd2ZzS1FHYmhqVmVGZjVWTldaT1BmK3RV?=
 =?utf-8?B?aUFadXhYQnhpL3J0aUxiQncyRytmWTI4Mjc2Z3o2eDhwQ0xEMkx1aHhUdGox?=
 =?utf-8?B?ZVo2bVhrMFhHLy9CcWZRcVE0NXFIQlRzeFFmR2o5UzNEcC8zQktqN3cwdE1J?=
 =?utf-8?B?N09OVmFxVFl5b0UyVHI1eDF2MUVmTlRXTmhTMnFsRGJqNG5BQm95VXhhRUd5?=
 =?utf-8?B?aVBNUkZ3VllrN20yQmpwVjl4WndZNjRESnR6cEsyLzc3MnhzM3VuMEVBenJt?=
 =?utf-8?B?TVcyeDdBWm1XMWhYN21aV1NUZjNtNnVITU5rc0xjRllRbkQrVDdlazQyNHlr?=
 =?utf-8?B?VTJYbHlFZzNtUkhwcmhmNW8wYjkyYTlSbDZ2NVFjMm5PWWZ3WmNwaGIrbUpP?=
 =?utf-8?B?ZThOejMyNmhTKzJKS0J4S0QvM3ZjdEkvK0l5ZGNHVmlMbk0zdmVzQmVtVDdE?=
 =?utf-8?B?NHFiVHdsaFF3M0FNeWIrSktSVU5zTkJqU3hTQjVGM2ZiNUpVVVdZb3FieWJ4?=
 =?utf-8?B?VGwyd2IzNCt4R3FqenRyZTdCa2FUVzBlSHU0WlVtT0RJanJING1iTFY4aUtZ?=
 =?utf-8?B?K1I4QjFReVNiZHNlOUxGY09kNGQ2aURLRWVxK2NObXVmUXpocDNrcTdnZktM?=
 =?utf-8?B?eS94WkFUZUpKWEN1Uko3WHdJNVNLemVOUFVLY0g1c0xjVXJTUVo3REoveUdQ?=
 =?utf-8?B?aE0xN0RVdi8yMGFpd2V0dnVjSEJwcUZyNXY0MHRUcWRiWEZCaURUNHliWnl4?=
 =?utf-8?B?SzBqRTdvNytPdlpyZmhHMHc4MnRQN3E4SDlBRGxiNGIwN3l1R0hFQ2U2Rits?=
 =?utf-8?B?Q2thMGVyaFRicFNKMmh0TURadlVhMjBFYmJJT1ZFNVB4MDd2UEdKUVVaR1pR?=
 =?utf-8?B?QXNkK0g4TmxlS1FQRGNDSWs5UlozRHJnL0VhM3p2bktSV3F2MkpaeHh2Snpr?=
 =?utf-8?B?VW04UDdyYUQzaG5rdWpjUXU1NHA5SGNlTEpYOHNtbVFCM1JNMkhvU3BreGti?=
 =?utf-8?B?dWQ4NHAxMWNicUhwc2xrb0xOalM2aWxDWWRqUWY2RXh1ME5LNzdnVWVmSThk?=
 =?utf-8?B?SXFMRndzUktrUzBuREtDbkh3VTVaNUo2UkYxUndlYWZjMzJpQXRHdTRReEZ5?=
 =?utf-8?B?Z24xUWRoOG00cDU2bEp5SkR4V0pSWmgwVnZVVVBUWkwzbEMxMmVxekhzOGtl?=
 =?utf-8?B?bGF1OFpzRDI4Q0dWa1RQMEdoblRrbnRhZXc5Z1QzcGhqQjZVVVh2cWw0c0J0?=
 =?utf-8?B?anh3TzlzUCt2QWZ1ZnlsbUtFUHVXZE4zelQzMnovTG5kc1FBWGovZThGQUZO?=
 =?utf-8?B?SkZFVjQySmVITEJ0WnVMQythVFBJYlpQR1czVkUzV2lVYzF2bUQ2K3ZyTTJw?=
 =?utf-8?Q?+bFQwAtf9DbrqzjxhQcJolyhiAqun/SL/PPmUa1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFB3NEJwMlRXUnNIbW9zeWd6REIxTVNqd04vQ1NZc0t1NkJMYmdZZnFFbGZt?=
 =?utf-8?B?KzlQSnFNb3I3TGgralRHMENkMmJoWUJwNENFdVdBZHNPVkQ4SWw5d1VodHVQ?=
 =?utf-8?B?S3Z5ZzRCa1BZOGZoOG9GKzY3ZytQRWZ4Z21HWTdFYkNoMmZ0RHRkQkxsZVFV?=
 =?utf-8?B?NkdlQ2NQMytnYmtmYzAvZ2xXREpZREVvNHNIcXl1UjYrN1JsVDV6UXovcXY5?=
 =?utf-8?B?eStkZE16djJnVm9WcGhONlFHQ1ZzK0lrVHgzRHpQNlZNY21KQ3VCSU9SR2ti?=
 =?utf-8?B?TTZmV09NQTdmWFJLOEI2dlRKcU5IdlVDMWd2VnBMWS93dHRTczBFanhhZVBK?=
 =?utf-8?B?QTRHSXlOcTB2aVZ3YWJ3MzJUNXJVOU82ODkyK1BWajd0dFRYeS9teTFQN2Zr?=
 =?utf-8?B?aUJJbitYRUxYYzhPek4xTzZ6ak1FcUgvNXFBWFVybEVGZVQzWFNmbDllZG11?=
 =?utf-8?B?WnpET3JkNDZwb2NzL1ZWUmFCUHpMT2p5eTJHcTI0MUllQnJVSUJvMHp1b0t5?=
 =?utf-8?B?OXowWTcrSmxCTEVLYTAzRUJma0FyOHNGTEJSZUdTWVExMFJwL1k1cVA0Mlo4?=
 =?utf-8?B?VEVQTms1WEIreGwrNnU1THVORE9JVEtiZ0JDR1IwaDRyYTh0dXNQY0JweUlS?=
 =?utf-8?B?KzE4dzJCNVNIbWdBYzFSK3ViY3JBd0huRGFtZzhTRStkQy9uQTIvbDhoVmxz?=
 =?utf-8?B?UDJtSkVHRC9lUDFuZXpMN3lMaVhleUlvTXd3alBiclNXdnBEK216MHcrWXJ4?=
 =?utf-8?B?cG9WcjBMbVVtcWRDR29NOXM0L0x2cE9EZFk0WGRaM1V1V1lyQ0ZlRVlGWith?=
 =?utf-8?B?bjRYVFE0L1l2bkIrYUM0dHBkTTdBVGJ1U3pBcWFmNVJhNU9RZHNLSkpTNHls?=
 =?utf-8?B?ZHFkK3h4MFdObEdtb3YzbWJDSmFzeHJzUkFMZ25iSlk0aWxYRUM2aEVsTU50?=
 =?utf-8?B?blJIMUNhQ1krVG02dHlHTytKaHRhelVCK1lyZ1oyc05xVGpCV2h1dmdvdWpz?=
 =?utf-8?B?SlR1azlMRFNyUno1YVQxQ25VemRpN3JOd0FlZFZmanJZcGl2TmROSWRFU25I?=
 =?utf-8?B?TGFSMUxwYTJsdUs4VUJFdlNsaFh5VHF4UGJsSFR4ODE3MkRYY01WbGU3K09k?=
 =?utf-8?B?VDVwdkxib3ByUG9JZDZ5WFZmK3Zvc0hyWFV2bGI3bU5PQTFGdXlqajhzRVV1?=
 =?utf-8?B?bEhmM2ZldUJZU00zUjBhVHJUbU9kRnRzdnhGWlBDbFhaS2tnZVhRMERJZFVl?=
 =?utf-8?B?SldMQUx4VnZRTHZPWXYyQnR4bUl2NFBsK3Mrd1kyUnpPZkgyNUc4SzNhUkdk?=
 =?utf-8?B?TUVvTzlzZU9oL3B4TXcyREdSMzhKM2wrQmZ5UlhBT3JQWkJCRnpwb0xNaFVi?=
 =?utf-8?B?VWlTamxFV3c2NXdCVFVUdjMwZTFwVGo1YVhmRnhoSXpVK2NNM01JS1M3RG91?=
 =?utf-8?B?WUYxY3U4am5MVHR5UzFPUGRSSWkweittRExPeVpyTEl3TVNhemJFSUpNMDVO?=
 =?utf-8?B?RWZvRkJsaExRcHd5RzFkV0k5K2VmTmgrMHYrcWttcXZpbURvNXJzTmExbVlF?=
 =?utf-8?B?UTlGVS9VT0JvQjZDYlU2VVFoZnFkUE5yZzhKaUJpVUxwQS83WXAwQlppT0dX?=
 =?utf-8?B?QUIyVDF1Zm1RZ1ptUk5Oa2xzZG5WVklpVjJrNXNKUWF0OXJlZElDaFdJNFd6?=
 =?utf-8?B?dTN4NEZFTjB0Q1RDUnY3V29ucHJ0Q1FvWnM2RmVRZ1JPUEJqTTZmWllmbGIx?=
 =?utf-8?B?MFNveTZ2eU1yWTAvWEQrcllzZjhwMVZ1UW9SRTNVZlNYK09TaDRXcFQ2SDhT?=
 =?utf-8?B?em9wa3FsWjRVSGdPaXBEVTVpZjlhQ0xjRTFxbms1b2tFWjJ2R1Nxd2NJZjVF?=
 =?utf-8?B?Y1lnZjBjc01GSTRZU1VBWnArSzEwRCs2OERvQWNCcXhhajNCNU1XcHozK2gy?=
 =?utf-8?B?Vk1vVW5wNkJSS2pkMXBZZUxHRnJKZHh2WSthK0s0U2ZxRjIwNmpvYXRtamRR?=
 =?utf-8?B?ZURJU3JvT0FpU0p6c1I5cUUxcDBjdUdDdjhRU0NqbXR6eDdpODlVUVMvMW5I?=
 =?utf-8?B?ZzhTU0JtUG9UeERnRWR1djRFeW9ValZScEI0OHIyTnk0TTBIclZZUVlKSVFG?=
 =?utf-8?Q?UXPry2aaNtTP36oVuPbLU4whp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbaabbc7-662c-4929-18c0-08dcf1bfea6b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 11:02:55.6719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfnBSynLXM+X7SusbZIH+TPBe3oT28PapYMa5mGEwDDbaOA1OWgs02iq2EZI3Ge+xjS/OWGH2lyDvJzm2fxcFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6120


On 10/10/2024 16:40, oleksii.kurochko@gmail.com wrote:
> Hello Ayan,
Hi Oleksii,
>
> I think that we have to mention in CHANGELOG.md that experimental
> support of Xen with MPU for Arm is added. ( if I understand correctly
> what is this patch series about ).

Sure, I will add this. I will send this in v4.

- Ayan


