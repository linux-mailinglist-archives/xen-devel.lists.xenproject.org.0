Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7C7A99776
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 20:07:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965113.1355751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7eUj-0004xQ-AF; Wed, 23 Apr 2025 18:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965113.1355751; Wed, 23 Apr 2025 18:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7eUj-0004vv-7R; Wed, 23 Apr 2025 18:06:49 +0000
Received: by outflank-mailman (input) for mailman id 965113;
 Wed, 23 Apr 2025 18:06:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V8j8=XJ=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1u7eUi-0004vp-7g
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 18:06:48 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2417::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7a7bebb-206d-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 20:06:46 +0200 (CEST)
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com (2603:10b6:a03:539::18)
 by DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 18:06:43 +0000
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a]) by SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a%4]) with mapi id 15.20.8655.031; Wed, 23 Apr 2025
 18:06:42 +0000
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
X-Inumbo-ID: b7a7bebb-206d-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNSlVED9QV/Rp6sUX/8LijlRaVsyF83F5av8Xj9rq7dn5S1OPhLa8xToN6YAgmYykN4UiULbLKsa0W+YYVZmPq2T8CiGze5KAzsuLOxagu9zvHTNnO5Kj4j/gSBMa4x15EhS0oLsNOxk48G7iN9GNkIWY2hOvijd0NB5XSpFykuvGj6weKYUCcDjZOfT5QYfga9neLNAOQMSTAE+F00pbOksTjKLVX0oAPeASZBvv9TQmIAh9IB58r41NjQOOZIfHHjIFfl5ZB7Z2JU4L5mkDtVB6jwROVg2ohJuxQSVxBkqWkII19UFePNvU434eHIxq/TdYyLseFouOivmlIa1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqa79jWDei+TUXbfbLVhNP53IHh/2vbDRB+8d+FW/VQ=;
 b=E5OGJk9Jpxw73vyjwA5kKW85RXDyI7Pm9kdhe6MGLop+5r3TVwHZCu5zWMsH/oTXw350AMbiE1xF4IFVN4d2kQfQzs0MG7CJOdpa2OYF5vAUH5MVwUf1wZ1s+BkjL+tv16AvosN0B9fMQyihAzYx05E/CmhK0Egz6h5W+/ya/fpbcKUmrcKIurmE85nNNuNaNIA8ZlJQfShtY0ezUZbBqbViCY+q5/ZCbp0pBri6dHR9zkjXoc+Ht4uJnxVlkCa/z8+rLWAqKmKSc1IIfiNqBt/dojLVLUaeKhf5m9QflsQwKzz06/gW0bWB7TmLpXBeFA6b6lr/00iB45qkS0WciQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqa79jWDei+TUXbfbLVhNP53IHh/2vbDRB+8d+FW/VQ=;
 b=kPGbxV/nL1AFw5zKY1Vf4c+ya096kdfwEwA3B9dy4IJciH0ySz2ilG9TM14UZ6+L8zkVg0WHlWOYspI7MvmF3XO7EYgn5g5+8Y/oxTdWl4hZ0YbY/+OADx9SLDtIsrE4s87eJaPPtvtn3Rz0CxmfPN5Ydy/52mzt5HRIPYU3Eok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <58f11241-7b9b-4082-b121-4dbe6a085ef0@amd.com>
Date: Wed, 23 Apr 2025 11:06:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misra: add deviation of Rule 10.1 for unary minus
To: xen-devel@lists.xenproject.org
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
 <7c7b7a09e9d5ac1cc6f93fecacd8065fb6f25324.1745427770.git.victorm.lira@amd.com>
Content-Language: en-US
From: "Lira, Victor M" <VictorM.Lira@amd.com>
In-Reply-To: <7c7b7a09e9d5ac1cc6f93fecacd8065fb6f25324.1745427770.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::35) To SJ2PR12MB8876.namprd12.prod.outlook.com
 (2603:10b6:a03:539::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8876:EE_|DS0PR12MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: dd75e22d-2cf9-4a37-fec6-08dd82919a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2NHWG5vVUI1RnJGWHFvZFZZdkdvZXVBQ0l5Y0VsWlZ3bE9KWUd2NjRjcWlC?=
 =?utf-8?B?cFM5czFWNy9TcUwyY0xqK2daS2RJeDVDUFhqZUQ2d0x1ZzAvVVhGQ0RHUURy?=
 =?utf-8?B?S0FvcGk2RlhSWDZCU3FFcjh0SlFKeWZKa1B2T2JtMXk5M0h0SmxGdUdnQ3JN?=
 =?utf-8?B?RHpzakRtMExjb3pBTk5lNlQzaEdEblhlellxMzVIdm1HRE90T1pFQXNrUFNO?=
 =?utf-8?B?ZlhsbVBaVmltbW5RVjRlR3JoeGZqeHBOOFpZaEN0c1hlVFRBS0hmMldBanB6?=
 =?utf-8?B?SkJuUTNKOWh2aDBOWlQrRGxzMEl2LzlzQmtQZTNLTVRWa2ZlMkVBTEJaZVg2?=
 =?utf-8?B?amkvSUh5OGpGSUZRYkMzMFdZRkJzS1o2N2U5cWMxUmFoKzZ1WFVIN3pzL1RS?=
 =?utf-8?B?eXp3VzRJbnAyd00vVjB1Z3RQRDBIZkF4eGhsMVZxUjVyQ1NLTSt4Y2Q4cHRF?=
 =?utf-8?B?L1g4UkpoaExES0l5T1lrczlqUlhPV1ljVHUyYkpHdTVRbjAwUTBqQllGaFZo?=
 =?utf-8?B?K1pvcmtnbVowRGVibnl4WjFES05DbzkyUEtuNUN6M1ZlcUtMVS9WOGFEc0I4?=
 =?utf-8?B?dDZ1QzlwMVZRaURXQ3o0Y2pSc0ZIQ1FSSHZ4V2xPNERhekgrNXIzM2g3WWxa?=
 =?utf-8?B?TldLelNIeWg4UDFCRmR2b1Z2TG9nT284bkcxcDVWWWdjblRNenMvYURkQk5a?=
 =?utf-8?B?dkY4NGRCNUVsdlhrWHZpSGRLUXhYVVQ5dFBVYUU2MitZT3U0SnNNSHBHWjVr?=
 =?utf-8?B?dityVVpBTmYzUkJGcEhYanhVMENrV05OcitRR09wQ3FxTEkwckN5NEJVbnJJ?=
 =?utf-8?B?Wi8ya1JUUWc3L0NNT2Jrd0xwRXI3NHFjRmxyY3NUR2Y1dE9uT2tML2UwZTly?=
 =?utf-8?B?TzdNMnJ1VHBKSnVvSU5KOXpNQUFqeXZzU2VKN2drcUQ2aDUwREdIamcyWXMv?=
 =?utf-8?B?YWpKam1TWmppSW1mTWpVbVFLeDhsSFJLb0hrK1UyWU5CaXBBUk9mWmFSQ284?=
 =?utf-8?B?cW8xdzlOajJqblBCWUFJUmxrNlcxK3YvVkNrYkZMOVhBTi9pYVBBQXBsY0Zx?=
 =?utf-8?B?cy9jak5iZnd1OFhBZHVqcHJWblhaZVMwU3pTUkpVR1dETUxjTFd1U044eFVS?=
 =?utf-8?B?MEVleVgyYmtxemFjam43aGkzc096UjFjT3Vqb0Rza3VIZENQU04zT1RLdkRU?=
 =?utf-8?B?QUNZYW82TEtYSWFlU05PT01nZU52UjVramRqQWRxVVNQclYvcEhoMllNV25S?=
 =?utf-8?B?QWNBRzFSbkVaa0QxZnRNTWZYb1pHMEJFb0pvR0N6ZFh1bnFad0lsRi9tSjBO?=
 =?utf-8?B?VGNIZzVSMWkvaEhuK1d1bXhrbjUzNktidCtuNUwva0JVYk05c0Uzb3hwcjkx?=
 =?utf-8?B?R3VCWnZQTDl3bkQxU2Q4WUFlcjZHNXorOU9tSWN2aWE2QUszWEovZmFQSytF?=
 =?utf-8?B?UCtCV3lGU0M4eDRFMHBYcWluaGYxVTVTTldrdWtkZklsV0NtUmJyNThQTFpT?=
 =?utf-8?B?OEJJT0E2K2wxV3hteGhudUZJM3pNWnZaOXZ5M1JyM1RBVk42QTZBTzRDWE5n?=
 =?utf-8?B?NXBJZ0J6aWdLT21hZUc5bm5FZU0vL2VSM3EzdzBTSzZGRld4dmtiZ1lXbXho?=
 =?utf-8?B?RlJSOVNTK3pyd2hkYkc5QnBLYnVPZDlMRTlTbEc2N2ZqRjNlbFhjRFhZM0JT?=
 =?utf-8?B?bGRwVjljcmkxcmVLS1JzMk1iQzVCVWxaVlhFUWpOellMbkhkaE9IejV1R01t?=
 =?utf-8?B?SWxMNkRZZ2JzOTd1NVpXcGlaQjBLd3l2RWZ1ZU1JVkVFN05CMCs3d0xleGlu?=
 =?utf-8?B?Y1pNVkQ4VEQweW92ZUk2YlhjRThzSzZFQ0xhVHVDc29UUUFYcE1MQ3gzMG9R?=
 =?utf-8?B?NkRtb0NMaFJ1djhycndGZndQMGRXcGV1Y3owQUtMb1ZSTTBlSm03LzduUjJ2?=
 =?utf-8?Q?s3VCkFLFtKs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8876.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmZnS1JYUVNIMEplOFFQMjc0R0owTERsZnFuNHZ0WVRsVHQva1Y0RmdqMmxw?=
 =?utf-8?B?ZFducFhQWW11U0w0b3YrSlZ3eVVyWjFFR1dNRFhzUG0wQnBHRG5lb1p3bjBC?=
 =?utf-8?B?SEJVSkNobVc2c0FuVm1nalNsQ3hscWh2TXYrYzF3QnJVMGJTNGx0YWx0MmhM?=
 =?utf-8?B?MGh0R3hkazd4OElFV2Fnek9DVHNpNjFLMWFRVTZCSFk0MG9BNSs2UnNYZitE?=
 =?utf-8?B?clpqOVdaY0dxUGJjWVc3bWxLekFNSXV2MGlWQnBvdVhsclJUcTJrc0FGYk5n?=
 =?utf-8?B?YXl1WWlmaWg1YTQzaG1RVUxDQlZSQUZ3MGh1YkZxQzdRQzViRk1LV2hBWU05?=
 =?utf-8?B?dXlwWkljZG1makFKQ1Vubnp6Vy9ndDU4bGtsbCt5cjJmR2hCWFBVbE5nTnpl?=
 =?utf-8?B?YVllSjRweWZ6SWFSWGI4Y1l4YlQvTjE5T3prUGJNdVpvbFEzQTlCZzJVUU42?=
 =?utf-8?B?VTc1NEFyQmlHMGJFcE9sRTJUMlZJOGdldWpyTE1JZEVoenZaMkxxOHVwK05i?=
 =?utf-8?B?RkV2UVNhZFVJUEVMS0M1NitOMUk2THozMjFNYkRDMmF1c0cyOEdFRnlvYkFL?=
 =?utf-8?B?QlMxamFueFJ3cDZQeVNsZFhRZjc5aDNGNDhJanZqOGUvK2FtdVFqeXpjTTJj?=
 =?utf-8?B?eG1xUXA5bVNDbzRZVXBDVHlEc0ZuSnp5RjEwY2RjOVFuKy9PM1dwd3d5MlRl?=
 =?utf-8?B?QURsaUtROGZvUGVBZ0tycStXQnZJUnZEU1JRcmxQVEJ3MUNpeWNLSERieWRt?=
 =?utf-8?B?MFluQ3pMdlh5clkzRkJUYWUvN0thOW1CQlFQeXE3dUcwTWZFdkJtbWYyMlBy?=
 =?utf-8?B?Q2xWRDN5SnZtSnpWTkREb0hSeG9TMkVTcHpWdVkvMGFIMkJDZlVNd09pWXV2?=
 =?utf-8?B?STlXTTUrcTlnWFBlVnBTM01DQ0pCVWJmRGg2UldRQkpNbENOdUxNemwvREpY?=
 =?utf-8?B?ZWpkUUYzU3pXaHlHTzhGcUwwMHJXRHNUTHdBQmw4UlNGZGt3R2hseUE3L3Nw?=
 =?utf-8?B?QWp5QmVuY2RRam5UQy90YW0ybnNmVWFWbXdoQkV0T1dSNmdZNkl6SmhZZHJL?=
 =?utf-8?B?SzFtT0d1SUlpQjBXV0Fwa29NSUQ2R3R6RzVYVjQ2RCt5dlVWNytYanc3QzY2?=
 =?utf-8?B?ejYxbDd0VVBzY1pNQXZGZVBEMzNDcmNvdGtPeEVrSEJkMURRanJ2dk1kdnNr?=
 =?utf-8?B?eW52TEU5ZnFuUFZwamxOWS9TT1FkYUtaT05kcUFwNlZiTkJsUmE4VEpzWWZ1?=
 =?utf-8?B?QS9mdytIMmJBV1VabXlkVGZMM3NhTHBBSndQV0RoSytSSStrTVVwSXBReWx3?=
 =?utf-8?B?Y254clVTT0dlczJjcmE3cFFLNnZva2dkUUFzL0J0M2VLK2dsaXBidjVYd0s2?=
 =?utf-8?B?MXR0NktWblpwNkdtTUZQTTNCRWtSSmw0NUp3Umw1RzBhNGlqTFpGT1NLVDR2?=
 =?utf-8?B?ajhwVlpqeTdqRE9sUFB1NFZSYXMwVEhXcFRxQlY4MElzZHMrSEVqTDVLVGhu?=
 =?utf-8?B?LzVFQ0UzQzNtYTA1K2JlM29xdmw2YnBuWHR2SmFTYzRpOWtCbmYzd1NvMEtz?=
 =?utf-8?B?eitJNTFVQkhUcDlTUG1zZ3BqbTJwMk5xMkZLcEg4MVBSclVwcVBwcEx6bkpR?=
 =?utf-8?B?UHl5emY2bVZ2NnZxNDQ0bnJERzVrMWZ4WUo5cndFbUhULzdNWTZsMi8zdUZh?=
 =?utf-8?B?UlV0Rjd2dlkyUDlhaWF1bGV5b2h6U1k2ZlB3b2pBbWF4UVJrVXRmTDQ0emZ1?=
 =?utf-8?B?M1BBQ21tTXNmUDZzcE1qR1lobXBvYWEwRXJXend5aXpORjNCWTdSVzUzcnla?=
 =?utf-8?B?aDRKM3J4VnFTZ0FsMW0yNkRxOXpwcmtZVS9NSzRTMlJzZmYwcEFYVFlmcFBs?=
 =?utf-8?B?cFlBZlN2a0JOVk1lSWVmeGdIbCtVbnV2RlFUVWg1UjZkWjZ3T2E3WjZ3Yjc1?=
 =?utf-8?B?MTVsUittMXhMSEZZNWlOMG9zRDlmTDUxUFR6UmlobGZIdjRTTnMxU0M0UFZl?=
 =?utf-8?B?V2hHU1RqVlAxVCt4UGFkN011WmQ3Q3MrSmQzRUlzOHcrRVpNUDhGeUtZdnlp?=
 =?utf-8?B?WWdZd29RM282aGNRUXVPZGRTbmFOZk50d0F2aGdmbC9sZkVKc3lDMmpmeEVW?=
 =?utf-8?Q?7uj9/i87hpLViCInndCUjzAZI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd75e22d-2cf9-4a37-fec6-08dd82919a4c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8876.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 18:06:42.8335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E07Vql/0ERTf+vqxZ01oA6DK5yr/r59N332KTk5tn8hB9KPh2W5n4kRYQU9TL354esFPtE/fccqy0W9L9xQMsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6413

Continuing a discussion from before:

On 4/22/2025 11:51 PM, Jan Beulich wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On 23.04.2025 01:43, victorm.lira@amd.com wrote:
>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>
>> The unary minus operator applied to an unsigned quantity has
>> a semantics (wrap around) that is well-known to all Xen developers.
>> Thus, this operation is deemed safe.
> Please, as you have it in the other two patches, can the rule title be
> reproduced in such patches? As it stands, without mentioning the doc
> version either, someone finding this later on may be left with a pretty
> wide ambiguity as to what's meant.
OK I'll include the rule title in the commit message.
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -347,6 +347,12 @@ constant expressions are required.\""
>>     "any()"}
>>   -doc_end
>>
>> +-doc_begin="Unary minus operations on non-negative integers have a semantics (wrap around) that is well-known to all Xen developers."
> Why "non-negative"? A variable of type "int" holding a non-negative value is,
> aiui, well within the bounds of the rule here. It's unsigned types where the
> use of unary minus would constitute a violation. You actually say so ...
>> +   * - R10.1
>> +     - Applying the unary minus operator to an unsigned quantity has a
>> +       semantics (wrap around) that is well-known to all Xen developers.
>> +       For this reason, the operation is safe.
>> +     - Tagged as `safe` for ECLAIR.
> ... here, just that this one's getting blurred by using "quantity" when
> "type" is meant. Imo we need to be pretty precise here, using terminology
> that's used by the standard or the Misra rules, and not anything "coming
> close enough" in someone's perception.
OK, I agree it should say unsigned type(s) in both of these.


Victor

