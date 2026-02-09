Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gD4AAEv5iWn5FAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:12:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E99E3111B3B
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:12:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225589.1532128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSvQ-0006Lv-AD; Mon, 09 Feb 2026 15:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225589.1532128; Mon, 09 Feb 2026 15:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSvQ-0006JT-7G; Mon, 09 Feb 2026 15:11:44 +0000
Received: by outflank-mailman (input) for mailman id 1225589;
 Mon, 09 Feb 2026 15:11:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r8oy=AN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vpSvO-0006J4-Rb
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 15:11:42 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a391536f-05c9-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 16:11:41 +0100 (CET)
Received: from DUZPR01CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::8) by AS8PR08MB8251.eurprd08.prod.outlook.com
 (2603:10a6:20b:53d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Mon, 9 Feb
 2026 15:11:33 +0000
Received: from DB1PEPF0003922F.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::e0) by DUZPR01CA0033.outlook.office365.com
 (2603:10a6:10:468::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 15:11:32 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF0003922F.mail.protection.outlook.com (10.167.8.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Mon, 9 Feb 2026 15:11:32 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS4PR08MB7504.eurprd08.prod.outlook.com (2603:10a6:20b:4e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Mon, 9 Feb
 2026 15:10:30 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 15:10:30 +0000
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
X-Inumbo-ID: a391536f-05c9-11f1-b162-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yG5fMuYk5VcNKCtFaaSOZJB8ff7QOJ/gYbzPw2SwRV95d3sqsMT9X7e5MOCU5TIqx3MrnWNizwxr9j0e+/VNUhxldhlbR8iP+jwkqG5LjyvXdoP7B48U7exyCJbz3r4pcGYNLBKtpIX4w7b5Nk60XRAinPSHLvIu+UUNEro6cxjXE0F9lCX7uzo/nIewX4vCYs0wy5ivV4mA4ppCQEZHPDMXXZJgNxTx01zVaN25Z6DL/MhQo3DbmkcHmRIqmTxRBcI7e/UqVPJ+DP41tigw7Qdb3BmrpOkrujYZclfD3nQtZfKOITpNWw8qhnSeeX0ZEyzixH3tnGKCMWGk7bXSgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSzZl7+l7g50NRkkwswd5H4TBwFmrQBYdzfeGfm9ilA=;
 b=gUvYo0FohOS6ArX0j+Mzaf0lsIBAddLgDRDI20DU61bFFjoI468wqDhCBRQOrMBvwrXjMAldlG80qlMb6a9+kNifoLo98aT/IM0tL8slHTXVYf2eeN6uDl5v1wCWBsRCn4CliZdABngL9qNsL0pUOkEdIG+AhNOy6XLmgkg8qguQR4rSFFfHGEVaaoaWmXvWFvZoYKKxsEia+HR4qNjbR5hlX6Uzxb535Z+tpHA1k6oxSdoAkMSb7amZanCOf1PAXP61IVfRk+iqJOEfRClBqPYcPvcXEVPk+JV/f8hFpVTQX7L9tl/+uJbD0Pl4oNSroPc3QzQ0ADvivr7k/fjWuA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSzZl7+l7g50NRkkwswd5H4TBwFmrQBYdzfeGfm9ilA=;
 b=SnqwxzSl4lDJVsY1Bt/WDE42/wTtJLfIDf5O1W0nO4MvyTKq59/a/Gxoa4f3dGkg/Uzzu/UARA4SegBbXO0k6FmTNtgo0ChO+8AGtRDy5kVSH83giVhYNSHSNotNde7vgBNyMu71wQYCHvg0CHLUH+o0RBcBV4oiy+7BLRwU1Mw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlS72dkN1xQoOxmfFQLWN2ldrtcNjhf9GX1YRYe3vKjspdWefi+wnpmzTehwCIpytO7JzrqxBCpYfv2Uaozih5lkQAUmXD6LKIaa5AifqsAdRF9fJ7OXH+F01pesRAsfpN8cmnYIfb5o4NGDIQIjCZwEfRxIDB99+vst4kJs8XKEg7Fdpc9nApUnMBKbC93zeNORAiu8ODYz4t6hWv1W5SF3yFM7mv9mpgukeG7Fhai0ksE0wQok+QWq+oX9cxx5OKVThu6akcm7kkvW4OM3MFUqJmCj4oEOfMRj9OFUFuMgXJxBFIrtR7LCNWT1AtxCVgzhmb4z3CTJu/a7GhHG8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSzZl7+l7g50NRkkwswd5H4TBwFmrQBYdzfeGfm9ilA=;
 b=cT6U407yMW48/pe5NcuOEs27yFLhx5XgEIGjktkrZa2JtU2DJPKs9OHiyrKr9Jc19Jx3PHYSiS7ju7XskitihBekFavkxgGG1zpUzKagbP6rnC+ovDRC96XEMuCR0C/ew089HXMXJ8Mt+U3KovS7L1rJlnQ/rKfO3MuGjTLRkwu9B2EmRaZAwy5r7GrDbpqn7qliyz8eIkp4dMCUuxXSDx0p7D2xKY8LTuJEesq+kDdk4+FODpfRiWtS/A2BM+kVk7E27/GTupsnGGOoWF7qwhGOEF1MBd8s4rOXM8UwK81EawNo0nyUgopbwYrGI5TgaZB1zlotz1kQ5z/eeQphNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSzZl7+l7g50NRkkwswd5H4TBwFmrQBYdzfeGfm9ilA=;
 b=SnqwxzSl4lDJVsY1Bt/WDE42/wTtJLfIDf5O1W0nO4MvyTKq59/a/Gxoa4f3dGkg/Uzzu/UARA4SegBbXO0k6FmTNtgo0ChO+8AGtRDy5kVSH83giVhYNSHSNotNde7vgBNyMu71wQYCHvg0CHLUH+o0RBcBV4oiy+7BLRwU1Mw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 03/12] xen/arm: ffa: Harden shm page parsing
Thread-Topic: [PATCH 03/12] xen/arm: ffa: Harden shm page parsing
Thread-Index: AQHclTP8S4iGL6T7pUmD4E2SewFDhLV6I0SAgABSaACAAAxSAA==
Date: Mon, 9 Feb 2026 15:10:29 +0000
Message-ID: <0680A28E-E2A6-4A75-9C82-1348ACD17E2F@arm.com>
References: <cover.1770115301.git.bertrand.marquis@arm.com>
 <97a064c81ee5ea26774c189538f9f1e37dd3eebc.1770115302.git.bertrand.marquis@arm.com>
 <CAHUa44Ey=Ph_m8r933K5enqPJgFuyVgY+2Qhtj3pi+V_Fw4=6A@mail.gmail.com>
 <19C7C710-4447-42AC-AFF3-F3122606BC0C@arm.com>
In-Reply-To: <19C7C710-4447-42AC-AFF3-F3122606BC0C@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS4PR08MB7504:EE_|DB1PEPF0003922F:EE_|AS8PR08MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: c477c172-08db-4015-2ace-08de67ed8261
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?OWhxazBEdE12U2VndDdlcXpETDdlelpBMFNzMk1SeDFJNUt6NXRoMXVSN3Fn?=
 =?utf-8?B?dlpBelFkSVBYcyswR3puQkxpMzA4QkE4M2RzMi85eWw0azdWQVhFeEFMK3Y3?=
 =?utf-8?B?bUZWTzkyQ1EwTXNsUk9TZDBEeGRpRFVSTTRjMVhHUm9rcFpmMngyZEF4YUw2?=
 =?utf-8?B?bnM0TWZWZmh1VGxjQnN2N013YzRGMjZORnJaSFo1T0RxVG9hK0IwZVhBQlcz?=
 =?utf-8?B?bFl1bjFiN3NYZWlsOEdDcjUzRWtkZkxxTWcrand6czJsNTVOSktCbDU1Z0lE?=
 =?utf-8?B?ZUI5SHJUY0Q4bjNFVzdwYm9uejJFcGRKaXd0bXE4dmc3VWFTRzVHT3RTcFJO?=
 =?utf-8?B?TWVDRlcxWGRCUEZrRVVGbUFpOG4xTm9FU3RuSi9Hc21tL0VTYmU2SnhIZ05t?=
 =?utf-8?B?dDJML3pQSTRTWHFBRk9ocmF2dFQyblFsSWg4cTdDL24ya21ybkd1WVV6dDVl?=
 =?utf-8?B?VjVmOXNiQ3pnYTRzNytzeUdzVCtZaFFkODVjSG5xZ1Z4KzFmWUI2Y2drTk5R?=
 =?utf-8?B?R3B1elhNdlpZUng2NzlyemZPVURpSmFIQ0RiR2p6aFlpMXc3NWdmUldyWnNL?=
 =?utf-8?B?VmJJNjlZNC92b05VRFdsUExzZ3RtRmorbU9DTGdpaXdsRm5lZnFLWUZ0cjEx?=
 =?utf-8?B?djViUGNocWc2NVVQSGZTbXJpc1FFYWNMbVdlRjA0cDRrTUFnSDh4S0cvVTg2?=
 =?utf-8?B?VWxscndRejRIdGhRS0JJcE1vY0FyaUczVy85eXVxZmgwb3RuQ0ZsaU4xMGVJ?=
 =?utf-8?B?U3RLRHVaN1FNa2hVMXBZNzNuK1ZXWG00bDhwWmc4MUdiNFo4UEo0emxlb05C?=
 =?utf-8?B?cGhMY1VxeitlZFVQUHJ6M09WMmRZMGk0VDUrbFZVSHpudmlTakZDVWVwQklW?=
 =?utf-8?B?NUFScWJobHN2UWNDL21xTVZVUUdkejBEci9ETU9EK002MVhyaU5qMFVwd0tB?=
 =?utf-8?B?V0Z2ZEFPWTNzRlY3Q3ZOWlZxVDN2c0VuamdVUDMyMk5YenpoSzhIQXF2Vmdt?=
 =?utf-8?B?eUtOT1hSQTBlZnVuN0Q0SDRwVWhVcitKOCtjTTRtbUtLYzYyWmZxcE5xakda?=
 =?utf-8?B?aC9MdHUxNUxwSnQ5TkEyQTQ0d1BGOUh6eXgyQW56V0tKLzUxQW1iUVRyandz?=
 =?utf-8?B?NWQ3Y0J5eGxJNk82Q1dHM1BiR2FBZFhFS0lldS9qbm8rN3VBaWhHUnJGK3JP?=
 =?utf-8?B?WDlLby9wVndIdzJEOThKbmVCTmVzZTFlaituYkROOUNRZlVYdHVkdWllNTJz?=
 =?utf-8?B?a1MwM3BITlkwMEJ2ZW9DRUJVMTY5MkZnMSs4RXIwbWJCQXNVbDBJS0creXNz?=
 =?utf-8?B?bW1NS0t2UDl4ZlIwUnh3QUUxb1paRC9OTkI1U3BJVkk5cEFkRi9uWlpieGlO?=
 =?utf-8?B?bHhBc0RzTi9QOVNYdEhzMEQ4b3FOUDRkMHpoWG52TkREZmxsYjlUU0ptMG1S?=
 =?utf-8?B?Q3VreDFMeVRSOG1nRXRZYWptbEFXZVg5Nk53N1lOcDhqN3hkakZwaVFEY0Ur?=
 =?utf-8?B?Ulp0RVNvdTZaaFM3SXRjb3Q2OXVibWVyeEN5WUVySGhXdmFMU2ptd0dMNjFU?=
 =?utf-8?B?Yyt3cVF4WDlMZEJkMU43dlNVcmZlTGwvSFcxejk2WVU5aThZUVRnQ2hEOXpn?=
 =?utf-8?B?a1MyYUw3YXVGM3NWVWFRZXE5UHRtYnhQNlZTcUpSK0p6bkZkS3o4V2Q0dm45?=
 =?utf-8?B?YjlvY2FBZmxvV1kyRWZRdGVFUndDL25KS1hPVE5mbERCYXFtaGxURExPSS9Q?=
 =?utf-8?B?ZGtud1pXbCt2cm5HTW10cHNiRlUwSTZ4akdUalR6dmNWOWFZRHZvcnNkZjlW?=
 =?utf-8?B?Y1ZrbkR1Z1JDRUV1SzMwalh4RTRESkJVcy90bTlCM0JYaXJWZmFFdlNTNWFI?=
 =?utf-8?B?SFYyanBQVWtQMUVBR3NtNC92bytJT1V6dEhjYWVQSzFZZ3FIWWNYMXVkd3VI?=
 =?utf-8?B?MS92cmlXS0srZFFsNGhDNFFBZ0JQOWczRnp5OGdaVkJQOFpPbnJIWlc2N2pY?=
 =?utf-8?B?LzNOaVFiU1lTeXhlc3ZuaW4yeEl5RENoK2JQdnFwVWMweUt4K3dPSTgvaWp4?=
 =?utf-8?B?aFo2UWo5K1NSOGtya3BIWXhKanhYQkFldldBbjRvdU5wOE4zRjJsTXhxK1dJ?=
 =?utf-8?B?RG5Nd1Jqa21NL0VFRk80MHQ5ZGV6YjJCejRsbThBQ25OVW52NkxoN0RSZVVU?=
 =?utf-8?Q?X/90V0m1HiYCvnCD/vvOglQ=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7AA0EC37025B1E41A8688E09128289A0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7504
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	15bab6b8-af7d-4c0f-852c-08de67ed5d23
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|36860700013|14060799003|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVc5T29LUXZtZjlLMEhJcnFNODdxSEJWdk9UY215Z1BVOWhMM2FvdENGb2pu?=
 =?utf-8?B?Uzd1M1o1UGZ1cU8zYTUwYTU2TEdOS1pZN0lWV3U0Tko0NkVRZGhHU2UraDl2?=
 =?utf-8?B?am1pUjZ5UzBuSmhXa1gwbUlSL0g3T2liU1RwZ3RmNXRZTlVoVjV4Q3hVOW5B?=
 =?utf-8?B?eHhld2wzdWQveUdoUDBzLytva1FxL2VsV1pTRnVTSG0rL29MSzk1SUhLNnE2?=
 =?utf-8?B?WXlqMEFCcjRrbUlSN3B1TWM3R3AzTkVNdHFoVS9ydU5IaWNRYnloSGs4UHlo?=
 =?utf-8?B?VmtOMlNnWnYxak0zV3dNd1ZnNDUvOSswOGdncGZSSG5pVWFnWnovMnZHZlJR?=
 =?utf-8?B?eGtWOTBLZUJzQ1MrNVllL0lOYkhReStWYWZtTEpaMXFLQnkwcXZxSGdFUzQv?=
 =?utf-8?B?NVBadFZpZ3JmYzRPWHJNaUhzcW95N1oyR2FSNWlhaGx2dkk1cVNKcjJEQWhy?=
 =?utf-8?B?dXB0bHhNNzc1c05jUDR3NDZrUGxMYS9ENXdTUHkzSFF2eEEwTktuR0IyYUMr?=
 =?utf-8?B?c2ZBQkJtWkZPdzFzZUtKMmpRT1dnRjQ3ckxrQkVDb0tnU0U1aWdNcHBzT3ZC?=
 =?utf-8?B?VE9ERUxHRDhpeDVVQWNWWVdRdjZORnBvbmJ6VnhTT0h3R1Y2QzU4amd2anZ5?=
 =?utf-8?B?YURqNEZHNHBSd0VoV25zNUV6dEZQclZ3WVU3cmg5d21BK1BxNmxaYXVoZWV5?=
 =?utf-8?B?Q0ZxTENCKytuQW9kR0hPWWQ4bkpKR1E4amRIV1pjS0c1MUlvQjk1ZXRMVXJB?=
 =?utf-8?B?S1JIUUtpRUNiL3JWZjU5ZDRaM28xaDhkeTFCYzRNSkk3R2czVUlIZTNoaCt3?=
 =?utf-8?B?MkRKaDVzY3JEajZyaWNOSGdYQlhpOEtwN1l4c3F2aTJ4VGFXWWtYVEZIeEJQ?=
 =?utf-8?B?RzNVMHJJQ2N2M2NBNU9tb3dkYWRGK1lnd0o5cmtyRHJPaXAzTmpyTG1pZnFz?=
 =?utf-8?B?Y0dBNHoxOGdtV0kxYW9oU1hrZ1VLKzRPV3B1czRoVFUxS1Izc2p1Ky9wK3dC?=
 =?utf-8?B?RGpTM3hVVEdmaDRkOGwwaE9JREFjb2NmN3FNcXJaY2JaVVRSdGxhbVFONDRk?=
 =?utf-8?B?R3djZjZLdzV2dVc0QmlDN0dJaFNZZmZraGlOVW9IbEp0cEVXTXNJU2ZyM3ZR?=
 =?utf-8?B?bzhwTnZXWS9ZL3hyaDVacnhzUEt2b0RmRnpIcjN3dis4dG9nMURrdlpwRDRO?=
 =?utf-8?B?clFCVmpyQk9ZU0JpeU0yOUZ1b2pQd3o4dzIxMW9nNSs2QkJXZlErZFRHbWQz?=
 =?utf-8?B?Q010UWM4RUdFOTJ5Wk5zS2dOeklvNGQzalZTNmlLOWpiTUdHRE13U0E0aStw?=
 =?utf-8?B?QnJsSTZZV2toVnN4K0hoQTBJdmtSbW54WGVxRGNWQVBaeURGOS9tUXZWTWp5?=
 =?utf-8?B?VXpINnpWViswdjJCSWYyeFJlM2UwK3JUSFpyMGl3TC9XQno0Y2wrbEF4YlZQ?=
 =?utf-8?B?a045ejdWVG5wOUVsemVkL01lL1ozNmlKRUllbXNRaUNra2d4OUo2OFNlb1ZU?=
 =?utf-8?B?dmZndFdjajl2UzdLU3NjZG1VaWhFNFVJT0hmWFJuUnVIOVgxK2gxTElxSnp4?=
 =?utf-8?B?S3hVNDBhcno0dkh2Mm1tOCtuNzkzVWp4M2g5N05scSt5VFc4YnViL0t1QWha?=
 =?utf-8?B?RTZRWUFuT2pwblZoRUxIK2JRZm9nZ1E3ZU5NS3BZZkRsOHZ2NHFYNi84MlU2?=
 =?utf-8?B?YnJYR2VEMEVWNHdZMVdWVUhsZEZzSXFjRmFNUEo5cVR0VHJZQXhzdlZNTTBS?=
 =?utf-8?B?N1JJZU1WU2UyZTZNOXZ3VTczYTlVaTJyOEovTVlNc1VjSWlsb0FHZ09teEZK?=
 =?utf-8?B?bTdxSHg2N0F1ZFduYitPM3A4SHBpc1BOSklFMG5WWHBWVUhRY21qaVFKWndE?=
 =?utf-8?B?UWlocFlHMnJNTHoxWEoxY2dYWmx3YVBIWnFKSnRoRi8yOHNVazFBMXlyQ0tZ?=
 =?utf-8?B?Um5ZNWpGbnFQQlpLeCtoWlU5T1h4SVVmYVpHaXd4ZHRNZXNmQWZtQm9lYXJw?=
 =?utf-8?B?V2lLbDhMUVZqQkFZc2ZLL2E3N0FvUVIzeWlLUWpnVjQ0TkQ1ZGN0SHBrTE5T?=
 =?utf-8?B?ZEt4QzMwemR4VFJhNUFrZlo3Ukl0WUlmamJ5R29CSTdkczlhM2JzM08wSFJQ?=
 =?utf-8?B?bVRuUTBWY2k3Q0RyU0d4Z1dRZzlUemNURFYwWmhiZjY1aW55K095cGRXZHB2?=
 =?utf-8?B?aEVsNTQvdUJ4THRwVzNCcG9ZVW4wcUMwMHdzVVY1K1c0YlpjUXpOZ01XWG1l?=
 =?utf-8?B?dmU3WDg2ejFZMndHMzJ0OFJZU1ZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(36860700013)(14060799003)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sLgaP9Lr4sGTs31WL8n+sfvD0BHcspqLaj0p7jvnzhWB/3F+YmR/4yTv0UMeaRN/THJhwRTgusjE/+XZXzkj1NP/y2dwBpF+LPK99GkSEvbexRjjRJi7hlgi4XzEvyxfhBuEbjSexSnHpZNcjqvMRODsAoSNjxKnSl3BuPioYhQGwaIQzUhC/j3NSMnZpVz6r6y4WJ9IkFD5PreOM0VtInPwwNBUoLDNzTNHYeA6sFepCa2ghR+ZXTTnhowm8Xwd3nArmPv7UjNePq4UKK2lVZkrpyM3cp/Lavz6PtkX/esjNAjPeyE6bA8MFPUjfELXDhKCOutODO4rmtRky31Uwc1Bl9MYWZ8IBaFXm/lHxtzypLc+9tHvRDlljWx/Jq6iq4h4AlWqgBoxjkuWDp4KR9mFueMruQYkTdLvv9fZyto+uubPa2w2aTVRx/NolsfE
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 15:11:32.4379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c477c172-08db-4015-2ace-08de67ed8261
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8251
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,linaro.org:email,arm.com:mid,arm.com:dkim,arm.com:email];
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
X-Rspamd-Queue-Id: E99E3111B3B
X-Rspamd-Action: no action

SGkgSmVucywNCg0KPiBPbiA5IEZlYiAyMDI2LCBhdCAxNToyNiwgQmVydHJhbmQgTWFycXVpcyA8
QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4gDQo+IEhpIEplbnMsDQo+IA0KPj4g
T24gOSBGZWIgMjAyNiwgYXQgMTA6MzEsIEplbnMgV2lrbGFuZGVyIDxqZW5zLndpa2xhbmRlckBs
aW5hcm8ub3JnPiB3cm90ZToNCj4+IA0KPj4gSGkgQmVydHJhbmQsDQo+PiANCj4+IE9uIFR1ZSwg
RmViIDMsIDIwMjYgYXQgNjozOOKAr1BNIEJlcnRyYW5kIE1hcnF1aXMNCj4+IDxiZXJ0cmFuZC5t
YXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IGdldF9zaG1fcGFnZXMoKSB1c2VzIHVu
Y2hlY2tlZCBhZGRyZXNzIGFyaXRobWV0aWMgYW5kIGRvZXMgbm90IGVuZm9yY2UNCj4+PiBhbGln
bm1lbnQsIHNvIG1hbGZvcm1lZCBkZXNjcmlwdG9ycyBjYW4gY2F1c2Ugb3ZlcmZsb3cgb3Igc2xp
cCB0aHJvdWdoDQo+Pj4gdmFsaWRhdGlvbi4gVGhlIHJlY2xhaW0gcGF0aCBhbHNvIHJlcGVhdHMg
aGFuZGxlLXRvLXNobS1tZW0gY29udmVyc2lvbg0KPj4+IGluIG11bHRpcGxlIHBsYWNlcywgZHVw
bGljYXRpbmcgZXJyb3IgaGFuZGxpbmcuDQo+Pj4gDQo+Pj4gSGFyZGVuIHBhZ2UgcGFyc2luZyBh
bmQgcmVjbGFpbSBoYW5kbGluZzoNCj4+PiAtIGFkZCBmZmFfc2FmZV9hZGRyX2FkZCgpIGFuZCB1
c2UgaXQgdG8gZGV0ZWN0IGFkZHJlc3Mgb3ZlcmZsb3dzDQo+Pj4gLSBlbmZvcmNlIGFsaWdubWVu
dCBjaGVja3MgaW4gZ2V0X3NobV9wYWdlcygpIGFuZCByZXR1cm4gRkYtQSBlcnJvcnMNCj4+PiAt
IGludHJvZHVjZSBmZmFfc2VjdXJlX3JlY2xhaW0oKSBhbmQgdXNlIGl0IGZvciBNRU1fUkVDTEFJ
TSBhbmQgdGVhcmRvd24NCj4+PiAtIHNpbXBsaWZ5IGZmYV9tZW1fc2hhcmUoKSBhcmd1bWVudCBo
YW5kbGluZyBhbmQgYWxsb3cgbWF4IHBhZ2UgY291bnQNCj4+PiANCj4+PiBGdW5jdGlvbmFsIGlt
cGFjdDogaW52YWxpZCBvciBtaXNhbGlnbmVkIG1lbW9yeSByYW5nZXMgbm93IGZhaWwgZWFybGll
cg0KPj4+IHdpdGggcHJvcGVyIGVycm9yIGNvZGVzOyBiZWhhdmlvciBmb3IgdmFsaWQgZGVzY3Jp
cHRvcnMgaXMgdW5jaGFuZ2VkLg0KPj4+IA0KPj4+IFNpZ25lZC1vZmYtYnk6IEJlcnRyYW5kIE1h
cnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+PiAtLS0NCj4+PiB4ZW4vYXJjaC9h
cm0vdGVlL2ZmYV9wcml2YXRlLmggfCAxMSArKysrKysrDQo+Pj4geGVuL2FyY2gvYXJtL3RlZS9m
ZmFfc2htLmMgICAgIHwgNTcgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQ0KPj4+
IDIgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pDQo+Pj4g
DQo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaCBiL3hlbi9h
cmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaA0KPj4+IGluZGV4IGI2MjVmMWM3MjkxNC4uNTg1NjJk
OGU3MzNjIDEwMDY0NA0KPj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaA0K
Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaA0KPj4+IEBAIC02MzIsNCAr
NjMyLDE1IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmZmFfdXVpZF9zZXQoc3RydWN0IGZmYV91dWlk
ICppZCwgdWludDMyX3QgdmFsMCwNCj4+PiAgICBpZC0+dmFsWzFdID0gKCh1aW50NjRfdCl2YWwz
IDw8IDMyVSkgfCB2YWwyOw0KPj4+IH0NCj4+PiANCj4+PiArLyoNCj4+PiArICogQ29tbW9uIG92
ZXJmbG93LXNhZmUgaGVscGVyIHRvIHZlcmlmeSB0aGF0IGFkZGluZyBhIG51bWJlciBvZiBwYWdl
cyB0byBhbg0KPj4+ICsgKiBhZGRyZXNzIHdpbGwgbm90IHdyYXAgYXJvdW5kLg0KPj4+ICsgKi8N
Cj4+PiArc3RhdGljIGlubGluZSBib29sIGZmYV9zYWZlX2FkZHJfYWRkKHVpbnQ2NF90IGFkZHIs
IHVpbnQ2NF90IHBhZ2VzKQ0KPj4+ICt7DQo+Pj4gKyAgICB1aW50NjRfdCBvZmYgPSBwYWdlcyAq
IEZGQV9QQUdFX1NJWkU7DQo+Pj4gKw0KPj4+ICsgICAgcmV0dXJuIChvZmYgLyBGRkFfUEFHRV9T
SVpFKSA9PSBwYWdlcyAmJiBhZGRyIDw9IFVJTlQ2NF9NQVggLSBvZmY7DQo+Pj4gK30NCj4+PiAr
DQo+Pj4gI2VuZGlmIC8qX19GRkFfUFJJVkFURV9IX18qLw0KPj4+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vdGVlL2ZmYV9zaG0uYyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX3NobS5jDQo+Pj4g
aW5kZXggOTA4MDBlNDRhODZhLi40YzBiNDVjZGU2ZWUgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL3RlZS9mZmFfc2htLmMNCj4+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9zaG0u
Yw0KPj4+IEBAIC05NiwxNiArOTYsMTQgQEAgc3RydWN0IGZmYV9zaG1fbWVtIHsNCj4+PiAgICBz
dHJ1Y3QgcGFnZV9pbmZvICpwYWdlc1tdOw0KPj4+IH07DQo+Pj4gDQo+Pj4gLXN0YXRpYyBpbnQz
Ml90IGZmYV9tZW1fc2hhcmUodWludDMyX3QgdG90X2xlbiwgdWludDMyX3QgZnJhZ19sZW4sDQo+
Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnaXN0ZXJfdCBhZGRyLCB1aW50MzJf
dCBwZ19jb3VudCwNCj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCAq
aGFuZGxlKQ0KPj4+ICtzdGF0aWMgaW50MzJfdCBmZmFfbWVtX3NoYXJlKHVpbnQzMl90IHRvdF9s
ZW4sIHVpbnQ2NF90ICpoYW5kbGUpDQo+Pj4gew0KPj4+ICAgIHN0cnVjdCBhcm1fc21jY2NfMV8y
X3JlZ3MgYXJnID0gew0KPj4+ICAgICAgICAuYTAgPSBGRkFfTUVNX1NIQVJFXzY0LA0KPj4+ICAg
ICAgICAuYTEgPSB0b3RfbGVuLA0KPj4+IC0gICAgICAgIC5hMiA9IGZyYWdfbGVuLA0KPj4+IC0g
ICAgICAgIC5hMyA9IGFkZHIsDQo+Pj4gLSAgICAgICAgLmE0ID0gcGdfY291bnQsDQo+Pj4gKyAg
ICAgICAgLmEyID0gdG90X2xlbiwNCj4+PiArICAgICAgICAuYTMgPSAwLA0KPj4+ICsgICAgICAg
IC5hNCA9IDAsDQo+Pj4gICAgfTsNCj4+PiAgICBzdHJ1Y3QgYXJtX3NtY2NjXzFfMl9yZWdzIHJl
c3A7DQo+Pj4gDQo+Pj4gQEAgLTEzMSwxMiArMTI5LDE2IEBAIHN0YXRpYyBpbnQzMl90IGZmYV9t
ZW1fc2hhcmUodWludDMyX3QgdG90X2xlbiwgdWludDMyX3QgZnJhZ19sZW4sDQo+Pj4gICAgfQ0K
Pj4+IH0NCj4+PiANCj4+PiAtc3RhdGljIGludDMyX3QgZmZhX21lbV9yZWNsYWltKHVpbnQzMl90
IGhhbmRsZV9sbywgdWludDMyX3QgaGFuZGxlX2hpLA0KPj4+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdWludDMyX3QgZmxhZ3MpDQo+Pj4gK3N0YXRpYyBpbnQzMl90IGZmYV9zZWN1
cmVfcmVjbGFpbShzdHJ1Y3QgZmZhX3NobV9tZW0gKnNobSwgdWludDMyX3QgZmxhZ3MpDQo+PiAN
Cj4+IEkgYWdyZWUgd2l0aCBtb3ZpbmcgdGhlIHVpbnQ2NF90b19yZWdwYWlyKCkgY2FsbCBpbnRv
IHRoaXMgZnVuY3Rpb24sDQo+PiBidXQgSSdtIHB1enpsZWQgYnkgdGhlIG5ldyBuYW1lLiBXaGF0
J3Mgc2VjdXJlPw0KPiANCj4gVGhpcyBpcyB0byBkaXN0aW5ndWlzaCB3aXRoIHJlY2xhaW0gZm9y
IFZNIHRvIFZNIHNoYXJpbmcgaW4gdGhlIGZ1dHVyZSBhcyBoZXJlDQo+IHJlY2xhaW0gaXMgYXNr
ZWQgdG8gdGhlIHNlY3VyZSB3b3JsZC4NCj4gDQo+IEJ1dCBpbiBmYWN0IHRvIGJlIGNvaGVyZW50
IEkgc2hvdWxkIGFsc28gaGF2ZSByZW5hbWVkIGZmYV9tZW1fc2hhcmUgdG8gZmZhX3NlY3VyZV9z
aGFyZS4NCj4gDQo+IFdvdWxkIHlvdSBiZSBvayB3aXRoIHRoYXQgPw0KDQpMb29raW5nIGF0IHRo
aXMgYSBiaXQgbW9yZSwgd2UgYXJlIHVzdWFsbHkgdXNpbmcgc3BtYyBhbmQgbm90IHNlY3VyZS4N
Cg0KV291bGQgeW91IGJlIG9rIGlmIEkgcmVuYW1lIGJvdGggdGhvc2UgdG86DQpmZmFfc3BtY19z
aGFyZQ0KZmZhX3NwbWNfcmVjbGFpbQ0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+PiANCj4+
PiB7DQo+Pj4gKyAgICByZWdpc3Rlcl90IGhhbmRsZV9oaTsNCj4+PiArICAgIHJlZ2lzdGVyX3Qg
aGFuZGxlX2xvOw0KPj4+ICsNCj4+PiAgICBpZiAoICFmZmFfZndfc3VwcG9ydHNfZmlkKEZGQV9N
RU1fUkVDTEFJTSkgKQ0KPj4+ICAgICAgICByZXR1cm4gRkZBX1JFVF9OT1RfU1VQUE9SVEVEOw0K
Pj4+IA0KPj4+ICsgICAgdWludDY0X3RvX3JlZ3BhaXIoJmhhbmRsZV9oaSwgJmhhbmRsZV9sbywg
c2htLT5oYW5kbGUpOw0KPj4+ICsNCj4+PiAgICByZXR1cm4gZmZhX3NpbXBsZV9jYWxsKEZGQV9N
RU1fUkVDTEFJTSwgaGFuZGxlX2xvLCBoYW5kbGVfaGksIGZsYWdzLCAwKTsNCj4+PiB9DQo+Pj4g
DQo+Pj4gQEAgLTE0NSw3ICsxNDcsNyBAQCBzdGF0aWMgaW50MzJfdCBmZmFfbWVtX3JlY2xhaW0o
dWludDMyX3QgaGFuZGxlX2xvLCB1aW50MzJfdCBoYW5kbGVfaGksDQo+Pj4gKiB0aGlzIGZ1bmN0
aW9uIGZhaWxzIHRoZW4gdGhlIGNhbGxlciBpcyBzdGlsbCBleHBlY3RlZCB0byBjYWxsDQo+Pj4g
KiBwdXRfc2htX3BhZ2VzKCkgYXMgYSBjbGVhbnVwLg0KPj4+ICovDQo+Pj4gLXN0YXRpYyBpbnQg
Z2V0X3NobV9wYWdlcyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZmZhX3NobV9tZW0gKnNobSwN
Cj4+PiArc3RhdGljIGludDMyX3QgZ2V0X3NobV9wYWdlcyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1
Y3QgZmZhX3NobV9tZW0gKnNobSwNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBz
dHJ1Y3QgZmZhX2FkZHJlc3NfcmFuZ2UgKnJhbmdlLA0KPj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHVpbnQzMl90IHJhbmdlX2NvdW50KQ0KPj4+IHsNCj4+PiBAQCAtMTU2LDE3ICsxNTgsMjYg
QEAgc3RhdGljIGludCBnZXRfc2htX3BhZ2VzKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBmZmFf
c2htX21lbSAqc2htLA0KPj4+ICAgIHAybV90eXBlX3QgdDsNCj4+PiAgICB1aW50NjRfdCBhZGRy
Ow0KPj4+ICAgIHVpbnQ2NF90IHBhZ2VfY291bnQ7DQo+Pj4gKyAgICB1aW50NjRfdCBnYWRkcjsN
Cj4+PiANCj4+PiAgICBmb3IgKCBuID0gMDsgbiA8IHJhbmdlX2NvdW50OyBuKysgKQ0KPj4+ICAg
IHsNCj4+PiAgICAgICAgcGFnZV9jb3VudCA9IEFDQ0VTU19PTkNFKHJhbmdlW25dLnBhZ2VfY291
bnQpOw0KPj4+ICAgICAgICBhZGRyID0gQUNDRVNTX09OQ0UocmFuZ2Vbbl0uYWRkcmVzcyk7DQo+
Pj4gKw0KPj4+ICsgICAgICAgIGlmICggIUlTX0FMSUdORUQoYWRkciwgRkZBX1BBR0VfU0laRSkg
KQ0KPj4+ICsgICAgICAgICAgICByZXR1cm4gRkZBX1JFVF9JTlZBTElEX1BBUkFNRVRFUlM7DQo+
Pj4gKw0KPj4+ICAgICAgICBmb3IgKCBtID0gMDsgbSA8IHBhZ2VfY291bnQ7IG0rKyApDQo+Pj4g
ICAgICAgIHsNCj4+PiAgICAgICAgICAgIGlmICggcGdfaWR4ID49IHNobS0+cGFnZV9jb3VudCAp
DQo+Pj4gICAgICAgICAgICAgICAgcmV0dXJuIEZGQV9SRVRfSU5WQUxJRF9QQVJBTUVURVJTOw0K
Pj4+IA0KPj4+IC0gICAgICAgICAgICBnZm4gPSBnYWRkcl90b19nZm4oYWRkciArIG0gKiBGRkFf
UEFHRV9TSVpFKTsNCj4+PiArICAgICAgICAgICAgaWYgKCAhZmZhX3NhZmVfYWRkcl9hZGQoYWRk
ciwgbSkgKQ0KPj4+ICsgICAgICAgICAgICAgICAgcmV0dXJuIEZGQV9SRVRfSU5WQUxJRF9QQVJB
TUVURVJTOw0KPj4+ICsNCj4+PiArICAgICAgICAgICAgZ2FkZHIgPSBhZGRyICsgbSAqIEZGQV9Q
QUdFX1NJWkU7DQo+Pj4gKyAgICAgICAgICAgIGdmbiA9IGdhZGRyX3RvX2dmbihnYWRkcik7DQo+
Pj4gICAgICAgICAgICBzaG0tPnBhZ2VzW3BnX2lkeF0gPSBnZXRfcGFnZV9mcm9tX2dmbihkLCBn
Zm5feChnZm4pLCAmdCwNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgUDJNX0FMTE9DKTsNCj4+PiAgICAgICAgICAgIGlmICggIXNobS0+cGFnZXNb
cGdfaWR4XSApDQo+Pj4gQEAgLTE4MCw3ICsxOTEsNyBAQCBzdGF0aWMgaW50IGdldF9zaG1fcGFn
ZXMoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGZmYV9zaG1fbWVtICpzaG0sDQo+Pj4gDQo+Pj4g
ICAgLyogVGhlIHJhbmdlcyBtdXN0IGFkZCB1cCAqLw0KPj4+ICAgIGlmICggcGdfaWR4IDwgc2ht
LT5wYWdlX2NvdW50ICkNCj4+PiAtICAgICAgICAgICAgcmV0dXJuIEZGQV9SRVRfSU5WQUxJRF9Q
QVJBTUVURVJTOw0KPj4+ICsgICAgICAgIHJldHVybiBGRkFfUkVUX0lOVkFMSURfUEFSQU1FVEVS
UzsNCj4+PiANCj4+PiAgICByZXR1cm4gRkZBX1JFVF9PSzsNCj4+PiB9DQo+Pj4gQEAgLTE5OCwx
NSArMjA5LDExIEBAIHN0YXRpYyB2b2lkIHB1dF9zaG1fcGFnZXMoc3RydWN0IGZmYV9zaG1fbWVt
ICpzaG0pDQo+Pj4gDQo+Pj4gc3RhdGljIGJvb2wgaW5jX2N0eF9zaG1fY291bnQoc3RydWN0IGRv
bWFpbiAqZCwgc3RydWN0IGZmYV9jdHggKmN0eCkNCj4+PiB7DQo+Pj4gLSAgICBib29sIHJldCA9
IHRydWU7DQo+Pj4gKyAgICBib29sIHJldCA9IGZhbHNlOw0KPj4+IA0KPj4+ICAgIHNwaW5fbG9j
aygmY3R4LT5sb2NrKTsNCj4+PiANCj4+PiAtICAgIGlmICggY3R4LT5zaG1fY291bnQgPj0gRkZB
X01BWF9TSE1fQ09VTlQgKQ0KPj4+IC0gICAgew0KPj4+IC0gICAgICAgIHJldCA9IGZhbHNlOw0K
Pj4+IC0gICAgfQ0KPj4+IC0gICAgZWxzZQ0KPj4+ICsgICAgaWYgKCBjdHgtPnNobV9jb3VudCA8
IEZGQV9NQVhfU0hNX0NPVU5UICkNCj4+PiAgICB7DQo+Pj4gICAgICAgIC8qDQo+Pj4gICAgICAg
ICAqIElmIHRoaXMgaXMgdGhlIGZpcnN0IHNobSBhZGRlZCwgaW5jcmVhc2UgdGhlIGRvbWFpbiBy
ZWZlcmVuY2UNCj4+PiBAQCAtMjE3LDYgKzIyNCw3IEBAIHN0YXRpYyBib29sIGluY19jdHhfc2ht
X2NvdW50KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBmZmFfY3R4ICpjdHgpDQo+Pj4gICAgICAg
ICAgICBnZXRfa25vd25hbGl2ZV9kb21haW4oZCk7DQo+Pj4gDQo+Pj4gICAgICAgIGN0eC0+c2ht
X2NvdW50Kys7DQo+Pj4gKyAgICAgICAgcmV0ID0gdHJ1ZTsNCj4+PiAgICB9DQo+Pj4gDQo+Pj4g
ICAgc3Bpbl91bmxvY2soJmN0eC0+bG9jayk7DQo+Pj4gQEAgLTI1MSw3ICsyNTksNyBAQCBzdGF0
aWMgc3RydWN0IGZmYV9zaG1fbWVtICphbGxvY19mZmFfc2htX21lbShzdHJ1Y3QgZG9tYWluICpk
LA0KPj4+ICAgIHN0cnVjdCBmZmFfY3R4ICpjdHggPSBkLT5hcmNoLnRlZTsNCj4+PiAgICBzdHJ1
Y3QgZmZhX3NobV9tZW0gKnNobTsNCj4+PiANCj4+PiAtICAgIGlmICggcGFnZV9jb3VudCA+PSBG
RkFfTUFYX1NITV9QQUdFX0NPVU5UICkNCj4+PiArICAgIGlmICggcGFnZV9jb3VudCA+IEZGQV9N
QVhfU0hNX1BBR0VfQ09VTlQgKQ0KPj4+ICAgICAgICByZXR1cm4gTlVMTDsNCj4+PiAgICBpZiAo
ICFpbmNfY3R4X3NobV9jb3VudChkLCBjdHgpICkNCj4+PiAgICAgICAgcmV0dXJuIE5VTEw7DQo+
Pj4gQEAgLTM2Nyw3ICszNzUsNyBAQCBzdGF0aWMgaW50IHNoYXJlX3NobShzdHJ1Y3QgZmZhX3No
bV9tZW0gKnNobSkNCj4+PiAgICAgICAgaW5pdF9yYW5nZShhZGRyX3JhbmdlLCBwYSk7DQo+Pj4g
ICAgfQ0KPj4+IA0KPj4+IC0gICAgcmV0ID0gZmZhX21lbV9zaGFyZSh0b3RfbGVuLCBmcmFnX2xl
biwgMCwgMCwgJnNobS0+aGFuZGxlKTsNCj4+IA0KPj4gUGxlYXNlIHJlbW92ZSBmcmFnX2xlbiBm
cm9tIHNoYXJlX3NobSgpIHNpbmNlIGl0J3Mgbm90IG5lZWRlZCBhbnkgbG9uZ2VyLg0KPiANCj4g
QWNrLCBJIHdpbGwgcmVtb3ZlIGl0IGluIHYyLg0KPiANCj4gQ2hlZXJzDQo+IEJlcnRyYW5kDQo+
IA0KPj4gDQo+PiBDaGVlcnMsDQo+PiBKZW5zDQo+PiANCj4+PiArICAgIHJldCA9IGZmYV9tZW1f
c2hhcmUodG90X2xlbiwgJnNobS0+aGFuZGxlKTsNCj4+PiANCj4+PiBvdXQ6DQo+Pj4gICAgZmZh
X3J4dHhfc3BtY190eF9yZWxlYXNlKCk7DQo+Pj4gQEAgLTYzNyw4ICs2NDUsNiBAQCBpbnQzMl90
IGZmYV9oYW5kbGVfbWVtX3JlY2xhaW0odWludDY0X3QgaGFuZGxlLCB1aW50MzJfdCBmbGFncykN
Cj4+PiAgICBzdHJ1Y3QgZG9tYWluICpkID0gY3VycmVudC0+ZG9tYWluOw0KPj4+ICAgIHN0cnVj
dCBmZmFfY3R4ICpjdHggPSBkLT5hcmNoLnRlZTsNCj4+PiAgICBzdHJ1Y3QgZmZhX3NobV9tZW0g
KnNobTsNCj4+PiAtICAgIHJlZ2lzdGVyX3QgaGFuZGxlX2hpOw0KPj4+IC0gICAgcmVnaXN0ZXJf
dCBoYW5kbGVfbG87DQo+Pj4gICAgaW50MzJfdCByZXQ7DQo+Pj4gDQo+Pj4gICAgaWYgKCAhZmZh
X2Z3X3N1cHBvcnRzX2ZpZChGRkFfTUVNX1JFQ0xBSU0pICkNCj4+PiBAQCAtNjUyLDggKzY1OCw3
IEBAIGludDMyX3QgZmZhX2hhbmRsZV9tZW1fcmVjbGFpbSh1aW50NjRfdCBoYW5kbGUsIHVpbnQz
Ml90IGZsYWdzKQ0KPj4+ICAgIGlmICggIXNobSApDQo+Pj4gICAgICAgIHJldHVybiBGRkFfUkVU
X0lOVkFMSURfUEFSQU1FVEVSUzsNCj4+PiANCj4+PiAtICAgIHVpbnQ2NF90b19yZWdwYWlyKCZo
YW5kbGVfaGksICZoYW5kbGVfbG8sIGhhbmRsZSk7DQo+Pj4gLSAgICByZXQgPSBmZmFfbWVtX3Jl
Y2xhaW0oaGFuZGxlX2xvLCBoYW5kbGVfaGksIGZsYWdzKTsNCj4+PiArICAgIHJldCA9IGZmYV9z
ZWN1cmVfcmVjbGFpbShzaG0sIGZsYWdzKTsNCj4+PiANCj4+PiAgICBpZiAoIHJldCApDQo+Pj4g
ICAgew0KPj4+IEBAIC02NzcsMTEgKzY4Miw3IEBAIGJvb2wgZmZhX3NobV9kb21haW5fZGVzdHJv
eShzdHJ1Y3QgZG9tYWluICpkKQ0KPj4+IA0KPj4+ICAgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2Fm
ZShzaG0sIHRtcCwgJmN0eC0+c2htX2xpc3QsIGxpc3QpDQo+Pj4gICAgew0KPj4+IC0gICAgICAg
IHJlZ2lzdGVyX3QgaGFuZGxlX2hpOw0KPj4+IC0gICAgICAgIHJlZ2lzdGVyX3QgaGFuZGxlX2xv
Ow0KPj4+IC0NCj4+PiAtICAgICAgICB1aW50NjRfdG9fcmVncGFpcigmaGFuZGxlX2hpLCAmaGFu
ZGxlX2xvLCBzaG0tPmhhbmRsZSk7DQo+Pj4gLSAgICAgICAgcmVzID0gZmZhX21lbV9yZWNsYWlt
KGhhbmRsZV9sbywgaGFuZGxlX2hpLCAwKTsNCj4+PiArICAgICAgICByZXMgPSBmZmFfc2VjdXJl
X3JlY2xhaW0oc2htLCAwKTsNCj4+PiAgICAgICAgc3dpdGNoICggcmVzICkgew0KPj4+ICAgICAg
ICBjYXNlIEZGQV9SRVRfT0s6DQo+Pj4gICAgICAgICAgICBwcmludGsoWEVOTE9HX0dfREVCVUcg
IiVwZDogZmZhOiBSZWNsYWltZWQgaGFuZGxlICUjbHhcbiIsDQo+Pj4gLS0NCj4+PiAyLjUwLjEg
KEFwcGxlIEdpdC0xNTUpDQoNCg0K

