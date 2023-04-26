Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAB06EF4CC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 14:58:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526684.818557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prehm-0007k0-Lm; Wed, 26 Apr 2023 12:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526684.818557; Wed, 26 Apr 2023 12:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prehm-0007hJ-Hq; Wed, 26 Apr 2023 12:57:06 +0000
Received: by outflank-mailman (input) for mailman id 526684;
 Wed, 26 Apr 2023 12:57:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1prehk-0007hD-Ps
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 12:57:04 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2052.outbound.protection.outlook.com [40.107.13.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6b127c0-e431-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 14:57:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8439.eurprd04.prod.outlook.com (2603:10a6:20b:412::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 12:56:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 12:56:33 +0000
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
X-Inumbo-ID: d6b127c0-e431-11ed-b224-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQpS0dA80ffqmwvVTE9NVpcAumnTZqlq8XGGfrTXZdSe/GKApguxqLcB5ZguRS6hdzOlso144hti/B/bnMwh9f6ZjkHPutHbmlms18PPXHkU9zPnccU8zI5S83ZTc1eNVKgKCis126jYaI3jczJSJxbgeYtPEQK3A4JB1LvE+P/977Yc3HC7Fmo9qM53hIYBnj3i6/rHMKTdSM5yxJChTn3vQTh5FJ6ZaNSHgHlgkSZwb1GW7gIifOyhZwfzwaYku1ixB239fx2G0p0u6TF2ZQIS+zuTNkys8CqxyssUf4tHjD3Gk+2jP2NSjiPVKTYKerfxOubHXxLKTmreyK/sVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FopZvnEv9dxKP71KZ1LKD+oHMxhR06cTUI1wcO4NRyg=;
 b=maK0vOw9FhdrP4BaBew+SCscAuP1K6+DTeFx+Yvdm16mrrlqyb6ZD6alWqAYcCNHYXVy3HBDH0Chd1RR/d//GsBWEGVEDl+rPT1dWIXHCgYC1V9udTEngNAOAX9EqTIASKNyDMteQES2dtXxkNDNtavkmKxa39oVrSQc9CW8l8TPXYTMPdJ1CZZHZIomijMQHopv8QBzN5PJxwxI5bhYjR/r9QwGcPH20r9xBK8IzHKujiL2k7yiYmZODxjyN4fGhYQqtW40PUEEn8wZiDjplcbDx50jmNd/6pgjTrRUUPNywx9p0eL0qZEvWCYeg8ucsXirwmGIEOP8NBdqE4aieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FopZvnEv9dxKP71KZ1LKD+oHMxhR06cTUI1wcO4NRyg=;
 b=tGVfb3uV5JnSNnzVcQjsOv88YaYMn7Tk6+OTAuQSicZqaGE2IaXYttf9XKBCkWJCCa+hbgIN2HrA7sX2thlkvgW+pcLX0ykCuCOXS+9DZHozOFnEguSQz9dtTPkbpmMz7rMAHLwu9pxHLat1p28Udtc/0oPllroSpzqgavPD0LBWZEMj5xg0yMA1kxHWbmTxYB2J5aXPqLU1x7e4r9D54L+SrskSKxSdF74Th5uCE879Ml3umSTylVsU/otHSVz0i70cIbLlWFb+xPQApz88fmMi8y90gn7Z/f/D2M9UG+dzF0ayFQScTv1qf2p7o/eK0/roXcgN0y4ELVJC4lEgSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ea294e55-f543-640e-7b12-777941ac4500@suse.com>
Date: Wed, 26 Apr 2023 14:56:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] VMX/cpu-policy: RDTSCP and INVPCID handling
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8439:EE_
X-MS-Office365-Filtering-Correlation-Id: 893ff0e1-6633-4d85-6885-08db4655a999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gOeJ4ZFr6jsuIcCXPDvx3TqiAXN94+rdkR5fc+CC3lKKcN4Q9ARVNRVggjBBgfz5p+2s2lwxhoGuQ9eTuk6iMNM7JA9JZPs3+2WPgKkY6PZGCX1O2m9SxW51k0xGwi26vQ1x7Wk1aiqBXbrsI0JD7B0hFlaq/zf+bdVpT0uOlUBUwEY+XLzCkAE/CVBwfVGPuCqby94PT850BEsiAXAjqDWS85+bDY2wBi2MAEqhyirYNkIOf11DPmhhhxfYNgcDcb37oCN8fv7wfbD/2wqODnAkLDrY2SbWDX3j9yZvwmC06bkNLQnMxTFI0wAWbYSAlNgmhiEh5HudjdWAaZafCD1VVhSga+CTLoUwDe/UOCXRG49HWIU5fAArFb01v4ekDG+ofOmP47eqZRPFrolnWDA8oUPkGfi6BZk2JsdWwgF2InVVPJ9jYAKZ6/XulO7QP9awvCz5nW/3LNzoz9ABzzRwlvTcH4+nu2qmAYBuF4Yr/YkFHwC7yfVD9+oVWPhSaoSGhvnAKWWI0gyArkth5cMoy/9jbZeWmNBWma6jHfk91hcPOe/yqOYchOUpBwZoM4sY5YyjZVYl5VjF6BMxho1CS4L6WVEvQmriWJWub6h+pkueOF/rW3FUTGcke0zKAkMBsCay8C3hhNfJX2VIlA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(346002)(376002)(396003)(39860400002)(451199021)(66946007)(66556008)(66476007)(316002)(6916009)(4326008)(54906003)(5660300002)(41300700001)(8676002)(8936002)(2906002)(186003)(38100700002)(31696002)(6506007)(26005)(6512007)(83380400001)(558084003)(31686004)(36756003)(2616005)(86362001)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzlNYWJ5S3pwazh6VVMrZ0JNM2V2bWN2bUJhemZpYllLSE9ZWmhDZDZ0UHFt?=
 =?utf-8?B?QWJBd3hZbEpiVjV1UzNTSXZoUFQxTDlhMXJQUjczdG1MNGJVOEFrZG92cXhj?=
 =?utf-8?B?WDN3NDVwSThrdUdVYnF5KytsVXJxVHByRGM0ZkttNWlwUlhuekowYTB1SWtY?=
 =?utf-8?B?bllhTTcvc0EwRi9GbWNFaHllS1Y1OEIzZHNjUzd6bm9sYVoxMC94cytFb2JC?=
 =?utf-8?B?dGhDSno0YzhYWFIxWFJBSERJbmNPYjFKT0dQZTRoYktQeFVYS01tT1pWZGc2?=
 =?utf-8?B?Y2tJQ2NLU0hjSGRJRmN6OWtka1pEdVlyQlpURE5DNU0xU3Z5R3ByemEvYUdN?=
 =?utf-8?B?YUEvR1h1L3lOenRIdWN3bHZGYXFHRE1WMkN2dmJ6SzI2MTE2VFRMVGw1dVRQ?=
 =?utf-8?B?Umk3aFFVRmhVK1dabTQ5UW5UQVNaeW9qc3M1VUR5RmpMTThFVUtZN2FSUHpW?=
 =?utf-8?B?OFpjV3lkd1ZPaU1ZajAxTEhrMHFiLzk3SE9zV1MvM0hhRDllTVpVVDY2cUdx?=
 =?utf-8?B?MTNWNHRrTGVoM05qQzdzOUtnWXV5Vk8rMDk3QXdRUENwenRraFdMMXZxTXJ6?=
 =?utf-8?B?eWtQK0k2L29HYVZldG9uK0VOdVg2NE90bmY3OUcyZklIbHBzVDF4SlVsMlBr?=
 =?utf-8?B?ZEk2UE5rQlpQNVpQZEJ6Ym45UXlQSnlERUxSeUNMVFBQYmJ6QWQ5TFBLYldR?=
 =?utf-8?B?UGx2NHZOSXVhOUthb0V0Q2Z4WXBIYnlaWmFBUWg5SmQwT2RqZ1pqMEwvbGx0?=
 =?utf-8?B?VEZjTnF4aE9jZkxvRVhVNWc1b3dTczQ0VjhrR2owaDBPQllpZlR1Y0thNG1J?=
 =?utf-8?B?N0UvQlFVY0hwVlBHUSszNURYVS9YOGVPN09wUFpYMUI5d0JVenZKMVFNZlRJ?=
 =?utf-8?B?T3R0Y2lxTGhMb0hTWjNOSklUeUtsZzhiZ283ZTRNVHhiY0N3UXdVOGNmRnU2?=
 =?utf-8?B?a1RPczE5enZyOTN6ZkhVYXNiM1BMZndqc1ljajk3ZExQNnlCWkF5dGJRaUxC?=
 =?utf-8?B?SzJXSVJ6dVdJQ2owMThZdzg1VlZMQ3ppdU1rbE1sVjRoanVkMXhMNzBMZXpZ?=
 =?utf-8?B?bVl2dTNKbDU3Y1l1Vll4OTVjdlUzaEVvM0xyZFZjciswcE1QcHhFNE5EaVpQ?=
 =?utf-8?B?bGNWRE81eUViYlF2bTlqZ3U0ZmpFS2ZuYUFPQTNpQUhqV0ZNUWZrMmNuNlZn?=
 =?utf-8?B?bnRJRWIra3ZqL3N6OExXQmNWSFUwbzE2V2xqamt0OFJtV0VYVVp6THE5bHla?=
 =?utf-8?B?K1VRQXB4STdkc21FL1dYbTlEUE9TdmZzd1JpWFNYU0JSSjdrcGUzRU00VElM?=
 =?utf-8?B?MzM1UTlJWkUzY2Y5cXZzMDdZeWVIZVEvQzBHVUc1RXlVU0lrVzcwZHpWQUQ0?=
 =?utf-8?B?d0YwQW5mWFd1WStRMVdvQVBzZ0wvNnM2T1pYd0hBTGwvK2Y2Z0JoZW1rbjR1?=
 =?utf-8?B?K2Q4M29GbmtrdGd2a3lqSjcwZjNINGg2c0VQb01ETHYwTEF5aTdsMk5ob21x?=
 =?utf-8?B?SkdkZVhhWndNRk9PcU9GTk5ycWxqdG04WkZTNnhQWUZnU1hhbFpFSDU0Q1Za?=
 =?utf-8?B?bm1CYWI2ajNMdFlnRTh5R2oydWN5UkszWGZ1OGV1UzRxYVZjV2Jld1dTV0g3?=
 =?utf-8?B?dEJBRzh3VlV3ZFZjVms0RHN4VTdJemNySXM0OTQwdE1tQitrR3RUaURoa1FT?=
 =?utf-8?B?MTR3MTFvMUJML0ZVYmtaTExGdktBOXl4c3IxcFFoVmRFMzFwanpJT0xlRzg2?=
 =?utf-8?B?MUtONUVpcGs1NVcwRUpscitMVDE2RFo2aTE1ZG9LUjAyM253cE9RMzRQMVM1?=
 =?utf-8?B?aTdMOEw3Ulkwb3pESVdiYTBJcTBwSlVJOUlpUnk1MXFpL1ZaZFd1amRTQWh1?=
 =?utf-8?B?a0RhRlZ4UUJhQ0txc2cvbllMSzNTL2h6KzZCVUhWWWtpVFlDaExsL3hMMHhT?=
 =?utf-8?B?SmQvaVVHdFpVY0hSNEd0a2NPMnJWMXp2N1prL2lnL0F2NDVyR1RmSmNTMXJK?=
 =?utf-8?B?bGdwWm51TDYyTHpldFdKb3R2c2JDMnhPS1pIKzNHT1krYm5zQXpMMWl3UWxN?=
 =?utf-8?B?alRsbGRDN1dTZ08xZUNmQnFPOEpzci9TQUZJZ1hUSmhZWmJITzJGTEVGY0VH?=
 =?utf-8?Q?1C/sStsn37TuPjCRMyJhF6oEw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 893ff0e1-6633-4d85-6885-08db4655a999
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 12:56:33.7053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ANQ7D0JjUlMO5VzFxfjvXitdi7DLRKlhLfBu7vPhY23WpZfFumb6gMZAK+8w5IuCwMjS5KWA/N6M9JUNKneow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8439

While putting in place more of the still missing MSRLIST code, I've
noticed two anomalies here.

1: check availability of RDTSCP and INVPCID
2: disable RDTSCP and INVPCID insns as needed

Jan

