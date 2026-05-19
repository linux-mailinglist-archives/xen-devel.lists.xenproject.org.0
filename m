Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDW+EJuHDGo1iwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 17:54:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9897F581C8A
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 17:54:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313190.1583417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPMlS-00039e-W8; Tue, 19 May 2026 15:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313190.1583417; Tue, 19 May 2026 15:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPMlS-000374-Sa; Tue, 19 May 2026 15:53:50 +0000
Received: by outflank-mailman (input) for mailman id 1313190;
 Tue, 19 May 2026 15:53:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wPMlR-000367-5Y
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 15:53:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPMlQ-00DGIv-Fq
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 17:53:48 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0c8766-5cb7-0a2a0a5109dd-0a2a4508ebdc-42
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 17:53:48 +0200
Received: from [52.101.43.32]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0c878a-63b5-0a2a45080019-34652b202a60-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 17:53:48 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH4PR03MB7673.namprd03.prod.outlook.com (2603:10b6:610:247::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Tue, 19 May
 2026 15:53:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 15:53:44 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3MJRN8Y8c1TWDOrl+RC1tdi8uUVhQyR9klJoU1dDkzCz/JVuYGMRLdxTnDyU+nN81INhkKBZm7dRfcVxO4LCpXo9o34+ABmxUWnOfWbLWjMlHTVhK/NZX+hsaXp904PuQ8ch1jhZWehRWjBRkmB+V980XsOcgHFKIgk8EX1+e5bLm+OZakn3DnMFR33FVJxl77aMcCCwLFV2hF7Jk9nldtltT+eSYgnAUhCYKAxitmiakvSZRYYEFtrFaZvVcz7zA8K3p/oJ9i0OmFn7tjjh2Vatvn4UtJCffs+kXC+0CRK+mf5GriXCJnTwuzmM0E8t6ZT0/3y6ghPpeoYT1P13g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4PZTOmsO5x5XwKjCIaXiL8ujxE4l9QH+29g6PyH2RQ=;
 b=om998C6BKO/ZHVt7Cir8iQLjoR+QToZCPGgMvIe0PN0ZkSq95eBWP0kn5UKwwn3KMJysZEUJxtFANCvPqT0PXw9gDVZ9PLyOKiMRSqfDiTJ2KfcBPIOSUBYznlCGyoPYEaVJSF1eCsvznW4Dgx6UNUabifv1ytYHBWTA7l0Y6t1xU2/yaT8/SS46qDlcbGT+fIr42TGLWm1P3eC9wMqIDsQU0q9JS/ytcGJLz3qoh7p2BQ/6BFlE0K0clx2iaOi+3uyj5ONLKtODd/KSeGOn8t3Sae8ejU4kN3JgOlsU0Bu749f0zH43Oug89HApkQSCLLkvIKEeTdrfmJBTpxAcug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4PZTOmsO5x5XwKjCIaXiL8ujxE4l9QH+29g6PyH2RQ=;
 b=yL5mMVeMmudUWBaHa1XxBWsRbSNRLO8A3gsI0ieFrq8rtogGYV/xglFd76yY5ltqsxREuJj/5xALgqXzTIeaPUSUZYS3tGsE+Vp99DOupRYNFyzb68itGDHl0PLUV1SYJWCWp/3Js9EbSl8jJJG0x5RJMbLJ4A4XqPYKeeHrHX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fb523146-feca-49b8-b578-8f2f76011937@citrix.com>
Date: Tue, 19 May 2026 16:53:39 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/riscv: fix sstc init to write vstimecmp instead of
 stimecmp
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
References: <1779205126.8631fc262581453bbf619ec5b2062170.19e40e3b9da000f373@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1779205126.8631fc262581453bbf619ec5b2062170.19e40e3b9da000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0536.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH4PR03MB7673:EE_
X-MS-Office365-Filtering-Correlation-Id: 27248d4d-bfd7-4bd5-d688-08deb5bece18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|22082099003|18002099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	r7P+NzRpus1cLjH7hyBl3YG+wqoSNxuz3rvqwd5mW2KxciCmxNsHGSdsQtn6V511d0bIq7mkW5IQIkvIe66OLCDU5Merd5wVrw5sCrNj7JE0+Z1Tn7gecUWHDgiAbVDonm1HDN27JFy/s4Js8aZALDjsZQnizGLY1sw7mgmxSsuTNN3AnE+JkxaTmHSGrVykZ2v8Xz0lmOBluNwSoaqmI5igHVFHENun1tmoViiWJ/jzHQn12198/OQ3VQVuezhgBNAs/N2AgeBCbluOGc3bKegNUQHSoqz7uNiJ9wHb44nbhnREy0DxcLLGItwLf7sa59Z8HaWJevPbKjiqHinq0nghmlYnRtrSPfRXuBUQewZlnAP+LXzvUbL0tSdtxfNTqEbemG0HLEjWv0tcfwzJ9dhTEq+iPqO5NKLWPtxWoJFNmyevwXthaIlNogDoPrDkUpR7GKR/ang4+LemZYBXzhBSPjpy+XnbPMN1geq0X/elTHt1LmYKPf9kXbSMXOrW3tV2trMYkwmj9qk6ThRa5A7V1icSyaDQutpWuJc3K3kUvX7uI8D9n4VTS5ax3mHOzAIvFLhPIV/mJKoWwG97xZMyvLQHQjbnMPLa2Y4K6UwDhdk9Wj2tnFjGrn5PhIP24iUnX1aiAnWHNSq8dUSuuEXyJWfzLDVI1gikFSe0U8DZccdq1vP3RozmTNCjltRC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHpyaDI4QW1oVUJla1FremUwMDZ4UmdHcXJrSXlFT0t3NmJqM3VNdUFabTU2?=
 =?utf-8?B?Y2o0cjN6NXg3d21HSGFrdk1HS1d0aWwwaWVFKzFNUU4yZVhlWmVzL2lGeUkr?=
 =?utf-8?B?NElXS0N2ZFlHMlFIODJDRVA2M0tiRjZVVS8zZFZ5Slo0Y0tsdk1sNDJXMDZT?=
 =?utf-8?B?aHA3N1F2MkNkQ0drZ3VKZDBSOENIRmFibWhCZnZOZTBzeis2WXdHeXV2NVFE?=
 =?utf-8?B?NVdiNU1oN0hUcy9INENKNFlsdEJrRG1KaWlNdHNIQUhJZmd2WVYwb2s3dTFz?=
 =?utf-8?B?UU1DdFJmMjJUR3pDOE5maVAxbkVMY21Ha3hGT2ZLMFdQUnJsTkx4ZUE0aHZk?=
 =?utf-8?B?UFdxTW5SRjViekVDeEZ6cUJ2cmkxRisrcHRBMElPUkNIVnM5OEdFSW9kcTNj?=
 =?utf-8?B?b24wNTlmeGhXeHNHVTZJUmtYOHBmVGJPbTFsNTExb1dldERINlJEalVFeFh3?=
 =?utf-8?B?dVRyNFBHc2I1akdLNlNselhWaDJqaHFzeWtMNGVjUlUybEU3YzRvTUFlQVBi?=
 =?utf-8?B?cHl2L1BaZXVKZDlQUW5PVUVPNFVTSFFmM051MFAzQUhlN3N5b1l4dlFiWW1B?=
 =?utf-8?B?OEtvOE1abitXQytTUzRkVjRINnRZWU8ybVNVNDYwa1NNdHcwekZpOXNPUU5E?=
 =?utf-8?B?UVBnRDliVkd4YklzY0V5SFpQaFEyT2FCL3Vsbm9oRkRGMkZPMDRwQkxzZEtq?=
 =?utf-8?B?MGhyY0x0L2lGTm02T1NSVG5sL3ZpSHB6U2gxdlRkd29nTUNiY0k1WjVBT2I4?=
 =?utf-8?B?N2hGYmNINmtwL0laaytTTDQwSTFrMVdCc0U4YklhWTMrQk9rdTc2d1h4dHBq?=
 =?utf-8?B?dG52aWRwM0hUaEVBZ3pNZVFGcVhlUllmbCtLK1hYSGNkUFZnTWFYc3NVYyt0?=
 =?utf-8?B?MkJsc1h6NkhmSVdJcnFBUHpyRFE5ZGZqVXNVTTRTRVVqK1ZUa1FObFlZSEMv?=
 =?utf-8?B?Qm56U3dhREcrTlVIRGtpQTFQc3ZTR1NXOGxReTcyQm5TcDVEcTJDQ00wSkJM?=
 =?utf-8?B?N1ZFbG1VQW1ONTRBRHBlQ3gyTDJLdlpmRGRWSEFQcU5MQjVHaGt0U0szdFdO?=
 =?utf-8?B?NWgraVB4WGI2UDhIUVViVDRLM0dyNk1CZGNVMnJWQlE1VVRETEJZeksyRllU?=
 =?utf-8?B?R3JpWkl3RTFiWW02RGJ6NTJzY0MxeTF5QmhBK25Oa05hYUFoK2VtU2tKY0xU?=
 =?utf-8?B?d0RDV2FKeDJvZmhoRTFuTjVqSUhLZFUyZFdaKzI3ZWpWMUx4NzM5MEgraVBt?=
 =?utf-8?B?SnVmSEcwbDM5cWo3TVovVkNyNDVMZ0lrQVh4QXdEWUZiYjIyZUR1MnloVktI?=
 =?utf-8?B?VXVDaitEYkJoUEMzN3Y0Y3V5WnJibndvRVRoTDhoNS9sa2R3U2xvTXlrWmhS?=
 =?utf-8?B?WlkyWUVFVHZkdEg1aU1iRkhsN2JyQW9uYWRDNnd3clN1UnZuWjRZeEdDWHJQ?=
 =?utf-8?B?VDEwdWZlTHh5NzZBTU52ZHdyckRLYzF5RkI3ODlpeEZMSFVDaFBrdmx5Nyt2?=
 =?utf-8?B?KzdFZVVXWFhzTmpJUDVaR3NLeVc2OE1NV01VekdIM1g0c1c1ZFNCeVA3djBm?=
 =?utf-8?B?R0lheExEbFVLcmxuQUFxNVlOaGVkUXRhclY5SnFhS1BucGdLaWVZOVVoZGt3?=
 =?utf-8?B?Y09tRy92RmV1ZktQeGdLek1KZG53RERZYmRlM0FOQnFlZzdLUjJMVXBxNEZw?=
 =?utf-8?B?VTVtQ0V2dDViWnJ5ejhMMUdnTDQzSmdPNG1jRGR3Vk54RlZIdk91Z1hkd0tF?=
 =?utf-8?B?OS9BVVdyUzhPeUV6NHducStUMzhzQjhreFJrZjNEdUxuUkR5cnNraVV3cmd6?=
 =?utf-8?B?RUUycjhFRTlob1hObUtoeXdFY2pNZm1VTnhkUnNOLzJSRytBMVA1c0E3blQv?=
 =?utf-8?B?QSs5S1RrTnlTSnhWVCtqa2g0bDdPci8rdmNyL2NUbDZ0RGVEOTNnUHU2MVcy?=
 =?utf-8?B?S3A5Q1hySCtOTmJwTUFCWDI5OTFNYnRRR1lKNHYxNklENmNERFNwaWtSaldC?=
 =?utf-8?B?OTZwVG55aWY4NjVXMjdjTEFTREtlc3IxZFN3dVN0a2tuTGxuLzJEd0lnYi9a?=
 =?utf-8?B?MWpLUER2ZTBzM1NIV0dPTEgzMWRrVFlBcCs3alZoUm8rejFySWVldU1UWmFG?=
 =?utf-8?B?NWcxdUtLWnQ4NEhLLzNmRVp6QXQ2ejIvSy9GNERWSzA1d2lzNDFmSkVYREZx?=
 =?utf-8?B?U0Y0UGRuTllqdm95V2JWSXBuOTIzalc0Rk1URW1INU9vTnpIQ1dVcnlGUWMv?=
 =?utf-8?B?S2ZuRzZzNStkSzQwTGx0UDRKV0MvbG5oalUvV01PT0RDWkR2OTRCeCtXZmhD?=
 =?utf-8?B?STR5RnVCUm9FcHdyVmtLb3R0QkpabHhQT3FzUGt2Ry9JZVVEMmd2NElnN3BW?=
 =?utf-8?Q?EVdWZCoyycBmgzmU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27248d4d-bfd7-4bd5-d688-08deb5bece18
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 15:53:44.0251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TaM6xhnTpkc4TmAby4yc4drz7RM/KO5NZmtbgPHLgx57uUg7CC0ApAu9MBwJghOiNA5B7qxOo1uBPT54pnpkGI0xMf8x6mntGXeL1C15WFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7673
X-purgate-ID: tlsNG-c1860d/1779206028-C5585DB1-929FA83A/0/0
X-purgate-type: clean
X-purgate-size: 1273
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,vates.tech:email];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:baptiste.le-duc@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[citrix.com,wdc.com,gmail.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9897F581C8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 4:38 pm, Baptiste Le Duc wrote:
> Commit <25e03273069036f5b46e14bbdf396ac79805d07e> mistakenly wrote to
> CSR_STIMECMP during sstc initialization instead of CSR_VSTIMECMP.

Thankyou for the patch.  We have a standard pattern for referring to
other commits.

For the referencing things in the main text, you want to write it as:

Commit 25e032730690 ("xen/riscv: allow Xen to use SSTC while hiding it
from guests") mistakenly ...

Specifically, git log --abbrev=12 --pretty=format:'commit %h ("%s") and
adjust the capitalisation as necessary.

> CSR_VSTIMECMP is the VS-level timer comparator: the hardware fires a
> VS-timer interrupt whenever (time + htimedelta) >= vstimecmp. Writing
> to CSR_STIMECMP leaves CSR_VSTIMECMP uninitialized, so its reset value
> may immediately satisfy this condition, generating spurious VS-timer
> interrupts before any guest has programmed the timer.
>
> Fix this by writing the ULONG_MAX value to CSR_VSTIMECMP as intended.

For bugfixes, we also have an explicit tag here just above you SoB

Fixes: 25e032730690 ("xen/riscv: allow Xen to use SSTC while hiding it
from guests")

This helps us identify patches for backport.

> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>



