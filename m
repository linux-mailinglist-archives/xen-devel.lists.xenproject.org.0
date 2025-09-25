Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2094DB9DDD7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 09:35:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130035.1469685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1gVI-0005ar-8q; Thu, 25 Sep 2025 07:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130035.1469685; Thu, 25 Sep 2025 07:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1gVI-0005ZC-64; Thu, 25 Sep 2025 07:35:00 +0000
Received: by outflank-mailman (input) for mailman id 1130035;
 Thu, 25 Sep 2025 07:34:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w1Y2=4E=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v1gVG-0005Z6-LQ
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 07:34:58 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22364298-99e2-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 09:34:57 +0200 (CEST)
Received: from CH2PR03MB5223.namprd03.prod.outlook.com (2603:10b6:610:9c::21)
 by BY5PR03MB4999.namprd03.prod.outlook.com (2603:10b6:a03:1e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 07:34:52 +0000
Received: from CH2PR03MB5223.namprd03.prod.outlook.com
 ([fe80::64db:a9da:5b27:8665]) by CH2PR03MB5223.namprd03.prod.outlook.com
 ([fe80::64db:a9da:5b27:8665%4]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 07:34:52 +0000
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
X-Inumbo-ID: 22364298-99e2-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNRne1WDxQqeeXsSiXeavoHQaWffC2q1VXI/zrt/AbJGxPn2LyKJiW0FzWdvDOyvrcAnbZx06r8yM/sdUKKg9KVMjytdAZvaFtbRAjSW+Zqwyt27mygNDlLBGWaU3k0LetJo+ZDt54pPoWeBAiDjtlaAZQ06uoH0C+mAW4szlspo2jt5Wz8/MobRxE/sL8dBBm0Odwqs/vFIkmWdyxq9J6Rhc8XwtieiMRYXIFVaXZq/YOms+xSlwlDuEIR+L+H1jVY8e2R7sqnAvPCMvpguNwExSv9G0qY9FK6jv58LLkj9G/kqxTcCanShjTj5WtU8UbHbq6rMda3+qM8H7aIZNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXF5asecZjQkbdkSLXxEXtiY2QfjGxz9zAvHG5v+R0w=;
 b=B9gZbOYaNPGa7d2w5eBJvCbTM5MX7a0eTH1snDqsw2Me5/DcyZSXwv901nyzlEbO6F5oAyGvoM+s95sJFFUXiThbLAFafnamY/fTRkWfdzeknFEBS1vwsmXFvmKrP2WhxiD9uIBeI3my+v3/QWKZdlTkXrsPSi14a2VdiAaX80Bc8EXMK3BuDNwrFeBR7spe+V17CtJRZOGPhiZCzn/JXQ97u2xu325W6ubnISzehJrV2VVCbSZ4FtvvLiTuoEnPk0AFHoB0fnMkg6SjsE1w3K5b3K5LteiRzsfaJurkNQVWqmA8KTxbiJHs/rtaBaOvTV425qXgacZXJpN1lGztjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXF5asecZjQkbdkSLXxEXtiY2QfjGxz9zAvHG5v+R0w=;
 b=yNaQBJ3ATpeZC0X7hGZdu7baqZYaR2BLTQYwicleCUDrcIOPQZf4idA1pRMGB/KWAyeXDOInIfJGIRNF8+RkJjFoNd8M5xRuLRrJTc+ci40Erxsv26j4XgzeDJkmtZH3T3ZkKcWBOiUsyxjmzXlWfYZOJycDZNmCRH64/ceYqhM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 25 Sep 2025 09:34:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"oleksii.kurochko@gmail.com" <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper@citrix.com>
Subject: Re: [PATCH for-4.21] x86/cpu: populate CPUID 0x1.edx features early
 for self-snoop detection
Message-ID: <aNTwlR02jijpwYeC@Mac.lan>
References: <20250924110051.2160-1-roger.pau@citrix.com>
 <2d17d2d502df489f97b51e43a2d86535@DM6PR03MB5227.namprd03.prod.outlook.com>
 <aNP0iNtp2q3342G9@Mac.lan>
 <3d45a9e8-a836-46bf-a3bc-321551ac755b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d45a9e8-a836-46bf-a3bc-321551ac755b@suse.com>
X-ClientProxiedBy: PR0P264CA0113.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::29) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR03MB5223:EE_|BY5PR03MB4999:EE_
X-MS-Office365-Filtering-Correlation-Id: 644c952a-85ef-474c-7901-08ddfc060374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXJYM0liejVYVVlTc2w3UXlPY2pEQUo1QnZ0Ri9sS2NzQ2k3YS9SYlFXUkpV?=
 =?utf-8?B?WjZUVzI0R3BJdkJ1ckxNTEpHZzc3R0E5YUFFcm1mYkZ1eHdZU3k5RVNOaWc1?=
 =?utf-8?B?cElRSEFrMEY1WVQzbzE5SElzRXNmWFZPeEZjZjlEY0l1cGMzbkpJeGUvM3Ex?=
 =?utf-8?B?bnNjSU9iYXQxT3FoS1RDQStQQm5zZWUvOWpWYzNQRE11ZGFTbHpsWUtlTzA1?=
 =?utf-8?B?SHZ2L2NaS2lhcVpwS0VOaEphMU1FNXY1R01sTHBWOU96YktIYWMxMG42Z3Fj?=
 =?utf-8?B?OHUyUVBCSU1NdVV0T21ZaGcrRXlJQVVSOGpkMUV2cVBQbHAxVXh5RktWNDFG?=
 =?utf-8?B?R0JpbjNMRW41Y3d6K0ErVzhJWVZyd0g0eE9DSkoyRWhYWWw0YTIyUWp1TXI3?=
 =?utf-8?B?a014VU5ENXMxc2djdXIxdEtkNzVPSVErQjF2ZUpYZGQwZ3JiTTZDT1BIcUZj?=
 =?utf-8?B?Y1N1Y1BTK1lPd2JaSWJzYXAzcDVpbnhadGxGK0R5UEljNldMNEJIQVpqQ08r?=
 =?utf-8?B?ZE9YdW5YdmdpTCtvVTVIbXBMNzdNVGVQSktWdnpNNXY5WDJDaFNMWEMveFN6?=
 =?utf-8?B?aFdKbytlUWxlUkppMjQ5bDlIV3paUk9aVlRSdmliUWRyNWI3a1NZNTVpWi9X?=
 =?utf-8?B?cTV2RUJWUmo2U2h5QVR4M3pwYXNMbDZ5dkFhVnZmcHVvb2xwYzBkS1pZejR2?=
 =?utf-8?B?V2JyNHFqTDFGL1o3dGtXN0dHQU1IU3NQNzlGUmJCMVlSelV2dS9la1F0TFht?=
 =?utf-8?B?Q1V2Vkc0ZDllUTltRVZ3VTRRZUJKTWg5WjZKaEN0OEVVTTJiT1BUbklSSXpz?=
 =?utf-8?B?UmRob2FTRjVldnhSQUpKOGhqQjNOZXBSRlR5OFpsR2hna3dlZ3dlVnBRUVB0?=
 =?utf-8?B?MzJzTDB3Sk5yak5jTUNxR24rUXFzT2dGd0ZDRVZ5VjNEZE8rK05CcHhCaEhy?=
 =?utf-8?B?bkZCODd4dGFod1dmZTNLV1hNT3FRa2VONTFOeCszRmpZNUtCTVd4RXcwT1RX?=
 =?utf-8?B?NnFXdFIzTTBoaTFLQWdpSWloMUh0SmkxNnBBZ2dRdmpRaXd4Vm8zbzE3aEJa?=
 =?utf-8?B?QW1jMkpuSVMxM0NqbjQzQW5rdzh3VHNDZDFUYXFTVFQ1NkxlYTcvSHlLM3V2?=
 =?utf-8?B?d05ueWdRZDdEemVVNFB4VHdnL3h1N0V5QVNTWUlFOHNvbDFUbWVya3B2aE9T?=
 =?utf-8?B?QTRoSndENityQ2pBcUpXL2lLeTlFTTk0RU9SUjRJY3ZOR2JzYWdCT2EwaWR5?=
 =?utf-8?B?VVpGck5NN2lDZ3FvOFg0d2JmMHN3bU9NSVJMaUErUmE2SEpWbG9uT0o5QklZ?=
 =?utf-8?B?amRnQXFHU0VrVmt3dHVSVXJWWUF2S3Y0ZGNSaDNmRW44UkhLWEdBWjJ4VWEv?=
 =?utf-8?B?bng3dTIrSVJNTW9PRDk0Rlhhd1dCYmM4NnRJb255RWxwWkg0M2wwczVwQzh3?=
 =?utf-8?B?THVOVUJNZWJuTFZLNExwTHljVlROUXRJaXJXT2prdm9LYUwybGVKdW1ZbWov?=
 =?utf-8?B?dGMyU2xDUi9YQ1hTbFNxQWVpUWdwMjd5UmpqNW9POXNnN1pwVFJPODZ1T0NV?=
 =?utf-8?B?WHFlV2lHazZMVWtLVUllTnlYZEFLaWsxYkNyL1hndUluU1JrNktueVJNZlpy?=
 =?utf-8?B?YmVQejliczZYM05ZWmlvRURZUlE2bUh0dEpGNVN0bUw0T04veHJOY09TSDFG?=
 =?utf-8?B?YitXZmtOMXpPME1JRk0xbGJsMHdzR2RpQzZpa0s5OTNDcHJiV3dSVnNwNkwz?=
 =?utf-8?B?WkVmb0hEMkN4ZlpvMGxkVGtJYXhQVnExRGNaalFhaXhDVHo3TVJvOFh5eEY1?=
 =?utf-8?B?T0YrMWxMdTVIakRKS0tnZlNPZm1KWDg4dWl5b1ZjNXdRWmJQZ1RHbDFZRUtx?=
 =?utf-8?B?V280cFNYajg0amdJQUd6T2dKbFlheE42Z3ZJZk15dTBmdkJvc1JsVnViazNT?=
 =?utf-8?Q?7rIVf3sCBtQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR03MB5223.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2hscGVqWnAvc1hYYU5mZGdwd1paVWgwY2dwVDE1ZmR6eXBUWmZVSExSbFpr?=
 =?utf-8?B?bVNXbUY4a0pGTE42c09GaHF2SG9UcmZwM0RFbnVsYzFFV3lFNE4xY2lOSDlq?=
 =?utf-8?B?UHFBbitWNkluNkY1bDM5dkZndW82ME1rb24vU1dvY2JxQXR2djVUVE1rNXVk?=
 =?utf-8?B?MlBVVGdiSC81ZlMzQUZpZ2daR21ZTGg3QkxBOXJvM05xZzZKbHNUTUloY1dH?=
 =?utf-8?B?VnZWL0JnMjFxY0EvTVFPUENyd0xtb0pJemNPODU4U0dsN0F6L2o2anphTEtp?=
 =?utf-8?B?YmhRYmJLRXhnTjVFN1U1UUpnazlIM1dzUlBScGlibUhYODRIWm9WL1VnYUhF?=
 =?utf-8?B?a1VQY29Id0ExUVFDeW04VDU5MUE1YjlCOTZheE9ZVUdhdG1FUUtESW1sTE4y?=
 =?utf-8?B?NldoMVREUXpHRno1YkZ2UjNLTDFpbWV4WTZMTTRaVkVPNVFvam9UNW41dUJa?=
 =?utf-8?B?ZkI4Lzh4TTRDcTltMTBHRUNKUGVWdXZkMEVmYU1aMTBHaGJ1QmZndC9iT2I4?=
 =?utf-8?B?ajJZa2t0QmhWS2tYYkJHendhS3dqWHpvcFk4b1V3d210a0hLL3YzRWtPNk5i?=
 =?utf-8?B?Rmw5OGpDUmJQY0Nnb1JHY3VDc09XRUV6Z21FSFZuMG5NU0tLa0lKMHllbHZs?=
 =?utf-8?B?S2pOY0pkMVFwMnhnWHlmSXJFUjNibDBqTkF2T0dXcURtaUwxbDhtRkp1Q1NF?=
 =?utf-8?B?N1g4ZWVJMFZNVjFNVXV4bmRVbnlzQ2tQTFpPZWhVNVkwa0xiWlZtbDN2d3F6?=
 =?utf-8?B?Q2orelhWamo0YXRXSUVPR2xNd3VUZXAwY0EyakJvQlVlUkh1S2JoZnFWR2NR?=
 =?utf-8?B?N3BmOUMyai9uQm9TTTI4aGZyNS9HRUZIL3NlKys0WVJhcmJVb05nS2VNQmlt?=
 =?utf-8?B?NnhSbDUyOXd5NTlSWjhndWdkeTJHNWFldlRlMXhiNEZzVGdSMys0dXppU2wx?=
 =?utf-8?B?aEg4UmxGUmhIemxDVXdPVU5RT2Y5YTF3RFVibVJITkxua2g0TDd4UWRWSVpF?=
 =?utf-8?B?MmZTcmVBeFhTL2RtQVFMTG9Od2NhNHdqMTc1QUxBeEQxM3lRS3ZBOVAzbTlU?=
 =?utf-8?B?VjR6OTlCWFpITnpzbXNtbXA0RjJLWFdwallLeVZZdUtlcmVPWFExRUZYK1VF?=
 =?utf-8?B?Qk0vWWp4N2REbDBuVFVzZlZNOXBqWmlVd3k3MnhmRHZTejVTOTFUdDB5Tmc4?=
 =?utf-8?B?UmtWcDRqVndWNkNhNkZPQnprNlVqMjhhckZtNzV2cFJxM2gwczdMemJFajFO?=
 =?utf-8?B?dmxBOEp1QzJocW40QU1IQTd5ME5mSk9EZGVHSzdONnJIQlRpSDJUVHdqU0Vt?=
 =?utf-8?B?TEN5L1FOTXVvNzYySndOa3U5MGNxZFpFZUNFNFZOM01zNHdiaUlkSTkzM3Av?=
 =?utf-8?B?VkZnUHNVNm9CUWkyS1FYYzcrNUovSjNtU2NrZVoycXF3dmN4REJqYkMxd2dm?=
 =?utf-8?B?YTYvNHZ4SE1pOWg4SHc0Z1ZZM050TmdaS202L2lvaFRpWjZTM3hjVlgzK05X?=
 =?utf-8?B?Nm1NZUtBZHJpL3docms5dURyYWx4QnJXQUc3VEN6MllvSXhZUUxLV3h3WlVw?=
 =?utf-8?B?NXVQRldGcVZWN3JYcEhkQkpSaE1aM2UrcG1JaTdpQ0w1UmthN2k3ODZRUkFv?=
 =?utf-8?B?bEVrZEppVUhNNmtMSktEZWYvS2lJeERLVzBLQW9vS21oc0hwTVFubzFYMlkz?=
 =?utf-8?B?c3RTWk4wL2J1emNyVjJtREVEV1p3aG82N0liMUFVWUhuVm03elhNZjNseUhq?=
 =?utf-8?B?dWxDOGdHUUdhcm1sRlU5ZlJjNTJxaHVpTUhLZTM3Q2pWL2J4dHJOaU1CU1FD?=
 =?utf-8?B?bCt2M25ZaUdnN0JZVmJuUytGZy90Q1VnaHhWRjBWWEZQbHZaVnNyUWlzM1By?=
 =?utf-8?B?SjhZUnpWN3NhRUdWY3hDLzBKVmF4ZGVuenBzZXJOVG5rQUxWNUpvN3R0WXFB?=
 =?utf-8?B?TFJDNmdYZ1NtS3lUa3lSQVNDdVhneHNDY3pINUgxZmpCeXhWY3J6YXFqT1cv?=
 =?utf-8?B?VDhuSDVXSkRvbkQrSHpFajc1ZG1wNGprcDBJK1pKQjJMTUthc0RKb01jSmhn?=
 =?utf-8?B?U25hczg5QXFRWWxnRk9pQ250ZEVkbG1TczFJaHRCcmNUdnRQaVVwSWJ0YVFj?=
 =?utf-8?Q?yFuMBEvkS3dxF/RGMPrbZPT0k?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 644c952a-85ef-474c-7901-08ddfc060374
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 07:34:52.6954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RdlkJ8XuVYcQ5RJjXy1f2QpK9WZw8xmSr6NYFgvKUob8ctVVy5qATtWkr/Z+PxVMQ4IqAYne6CFB8+sf42ROTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4999

On Thu, Sep 25, 2025 at 09:03:06AM +0200, Jan Beulich wrote:
> On 24.09.2025 15:40, Roger Pau Monné wrote:
> > On Wed, Sep 24, 2025 at 11:50:02AM +0000, Andrew Cooper wrote:
> >> On 24/09/2025 4:00 am, Roger Pau Monne wrote:
> >>> Otherwise the check for the SS feature in
> >>> check_memory_type_self_snoop_errata() fails unconditionally, which leads to
> >>> X86_FEATURE_XEN_SELFSNOOP never being set.
> >>>
> >>> We could also avoid this by not doing the reset_cpuinfo() for the BSP in
> >>> identify_cpu(), because SS detection uses boot_cpu_data.
> >>
> >> Doesn't this, mean ...
> > 
> > Well, that's the reason for the rant here.  The reset at the top of
> > identify_cpu() has been there since 2005.  It's arguably to make sure
> > the BSP and the APs have the same empty state in the passed
> > cpuinfo_x86 struct, as for the BSP this would be already partially
> > initialized due to what's done in early_cpu_init().
> > 
> > The underlying question is whether we would rather prefer to not do
> > the reset for the BSP, but that would lead to differences in the
> > contents of cpuinfo_x86 struct between the BSP and the APs.  In the
> > past we have arranged for leaves needed early to be populated in
> > generic_identify(), like FEATURESET_e21a, hence the proposed patch
> > does that for FEATURESET_1d.
> > 
> >>>   However that
> >>> creates an imbalance on the state of the BSP versus the APs in the
> >>> identify_cpu() code.
> >>>
> >>> I've opted for the less controversial solution of populating FEATURESET_1d
> >>> in generic_identify(), as the value is already there.  The same is done for
> >>> the AMD faulting probe code.
> >>>
> >>> Fixes: f2663ca2e520 ("x86/cpu/intel: Clear cache self-snoop capability in CPUs with known errata")
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> ... this Fixes tag is incorrect?
> > 
> > I think the Fixes tag is accurate; the code was OK before that change.
> > Nothing in c_early_init hooks depended on (some of) the x86_capability
> > fields being populated, which is required after the change.
> 
> I agree. Hence:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> I wonder though whether while there we wouldn't want to also store ecx if
> we already have it. (Really there is the question of whether we haven't
> other cpu_has_* uses which similarly come "too early".)

Yeah, I was about to do it, but it's not strictly needed for
c_early_init, and it's done anyway just after the call to
c_early_init.  I can set that field also, but then I would need to
tweak the comment ahead, something like:

	/*
	 * Early init of Self Snoop support requires 0x1.edx, while
	 * there also set 0x1.ecx as the value is already in context.
	 */
	c->x86_capability[FEATURESET_1d] = edx;
	c->x86_capability[FEATURESET_1c] = ecx;

Thanks, Roger.

