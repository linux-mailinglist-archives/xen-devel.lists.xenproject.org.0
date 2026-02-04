Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wC2oD9JDg2nqkgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 14:04:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1C9E6265
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 14:04:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220501.1529182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vncY2-0001ia-AH; Wed, 04 Feb 2026 13:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220501.1529182; Wed, 04 Feb 2026 13:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vncY2-0001gU-6L; Wed, 04 Feb 2026 13:03:58 +0000
Received: by outflank-mailman (input) for mailman id 1220501;
 Wed, 04 Feb 2026 13:03:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=THT1=AI=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vncY0-0001gO-R1
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 13:03:57 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0cf4035-01c9-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 14:03:46 +0100 (CET)
Received: from AM0PR02CA0177.eurprd02.prod.outlook.com (2603:10a6:20b:28e::14)
 by DU5PR08MB10659.eurprd08.prod.outlook.com (2603:10a6:10:51b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 13:03:42 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::d5) by AM0PR02CA0177.outlook.office365.com
 (2603:10a6:20b:28e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 13:03:39 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Wed, 4 Feb 2026 13:03:42 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS8PR08MB5911.eurprd08.prod.outlook.com (2603:10a6:20b:292::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 13:02:37 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 13:02:36 +0000
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
X-Inumbo-ID: f0cf4035-01c9-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CT83iqJXR4FC5RhwmRjFfkbawZ2gJzlpDNzylYm3qXvzaZOi6kmKldTp2L8jooljsnQ/3eyNCcAJNRjnMtRCrvyQgqQk2JZBMzuIbBgm3jw9EJnggt6oPprYPENu5c2Nll8TNdfnuY5s2876wRS5v8UAp3AVeTr6NmTQPopG6pYENZIZ4JObnWm5lGp/upOgBSlA/i9rMc4NBGePkejzV7Mbe+qw7NVLBb90oR44A9ZXTUoVHzG0b1nL+arsDc0bKinKvKlgAgTATcjc2qgkovVWr4FGimviVO6GwSCcrW+2KIzV85GyrNkFPDM/uEq+llrEQIJ8+Yl/POVjSfuoTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ivlrthExOPETeyvE/sfWrfednquKuze7PRxAG3QgN4=;
 b=Ol9U4lSsmTfGnoKZvSAIFISvwY0KCnsXHRthTwuJXPjQmeAtCz3Aq8C1vaty4vvI8M8d0YT4Y9GgKYE6d3yHETltgC8rehipXJXNGLvtFHnMZLcQS426EuX3rCwyNr798b1hfDskXOS2mJNM9CurJgN4gz4TofOVNT/I8RqtJK9RdO4litJDqU9kRXL6RSlI8N+qD0vyZ5EMnqnUb5+jRg/RqaEeITj3QVPyGdsI68vkf9G7J1BAeZnXXGzpG7ol+E8ewWK2AOe1toV9bbiaMpGpzFEcsgArZCcYgrPXLbSBVgQj2uIx3/xgGknsBfVx6jfpiXh2UE3JTRwbo1/A/w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ivlrthExOPETeyvE/sfWrfednquKuze7PRxAG3QgN4=;
 b=iHNObySI32zdH6av+lt1dYd/h1WoWDUp2Ugzx+VlVscCtOEpgycSfkdX4XnkBqbXRdHasg3BDapVCpe+TbMxfZtsrbHH4gQWrSqCjNR3soak2CSKDv5VgKyXBend2gbnAbYJzzZCMVfORiOlimo/oZZEJFBLOH8WuGM5KEsCfxI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqqmWjKqCjxtFwcBSrrySq/hpYh+f6teZuMliUnjGPkInyg7JRP33GewU5WFDFwxJA49WQDKacUNulCE5mYE8SCe2wXJTSPH/q2PInEWBlwYXVHRBeaYwH4cDt1Bz/MtJDJnAuXu/Tpdjanvz4VoYMHakE/Bg2e43vm7VF6t5vYtbgoFgt27aZuXHZQeSg4b8D7hY7dTFo4lHssqKGRicoPDCt9qlSMURGNUr3vA4zbCZuRCB/rsGwkGIpmhkrOnK1IRGBbiFfF1Mdf9AWzFfraTOV5v4zg86e2LpX0pvVm+rrTrROQ+0VjHw8cgQMFUJenWASX+/9bq1T+mBz8l9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ivlrthExOPETeyvE/sfWrfednquKuze7PRxAG3QgN4=;
 b=b5yWUibu8d/tyFtkv8cBkdvDLDSAtJN2DaRUkuj8DQUhu9/rO7TZQsdulIKvqW3UNGBNOaTQIzEgG+Wckvank+/85B1o19gQPTKEAuZcv9InN5eyfxIcTDxUnwEBUT2t/LnMW4yZS+KCEdHqZDizsCGE0jdhH/PPh9cgBm1GCq3fUey9vR0NShgTHUl+ebTskS/lOIh4gfG77vKwBNwV2ZgVitE/ZlPa1cePtdrM60SpSviWII8uW1X7M6Tu4BAyvGGtJb4PFeEl4vDKppajTFMmuwQBhcfwxv2kYBG1De9mka2gi1yroSvf/Ee2ixMyyJTDOfd+DqrYl7QycJu6iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ivlrthExOPETeyvE/sfWrfednquKuze7PRxAG3QgN4=;
 b=iHNObySI32zdH6av+lt1dYd/h1WoWDUp2Ugzx+VlVscCtOEpgycSfkdX4XnkBqbXRdHasg3BDapVCpe+TbMxfZtsrbHH4gQWrSqCjNR3soak2CSKDv5VgKyXBend2gbnAbYJzzZCMVfORiOlimo/oZZEJFBLOH8WuGM5KEsCfxI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 0/5] Implement CPU hotplug on Arm
Thread-Topic: [PATCH v5 0/5] Implement CPU hotplug on Arm
Thread-Index: AQHchGj6Bf8iLxj9KkKeGyrpjQwglLVxTT0AgAFV7wCAAAEEAA==
Date: Wed, 4 Feb 2026 13:02:36 +0000
Message-ID: <4790C2C5-B042-47B4-848B-EF27154215F8@arm.com>
References: <cover.1768293759.git.mykyta_poturai@epam.com>
 <51B975F5-C0EB-43AE-97FD-CC937DBC593B@arm.com>
 <e653b557-7423-4bd1-8e84-a72ecad5d40f@epam.com>
In-Reply-To: <e653b557-7423-4bd1-8e84-a72ecad5d40f@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS8PR08MB5911:EE_|AMS0EPF000001A7:EE_|DU5PR08MB10659:EE_
X-MS-Office365-Filtering-Correlation-Id: b420f020-3f67-4add-15a7-08de63edd285
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZVBYeGNqQktlTGlZYXN3d1A1T1RKSEZXbGxZakFWQ3ArVGcxNCtHd3IvVTNY?=
 =?utf-8?B?SEV4aFRHbWNKb3AvRmNZa3lieWJTaHZMVFpmZXNFMnlNd2VpQ3RPcGIrY1RH?=
 =?utf-8?B?RmpkTFp0VWozcm93VzFoVnpwZGJpZWFaTE5pcW5hRWRBSEsrbEJsR1RYb1FL?=
 =?utf-8?B?dkFLbzNZbk1RMk13eUwxNk81eTNGcFFoeGpDZDFSRS93UFlKY3ozN0thSGs2?=
 =?utf-8?B?SmNXSXd5TGRIQW03MkZOdlNpMWpQaFN5K1AxRWVDUjVBaEpicmJ2Mk1oRCtD?=
 =?utf-8?B?MHRXSFVEaGs3MG9pZ1ZST0FHUU94YzNEM1VUMXN1eHBVRVYwaytrQm9CelhB?=
 =?utf-8?B?a2FPdTRheEUxbnptSWZQdXh3dTVzRkswaVFXOEY2OXN1djViYU5UMzV1Q1k0?=
 =?utf-8?B?dUM2YkNsQkl0QWhuaWlPdVExQTNGRk9vUGw5QVJRZ3Y0SzlOWlZJZ2lGblVw?=
 =?utf-8?B?eFFjazVIQnA5UGVWeFVTRWl6RmdBZHphNHQ3TktOOElvMDRXRnU2Z2xJOEVt?=
 =?utf-8?B?ZW1LR084dFdtclhXaC91MHorS0VvOXBxdDh6Z252VkxWSC9Tb2hUdGNuK2dX?=
 =?utf-8?B?QW84NU1oNUp3UXlBVkZxZ2NCeUZUd01ORnh4cTVlZXZRcFozV25UcWxvVGlY?=
 =?utf-8?B?TDZTUHVYdnY0QTkzYTNWdzVMUFIzTTUrQjlHcDdUSURFakdlNE9lVjM4WFFR?=
 =?utf-8?B?YVhONDVCTGYrdzU1NVdpRzAxTTd5VTlRQ3V6QzFZcjYvT1pUejBKeTFzdmJm?=
 =?utf-8?B?MGZEeWlDVFFrVlZxN0U5NUpqNitUd3ZRODF1c0kwZWVKb1FuZEF6Qk9xeFAx?=
 =?utf-8?B?dnF3MnZtSGVIVlJxT0g1TytxVHdhQ3hQRjlKNmpqekt5bHY2OExRcndmWlEz?=
 =?utf-8?B?NFU2L1Jsa05ma2VTRnIxWk94dE5NZ3FiajdKdFRmSTluODBLZ1dFRm1SdDR2?=
 =?utf-8?B?STZtVEZFRnB6Ylh6TjF2a05WNXNDZzdiQlA5aTU5VUFGRFRoZm1sSExlM2Fm?=
 =?utf-8?B?MnhkQWkwVDVxa2pNa1BCNkg2cVJ2aEZnMHdKczl5a0s2bzRlWURuQlBaOEd6?=
 =?utf-8?B?WUxPMHlFbDE0Ykd6eXBOSlhzcittazJ2VW9raHBqellnVHVEanpnUE5IYkFE?=
 =?utf-8?B?cUJlR2t3bHpTQkNVM3ZUa3J2SlEwSDZOMVYvNkxOUU9Dc3dEMGdCVXFraWdk?=
 =?utf-8?B?ZzJEaEtKTW9xUVRUa1llY1czUWQ0Y0tzcE1sSUdPSjRqT2V5eWwyNVZKbEtT?=
 =?utf-8?B?MFhiYXpUc3pNOXlsUkNCUFhZTjlWQXg4eStKNWdQc1BkWmk0T3JMYWh2OWVn?=
 =?utf-8?B?K0ZqQUk1WlBQYURZTGZyUUdNaXI5K3ZtSmI1MWl2WVJ1UStoVUpCZFlyMVVG?=
 =?utf-8?B?TmlRRW5rRHhXT21KZTFnQTFGOXFrWUVacmlRMitPNnI4SkNwZkozd2psMEpH?=
 =?utf-8?B?Sm00K0JHVkxHa2RzNU95SVdJblNxTVcwU01VQXVBUmhpV1pSZy9CRFdxWVhN?=
 =?utf-8?B?YjZjV2NGcnVhS3p0bEJzWEk1UG03d1VER25mUFlTR09jM0VYeHRWeElyTDZQ?=
 =?utf-8?B?RVBvOVphWWZwdjNlTHVCUjJjOFJYUmQ4NWxpSXFaSjd5ZTZhQzBJbWFZWE0w?=
 =?utf-8?B?aHlIZGFvRi96Y3pMTk1XbDlMM2VyWStpMGtKR1J4ejQxTC9ydGhUWUllTTFu?=
 =?utf-8?B?cndEYTRldEp4TVQvc2UwdzlyQ2FLZW1VeU5EM3B0dERXVDVDTnVKWlEwb1No?=
 =?utf-8?B?dUUyQkxLakVqM3ZVK3pZTnhtRXJCbmVoczNOMzJqcnIyTklmVXVzSm80dTc2?=
 =?utf-8?B?THJOZWlNTTRuOVlka1FnMHg5cFRzenNBVGdwbFZPdlZFbHQrbHZqTU14dlFy?=
 =?utf-8?B?VGxJbXhqQzlsRTZ2Ym90NHQrZHNWSVMyOWhQMVV3QmpzMk9OVjZBNEd2ZTB2?=
 =?utf-8?B?RVpiTndpcGt3U3VlZ051L0h4S2t6eldObEpLbmtXdU9WSjNSekFicWZBaW9U?=
 =?utf-8?B?VG50NWcyRjhic1hVQlJ1eWFuUHk0RFN6ZzJEdWNTS2NLQ2t1UmNhdFVydENm?=
 =?utf-8?B?eDRXUVhlRklIcnJSVkpqcXVXQjFVamg1U3ljZyt4NW9YUzNLblh0S04xZlA2?=
 =?utf-8?B?YXJOaVpXUXhWTUdjcE9CZVpqNU9UNitUcTZOcW00a09HUUJIcEhSV1RrNzdL?=
 =?utf-8?Q?9Cx/43nffYFWFUa0O1J/e6k=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <899D5E7AA5C2A14BA1465AF5D047D3CC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5911
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3d8f2d7a-78d8-451b-ddf7-08de63edab40
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|14060799003|1800799024|376014|7416014|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SzNWbGZkQUdTc1BpcStDTmRRQXZDMjlMSmdxeFIyOUlIL20zWFcxM3lSazFw?=
 =?utf-8?B?d0FSc0pMbG44d2dIeDF2ZVpSY0ZaeFp1a3Jyc29QL1o2K0tJd1BuSHRkYjhY?=
 =?utf-8?B?NzF3eHU4T2FrNms1dU9abXQzSUVUcHFRMmNSVFNGY1hZREEyREFxWWJ0THF5?=
 =?utf-8?B?ZFhmeFpIajZaVXlZZUwveG4xVk5qZGJ5eFpHNHI0TFY4Rk8zRVIzalh1Q092?=
 =?utf-8?B?bmZkaVVjK0xPVGRBOFA1b2laN3l0NkdoNlVvSVJZbzByRU43VWRWOGpmeVJB?=
 =?utf-8?B?Y0psM2o3UXZIaEplbXFWNmVuQ0JiUUpZaUl0cko0ZkxCaVBheFJRR3VhZVQy?=
 =?utf-8?B?aHlJNFpHcFNQMC9hY0NFdUJmVmlXZjAyTkMycUJwYkdzb0p2T1BUem1lSXVF?=
 =?utf-8?B?N0krampPSVd1ekQ4ZVZlNnEvdHNKNStqYmFBOGVkcjU3VUJtdnhOeDNoZFhR?=
 =?utf-8?B?MDM0aFBZd0FaL2VBZ1dLcStJV1Qyd0pxMEFnd2F1S2NVeTRBVDJ2djJZQ0VX?=
 =?utf-8?B?SSsvSFZWckZTSmo1TFR0Z2VTSmNxOUloR2JmY3JBdkFpMVVtMkc5WXdZaURT?=
 =?utf-8?B?eStOWWc4VGNibTUxTXg0c29waEtMaTVhVEN1aUtpSkVFakI1Qk10VndHbVlk?=
 =?utf-8?B?M2htaVRFN3A4WjlwK3M1aG1RY1F2REJMQjQ1aXBXUENPMllkeitFZnpjSUVn?=
 =?utf-8?B?MHJ2LzFPMkZ5MEFGaWRZRTk1cXpYaHZWK0tGTE5YWDB5UUFrSE96Q1diamxw?=
 =?utf-8?B?RnRuYlJiUXVlNWE2dW9NZDU5d3NyWmY0NWJEaHNTY0loaFB1Wks2S2NVRUJL?=
 =?utf-8?B?WllvMWFrRkdXY21ZdmtrMHlhSEVLL0kxNDNwMzJ4NGhYdWg5ZnA0TkhQZ0F4?=
 =?utf-8?B?NE85Sk00NlJtRmhnMFpLU2lFRy9YOEFVdjFTTU9kVHNxclgzWVhBVW9GdmVF?=
 =?utf-8?B?ajRhSXptNi95dFdQcys5MElTWnRXcWRZSHN5bHp5U1k2aHJPb3o3cXNJZEw4?=
 =?utf-8?B?U2ZrcHdwSVNqQ2tBWE9IK1VNdVc4dU1NRm9OQmhxWHRWazdzbWw1ekYvMGpM?=
 =?utf-8?B?bjJTY2VMUm1YMHZqQnNrTzlvbE90ZzIwcUEwSWV6VXluRmRnemlvQkxzQ0Fm?=
 =?utf-8?B?RmhWRERTOFhvUHNGNlJBUThVUTNsOGNIUEpsZ2pVbHRKbU1aQzBqYThZcGhB?=
 =?utf-8?B?M1FmejdkNDRJejNvOTYyUklYOXkvcHViZmZQU0lRSUw5NXhmSTdLT0RhNnFi?=
 =?utf-8?B?MXpLYkZjMlJEYWhWVlJDMVdoMDVwTWZIaG1ZbUZuTDFmaHFNM2twYjRYTkVG?=
 =?utf-8?B?VFdscG1QcHlSdENjUUhVWElhVmQxSnRad3FFNFB0KzJOTHFqNkg3cUFVd0E5?=
 =?utf-8?B?aVJ1dUJJWS84TUdodjRuc0Y2aGZxbFdlRFY3UTRhOW5WVWpRMS9WNDU0WHNQ?=
 =?utf-8?B?TW1lUXlkTVF3MmcrU1htNGg0b0loVkhrdzlRcGIweHM4T0tvem5ydG5HSm9t?=
 =?utf-8?B?UWowL0pVMkNiN0o0ZXVTdXVNdDNraldMRGVzcVBkNEVWVzhlZUpwZ1h2dFkz?=
 =?utf-8?B?ZVNPWndNbDlpYlhETGEvWlpVRFczQi9zWklENnpBZm9jU2ZISFdNTXdDRkph?=
 =?utf-8?B?cXNFcE4yZkpabWFqUDhoWGNkeEhvaEI4VDdkNGs0RW9lMnU3Z28xVzdtdmdP?=
 =?utf-8?B?dlRPNWd4VXN1T2o0bEhJbWlSSlFoMHBSSkpYWm5GVnpNT1VIayt5N1htWm5C?=
 =?utf-8?B?MFRHYVdEaVhZZ0prcDdlUngveGxSd3NKWS9pSVdPbEl2di9mYTlxZTNuMHhP?=
 =?utf-8?B?c3lQTE00ZFZkek13VHh5QTZ0QzdiaFZIdWQrZGZDV2RhellsTklidGVzNUMx?=
 =?utf-8?B?MEkyMnhkSTk5M1JHdEU5VjhFcDlpbDNXdzlEU0d3VXVsenRCZ2VTQzh2SlM4?=
 =?utf-8?B?YjhPRExaUmUza0RwcFMvT3dHclk3U2xtamlpZzlnNTZieGg2SllTVmJoRGJm?=
 =?utf-8?B?eWNkVVM3VUpvY3hyb0EyNXJ1RTJVSjNRS0diWU4vR0FHazZtNWd4b1ZmL3o4?=
 =?utf-8?B?amxyWG9MWlBoUE93aUZGV1UwZjNJdjRZNGZseFpLOW9tTXdmRG9ycjYvaFdJ?=
 =?utf-8?B?UzhQN3Z3aldYSTZDRmg4cWROM2ErdGxYZVp6QldLbFM1K2xyczROQm0zT3hU?=
 =?utf-8?B?Rm05SGFXaUw3WTZSdHFtTG5rU3NEQVU3aWtXMU5IMGxiYStRbFhUaFVyWHpm?=
 =?utf-8?B?bXRqdCsrUVVJcExma3BMWmswWC93PT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(14060799003)(1800799024)(376014)(7416014)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c8ZyIozK+TNh45F86B36AKCrPD4D9l/RSybNIYR0Ez5WuZzwa6LVAGzXUIFb6M4cKGIZXyVOi1jyy+p6FckxfanmgzjAQ+Zz+7voKvrXuxe69giejZ4c8r8UI/cfmYrMbPrajca0ALB79V1ccvXEtK1DFMV9E6eBTZJQk+8NOfkG/8amkQUrQBJw0CbeyMe67UrA+le83miKwVDjuFIJb5BBSYS8VyHcLSc8s0u6zJdIFKIqLaGcQjHaSiOXl0VJpvhf1W8xgDHSOlWr0ranz9CeJOj310XTRpwlaUlcMHgQpiEkH0f2O9tqFswnHMpctsWXe5epLHWqAlysJnqs2TNVl79dqAYd0za7UrU0T7A2xe0gEDTXms7TH0Z5cgKxi0n67RmjT28oLw1qtnEVnn5eFTVuDefg89aFM+6Nz90FrpstUz4Jz6HrcDaCNhPw
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 13:03:42.2436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b420f020-3f67-4add-15a7-08de63edd285
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10659
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim,epam.com:email];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[lists.xenproject.org,kernel.org,xen.org,amd.com,epam.com,citrix.com,vates.tech,suse.com,raptorengineering.com,wdc.com,gmail.com,apertussolutions.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 7B1C9E6265
X-Rspamd-Action: no action

SGkgTXlreXRhLA0KDQo+IE9uIDQgRmViIDIwMjYsIGF0IDEzOjU4LCBNeWt5dGEgUG90dXJhaSA8
TXlreXRhX1BvdHVyYWlAZXBhbS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDMuMDIuMjYgMTg6MzUs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBNeWt5dGEsDQo+PiANCj4+PiBPbiAxMyBK
YW4gMjAyNiwgYXQgMDk6NDUsIE15a3l0YSBQb3R1cmFpIDxNeWt5dGFfUG90dXJhaUBlcGFtLmNv
bT4gd3JvdGU6DQo+Pj4gDQo+Pj4gVGhpcyBzZXJpZXMgaW1wbGVtZW50cyBzdXBwb3J0IGZvciBD
UFUgaG90cGx1Zy91bnBsdWcgb24gQXJtLiBUbyBhY2hpZXZlIHRoaXMsDQo+Pj4gc2V2ZXJhbCB0
aGluZ3MgbmVlZCB0byBiZSBkb25lOg0KPj4+IA0KPj4+IDEuIFhFTl9TWVNDVExfQ1BVX0hPVFBM
VUdfKiBjYWxscyBpbXBsZW1lbnRlZCBvbiBBcm02NC4NCj4+PiAyLiBFbmFibGVkIGJ1aWxkaW5n
IG9mIHhlbi1ocHRvb2wuDQo+Pj4gMy4gTWlncmF0aW9uIG9mIGlycXMgZnJvbSBkeWluZyBDUFVz
IGltcGxlbWVudGVkLg0KPj4+IA0KPj4+IFRlc3RlZCBvbiBRRU1VLg0KPj4gDQo+PiBEbyB5b3Ug
aGF2ZSBhIHdheSB0byB2YWxpZGF0ZSB0aGlzIG9uIHJlYWwgaGFyZHdhcmUgPw0KPj4gRG9pbmcg
aG90cGx1Zy91bnBsdWcgbWlnaHQgaGF2ZSBzaWRlIGVmZmVjdHMgKGNhY2hlcywgY29oZXJlbmN5
LCBpbnRlcnJ1cHRzLCBldGMpIHRoYXQNCj4+IEkgd291bGQgbm90IGJlIGNvbXBsZXRlbHkgY29u
ZmlkZW50IHRvIGhhdmUgdmFsaWRhdGVkIGJ5IG9ubHkgdGVzdGluZyB0aGlzIGluIHFlbXUuDQo+
PiANCj4+IENvdWxkIHlvdSBleHBsYWluIGhvdyB5b3UgdmFsaWRhdGVkIHRoaXMgKHdoYXQga2lu
ZCBvZiB0ZXN0cyB5b3UgZGlkKS4NCj4+IA0KPj4gSSB3b3VsZCBiZSBpbnRlcmVzdGVkIHRvIGtu
b3cgaG93IHRoZSBzeXN0ZW0gYmVoYXZlIGluIHRoZSBmb2xsb3dpbmcgY2FzZXM6DQo+PiAtIHN0
b3BwaW5nIGNwdSB3aXRoIGd1ZXN0cyBwaW5uZWQgdG8gc3BlY2lmaWMgY29yZXMNCj4+IC0gc3Rv
cHBpbmcgYSBjcHUgd2l0aCBhIGd1ZXN0IHBpbm5lZCBhbmQgb25seSBydW5uaW5nIG9uIHRoYXQg
b25lDQo+PiAtIGNoZWNraW5nIHdpdGggcGFzc3Rocm91Z2ggZGV2aWNlcyAoZm9yIGlycSBiYWxh
bmNpbmcpDQo+PiANCj4+IFRoZW4gYSBnZW5lcmFsIHJlbWFyayBpIGhhdmUgaXMgdGhhdCBtb3N0
IG9mIHRoaXMgY29kZSAoaWYgbm90IGFsbCkgaXMgYWx3YXlzIGluIFhlbg0KPj4gZXZlbiBpZiBD
T05GSUdfQ1BVX0hPVFBMVUcgaXMgbm90IGFjdGl2YXRlZCBpbiB4ZW4gY29uZmlnIHdoaWNoIHdp
bGwgcHJvYmFibHkNCj4+IGdlbmVyYXRlIHNvbWUgZGVhZCBjb2RlLiBDb3VsZCB3ZSBwcm90ZWN0
IHNvbWUgb2YgdGhlIGNvZGUgbm90IHVzZWQgd2hlbg0KPj4gSE9UUExVRyBpcyBub3QgYWN0aXZh
dGVkIHdpdGggaWYgKGlzX2VuYWJsZWQoQ09ORklHX0NQVV9IT1RQTFVHKSkgb3INCj4+IGVxdWl2
YWxlbnQgZm9ybXMgPw0KPj4gDQo+PiBDaGVlcnMNCj4+IEJlcnRyYW5kDQo+PiANCj4gDQo+IEhp
IEJlcnRyYW5kDQo+IA0KPiBJ4oCZdmUgdGVzdGVkIHZhcmlvdXMgcGlubmluZyBzY2VuYXJpb3Ms
IGFuZCBhbGwgb2YgdGhlbSB3b3JrIGZpbmUsIGFzIFhlbiANCj4gZm9yY2libHkgdW5waW5zIGV2
ZXJ5dGhpbmcgdGhhdCB3YXMgcGlubmVkIHRvIHRoZSBvZmZsaW5lZCBDUFUuDQo+IEnigJl2ZSBh
bHNvIGV4cGxpY2l0bHkgY2hlY2tlZCB0aGF0IGludGVycnVwdHMgYXJlIGdldHRpbmcgbW92ZWQg
dG8gYW5kIA0KPiBmcm9tIGNvcmVzIHdoZW4gbmVlZGVkLg0KPiANCj4gSSB3aWxsIHVwZGF0ZSB0
aGUgbmV4dCBjb3ZlciBsZXR0ZXIgdG8gZXhwbGFpbiB0ZXN0aW5nIGJldHRlciBhbmQgYWxzbyAN
Cj4gdHJ5IHRvIHRlc3Qgb24gc29tZSBoYXJkd2FyZSB0byBiZSBzdXJlLg0KDQpUaGFua3MuDQoN
Cj4gDQo+IENhbiB5b3UgcGxlYXNlIGVsYWJvcmF0ZSBhIGxpdHRsZSBvbiB3aGF0IGV4YWN0bHkg
eW91IG1lYW4gYnkg4oCcY2hlY2tpbmcgDQo+IHdpdGggcGFzc3Rocm91Z2ggZGV2aWNlc+KAnT8g
SSBzdXNwZWN0IEkgYW0gbm90IGZ1bGx5IGdldHRpbmcgdGhlIGlkZWEuDQoNCklmIGEgZ3Vlc3Qg
aGFzIGFuIGhhcmR3YXJlIGRldmljZSBhc3NpZ25lZCB1c2luZyBwYXNzdGhyb3VnaCBhbmQgb25l
IG9mDQppdHMgY29yZSBpcyByZW1vdmVkLCBpcyB0aGUgZ3Vlc3QgYW5kIGhhcmR3YXJlIGRldmlj
ZSBjb250aW51ZSB0byB3b3JrDQp3ZWxsIGFmdGVyID8NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+
IA0KPiANCj4gLS0gDQo+IE15a3l0YQ0KDQoNCg==

