Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHr8AwT1iWkaFAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:53:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE1F1112C2
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:53:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225536.1532058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSdj-0008EF-D5; Mon, 09 Feb 2026 14:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225536.1532058; Mon, 09 Feb 2026 14:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSdj-0008Cm-AR; Mon, 09 Feb 2026 14:53:27 +0000
Received: by outflank-mailman (input) for mailman id 1225536;
 Mon, 09 Feb 2026 14:53:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r8oy=AN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vpSdh-0008Cg-3n
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 14:53:25 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 153bdf1c-05c7-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 15:53:24 +0100 (CET)
Received: from AS4P251CA0013.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::18)
 by AM9PR08MB5873.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Mon, 9 Feb
 2026 14:53:21 +0000
Received: from AM2PEPF0001C710.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::f7) by AS4P251CA0013.outlook.office365.com
 (2603:10a6:20b:5d2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 14:53:22 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C710.mail.protection.outlook.com (10.167.16.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Mon, 9 Feb 2026 14:53:20 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AMDPR08MB11632.eurprd08.prod.outlook.com (2603:10a6:20b:73c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 14:52:18 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 14:52:18 +0000
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
X-Inumbo-ID: 153bdf1c-05c7-11f1-b162-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=llJJYWm2Tw9RcNrASWm8yzXB4Kj8rpHYQxeVXYw2Y9OpuosTMwoU94OSZCddqvgfpZEZ4l4lGpQwIP1St+jW0aQJNhvmZXSdIA3/5n/Gjn34RqDMOujmgqCPHhPWDpzCRnCXwZk2C7gQwljPNQFjwG1n3/rs5BF/IBgDqdayjGU2m4qlr4oiLbyytmjqIZKvOaf1verd+zFfNmqMsbFtFgTN0ZCxHYIAPAlRfoGzC8RGqbV6pdfTUIn3BOiq00W9akCE86S7C4DvTDIR4bCCK9N7C9Hw4FdLRfcIlokAwt69zJyRSEjBziW8UbSNneYX5PupYz3mRDSOiTOf8bQExg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bncAFYil/8wXfT0rxSwLbXinxYk0UcGOWfrBur3+V9c=;
 b=heBzrv+0NO5hyUGTkPnWQ6mGDMcdATnGVFYPkzxGJycK/1WNNlg6W0gEd1ZrOEVq9AzNcdnYiRniGXA0vNuiB3zp/edgeP3P7RvtSEPETAdgMHhPEjqS84ZwGsnyc0b6odgRiwcrntnz6ofDlDhBQ02QkhgbmM+NuWI0uhnWz55JXmHqZ5CYXr22q6w1X7V4Qr/hWYrj1LfIFW5TiMP9iGUWlE1QzPCszHzrpL8nTbUpajXl7w/k7QGndqIfFwVMzXsgtZfVfqd9KxgPqH6BZFloUiqh4csBHG+9Pp6LxR0Zq5kkJ3e1HU9U8SBPSpvkSVYfkK97auY/ET6Yus+WgQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bncAFYil/8wXfT0rxSwLbXinxYk0UcGOWfrBur3+V9c=;
 b=e0JAnJujp4onQWznQdUHKePC+GjvmVfbAfgswIhz81gkuAIGZaVN25mUSXnwfcdc9ydo6EZZdl9LTolRC7784OjIxc5abuHG0/CU1Qzc88JHDnpqDSYgvgHRV3ic52yCsF9cMr4N8Ko79M+9/ucu6kZDouf6w9f3jEmvWUSle5M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYU1ZGUzpS0nJri9cecvtwlAGpkDnJ/GxJUW0AbBUPyxp9s7iHFZSYtPAOKRyv4VvpcVEl72oB5/sle/XRZH2Jt3T3pciqfzXX0ip+AZgarckk68+vkHxJWYu6vm05x7ruyThP68psM37uCFAmU4l7nn+BzrJBnsqRsg56qYtfjrROwOzVsPjwC6NXTMrhOGSmY2A5Xo1XcNeCiGJkfO+4o2v1FOTGikUOBj5/XfmXy5e8Rhqwe2ToRrHVIi8IyH1hiV+QTSlKG3kPbq0pM2jkltVsR9w3CXc86TLlzM0x8I5zBV8HLf82AYsM0yeG/FPgSHY0tfCoSODVa+rfK94g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bncAFYil/8wXfT0rxSwLbXinxYk0UcGOWfrBur3+V9c=;
 b=hD7f3u5PV7k3Rt/eaOoUBiG5GWwlY9fCCZD0GUMxqs/b0D5gE44HLaX4s2nzla3kFRd6URht0h+slM2+T7OKKcy46UkCXMbZZlxJWTk5cS5uj5FcIKHmsdjv2Wiyw6kxgKmsQtjWy3f+UFBtvYqnlUt0SUt2gEazBUvnOcDMMwx4HbPCR+97Ya3vPskatrNElH4kLBV+G21r0rvTAysb/Fyw6M8rwibWr3iFHJpyIdYw1dprQrTWAx/ZGq4zFKnU46OgUQKSD3f1rlnbqc1CVTsMuzo8ZNbZuPLIfzuQlTRRpG6cy/9OOhVb2dDpQK7+kad1A99BXEGrHGpbm8yiaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bncAFYil/8wXfT0rxSwLbXinxYk0UcGOWfrBur3+V9c=;
 b=e0JAnJujp4onQWznQdUHKePC+GjvmVfbAfgswIhz81gkuAIGZaVN25mUSXnwfcdc9ydo6EZZdl9LTolRC7784OjIxc5abuHG0/CU1Qzc88JHDnpqDSYgvgHRV3ic52yCsF9cMr4N8Ko79M+9/ucu6kZDouf6w9f3jEmvWUSle5M=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 05/12] xen/arm: ffa: Fix PARTINFO RX release errors
Thread-Topic: [PATCH 05/12] xen/arm: ffa: Fix PARTINFO RX release errors
Thread-Index: AQHclTP+kXTEyTENq0yz84jX28uc2LV6dT2AgAAHrgA=
Date: Mon, 9 Feb 2026 14:52:18 +0000
Message-ID: <8A90931C-7DB3-49BF-AF94-ECCE7B2C5FF6@arm.com>
References: <cover.1770115301.git.bertrand.marquis@arm.com>
 <2cb24d49d7c72bf15a101cc3be62b3cccbfce3d5.1770115302.git.bertrand.marquis@arm.com>
 <CAHUa44G7ThfytBBQ=1DRju1z6DY_s+gbndNZOHLCUwf66V+Umg@mail.gmail.com>
In-Reply-To:
 <CAHUa44G7ThfytBBQ=1DRju1z6DY_s+gbndNZOHLCUwf66V+Umg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AMDPR08MB11632:EE_|AM2PEPF0001C710:EE_|AM9PR08MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f43693-c7df-430b-9f99-08de67eaf7ac
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?c0RwTHk3NjdMS09HRHRPL09nYXE4azBRMmwwZ1lIbnhjcElxcm1zVnRTMTBo?=
 =?utf-8?B?aWtPdVU5VVUrNVNaVlM4Yktzd0tYRXNHTkpqd1RlT01MRFRqQXcreTd0S01h?=
 =?utf-8?B?eUMyMEZEMk1nRllnLytVZXBaVE44SERMdzUrZUZkTlpBc2FSbHVtd3VuMVZr?=
 =?utf-8?B?bUJ4ZlNWK0kvUkFIbFBDcTNGU2Q5YUlkQUVYMklqT3ZjTXNWYTkyRm8xNmdh?=
 =?utf-8?B?TWF4MkhhMDVGeFhVT2JKNDVuMTNoWXlHQ25OcDFRR0pEU1FHdksvK29sRHk1?=
 =?utf-8?B?YzFpRDhmVzg2YjgyVGkvcDhaVkJpd0F2T3NmU2lhd0xoUUJvdFBRZFBGQk4w?=
 =?utf-8?B?ditlZHpjVERYbDNEUWZJUGNrQ2pGVWgrcHFHQTdRZG9vK0FhTFRhcDFJZi9j?=
 =?utf-8?B?WENucnFlcWUvT1kxeURtQU85blp6c2h4cC9ndmN3YWJwT2xyNXpuTk56bUly?=
 =?utf-8?B?VGlzdjduTnVpcGV1a2oxRzRPendXckV2OFR5emlQdVNiMDdhSVEyKytIZHVz?=
 =?utf-8?B?azYvUk0vZVNQZE5wWGR4QWNycEk1YTJvTHAyQ2tQNU5iNUxqdnBLMWFxeG8v?=
 =?utf-8?B?TmNRREcvZUM5d3hGS1o5d3lsZm1KL1RncmVHZGl2akU5eU9aRnRnSGwvSXY4?=
 =?utf-8?B?UTkxalo0U3dMaFlyYmFDVi8rbmhoTnk1U0VSSnlVYm8rWXMzYm5Oa2dkZW5P?=
 =?utf-8?B?TmhzeVdPUlJQQ0haSTh2d09reVU1NkZDSm9QMkJxaEJBRDBnRXVJcGNYUnFo?=
 =?utf-8?B?RUxiaEtNbUtVRkFuMHFNZWM5bzl0dWkyZ0x5aVppeUFRSkxuWm5KaFY4UThz?=
 =?utf-8?B?QlgwK1RwVFI1UG9RQlhhMitFNWd1N0RVbVNENE5JWlYyMnE4d21rL2lJcmsy?=
 =?utf-8?B?a1JUU1cwWEhuUHI5eThNck5PZ2VhbDhxWWxIbmV1OTZDbTh6M0hONHZ2VXVL?=
 =?utf-8?B?VWZURFRFLy9MR0drQnEwZHc2a25ZOUlUWXZ4bDhUZ3FPU2puN0sxS2RueDZE?=
 =?utf-8?B?ZWlKZVhYblkvMzh5c3ZxVk4yYXMvN05CeWZseTBqL2NyTWZ5SDdKYUNKQXhS?=
 =?utf-8?B?MjdEMWRUSkVCd044M3pKRkMxVDgvRk1UMXFnMXd2VHdnd1h2NWQ1ZUhVaWVx?=
 =?utf-8?B?dHdwQktybnA5Y09GZkxxaWR6aTZHT2FvWkVqSjFvcy9XOEd0VFJEQlQwdWpk?=
 =?utf-8?B?ZzA0SmhkanRMcG9VU0pZU0MwVS9PYVZvaytCY0Y5dG9vT1ZjL1ExdmFYTW5m?=
 =?utf-8?B?TTNydEdubjFrZFAreERaMkoyUm0zQjZUVklUSnZ2VlZSc0l4b0o5R3BzS2sx?=
 =?utf-8?B?V2F4NnVJaStwZzM3Y3pqdzhXSEhtOEhIR1M4b015dkc0RWcxbE5OcUUyYnRy?=
 =?utf-8?B?WGpSM2xrS2hlM3RzcXlidVpXdlpXYTN5dSt4VzFCVVZZUWhoYTVqTExGUkJI?=
 =?utf-8?B?Q2NaRTNQdU80RW8zSWc1WjlmQWUzT0dVd3AvbWJ4YW82a25DQnhSWEtsVkdt?=
 =?utf-8?B?OXdZQ0ZCN3I4aDFqMGloaUMyQ25yejQ3aEM4ZjJaMWNuTi8wYkhRSkUrV3Zz?=
 =?utf-8?B?TjhVKzFwaGZtU1JVeFVUWU96a0w5RXl3Vm13eWtIQ0NFQ0pBQXU4V3JYV1Az?=
 =?utf-8?B?b2k5dm5Od29hNVhKQVU3WUV6MmFDdVlORG1ySkFrclRZcEphTy9uOGFEOGJ5?=
 =?utf-8?B?SWJwcS9sZStOLzdsclZrNStIcW9Yb1BxM0w3OWhBaWJjSEF0a29pTmdMMzNl?=
 =?utf-8?B?Kys5V2Q0OEE5OHNueHVhbE10NFNGVFNiOXpzc1Z2Uk1iVGlhNFVBUkRJRkVM?=
 =?utf-8?B?OGpmemZSOE4yWDZyMEtvbFFSUzhFV0c5NnFiRW5paVpYWHltc040cG12d2ZR?=
 =?utf-8?B?N1FmMlpkRmpRSVlyQjNhTWJmRERjSjlpMG1BaEYrTXpWcVpZRU9CSlJOSkhn?=
 =?utf-8?B?OUFGbVNmVmRGTUVjdjBpanI4UjkwTDlDajZNUGdFZlVtTzNrVkpUSHErS2hM?=
 =?utf-8?B?YmlHWVZZYmphN2Z2aDMzUlo1dFlqV0Z2QUw3RTc3WU1nSXdYZWxjYU1nRjll?=
 =?utf-8?B?bnVRalJCT0VGZnJpeDFxU09NMHpsTy91QXJCa2loQ0FuZWZCbTUvUTl3ZlVS?=
 =?utf-8?B?N1BwMmtDY1FPVnNmdHhpc1c4R1VvK0Znb3VHWDVaTWE1N0ZHbGhoS1hXaTND?=
 =?utf-8?Q?PMwG9oFYj6Ey4gM34Z9kl7c=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <79D3F99E0D21D3499F8FBDAB9E787F1D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11632
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c4ef5aac-fa71-4bd4-06e0-08de67ead281
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|82310400026|376014|1800799024|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WmEydm9FZzNjcytaOHBZM1c3ek1vdVFnR3FqcnhaUDgrZ1RXOXlQb09uOENS?=
 =?utf-8?B?ME8xcjRTUDZ5am9TNGMySjlWbHNITk9rbmsvSm9OOGdZTzEzeHlYaUlsVWo0?=
 =?utf-8?B?VEpSUzhCSENQYVB4ei9Ob1BlT3E3TXFlUkRybjBQUXZtcTlKV2x6NTlZOWNN?=
 =?utf-8?B?VVJjRGdlZ0ZVb2tKUHduU1pyOXVCM1lSdFZUTHRLZ0QvTDMwR0lzN1FKUjhw?=
 =?utf-8?B?UWxaYnViZ2Z4ZHFLbXJUNnVoTDR2Y0xxT1RSc3I1ejJqdExqcGltdVZNbDBw?=
 =?utf-8?B?ajVZdG1JOE5ma3V4VmRlRkQ5YStFbVhwWFMzdVFXTGswcTFxeWhxMG5Fc2lS?=
 =?utf-8?B?U2ViWkhXSGE3MzJkWktFV2xXK3Yvam1iMmlDQnVjZzdUbThKV0FXdG13ZlF0?=
 =?utf-8?B?eHFxSjlteFhLNEI5MzErbVQ4RG56bUR1YWJRcU1aN1BpOFVpREI1cE45NmZ0?=
 =?utf-8?B?eCtobndBcTEwMy9oZFJMVFFyTVJCWjNNM3NGZ0Y3NUtwRmxsV3J3V3ZzRUQr?=
 =?utf-8?B?VC9EcWVFOVl2dmFBWk1kS2FKYmczZy9na1JzZWZpcm9SN3p6d2VKSXBYb3hl?=
 =?utf-8?B?UStBWUdaTkFlZTkzUWQ3SEpXNk92U2N5dGdNVno3c2xjNm5zUWpTVkNucThY?=
 =?utf-8?B?dzMyU2JHZHdTQ2ZzM2t6d2JSOU40K0VyYXY1R3F2UXlZNENqOFpLd215cFAx?=
 =?utf-8?B?RkI5YW4yWVphdjNoRlJRalI5VFBjb1hMNmFvZkkzakJYTnNjclBJTE03emRa?=
 =?utf-8?B?RDhpWnVSd2thdnhOZkcrVGExelZnSVVWcXNUbktSUWtkU0dBd0l3N0U5NFlz?=
 =?utf-8?B?blhFV1JwdW1JMUM1TitFVVprSkxEbm9mMmUwdXlPMnlsMlBVQloxUHJYNEpp?=
 =?utf-8?B?VWNhTkRRRkhSTmJFRjk2L0xCVWl5RVNTYmhyQzJ2QzBMeU51bC9QZ1lqTGNm?=
 =?utf-8?B?NllCZXVBZEo4bGZtSTVsL2h1a0ZBMTltVzE4ZVpkZHZDUnhhWWZWYnBNYXRQ?=
 =?utf-8?B?c1JoVVp6U0c1aWtZQTlrSlBNUjdGcjRtTHQ2ekpZczNsSUdxWk9JaHhzRHFk?=
 =?utf-8?B?RUhQYThDbld1MW1za3p2dVZyMnFkYzQ4Vk9hUzUxc2hsMC96V2Vtak5YUWcw?=
 =?utf-8?B?SUhxRmhVRDdFb0ZqQkhLSVpSdjcrNisrYklBTnZnVWxRbnhYbTVPODhkRXlI?=
 =?utf-8?B?TUZaaGFWVXJTalQzTlQ0QmNEak1PcGQwRFNlam1jODVNdGF0a1ZUMGt6dW9O?=
 =?utf-8?B?djRGby83TjllQ3MzNEZ5OW5qbWw4QkRocENVRFIwRXBueWJEL0xHTFFIcU1Z?=
 =?utf-8?B?SUM3SVlXOWlRZzRibDVQWWZIRjRycE9DeEl1emZ5ODRtdFdWRXd4cUttU3ZK?=
 =?utf-8?B?REVyblpVb2tHQk8wTFF0cGthQlJPQTE2cGlpUEw1djJiYi92RmVoK1JhTitC?=
 =?utf-8?B?NVFTOWVTMXVzeGdCendENGJHNGR4YkFWU0gvSVh3YnJ4M0JuR2piTFljcHRq?=
 =?utf-8?B?Mkd6NjFnOUdSNWlxZnhBY0p6ZTZUTnlGODFyTFBvUUZrQU81U0hnS0NhTmhJ?=
 =?utf-8?B?ZGh3Y2NGZ2pmMEU1cndsTldpazQ3WkNMdXVuMzM4bW03eUVFQXQ4U3h4NWI4?=
 =?utf-8?B?WTd5SXlXRnpGb2xqZTY4Y0ZyaXNEZW84dG83SWhsQjA5T3RqZGs1aFNvS2Jj?=
 =?utf-8?B?aFJJV0dVekxSYmpLWjZleStqbXEzWDRzazRYekdBR2NtTlBReEp1NWlIU01Q?=
 =?utf-8?B?ZmlsNUVRV3JOK0ZTem5VZHpuUGxHMDdhODRzSWVzNmtCNG5Zd3o2ZUFTRWVh?=
 =?utf-8?B?N2NibXpHODUxSTVoMU9oNXhDMVlycDBOUGUrQ1RZNjB0djRBMEpSdWU0SWlP?=
 =?utf-8?B?dUdkZ0orN2dEaENSVUJCK214Vm9aeGtDYy9pMVVjS2hVMjNYd1dqcFIvd3N5?=
 =?utf-8?B?OWV2Q3dudTZHYlIzS0ozVFQrSGNYRk1MUERZS1FhOW9JbXNwMktxb09WWFIr?=
 =?utf-8?B?bzU2dzh3TncxMENTYks4K1I2S1hLL2cycURuZ0V2WVhLQ0FtR2Q4bkErRERz?=
 =?utf-8?B?ZXRuNUVtNWhFUHBjR0h2aTMvREQ2dnp0UHFoaUQ3cjh1QXpSbVVPcUQwOXM3?=
 =?utf-8?B?ZzNtNkd2b0tXQnRZYkRmNldrUHZaWHd5OHYrcnFwanAwcHhnS3hicGtNQzR3?=
 =?utf-8?B?VGFQSUdtL0lnUXlFeXZZUThCcXBDK0xSUVlWREU3dEtZbzVHRzRiM2NuNWhw?=
 =?utf-8?B?U0FTdXhpT2JhL2hTb2NvTW9Ca1pRPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(82310400026)(376014)(1800799024)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZAPUc+Beb/dTQbZmen4v8pW/CVgLRSotGaGlz05vEY63LwkYXqzQXlTvc2XJyTyEzbWufYM34glQb6qydVrc7r2nuLbP5oj3dTF1oVGm2DPsodfc4IW9yZ9C3RtjArdgAnZdE96h5N1pYwWO+Ta84oYSx6sSm2InTI9BztVD76FUQuigQDiHWkm6e7Qvu+nUCQCXBBNpGiWxSJENSGvQKir/dgHylgCAQPZ/hf1944tCCmgGkLmUsaAcsfDjt20kga7Dv9TETYhF1sbw4cqKjeAhlLhfL4SU+bPVydde6zUZlzNfUwTvLiHp1+4K03/9LIuB3Q9qnbQ6Skc2C1tblZZdmhCvgaLkNo6ulpApa358dJBV0ISom/4vkaUB0VBmnj7mAY/j9XyIRgBZfnyUDpotqXo/3HUjzIwauMNgXr/AReeafktXKgGtNoMgxwva
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 14:53:20.7563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f43693-c7df-430b-9f99-08de67eaf7ac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5873
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,linaro.org:email,arm.com:mid,arm.com:dkim,arm.com:email];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 3AE1F1112C2
X-Rspamd-Action: no action

SGkgSmVucywNCg0KPiBPbiA5IEZlYiAyMDI2LCBhdCAxNToyNCwgSmVucyBXaWtsYW5kZXIgPGpl
bnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gSGkgQmVydHJhbmQsDQo+IA0K
PiBPbiBUdWUsIEZlYiAzLCAyMDI2IGF0IDY6MzjigK9QTSBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxi
ZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBPbiBQQVJUSVRJT05fSU5G
T19HRVQgZXJyb3IgcGF0aHMsIFhlbiB1bmNvbmRpdGlvbmFsbHkgY2FsbGVkDQo+PiBGRkFfUlhf
UkVMRUFTRSBmb3IgdGhlIFNQTUMgUlggYnVmZmVyLiBJZiB0aGUgU1BNQyBkaWRuJ3QgZ3JhbnQg
UlgNCj4+IG93bmVyc2hpcCAoaS5lLiwgdGhlIGNhbGwgZmFpbGVkIGVhcmx5KSwgdGhpcyBpc3N1
ZXMgYSBzcHVyaW91cyByZWxlYXNlDQo+PiB0aGF0IHJldHVybnMgREVOSUVEIGFuZCBwcm9kdWNl
cyB3YXJuaW5ncy4NCj4+IA0KPj4gTW9kaWZ5IGZmYV9yeHR4X3NwbWNfcnhfcmVsZWFzZSgpIHRv
IHJldHVybiB0aGUgcmVsZWFzZSBzdGF0dXMgYW5kIGxldA0KPj4gY2FsbGVycyBjaG9vc2Ugd2hl
dGhlciB0byBsb2cgaXQuIE9ubHkgaXNzdWUgRkZBX1JYX1JFTEVBU0UgYWZ0ZXIgYQ0KPj4gc3Vj
Y2Vzc2Z1bCBQQVJUSU5GTyBTTUMsIHdoaWxlIGFsd2F5cyByZWxlYXNpbmcgdGhlIGxvY2FsIFJY
IGxvY2sgdG8NCj4+IGF2b2lkIGRlYWRsb2Nrcy4NCj4+IA0KPj4gVXBkYXRlIGhhbmRsZV9wYXJ0
aXRpb25faW5mb19nZXQoKSB0byBvbmx5IHJlbGVhc2UgdGhlIFNQTUMgUlggYnVmZmVyDQo+PiBh
ZnRlciBzdWNjZXNzZnVsIGZ3X3JldCBjaGVja3MsIGFuZCBpZ25vcmUgcmVsZWFzZSBlcnJvcnMg
ZHVyaW5nIHRoZQ0KPj4gZXJyb3IgcGF0aC4NCj4+IA0KPj4gRnVuY3Rpb25hbCBpbXBhY3Q6IGVs
aW1pbmF0ZXMgc3B1cmlvdXMgRkZBX1JYX1JFTEVBU0UgY2FsbHMgYW5kDQo+PiBhc3NvY2lhdGVk
IERFTklFRCB3YXJuaW5ncyB3aGVuIFBBUlRJVElPTl9JTkZPX0dFVCBmYWlscyBiZWZvcmUNCj4+
IG9idGFpbmluZyBTUE1DIFJYIGJ1ZmZlciBvd25lcnNoaXAuDQo+PiANCj4+IFNpZ25lZC1vZmYt
Ynk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+IC0tLQ0K
Pj4geGVuL2FyY2gvYXJtL3RlZS9mZmFfcGFydGluZm8uYyB8IDE0ICsrKysrKysrKysrKy0tDQo+
PiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYV9wcml2YXRlLmggIHwgIDIgKy0NCj4+IHhlbi9hcmNoL2Fy
bS90ZWUvZmZhX3J4dHguYyAgICAgfCAxNCArKysrKysrKystLS0tLQ0KPj4gMyBmaWxlcyBjaGFu
Z2VkLCAyMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfcGFydGluZm8uYyBiL3hlbi9hcmNoL2FybS90ZWUvZmZh
X3BhcnRpbmZvLmMNCj4+IGluZGV4IGJmOTA2ZWQwYzg4Zi4uNmIwMWM0YWJlOTE1IDEwMDY0NA0K
Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfcGFydGluZm8uYw0KPj4gKysrIGIveGVuL2Fy
Y2gvYXJtL3RlZS9mZmFfcGFydGluZm8uYw0KPj4gQEAgLTkyLDkgKzkyLDExIEBAIHN0YXRpYyBp
bnQzMl90IGZmYV9nZXRfc3BfcGFydGluZm8oc3RydWN0IGZmYV91dWlkIHV1aWQsIHVpbnQzMl90
ICpzcF9jb3VudCwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMy
X3QgZHN0X3NpemUpDQo+PiB7DQo+PiAgICAgaW50MzJfdCByZXQ7DQo+PiArICAgIGludDMyX3Qg
cmVsZWFzZV9yZXQ7DQo+PiAgICAgdWludDMyX3Qgc3JjX3NpemUsIHJlYWxfc3BfY291bnQ7DQo+
PiAgICAgdm9pZCAqc3JjX2J1ZjsNCj4+ICAgICB1aW50MzJfdCBjb3VudCA9IDA7DQo+PiArICAg
IGJvb2wgc3BtY19vayA9IGZhbHNlOw0KPiANCj4gV291bGRuJ3Qgbm90aWZ5X2Z3IGJlIGNsZWFy
ZXIsIGFuZCB0aGUgc2FtZSBpbiBmZmFfcGFydGluZm9faW5pdCgpPw0KDQpZZXMgdGhhdCB3b3Vs
ZCBtYWtlIG1vcmUgc2Vuc2UuDQpJIHdpbGwgcmVuYW1lIHNwbWNfb2sgdG8gbm90aWZ5X2Z3IGlu
IHYyLg0KDQo+IA0KPiBFaXRoZXIgd2F5LCBwbGVhc2UgYWRkOg0KPiBSZXZpZXdlZC1ieTogSmVu
cyBXaWtsYW5kZXIgPGplbnMud2lrbGFuZGVyQGxpbmFyby5vcmc+DQoNClRoYW5rcw0KDQpDaGVl
cnMNCkJlcnRyYW5kDQoNCj4gDQo+IENoZWVycywNCj4gSmVucw0KPiANCj4+IA0KPj4gICAgIC8q
IFdlIG5lZWQgdG8gdXNlIHRoZSBSWCBidWZmZXIgdG8gcmVjZWl2ZSB0aGUgbGlzdCAqLw0KPj4g
ICAgIHNyY19idWYgPSBmZmFfcnh0eF9zcG1jX3J4X2FjcXVpcmUoKTsNCj4+IEBAIC0xMDQsNiAr
MTA2LDcgQEAgc3RhdGljIGludDMyX3QgZmZhX2dldF9zcF9wYXJ0aW5mbyhzdHJ1Y3QgZmZhX3V1
aWQgdXVpZCwgdWludDMyX3QgKnNwX2NvdW50LA0KPj4gICAgIHJldCA9IGZmYV9wYXJ0aXRpb25f
aW5mb19nZXQodXVpZCwgMCwgJnJlYWxfc3BfY291bnQsICZzcmNfc2l6ZSk7DQo+PiAgICAgaWYg
KCByZXQgKQ0KPj4gICAgICAgICBnb3RvIG91dDsNCj4+ICsgICAgc3BtY19vayA9IHRydWU7DQo+
PiANCj4+ICAgICAvKiBWYWxpZGF0ZSB0aGUgc3JjX3NpemUgd2UgZ290ICovDQo+PiAgICAgaWYg
KCBzcmNfc2l6ZSA8IHNpemVvZihzdHJ1Y3QgZmZhX3BhcnRpdGlvbl9pbmZvXzFfMCkgfHwNCj4+
IEBAIC0xNTcsNyArMTYwLDEwIEBAIHN0YXRpYyBpbnQzMl90IGZmYV9nZXRfc3BfcGFydGluZm8o
c3RydWN0IGZmYV91dWlkIHV1aWQsIHVpbnQzMl90ICpzcF9jb3VudCwNCj4+ICAgICAqc3BfY291
bnQgPSBjb3VudDsNCj4+IA0KPj4gb3V0Og0KPj4gLSAgICBmZmFfcnh0eF9zcG1jX3J4X3JlbGVh
c2UoKTsNCj4+ICsgICAgcmVsZWFzZV9yZXQgPSBmZmFfcnh0eF9zcG1jX3J4X3JlbGVhc2Uoc3Bt
Y19vayk7DQo+PiArICAgIGlmICggcmVsZWFzZV9yZXQgKQ0KPj4gKyAgICAgICAgZ3ByaW50ayhY
RU5MT0dfV0FSTklORywNCj4+ICsgICAgICAgICAgICAgICAgImZmYTogRXJyb3IgcmVsZWFzaW5n
IFNQTUMgUlggYnVmZmVyOiAlZFxuIiwgcmVsZWFzZV9yZXQpOw0KPj4gICAgIHJldHVybiByZXQ7
DQo+PiB9DQo+PiANCj4+IEBAIC01MDcsNiArNTEzLDcgQEAgYm9vbCBmZmFfcGFydGluZm9faW5p
dCh2b2lkKQ0KPj4gICAgIGludDMyX3QgZTsNCj4+ICAgICB2b2lkICpzcG1jX3J4Ow0KPj4gICAg
IHN0cnVjdCBmZmFfdXVpZCBuaWxfdXVpZCA9IHsgLnZhbCA9IHsgMFVMTCwgMFVMTCB9IH07DQo+
PiArICAgIGJvb2wgc3BtY19vayA9IGZhbHNlOw0KPj4gDQo+PiAgICAgaWYgKCAhZmZhX2Z3X3N1
cHBvcnRzX2ZpZChGRkFfUEFSVElUSU9OX0lORk9fR0VUKSB8fA0KPj4gICAgICAgICAgIWZmYV9m
d19zdXBwb3J0c19maWQoRkZBX01TR19TRU5EX0RJUkVDVF9SRVFfMzIpKQ0KPj4gQEAgLTUyMiw2
ICs1MjksNyBAQCBib29sIGZmYV9wYXJ0aW5mb19pbml0KHZvaWQpDQo+PiAgICAgICAgIHByaW50
ayhYRU5MT0dfRVJSICJmZmE6IEZhaWxlZCB0byBnZXQgbGlzdCBvZiBTUHM6ICVkXG4iLCBlKTsN
Cj4+ICAgICAgICAgZ290byBvdXQ7DQo+PiAgICAgfQ0KPj4gKyAgICBzcG1jX29rID0gdHJ1ZTsN
Cj4+IA0KPj4gICAgIGlmICggY291bnQgPj0gRkZBX01BWF9OVU1fU1AgKQ0KPj4gICAgIHsNCj4+
IEBAIC01MzMsNyArNTQxLDkgQEAgYm9vbCBmZmFfcGFydGluZm9faW5pdCh2b2lkKQ0KPj4gICAg
IHJldCA9IGluaXRfc3Vic2NyaWJlcnMoc3BtY19yeCwgY291bnQsIGZwaV9zaXplKTsNCj4+IA0K
Pj4gb3V0Og0KPj4gLSAgICBmZmFfcnh0eF9zcG1jX3J4X3JlbGVhc2UoKTsNCj4+ICsgICAgZSA9
IGZmYV9yeHR4X3NwbWNfcnhfcmVsZWFzZShzcG1jX29rKTsNCj4+ICsgICAgaWYgKCBlICkNCj4+
ICsgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiZmZhOiBFcnJvciByZWxlYXNpbmcgU1BN
QyBSWCBidWZmZXI6ICVkXG4iLCBlKTsNCj4+ICAgICByZXR1cm4gcmV0Ow0KPj4gfQ0KPj4gDQo+
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5oIGIveGVuL2FyY2gv
YXJtL3RlZS9mZmFfcHJpdmF0ZS5oDQo+PiBpbmRleCA1ODU2MmQ4ZTczM2MuLjQ2MWU4N2Y2Zjlj
NCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaA0KPj4gKysr
IGIveGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5oDQo+PiBAQCAtNDU4LDcgKzQ1OCw3IEBA
IGludDMyX3QgZmZhX2VuZHBvaW50X2RvbWFpbl9sb29rdXAodWludDE2X3QgZW5kcG9pbnRfaWQs
IHN0cnVjdCBkb21haW4gKipkX291dCwNCj4+IGJvb2wgZmZhX3J4dHhfc3BtY19pbml0KHZvaWQp
Ow0KPj4gdm9pZCBmZmFfcnh0eF9zcG1jX2Rlc3Ryb3kodm9pZCk7DQo+PiB2b2lkICpmZmFfcnh0
eF9zcG1jX3J4X2FjcXVpcmUodm9pZCk7DQo+PiAtdm9pZCBmZmFfcnh0eF9zcG1jX3J4X3JlbGVh
c2Uodm9pZCk7DQo+PiAraW50MzJfdCBmZmFfcnh0eF9zcG1jX3J4X3JlbGVhc2UoYm9vbCBub3Rp
ZnlfZncpOw0KPj4gdm9pZCAqZmZhX3J4dHhfc3BtY190eF9hY3F1aXJlKHZvaWQpOw0KPj4gdm9p
ZCBmZmFfcnh0eF9zcG1jX3R4X3JlbGVhc2Uodm9pZCk7DQo+PiANCj4+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vdGVlL2ZmYV9yeHR4LmMgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9yeHR4LmMN
Cj4+IGluZGV4IDdkOGJiNGY0ZDAzMS4uNTA3NThmYjU3Y2RmIDEwMDY0NA0KPj4gLS0tIGEveGVu
L2FyY2gvYXJtL3RlZS9mZmFfcnh0eC5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9y
eHR4LmMNCj4+IEBAIC0zNzUsMTggKzM3NSwyMiBAQCB2b2lkICpmZmFfcnh0eF9zcG1jX3J4X2Fj
cXVpcmUodm9pZCkNCj4+ICAgICByZXR1cm4gTlVMTDsNCj4+IH0NCj4+IA0KPj4gLXZvaWQgZmZh
X3J4dHhfc3BtY19yeF9yZWxlYXNlKHZvaWQpDQo+PiAraW50MzJfdCBmZmFfcnh0eF9zcG1jX3J4
X3JlbGVhc2UoYm9vbCBub3RpZnlfZncpDQo+PiB7DQo+PiAgICAgaW50MzJfdCByZXQ7DQo+PiAN
Cj4+ICAgICBBU1NFUlQoc3Bpbl9pc19sb2NrZWQoJmZmYV9zcG1jX3J4X2xvY2spKTsNCj4+IA0K
Pj4gLSAgICAvKiBJbmZvcm0gdGhlIFNQTUMgdGhhdCB3ZSBhcmUgZG9uZSB3aXRoIG91ciBSWCBi
dWZmZXIgKi8NCj4+IC0gICAgcmV0ID0gZmZhX3NpbXBsZV9jYWxsKEZGQV9SWF9SRUxFQVNFLCAw
LCAwLCAwLCAwKTsNCj4+IC0gICAgaWYgKCByZXQgIT0gRkZBX1JFVF9PSyApDQo+PiAtICAgICAg
ICBwcmludGsoWEVOTE9HX0RFQlVHICJFcnJvciByZWxlYXNpbmcgU1BNQyBSWCBidWZmZXI6ICVk
XG4iLCByZXQpOw0KPj4gKyAgICBpZiAoIG5vdGlmeV9mdyApDQo+PiArICAgIHsNCj4+ICsgICAg
ICAgIC8qIEluZm9ybSB0aGUgU1BNQyB0aGF0IHdlIGFyZSBkb25lIHdpdGggb3VyIFJYIGJ1ZmZl
ciAqLw0KPj4gKyAgICAgICAgcmV0ID0gZmZhX3NpbXBsZV9jYWxsKEZGQV9SWF9SRUxFQVNFLCAw
LCAwLCAwLCAwKTsNCj4+ICsgICAgfQ0KPj4gKyAgICBlbHNlDQo+PiArICAgICAgICByZXQgPSBG
RkFfUkVUX09LOw0KPj4gDQo+PiAgICAgc3Bpbl91bmxvY2soJmZmYV9zcG1jX3J4X2xvY2spOw0K
Pj4gKyAgICByZXR1cm4gcmV0Ow0KPj4gfQ0KPj4gDQo+PiB2b2lkICpmZmFfcnh0eF9zcG1jX3R4
X2FjcXVpcmUodm9pZCkNCj4+IC0tDQo+PiAyLjUwLjEgKEFwcGxlIEdpdC0xNTUpDQoNCg0K

