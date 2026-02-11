Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIR5LyeTjGlQrAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 15:33:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1430A12542E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 15:33:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227738.1534169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqBGs-0003VW-VC; Wed, 11 Feb 2026 14:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227738.1534169; Wed, 11 Feb 2026 14:32:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqBGs-0003SS-SF; Wed, 11 Feb 2026 14:32:50 +0000
Received: by outflank-mailman (input) for mailman id 1227738;
 Wed, 11 Feb 2026 14:32:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvfN=AP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vqBGr-0003SM-FG
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 14:32:49 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89af5191-0756-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 15:32:48 +0100 (CET)
Received: from DB8PR06CA0045.eurprd06.prod.outlook.com (2603:10a6:10:120::19)
 by GV1PR08MB10840.eurprd08.prod.outlook.com (2603:10a6:150:160::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 14:32:39 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:120:cafe::da) by DB8PR06CA0045.outlook.office365.com
 (2603:10a6:10:120::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Wed,
 11 Feb 2026 14:32:36 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Wed, 11 Feb 2026 14:32:38 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS4PR08MB7531.eurprd08.prod.outlook.com (2603:10a6:20b:4fa::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 14:31:35 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 14:31:35 +0000
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
X-Inumbo-ID: 89af5191-0756-11f1-b162-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yC269XZvyLirI2rn9kptghdSRClK8XjNA8Q2yKuBPKOJXMAxQ6lbQUg5zZ9fj1pJLiXRbbeaC3AXvYSCcW8OlcqydxC+Wk/HX2OWRA6XyEOCtxNOwuwSrx5U3aGjoHWRmePNCJvLj6qx4H3b3SLxOORwLp2RSJzP1y5i9dmiOCxm4muRBzgg2qKejH0xhnwsmNPQGPEZy9OqiNamg1YK++4dMBM+bfO6iXnfH4WS+YbZgCK68n66mG853bW7M6pYzv0877MUV8hObnnciLq9hVOXh2Yflxc2S8nwVPBz/H7BzYe4j6N+cg73sZAPa6svpN5zN9DkzRvLRGWw0sDcOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+Gm0E3xfIwuIDuCNEAkeNWHgxwHcDpYnywo0MUdgyw=;
 b=K73O+IMy4xQ2lyFvQAVbRsje3++2ry+ClPHXjU0ifOHEsb3tl891Ffjlvx0twqTYzgJee8pc833ZfRkw2cAh6cC9pvkhQ4vuIzZ6l8MSIvZyfuDEeBTYjjGOgk80W8lHLFb4nyMQGdiVEZ79mSV7z4FyNBNDcLdQF3BV9WmBG9rFZ0eRT/5fTp2y19nnX83aRGJKPSI7phtHvL7g6+dSGKNORJWlXpJDev5HWgIdE51ew4owuVzxB8FaDfSD+vrlwNT4N728sU5v5rpONa0ifIm79DgWAx4lyG8pGB/sfb+l3v52JLCN2+BZiqkRoHffIqtQlZQPM7Pv0x6zh9yy7Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+Gm0E3xfIwuIDuCNEAkeNWHgxwHcDpYnywo0MUdgyw=;
 b=n3uSp2CxF/gP9Xd2teqQaH9raie94o/Fb7NjKf/q2H/gK8J3gA/gbJ6/RSq+9rd/LmAIppKAeWtRYgnoNXsLj5NhgynHBXegOmVgg8AOVCgAXjxsphK7SrEW6lTzwS9B0H1kSaqkCwmyxebt5xei+sZSiyEIEr0yC9ToYB6m55g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFSklOX9jxXz0mI5e1LrhsePg6bsVrJ3YA7Un3NYVNf4bULZ4MuXucliFkiVPO2CwFy0Us58trDGAYdnLZbTvoOoZ8soHaLQ9vcOKGPgwlEjbviVm7sKuM0MW6GiKji1v0/V3BDqOjRDdYxEiZ2Vg2J/LR/vvHw0lHPHjO41yqUDiF2umWBso4LqhQbyqJsGnl0ZSWKlq8LAkYhkLcOTVOev8/j2suVqQYPRZitmv+KOJCmA7Trus1bO5DCt7b8tvFbSHBycwNM4t1m5P3Ifh+I+LdTaRS76uDExmI718TE6NZBlQCcpVaUCaZ/E21d547IAYMFmivGbwRQPhQ38eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+Gm0E3xfIwuIDuCNEAkeNWHgxwHcDpYnywo0MUdgyw=;
 b=uCxUXZ6Zw1OSyRsyTuLJzTkKk3Q5L63h36Ouf3r9tJ7ob4Iv7j/mMgd4cBShrxEt132h/zw4BKNYXXxaYeuI5xJH9wdm9QrYp3rHLygF/KRVu8shrQQE/W/1IwMoztvmfoEKdtpc8TZkZRy1sFUYzUdA4gUD+SWYkuEKlHnAkOiB6MJL6u6xCNnqT3TUH3J5x0HS3RL/UloKnkQYAWO0UVtG2sIs9z0v0TemII7Nez6sNVl0WixLAnwerHk4O7O+bPDJw59U5B6GFKHIF9DCXdBrZSIId0ppZSbNOFXNnC6vPgDRYdJCpWhoq85W9Bkt3UrrYaBuKhI7ppRDQnRN5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+Gm0E3xfIwuIDuCNEAkeNWHgxwHcDpYnywo0MUdgyw=;
 b=n3uSp2CxF/gP9Xd2teqQaH9raie94o/Fb7NjKf/q2H/gK8J3gA/gbJ6/RSq+9rd/LmAIppKAeWtRYgnoNXsLj5NhgynHBXegOmVgg8AOVCgAXjxsphK7SrEW6lTzwS9B0H1kSaqkCwmyxebt5xei+sZSiyEIEr0yC9ToYB6m55g=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 08/12] xen/arm: ffa: Fix FFA_FEATURES validation
Thread-Topic: [PATCH 08/12] xen/arm: ffa: Fix FFA_FEATURES validation
Thread-Index: AQHclTQCVYzQoM1PdEyfckgwmOVEyLV9M2UAgAA0pYCAACPHAIAAD/qA
Date: Wed, 11 Feb 2026 14:31:35 +0000
Message-ID: <7E530111-37DD-4B4F-95FF-423FB8A3EC1D@arm.com>
References: <cover.1770115301.git.bertrand.marquis@arm.com>
 <5331b33343441028d10c290b21b82acce295fff0.1770115302.git.bertrand.marquis@arm.com>
 <CAHUa44FWRepyAakwXLjObbA=8O_LMBR5jk0-WEAXZdgsQCsHOw@mail.gmail.com>
 <26A3747F-0313-437F-B461-F5C70CE1A4F1@arm.com>
 <CAHUa44E9OUhmyGw-897RzgJmrxXMtg5RXrWKXHQueqY7zJ-dkA@mail.gmail.com>
In-Reply-To:
 <CAHUa44E9OUhmyGw-897RzgJmrxXMtg5RXrWKXHQueqY7zJ-dkA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS4PR08MB7531:EE_|DB1PEPF00050A00:EE_|GV1PR08MB10840:EE_
X-MS-Office365-Filtering-Correlation-Id: 2321c384-a8db-490f-b597-08de697a6828
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZzZYL1N0VE05UThTU1BOVllmZEp4d0dNa2pRanZXSFU4ZTFRYmZKWDZManRz?=
 =?utf-8?B?SFNib3Q3UVVzUC9tbk42SWhQeHZraDZXVUI4bHpFMTlncVJqMFAwenhhOUxi?=
 =?utf-8?B?VWt5S01uZXJMWWVmM2dDN2JYMDVtbDYrbUV2aldEa1doS0lSWW9Hc0x1WkZv?=
 =?utf-8?B?YisxTTd2WUFZbHhrUW5vUlBwdkJHeFgwYlY1T2RKRm1aUDNtbzI0WERsWjVo?=
 =?utf-8?B?Wk5JVXFFaEFmMVRxekZHN2p1dUxUcW9CK2hDMWt4ZnRBcW9Sa0R6Z0dwd2Y1?=
 =?utf-8?B?cE1EcFZEd3V5bFFFKzAveDVVWnArSDZhTHZiMFFoTmNOV3NBdFlyWENKREwr?=
 =?utf-8?B?VE0zb2RuZktMQy9LNGd6aUIxZzg4MkNPblVhWG1XUlNTbm1mRzdrdnVaaVpG?=
 =?utf-8?B?Mlp3b21XZHdSVGVaa3NqSm83MnNvNlgwaFlwK3Zzck85Ty94WnFMS1BEMEFK?=
 =?utf-8?B?anJsWDBwdUNtMDlXeWwrdTdXNDZGSllOQlFuRnF4aENFOXdvVTNKNUVrUmF2?=
 =?utf-8?B?d3phOU83a1BuV3VIbGdjdWVuWnQ0RFZhWmIzVFcxT2Y2ZllqckVRSDRBaVpw?=
 =?utf-8?B?cmxNUWVYY3gvQUZ2ZzBqS1NxSW9IWCt6anNqTFc4Z2lLckF3NVI1WjRBWk4v?=
 =?utf-8?B?S0duSDhTTDgwY29WTlFMZlI5SDJJUjVkTG9OQ0dPWC8rNEQ4V3lncEF6c2Z2?=
 =?utf-8?B?UVIyMGkxbFVadjdqMUhZWUFtakcybmkrdzNUY0lTYkJuTjViVHM4NHh5VWZY?=
 =?utf-8?B?UW9zUmh3Vy9wM3MwUFFQUmxLZ2JqREFCVTh1Q3FmbWZ2UWlpSHBNOVhmZ1B3?=
 =?utf-8?B?QnlxY21YdEJ1dFdkYXJ6M0orc0lQVU4yL2FJZllUcFhybnJ1NWhNakpTdmY4?=
 =?utf-8?B?MWNKZitSM3hIVU96em5qYnpOamp1eUNmZkR5Z2V2VEk4MUl0SG5mTlo2d2pi?=
 =?utf-8?B?NldJNXNrN1lQNGZiajE0YXhBbkhTakdhU0xrWjBqVlRkbTB1UCtUTEhFOERu?=
 =?utf-8?B?SnFkQTJ2dDFONjBLc1BlZUxPeUdjS3dtNXpZZEJhbDIxZit2anFkQUxMeXlL?=
 =?utf-8?B?ayt1bWM1K2lQOHBoUDZ4NFByNXphNDMxdmdOdDJ4RmVweXp3WW1pZjBsQ0lQ?=
 =?utf-8?B?ZElVK1BKNnp5SVozMTNXenlNM1BUQUloRlliYko4T1RBWGozMFZCZkhCZlEx?=
 =?utf-8?B?NHVIV0JMVitENzJtcWhqODVzZ2RldS9PbGxWUzI1cXJabmROaHZIQ09WVy9X?=
 =?utf-8?B?N0pQTXlJL3g3Z1JQZ3hxM29VUEY3ZjhjODYvNkRLc3lZRURhNXV6dWd5VlRB?=
 =?utf-8?B?TnVoYmJpcEZ5RU9XNzAvWExNSTJiczkvTkRWRWZuN0pyMFNXeFpOZmhqZkpW?=
 =?utf-8?B?akl5VENXbXBiUDRPQnNyZCtGOXhwalRpVFl0VElNUGU3dDh3YTRSdU0rcGxr?=
 =?utf-8?B?TFN6R3UrSlpCYUNmalJsSEgrb04zVnpKSmNMUmlTS0ViMEZpclNvU1JKZnBn?=
 =?utf-8?B?MHR6c0VFRDVic3lsSEdMMVBiMXgxckM4Wjh3Qld0d2NMRHdwcVBvUUMwaUp4?=
 =?utf-8?B?cHVrckROSDVBa2xHYzR5WDViL0VMQk92SHJaeE82OTRRQzRKeVJkWWQ4MHdl?=
 =?utf-8?B?YUxNOUhSTWZtdmk2OUl3ZTZZNURMYkVDMmxlbGszdndCcENCYzZuaC8wMi85?=
 =?utf-8?B?aWQ1NlNNR2F0am8wVTJ1cDRwNEgyeFpFMlpHcU1NdlpwdmhRbXBxci9EMm5u?=
 =?utf-8?B?NElkNnVlWFZpTGpSbk1wbktSTXlyOWpXNmNJcERleGhHTm9NZHN2MjZjNldC?=
 =?utf-8?B?ejZsN3pHTk16ZTYrUW5VSm52ckQ2WEN0dXFoZU42ck1veVczbFFNVTVob3ht?=
 =?utf-8?B?OC9lU2ZJNjN3U2xNUDk0U3pUMG4rRlRTSFlIa1hvT2dpVS9UNDQ1ZVlZSmlP?=
 =?utf-8?B?MjMwYWl2ZE5LZEF3R2p5VlB1ejdHbWFDOFpuVVVFQ1AyTVoxZ0Z2U2VTemNL?=
 =?utf-8?B?c0Qxb1dEQThPSVBob1ZMYjhLVWdMZW5XU3RiSVA1Z1p0eWt1NVBrU2tRdXBp?=
 =?utf-8?B?a0gvZnorZVB6SjdTRjk4dWgvNTFYWFpidjVuWnMvNEJ3RHdDdDJEMmdrK1lW?=
 =?utf-8?B?QlRhRlRqUU1lZWJ4c1c1Y1lzREV4V2ZLVjdlTldUU3ErSFFiV2Q3a0FpMjZD?=
 =?utf-8?Q?Umv+wDNVNUxkrXQbx86v3o4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E902D4E04750F84287CD4004EA79FD32@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7531
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	93e7a3ec-9f64-48d9-d9be-08de697a427e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|36860700013|14060799003|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUZBWWY5djc2M0QybWJjbmVzSE1yMEF1T3llZU5TNmVsbFlKTjN3QXAvRFla?=
 =?utf-8?B?clhyczNad3pxQTNDNXkxYmZYMUdydE9uWnE1M1pUYWh2T2J0L2JuWDV5eDV5?=
 =?utf-8?B?RlJHMFdHRURhZXN2aSt1dXA2TXVTbEh6WGpGQWM5UXpwSWttaGo0T1pjN3pG?=
 =?utf-8?B?V3dPNnRJY3EybnpDUzRNcXplNmFiZ0JOc1phRVFLT3ZIT1Y4SzNLTFhhRGo5?=
 =?utf-8?B?dVU0dWRJUmN5bUR2dHBDc2greEsrRVJiak5wc3hGOGdnb0U4UVE1SWNlWlhK?=
 =?utf-8?B?Y3RTTnA0V1pzQU56YURjQ2ZlMXl0a1R1RnJ6LzFqb0kyK3ZDbW1GTlB2czJV?=
 =?utf-8?B?dGZOWjBFVjFlRzRtZjNwSXFybzkyN1M0ZGxub3FSWTBsdXRMMzBndm1VcHYx?=
 =?utf-8?B?cG1XZ3k1V2hZOU9aM2ptSllOV1JDNU01RW5heXNCSFRUVkVVR05GRXV2bklH?=
 =?utf-8?B?Ym9IeERTcllPYnJnWlI1TS9TRm82akduc3RoUmFUWU5ONExnMW9ISHo1TjMy?=
 =?utf-8?B?N1dSOW84QXduM3dyNUwyZXdOeXE3UDR4a3AySHhlZFZpeWoyWEgrR2xLSWRu?=
 =?utf-8?B?U3hwYSt5OHNLVDIrTFdXOEVnTUJIVXZQelVWOUJ5cy9iYmc3YXd5bmt5WFZS?=
 =?utf-8?B?bmFITlhZMTdZdGxQMjVFUDUrNzF0N3p3KzJQSWpEZCtqUWJjV1BodFdnTzMv?=
 =?utf-8?B?bW96SkJKZjdoQ3gweUZ0UEFGcVdpYzdUdjd0YTVpaGV0WHlEL2o1Q2ljMjZU?=
 =?utf-8?B?dG1WazBCTzN5R2R0bjZhZFpEWVd3Ukg5Z2MraWt0amlZN1lXamNFc2lGcDNo?=
 =?utf-8?B?YWY5WVFXUmxIbzBtV3c0SU43S0RaTGMwV0pCeGQ3K1Q0UHEvdWZxTHhtOUNr?=
 =?utf-8?B?eUU5LytRcThCWlJBYURGdGU3OEdMa1hNSjZtU01JUGdwLzcrNUdiK3VqTGV4?=
 =?utf-8?B?OU02YnV2TnMyaDhCc21BdEdjUEtBVnF3cXk3bjFWSU15UEtzdE1ZdGdZdFRl?=
 =?utf-8?B?L0hReklTT3NSMnNPd0s4VUhVZlY5dFB6TXZKV2N1b0xIY1Q2YkVpR2dJN1B0?=
 =?utf-8?B?bGdCSjhmS21IYTZFcFdPbkVIM1VWeTZIWWdrRHFELzVqME5rWlZqMkJVcHcv?=
 =?utf-8?B?UW1sNkl1cWRVdkNSYVM3bnc3aG9PSkZZVml3UlNuOFIwQ2tPOU5BUmllOWFo?=
 =?utf-8?B?MTVMQ0ZNbC82YnZIZEFTSGgvQkpNbjBqaGlsSUhrMmxma0ZpNVNWSzYwRnIz?=
 =?utf-8?B?Z29TSjRGdWNkb3VmQXVrYk9zNWFpR2RlQUR2N0hPU1dFb1Jta1BQN3pkOFZz?=
 =?utf-8?B?M1owL0Z6QTdOZklkbWxJU0dEN091TDFSUFZUQ3g3dGFjSXZPam80ZHBIcTZP?=
 =?utf-8?B?MzNiZFZjVHJhZ3h3V21QTlcxVk1FWHU1UUVvN1JrUFlaMkFtRENKb3grZVU5?=
 =?utf-8?B?OFRVZ2FNL1RuMnBHZll3RHk4eDMrRTdoSi85MnN6Y2JtSkVmTkM4NEQxVTVq?=
 =?utf-8?B?RHJhaGpsVGlzbmNrNVkyUFduaGZ0QzRRd0FJSmw4eUdLR004K0twNnVYSzRl?=
 =?utf-8?B?L3k4ZlY4WmR6aFVpTGszSXM1V01NWS9vNTZJMWs4NGEwNHZOaytOMFBYMkt6?=
 =?utf-8?B?L2NGVjZYR1FlQlhBRGIxT3plaEtmTjltSTM3SjRoV2IxWVIyMUliZWZJRGZM?=
 =?utf-8?B?VDNIWXFESjNWQjdKb1BKVDNTT0hEN2l1eGhtdjMwbGNZaTA4ejJUKzN5czA5?=
 =?utf-8?B?RUpMTFJDa1FFN01jeGZ0Ry9wOFgyM0QyYndnaWw0SEVKcnZFUUVLLytncVNP?=
 =?utf-8?B?eDk5aDhFQmY1d2puNnF6WXVKTUZxTUVyaUVpdWZqWHVEeEVFdU1TOFZHUlkz?=
 =?utf-8?B?SWhsUmw5M3hoN3lxejhPR1gyeUFIbGs0aXpDcC9XVUg2ZlF3Rng3Y0U2L3RF?=
 =?utf-8?B?aEdsemtSRTBvNzdKV0xGTFZyMC9ZMFZQLzAwbVM2b2ZCY1JVUU5tQ2xacWJI?=
 =?utf-8?B?VUprdDh3bERtMFloT1BXS0JySjRDMjAwczFkbDlOUS9nTkUxLzM5ZFR5Z1Iy?=
 =?utf-8?B?dVE0djJvZzlqUjlOaWlmOWVJNDI5VTF5MUZ4alhlTDRRNkpxcmgyTjczeEx1?=
 =?utf-8?B?ZzZwN0NEQmxudW5Ta3BDdU5DWHhKV1dKcEhqN2tWYnR0dEFtQ3VvamJ5R29M?=
 =?utf-8?B?eEFGTlNBTG9OcTZRN0s0TGI1elBuNEN0OVg4blRaQzI2c1FHVC9DTzd3NUVr?=
 =?utf-8?B?NHVWQ1RvQUt1KzhQVE1UY09PMmJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(36860700013)(14060799003)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gBFG1/mDinCDXmIu6gVN3hsuxJ/DQIT0hsYndjpVnbD5jhPN8zEiuzWYCkI6vvoBNhjzI333vQr4UIvBZS1zONxZ7q5wSnE00X7uMlJkXSom3LUVm3ZUzaPgmn3AOcbQ9pcH0TEwA4LDgFt/qP+1Sl2WChtak6O5LJcvmx/ztYaPMIUWibPAJRa8v9GD6asHpvO/HZ/icMBicaAwhkfqp0uB9r/9cAh5wVqqpde2PAw1g1+kC69MxwN/ag3Zmhp1fqByAAcl+1H8TbUOyn0mn6Rqbrt+87fQmwdh+QQktqLKsEpSvV3WYjsmQECAqaEDi1XrnwE9ivU1xE57xSz9pUSHSty9Jjb9hKM7hm/yDId2fEev6Wtj8/O1EGwDt7HdsvTWR62oEcIL+3+sn4WrT+ZZID8KfuQf+hvBWHM3rdu+q/sGFzY/6ZTcPFTA8JbR
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 14:32:38.6351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2321c384-a8db-490f-b597-08de697a6828
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10840
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:mid,arm.com:dkim,arm.com:email];
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
X-Rspamd-Queue-Id: 1430A12542E
X-Rspamd-Action: no action

SGkgSmVucywNCg0KPiBPbiAxMSBGZWIgMjAyNiwgYXQgMTQ6MzQsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gV2VkLCBGZWIgMTEsIDIwMjYgYXQgMTI6MjfigK9QTSBCZXJ0cmFuZCBNYXJxdWlzDQo+
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBIaSBKZW5zLA0KPj4g
DQo+Pj4gT24gMTEgRmViIDIwMjYsIGF0IDA5OjE3LCBKZW5zIFdpa2xhbmRlciA8amVucy53aWts
YW5kZXJAbGluYXJvLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gSGkgQmVydHJhbmQsDQo+Pj4gDQo+
Pj4gT24gVHVlLCBGZWIgMywgMjAyNiBhdCA2OjM44oCvUE0gQmVydHJhbmQgTWFycXVpcw0KPj4+
IDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4+PiANCj4+Pj4gRkZBX0ZFQVRV
UkVTIGN1cnJlbnRseSBhY2NlcHRzIG5vbi16ZXJvIGlucHV0IHByb3BlcnRpZXMgKHcyLXc3KSBm
cm9tDQo+Pj4+IGd1ZXN0cyBhbmQgYWR2ZXJ0aXNlcyBzZXZlcmFsIEFCSXMgdW5jb25kaXRpb25h
bGx5LCBldmVuIHdoZW4gZmlybXdhcmUNCj4+Pj4gc3VwcG9ydCBpcyBtaXNzaW5nIG9yIHdoZW4g
dGhlIEFCSSBpcyBwaHlzaWNhbC1pbnN0YW5jZS1vbmx5LiBUaGlzIGNhbg0KPj4+PiBtaXNsZWFk
IGd1ZXN0cyBhYm91dCB3aGF0IFhlbiBjYW4gYWN0dWFsbHkgcHJvdmlkZSBhbmQgdmlvbGF0ZXMg
RkYtQQ0KPj4+PiBjYWxsaW5nIGNvbnZlbnRpb25zLiBTb21lIFNQTUNzIChIYWZuaXVtIHYyLjE0
IG9yIGVhcmxpZXIpIGFsc28gZmFpbCB0bw0KPj4+PiByZXBvcnQgRkZBX1JYX0FDUVVJUkUgZGVz
cGl0ZSBzdXBwb3J0aW5nIGl0Lg0KPj4+PiANCj4+Pj4gVXBkYXRlIEZGQV9GRUFUVVJFUyB2YWxp
ZGF0aW9uIHRvIG1hdGNoIHNwZWMgYW5kIGZpcm13YXJlIHN1cHBvcnQ6DQo+Pj4+IC0gcmVqZWN0
IG5vbi16ZXJvIHcyLXc3IGlucHV0IHByb3BlcnRpZXMgd2l0aCBJTlZBTElEX1BBUkFNRVRFUlMN
Cj4+Pj4gLSByZWplY3QgNjQtYml0IGNhbGxpbmcgY29udmVudGlvbnMgZnJvbSAzMi1iaXQgZ3Vl
c3RzIHdpdGggTk9UX1NVUFBPUlRFRA0KPj4+PiAtIHJldHVybiBOT1RfU1VQUE9SVEVEIGZvciBw
aHlzaWNhbC1pbnN0YW5jZS1vbmx5IEFCSXMNCj4+Pj4gKEZGQV9OT1RJRklDQVRJT05fQklUTUFQ
X3tDUkVBVEUsREVTVFJPWX0sIEZGQV9SWF9BQ1FVSVJFKQ0KPj4+PiAtIGFkdmVydGlzZSBGRkFf
SU5URVJSVVBUIGFzIHN1cHBvcnRlZA0KPj4+PiAtIGdhdGUgbWVzc2FnZSBBQklzIG9uIGZpcm13
YXJlIHN1cHBvcnQ6DQo+Pj4+IC0gRkZBX01TR19TRU5EX0RJUkVDVF9SRVFfezMyLDY0fQ0KPj4+
PiAtIEZGQV9NU0dfU0VORF9ESVJFQ1RfUkVRMiAoYWxzbyByZXF1aXJlcyBGRi1BIDEuMiBuZWdv
dGlhdGlvbikNCj4+Pj4gLSBGRkFfTVNHX1NFTkQyIChvciBWTS10by1WTSBlbmFibGVkKQ0KPj4+
PiAtIHJlcG9ydCBNRU1fU0hBUkVfezMyLDY0fSBvbmx5IHdoZW4gRkZBX01FTV9TSEFSRV82NCBp
cyBzdXBwb3J0ZWQNCj4+Pj4gLSBzdG9wIGFkdmVydGlzaW5nIEZGQV9NU0dfWUlFTEQgKG5vdCBp
bXBsZW1lbnRlZCkNCj4+Pj4gDQo+Pj4+IFVwZGF0ZSBmaXJtd2FyZSBwcm9iaW5nOiBkcm9wIEZG
QV9NRU1fU0hBUkVfMzIgY2hlY2tzIChkZXByZWNhdGVkKSBhbmQNCj4+Pj4gYWRkIEZGQV9SWF9B
Q1FVSVJFIHRvIHRoZSBwcm9iZWQgc2V0LiBJZiBGRkFfTVNHX1NFTkQyIGlzIHJlcG9ydGVkIGJ1
dA0KPj4+PiBGRkFfUlhfQUNRVUlSRSBpcyBub3QsIGFzc3VtZSBSWF9BQ1FVSVJFIHN1cHBvcnQg
YW5kIHdhcm4gdG8gd29yaw0KPj4+PiBhcm91bmQgdGhlIEhhZm5pdW0gYnVnLg0KPj4+PiANCj4+
Pj4gRnVuY3Rpb25hbCBpbXBhY3Q6IGd1ZXN0cyBub3cgc2VlIEFCSSBzdXBwb3J0IHRoYXQgcmVm
bGVjdHMgZmlybXdhcmUNCj4+Pj4gY2FwYWJpbGl0aWVzIGFuZCBYZW4gaW1wbGVtZW50YXRpb24g
c3RhdHVzLiBXaGVuIFNFTkQyIGlzIHByZXNlbnQgYnV0DQo+Pj4+IFJYX0FDUVVJUkUgaXMgbm90
IHJlcG9ydGVkLCBYZW4gYXNzdW1lcyBSWF9BQ1FVSVJFIHN1cHBvcnQuDQo+Pj4+IA0KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+
DQo+Pj4+IC0tLQ0KPj4+PiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jIHwgNjIgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tDQo+Pj4+IDEgZmlsZSBjaGFuZ2VkLCA1NSBp
bnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPj4+PiANCj4+Pj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS90ZWUvZmZhLmMgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+Pj4+IGluZGV4
IDZkZTJiOWY4YWM4ZS4uZTllMDIwYmIwY2IzIDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vYXJjaC9h
cm0vdGVlL2ZmYS5jDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+Pj4gQEAg
LTkxLDEwICs5MSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZmYV9md19hYmkgZmZhX2Z3X2Fi
aV9uZWVkZWRbXSA9IHsNCj4+Pj4gICAgRldfQUJJKEZGQV9QQVJUSVRJT05fSU5GT19HRVQpLA0K
Pj4+PiAgICBGV19BQkkoRkZBX05PVElGSUNBVElPTl9JTkZPX0dFVF82NCksDQo+Pj4+ICAgIEZX
X0FCSShGRkFfTk9USUZJQ0FUSU9OX0dFVCksDQo+Pj4+ICsgICAgRldfQUJJKEZGQV9SWF9BQ1FV
SVJFKSwNCj4+Pj4gICAgRldfQUJJKEZGQV9SWF9SRUxFQVNFKSwNCj4+Pj4gICAgRldfQUJJKEZG
QV9SWFRYX01BUF82NCksDQo+Pj4+ICAgIEZXX0FCSShGRkFfUlhUWF9VTk1BUCksDQo+Pj4+IC0g
ICAgRldfQUJJKEZGQV9NRU1fU0hBUkVfMzIpLA0KPj4+PiAgICBGV19BQkkoRkZBX01FTV9TSEFS
RV82NCksDQo+Pj4+ICAgIEZXX0FCSShGRkFfTUVNX1JFQ0xBSU0pLA0KPj4+PiAgICBGV19BQkko
RkZBX01TR19TRU5EX0RJUkVDVF9SRVFfMzIpLA0KPj4+PiBAQCAtMjQwLDE5ICsyNDAsMzkgQEAg
c3RhdGljIHZvaWQgaGFuZGxlX2ZlYXR1cmVzKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0K
Pj4+PiAgICBzdHJ1Y3QgZmZhX2N0eCAqY3R4ID0gZC0+YXJjaC50ZWU7DQo+Pj4+ICAgIHVuc2ln
bmVkIGludCBuOw0KPj4+PiANCj4+Pj4gKyAgICAvKg0KPj4+PiArICAgICAqIFhlbiBkb2VzIG5v
dCBhY2NlcHQgYW55IG5vbi16ZXJvIEZGQV9GRUFUVVJFUyBpbnB1dCBwcm9wZXJ0aWVzIGZyb20N
Cj4+Pj4gKyAgICAgKiBWTXMuIFRoZSBzcGVjIG9ubHkgZGVmaW5lcyB3MiBpbnB1dCBwcm9wZXJ0
aWVzIGZvciBGRkFfTUVNX1JFVFJJRVZFX1JFUQ0KPj4+PiArICAgICAqIChOUy1iaXQgbmVnb3Rp
YXRpb24gZm9yIFNQL1NQTUMpIGFuZCBGRkFfUlhUWF9NQVAgKGJ1ZmZlciBzaXplIGFuZA0KPj4+
PiArICAgICAqIGFsaWdubWVudCksIHNvIHcyIG11c3QgYmUgTUJaIGZvciBvdXIgY2FsbGVycy4N
Cj4+Pj4gKyAgICAgKi8NCj4+PiANCj4+PiBUaGUgc3BlYyAodmVyc2lvbiAxLjIpIGxpc3RzIHRo
ZW0gYXMgU0JaLCBleGNlcHQgZm9yIHcyLCB3aGljaCBpcyBNQlosDQo+Pj4gZm9yIEZlYXR1cmUg
SURzLg0KPj4gDQo+PiBWZXJ5IHRydWUsIHRoaXMgc2hvdWxkIG9ubHkgY2hlY2sgdzIgd2hpY2gg
aXMgYW55d2F5IGRlZmluZWQgYXMgTUJaIHdoZW4NCj4+IG5vdCB1c2VkLg0KPj4gdzMtdzcgd2Vy
ZSBNQlogaW4gcHJldmlvdXMgdmVyc2lvbnMgb2YgRkYtQSBidXQgYXJlIGluIGZhY3QgU0JaIGlu
IDEuMiBzbw0KPj4gd2Ugc2hvdWxkIGlnbm9yZSB0aGVtDQo+PiANCj4+PiBIb3dldmVyLCBpZiB3
ZSdyZSB0byByZXR1cm4gYW4gZXJyb3IsIGludmFsaWQgcGFyYW1ldGVycyBpcyBhIGJldHRlciBj
aG9pY2UuDQo+PiANCj4+IEluIGZhY3QgdGhlIHNwZWMgaXMgYWN0dWFsbHkgc2F5aW5nIHRoZSBm
b2xsb3dpbmc6DQo+PiBJZiB0aGUgRkYtQSBpbnRlcmZhY2Ugb3IgZmVhdHVyZSB0aGF0IHdhcyBx
dWVyaWVkIGlzIG5vdCBpbXBsZW1lbnRlZCBvciBpbnZhbGlkLA0KPj4gdGhlIGNhbGxlZSBjb21w
bGV0ZXMgdGhpcyBjYWxsIHdpdGggYW4gaW52b2NhdGlvbiBvZiB0aGUgRkZBX0VSUk9SIGludGVy
ZmFjZQ0KPj4gd2l0aCB0aGUgTk9UX1NVUFBPUlRFRCBlcnJvciBjb2RlLg0KPj4gDQo+PiBTbyB0
aGVyZSBpcyBubyBjYXNlIGZvciBJTlZBTElEX1BBUkFNRVRFUi4NCj4gDQo+IFlvdSdyZSByaWdo
dC4NCj4gDQo+PiANCj4+IFNvIGluIGZhY3QgaSBzaG91bGQ6DQo+PiAtIHJldHVybiBOT1RfU1VQ
UE9SVEVEIGlmIHcyIGlzIG5vdCAwDQo+PiAtIGlnbm9yZSB3My13Nw0KPj4gDQo+PiBDYW4geW91
IGNvbmZpcm0gdGhhdCB5b3UgaGF2ZSB0aGUgc2FtZSByZWFkaW5nIG9mIHRoZSBzcGVjIHRoYW4g
bWUgPw0KPiANCj4gVGhlIDEuMiBzcGVjIG9ubHkgc2F5cyB0aGlzIHcyIGlzIE1CWiBmb3IgRmVh
dHVyZSBJRHMsIGFuZCB0aGF0IHcyIGlzDQo+IFNCWiBmb3IgRkZBX1JYVFhfTUFQLiBUaGUgMS4z
IHNwZWMgc2F5cyB0aGUgc2FtZSwgZXhjZXB0IHRoYXQgaW4gVGFibGUNCj4gMTMuMTQ6IEZlYXR1
cmUgSURzIGFuZCBwcm9wZXJ0aWVzIHRhYmxlLCBpdCBsaXN0cyB3MiBhcyBTQlouDQo+IA0KPiBO
b3RlIHRoYXQgRkZBX01FTV9SRVRSSUVWRV9SRVEgaGFzIGJpdHMgZGVmaW5lZCBpbiB3MiwgYW5k
IHRoZSB1bmtub3duDQo+IGJpdHMgYXJlIFNCWi4NCj4gDQo+IEJhc2VkIG9uIHRoYXQsIEknbSBp
bmNsaW5lZCB0byBrZWVwIGl0IHNpbXBsZSBhbmQgaWdub3JlIHcyLXc3Lg0KDQpUaGF0IHdvdWxk
IG1ha2Ugc2Vuc2UsIEkgYWdyZWUuDQpJIHdpbGwgY2hlY2sgd2h5IEZGLUEgQUNTIHdhcyBmYWls
aW5nIHdoZW4gaSBkaWQgbm90IGhhdmUgdGhpcyBhbmQgaWYgaXQgc3RpbGwgdGhlIGNhc2UNCmFu
ZCBjb21lIGJhY2sgdG8geW91IGlmIGlnbm9yaW5nIGlzIG5vdCBhY2NlcHRhYmxlICh3aXRoIGEg
cmVhc29uKS4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo=

