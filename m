Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B87DDAAC60F
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 15:30:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977237.1364276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCIMv-0007o9-21; Tue, 06 May 2025 13:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977237.1364276; Tue, 06 May 2025 13:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCIMu-0007lB-V4; Tue, 06 May 2025 13:29:56 +0000
Received: by outflank-mailman (input) for mailman id 977237;
 Tue, 06 May 2025 13:29:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+p1E=XW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uCIMt-0007l5-OI
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 13:29:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20615.outbound.protection.outlook.com
 [2a01:111:f403:2614::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 313cae17-2a7e-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 15:29:53 +0200 (CEST)
Received: from DUZPR01CA0085.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::17) by AS8PR08MB7372.eurprd08.prod.outlook.com
 (2603:10a6:20b:448::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.29; Tue, 6 May
 2025 13:29:51 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::ff) by DUZPR01CA0085.outlook.office365.com
 (2603:10a6:10:46a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 6 May 2025 13:30:03 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18 via
 Frontend Transport; Tue, 6 May 2025 13:29:51 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 GV1PR08MB7873.eurprd08.prod.outlook.com (2603:10a6:150:5c::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.24; Tue, 6 May 2025 13:29:18 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 13:29:18 +0000
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
X-Inumbo-ID: 313cae17-2a7e-11f0-9eb4-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BRs8sUHXuh1SsT4ZOaqH4DKBbJ1p9dEdljL1T9bqrYnZjxjxBJdTzCBRnh3jgoh2m3ceQhWf7tUcpX1BMPrKQtVizcc567mdQ3tASineArlCK3nlS6Yr5zXGJqnCp5ywhUNJF+w/B2tHqosxEKvi8+e+YIHu3wNFf/xnGD4jKR892skk5aK/1okqmH4JrqLQ7CWhwhspU0b+rg/GCF1jnLckwtLJkfiBYVVJWZxTbBmLpGsSmyuzjvh1olnItEdmwIQyRoK7S2tPc65QMNLZXZEJDLfgxFX8c+iEd/yY/6cHVy2WH+k31QYfbeGPXqaJbv09TDwpsy/B9xpIr8wezg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmjY6iGeOun0UzDRJpGpXg+sMePHwJaM54RhWYLTa6g=;
 b=xLnmrq7r9tMWY/vxEVqTqFdWDppYCAIcqFw8JJcucT12yttSafBgj+SPpa0f+tndZeWcsGukY01QKcHBWoOltJdOqP3Opehjv5cicmzRGjD2cQZDV1BYSm3NACR4Zm3It0rfg/Cnlo6V91QcUmtawdQ9HV45VgMiNoCljkoJW4XVwwcQX1hUERHTWykoxTbrxfzYksBoNWaR2QtKjy7HT9TXhowdJlHZ5HpLUt2AMyXor4A83xAV/SqOjeqp9iNvIBW20iCgWFGVC0sxLcJIYoC5o8JCUhbpeZrbE2b6T86xo51uYMFaschaasLHErp+ut0szSl6YqTEeecRArPJ0w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmjY6iGeOun0UzDRJpGpXg+sMePHwJaM54RhWYLTa6g=;
 b=ZPEv6a3Ifh/P6o+B/g5BA/sqxZyRGVjdcOdpTpQpMti/dXW0ePPTYC2MNzDy9DZz7bGOCF9PP2xI2ALKoC96/QMWvua/Hs8jEAlr4Q9mFnI5BxQssjyhSYFms6scw61flyDocLADqsYEzQ8ZKovTONLT0TG8du+2uZ9bz4sz+u4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i40+U+uzm5wmI7a83gsZaVg4IpPoP7oBkmBbX09wH1h/T4q8spQdZAQCt96mmmlQC3p1GwM/j1rV1YV3IhbGl7J2wNDrn2wEvCP34lfSxh1fFh2ZJHeDSHF9JQZOkq42WQiFA+R2Vmg6ERHQcFJZXYT5cyn174G+uh9r6jwttTJA2ydU8b58FW6qpfNcC81ndtZ4g59jXqo107UAh16NxR0+xkqpnB9kEN9a06HELaecrgq2V/xZaW5I6ROipba5TvH6D3U+UEOGPiWmg7FeGIZEU1wt+jnQDJys1RRtnou6MGqdEj5blYDQIkjnbE9e2gT0loZDYVSN+nL+TkI3eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmjY6iGeOun0UzDRJpGpXg+sMePHwJaM54RhWYLTa6g=;
 b=k6q8HA2nNstUkio9Hl3vtz+/jMTZEziNDuU1fFAevuMfvE94if8Fm/CAyuaF/nNC3rP5WWl7u2CTWbBhOIYjJ/vQoYBkBp4xtk9KjoDSB0iPuQCU19TYOQtkdJDQNRvj1wRT0YsClJTXkVKc4S+6GU+5ygXAf6O5DX2scMdRM2Yhrv22A3bXVHQvF/uWP4YTnJKtBfWBsZZ3KjhmXPPw0uYxtg3cKjAsbXTE8paPNt+6hUhoeIXEl8T621WIQ8xNDWJfq0gepU9zsjxiVzN5t4shs64B7M9bapxBh4yOfvdrjPUZLdYdJNBnvBAa5Fx0nIzLTP0eT8FLhBy6xUHe1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmjY6iGeOun0UzDRJpGpXg+sMePHwJaM54RhWYLTa6g=;
 b=ZPEv6a3Ifh/P6o+B/g5BA/sqxZyRGVjdcOdpTpQpMti/dXW0ePPTYC2MNzDy9DZz7bGOCF9PP2xI2ALKoC96/QMWvua/Hs8jEAlr4Q9mFnI5BxQssjyhSYFms6scw61flyDocLADqsYEzQ8ZKovTONLT0TG8du+2uZ9bz4sz+u4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 6/7] arm/mpu: Provide a constructor for pr_t type
Thread-Topic: [PATCH v4 6/7] arm/mpu: Provide a constructor for pr_t type
Thread-Index: AQHbuRpqbs0x64sbw06OBQfYV4WEtLPFavYAgAA4bIA=
Date: Tue, 6 May 2025 13:29:18 +0000
Message-ID: <8B6DB54A-3D2E-4310-B567-8EE4F8472377@arm.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-7-luca.fancellu@arm.com>
 <42eab292-f9f6-4bc1-a011-c657544ebaf5@amd.com>
In-Reply-To: <42eab292-f9f6-4bc1-a011-c657544ebaf5@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|GV1PR08MB7873:EE_|DU6PEPF0000A7DD:EE_|AS8PR08MB7372:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df2b5f1-dcbd-4971-0595-08dd8ca21481
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VmFUb0EydHluM0V0QnVBS0NmN2hQTEYrUzJ5YWdoVFNNY0xiOW9Uckp6SXZZ?=
 =?utf-8?B?MkR3dC9MSDcyUDJiNzB5VHVkOTM2aFdHNk9IKzh5LzlRTW9zc3Y3cmk0anlZ?=
 =?utf-8?B?ZkFIVzMxN0hWOG5jcmk1R2VZL2RLV1pLdTIrekIya3Frenp3WDFrN2daNXpH?=
 =?utf-8?B?L3Y5TVk3TzBpcnNyNEs5UFBHbFlnQmNPYnN6T2ZnV1NVWXIvSE45OE1Ga05z?=
 =?utf-8?B?ZDRLcHEwVEZheUZObmRDTURDVWpEZ0dCM0JMNHdGdUlJRCtaVDN3Ty96cXZB?=
 =?utf-8?B?dHlzUU5yYms2RmdpOEZ3bVFxYWpmcStZenRBKzBsN3ZQSDNZTGNTa3NXenBq?=
 =?utf-8?B?azZkZGI4SnN1S2dibGY3WHVVMFdOL0R4OVNLaG9ZeDV3Lys2U0tvOGJHTjRB?=
 =?utf-8?B?SGREbUlmUFdiR3R5Z0ZjMEJja0FTNVVWQTJIclNsTTJWU1pJTGV6bXhYeGJj?=
 =?utf-8?B?UDA4cHM4Q1ZlTEdva0gzOCtJeitVTnhUcWMremlld09vUm1sNEJNdlBNMmUr?=
 =?utf-8?B?MlpRaWN2blhhQjFoL05rMlJSRkNJeUhtMy85bCtVT1EzQlN4OUJlNWE0T2U5?=
 =?utf-8?B?ZXVnOTNhUXNHY2xDdHp2ODlOd25IRE1uYjAvakQ4bm9mYVYzNFU2eU5OSXp6?=
 =?utf-8?B?UjBXMDRZY0h0bFd1U0ttN0V4U2Qya3RxejUwTkI1WjEyMUxsaW1PaVh0QjNn?=
 =?utf-8?B?eUFQQjA5bE5zSFFFendLTVh0SWF0ekZiZUs4QWpzckdSeHE3aGZ0NzBxTWgy?=
 =?utf-8?B?YVZVUkR2M0U1RDJnU2habFBNSGJhODkyVTB3M0wxdkJEclUxWjMvclV5WVhH?=
 =?utf-8?B?Tm5VVi9YOERYNkN6dHZmN01iT3dmNmU2MmpSVDgrZ1oxZ2RBY0VoZFVyZVI0?=
 =?utf-8?B?Q2p6NHR2RjQ0UmZTcHAySXZ5ZGF2Rkw3Yk9jWWNVRmJvbjVacDBYaUpvVFhE?=
 =?utf-8?B?ME9QaExNSXF2VXBRTUZNc3RRbWhUSTZXRTUrdlY1ZlJ5RTdCdGlYSEZLbzdL?=
 =?utf-8?B?Rndnbmp4SXkyR2RDdnJya3lGRy9NYkpJZWFqM01peWEwU3B0aTI2a2xNRW1H?=
 =?utf-8?B?UUZ2RE4wUWJSMWlDTHpWRVdHUnRoT2lYazQvQmU0SjU4Ykg5eldSN3BZMk9Z?=
 =?utf-8?B?RU51S240UVliaWlzQjQ4d3Y3NGN0ZFBQbjZyWGtQVzBQa0ZjOEdISk9HMkF6?=
 =?utf-8?B?YnorRGY4MHl4M3pDd09uU0pyWHhqV04zbjE1ajY5RFAyVWhieDdYZEU0MnA1?=
 =?utf-8?B?Tm85Kzg4dDd4SGdFZ1V1MUNYdklsbnJhSFhxSndINng2MHIxYk4zb2kxRE9M?=
 =?utf-8?B?S1VtNi9wREIyWmR3ZStVL3JvUFdFRXpKWFZlREhNa3o2VjRCMERmeDJsZ1dv?=
 =?utf-8?B?UmJ3bEZ4UUx0MzhuWTM5SnVDSnM1MjE3ZkR3Y2UweVI4ZEU0M2hqWWt4a2VY?=
 =?utf-8?B?Y09WSmN0R2RoMkNvQmV0TVk2SG1nNDhvc01IUkdWT0kvNHhMZTdxT3IyLzhk?=
 =?utf-8?B?cU5MSHMzZi9PM3hQZFBTZ2pveTI5enhZQkVEc1BjZ1dmUUd6Uy9SZ2JjYjhL?=
 =?utf-8?B?REo1bE5kRmVCOVhVMkFETEtHWU5uVFNCZWxzVnMwUXlzOW41N3BlLzZWUUZY?=
 =?utf-8?B?WWhxa2JaUXhWY0F5M3ZsVm4vSFcxWCtFclJPNDNTdUZWNWIvSGswRHdSNlBt?=
 =?utf-8?B?ODByajRPNnJ4SlA2UndCd3FkMVBVQkszZ0RKdnZEUC8yUlJxSzVQMTNjVzNp?=
 =?utf-8?B?cjFkMkx3RnQrNjJpRTdqcitrN3MyOXhjV3EzYm83b3p6Z0RNQzhXRTRCU0pV?=
 =?utf-8?B?Z3NIS2NDc3FQOFpaMzBnMXpsdDRSZmxhaTZoVVQ1SjFTODdkWW45Wm9rOWZj?=
 =?utf-8?B?Yno1Y1BzbEFjTDI1cG1qbVY3SDBvWksxUG5DU21YQW1uUzRwS25EMHBkMVpN?=
 =?utf-8?B?cklwVzVsanoydUhnbWhIV0FCeHA3aVQ0UkMwcTQvTDFMVzFqY0Y3V2NsNG5C?=
 =?utf-8?Q?u1IYQxzcPobYtH8WyEavbXDlm4YHac=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <59E74DDA0F1B9C439B7BD7A14445712D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7873
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b1ef09fa-1fe8-4e55-1f93-08dd8ca200c4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|14060799003|35042699022|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cERDbEZDZEFrUGdTLzdKZjVUeXM1a0ZoWU9aYjF4WkUwY0hJTm5mRUIvUWRt?=
 =?utf-8?B?V05LcG1ZTFQ0dENIOGI1NEprcWJmRnBWSkxwd3ZnRm56NmFXK0YwbDZDQnc5?=
 =?utf-8?B?ai9ZNCtiS2kzOXlnVjBRdWtmN1BFcnlsNDdJYlZPTGdTeVNVVkdWZDcwd1NP?=
 =?utf-8?B?Qy9TVE5oUW1FNERZVitjY2xVTXEvb3ZJVTRzRmF3aXZaQzJiaXZwdno2a3E0?=
 =?utf-8?B?R2h4SW9vcTB6aU54MVNmRGFGbDhhZmFRam5ncHVqQlFMa0plMVBRRStNSVJy?=
 =?utf-8?B?VnY4NEdLd3RwUDdVbXh2alpiSmNsVWMvZVUxVWN5RW9rbmFwMkRFRHNBem1m?=
 =?utf-8?B?Z0tBQmNTUzg2WnRYZDJzejVUZE1jaENLTjdWWkN1NW5UUHBSVnRpNlMxMklp?=
 =?utf-8?B?YVJoL29XeDFib2JrZDFrcXhidmt0M2NZSWtlZGk3eU5IMkMrZGJrM0NCak5N?=
 =?utf-8?B?YVlwTW0rZUFUWkM2RWZUVXJ3YVNYYjM4YXdsVCsxYmFXZVBLaFRKR1NnbHA4?=
 =?utf-8?B?QnhMUEhMMWZ1VnZtc1BnMXg0WkJFRFI1Wld1emQ2c1pPUXU5YXRBQ2U3NWF3?=
 =?utf-8?B?dkVIbjE3SEtXSm82VXhpTEVCZis0dVRCM1dlY2ljNTZyWUlyRE81aDFYYkla?=
 =?utf-8?B?MUlBL0tVZUs0SnE1MXF5ck43aHFmcmRCVUJ0NzZZRVJzL3VUTjE1eHdYd1JH?=
 =?utf-8?B?TFlNeERISVBKYW9BRm9kd1RrU1RYZVRuRHBjMGlEbDhONXU3aGUzazBUTFBW?=
 =?utf-8?B?VEE4NHlkYWtMS1E5TTU5STdDekdkTWZ0ODFETzJvcStuM05wREQ5TzZ3YnBQ?=
 =?utf-8?B?T1YwS2Q1b3lQSjZMc1pNR2cxSW9TczcxaVg1NjBFemZjbFp3ZTR3YWx5aVNJ?=
 =?utf-8?B?T1dNSWRyQ2NJTmVrSnRQMEViN1dHWCtXQk05a1R1NTZITVhVWDE0OCtuM0Y0?=
 =?utf-8?B?U0ZxTkM1cFZqWGRnTXpaeUpENlBEN0xqVlBtQnU0L1BZejZMNWVOQ0JteHRQ?=
 =?utf-8?B?KzRPQmJNcGN1aEJSSjEwcGFVUW0rV3JiZmR1L20xWmFxb2FtQ0ZVR2xtdEJO?=
 =?utf-8?B?dnJSLy8rZndsR2RZejZzK3llbzFXK012cmFsbXN6bENsNWtYWCtQZzBQYVls?=
 =?utf-8?B?ZlJsSnpjVU5aR1BIbFVtdmhIdkY2MjBOTHhKVmo4bXBRdnZrUUZtUjJJekFP?=
 =?utf-8?B?MlZCV2ZpZnlsYnJ4bjEwZFE5WFhlR1crYlVPK3hEVXZUR1RVamZhNWorZlVz?=
 =?utf-8?B?VmV5ek5zcnp6K2hFczNXcW5wRkVCY3lIRUZ5RzhRUUZwcmVwN1d1L1hqMFp0?=
 =?utf-8?B?TG8yZnZ3MU1zdGFnT09idHZwL3BFTnVwRlhUd0JMdUs3SVNwVjhuUWxCclEr?=
 =?utf-8?B?cStORmcwZXpGSk1kRWpPaFJDK2MwcXU4MkRCT0g1c0xHeGlpSVBvbUxHNU4x?=
 =?utf-8?B?MlkzTlZqdmRGY3JHZnhYQVlmWmpBK3pXUkk2Wm4zOVNwRlBSamUxN1duMkZL?=
 =?utf-8?B?R2VaMmU0OHZLeUJlaU9pS29TbWlwN0xQR1NRaUgxc1JxNXh4Zk9yMmxiNnpX?=
 =?utf-8?B?aVAyeW1USDU0WjYxN09meFdGWDNhRURQR2dDYTVJWXVuVzVheFk4bmxGaTFV?=
 =?utf-8?B?WWhHeThnUlBEOXd1MFc1L2JuRy9RVVp6Wmt2S0JyS0NSL0tDOFRUQ3VrVU9R?=
 =?utf-8?B?ckNOblpNZ1lpSDZveWltYlVhUmd4WTcwMFRMNlFDRDVWTGVvdGVFT3ZKNVdv?=
 =?utf-8?B?ek9hak45WUFXMUVIdnRNNFQxVmxxNmpBZmd0WDlOaFByc1o4V28reEl2NkJ5?=
 =?utf-8?B?bGhwTG8yR3FBcDZLVVhGWlNHT2VXdi9LVjZJOUtpKyt3RHBCd3dPdysyNXV6?=
 =?utf-8?B?THJVeHYyM0twTm8vcTRiZEk4Zk1FOUIyeUVXdE90Snp4dlIzTnVWK3ZMN3Zx?=
 =?utf-8?B?ZnRWZEV3Q3F2cXdhRnVlZEpoQnJIL3FwamtTODNwUER0VkhJNUZRTVhXY1Bl?=
 =?utf-8?B?Rkp3dWZUNUdRaGI4NWJCRHFPT2ErQzV1LzNUNWdzNGEyWXlOSTJjVnlSNWtF?=
 =?utf-8?Q?2WwA3Z?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(14060799003)(35042699022)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 13:29:51.2087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df2b5f1-dcbd-4971-0595-08dd8ca21481
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7372

DQo+PiArICAgIHN3aXRjaCAoIGF0dHJfaWR4ICkNCj4+ICsgICAgew0KPj4gKyAgICBjYXNlIE1U
X05PUk1BTF9OQzoNCj4+ICsgICAgICAgIC8qDQo+PiArICAgICAgICAgKiBBUk0gQVJNOiBPdmVy
bGF5aW5nIHRoZSBzaGFyZWFiaWxpdHkgYXR0cmlidXRlIChEREkNCj4+ICsgICAgICAgICAqIDA0
MDZDLmIgQjMtMTM3NiB0byAxMzc3KQ0KPiBJdCdzIGEgYml0IG9kZCB0byBwcm92aWRlIGhlcmUg
dGhlIG1hbnVhbCBmb3IgQXJtdjcuDQo+IEFsc28sIG91ciBnZW5lcmFsIGFkdmljZSBpcyB0byB1
c2UgdGhlIGxhdGVzdCByZXZpc2lvbi4NCg0KSeKAmW0gdGhpbmtpbmcgYWJvdXQgcmVzdHJ1Y3R1
cmluZyBpbiB0aGlzIHdheToNCg0KICAgIHN3aXRjaCAoIGF0dHJfaWR4ICkNCiAgICB7DQogICAg
LyoNCiAgICAgKiBBUk0gQVJNOiBTaGFyZWFibGUsIElubmVyIFNoYXJlYWJsZSwgYW5kIE91dGVy
IFNoYXJlYWJsZSBOb3JtYWwgbWVtb3J5DQogICAgICogKERESSAwNDg3TC5hIEIyLjEwLjEuMS4x
IE5vdGUgc2VjdGlvbik6DQogICAgICoNCiAgICAgKiBCZWNhdXNlIGFsbCBkYXRhIGFjY2Vzc2Vz
IHRvIE5vbi1jYWNoZWFibGUgbG9jYXRpb25zIGFyZSBkYXRhIGNvaGVyZW50DQogICAgICogdG8g
YWxsIG9ic2VydmVycywgTm9uLWNhY2hlYWJsZSBsb2NhdGlvbnMgYXJlIGFsd2F5cyB0cmVhdGVk
IGFzIE91dGVyDQogICAgICogU2hhcmVhYmxlDQogICAgICoNCiAgICAgKiBBUk0gQVJNOiBEZXZp
Y2UgbWVtb3J5IChEREkgMDQ4N0wuYSBCMi4xMC4yKQ0KICAgICAqDQogICAgICogQWxsIG9mIHRo
ZXNlIG1lbW9yeSB0eXBlcyBoYXZlIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllczoNCiAgICAgKiBb
Li4uXQ0KICAgICAqICAtIERhdGEgYWNjZXNzZXMgdG8gbWVtb3J5IGxvY2F0aW9ucyBhcmUgY29o
ZXJlbnQgZm9yIGFsbCBvYnNlcnZlcnMgaW4NCiAgICAgKiAgICB0aGUgc3lzdGVtLCBhbmQgY29y
cmVzcG9uZGluZ2x5IGFyZSB0cmVhdGVkIGFzIGJlaW5nIE91dGVyIFNoYXJlYWJsZQ0KICAgICAq
Lw0KICAgIGNhc2UgTVRfTk9STUFMX05DOg0KICAgICAgICAvKiBGYWxsIHRocm91Z2ggKi8NCiAg
ICBjYXNlIE1UX0RFVklDRV9uR25SbkU6DQogICAgICAgIC8qIEZhbGwgdGhyb3VnaCAqLw0KICAg
IGNhc2UgTVRfREVWSUNFX25HblJFOg0KICAgICAgICBwcmJhci5yZWcuc2ggPSBMUEFFX1NIX09V
VEVSOw0KICAgICAgICBicmVhazsNCiAgICBkZWZhdWx0Og0KICAgICAgICAvKiBYZW4gbWFwcGlu
Z3MgYXJlIFNNUCBjb2hlcmVudCAqLw0KICAgICAgICBwcmJhci5yZWcuc2ggPSBMUEFFX1NIX0lO
TkVSOw0KICAgICAgICBicmVhazsNCiAgICB9DQoNCndoYXQgZG8geW91IHRoaW5rPyBJdCB3aWxs
IGhhdmUgdGhlIGZhbGwgdGhyb3VnaCBjb21tZW50IGFuZCB3aWxsIGFsc28gZXhwbGFpbiB0aGUg
TFBBRV9TSF9PVVRFUiB2YWx1ZSBzZXQNCmZvciBib3RoIG5vcm1hbCBtZW1vcnkgbmMgYW5kIGRl
dmljZSBtZW1vcnkuDQoNClBsZWFzZSBsZXQgbWUga25vdy4NCg0KQ2hlZXJzLA0KTHVjYQ==

