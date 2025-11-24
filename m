Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6B6C80874
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:44:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170744.1495807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVvG-0004zz-Ue; Mon, 24 Nov 2025 12:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170744.1495807; Mon, 24 Nov 2025 12:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVvG-0004xU-RC; Mon, 24 Nov 2025 12:44:02 +0000
Received: by outflank-mailman (input) for mailman id 1170744;
 Mon, 24 Nov 2025 12:44:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h9jE=6A=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vNVj8-0004cg-Lp
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:31:30 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7feec8a6-c931-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:31:30 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5423.namprd03.prod.outlook.com (2603:10b6:a03:28c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 12:31:26 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 12:31:25 +0000
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
X-Inumbo-ID: 7feec8a6-c931-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ct1c35hKZhynlSWaK2e+7wRcwho3W3a2JLGN7Kd2W5AC2waIEgJewKuQM1BS4Qv//iH0ycLX0zXSz0FeS225StUdmjzk7RCAWTnjBNk2wlTLWhNJH41d4s3AlOl8m5XgFy32nTlwjWQprnlPJxC9RgFcBoQYJ4GY8xbfWr8+/wWm1/3gZh4FR6vxV3sI2jjSn9RUjTItWGjn8G5oSSGSS8DD0Clip758d/Hz+WYX5Chm4+e3vi7dC9d9ZHnopoNPInVhqeShLgBLYHLOOaoY5ivVtrHNVc8nGefEgTkG99vjBkLcdYMzU6bkHMELqjS3AhLE8umPo/evDADCQVSHww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqC64A7fk6ujRRKnLMrKM4vYk+jM2ISqPkVTxP1X/6s=;
 b=TyY0nxXdKeRMnfCzxXIssoz48kFzPgaBpMMftDCtaqXiWdFzeSckG6qU0q5FQqwabSW5MSbzN23vtDN8tEy4Ginf5eQ0wCleYOldvU4izSILe5XtJYf9trHvBwK3B23pEXTUnO9bWD7W52ED3gkZNZZEHwE/vWTfAeMl4WKhP0lq4KtNXvfdg4uiZoXTv1rMWqyBAjjWb7Kzjo9+TA94YgVA/aOE5WUPa2LEtQk/VuIbxbKcFyHcqpVz2EMhqHcu5c0hxTsQgMclXolJkpSOE17Mm2uXhDaC46fTEEapPrKZ2H9PDu1y0tx4a2SmZNjRPhmD3TkhaIm08WKO04QSHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqC64A7fk6ujRRKnLMrKM4vYk+jM2ISqPkVTxP1X/6s=;
 b=ZBdhKHjYJvNo87eNWBLKUz780/c0cYi7b2k+ckn9JPoSpC3gvqc6fOs1VJIzxsxb7ZzH/IP5MVe/LRWAK+Zztcgz8DzCivhU1pDrPUsxQF/n+mbyPnxxNTkp0/XGjyVuZ5ny5YhdtlAWrbmCCc6xd9huWjH+XadAVApK3SDVrj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <298ed761-f7e1-4239-a110-c49bfb24a479@citrix.com>
Date: Mon, 24 Nov 2025 12:31:22 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86/vPMU: move APIC ack past the handling of the
 interrupt
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <5ac2e9b1-81f2-41d9-8f05-d546a49c43a7@suse.com>
 <96e8cf62-987e-45fb-9463-8a3069d346f4@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <96e8cf62-987e-45fb-9463-8a3069d346f4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0013.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5423:EE_
X-MS-Office365-Filtering-Correlation-Id: 30c4bd67-c4ac-4cd4-2737-08de2b55622d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDBYSXJMaldhSytobEJRWlJydHZoa3VlNnM3elR1QXhWbUJHdXZTdmdOUlRI?=
 =?utf-8?B?V0FNV0lrYTRXMmduSGlQN0M0SVdraXRIa2cwcXdwSDd2eVdGQlNINSsvL1lO?=
 =?utf-8?B?WG1jR09HNEdqOEJON2F6SU53aXVUME0wTEF4TC9jSzdTeDhLd3pCQU12d05R?=
 =?utf-8?B?UXQ5Q1VGVkN0eURkZW53c011UmVUNFZVczdXbVppMk1KZzIyRStVTVZyV1ZX?=
 =?utf-8?B?amZsSDNzL1NJdU56dnk1VlN4VEtpQmIxbytYWlZIZW5ESkFuWXlwS1pTWkth?=
 =?utf-8?B?dGZNbEo1Q0ZNN3JqeFZuVERLeC9wbWtnbEwzcGh2b3FSWnhNWlpRajVRZ1ZC?=
 =?utf-8?B?MHVFZEpSUzd3SzhzYkJ3Z0FTZG5adHdOdDUrbnhkQlV0aFI2dDN5dExGK0Fq?=
 =?utf-8?B?b2ZFOXorNWtvN0pSOUJyWVlLcXFuUm8wVUxUamprQ3VDRWdnSHN5bE5YT2Fn?=
 =?utf-8?B?TGQ5aU9kVVg4WmQzQUZ0NDRUQ3dYQWNrWDdwVEN3SUQ2dDdMeFliZ25TTUtH?=
 =?utf-8?B?d0JjZkliNFV4YnVzOTFmN1NrZlVpYnpXMTFabVZleHlNRTZOZzdKWHNBdFg5?=
 =?utf-8?B?N3UzL1lITk9sQ2ZRbFdUQWRFOWpEdEtPbU9oZS9yVktkZ29qemVlczVsMlEy?=
 =?utf-8?B?QUxpb1VtUTFxclorSmtQNVd2QWxHdHdYR3ZlWE1UaDNkRjNnVkNCUmtqY0cw?=
 =?utf-8?B?dTh0U2tXKzhXMlVqUURoU1RMdnh5WTNTaVJOazE3Q083VytHVGlGSVdEUFly?=
 =?utf-8?B?R082Ujd3dFcwRzZhU2M0N21hVWtCU0dIZ3AvK0ZQZWVTUHoyd3lONlpJQk5N?=
 =?utf-8?B?bW45bTlIcU90d29sbE1wK0xJMDNheXA3aHVoditLSlArR3RFUEJCUUdmNmdK?=
 =?utf-8?B?Zks5c3h5clB5OHUyRlhENi9uSjd1QlFRd2NPSVptUlZTaTVWT1lXRFhFSHhO?=
 =?utf-8?B?ZkxlOUtyTnk1NC9mK0JncUR5U2sraEdJakpNSXB4bmwrOUU3aG9lNWJzSi9E?=
 =?utf-8?B?T3BGQm82aTRBSUF1d29TWnVjVytwTVptY2xnMnFJdnZFTUtLV1ViWjQyMEZ2?=
 =?utf-8?B?ZWZqOUUxY29lWFpOeDZiM3J0cC9VenVHTGdCL2hlaDhRc1JJbWNVZDhsZXo1?=
 =?utf-8?B?VVg4NmJ3alVrMGdyL2hMYlJySnRvdTh4RC8vM1JwZ1RRTFdjODVmSmxsL04r?=
 =?utf-8?B?VEpZQ2FWVTd3dE95SC9pWHdoTG9oUW5VNmtoZm56UWtNdDgzRUJBSHlzcVQ2?=
 =?utf-8?B?cmNKZndxWDd6WmhqajdybGZOKzhIcDdpR000Vyt5aTdUSGRLc1NtSldoYTdO?=
 =?utf-8?B?TnRabWZ5UUE0c0RvV2g3T2Q3aHdIRllzMm9hMU5hR0RzRGkzdGJleGsxQmpR?=
 =?utf-8?B?VGlEcGxSZWxFbDJpVW1vb0xuK3lZZ1ZMbGQyR0xyaDhWYWd2SlZNd1c4Q1RE?=
 =?utf-8?B?Rmk1V25yOGpWb3pURWV5anp2QUMwOXBtT3Y2R2ZsV29lLzRQaWM1RDJVdUNP?=
 =?utf-8?B?ZTBuNHFIOGZwMlN5dnJaTFRLdXlyWll5YnFqblZFVjFoOHFUamZuQlNBd3V6?=
 =?utf-8?B?Rk5PaWg4b2MzSkFCSlpPcnBUaC9FQndmR04xOElJQ3pjNVpFZWVLSGxWMGZo?=
 =?utf-8?B?a3BXQ3JNT1pLZEZlWkVDb3FxTmdPZ3JrUEpZdjcvaThzNXlVb3R1b1FpS1Er?=
 =?utf-8?B?Um0yZGZqTTY0WFBWWTYyd1U2Q2Q4Sng5OGlQQk9WcUJmaXoxMzlkUEN6R0Vk?=
 =?utf-8?B?RGJGSmhuSVBPYkpXVmgzeVROMzZZYUZCODc2L2lYOU5qaGxQVExtNWV6cnRI?=
 =?utf-8?B?S3d3TWlyVFNtN3N6Z3R0VjNKOUM3OU95ZzFKVEVJMFBaZ2ViTUtiNFQ0QXZ4?=
 =?utf-8?B?M1daWStNZTFXUHQ4dVhMNE00emNwOS95cDYwZ3BNajNGdWlsMjJMR3h4U2NF?=
 =?utf-8?Q?IjPDf9veybYebXdMNIymogol9Cdzsu7T?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVNSOW90UnlaTmVRT3BuRnNic3R2OVlPYmFrSW1MZFgxeGlqMFhDUnhVSHlH?=
 =?utf-8?B?aVZUNyt4YUVkOWt2S2JySnYrN0s3dGhucC9lVW1HVlpaR1ZuaGdWOVhLSnNu?=
 =?utf-8?B?WXAxaW5ra0xCRjdWSGRzWldESjlhTk5nTFJmalB0YWc3c0JPTGJ6SzNIUjhW?=
 =?utf-8?B?TVN5S3NJNGVTTllycWxlTW9mMGtrSndkUkJMWnRNZDVJaVM2a3VzQWdEdTVW?=
 =?utf-8?B?UlZaWHlmQnF5SlVCWlp5Z0pFMEg4d3MwSSt4Yng0QUZZWGQ1dDdzZGFPZm9E?=
 =?utf-8?B?VHBnOXJBUlRkTmdVdlZKdW5TbllOOWlJRldSRHdTeG45Q0xFRDZEM1ZhUFZp?=
 =?utf-8?B?R1ZJcVh5Tmk2SkhsRzdVN3JoNGdnVzlKS0JGQ0UxQ2d5S0FNVXFrdExKVmxF?=
 =?utf-8?B?N1o1clk4MXhOVnRMRHlqOGd4ZnZjVWxmeHlPSElIWHE0Z1lQbEluYVVQZ0lu?=
 =?utf-8?B?MUMrRlRkQXJGVnN4d1ZJZThDbDM0ekxuVHA5Z0xwYnh1QW4rSzFqUHBpSzdl?=
 =?utf-8?B?UzNVc1hlTGtXbXNNQWpiTXRMQmxVT0cvMC9mSDRHVjVzRzFubEczVlNTeDM4?=
 =?utf-8?B?T29Ya2JCMGo1YWVydkszOHNNUGhzbTRGc3F4ZHdyNU5Na05taGN6bUxFazkr?=
 =?utf-8?B?UHduYnl0RUNVNUQzUllNZUk1cTBYcjFCaVh3bmczRHB2c0drdXVWTk52N2F1?=
 =?utf-8?B?TUhBdXQ2ekFjR1lEQzhEQm5DYk1vNUNnaTdLMU8vYVZwWmgzZGp5d0l1Zysr?=
 =?utf-8?B?YVllZTUzbkhZRytTdmdpbXhPRGlyRTdZR1VlMW5yd2dNajJOSDgwUm9YWkxr?=
 =?utf-8?B?dVdjSDh6SzNadTJzN0I2ZnRwNUtTcUxXUXR3TmNkbWREODRUeFVJQkZUNjlv?=
 =?utf-8?B?RkZ6NjBKbWlXN2lldkl0RkplQTdvdmgwYW45Nlp2SUkyNzhycUtXNmF3RFZz?=
 =?utf-8?B?RlNqWWhvUVErSFhXV0wwU0pzSGNQVXRBQmFjMEMwaUxHeVg0T0JjVnZ4Rjh3?=
 =?utf-8?B?cUIzc0M3SlpydUdKSHk5eGpWb0Z4MnpDYkQ4bFlEQmM3VjZZcWttZVNaRDJD?=
 =?utf-8?B?Rldybm15a0F3dGNLaTc1S1J6SVpFZzV3ZWxYbUQxTnFjYWdWUWh6Z29JT2VG?=
 =?utf-8?B?aVhkdVZka1ZqU2duK24vT01ZOC9TcWZTYXRub3p6azVNdEVqNk9HOU9lRVAz?=
 =?utf-8?B?Nmd5eVljMjNNZ1VEWUhyL0ZlaUZkVHdsYWs4OWtIUUJWUmE1eXA2NDNJWGFK?=
 =?utf-8?B?MXVGZWFyRTNld05EdFRkQWpqS21jTWU2amxOVHNKSTh2czlPM01tYmVJdVJj?=
 =?utf-8?B?Uml1NHZ1aDJWenZJT2F1Um1hQlk1UVV1SitoRktZVFB6bDZOWFg3N3JxVGZv?=
 =?utf-8?B?djRrWFB5MEUxSjJyakZQL2RDbGYzVGdJT2NEdEZQVHovSkVUWFl3RUNKVnVW?=
 =?utf-8?B?RytrdzlVejcvMlQwcGpzekdza1BlRG1VOHN2VTVxejZQQmxGYTNoRi9ldEJ4?=
 =?utf-8?B?K3VrRS9jVDVROXZGenFmZUU5MnlYQlhvTXRtVjM1OHFqaFhjZy9HYnk4MFV0?=
 =?utf-8?B?NEVVNDRSTkNHM0hNT3dSWkl6UkRCajgya2ZXS2VCV3A2T1RwciszeEpoTlZo?=
 =?utf-8?B?N1IzRFlvdjAxTnNpRDdLUHZWdHBuM2JrczlKckdiZ1M5NHduSUQxTXVWZ0E4?=
 =?utf-8?B?aUtTZ3dVQXhXVms2ZUIzMVNyRDFrL3BrMkVWbUZBbDVVNDZzRW5tN0dLcnR0?=
 =?utf-8?B?YnJZaUp6V2tsUWpaWnllOWs2ZStIM2Y2UTFVQnRrNHU5OEhKWFFQK1BhS2hp?=
 =?utf-8?B?QWNYZWMrLzFoUlFDcmV2S3BrR09jc09OZ01YaEFhZ1NVdFRYc2ZMd2sxNHU0?=
 =?utf-8?B?MXpSWU11SVZnT2duMHpGaTdpdCtNVFJMNGxDd1ZkUkNxVDVidkRmLzJTc25m?=
 =?utf-8?B?a0x1UEkzN0gvK0NlR1d1VG95V3B3V1J4dVVqV0RQZGdpN0k5RitzbysvT295?=
 =?utf-8?B?VW9jS21WbGZFK2hiREVacFN3ZHRIeUJ2NzloY2JTQkZ4L2FNOXo4ZWVNY0Rq?=
 =?utf-8?B?dkVpczZGRGtsMlp3SEh3SU1yMzhTYkJGc0lFZFpma25BZTQrQjdtMmpFZ2Jr?=
 =?utf-8?B?djVRaFFjQlFBQUtJS0plWS90QTVKSnh0NXBxRWJhT21HSnVHWk15RzBhWlBI?=
 =?utf-8?B?ZHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c4bd67-c4ac-4cd4-2737-08de2b55622d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 12:31:25.4429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qj5T1rnlLl7OYhFNPJeuYCCxZhDwBQZsOSLsNwUu+yS7Aly9ze+YY1MXWb1dgN1db8tgtNXos3aiW0Qb/4Y/DdNI86k28HiJhth9ql9443o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5423

On 24/11/2025 12:29 pm, Jan Beulich wrote:
> While benign as long as it's using a direct-APIC-vector (handlers for
> which are called with IRQs off), follow the more usual pattern of ack-ing
> the IRQ only after handling it.
>
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

