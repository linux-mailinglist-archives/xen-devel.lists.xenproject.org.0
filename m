Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB32A8B9B2
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 14:58:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956004.1349539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u52LH-0005I1-B3; Wed, 16 Apr 2025 12:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956004.1349539; Wed, 16 Apr 2025 12:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u52LH-0005GA-6W; Wed, 16 Apr 2025 12:58:15 +0000
Received: by outflank-mailman (input) for mailman id 956004;
 Wed, 16 Apr 2025 12:58:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hq9D=XC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u52LF-0005CZ-Vq
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 12:58:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2612::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 748d4afe-1ac2-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 14:58:13 +0200 (CEST)
Received: from AS4P189CA0037.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::8)
 by VI1PR08MB10102.eurprd08.prod.outlook.com (2603:10a6:800:1cf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 12:58:10 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::c7) by AS4P189CA0037.outlook.office365.com
 (2603:10a6:20b:5dd::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Wed,
 16 Apr 2025 12:58:10 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Wed, 16 Apr 2025 12:58:08 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS2PR08MB10226.eurprd08.prod.outlook.com (2603:10a6:20b:62f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 12:57:35 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 12:57:35 +0000
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
X-Inumbo-ID: 748d4afe-1ac2-11f0-9eaf-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dEM4OWeWUQaDERtC6S1qdpNPkYNPNKga2JjFJ2ePlDA8KDLwz04NzT5XRvMqK9lAdhslR2PSOKr8eWdK7Xjw3pyeuIgf7XwvEoE6Vjh6kSrua0kPM5I2xez0dUS4/fqKCRHunCFYHDfrbxZ/0zETfuElv+EdqqkCNUHWY5h9E8gIkgvA6eUI1KUDRtmohTL/T5O5ST8aC3nlTVL88S77bOYCE5/0LkykjNFV6Y6DAlrB5GSg8J7B3AFysMHO1yp81sQZ5iMoYtrW8ODRy+nlUuCg+I0EQwAPcXr04OTwHFLwt48jZQ8s+MYNS5jdzsX3U0/nePJvv11TOwnqxcxUvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zlic03bdKAfZiXVrtZdvQfjP9TL89lldZN01Byh2sZM=;
 b=mWHyG/aUTm977Kv1IUEbqumhaV3Hod613aIzuLLnahW0wKVYWzauR9TrudXFScks6CQGOehSH5giL11lC6Q9p6X7BuKYOaEecWIpIt+oVuViRWBQgtYTOtU9ikU/4hPvVpmgz9t0cygaVEs8c5HY5FQMv86qj7DEbsaymfrbqwfm5vGTwNiKpftkYf4bER/DvcMXEgCnL50G2xw9E0hANSKAIhuC7tFvRMolEob7QONRn3141nK9AtG39L/3F14V6qJMUGT5hDg697bZOX+boufXiYufQYJCP3MLn6ZwAZMgJ34fb1QA/q2MfZkxRscjBWlaUnOPdGygrGlVn9WVaA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zlic03bdKAfZiXVrtZdvQfjP9TL89lldZN01Byh2sZM=;
 b=GS8vMYheSVid0BsiaxCXohTzPYW533esOq9vs7ruQHjMW/FEm2ozDIjkLoL+i1XF2rRIesWQszZCmJfVFgHx3jANtQeGVElXeg4kacuiF1Nodu2G1sTtIr7V6zE3NK5S6Fs+2bdz+JJQqwdjSoSKsIQIWkgd8lxGy94TPMy02c0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1zt+omKOUpvJtSQmdrXif/ETND62s4GgZRXG2v3uUS05E98R1GWl3rSRu1X21av2I+MioO3Uj7qQlAeiwvdVR699nK1oH9FdeO/uA76pZwox+cnbOdY3KNzl6G8lqhcro2zSPD7wdIlVirxA5IOY2BF3xaYurFRzaTyxp4Ah+w11sIDL2W+7DST4+xm0tsBLv6j7dyT/FLrQOUbbgMbqU0WC9IGmTbUsM2WeIAMOsb3pFoZeN1diwl6Zidexxv84gNlVkDlqUhcyRdvvOp4TDr4A6LsKBCN65VxU3u4fmKWiKetLsNqtdds4qkb5uGszQTk+QC5Ox0ky3BzRXhzew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zlic03bdKAfZiXVrtZdvQfjP9TL89lldZN01Byh2sZM=;
 b=hDcXKlmFt9glRKz0LQ3uW8iYE1gymfa7CTabf5+H+9S9s95KAEBOvdpZ1R1UMjFCPFEQiYA5SEOYOyarqsT7tPEXWa4B94gP4pgbV7QquTSNpmPqSAo7yuvAUxchc+Znk5xSH3svFN59fezNWaagc2aer6/UIDu2RneTH8Qs2kWlJ+aDh7VCu9V9hHrTjYuUrPO2RNeXDFMz4q8nM3g1XZLFDaLn0/YS729UJ7z9IhT5e8YMyCLxTjQgmN5C+qRCMS5qBzY9sgoVQ9YzXgpuFB+NE4mrKR/yas8hPVPjmu84DvFdQq+frxYZmFKyBsnHi34uFkPp2hWva2LyzaPVRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zlic03bdKAfZiXVrtZdvQfjP9TL89lldZN01Byh2sZM=;
 b=GS8vMYheSVid0BsiaxCXohTzPYW533esOq9vs7ruQHjMW/FEm2ozDIjkLoL+i1XF2rRIesWQszZCmJfVFgHx3jANtQeGVElXeg4kacuiF1Nodu2G1sTtIr7V6zE3NK5S6Fs+2bdz+JJQqwdjSoSKsIQIWkgd8lxGy94TPMy02c0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/7] arm/mpu: Introduce utility functions for the pr_t
 type
Thread-Topic: [PATCH v3 3/7] arm/mpu: Introduce utility functions for the pr_t
 type
Thread-Index: AQHbqvIP34UccZOkWUuu+Y+Ap2U3MrOmJOcAgAAb/QCAAAMjAIAABC8A
Date: Wed, 16 Apr 2025 12:57:35 +0000
Message-ID: <605B837B-7EB4-4A00-A4C5-D86630D764FD@arm.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-4-luca.fancellu@arm.com>
 <d2b51729-e5dd-4325-9275-615ab1cbb68d@amd.com>
 <0877268B-138F-4FC9-B95E-544699D8AD91@arm.com>
 <22a7f8b1-6614-4354-830e-30dbf6210ec8@amd.com>
In-Reply-To: <22a7f8b1-6614-4354-830e-30dbf6210ec8@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS2PR08MB10226:EE_|AM3PEPF0000A799:EE_|VI1PR08MB10102:EE_
X-MS-Office365-Filtering-Correlation-Id: 87e468da-1e43-4190-9850-08dd7ce65602
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UnhHaXJhUWFKRUhrSS9uMGllN0ZYVE5GVVNDYTRiVjlTdzZCVldxNDVGNTJv?=
 =?utf-8?B?WDZydEZqUlQ5OTRnM2FTTFB1eDYvUmRPTlNyZmlJRlhKeis2ZE8rTm5GT2NI?=
 =?utf-8?B?YS9wY0dmeGk5UmhUd3dmcFg3RXdicjIyTEozZlBUYlZhZnB6ZkMzbWx0dkU3?=
 =?utf-8?B?SGRrMFg2S3pGOXNBVEh4OHFTeWUrZEtOQmsrTDFQQ2RKa0pYODBCTUtTWFNn?=
 =?utf-8?B?K2U3U1BpRENCdk45Q2toT3c0Y1U1L20rNCthcnZsMVRzWnVVTXhVNXdxdjVw?=
 =?utf-8?B?SCtUREErQWFwVHU5Ty9Ld21DK3dPYU0rUy91NlVreTJxL3hVeDk2M21iSzVn?=
 =?utf-8?B?VmRQMGtXNUFudnNKSHlKMzl0TmF6VGFvdUh0bDJhNVNRbXBWNXFjdU9zZXpx?=
 =?utf-8?B?ellkWVpEbFFXTEd3ZmVRajlLU3FNUGZTOW5lV2RxKzdnemxEazkwK01HRVBY?=
 =?utf-8?B?dFU1Rm1rVGVBSThFcTcxcUpjSnhkcEpxZ2kxUmgvOXJsdVUzR1NPSW5KMG1s?=
 =?utf-8?B?eTh1YTVEVzgxZE5KZFdhcHhsSjNRYzYyVXBqdzYwd0pLMHpvd016b2hYeW1U?=
 =?utf-8?B?QmFhT050UDA0WDNuKzA4aVJZSGFVNjBzNGxrZUVhTytrTUdXU0M0bDlFYit0?=
 =?utf-8?B?WEJsS1lCTHZvUWRkNWxFVUtOUk5FZHVBb0ZHRkxTcGVmZzhjZVVVM00wd0dV?=
 =?utf-8?B?N2M0dUd1ZEZ0WDlsajYxV0d1TGFnaTRBbUxWdUxqV2lRSnYrdlo3ZFJnaTNv?=
 =?utf-8?B?eHhkT0NabnVLcGlXc2F3Q2dKSk4rSFhkcUNTb3YvUEVsY3QwTzAyVmhXQlZN?=
 =?utf-8?B?MElvN2o4M3RJSHltM1BrcENqYXdTa3k0bFFOb2tuaDF0TTh6UG91TjNpSTRZ?=
 =?utf-8?B?a1hKYmJDWm5FVERzVTRpdlRyZWQyQi9id29ZaitnZHVTaW5jeGVPeXF3Rnpv?=
 =?utf-8?B?aWUyc3pIcDBwQyt6MGFGK0dLVkZrMVNZK2E2enBFdDlsaTQvNGtjRnlIak1w?=
 =?utf-8?B?Q1IxWTFhYU0ybk5Ra3NPaFp4eFU5bXpOTml6QW0rZjNmOFRMVUpweGp6Z1Ew?=
 =?utf-8?B?TDVzMWIyRFdleGtnaSttdlgwOUdWalhWWHhmbmcwUE5NZmlMMk15YkY4bXcy?=
 =?utf-8?B?TmN0NmtacUxwM3lPVUo5cG15blFnSHpjT2grQjd0WndERklWUURkNTRJQTFT?=
 =?utf-8?B?VFJnMEhxVTkwYjRTT0JKZE1WRmhZM1I1eS9qVkUvdFRId0YwclZsa3lUcnlY?=
 =?utf-8?B?c05RNytjRzhRTEZKeUs5N1RmVVdyc01xNFd6WDdIMy9aOFJvK0dFMEFvSUpp?=
 =?utf-8?B?bWJGSlN4dXBSTXRiZHhLL1M4Tk1ua204QUdoL3dkNThIWFRCaUYrTmMyUWJJ?=
 =?utf-8?B?VTBOcjRQQnJsa24xakF6bFlyZjd6OGtnSmNCVlMzZ0NYcUZENDJXdDQ0Zk1I?=
 =?utf-8?B?Qi9jZXUzY0szdEdqc1AzRFB1Q1FXUS8yRXQvK3VtZW5RRHZJTTJXaklxT2x2?=
 =?utf-8?B?OG5BTjBIZWxwdklRdTJoejBtT0Fwd2FLN2YydU5Vb2JIOFloR3Zqd1h6T3RT?=
 =?utf-8?B?U25PdzZyZEc5T0l6WWZUTXBmUUx5ZDU3NmFCUktvMkNMRVR1TVVLTU5jVERY?=
 =?utf-8?B?aEdJR0lWYUY2WjcyVmRwZVhNUXZEL1lqdzFEWlFlZmtpam5EWFpNNHJISGxH?=
 =?utf-8?B?ZXBTV0VhS1QrT1dlcUFxall4amdPYTQwbXFOeDdyMzJvaldWY2Z1Q21IcjdE?=
 =?utf-8?B?eWRTUWhvU3JsNjQzczNvdjQ3QnF4bldKSUt6NzhVTDJxbVkwa2lPKzFRYVgy?=
 =?utf-8?B?Y1NTY1A1K1JjdVRUbXhuMlE4UTZXYVUxVWx1ZFgrLzZqQUNaZStyV3M2NUZB?=
 =?utf-8?B?NysyMytDZDJyT0FuVG9nbjljbG9jT2wxaXJlYUl2aXZJM1FWTWRqVG9hK2tV?=
 =?utf-8?B?V1FabklRaUNrUlN0QjNyT2lJTStkNzAvS2hZcUZseXIxSXBiWFpjcG4vQWUr?=
 =?utf-8?B?UGlPaHdqYmF3PT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F81585F5D13B3B48A08C6D22FB7595A6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10226
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c0bb472f-817e-4a2e-2bdf-08dd7ce64236
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|35042699022|82310400026|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlNlTUJYKy8rM2ZLRitObDI3TlZ0Mzg3N2lZREFVUjIwU1J1dFNvRE1ndE8r?=
 =?utf-8?B?ZDdzMG1wK3BYWVc5dUM5MTNnMVphdXorSWxQaXJMMThBWThDRm9CMVUxVlA2?=
 =?utf-8?B?U1owRkVhdlhSQk5uOVk5NXlhczhLbTI1ZXIxWnVPaiszeWtSUm1WS2tzeTcv?=
 =?utf-8?B?Z2ExdEo0UVNJNm9SMVRvZWFydFZLa1VwYjVSKyszMWJzM0JPSGUwM2NhdTho?=
 =?utf-8?B?akMyTWU4NWZJKzZ0S3BLamg1R25nbTBaNVN5bnJyWWk1d05ZdldWbCtmTnF5?=
 =?utf-8?B?K2paTlVoNDVRcER0ZGsxdjgvRU4xZUgyTDNPR0JjZ0kxRndQU2VuekpMblc2?=
 =?utf-8?B?NGNLNUkrUnYrSms5cDlIMXFtTGFqTXRBc0hJM1hZVDdGM1pHQVN0T2JIdUhZ?=
 =?utf-8?B?NENTR3RWOXJWeG82d1hiKy84YXd1aWc2c2RyQTYxNGFLT29Yd0JhSk5FYVV5?=
 =?utf-8?B?SjZ1aEdXQUVoYTVEc1BVcWFzMDVkUzEwTlpKdlp5WDJabTFDZzMzVkhxaEpp?=
 =?utf-8?B?Q3RSY0dBemFSeUhoNzFaRVdtYlJhZHU5ZGY5ZW1UM2dXOGFIbHZ0SE8yNEtP?=
 =?utf-8?B?eXdNWnVrVzI0YnpZRmI3cnVUZ0xaQWVaYVVTblZ1TFZKVWZBS080NGNZZ0pN?=
 =?utf-8?B?NXpKclFMYThsWm9uWHpUL1dNY013TGVDYnlIdEg3VGtNNno1QkhpZ0doZGFK?=
 =?utf-8?B?cjhXY1NjaVRhWlZyRXFxcjErby95aVBRRUFtV3NMbTExV0pjTjhVOGo2bWlG?=
 =?utf-8?B?dXZZVW52TUJORUwzc3UxMUw0MFgzcmh0VDN4Nkp6MEpDVFB1ZmtpWDJKak9m?=
 =?utf-8?B?NWErWW9SSWdiK2lheFo4Tkx2ZjlBSTBFNHI2QldQdDhFTkJrNjhLVXI3RVl0?=
 =?utf-8?B?eExCQ0NudmdQQTZ0NmFyVGl5VXVkNVpnWnNWSXI0WnBYMndLTFJGUytZNGZi?=
 =?utf-8?B?TWF6Mkd6bEV4UWFkSE5BSzZrNVl4VWdOMjZjcHExcmlBMjlVN3oxSE92RURU?=
 =?utf-8?B?aUR0bGE1dm94eWNkMVcxdW12dWkzYXBUN2RRMllRSzJrQUVUZVlrMVRTNDdL?=
 =?utf-8?B?K2NsMDBTandwRFk2WlArWXdmdTVmNTNEOFVyejh0d2lrSU1iNldsZ091VFJK?=
 =?utf-8?B?WlBzbGNrcENZQng5cXhkaVg1QzV4MUZ2MUxzaHJ2VnQrejVxbTFuSDI1V2xh?=
 =?utf-8?B?Wlk2Snd3b0REcUpzNnZ3Unhsemhjc3RhcEEycldCVncwRjRjcUoxY1Q0WXVQ?=
 =?utf-8?B?WXUzOU95MEpDRXk5L1RYejgrVHdnTHlTT1U0M0tWU3pDdStmT29GQlh5a2lN?=
 =?utf-8?B?VkxWc0RXdEcrYktzUzZtbVBGWUVkaGFIQmV2cUt1Zk8yQTNxemdRdk1zMmVE?=
 =?utf-8?B?aUhFN2E0VHd3UHhpVytXZkJWYVo1MjNkakw2bUdrMWY0VE1YTWg3VjBteUxO?=
 =?utf-8?B?L1h1WWNlOVhLSDEzcVVOQlRjRnB5SE5URThQZWRZNGZVQk1SMmZxQ2Z5b1Y0?=
 =?utf-8?B?VGxUUFErREQ2M1pKUE9BWEcyY24yb1hZMFg5QVhRenRzdkV3MXlaTEpYWFVK?=
 =?utf-8?B?bjlCOHpBR005R3BJdnhrZ2IvOFMrVUVEaTkxTWhqOVR0V0VXUGEyR1hPTkRi?=
 =?utf-8?B?V0xSelJKVStramhDYm1yNy9KRTJJVjh5UDFDcHcvNXkvRWc2cGd0S25tZ2tp?=
 =?utf-8?B?QXhSY1l6M3RTRVdqMlg1eGVjQy93YXpkOXZxUThnM1VXVWZWOXdvY25NMzA2?=
 =?utf-8?B?UitETnNBS1Q4NGFNRVkzaEJLSlo5TkhsTHBObHFkbXBTeDFuZy9SNmFNdHIv?=
 =?utf-8?B?cVZRZjFhalNFQ2FyNEJWaWJYVEVjTzk4VXBlQTNuekM1SlQ2dHU2QTNGRndY?=
 =?utf-8?B?SjQ5SGYwRXhERk9Zb0E4cFNGV3c5Nm1PbEZjVEZKUkJHcHFoUzYvZVZjdGhm?=
 =?utf-8?B?SVdzYVVFZWI3TlIyTkNoMVBaSVpoMmhkdnpGdFJXaDVsSS9iMkg2WWFzd1hh?=
 =?utf-8?B?Mzhxdm0vK0dqekFyc1ZvamwzS2NiVTBtSm5tSld3YXo5cjZwTVc3Ty90Y2JM?=
 =?utf-8?Q?YBTvoe?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(35042699022)(82310400026)(36860700013)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 12:58:08.2717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e468da-1e43-4190-9850-08dd7ce65602
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10102

SGkgTWljaGFsLA0KDQo+PiANCj4+PiANCj4+Pj4gK30NCj4+Pj4gKw0KPj4+PiArLyogU2V0IGxp
bWl0IGFkZHJlc3Mgb2YgTVBVIHByb3RlY3Rpb24gcmVnaW9uKHByX3QpLiAqLw0KPj4+PiArc3Rh
dGljIGlubGluZSB2b2lkIHByX3NldF9saW1pdChwcl90ICpwciwgcGFkZHJfdCBsaW1pdCkNCj4+
Pj4gK3sNCj4+Pj4gKyAgICBwci0+cHJsYXIucmVnLmxpbWl0ID0gKChsaW1pdCAtIDEpID4+IE1Q
VV9SRUdJT05fU0hJRlQpOw0KPj4+IFdoeSAtMT8gQUZBSVIgdGhlc2UgcmVnaXN0ZXJzIHRha2Ug
aW5jbHVzaXZlIGFkZHJlc3Nlcywgc28gaXMgaXQgYmVjYXVzZSB5b3UNCj4+PiB3YW50IGNhbGxl
ciB0byBwYXNzIGxpbWl0IGFzIGV4Y2x1c2l2ZSBhbmQgeW91IGNvbnZlcnQgaXQgdG8gaW5jbHVz
aXZlPyBJIHRoaW5rDQo+Pj4gaXQncyBxdWl0ZSBlcnJvciBwcm9uZS4NCj4+IA0KPj4gWWVzIGl0
4oCZcyBtZWFudCB0byBiZSB1c2VkIHdpdGggZXhjbHVzaXZlIHJhbmdlLCBzaGFsbCB3ZSBkb2N1
bWVudCBpdCBvciB1c2UNCj4+IEluY2x1c2l2ZSByYW5nZSBpbnN0ZWFkPw0KPiBXaGF0J3MgdGhl
IGV4cGVjdGVkIGJlaGF2aW9yIG9mIGNhbGxlcnM/IEFyZSB3ZSBnb2luZyB0byBzZXQgdXAgcHJv
dGVjdGlvbg0KPiByZWdpb24gYmFzZWQgb24gcmVndWxhciBzdGFydCtzaXplIHBhaXIgKGxpa2Ug
d2l0aCBNTVUpIG9yIHN0YXJ0K2VuZD8gSWYgdGhlDQo+IGxhdHRlciBmb3Igc29tZSByZWFzb24g
KHdpdGggc2l6ZSB0aGVyZSBhcmUgbGVzcyBpc3N1ZXMpLCB0aGVuIGVuZCB1c3VhbGx5IGlzDQo+
IGluY2x1c2l2ZSBhbmQgeW91IHdvdWxkIG5vdCBuZWVkIGNvbnZlcnNpb24uDQoNCkkgdGhpbmsg
d2UgaGF2ZSBhIG1peCBiZWNhdXNlIGZvciBleGFtcGxlIGRlc3Ryb3lfeGVuX21hcHBpbmdzIGFu
ZCBtb2RpZnlfeGVuX21hcHBpbmdzDQphcmUgc3RhcnQgYW5kIGVuZCwgbWFwX3BhZ2VzX3RvX3hl
biBpbnN0ZWFkIGlzIGtpbmQgb2Ygc3RhcnQrc2l6ZT8NCg0KSSBtb3ZlZCB0aGUgLTEgaW5zaWRl
IHByX3NldF9saW1pdCBiZWNhdXNlIGl0IHdhcyBvcGVuLWNvZGVkIGluIGFsbCB0aGUgcGxhY2Vz
LCBmb3IgZXhhbXBsZSB3aGVuDQpyZWZlcmVuY2luZyBsaW5rZXIgc3ltYm9scyBvciBvdXRwdXQg
b2YgbWZuX3RvX21hZGRyKG1mbl9hZGQoc21mbiwgbnJfbWZuKSksIGZvciB0aGlzIHJlYXNvbiBJ
DQp0aG91Z2h0OiBsZXTigJlzIGNhbGwgdGhpcyBvbmUgd2l0aCBleGNsdXNpdmUgcmFuZ2VzIGFu
ZCBtb2RpZnkgaW50ZXJuYWxseSBmb3IgaW5jbHVzaXZlLg0KDQoNCg==

