Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJWbDDNfjGmWlwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 11:51:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76900123A0C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 11:51:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227273.1533613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq7oY-0007Ki-Te; Wed, 11 Feb 2026 10:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227273.1533613; Wed, 11 Feb 2026 10:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq7oY-0007JF-Qm; Wed, 11 Feb 2026 10:51:22 +0000
Received: by outflank-mailman (input) for mailman id 1227273;
 Wed, 11 Feb 2026 10:51:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvfN=AP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vq7oX-0007Av-1V
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 10:51:21 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 983deb5c-0737-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 11:51:18 +0100 (CET)
Received: from AM0PR05CA0084.eurprd05.prod.outlook.com (2603:10a6:208:136::24)
 by DU2PR08MB7358.eurprd08.prod.outlook.com (2603:10a6:10:2f1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Wed, 11 Feb
 2026 10:51:14 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:208:136:cafe::4b) by AM0PR05CA0084.outlook.office365.com
 (2603:10a6:208:136::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Wed,
 11 Feb 2026 10:51:14 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Wed, 11 Feb 2026 10:51:13 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS8PR08MB9243.eurprd08.prod.outlook.com (2603:10a6:20b:5a2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 10:50:07 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 10:50:07 +0000
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
X-Inumbo-ID: 983deb5c-0737-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oRq/knzzI90w1W3xcSnvUb8TSyRK3shSDgknn2/zk8jmgEoPM80Uocw6mjwrf+CTmlm14I4W9ZsrOrfx4933WcAk8KS3YEjoAk980+aOT/ehxyRkYhqJO9L+SjqVZEiD70HSVZceNCnHSUXE7XZo0+DQI/55MnfXLm/1Z3qw6GTb/NgQze8AMzQ3bah6e+BzZpvf51SyIHyVodswAp/BFWkNgijBMCXHM8vrfcmIQdRFUZDwYjB2LZCWVJakm5L43n8YDKr3/zMTBU8QCSi2sLxGEAh0l3QQytZ1F/GskwH9o73PMo0lL6KPITFY1Ab3wbU/rP8ii6fGd6//ZOsl+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rRZIxxlIJTUwcNVYlYSRiYc/S3lxzSgBWmsMURHLyA=;
 b=cPK9NOxdzReH7CPZfUr/EB5pD/I1oAPqVoIyFi596L5fyd4sFbBTYqCpzh6DanrwrbQbGDPpD0W3YlK6lhxRdGPApHTANhkJ4oHu2CVpZaXwnRq/8RES23HwhX4YlIPvf3i8vqL3EGw0nWfQZeMPZbhfe3DYatV9lyalMVtg+RpmCHWx/3pctyLh0WKsKpkFjR4nu+4NIvz0iC16moWP8r1tBnn8OE1Gg1SvIdZ4dGAjPKVnQPGu6QKC4z9AwG58DSgTXcrJYC6pVDd5bl7GvdKGD0nJRsc1aZZAvUBLrKanBFCZYxh1xO7ABKtc7799eXbhQsExeGhW9O79gnHAhQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rRZIxxlIJTUwcNVYlYSRiYc/S3lxzSgBWmsMURHLyA=;
 b=SjPBSg1Vp6lBXLh6CuRbv62NAn3go6vIQbo/a3KgpWW9XCaGk3H5TinVxqBzcrVGjU9ZQ4uxrphtfY1FPcDP6wvVII1MQ3rwrKyCt4xOHvzqtNAiT40qZT7NRIG0VEHekH3jhcXAni2UcxLcme/y5JM/J+dBvnMUsGoWP5+oLKY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bsix+ojcXpoF3ayUqdsIoVdD4IQAbB4rRR0xytpIlAtXRRMmKQn+jvW6w0BLpzVGURm+umjKW7hdn6ogaGrn7+MuNVR1XE0APQzpSw4Xt3qIhtlwGxBCl2GPdeJYxK/7kvXYmaT0VsVUSTs3/X9dQsKbkOmt9GlAncxexOumhEuFYFYB3oVcliqEDywC3jKMNUMzv5Iqzhh3M8fcZHubG+SbHKd7ibDvhBDCG7INY9V7RVy00GAWhJO5azgL6EIcyI/6h7nT0P7k0GWiaBgYU2fDSykVDCAaDhlmm/MV02Df4S7EecBegekaFeJKehLCAlKzbvKwIM6+eTkOKoVA1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rRZIxxlIJTUwcNVYlYSRiYc/S3lxzSgBWmsMURHLyA=;
 b=dDHumdEfkyIFRNuxe1ycjGS++p7hO2Ne+0RsT+cC0PRmRiEqDlKoXETQvDj9Cc9yYBzjtbILy8tznaKCnQSnccHMk75HzpeZuj2aE3RW/2TomcQSag2EOpnGTOO0WFzVXzMYiSmVNZKtprKvZd3BHGhsoN8aGYqvqZkYFG86Mb1Oeih1e78GxAnkYFOxfKZlecxHOS2kmRhb3iL7o0gJeqya2k7xhYRBYchdmbqXpAsIo3Tx7wj8SpapKI13riisa6en0figYjl4Rz7tEYI1y4T0Lu4uFmGgxA9AZy/uo1lFtX7uWhMTpHuLgBoYm3tJnFoRKUysksTwEXwXq2z7gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rRZIxxlIJTUwcNVYlYSRiYc/S3lxzSgBWmsMURHLyA=;
 b=SjPBSg1Vp6lBXLh6CuRbv62NAn3go6vIQbo/a3KgpWW9XCaGk3H5TinVxqBzcrVGjU9ZQ4uxrphtfY1FPcDP6wvVII1MQ3rwrKyCt4xOHvzqtNAiT40qZT7NRIG0VEHekH3jhcXAni2UcxLcme/y5JM/J+dBvnMUsGoWP5+oLKY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 07/12] xen/arm: ffa: Fix RXTX_UNMAP ownership race
Thread-Topic: [PATCH 07/12] xen/arm: ffa: Fix RXTX_UNMAP ownership race
Thread-Index: AQHclTQA4+TBlGja902+I8ruNzCv87V9KKCAgAA1SQA=
Date: Wed, 11 Feb 2026 10:50:06 +0000
Message-ID: <461493F2-BF47-4D8E-87B0-F2ABA90F0EF2@arm.com>
References: <cover.1770115301.git.bertrand.marquis@arm.com>
 <971bf27b9a2cafa0ed405a638a532b6fbbf51142.1770115302.git.bertrand.marquis@arm.com>
 <CAHUa44F9sSzTV-X9tKDffk9vWfT9=KZGmqp3EiR0rEo1nwd7Pg@mail.gmail.com>
In-Reply-To:
 <CAHUa44F9sSzTV-X9tKDffk9vWfT9=KZGmqp3EiR0rEo1nwd7Pg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS8PR08MB9243:EE_|AMS0EPF0000019B:EE_|DU2PR08MB7358:EE_
X-MS-Office365-Filtering-Correlation-Id: cbb97127-933f-475c-ab6a-08de695b79ab
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Sm5JTk90TW1MdWlSY2daY1VqRkpuZ1pFU1VjN25JdEh5ekJZVGw3aEYwS1RX?=
 =?utf-8?B?U1FTWVk2V0FXcVdGM3VsRE1WK3JCT2pibzZRN1FqTzJNMHR2elVhZUFNaHRr?=
 =?utf-8?B?OVQ2NXBPSzZudENSY005VFNlMzRQY2hhUnEzUkVvZ0NsOHdLNzRMSDZ6WitZ?=
 =?utf-8?B?NzJoNkVSNTZCY1pBWldidlphTlpmMVY5UXlWQnpRTUc2cy9zOEJjeUdvcC8z?=
 =?utf-8?B?RC93SkpZcVI4Q3V5bWxuVWRqWEFKZ1NyUDN6Nm5UcGhJaDY2ZUV2YVpXTmJ3?=
 =?utf-8?B?KzBSNkZuSkJHTWlja0NtVGtHL2tpMnZPR2hpTHljb3ZESzVuaW9kaHpZZ2Uz?=
 =?utf-8?B?cG1aVXNBTWw1aVJvdURkcFdHL09aZkZJbWJWSzR4OUc5bmtJbE14NkdDQ0I2?=
 =?utf-8?B?bE5SN2M0VXh3N1dmbFVwRDU2ZTZCYitwZEFrSnFxZytSWlcwVzU3SCtkTjBL?=
 =?utf-8?B?eEwxT3dDeHZqSndCRWRnVGNiamkwK2FqTDYxOUMvUm9mSkxBczhMdVBRZFFR?=
 =?utf-8?B?MkRocFY1ZmhYbkZPVUxDck9rMWc2TC93TzhNblNSSVd6S09nKzJONDIzdDVT?=
 =?utf-8?B?QlNyem1lWjluYlRMbzg2U3pjczQ2YjhPMVRGeXBpdmZFTDk3YWFleDJsdlN4?=
 =?utf-8?B?K0dBZW8xR0tJd3I0V24weGd6YWZoMEJjcnJ1VXZSOEN6d2xKek1sU1JmbVcz?=
 =?utf-8?B?ODZkMzRocm5CT0JBNDYybm1vTTRaR2RlZ0VFRUJOSFE5dHF6cVRiRjZNaktq?=
 =?utf-8?B?dWRqU215eStRVmFwbHFsem9lc1Q0alJsYlArbzFEdGJsNHJMWGlQcklRekoy?=
 =?utf-8?B?dlZNOUtDNXFsQVZRTjRFYmJRYTJycUFDYWhGQ3VtdnBwK1IydE5wZG9zMitm?=
 =?utf-8?B?RjRxOEQ0VWtjaE8zS1Jrd05ZRkxVNTFvSFoxbUZYNVNoQU5Qbk93MFJNUzNp?=
 =?utf-8?B?RjB1clR1WDJRYkl1czBmSzBoVWN1Nkx3UlgvelhDdS83YUNJR1pVOVZ5R2NB?=
 =?utf-8?B?U2JiT1RLeFoyY1RyaVQ5eWJvWEJnZ2tkb1k1Z0NOK3VDUGRaY1MvVEtuMmFW?=
 =?utf-8?B?RGN1eGpWVEVPSkVVWllKRnRBUkVVRzJKUGNGWHNmNU9Pd3RxUDVzZytLb1Jm?=
 =?utf-8?B?Z0NwdDdWTWJaR0g4dm1uY1hYcElwdTZGQlpUOUUyTlkySEdiaU0rbklmczJV?=
 =?utf-8?B?OHhPSlRZNHRpWkxZNVI4UXBoVytIeDg5OWk1QTdIUEg5NjU0SjdpU20reFhv?=
 =?utf-8?B?T2phZkl4ajlTZUxJc0hINXFtV1BDU1Jta09YblNrRzBHSFB4eEVHWmVSMUZh?=
 =?utf-8?B?L3YybHVSUUx6TTIwQlFFTUlxTzJUcHUzNFJaOXJ2UFRnaW9KaDkvUERWYXBQ?=
 =?utf-8?B?dFFBSjNaZDdZeHlXM2tNTFV1MTBKemQ5R0cxQlByWndLYVBva2hIeW5DSGJh?=
 =?utf-8?B?U2VPaEVzUkJjU0V1MWhTZXZUcjR3czF1SWFaWmRjaVc4UWpTS2UxbFhMR21M?=
 =?utf-8?B?dW92ZUgvd0V6QlVQdmo5YnE0TnRmUXUvaG1BeGJxeldDTTJVQUdKUXFmRUg1?=
 =?utf-8?B?eTZFSHA4S1pVRUdWc1duY0ljRnJsVnBjd1Fya09ZN3FXcDVkNWE0RVNFTmQ3?=
 =?utf-8?B?NzJ3Uk9nRDVCaEdZeXZFd1k1dGNSZ2g0WVFQT1ZrcTZRbGgvZjQyNEpnQm8y?=
 =?utf-8?B?WjFmZEhzZFhrejZJUVViYk9lVndrNi9HU1dUNmNiK3VKY2c3U3FJZWw0MzI5?=
 =?utf-8?B?V29TYXpNR01nZmF5d1lpYnU4ZjJSQzFPQlZYS1RsSDRvZ2E2OFQxZzhNblNQ?=
 =?utf-8?B?aGRSVitpVzJ2a1dKQXB3Und2Q2ZzaHVCSVBiT0FuTWN6bHlIYzl0UmhzMDBP?=
 =?utf-8?B?Sjl6UXVtb3p3Rk44VEN5eEFadnpFM1Y2UThydER0WTZuczlGYld0eUxuYjB1?=
 =?utf-8?B?aFhrU2xva2xITTZLdXhXemhoUC95Nk5sUG1BaHFmZU53VzltYyt5M0w2Mng3?=
 =?utf-8?B?S1lid2hiMjVpQTF0V1pvRWcrNmE5RXpvK1paYnlQMDVTMEwyenpVUUhCMysr?=
 =?utf-8?B?S1k2NDRXWk84Y3NocXdIc2NvSm5mMUNIRGNOMldNTTh6SVkrbkdNMWcrNE1y?=
 =?utf-8?B?OExpdHhSQ0ZCd0c1Rng3TGNyVmtsZEFaNnRiZmFzcGJvcTBuMGRCcDJYT1dV?=
 =?utf-8?Q?SBFmglvowuGeZA9kRKIemkA=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <408B2247771ABB469A3445A8EDD27EFB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9243
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	13cc3050-8847-482b-585d-08de695b51f0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|14060799003|35042699022|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTYrbUp5dldDdjF0Q2RDZ1QrQ3RYUnFNNk45ZUFub09JbXZCRjBPY1lvYURh?=
 =?utf-8?B?M09vdG5yeHBwR0JQRkErL09mMVcrQjZPSlNHbzRiaGh2WERWZ0xGcUhwRjlT?=
 =?utf-8?B?eWEyVTkxMTdqWTJsc1MzeTdZT3VlSFVWMTBnOGlIZ2RxcWtNay9NSXZKMWM4?=
 =?utf-8?B?dWlBanBFVnlMRTNlV21HVWl4NVhKV3ZmU0NnVjB2VmlHYjhWOUFCM2UzVFhI?=
 =?utf-8?B?bStoQ0h2VXZxNkVEZTV1UURvczhPTkVnelJ6YThQbDRNTEpxZ3d5dE1FNHRw?=
 =?utf-8?B?WmtFYWJnS0tlc3hjazA4U2ZKTmY2V2g2QnBFRWE4MHgvZk9kb2xIaW90dkxv?=
 =?utf-8?B?bmFvUjFqNmJ4S2thalhhdWpCTVVEQWgrYUxMQ2NJR0hVVVAvNTBDbjhqcUh3?=
 =?utf-8?B?U0l3QmUwb2FTR1BvQ0VvSDhGeTQ1YlFpVmhzNk8vdGV4VVFVcDYvb3ZBSzJH?=
 =?utf-8?B?RWlwSkM2bStXYytwNHNCRU9lSEdlcEtMbE5SemZXMk1DL1lhazAxaEFrZVF5?=
 =?utf-8?B?amhJNGRyS25hamV0Qzg5dVl6R0RoN21CT0sxSGxYN3RkYkdEUEpRWnpYRDF5?=
 =?utf-8?B?TUdISEEyRVk5YWYzY0M4aitMSzg4NXMvU256VEs4MVo4V1dQK0pzTUppYm1p?=
 =?utf-8?B?cVkvNTBLRHE0MUZ1dzlmOTB0UEhXTkkzbWhXWjFyclFidTVHT2I5UDhSRkZm?=
 =?utf-8?B?SXgvelB0MzRmcEx1OERLRnZnQS9oR1lsQ0VNU01KNHZKL1lRRzhTMjN2SFdm?=
 =?utf-8?B?MWdndkNhMm5senJ3RU9zak9ScjZzMzhDcmVXRmpKWG1PakV4SDJ0R2orb1BV?=
 =?utf-8?B?Y3dzNGdVaGIvMGJMNWY5NUVQQXdVZmNnSERrYnJvOTZtRU01V29vc0ZMUCsr?=
 =?utf-8?B?Y3ZPUU9NeGQ3OHhDOTErT0c4Q1p1azRWbDZKZlRHRFNjdFU5MlVIbDZVVmdl?=
 =?utf-8?B?SkZFOEZ3MUdmOFh5UzJVN2QrSlZhSk9WeHRrbHYzMm5wTkdTazFTWTZFZWtJ?=
 =?utf-8?B?bUhoNzYwaWlrMGMrWmExeWcyaThnWkxvU044M3ZxMkU4THRoRlVPNjl1MS9o?=
 =?utf-8?B?SHpCWHlBZkdZdVhDeUpKVkUvcDNKSEpoQk1EblNQZy9KWGI0U3JCN3gvamIr?=
 =?utf-8?B?TzlncVZEMXZIZ3FCdzNnL1JnVzUwTFhKYkRRazVDTkNJei9ya3N5WkQrT1hl?=
 =?utf-8?B?aER0M1JnN1RkQkpTZDFUOVhTYmM5SDVhL3NDcG1sYnplV3FEMDQ4dUlvdEUx?=
 =?utf-8?B?Z2kzQllJR21JVTZWaGk3VHZzNTRnb3Fodm52ZGUzQ3cxY0w0WTZOdWVaQVZ2?=
 =?utf-8?B?WTkzZGZqYXVwdW5DbFBVOVY4Y1lLN3dPYURJMjhucUdZQzVsQTZPTEtFcitZ?=
 =?utf-8?B?OGZ6TWlYVXAvVjNLRFdVZFJTVU1xc2owRHJQZnZiVkNjZ0F2ak9vclU3RVZ6?=
 =?utf-8?B?b0U0MG9hNHZMc1pNL2xrZTNaTThwTml3aXpESEpGSk5kNEdPSEgwNFliSjZZ?=
 =?utf-8?B?Yjd5aFo0d3VQZExlRFNtL1N4NitVK1Nad1VjRVdOZnFYNWRJUFpZcWlrVmpS?=
 =?utf-8?B?em93QXpuSkxjejRoYnFQd3BDQU1ET1RDRHlXZW1IT04xNTZWOU9TS2FlV0Fn?=
 =?utf-8?B?WWYzQ0FuWGZFZzZYRDUxek5ON21YazArYU44bFp0a1UycFNRWkNzVFNNYmVE?=
 =?utf-8?B?Y1EwUmJDemg0YS9wcXRiems5L0RIais1UXdiTHFuc25QdFJnbFZqcHJSUGFP?=
 =?utf-8?B?TTdkcXQ2b3ExRzhSTFcyQ3c5NFE5MkViNHhlelZVcU8zejdZeUgvY2dRWWpY?=
 =?utf-8?B?dmtHaEVUemtTUkxWWmVjRnRsMkhtRkIwYVFyR3NFb1hzcW9BK0VTNStWa0x2?=
 =?utf-8?B?SUhtS0hEcldNVnFFVE15RnRjZTVZbHlUcHBjaG0ydldmSlVHWjJWTjhBbGZZ?=
 =?utf-8?B?VEE4NHJKSjN2SHUraFo1SjhSZG9ZSkpGWGdWZEJYSGhvSUFqeDV1RVlMMlY3?=
 =?utf-8?B?RU9uek5uMUdaRERCWFVpazd1VTFsbE1tMkdWdTQ5aHRhdFgxWnRqUG5lR1Zp?=
 =?utf-8?B?SWpzMmhUSStldklNUEIwek4wUWVOVWNkT1hoM2pNbVUzcGtycHU5QVNwcDhP?=
 =?utf-8?B?dUEyYTl4d005RWNaQmJaWmhUUWQxNUtWejFVbnpxbGZsTTRhT1kwaUxkMk9T?=
 =?utf-8?B?bHJJOUwwcStqeDNZemo2VmQzWldsVEZrQklzYkV0Q0MwZlF3TVppeXhXMGlV?=
 =?utf-8?B?UFlhWVV2bGRFTitXbFFjcjhOTy9nPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(14060799003)(35042699022)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ftY/EtzhpbEXxx9uVltGtPrcmOX/eDHgXOG1a1HYp0UvMSseiWMK435KbWTLJ+Kku0x9cDdjfI9TPGFjxP0o6da37fQI7Gwp9EHX05lWOQIePzkuW1mk1Lv0c6iCIjVRrrVViqntcZ6IUM4REg5VDyKEGDHsg871qkyYG7sPRPe8Voze+K2pcTJNMWrr7gj4J38BymMrM4sspPvINJjfEZscywAp4K/PgGugKiRFq3ft6D3/f62KKtmMpShcCpnJxqn3LjsesLULeRrHH2IlDzqRMC6vgUjkaCttlqkTgkd5OYc2KmKFXmehl1MFXTcZidvIpNpqxZrs3CqpszeKgLEF30pVTdgc/mDshJqjuB/GfQZa/Ey41LETHMtjXyOCod492BQwDuTY/IHKrATc09Kq3BzDIsbtLaAFRHk4wGKotjOz2lVBhuDTBwkcxSdz
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:51:13.6532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb97127-933f-475c-ab6a-08de695b79ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7358
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
X-Rspamd-Queue-Id: 76900123A0C
X-Rspamd-Action: no action

SGkgSmVucywNCg0KPiBPbiAxMSBGZWIgMjAyNiwgYXQgMDg6MzksIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gVHVlLCBGZWIgMywgMjAyNiBhdCA2OjM44oCvUE0gQmVydHJhbmQgTWFycXVpcw0KPiA8
YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+IA0KPj4gcnh0eF91bm1hcCgpIGNo
ZWNrcyBSWCBvd25lcnNoaXAgd2l0aG91dCBob2xkaW5nIHRoZSBSWC9UWCBsb2NrcyBhbmQNCj4+
IG9ubHkgZW5mb3JjZXMgdGhlIG93bmVyc2hpcCBydWxlIHdoZW4gRkZBX1JYX0FDUVVJUkUgaXMg
c3VwcG9ydGVkLiBUaGlzDQo+PiBhbGxvd3MgYSB2Q1BVIHRvIGFjcXVpcmUgUlggYmV0d2VlbiB0
aGUgY2hlY2sgYW5kIHVubWFwLCBhbmQgaXQgbGV0cw0KPj4gUlhUWF9VTk1BUCBwcm9jZWVkIHdo
aWxlIFJYIGlzIG93bmVkIHdoZW4gYnVmZmVycyBhcmUgbm90IGZvcndhcmRlZCB0bw0KPj4gZmly
bXdhcmUuDQo+PiANCj4+IEhvbGQgcnhfbG9jay90eF9sb2NrIGFjcm9zcyB0aGUgb3duZXJzaGlw
IGNoZWNrIGFuZCB1bm1hcCwgYW5kIGRlbnkNCj4+IFJYVFhfVU5NQVAgd2hlbmV2ZXIgUlggaXMg
b3duZWQsIGluZGVwZW5kZW50IG9mIFJYX0FDUVVJUkUgc3VwcG9ydC4gRm9yDQo+PiB0ZWFyZG93
biwgcmVsZWFzZSBSWCBvd25lcnNoaXAgdW5kZXIgdGhlIHNhbWUgbG9jayB3aW5kb3c7IHVzZQ0K
Pj4gRkZBX1JYX1JFTEVBU0UgZGlyZWN0bHkgYmVjYXVzZSByeF9sb2NrIGlzIGhlbGQsIGFuZCBj
bGVhciB0aGUgbG9jYWwNCj4+IGZsYWcgd2hlbiB0aGUgZmlybXdhcmUgcGF0aCBpcyB1bmF2YWls
YWJsZS4NCj4+IA0KPj4gRnVuY3Rpb25hbCBpbXBhY3Q6IFJYVFhfVU5NQVAgbm93IHJlbGlhYmx5
IHJldHVybnMgREVOSUVEIHdoaWxlIFJYIGlzDQo+PiBvd25lZCwgYW5kIHRlYXJkb3duIHJlbGVh
c2VzL2NsZWFycyBvd25lcnNoaXAgd2l0aG91dCBhIHJhY2UuDQo+PiANCj4+IFNpZ25lZC1vZmYt
Ynk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+IC0tLQ0K
Pj4geGVuL2FyY2gvYXJtL3RlZS9mZmFfcnh0eC5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tDQo+PiAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX3J4
dHguYyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX3J4dHguYw0KPj4gaW5kZXggZWZmOTVhNzk1NWQ3
Li40NTBjZTEwMmNiZGMgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9yeHR4
LmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX3J4dHguYw0KPj4gQEAgLTIyMCw3ICsy
MjAsNyBAQCBlcnJfdW5sb2NrX3J4dHg6DQo+PiAgICAgcmV0dXJuIHJldDsNCj4+IH0NCj4+IA0K
Pj4gLXN0YXRpYyBpbnQzMl90IHJ4dHhfdW5tYXAoc3RydWN0IGRvbWFpbiAqZCkNCj4+ICtzdGF0
aWMgaW50MzJfdCByeHR4X3VubWFwKHN0cnVjdCBkb21haW4gKmQsIGJvb2wgdGVhcmRvd24pDQo+
PiB7DQo+PiAgICAgc3RydWN0IGZmYV9jdHggKmN0eCA9IGQtPmFyY2gudGVlOw0KPj4gICAgIGlu
dDMyX3QgcmV0ID0gRkZBX1JFVF9PSzsNCj4+IEBAIC0yMzQsNiArMjM0LDM2IEBAIHN0YXRpYyBp
bnQzMl90IHJ4dHhfdW5tYXAoc3RydWN0IGRvbWFpbiAqZCkNCj4+ICAgICAgICAgZ290byBlcnJf
dW5sb2NrX3J4dHg7DQo+PiAgICAgfQ0KPj4gDQo+PiArICAgIGlmICggIWN0eC0+cnhfaXNfZnJl
ZSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIGlmICggdGVhcmRvd24gKQ0KPj4gKyAgICAgICAg
ew0KPj4gKyAgICAgICAgICAgIGlmICggZmZhX2Z3X3N1cHBvcnRzX2ZpZChGRkFfUlhfQUNRVUlS
RSkgKQ0KPj4gKyAgICAgICAgICAgIHsNCj4+ICsgICAgICAgICAgICAgICAgaW50MzJfdCByZWxf
cmV0Ow0KPj4gKw0KPj4gKyAgICAgICAgICAgICAgICAvKiBDYW4ndCB1c2UgZmZhX3J4X3JlbGVh
c2UoKSB3aGlsZSBob2xkaW5nIHJ4X2xvY2suICovDQo+PiArICAgICAgICAgICAgICAgIHJlbF9y
ZXQgPSBmZmFfc2ltcGxlX2NhbGwoRkZBX1JYX1JFTEVBU0UsIGN0eC0+ZmZhX2lkLA0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAsIDAsIDApOw0KPj4gKyAg
ICAgICAgICAgICAgICBpZiAoIHJlbF9yZXQgKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgZ2Rw
cmludGsoWEVOTE9HX0RFQlVHLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImZm
YTogUlggcmVsZWFzZSBkdXJpbmcgdGVhcmRvd24gZmFpbGVkOiAlZFxuIiwNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJlbF9yZXQpOw0KPj4gKyAgICAgICAgICAgICAgICBlbHNl
DQo+PiArICAgICAgICAgICAgICAgICAgICBjdHgtPnJ4X2lzX2ZyZWUgPSB0cnVlOw0KPiANCj4g
SSBkb24ndCBzZWUgd2h5IHRoaXMgYXNzaWdubWVudCBpcyBuZWVkZWQsIG9yIHRoZSBvbmUganVz
dCBiZWxvdy4NCg0KVHJ1ZSwgaW4gdGhlIHRlYXJkb3duIGNhc2Ugd2UgZG8gbm90IGNhcmUgYXQg
YWxsLg0KSSB3aWxsIHJlbW92ZSB0aG9zZSAyLg0KDQo+IA0KPj4gKyAgICAgICAgICAgIH0NCj4+
ICsgICAgICAgICAgICBlbHNlDQo+PiArICAgICAgICAgICAgICAgIGN0eC0+cnhfaXNfZnJlZSA9
IHRydWU7DQo+PiArICAgICAgICB9DQo+PiArICAgICAgICBlbHNlDQo+PiArICAgICAgICB7DQo+
PiArICAgICAgICAgICAgZ2RwcmludGsoWEVOTE9HX0RFQlVHLA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICJmZmE6IFJYVFhfVU5NQVAgZGVuaWVkLCBSWCBidWZmZXIgb3duZWQgYnkgVk1cbiIp
Ow0KPj4gKyAgICAgICAgICAgIHJldCA9IEZGQV9SRVRfREVOSUVEOw0KPj4gKyAgICAgICAgICAg
IGdvdG8gZXJyX3VubG9ja19yeHR4Ow0KPj4gKyAgICAgICAgfQ0KPj4gKyAgICB9DQo+PiArDQo+
PiAgICAgaWYgKCBmZmFfZndfc3VwcG9ydHNfZmlkKEZGQV9SWF9BQ1FVSVJFKSApDQo+PiAgICAg
ew0KPj4gICAgICAgICByZXQgPSBmZmFfcnh0eF91bm1hcChmZmFfZ2V0X3ZtX2lkKGQpKTsNCj4+
IEBAIC0yNjEsNyArMjkxLDcgQEAgZXJyX3VubG9ja19yeHR4Og0KPj4gDQo+PiBpbnQzMl90IGZm
YV9oYW5kbGVfcnh0eF91bm1hcCh2b2lkKQ0KPj4gew0KPj4gLSAgICByZXR1cm4gcnh0eF91bm1h
cChjdXJyZW50LT5kb21haW4pOw0KPj4gKyAgICByZXR1cm4gcnh0eF91bm1hcChjdXJyZW50LT5k
b21haW4sIGZhbHNlKTsNCj4+IH0NCj4+IA0KPj4gaW50MzJfdCBmZmFfcnhfYWNxdWlyZShzdHJ1
Y3QgZmZhX2N0eCAqY3R4LCB2b2lkICoqYnVmLCBzaXplX3QgKmJ1Zl9zaXplKQ0KPj4gQEAgLTM2
OSw3ICszOTksNyBAQCBpbnQzMl90IGZmYV9yeHR4X2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4g
KmQpDQo+PiANCj4+IHZvaWQgZmZhX3J4dHhfZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAq
ZCkNCj4+IHsNCj4+IC0gICAgcnh0eF91bm1hcChkKTsNCj4+ICsgICAgcnh0eF91bm1hcChkLCB0
cnVlKTsNCj4gDQo+IEhvdyBhYm91dCBhZGRpbmcgYSAvKiB0ZWFyZG93biAqLyBqdXN0IGFmdGVy
IHRydWUgYXMgYSByZW1pbmRlciBvZg0KPiB3aGF0IHRydWUgaXMgc3VwcG9zZWQgdG8gcmVwcmVz
ZW50Lg0KPiANCj4gQWRkaW5nIHN1Y2ggY29tbWVudHMgaXNuJ3QgdmVyeSBjb21tb24sIGJ1dCB3
ZSdyZSBkb2luZyBpdCBhdCBhIGZldw0KPiBwbGFjZXMgaW4gdGhlIHNvdXJjZSB0cmVlLCBhbmQg
SSB0aGluayBpdCBoZWxwcyB3aGVuIHJlYWRpbmcgdGhlIGNvZGUuDQoNCkFncmVlIGkgd2lsbCBh
ZGQgLyogdGVhcmRvd24gKi8ganVzdCBhZnRlciB0cnVlIGhlcmUuDQoNCkNoZWVycw0KQmVydHJh
bmQNCg0K

