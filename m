Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPHMIObuiWn4EQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:27:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B112111048A
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:27:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225478.1531989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSEm-0000IS-PZ; Mon, 09 Feb 2026 14:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225478.1531989; Mon, 09 Feb 2026 14:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSEm-0000Gt-MQ; Mon, 09 Feb 2026 14:27:40 +0000
Received: by outflank-mailman (input) for mailman id 1225478;
 Mon, 09 Feb 2026 14:27:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r8oy=AN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vpSEl-0000FS-Gd
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 14:27:39 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 792c9590-05c3-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 15:27:33 +0100 (CET)
Received: from AS4P189CA0036.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::7)
 by AS2PR08MB9452.eurprd08.prod.outlook.com (2603:10a6:20b:5e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 14:27:27 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::67) by AS4P189CA0036.outlook.office365.com
 (2603:10a6:20b:5dd::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 14:27:29 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Mon, 9 Feb 2026 14:27:27 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DU2PR08MB10086.eurprd08.prod.outlook.com (2603:10a6:10:46e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 14:26:24 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 14:26:22 +0000
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
X-Inumbo-ID: 792c9590-05c3-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AoNL3+yCoatm8+ICAgxh3JtJFozTjUJtjmXJc8gMVNryARboB7AgbxamRaiI2lAhHwL32+QIMQrFeRDMd2zbLPQP8o0YmIFdPb121SavNA3rtThfBUUHNfNAKhLvT1ej/joTfyu4Z4qfwzJVwke4arrAlB8u8LXwYUfUr2cTGD4XRlfsNGT/gACxJn3MAhrY/x6W4ONk9u4PR2sPB1J5XQEnHiA2EbyM1UlDm4HlXkjkgGKS8urW8QLR3oj7nQvB1ivga1Rm7Enz3kvdwa6mT8JbvBJf3NifYBJ2IrIj/0Af0x9TddTIZRJez6KQDyLvWrxQ3Vp7qm5etGntMFgkWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgX1f4XYBzZwg95rBGTNVggnM56nI/j4rRU/70lpU2w=;
 b=VdsYBM5QI7FfkmEbhSyRAvugDvpKvGJN4ZquonIFq9A9eN2nbzt04gswPVKbqTgrPCX1/BILxG/1ZlwjUe6n3qpUu7EzpGJjQk4FeWzxV0l6tDmKYYRF5QNFDopUZdRqubXIIHQdLUyoHG/JqHXAmogE1RyttcVCE1Aa0N+vZwu/txtUfzu17F0RtjYghWn/csrHUOh+G/iX7L0JCP+4B5Zc8PH0aY3ErQHgBKouIjfLunHNw2Aok29Lno4pQ1OYGm5kK/ibO/+2/fGqJ0GqGVABUJ7Of7bE6I1i/Mn6D8UEF3IxaxlvPvo6k7KlfUOm8nixAFlur+YzB4/fhsu9aA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgX1f4XYBzZwg95rBGTNVggnM56nI/j4rRU/70lpU2w=;
 b=m0AujePkWq0jYq8rMWXWflGJs6riT/iRRR/S00IauvVZBDp0BlkO50ScA8GdE9rby5ZL/8ZN/wmG1AGmhXjJLW9bk8Au++xmO7v5tofNbmbAWeJlpFLaE8RBIx12/X6sZmJ7oVDkGYLelcxCvWspq58VUvVkXhX1dUYCpnCgWME=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxfGAOlkXB35d5gtjJ88PZFBnXSIn2qUA4fBIQlP/vgl8rWgws5XPrPHazBnUJT6NRqIOTuKwNhEGAPN3fDLKyk5pqu8dpDhW8ho8qigPTIz/msqGF20dXvW/sy7+pwlDF0gCWk3Qua1KgOGi4axI0m3P6bL+i2vAA/NIQ0jLO5GFvSooq8REBFELmtBotsAfslm3elG5tHVH+LAP80vyLnW48vW5USh7mahZuM8IPF9+D9xZ6Emqh+AFPXu0r7l4LHYNmlNgGskNy9pOGPFkiPZzVlnCBJEn65hEkVV4TGtFli0YMcgQuBuykkGA4Gz9+FwkWa2IBi4qkYQgbvnKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgX1f4XYBzZwg95rBGTNVggnM56nI/j4rRU/70lpU2w=;
 b=uxexYDBylKBWYabDyNfaMDSi5Q4kr5/1yZLmHhDBfB7/ClaDht+nxvO1Sa3mRjfnvh6K+/KPORNj5I+78rxnn5EWw4ChZVf8aB/bDfvqubJzCLdgo1IMUtLCx8vKKyfOHoQei3QijND5C9mURVQ84C7wcLozCym5c9oZtR6E69PSBHKZlszmfS/yq2V1WKjdKkWU89M8lHyl+fw9bWBbOx9++KugsaZreovAIMD0COUSqyiC+I9qdwdGSGuWFZzuzSsXgO0KepWtcbcS3kCq4r23ma9vFQ9aCoFSCw+wLBJcsoMZ6lxiD6odfS91cNVdmk2fUuTqDn3dhXnL1EX8aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgX1f4XYBzZwg95rBGTNVggnM56nI/j4rRU/70lpU2w=;
 b=m0AujePkWq0jYq8rMWXWflGJs6riT/iRRR/S00IauvVZBDp0BlkO50ScA8GdE9rby5ZL/8ZN/wmG1AGmhXjJLW9bk8Au++xmO7v5tofNbmbAWeJlpFLaE8RBIx12/X6sZmJ7oVDkGYLelcxCvWspq58VUvVkXhX1dUYCpnCgWME=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 03/12] xen/arm: ffa: Harden shm page parsing
Thread-Topic: [PATCH 03/12] xen/arm: ffa: Harden shm page parsing
Thread-Index: AQHclTP8S4iGL6T7pUmD4E2SewFDhLV6I0SAgABSaAA=
Date: Mon, 9 Feb 2026 14:26:22 +0000
Message-ID: <19C7C710-4447-42AC-AFF3-F3122606BC0C@arm.com>
References: <cover.1770115301.git.bertrand.marquis@arm.com>
 <97a064c81ee5ea26774c189538f9f1e37dd3eebc.1770115302.git.bertrand.marquis@arm.com>
 <CAHUa44Ey=Ph_m8r933K5enqPJgFuyVgY+2Qhtj3pi+V_Fw4=6A@mail.gmail.com>
In-Reply-To:
 <CAHUa44Ey=Ph_m8r933K5enqPJgFuyVgY+2Qhtj3pi+V_Fw4=6A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DU2PR08MB10086:EE_|AM3PEPF00009B9B:EE_|AS2PR08MB9452:EE_
X-MS-Office365-Filtering-Correlation-Id: 728130d7-4397-4b38-81f1-08de67e75993
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NzdKOFFJRDhzMlpmZGsrczZWbTRoREZ1MW41bXVOYnprRmlxV0hKS1laaWkv?=
 =?utf-8?B?K2hoQ0R5WWI3SnlhZE5kYzVqbkVhOGdta1lta1VQOWgzbmVOL08vWnRzYTFj?=
 =?utf-8?B?TWpHMUk5NlZEMWRyZWx0YjloSm5vMmR3NGpIRzZ3dVFFWlJhTG9yVVZKY3d2?=
 =?utf-8?B?bkp3YklhV3pKMmdFMm5SdHRUTjhLZUZsMlJvb3EwdVA1aFQ4OVFXZnpuQ0lO?=
 =?utf-8?B?eTRiNTFrYjhxT2NhVXcva21uRWJnWkFsMFhOc0o2aDNzMnBLdWdXVWd0cTlG?=
 =?utf-8?B?VDdxWDRnTndHbkk3UXVUcXVMRlV3b1Bld3ZvMDllY05ONmhUOXVNejdidmFU?=
 =?utf-8?B?MklyWkZET2NYZ1ZoOHM1TCt5aVMxVndvbzViNlFXTXU5TXkzUzlENjYwS2JK?=
 =?utf-8?B?VDNmWEhxTW5pWUtabERzQU9mbzZuekxQSUJ6SEIzRHpkdkhubnJ4RExRMmZy?=
 =?utf-8?B?UFczdnRLeEZHbmE1ZEs4ZXpFekQrUDZyL0lYZEhtVThQRk1HTk1YaFhVL0tH?=
 =?utf-8?B?MlpUZHIvZzFsREYxRCtaQS9id2JiVURBblNXelh2NmxBV3VMQkhjcHNTRFlH?=
 =?utf-8?B?NTB2SUVMWEF2U1ZJdGo5V095VEo5UFN1SnNwRXBwa2ErT3N4MHpuYkJIVjBl?=
 =?utf-8?B?bU1mWGtoSU9ZL2YwTFpGUjRxK0JNdGRIODNDYzcraGtWaDNuSjZHR1daamFH?=
 =?utf-8?B?clNkVTR3alB1cTUyNWNVWmtiWHBjekpxUSt2SVVQdnJMc3ovVmFvalRrK3U1?=
 =?utf-8?B?bW04MEtnOXF0QmxHWGtCWFpPMDd6dGl0M3FjcjVhbXgyb0ZrVUdWNStBU3c1?=
 =?utf-8?B?bkRIbWluaWVjNGo1VTBWYVUvdWVoREp5YnRmTm1rYUtqcDY2aGpEYUZNbVVo?=
 =?utf-8?B?UDh6YVdHMkVINGtzQmVaVmMxRmZoZHk4a1hyRW54NXZnbU9aamdrQUpUOU1T?=
 =?utf-8?B?ZWhneTAwVmpZVzNEQWxDY0h5NWc1U28yLzNDL01DUjl2V3hwUkx1aFoyeFJw?=
 =?utf-8?B?YzM3S0Q3dzJpYk5LOXlmRzUyNFhjdEhTdnBEZE9MU3BiazhLWnRNVUtGV3Vl?=
 =?utf-8?B?N283UWlia1pPL3QwM2hXLy9iR2pyS1REdmRoU1d5ZjlPMVhMc3ZoNmQxODNu?=
 =?utf-8?B?NUxwVkNDZ0dRWFM1WUpRR0JId2NHb1NZRlZQNUtxS2IwTGNPRkt0ZEZJSi9r?=
 =?utf-8?B?eXZ5Q25uZjk0TzdTR3Z3S20xMjcvL0FjRkVYTUdob3BiZDBndE1XZFdPMzV6?=
 =?utf-8?B?YXZXVUhuNHNvdzlDT0Izb3lRNEw5bCtYazlKYXF3TDZlU0ZSU1dDbU5waCtQ?=
 =?utf-8?B?ZUlXeW02ek95azBjVTlWUWd2S3VmeWprY1JLZDRrWHdtMDFneFhvekZvLzdW?=
 =?utf-8?B?alJkcHZ2eGlmUkRwNzVCZnNXTVFYT1g4bkJ5cHdNWkNkaDFVMUFXR21keFc2?=
 =?utf-8?B?d05DeG8vUGtyeUdHb2MzaWZPNUhTZHpjYm4vZmRGVnNGSU9kdXg5WW5lWDdn?=
 =?utf-8?B?c1NIVW1CZjhEVjJocWt0SUxRdDRNdmtrSk9Xb2JVUXpvMWlrS1ZKWDljeHFI?=
 =?utf-8?B?YVlndEd6MHU4OXJFdVNDRlFOZ3lyZDd0YlF2RHdJd2ltY2NMSzUzbUdmMkdk?=
 =?utf-8?B?ZDEwRnFGOHpaV2J6Y0g5eGQ4WW1XaFNVYjZ4cVVhNXVtZzVlUlNydzZ5dEJz?=
 =?utf-8?B?Y3A4RXJGeG5MVWZyWVZ6UEJmQU5KRUtYa3gvVG5MMXV1emYram1BQ2lXbGFz?=
 =?utf-8?B?cWw2M0hNN0I0RjEwY3JFT1BWcHdVMGNjL0xOaHFTVFZvcHBDeXpsTzhhUlBj?=
 =?utf-8?B?VDNpUlM1bTRmejFJTTVaV2xLRUIvN0VCS1Juek42dnIvQndxMmZuTlRKdm0r?=
 =?utf-8?B?RGZNdkpoUFJZbG9Jd1VTK0IvazFTUUxzSmt5ZGt6bnlNblArTklURXpxRmZS?=
 =?utf-8?B?QXlWWSs3a1FYTEFQYmlnTzlmaS9oOHJ2MUdjTEt5aDdxSkpDaE9PY0JCMkNH?=
 =?utf-8?B?NXFySmdqVlh1c3ovNEFieGFDb2FaNjVCdkpEbFhCbjlnZng4QUx3d2ZQdVhR?=
 =?utf-8?B?azhWM3FSTlAwMUJaN0FFNE1mUmVGNWR5SGdFTnFzWE1CTGxMMXNQenJiUGhP?=
 =?utf-8?B?ZHFrSUpCUmxFY3I2SmdVYi9WMmtxQnBqTEhrU1ZETnhZcUgzQjh5dkVuamVV?=
 =?utf-8?Q?dg4dPyLv8TgGBm8r8R2uVxo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C22528AF9CAF1A47B7AC2B646D239920@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10086
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4426807f-821d-40a2-9616-08de67e7331f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|376014|1800799024|36860700013|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVBQTUNDeUF0MTh5bllkNmNKUjJWdUE2Q0FDWk5QZGpDRHRMdGdOZXE1ZE1L?=
 =?utf-8?B?akY2aTM2NUhNN1ZGN1BCcjNtZUEzZDhmbE5IcTB6TjRFRUVwckQyN2Jicmkr?=
 =?utf-8?B?bnhHMVZ4NFNiUWMvMXovRVNRUkgwa0RCQlFnK1c3ODNROWVHZkFjdjlTNFBL?=
 =?utf-8?B?aW1kNFhNa1lTekhPZTQ1SlVaNXRrd0JiOG42akRrRnkwNTVBM3lCNGRuT3dG?=
 =?utf-8?B?YVdGcDlmcWxJUFFqR2laNVlkR1hpdmFPL0xFbFVLWkRhS1ZuRzVCU3hYU0k2?=
 =?utf-8?B?SEJxRlRtaXB5OHczUzZ3anpadUh1SnB3Vm82by92aVV5OHZ2U3JVQjNuRUR2?=
 =?utf-8?B?Uk1zSGs1bFFQWFpINWtIOUJMem4rZHFwWStPK3B5SlczZ0RqaWFuODl3dEt4?=
 =?utf-8?B?MTQ0bkpSSS81QjgyMjR0ZENwcmZKYm9WZDVVZlhuVis5azFlcy80TVBrMXhG?=
 =?utf-8?B?WTY4QkJYMjFsT1BWdWE3elVCRUVVYnJNMTBlUnAvSjFIdzljdmV2OHBJbmNm?=
 =?utf-8?B?NVhPL3djUXBSOHN1dmQxRHJZUGJoWFpXUSttWGg4YzFJQUxGMXNBQThyY0R0?=
 =?utf-8?B?REJTa29wcW9BUUE4YXRUQUZKQitJd0JtYktXdzJ0YjdKNmRjWmEyZEwwT01P?=
 =?utf-8?B?cXZ5NzA1K1BBRlFGQ1VRY3NNdnBCbHNIUHJ6RkNSbUcxMkxrcFlJR2NaV2do?=
 =?utf-8?B?b0pFRFJ0Uy9CTkJFdUYrNUhXLzY5c0YzM1Z4eXMxVDlVeitSZFhYWjhNZEp5?=
 =?utf-8?B?amF2S1kvNzhFU3hOQUNRQ3RDd0pSakxIemlKN2FjL1NSTjQ5Y3NvZEVUeSt3?=
 =?utf-8?B?aERlZ0d6a1ZoUk1YSG85dXhua0Q4MnUxZDdscUhiNDkrUHltbUNuWGdPMi9T?=
 =?utf-8?B?Vmx6TVo3a3Nnem9zMWowNU40anNCRXdpNnlpQVRSdVRpT0VDR294ME1MV0xY?=
 =?utf-8?B?OGN5Z3hMR1ZpNG0xVjZ3L2xSQUVQcFdMdVhGaVdFMHdERW12QkR0SFUzT1ZC?=
 =?utf-8?B?MjhqUG1FeFB3MHpmeFExNk9rZlRWY0Z4bU4zQndMM1g4dFF2cjEzOUp4Z00x?=
 =?utf-8?B?NExhVFNrakEwQ1FKbExBUC95eVhYd2RxbkRKa2JHbU9XZHNXTFF4NGg0YVJ1?=
 =?utf-8?B?L3ZaN2VyUFZSZ3JiSWZoZzlBQlprUnVUTzFJci9FTitUaGRUMDViV1ppVitt?=
 =?utf-8?B?dGxqLytLNlAySDBvSUE0alVDKzY3RXlUMmlLMXNIcjdCUVVkOE5JV1FDdkd0?=
 =?utf-8?B?QkF2SnpvQmR1eWZEVXVWa2lDYXNGeEZCQ0J6YjhseGo2UEJpeTN6dWErKzZp?=
 =?utf-8?B?UzA3QnRZaTNQQk9JZFl3eXFjRTFQbThTM2UybTRQTlloUC9OZEYrQXh4NXNR?=
 =?utf-8?B?KzYrc1EyeXQvMTlVbEdxU2FlREdQbVFxRVcxYVVxMGNNS1FPMkpRbnl4WkZE?=
 =?utf-8?B?bjQ2WFRhL0pQbHl5aXJrU2VzVUR6Sm5jcWVHUGt5bm5BZG8vTmpNUFFnTmtH?=
 =?utf-8?B?ZHF5UWJkL3hKWllRTFFWMU8wWXFCTjFpZ3ZzcWY2dnhpUmVJeHJ3M01na3pp?=
 =?utf-8?B?YnhGYzA2QlErcGVqV0ptZkJpRENpdTl4QmRZRGpEaTZHdEJhNlNZS2tXMThu?=
 =?utf-8?B?cHBVUkVLU2I1bjBiUUFEQndMaWhleWVYVU01MlNuMWJaUTllZ25wVHVNYnRJ?=
 =?utf-8?B?Q0VUZVVNaTU4VkxPVmZWek1tblowU3l5MnJ3T1NKMlB3OWNuOHVnUkkwY3lI?=
 =?utf-8?B?OUthNUxOTGxMYXkvNlpCZ2RNTFl5Um5BeGdEWWRpakY5THBlOFRhQUdRUmlN?=
 =?utf-8?B?QXJpTE5jbVc2ejJ2OTdJSkFGWEp0cWU1UzdPVGw5THRTVWVoclJNS21RL2Fm?=
 =?utf-8?B?Ym1wUG9KdHFJMU1LOWZNN25VN3czOEZwMCtvOVJ1RkZYOVJMM01ucEJOci8w?=
 =?utf-8?B?YXdhbXoxckZUcDZSaTdRZ3kydUR0QnVCZnpmUGZOMjhDaGxQeUswVHhqTFN6?=
 =?utf-8?B?THhKVmR5cWExcFJoSDk3blhpbVJ2VEp0N0VJQ2MyQUx1NFlxbDJ1dHhEYm9C?=
 =?utf-8?B?Mlp4dnBNRE8rdUwvcmMrSFJaZmoydnpsRk1ZdU5aYWlaampkTW8rR0RHRDh0?=
 =?utf-8?B?cm52MUYwOW4xSnk4VURvWXVTLzJRT2Yyb0ZpOXZ1cHRiU0ZhWjk4UmxxbHVQ?=
 =?utf-8?B?QkVnRjBIQlBHRnAwaEZ2ZmlWUitDbndlVnl2dGprVDF5dmU1enBoU2dyOENE?=
 =?utf-8?B?blMvTzdyOHRHS3g4QjZtdHRRUEpBPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(376014)(1800799024)(36860700013)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GJYJMpiYeoQYJAzGULemeHUB8igNpXFtDLwnH5HuRbkumlTFbxFC834ADiIS5hnOGjgRNtmTKHRhZ98nd9aPAiJ+FTWQDsSRhcluCXeeyePScclDnvdGkAlMr5DzaiJ+O0wikrGV/+rroQ38oaeoG5F0R3DTcCmUPsfwHGpPDtQmXNwAvxqBwh9gplQSJv8kZDcgdKdpghQoq3ePb0VdDHqurBtp2WXDymHbwlqGv+X4Id1lptgdDhpGTb/k/qL2TB2Ae2SCeB//acM3xYAELiYYEU+X0nNdn/71Omhi8GgUbTVEDSHyg0mVBo55RHoHiZvKOX1rxa+VSVDl34jiK/IUJ/Wa4fXsaosjVChxkBJHNTavylTs4mkO5TDFpvrc21KkIyomghl/UXOjMp/XLzZ3nC4uCDHDe3+KPesLLWPQCY8j48G/XjL3Ih59KlxA
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 14:27:27.0122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 728130d7-4397-4b38-81f1-08de67e75993
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9452
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,linaro.org:email];
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
X-Rspamd-Queue-Id: B112111048A
X-Rspamd-Action: no action

SGkgSmVucywNCg0KPiBPbiA5IEZlYiAyMDI2LCBhdCAxMDozMSwgSmVucyBXaWtsYW5kZXIgPGpl
bnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gSGkgQmVydHJhbmQsDQo+IA0K
PiBPbiBUdWUsIEZlYiAzLCAyMDI2IGF0IDY6MzjigK9QTSBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxi
ZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBnZXRfc2htX3BhZ2VzKCkg
dXNlcyB1bmNoZWNrZWQgYWRkcmVzcyBhcml0aG1ldGljIGFuZCBkb2VzIG5vdCBlbmZvcmNlDQo+
PiBhbGlnbm1lbnQsIHNvIG1hbGZvcm1lZCBkZXNjcmlwdG9ycyBjYW4gY2F1c2Ugb3ZlcmZsb3cg
b3Igc2xpcCB0aHJvdWdoDQo+PiB2YWxpZGF0aW9uLiBUaGUgcmVjbGFpbSBwYXRoIGFsc28gcmVw
ZWF0cyBoYW5kbGUtdG8tc2htLW1lbSBjb252ZXJzaW9uDQo+PiBpbiBtdWx0aXBsZSBwbGFjZXMs
IGR1cGxpY2F0aW5nIGVycm9yIGhhbmRsaW5nLg0KPj4gDQo+PiBIYXJkZW4gcGFnZSBwYXJzaW5n
IGFuZCByZWNsYWltIGhhbmRsaW5nOg0KPj4gLSBhZGQgZmZhX3NhZmVfYWRkcl9hZGQoKSBhbmQg
dXNlIGl0IHRvIGRldGVjdCBhZGRyZXNzIG92ZXJmbG93cw0KPj4gLSBlbmZvcmNlIGFsaWdubWVu
dCBjaGVja3MgaW4gZ2V0X3NobV9wYWdlcygpIGFuZCByZXR1cm4gRkYtQSBlcnJvcnMNCj4+IC0g
aW50cm9kdWNlIGZmYV9zZWN1cmVfcmVjbGFpbSgpIGFuZCB1c2UgaXQgZm9yIE1FTV9SRUNMQUlN
IGFuZCB0ZWFyZG93bg0KPj4gLSBzaW1wbGlmeSBmZmFfbWVtX3NoYXJlKCkgYXJndW1lbnQgaGFu
ZGxpbmcgYW5kIGFsbG93IG1heCBwYWdlIGNvdW50DQo+PiANCj4+IEZ1bmN0aW9uYWwgaW1wYWN0
OiBpbnZhbGlkIG9yIG1pc2FsaWduZWQgbWVtb3J5IHJhbmdlcyBub3cgZmFpbCBlYXJsaWVyDQo+
PiB3aXRoIHByb3BlciBlcnJvciBjb2RlczsgYmVoYXZpb3IgZm9yIHZhbGlkIGRlc2NyaXB0b3Jz
IGlzIHVuY2hhbmdlZC4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogQmVydHJhbmQgTWFycXVpcyA8
YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPj4gLS0tDQo+PiB4ZW4vYXJjaC9hcm0vdGVlL2Zm
YV9wcml2YXRlLmggfCAxMSArKysrKysrDQo+PiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYV9zaG0uYyAg
ICAgfCA1NyArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tDQo+PiAyIGZpbGVzIGNo
YW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5oIGIveGVuL2FyY2gvYXJtL3RlZS9m
ZmFfcHJpdmF0ZS5oDQo+PiBpbmRleCBiNjI1ZjFjNzI5MTQuLjU4NTYyZDhlNzMzYyAxMDA2NDQN
Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaA0KPj4gKysrIGIveGVuL2Fy
Y2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5oDQo+PiBAQCAtNjMyLDQgKzYzMiwxNSBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgZmZhX3V1aWRfc2V0KHN0cnVjdCBmZmFfdXVpZCAqaWQsIHVpbnQzMl90IHZh
bDAsDQo+PiAgICAgaWQtPnZhbFsxXSA9ICgodWludDY0X3QpdmFsMyA8PCAzMlUpIHwgdmFsMjsN
Cj4+IH0NCj4+IA0KPj4gKy8qDQo+PiArICogQ29tbW9uIG92ZXJmbG93LXNhZmUgaGVscGVyIHRv
IHZlcmlmeSB0aGF0IGFkZGluZyBhIG51bWJlciBvZiBwYWdlcyB0byBhbg0KPj4gKyAqIGFkZHJl
c3Mgd2lsbCBub3Qgd3JhcCBhcm91bmQuDQo+PiArICovDQo+PiArc3RhdGljIGlubGluZSBib29s
IGZmYV9zYWZlX2FkZHJfYWRkKHVpbnQ2NF90IGFkZHIsIHVpbnQ2NF90IHBhZ2VzKQ0KPj4gK3sN
Cj4+ICsgICAgdWludDY0X3Qgb2ZmID0gcGFnZXMgKiBGRkFfUEFHRV9TSVpFOw0KPj4gKw0KPj4g
KyAgICByZXR1cm4gKG9mZiAvIEZGQV9QQUdFX1NJWkUpID09IHBhZ2VzICYmIGFkZHIgPD0gVUlO
VDY0X01BWCAtIG9mZjsNCj4+ICt9DQo+PiArDQo+PiAjZW5kaWYgLypfX0ZGQV9QUklWQVRFX0hf
XyovDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfc2htLmMgYi94ZW4vYXJj
aC9hcm0vdGVlL2ZmYV9zaG0uYw0KPj4gaW5kZXggOTA4MDBlNDRhODZhLi40YzBiNDVjZGU2ZWUg
MTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9zaG0uYw0KPj4gKysrIGIveGVu
L2FyY2gvYXJtL3RlZS9mZmFfc2htLmMNCj4+IEBAIC05NiwxNiArOTYsMTQgQEAgc3RydWN0IGZm
YV9zaG1fbWVtIHsNCj4+ICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlc1tdOw0KPj4gfTsNCj4+
IA0KPj4gLXN0YXRpYyBpbnQzMl90IGZmYV9tZW1fc2hhcmUodWludDMyX3QgdG90X2xlbiwgdWlu
dDMyX3QgZnJhZ19sZW4sDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWdpc3Rl
cl90IGFkZHIsIHVpbnQzMl90IHBnX2NvdW50LA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdWludDY0X3QgKmhhbmRsZSkNCj4+ICtzdGF0aWMgaW50MzJfdCBmZmFfbWVtX3NoYXJl
KHVpbnQzMl90IHRvdF9sZW4sIHVpbnQ2NF90ICpoYW5kbGUpDQo+PiB7DQo+PiAgICAgc3RydWN0
IGFybV9zbWNjY18xXzJfcmVncyBhcmcgPSB7DQo+PiAgICAgICAgIC5hMCA9IEZGQV9NRU1fU0hB
UkVfNjQsDQo+PiAgICAgICAgIC5hMSA9IHRvdF9sZW4sDQo+PiAtICAgICAgICAuYTIgPSBmcmFn
X2xlbiwNCj4+IC0gICAgICAgIC5hMyA9IGFkZHIsDQo+PiAtICAgICAgICAuYTQgPSBwZ19jb3Vu
dCwNCj4+ICsgICAgICAgIC5hMiA9IHRvdF9sZW4sDQo+PiArICAgICAgICAuYTMgPSAwLA0KPj4g
KyAgICAgICAgLmE0ID0gMCwNCj4+ICAgICB9Ow0KPj4gICAgIHN0cnVjdCBhcm1fc21jY2NfMV8y
X3JlZ3MgcmVzcDsNCj4+IA0KPj4gQEAgLTEzMSwxMiArMTI5LDE2IEBAIHN0YXRpYyBpbnQzMl90
IGZmYV9tZW1fc2hhcmUodWludDMyX3QgdG90X2xlbiwgdWludDMyX3QgZnJhZ19sZW4sDQo+PiAg
ICAgfQ0KPj4gfQ0KPj4gDQo+PiAtc3RhdGljIGludDMyX3QgZmZhX21lbV9yZWNsYWltKHVpbnQz
Ml90IGhhbmRsZV9sbywgdWludDMyX3QgaGFuZGxlX2hpLA0KPj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1aW50MzJfdCBmbGFncykNCj4+ICtzdGF0aWMgaW50MzJfdCBmZmFfc2Vj
dXJlX3JlY2xhaW0oc3RydWN0IGZmYV9zaG1fbWVtICpzaG0sIHVpbnQzMl90IGZsYWdzKQ0KPiAN
Cj4gSSBhZ3JlZSB3aXRoIG1vdmluZyB0aGUgdWludDY0X3RvX3JlZ3BhaXIoKSBjYWxsIGludG8g
dGhpcyBmdW5jdGlvbiwNCj4gYnV0IEknbSBwdXp6bGVkIGJ5IHRoZSBuZXcgbmFtZS4gV2hhdCdz
IHNlY3VyZT8NCg0KVGhpcyBpcyB0byBkaXN0aW5ndWlzaCB3aXRoIHJlY2xhaW0gZm9yIFZNIHRv
IFZNIHNoYXJpbmcgaW4gdGhlIGZ1dHVyZSBhcyBoZXJlDQpyZWNsYWltIGlzIGFza2VkIHRvIHRo
ZSBzZWN1cmUgd29ybGQuDQoNCkJ1dCBpbiBmYWN0IHRvIGJlIGNvaGVyZW50IEkgc2hvdWxkIGFs
c28gaGF2ZSByZW5hbWVkIGZmYV9tZW1fc2hhcmUgdG8gZmZhX3NlY3VyZV9zaGFyZS4NCg0KV291
bGQgeW91IGJlIG9rIHdpdGggdGhhdCA/DQoNCj4gDQo+PiB7DQo+PiArICAgIHJlZ2lzdGVyX3Qg
aGFuZGxlX2hpOw0KPj4gKyAgICByZWdpc3Rlcl90IGhhbmRsZV9sbzsNCj4+ICsNCj4+ICAgICBp
ZiAoICFmZmFfZndfc3VwcG9ydHNfZmlkKEZGQV9NRU1fUkVDTEFJTSkgKQ0KPj4gICAgICAgICBy
ZXR1cm4gRkZBX1JFVF9OT1RfU1VQUE9SVEVEOw0KPj4gDQo+PiArICAgIHVpbnQ2NF90b19yZWdw
YWlyKCZoYW5kbGVfaGksICZoYW5kbGVfbG8sIHNobS0+aGFuZGxlKTsNCj4+ICsNCj4+ICAgICBy
ZXR1cm4gZmZhX3NpbXBsZV9jYWxsKEZGQV9NRU1fUkVDTEFJTSwgaGFuZGxlX2xvLCBoYW5kbGVf
aGksIGZsYWdzLCAwKTsNCj4+IH0NCj4+IA0KPj4gQEAgLTE0NSw3ICsxNDcsNyBAQCBzdGF0aWMg
aW50MzJfdCBmZmFfbWVtX3JlY2xhaW0odWludDMyX3QgaGFuZGxlX2xvLCB1aW50MzJfdCBoYW5k
bGVfaGksDQo+PiAgKiB0aGlzIGZ1bmN0aW9uIGZhaWxzIHRoZW4gdGhlIGNhbGxlciBpcyBzdGls
bCBleHBlY3RlZCB0byBjYWxsDQo+PiAgKiBwdXRfc2htX3BhZ2VzKCkgYXMgYSBjbGVhbnVwLg0K
Pj4gICovDQo+PiAtc3RhdGljIGludCBnZXRfc2htX3BhZ2VzKHN0cnVjdCBkb21haW4gKmQsIHN0
cnVjdCBmZmFfc2htX21lbSAqc2htLA0KPj4gK3N0YXRpYyBpbnQzMl90IGdldF9zaG1fcGFnZXMo
c3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGZmYV9zaG1fbWVtICpzaG0sDQo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGZmYV9hZGRyZXNzX3JhbmdlICpyYW5nZSwNCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCByYW5nZV9jb3VudCkNCj4+IHsNCj4+
IEBAIC0xNTYsMTcgKzE1OCwyNiBAQCBzdGF0aWMgaW50IGdldF9zaG1fcGFnZXMoc3RydWN0IGRv
bWFpbiAqZCwgc3RydWN0IGZmYV9zaG1fbWVtICpzaG0sDQo+PiAgICAgcDJtX3R5cGVfdCB0Ow0K
Pj4gICAgIHVpbnQ2NF90IGFkZHI7DQo+PiAgICAgdWludDY0X3QgcGFnZV9jb3VudDsNCj4+ICsg
ICAgdWludDY0X3QgZ2FkZHI7DQo+PiANCj4+ICAgICBmb3IgKCBuID0gMDsgbiA8IHJhbmdlX2Nv
dW50OyBuKysgKQ0KPj4gICAgIHsNCj4+ICAgICAgICAgcGFnZV9jb3VudCA9IEFDQ0VTU19PTkNF
KHJhbmdlW25dLnBhZ2VfY291bnQpOw0KPj4gICAgICAgICBhZGRyID0gQUNDRVNTX09OQ0UocmFu
Z2Vbbl0uYWRkcmVzcyk7DQo+PiArDQo+PiArICAgICAgICBpZiAoICFJU19BTElHTkVEKGFkZHIs
IEZGQV9QQUdFX1NJWkUpICkNCj4+ICsgICAgICAgICAgICByZXR1cm4gRkZBX1JFVF9JTlZBTElE
X1BBUkFNRVRFUlM7DQo+PiArDQo+PiAgICAgICAgIGZvciAoIG0gPSAwOyBtIDwgcGFnZV9jb3Vu
dDsgbSsrICkNCj4+ICAgICAgICAgew0KPj4gICAgICAgICAgICAgaWYgKCBwZ19pZHggPj0gc2ht
LT5wYWdlX2NvdW50ICkNCj4+ICAgICAgICAgICAgICAgICByZXR1cm4gRkZBX1JFVF9JTlZBTElE
X1BBUkFNRVRFUlM7DQo+PiANCj4+IC0gICAgICAgICAgICBnZm4gPSBnYWRkcl90b19nZm4oYWRk
ciArIG0gKiBGRkFfUEFHRV9TSVpFKTsNCj4+ICsgICAgICAgICAgICBpZiAoICFmZmFfc2FmZV9h
ZGRyX2FkZChhZGRyLCBtKSApDQo+PiArICAgICAgICAgICAgICAgIHJldHVybiBGRkFfUkVUX0lO
VkFMSURfUEFSQU1FVEVSUzsNCj4+ICsNCj4+ICsgICAgICAgICAgICBnYWRkciA9IGFkZHIgKyBt
ICogRkZBX1BBR0VfU0laRTsNCj4+ICsgICAgICAgICAgICBnZm4gPSBnYWRkcl90b19nZm4oZ2Fk
ZHIpOw0KPj4gICAgICAgICAgICAgc2htLT5wYWdlc1twZ19pZHhdID0gZ2V0X3BhZ2VfZnJvbV9n
Zm4oZCwgZ2ZuX3goZ2ZuKSwgJnQsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFAyTV9BTExPQyk7DQo+PiAgICAgICAgICAgICBpZiAoICFzaG0t
PnBhZ2VzW3BnX2lkeF0gKQ0KPj4gQEAgLTE4MCw3ICsxOTEsNyBAQCBzdGF0aWMgaW50IGdldF9z
aG1fcGFnZXMoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGZmYV9zaG1fbWVtICpzaG0sDQo+PiAN
Cj4+ICAgICAvKiBUaGUgcmFuZ2VzIG11c3QgYWRkIHVwICovDQo+PiAgICAgaWYgKCBwZ19pZHgg
PCBzaG0tPnBhZ2VfY291bnQgKQ0KPj4gLSAgICAgICAgICAgIHJldHVybiBGRkFfUkVUX0lOVkFM
SURfUEFSQU1FVEVSUzsNCj4+ICsgICAgICAgIHJldHVybiBGRkFfUkVUX0lOVkFMSURfUEFSQU1F
VEVSUzsNCj4+IA0KPj4gICAgIHJldHVybiBGRkFfUkVUX09LOw0KPj4gfQ0KPj4gQEAgLTE5OCwx
NSArMjA5LDExIEBAIHN0YXRpYyB2b2lkIHB1dF9zaG1fcGFnZXMoc3RydWN0IGZmYV9zaG1fbWVt
ICpzaG0pDQo+PiANCj4+IHN0YXRpYyBib29sIGluY19jdHhfc2htX2NvdW50KHN0cnVjdCBkb21h
aW4gKmQsIHN0cnVjdCBmZmFfY3R4ICpjdHgpDQo+PiB7DQo+PiAtICAgIGJvb2wgcmV0ID0gdHJ1
ZTsNCj4+ICsgICAgYm9vbCByZXQgPSBmYWxzZTsNCj4+IA0KPj4gICAgIHNwaW5fbG9jaygmY3R4
LT5sb2NrKTsNCj4+IA0KPj4gLSAgICBpZiAoIGN0eC0+c2htX2NvdW50ID49IEZGQV9NQVhfU0hN
X0NPVU5UICkNCj4+IC0gICAgew0KPj4gLSAgICAgICAgcmV0ID0gZmFsc2U7DQo+PiAtICAgIH0N
Cj4+IC0gICAgZWxzZQ0KPj4gKyAgICBpZiAoIGN0eC0+c2htX2NvdW50IDwgRkZBX01BWF9TSE1f
Q09VTlQgKQ0KPj4gICAgIHsNCj4+ICAgICAgICAgLyoNCj4+ICAgICAgICAgICogSWYgdGhpcyBp
cyB0aGUgZmlyc3Qgc2htIGFkZGVkLCBpbmNyZWFzZSB0aGUgZG9tYWluIHJlZmVyZW5jZQ0KPj4g
QEAgLTIxNyw2ICsyMjQsNyBAQCBzdGF0aWMgYm9vbCBpbmNfY3R4X3NobV9jb3VudChzdHJ1Y3Qg
ZG9tYWluICpkLCBzdHJ1Y3QgZmZhX2N0eCAqY3R4KQ0KPj4gICAgICAgICAgICAgZ2V0X2tub3du
YWxpdmVfZG9tYWluKGQpOw0KPj4gDQo+PiAgICAgICAgIGN0eC0+c2htX2NvdW50Kys7DQo+PiAr
ICAgICAgICByZXQgPSB0cnVlOw0KPj4gICAgIH0NCj4+IA0KPj4gICAgIHNwaW5fdW5sb2NrKCZj
dHgtPmxvY2spOw0KPj4gQEAgLTI1MSw3ICsyNTksNyBAQCBzdGF0aWMgc3RydWN0IGZmYV9zaG1f
bWVtICphbGxvY19mZmFfc2htX21lbShzdHJ1Y3QgZG9tYWluICpkLA0KPj4gICAgIHN0cnVjdCBm
ZmFfY3R4ICpjdHggPSBkLT5hcmNoLnRlZTsNCj4+ICAgICBzdHJ1Y3QgZmZhX3NobV9tZW0gKnNo
bTsNCj4+IA0KPj4gLSAgICBpZiAoIHBhZ2VfY291bnQgPj0gRkZBX01BWF9TSE1fUEFHRV9DT1VO
VCApDQo+PiArICAgIGlmICggcGFnZV9jb3VudCA+IEZGQV9NQVhfU0hNX1BBR0VfQ09VTlQgKQ0K
Pj4gICAgICAgICByZXR1cm4gTlVMTDsNCj4+ICAgICBpZiAoICFpbmNfY3R4X3NobV9jb3VudChk
LCBjdHgpICkNCj4+ICAgICAgICAgcmV0dXJuIE5VTEw7DQo+PiBAQCAtMzY3LDcgKzM3NSw3IEBA
IHN0YXRpYyBpbnQgc2hhcmVfc2htKHN0cnVjdCBmZmFfc2htX21lbSAqc2htKQ0KPj4gICAgICAg
ICBpbml0X3JhbmdlKGFkZHJfcmFuZ2UsIHBhKTsNCj4+ICAgICB9DQo+PiANCj4+IC0gICAgcmV0
ID0gZmZhX21lbV9zaGFyZSh0b3RfbGVuLCBmcmFnX2xlbiwgMCwgMCwgJnNobS0+aGFuZGxlKTsN
Cj4gDQo+IFBsZWFzZSByZW1vdmUgZnJhZ19sZW4gZnJvbSBzaGFyZV9zaG0oKSBzaW5jZSBpdCdz
IG5vdCBuZWVkZWQgYW55IGxvbmdlci4NCg0KQWNrLCBJIHdpbGwgcmVtb3ZlIGl0IGluIHYyLg0K
DQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+IENoZWVycywNCj4gSmVucw0KPiANCj4+ICsgICAg
cmV0ID0gZmZhX21lbV9zaGFyZSh0b3RfbGVuLCAmc2htLT5oYW5kbGUpOw0KPj4gDQo+PiBvdXQ6
DQo+PiAgICAgZmZhX3J4dHhfc3BtY190eF9yZWxlYXNlKCk7DQo+PiBAQCAtNjM3LDggKzY0NSw2
IEBAIGludDMyX3QgZmZhX2hhbmRsZV9tZW1fcmVjbGFpbSh1aW50NjRfdCBoYW5kbGUsIHVpbnQz
Ml90IGZsYWdzKQ0KPj4gICAgIHN0cnVjdCBkb21haW4gKmQgPSBjdXJyZW50LT5kb21haW47DQo+
PiAgICAgc3RydWN0IGZmYV9jdHggKmN0eCA9IGQtPmFyY2gudGVlOw0KPj4gICAgIHN0cnVjdCBm
ZmFfc2htX21lbSAqc2htOw0KPj4gLSAgICByZWdpc3Rlcl90IGhhbmRsZV9oaTsNCj4+IC0gICAg
cmVnaXN0ZXJfdCBoYW5kbGVfbG87DQo+PiAgICAgaW50MzJfdCByZXQ7DQo+PiANCj4+ICAgICBp
ZiAoICFmZmFfZndfc3VwcG9ydHNfZmlkKEZGQV9NRU1fUkVDTEFJTSkgKQ0KPj4gQEAgLTY1Miw4
ICs2NTgsNyBAQCBpbnQzMl90IGZmYV9oYW5kbGVfbWVtX3JlY2xhaW0odWludDY0X3QgaGFuZGxl
LCB1aW50MzJfdCBmbGFncykNCj4+ICAgICBpZiAoICFzaG0gKQ0KPj4gICAgICAgICByZXR1cm4g
RkZBX1JFVF9JTlZBTElEX1BBUkFNRVRFUlM7DQo+PiANCj4+IC0gICAgdWludDY0X3RvX3JlZ3Bh
aXIoJmhhbmRsZV9oaSwgJmhhbmRsZV9sbywgaGFuZGxlKTsNCj4+IC0gICAgcmV0ID0gZmZhX21l
bV9yZWNsYWltKGhhbmRsZV9sbywgaGFuZGxlX2hpLCBmbGFncyk7DQo+PiArICAgIHJldCA9IGZm
YV9zZWN1cmVfcmVjbGFpbShzaG0sIGZsYWdzKTsNCj4+IA0KPj4gICAgIGlmICggcmV0ICkNCj4+
ICAgICB7DQo+PiBAQCAtNjc3LDExICs2ODIsNyBAQCBib29sIGZmYV9zaG1fZG9tYWluX2Rlc3Ry
b3koc3RydWN0IGRvbWFpbiAqZCkNCj4+IA0KPj4gICAgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2Fm
ZShzaG0sIHRtcCwgJmN0eC0+c2htX2xpc3QsIGxpc3QpDQo+PiAgICAgew0KPj4gLSAgICAgICAg
cmVnaXN0ZXJfdCBoYW5kbGVfaGk7DQo+PiAtICAgICAgICByZWdpc3Rlcl90IGhhbmRsZV9sbzsN
Cj4+IC0NCj4+IC0gICAgICAgIHVpbnQ2NF90b19yZWdwYWlyKCZoYW5kbGVfaGksICZoYW5kbGVf
bG8sIHNobS0+aGFuZGxlKTsNCj4+IC0gICAgICAgIHJlcyA9IGZmYV9tZW1fcmVjbGFpbShoYW5k
bGVfbG8sIGhhbmRsZV9oaSwgMCk7DQo+PiArICAgICAgICByZXMgPSBmZmFfc2VjdXJlX3JlY2xh
aW0oc2htLCAwKTsNCj4+ICAgICAgICAgc3dpdGNoICggcmVzICkgew0KPj4gICAgICAgICBjYXNl
IEZGQV9SRVRfT0s6DQo+PiAgICAgICAgICAgICBwcmludGsoWEVOTE9HX0dfREVCVUcgIiVwZDog
ZmZhOiBSZWNsYWltZWQgaGFuZGxlICUjbHhcbiIsDQo+PiAtLQ0KPj4gMi41MC4xIChBcHBsZSBH
aXQtMTU1KQ0KDQoNCg==

