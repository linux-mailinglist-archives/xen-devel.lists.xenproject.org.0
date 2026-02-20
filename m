Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OdcIhV2mGnhIwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 15:56:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02963168902
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 15:56:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237217.1539601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtRvI-0001AN-Dm; Fri, 20 Feb 2026 14:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237217.1539601; Fri, 20 Feb 2026 14:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtRvI-00017v-B9; Fri, 20 Feb 2026 14:56:04 +0000
Received: by outflank-mailman (input) for mailman id 1237217;
 Fri, 20 Feb 2026 14:56:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rFK=AY=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vtRvH-00016w-P9
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 14:56:03 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45d2c0bb-0e6c-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 15:56:02 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by DS2PR03MB8443.namprd03.prod.outlook.com (2603:10b6:8:32c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Fri, 20 Feb
 2026 14:55:58 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 14:55:58 +0000
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
X-Inumbo-ID: 45d2c0bb-0e6c-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVhyCkfK/Zqb3FeJ0D//IdSMJ7uNebuR9MYbELrhFOwRKZxASeo8fz+vfof561vRjGblvAEBWb7E2rpfytVomoT8qwRBxwbV/fQsdKutsGbNrKlOvpr2XtXdqvNAyXH/bm2B9AxqzapQqajKvneQ+pYQKXBEFoYokBqsOdtQznQ+FJHyn2zDXQ1CfFe98yOheEhvOEyVcbeyZdzmv1gPCb8dP71Cru1aEKvvvgh4zZAStdRfoh37f3QLKRgfTKkJzbwCNyF7ukxCfwGdfqFLBd60LbwtBNcCABszdAXuYHnKAePXXewMI/GgcchzHJ5lQiu1Z+Oue+VBnoqGO77S0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUKhE00XX/d9JUrWrno4QrWyT4FPTR/ihK0BclffFuw=;
 b=yWyAxKWKxGgiXwgRTGZcaWDqTIqIJMPgc4siMtBpRkGcGMRBLI4570uIl1ZpsCC3U/M7ZzJdosNqSf/yLjKzgLBnlsBEeUcJ/1Sb6OZFCh18TWC93r6I4RQYwZs7m0L+TixWEi/EXTVURCrYQRWofryGv30MHqykw4e0H6+h9J0CW9zxG5vUZc7Dy1RopPqnPoKz8zPQmCnwY0JV9OkqvjUVjDlRKJeoHg00zvzmgVuEgN1tZdQ6Xo1ghd3GggUXy4eEnd3gxVNluIrrqWKjtzGF3EOxkXmlkQqDdRJNEornYpC4FG3RpHUzKOb9UMgi4I1bIQzJFuuSFerh4Tdz7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUKhE00XX/d9JUrWrno4QrWyT4FPTR/ihK0BclffFuw=;
 b=yOItYRfQ6LfZ3neb+kohH5YfUdDO4+oouRuv4HbRFLb7X6fntbpisvzltuh940g2k0L6uYlDL+pDAukmZt7eLhdzWOC9lu4WpmFbRM3PcvC6FvS2/MLawtGvyEuNz5K7kwW7l3OOXelxDSgQy1HRzAOvq3HrgP+DyEKncjHbHT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <36a06fcd-c5cd-4f55-9757-4143879a5446@citrix.com>
Date: Fri, 20 Feb 2026 14:55:55 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v3 04/12] x86/shadow: use lighter weight mode checks
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
 <7684392b-82b4-a7cb-35dc-a5de8142eea2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <7684392b-82b4-a7cb-35dc-a5de8142eea2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0038.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::15) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|DS2PR03MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: 763bef9f-a490-41a5-9a67-08de70902801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zzk1ZThkajlCNGJJd29VWk5JWkt0dWtzdU9xMkZqb3Y2ZlpqVEdNZVk0NXN5?=
 =?utf-8?B?UmNZZStWSDBqeU55UUtzcDhUNVdnQ0tnTnhnU1B3bFl3ck9TaGl6S2NTME1H?=
 =?utf-8?B?UURONVdPbmlkM3hnQVh2SEhWN2hsMTg2VTF3c002MUJnY2t4WjhjSlBXWnhD?=
 =?utf-8?B?czBKVVNFRFZ3OTh6clRuYXd3L0hkQVJrNjRiZXdwaHFaTUQwWVVQUTdFRTEv?=
 =?utf-8?B?UUhCVkZDbTdLa2s1OFp2cndMaXMxYTU1MkZ1Q1ZDSCtyakh0Z2xzTUMzcXZs?=
 =?utf-8?B?Y0JDTmpJSURzMGxYUlRlSEdmSS9ocm0xSTBXZmZVcnNmd3BKdWYzOEhKaG1C?=
 =?utf-8?B?KzlxRUUrNWRwVUJLWG5iNzlHUDNjZE0yMkVzSm93MVRkZWV0L1pyY2xGNDlT?=
 =?utf-8?B?T2tzK2J3Q2pCSEJnVjNUTUdMMXNDT25mTGFQUjB5eFZZVlRmOFBHTWdFVVpX?=
 =?utf-8?B?c1lKVXh3ZnZ1cTB4b3VVSjh4aEtlSnkwMlUzdHJPaGJmdmZScFdQQmtCeGFv?=
 =?utf-8?B?UktnNEsvdVI4Nkc5cmEyaWRRbWdoak5nM3pWU1B1R09DelFZOFIyVENNd3Yx?=
 =?utf-8?B?V2NOS2JMVGxsN1NCYWFha0M2a2J3TjZoOUNVSTdNcitlV3ZlbkxLUXgweE0y?=
 =?utf-8?B?SUw1enZYMDh0QlRvdnU2NFU2aCtwWWF3azgzbTF5L2hncE5GU2JCR0ZqV1Jq?=
 =?utf-8?B?dUhKUjF5Z2pJZU1mMHlTWWZLaHcweU9JajF2bjZRK241b09MUlVQQWUxQUU3?=
 =?utf-8?B?ZnhINzNHb2VaSWJRb2RrbVI5bXczQVJGT2QvZlRXWS9FemFTYmlCdmVzUmxJ?=
 =?utf-8?B?M0o5NXlnYzRZZ0hRMyt4TFFNc1BpSzZBMEVHRlhJM2FQZThMcjIwQkQ0L0Y0?=
 =?utf-8?B?MlFvSU92ckVHellYbWpBaUl5RHFEOGtRMmdkYStkMGF0TU1VbHNuVWZLVjZw?=
 =?utf-8?B?c245MUN6ek1wd3JmK2ZOc1Vha1psdkNlL1p5S1JhSktFbEtSTmcvZ3dHWVNy?=
 =?utf-8?B?NnFVU3Y4YTVTNHptY0wyZGI2VStMNU1yb3V2VGEzcnd2U0tYMWhCdms5YzY4?=
 =?utf-8?B?TXlsWXk2SDRlM1FPcUdubU5kYU51cVQ0cGhkZXRPaWtOTjJMam5Lb3h6WG1l?=
 =?utf-8?B?cG1vZE05VW41eXNwVFBacHlPTWJMRXowKzRacUlXYk9Dd3h6UU80NHVNWWF0?=
 =?utf-8?B?bU5wQ0piL2E2RkZEaERmWXNiazRBZDEzUEs0UlZhVHhZRWJwSVlKeG1Qalow?=
 =?utf-8?B?RzkvdDJYd2hiZE04S2M1K3JBMGhFN2hLMjY4aGVyRXNKZHVueERRL0x6UGFM?=
 =?utf-8?B?dlRaZ3h2K3kwNUpDMm5QcFpmRlNDQjRURFFEYVdHc2M4TUx6TGEvY0VuSjMy?=
 =?utf-8?B?dTZ6NVZnK1FPQjVlL1RKMnBGeWgzQjVIYm1QSDlOalo4SnpnZjhpa3FjRkJk?=
 =?utf-8?B?VTJpeWtzMnpMdDRmS3E3TFl2WXQ0bWxxZU96c1JRVjhDQ2VlYk9SK0dzOUtw?=
 =?utf-8?B?STRHUVFhSlNYK3EzelA5bktxNlFJOGJ6dEhIMFRiaG5hNjhzR1hhdWFRVjJT?=
 =?utf-8?B?aTNPT3NrQlgrdkxUTC9IcW9nV3BJRGhNRGpDRjNZMXAvcGdqVTVSZXNxM01v?=
 =?utf-8?B?NFJYTkxsZk55TW8vMXV2SnlzdTVRZndSM0dMeVNrT3Bka3NxMGRTVm1RMkVm?=
 =?utf-8?B?Ulpjb2c5UGU0WlJyNG16cFArb1FRaGZkaEZUayt3Vlo4OVNUOTVwSG9QL0E5?=
 =?utf-8?B?OWREdWpuL2NWa2JuVnpvV1ZYdjdRWWVBL1h0cE9xY3N5YXB2Y0xFTXdkSWtz?=
 =?utf-8?B?UVlYZzJPZDQ0Mi91bVNQdlVnTmVDOHVnNW0xVktjckF1dk9yT3NtWWpUNWhY?=
 =?utf-8?B?V09DbE8vbEdGM2ZLNEtCVDM1SXBXbklkaWxxYjNLS2ZpTzVJYXd5MnpJQUlS?=
 =?utf-8?B?anNTd3p0cHlvUjFkNE9WczJpME1mRHV0UGhlNGZOUyt6Vlh0a3QrSTdwVmd0?=
 =?utf-8?B?SlljZHNxWXhvUmNFamFyZkdoVDFLd0d6MzRpeWYrd2dBVlJZZWpnSEcyWjI1?=
 =?utf-8?B?eVNKV3BVVkhEZE0zYnlYRVNKQTdjSjEzQUNTRlFvdTVKWk4rMmxFc20yMWN5?=
 =?utf-8?Q?jvqc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Znl5ellRTnh3cUtCb2orS1RVTmphbXp6Y0JPRTVkc1B2enRIQ21TTlVZSFF3?=
 =?utf-8?B?VUo1Rm9odit1WWJrNzdjRjd1SzltUlF4Nmp5eWIzOG53cmJPV09tY2ZYOTdB?=
 =?utf-8?B?Tk1yVm5ZVnBteEs2bHE1aWx5MjJ1cHZtWjlid0hzbkV1QU1raGdnaHhibmJr?=
 =?utf-8?B?Ly9FUGIzajJ1K2MvSUV2VCtPOWMzaUxnVWh5cUVaR0RNQnhraEdJSnorOWFI?=
 =?utf-8?B?QnZFRXloaTcyMUtuUWJXWXcwMWxlSitOaFd0ZHlhd0JOWEUyUGRXQXNycmFN?=
 =?utf-8?B?a0thNEdBWXUzclphQ2RQbWJJOTFjWTVJdkIyM2ovemMzN0NSOG9RbXpCcXVp?=
 =?utf-8?B?WkpEYWdkanQ3Q3lYaHJGUGtCMFB4Ulo0dmJNMno3T3ppWUVXR3lEYmZhRGZj?=
 =?utf-8?B?dnF0bld2Rzk5T3FONG92RmRNRGRqcGN2Ykc4SVlSWGY3c2sxQmZtTjdpYnha?=
 =?utf-8?B?OS9YamFVRGdvb1NtanlVRGpuSHN5RTFsR2JIMXl1TGp5YVNZYzdCWVg1ZHNN?=
 =?utf-8?B?WklKR0V4QThnTjVZQ1dITi91UzhHT1puSS9MZ2FDKy9aWUMwUFdiU1lqSnFm?=
 =?utf-8?B?UUlLVTFHYzVKdmpXUXp6K1luQisyeXl2Q3hYUjBvSUM1TzhOajhFYjNJUCta?=
 =?utf-8?B?S1NOcVVFbGxDRjZJVUtWSlhLbjQrZmovZ3Naa2dCdlVuZnRTUFJiQkNsYnlS?=
 =?utf-8?B?UkdxR09UOWRwKy9FbnZqMjlVV2EweXZpYzZTUjVldzlWY1Q5ZmtmSFhxVXFq?=
 =?utf-8?B?OFNIRXBIbU9ZTlUzZmxiVjM0ZWlLWXIzNkJzcndSbi91NVN5bFZMY2hwVGZh?=
 =?utf-8?B?c2Q2ZkFxZ21QRnQ4U255ZUdwSFdyaGhxN0Y5elNhRHVZNDgyY0N1R0RLYUFn?=
 =?utf-8?B?OGxGWDF3VmVLUXRyT1NGeEF0UkhxQk5NSkZEV1dyOERJUlZTYmFjSjJSZlp4?=
 =?utf-8?B?QkwycytQclYvcmNudVduSmhJeDcwUEs5bW9wNmR2VGFabVZJY3QydmgwZEtU?=
 =?utf-8?B?RDNmdEQ2T0xSWFFLd1ZYbUNPY1VzZGhyOU1YZytMNjg0dVRuZXdaMUNXekhB?=
 =?utf-8?B?Y0Y3all0R2pmWkdvcUdJc3B6YXJCSXBlelBmSnplZy9hYWVRTHFsU1YzZ0N0?=
 =?utf-8?B?c3l2UUF6RllFbFhpNm4yaEJVY21yUEFyVkxyelB5L0h0UTVCMEV3MzVxWFVs?=
 =?utf-8?B?ZHhWNGpvU1BadDNIN1JUbndDR0FqZTQxQnpPaGNRNi8xbHJrcmkrYjFwVHBx?=
 =?utf-8?B?SnYzbnFvREozSWJwTCtGTXhjLzVYMFVNVzFoRWxVODRZUmtPeGh3ZGRpOGZS?=
 =?utf-8?B?RmNUdTY3VVd4MTNsVWczeHEyTVdOb1VWNkhNUDZGdUtkeEUzdDdRRGRaZ255?=
 =?utf-8?B?OXFtZzdyd1hxV2FPTXBSRDhveEc2KzJmZ2VTSHBIWEZsdHY3Yk9wdXVmbnV4?=
 =?utf-8?B?b3h6VG9ZY0tOUWVvVUh1VkU1Y3hLeXQ0Z0VNSFpycC9OVnlmYXY3U3g0WlR0?=
 =?utf-8?B?WWRiNnIvSVk1c3BBUW5MdFdBRmVxZHZXdzhqUWJJdXR3dWxHU2ttYWJ0Nktw?=
 =?utf-8?B?N3VBK2ZaT1JJOXM2Q2hrdFE3blZBSXJCcnlVekN0bVZXanI3Vm4veTNLend0?=
 =?utf-8?B?NEtSd0I1bmdpTms1UkdDd0JEelR3bktUVVI2eU5MdHlqVWlhOVpnSmNiOEVS?=
 =?utf-8?B?aXZtOUlGbHZ1Z1c5T0Q2ZUd6QmlzdjFOSTJVWU5EcDFsbjFFYVdMVHVJT2p1?=
 =?utf-8?B?ekVpNWpRMlEvdWNTSHM3eEhmcXpiSE9lNithUDNUU2pOQ0p1ZlRlYTk2c2pM?=
 =?utf-8?B?b2ZkZ29Dc0lOWlhVczZHajhTU2wyMGZHUFJZUnQ3SGRQdGVEbzhiMm44eEIw?=
 =?utf-8?B?c2NNSEhUNm8vV2lpK1JJMzF6MDAwcFRpeG5QbnRJdDZYYzRybWEwb3piUDZN?=
 =?utf-8?B?Q3UxQ3BJTjVsakhXbk9MenVRbVZXRWpFMlRzRldrdGFvUlVuL1g1d09yaUly?=
 =?utf-8?B?VGJ0b1QrUmhVakVrMzJIQ05udEl0TFRKeWRXNEwxL0ovVzZDUFJ1T1NTZ3Rj?=
 =?utf-8?B?N3dBWU9ESGVLekF0STVON1krSWlIOFFOSTdJdUJHSDNZTXUySFRMRVVRTFF1?=
 =?utf-8?B?Z1VSVHpXaUlvbFY1L0o0MXorVW5UMnA2L2ZMWTJLLzh6MDUxZGVpTzJxNlBh?=
 =?utf-8?B?QzR2STBhUWd2RUtPWEFzRVdIdTlMUEhsZUFnM3p6a0N5RGwxOUw1SzlMblk2?=
 =?utf-8?B?RmxDdjdpUUxvSFZqSmtLNlhtay9xYVk0QnI3akdYdjc2b2hPU0ZXUDV4SXV3?=
 =?utf-8?B?NG5Id1NZN1FzQXNWY0xhbXEyb0RyLzFxUU9YMk9JWmdmL2pUWGxIUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 763bef9f-a490-41a5-9a67-08de70902801
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 14:55:58.3242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTpqlCE3jIVHyhRSsE2+5zbzkCr4i6ET7iOZeiF1asRVcxD5Shd1ZWnA3T0tiNBNeS6U/zz7Vjdiau8D/Yo6lyGTjkmMQbZy8X5PezGrT2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8443
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:wl@xen.org,m:roger.pau@citrix.com,m:tim@xen.org,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 02963168902
X-Rspamd-Action: no action

On 16/05/2023 8:39 am, Jan Beulich wrote:
> shadow_mode_...(), with the exception of shadow_mode_enabled(), are
> shorthands for shadow_mode_enabled() && paging_mode_...(). While
> potentially useful outside of shadow-internal functions, when we already
> know that we're dealing with a domain in shadow mode, the "paging"
> checks are sufficient and cheaper. While the "shadow" ones commonly
> translate to a MOV/AND/CMP/Jcc sequence, the "paging" ones typically
> resolve to just TEST+Jcc.

That's because shadow_*() are checking a minimum of 2 bits, while most
of the paging_*() ones are only checking a single bit.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

