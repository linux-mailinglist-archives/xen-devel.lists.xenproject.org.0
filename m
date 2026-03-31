Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHAdGgXWy2mILwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 16:11:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39AE36ABB4
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 16:11:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268979.1558152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Znz-0005T5-UV; Tue, 31 Mar 2026 14:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268979.1558152; Tue, 31 Mar 2026 14:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Znz-0005Qj-Rt; Tue, 31 Mar 2026 14:10:55 +0000
Received: by outflank-mailman (input) for mailman id 1268979;
 Tue, 31 Mar 2026 14:10:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>) id 1w7Znx-0005Qd-Ih
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 14:10:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7Znw-00CLwN-RB
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 16:10:52 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>)
 id 69cbd5e9-bab6-0a2a0a5309dd-0a2a450b94b8-6
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 16:10:52 +0200
Received: from [52.101.66.86]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>)
 id 69cbd5eb-ef63-0a2a450b0019-346542563a7b-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 16:10:51 +0200
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 (2603:10a6:20b:6cc::22) by VI0PR03MB11578.eurprd03.prod.outlook.com
 (2603:10a6:800:30e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 14:10:48 +0000
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::bbbf:5b9b:1043:4510]) by AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::bbbf:5b9b:1043:4510%5]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 14:10:48 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6Hfu7SnhrF6JWdpewHGxVSnQ0vIHSxOxQJjIAhmDt78aL/vK/Oxy0axWzrpxam8AT1n9wDaXbOZFrSU/dqh7b5Nk+9rwy3zyleMxcuyNFZXLaotHSW8QyiOxoorOECoHMelaw80nI5+kYQnFvwJJF6evRgoE0pC2jbvBxJvNusKSKwpECxC4m3mo8MnkqGpiJr5YPugWJq/ZtkwEVevEOeZL/V8P1H3EoWEg2MftPE5jX2HPDImLLf7aoTICvcs7fi0Z9Qj5XHhaEkQL2Q+qzOcwd4AqSLqqa1jFYI17DS4pHk/1Ey+35VAC/KsDe2C7R//9sn0wJM5iM7Fxuh5zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOWCIWGQT2sgpAu08DLbsyMlb4Z/92ic4fk1qUDuUf4=;
 b=oK3KFgThkveN52qZaG9WwaRCVfiNatg+nLB2+utiFqFLvdMh/vYJ3SoU9wtKlLPmlK30Q3Migs+ADHfvWj4/g4txXD1fGyR9qhwFTBqpPloNXxPHloOVIGzI4irdU9SMmnah7VhQ+wjKnCmB6KIxkKjPngQty8X0vimu0RPDF9N0cR7ZML3jD/vG7wFdI03uZJSDDhE5CIWDVm/u1g2/OKGXho71c0bp+ZbBmMwlOn4ixC9UqvYdcCy0iQ25TOlayrRhfLTAbkKRLVHQUArTHB3mX9g2pL5dSuHGreMoVcrgMBi3H8B9RTST+0IfV+J2bs6Tr1MV3Uz3TbNaWeQ4+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOWCIWGQT2sgpAu08DLbsyMlb4Z/92ic4fk1qUDuUf4=;
 b=CE/zCOsgRowzEeiQ7PYO4Nlev2MY0vDj3sg1Halxh0UPZISrfdMUh7dmVlaQJjO/nNrOwOh0kCSAIMjHUUKvr09hDWzUyoP8LWhrRnAYTHTWi1cOTq4JFfhu4hojmOg03/t/+GqjCxSNCm0uzinANtGASr5h2LbtKU+/fpwtBedo7d9w8Yw+5QqJuhdY0Y5aXSHtSyinq5LWIMJlPD9/RDprsuGy7C6JcAQD8K5r1Ouuqj3zvcOo4XUAQ85bc8K+yQEXNXqeBbSYVZNxjZdC3gNenb/onPaeJVsnEdkeWcPB5g59OXQm81S5AmR7cQszDuKA1aqy2U7/GeJnRiEbxQ==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Increase DOM0_FDT_EXTRA_SIZE to support max
 reserved memory banks
Thread-Topic: [PATCH] xen/arm: Increase DOM0_FDT_EXTRA_SIZE to support max
 reserved memory banks
Thread-Index:
 AQHcvSKiuRz6O/EU8kCzrBnRPjf187XBBxoAgAAlNICAANCdgIAAUd4AgAYDCgCAAGQ5AA==
Date: Tue, 31 Mar 2026 14:10:47 +0000
Message-ID: <4d18fa65-fb01-40ac-9354-023f243f7f41@epam.com>
References: <20260326131535.662466-1-oleksandr_tyshchenko@epam.com>
 <29769bd9-8410-417b-9ad8-84131956db57@amd.com>
 <7d52cf29-c0bb-4e39-ae10-2b43f3e8e921@epam.com>
 <618e3227-10c7-46e4-9328-3d7d981fddfa@amd.com>
 <89782bb0-d910-49b8-9a7d-83c3cf38d442@epam.com>
 <c8e8fbd1-33f8-469f-96c4-22d384196cdb@amd.com>
In-Reply-To: <c8e8fbd1-33f8-469f-96c4-22d384196cdb@amd.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4PR03MB11152:EE_|VI0PR03MB11578:EE_
x-ms-office365-filtering-correlation-id: cc0866e8-3db1-4a8e-6189-08de8f2f4eab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 n2O/t4kTTh7GKdICcEiuzcZghzegESJmHyrbcMGSxmCRdbfIZiDw3GOR8U13eyI21N2Kt3xVNwbs1oZ3YYv4sj1Zwn0Km53oFpwomt3aKaarE+xgdQzVfSvl7aNBuvnzgFPqzu0vED1bz6TUQrnqvPJ3n98tXgEwUx9RjB+xJmMqWTsSRmbHy4iW4fQ7HvyQbH0yBsDHYWBaNgW/mHJ4438CIJFk5M810CMivGqqZViTt1HQv8PZ6Tbzcf4JDRg4cEY7N1wcs+YmvhlGcI3buHEBV+W7vUEhmlRImIpedHa4Q9HjDtq81fWU2yBjbrQJxlbhqWBVGkoMQxT1TfSeAFDIM2JRq2QiciKT8uYLO1pNFNCxJp8c/ScKmj0ZwPw1Hky7xfpWANG1locijOHas4Q3cTAi4/MR6OafmtD9aFvS/2BVDwFyDZNG3elGN6nEeAb0toNWkYRoyf/OOV8mF2gxdYOu7W2Yev4Cgj18IxJYyi6kRT/I3dX7NuCoq+QnsgyUZOXX1RYkeIrqkyInd4IuUE0xJPh7UuR5uh5TYFStkzvqhT2efasVkotb1GRiYy2oHTz8IUUDD5OUrSSihavHBL3tLiGp6aLlTmTo0BS2zaPSvw08kk0pQyM0K6PVP1sX24Nnmzi4XGs1gqBwtg6P/ht0Xdk6cBy/8q4duuNEQtkSyYZaUi4CUYyGO5YAnq8HICdcGGKmQo0WHHzNIOqRHZMAxyLJlkH3uI6PeGLemuh7nKx+Ep843usgPpDe9iv4ZdoOHK7tE0EKIY8tFhm+goQ8tUoprOucKpwG1q0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR03MB11152.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TWpFUE9MUTdoZDJwVmh2Z0pLYm5BSUVnalJ6NlBLQi9Nai9pYnRKanY4ZzdC?=
 =?utf-8?B?T2JFTEp1WDByRk5Ga3dRb2dXNmw1MEZDQnNYQ0pCM3F1Nll2S0N2anROZ2dl?=
 =?utf-8?B?RjRVQmZlK0hRdkllV1NkSWlyVUF0UEN2bE1CQzBLdzdvL3NnSk5iWkFqS2Ja?=
 =?utf-8?B?Y1Q2eUUvZTY2YVJkZTBubVlFMmV5L1lva2o0ZkNEajA4YXFKVGNFM0FLVU54?=
 =?utf-8?B?MERQZ01ONVVFY1pOVkR6aTFWZGJUd3drMWV3Rjg4cFpCREtycENlbVppUHVE?=
 =?utf-8?B?L05mRmhjRWNQSWhXb0NQRzE5RlJ4VytscGNScWdnamFmeFZwUHFzd1lLY1NE?=
 =?utf-8?B?WldIVmR0NThKODNOanR3WVJLaUdzK3hqTDRtZUdsSndIRFhOdmZZek9vUlB4?=
 =?utf-8?B?cVhaY3ZvRnVSUUdxZlZpVmtrN3VtUzRlWVFBbVFCZlYzVTAwSk5TbnBkQlpX?=
 =?utf-8?B?L1QzWkp5Q09Bdk1ZUHh1SDZqNXJiUitBZlhQVHBnREhRU2MvcEpzYWZXNmhh?=
 =?utf-8?B?ZGd5S0JtM01rUnJMaDh0a2sxbWMrRnZ0R3ZHQjliZ1o3WC9RamM1ais0ZVV2?=
 =?utf-8?B?TWFobFkxL2lIT3U3d0NtV2duT0ZZcVJDU0REajVNblhkUnpQallCbTRyTE9R?=
 =?utf-8?B?SjVQVVMzeG1pNnAzMHlCN1pMaHROVTdrU2RmbjN2TzFOUmQzMkZGdVB3VkVm?=
 =?utf-8?B?ZFAwdHNWUEhBLy9taWV0cEg5aDZOUnM4NGZpWTBZSzE1ck9LdEVRWFdaRnpV?=
 =?utf-8?B?Ymx1ZTlieGRlVm9Tc2FtRCs1ZUltMTkwWHcrVlpRVEtPSDNyNkRzdHV4UEFZ?=
 =?utf-8?B?SUgyVkVnN3VXMXA5RitrNXpacTlkeHBVNVE4MzlkWE5EQXN3SjNDTzZvQWV4?=
 =?utf-8?B?T0lkLzA5TmdadG5FTjlXcUg4ZGdhMCtGeEpiTzM4MisxL1JHR2c3VXhRT1JZ?=
 =?utf-8?B?YVJTclpwUldUOEVaWEQ3TnhBaEhYV1ZvTXJubEpSRlp5cXhnQ2lHUE9kWTF1?=
 =?utf-8?B?WTI5b0FaMytvTWEvdUpzMW1TdEh0WnhVNi9tczkxUDJmMmxDcFNtdW1Ya09v?=
 =?utf-8?B?NFZvTnUvcnF1ZmdLcjVGcDZmVnZZVHNKUzE3YnduSGpZYzBNcDk4Um9IdkhZ?=
 =?utf-8?B?bUN4RzRaV0tsUmZ5ZXQ1TDNPZnVHMnZtWWtCSDl6d29QTWdDUFB3eHdTUGFS?=
 =?utf-8?B?Zm9YNkJ4cktOb0NWanV2cklXZHgrVXd4bGo5bjBSWDc0T05oc2tyMm0zaFNz?=
 =?utf-8?B?SEhVc2t5TkowaXNyTnFaaVhaZjBiSnNZVHNJR3h3UGc0OFlKc2paOHNRczhY?=
 =?utf-8?B?RzhacEJlUWIraW5LbE0xTVVaSXExUHdlWE5kOWZ1OGQzc2Jwa1dSVXFlTU5k?=
 =?utf-8?B?WitaM3lkejArUDV3S3hlRXYvOWM0VGlrdG1KVlU1OFZaM0ppQlNieHVrN0gv?=
 =?utf-8?B?SzdOUnpYNGRpRERRUWlxQmdBRFF0WEdvWFdiZWtWZG85SjY2VkxUa0EyT0NK?=
 =?utf-8?B?OEY1Y1ZQRFhUaHV1cWVOenBwcVJUQjhDYnlaODY2TG1yNmNNb0Z3cWRWeWF1?=
 =?utf-8?B?TEFmcVJ3VFcreVE0WG1VNzZWUDRRU1NYWUNMZFJTOW5udFNsOHdRTFZDd2Qy?=
 =?utf-8?B?YU9wNE9YdmVib3JWakw5YUNHVlZxeWJONUJNelNid21RVWJSUzUyY2tYeDRR?=
 =?utf-8?B?dTZ2ZzFYbndtSTVnWVo0K3BXbHlHTHFueEgrL0hjMjZVRUpnS3hOc2l4S3g3?=
 =?utf-8?B?OWdZMnhMWTV1ZlNRT3dERTd5L2VqN0pUWnFGV3dleWsybWZwSDVMYXdVYUIw?=
 =?utf-8?B?VHpncm9DNkhDaHFlQlRTWUsrR0V4RWNQdjJLZHV1WlNDVW1wQ3d1U2dIS2sv?=
 =?utf-8?B?M0plYW9UTjYwY2puMFBRTmJYRjE5OXB0TzMwM241OU1FNzBlNGVhYTZwbmMz?=
 =?utf-8?B?QWorbWtubnR1SUNKeFFxY3lKRXdMdmFLUlFxVlZqVkNLcEJES3VRbG42aVpk?=
 =?utf-8?B?b2RZSlBiaDhiem1WU1h0NzZWMVBqNXBiZjVaREg5SlRrNkRCc01xTUo1eDh6?=
 =?utf-8?B?TTExMHVtMGVrcEIyTy9Md2svMkFhRUkyMzd2cU9rNGVwRk1ha2ZXZTlDOUNZ?=
 =?utf-8?B?UElzdnFIQ0JHalAzNDEvdmE2ODJsb284RDVzU2tISVN5ZWpkSGR0RGFCdWRL?=
 =?utf-8?B?TnMzdmRTYzJJL3NKZ0V6NStVK3FwVThWeUhVQXdzNUQ5U0FoUWZ4cHJsRFRr?=
 =?utf-8?B?RStLbTVFdG05MWszcGFXeTRQbGx0aE1WMDN1N2xlWlBKWlkwVnRzTk10WVIx?=
 =?utf-8?B?V2JTTlBCYnQ3QTFzcXgzc3M2Rko5R0IxbklFcVJic09vaTZyUy9UUEx4SnZM?=
 =?utf-8?Q?FFCjE/TuvszjKWqG3HnxQx4M+molJMAajqOeZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D96CF595670A454A96C789816F18BE73@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR03MB11152.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc0866e8-3db1-4a8e-6189-08de8f2f4eab
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 14:10:47.8802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hLWEYBTZi/Q1tGF7+eUu7xD33yXWHXEL2klLcOM/O6mFYP7SgKf50BW91fmJyBehAfsgwTlSPNZSwAbpmw4CGsWomIpEzoWwpWZ3BLJC7co=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB11578
X-purgate-ID: tlsNG-42698a/1774966251-BBAA4112-9D79738B/0/0
X-purgate-type: clean
X-purgate-size: 8832
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Oleksandr_Tyshchenko@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Oleksandr_Tyshchenko@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B39AE36ABB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCk9uIDMvMzEvMjYgMTE6MTIsIE9yemVsLCBNaWNoYWwgd3JvdGU6DQoNCkhlbGxvIE1pY2hh
bA0KDQoNCj4gDQo+IA0KPiBPbiAyNy8wMy8yMDI2IDEzOjIzLCBPbGVrc2FuZHIgVHlzaGNoZW5r
byB3cm90ZToNCj4+DQo+Pg0KPj4gT24gMy8yNy8yNiAwOTozMCwgT3J6ZWwsIE1pY2hhbCB3cm90
ZToNCj4+DQo+PiBIZWxsbyBNaWNoYWwNCj4+DQo+Pj4NCj4+Pg0KPj4+IE9uIDI2LzAzLzIwMjYg
MjA6MDMsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOg0KPj4+Pg0KPj4+Pg0KPj4+PiBPbiAz
LzI2LzI2IDE4OjUwLCBPcnplbCwgTWljaGFsIHdyb3RlOg0KPj4+Pg0KPj4+PiBIZWxsbyBNaWNo
YWwNCj4+Pj4NCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gT24gMjYvMDMvMjAyNiAxNDoxNSwgT2xla3Nh
bmRyIFR5c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4gWGVuIGZhaWxzIHRvIGNvbnN0cnVjdCB0aGUg
aGFyZHdhcmUgZG9tYWluJ3MgZGV2aWNlIHRyZWUgd2l0aA0KPj4+Pj4+IEZEVF9FUlJfTk9TUEFD
RSAoLTMpIHdoZW4gdGhlIGhvc3QgbWVtb3J5IG1hcCBpcyBoaWdobHkgZnJhZ21lbnRlZA0KPj4+
Pj4+IChlLmcuLCBudW1lcm91cyByZXNlcnZlZCBtZW1vcnkgcmVnaW9ucykuDQo+Pj4+Pj4NCj4+
Pj4+PiBUaGlzIG9jY3VycyBiZWNhdXNlIERPTTBfRkRUX0VYVFJBX1NJWkUgdW5kZXJlc3RpbWF0
ZXMgdGhlIHNwYWNlDQo+Pj4+Pj4gcmVxdWlyZWQgZm9yIHRoZSBnZW5lcmF0ZWQgZXh0cmEgL21l
bW9yeSBub2RlLiBtYWtlX21lbW9yeV9ub2RlKCkNCj4+Pj4+IFdoZXJlIGRvZXMgdGhpcyBleHRy
YSAvbWVtb3J5IG5vZGUgY29tZSBmcm9tPyBJZiB0aGlzIGlzIGZvciBub3JtYWwgcmVzZXJ2ZWQN
Cj4+Pj4+IG1lbW9yeSByZWdpb25zLCB0aGV5IHNob3VsZCBiZSBwcmVzZW50IGluIHRoZSBob3N0
IGR0YiBhbmQgdGhlcmVmb3JlIGFjY291bnRlZA0KPj4+Pj4gYnkgZmR0X3RvdGFsc2l6ZSAodGhl
IGhvc3QgZHRiIHNob3VsZCBoYXZlIHJlc2VydmVkIHJlZ2lvbnMgZGVzY3JpYmVkIGluIC9tZW1v
cnkNCj4+Pj4+IGFuZCAvcmVzZXJ2ZWQtbWVtb3J5LiBBcmUgeW91IHRyeWluZyB0byBhY2NvdW50
IGZvciBzdGF0aWMgc2htIHJlZ2lvbnM/DQo+Pj4+DQo+Pj4+DQo+Pj4+IEkgbWlnaHQgaGF2ZSBt
aXN1bmRlcnN0b29kIHNvbWV0aGluZywgYnV0IGhlcmUgaXMgbXkgYW5hbHlzaXM6DQo+Pj4+DQo+
Pj4+IFRoZSBleHRyYSAvbWVtb3J5IG5vZGUgaXMgZ2VuZXJhdGVkIGJ5IFhlbiBpdHNlbGYgaW4g
aGFuZGxlX25vZGUoKSAtPg0KPj4+PiBtYWtlX21lbW9yeV9ub2RlKCkgKHBsZWFzZSByZWZlciB0
byB0aGUgaWYgKCByZXNlcnZlZF9tZW0tPm5yX2JhbmtzID4gMA0KPj4+PiApIGNoZWNrKS4NCj4+
Pj4NCj4+Pj4gRXZlbiB0aG91Z2ggdGhlIG5vcm1hbCByZXNlcnZlZCBtZW1vcnkgcmVnaW9ucyBh
cmUgcHJlc2VudCBpbiB0aGUgaG9zdA0KPj4+PiBEVEIgKGFuZCB0aHVzIGFjY291bnRlZCBmb3Ig
aW4gZmR0X3RvdGFsc2l6ZSksIFhlbiBnZW5lcmF0ZXMgYSBuZXcNCj4+Pj4gL21lbW9yeSBub2Rl
IHNwZWNpZmljYWxseSBmb3IgdGhlIGhhcmR3YXJlIGRvbWFpbiB0byBkZXNjcmliZSB0aGVzZQ0K
Pj4+PiByZWdpb25zIGFzIHJlc2VydmVkIGJ1dCBwcmVzZW50IGluIHRoZSBtZW1vcnkgbWFwLiBB
bmQgc2luY2UgdGhpcyBub2RlDQo+Pj4+IGlzIGdlbmVyYXRlZCBhdCBydW50aW1lIChpdCBpcyBu
b3QgYSBkaXJlY3QgY29weSBmcm9tIHRoZSBob3N0IERUQiksDQo+Pj4+IGl0cyBzaXplIG11c3Qg
YmUgY292ZXJlZCBieSBET00wX0ZEVF9FWFRSQV9TSVpFLg0KPj4+IFllcywgYnV0IHRoZSBvcmln
aW5hbCBEVEIgc2hvdWxkIGFsc28gaGF2ZSB0aGVzZSByZXNlcnZlZCByZWdpb25zIGRlc2NyaWJl
ZCBpbg0KPj4+IC9tZW1vcnkgbm9kZXMsIHRodXMgdGFraW5nIHVwIHNvbWUgc3BhY2UgdGhhdCBp
cyBhbHJlYWR5IGFjY291bnRlZCBpbg0KPj4+IGZkdF90b3RhbHNpemUuIEFyZSB5b3UgdHJ5aW5n
IHRvIHNheSB0aGF0IGluIGhvc3QgRFRCLCB0aGVzZSByZXNlcnZlZCByYW5nZXMgZml0DQo+Pj4g
bmljZWx5IGludG8gZS5nLiBhIHNpbmdsZSAvbWVtb3J5IG5vZGUgcmFuZ2UgKGkuZS4gYSBzaW5n
bGUgcmVnIHBhaXIgY292ZXJpbmcNCj4+PiBtb3N0IG9mIHRoZSBSQU0pPw0KPj4NCj4+IHllcw0K
Pj4NCj4+DQo+PiAgICBJIGNhbiBzZWUgdGhhdCBpdCBtaWdodCBiZSBwb3NzaWJsZSBidXQgdGhl
IGNvbW1pdCBtc2cgbmVlZHMNCj4+PiB0byBiZSBjbGVhciBhYm91dCBpdC4gQXMgb2Ygbm93LCBp
dCByZWFkcyBhcyBpZiB0aGUgcHJvYmxlbSBvY2N1cmVkIGFsd2F5cyB3aGVuDQo+Pj4gdGhlcmUg
YXJlIG11bHRpcGxlIHJlc2VydmVkIG1lbW9yeSByZWdpb25zLiBUaGF0J3Mgbm90IHRydWUgaWYg
YSBob3N0IERUQg0KPj4+IGdlbmVyYXRlcyBvbmUgL21lbW9yeSBwZXIgb25lIC9yZXNlcnZlZC4N
Cj4+DQo+PiBZZXMsIHlvdSBhcmUgY29ycmVjdCB0aGF0IHRoZSB0b3RhbCBzaXplIGRlcGVuZHMg
b24gaG93IHRoZSBob3N0IERUQiBpcw0KPj4gc3RydWN0dXJlZCBjb21wYXJlZCB0byBob3cgWGVu
IHJlZ2VuZXJhdGVzIGl0IGF0IHJ1bnRpbWUuIFNvLCB0aGUgaXNzdWUNCj4+IGNhbiBhcmlzZSBp
ZiBob3N0IERUQiByZXByZXNlbnRzIFJBTSB1c2luZyBhIHNpbmdsZSwgbGFyZ2UgcmVnIGVudHJ5
IG9yDQo+PiBhIGZldyBlbnRyaWVzLg0KPj4NCj4+ICoqKg0KPj4NCj4+IEkgd2lsbCB1cGRhdGUg
dGhlIGNvbW1pdCBtZXNzYWdlIHRvIGNsYXJpZnkgdGhhdCwgc29tZXRoaW5nIGxpa2UgYmVsb3c6
DQo+Pg0KPj4gWGVuIGZhaWxzIHRvIGNvbnN0cnVjdCB0aGUgaGFyZHdhcmUgZG9tYWluJ3MgZGV2
aWNlIHRyZWUgd2l0aA0KPj4gRkRUX0VSUl9OT1NQQUNFICgtMykgd2hlbiB0aGUgaG9zdCBtZW1v
cnkgbWFwIGlzIGhpZ2hseSBmcmFnbWVudGVkDQo+PiAoZS5nLiwgbnVtZXJvdXMgcmVzZXJ2ZWQg
bWVtb3J5IHJlZ2lvbnMpIGFuZCB0aGUgaG9zdCBEVEIgcmVwcmVzZW50cw0KPj4gUkFNIGNvbXBh
Y3RseSAoZS5nLiwgYSBzaW5nbGUgcmVnIHBhaXIgb3IganVzdCBhIGZldykuDQo+Pg0KPj4gVGhp
cyBvY2N1cnMgYmVjYXVzZSBET00wX0ZEVF9FWFRSQV9TSVpFIHVuZGVyZXN0aW1hdGVzIHRoZSBz
cGFjZQ0KPj4gcmVxdWlyZWQgZm9yIHRoZSBnZW5lcmF0ZWQgZXh0cmEgL21lbW9yeSBub2RlLiBX
aGlsZSB0aGUgaG9zdCBEVEINCj4+IG1pZ2h0IHJlcHJlc2VudCBSQU0gY29tcGFjdGx5LCBtYWtl
X21lbW9yeV9ub2RlKCkgYWdncmVnYXRlcw0KPj4gYWxsIHJlc2VydmVkIHJlZ2lvbnMgaW50byBh
IHNpbmdsZSByZWcgcHJvcGVydHkuDQo+PiBXaXRoIE5SX01FTV9CQU5LUyAoMjU2KSBhbmQgNjQt
Yml0IGFkZHJlc3Mvc2l6ZSBjZWxscywgdGhpcyBwcm9wZXJ0eQ0KPj4gY2FuIGdyb3cgdXAgdG8g
NEtCICgyNTYgKiAxNiksIGVhc2lseSBleGNlZWRpbmcgdGhlIHNwYWNlIG9yaWdpbmFsbHkNCj4+
IG9jY3VwaWVkIGJ5IHRoZSBob3N0IERUQidzIG5vZGVzIHBsdXMgdGhlIGN1cnJlbnQgcGFkZGlu
ZywgdGhlcmVieQ0KPj4gb3ZlcmZsb3dpbmcgdGhlIGFsbG9jYXRlZCBidWZmZXIuDQo+IFRoaXMg
cmVhZHMgYmV0dGVyLg0KDQpvaw0KDQoNCj4gDQo+Pg0KPj4NCj4+Pg0KPj4+IEFub3RoZXIgaXNz
dWUgaXMgd2l0aCB0aGUgc3RhdGljIHNobSBub2Rlcy4gVXNlciBzcGVjaWZpZXMgdGhlIHJlZ2lv
bnMgaW4gdGhlDQo+Pj4gZG9tYWluIGNvbmZpZ3VyYXRpb24gYW5kIFhlbiBjcmVhdGVzICphZGRp
dGlvbmFsKiBub2RlcyB1bmRlciAvcmVzZXJ2ZWQgYW5kDQo+Pj4gL21lbW9yeSB0aGF0IGFmYWlj
dCB3ZSBkb24ndCBhY2NvdW50IGZvci4NCj4+DQo+PiBZZXMsIHlvdSBhcmUgcmlnaHQuDQo+Pg0K
Pj4gU2luY2UgdGhlc2UgU0hNIHN1Yi1ub2RlcyBhbmQgcHJvcGVydGllcyBhcmUgZ2VuZXJhdGVk
IHB1cmVseSBmcm9tIHRoZQ0KPj4gWGVuIGRvbWFpbiBjb25maWd1cmF0aW9uIGFuZCBhcmUgbm90
IHByZXNlbnQgaW4gdGhlIGhvc3QgRFRCLCB0aGV5IGhhdmUNCj4+IHplcm8gc3BhY2UgYWxsb2Nh
dGVkIGZvciB0aGVtIGluIGZkdF90b3RhbHNpemUuDQo+Pg0KPj4gU28gd2UgbmVlZCB0byByZWRl
ZmluZSB0aGUgbWFjcm8uIEkgcHJvcG9zZSB0aGUgZm9sbG93aW5nIGZvcm11bGEgdGhhdA0KPj4g
c2VwYXJhdGVzIHRoZSByYW5nZSBkYXRhICgxNiBieXRlcyBwZXIgYmFuayBpbiAvbWVtb3J5KSBm
cm9tIHRoZSBub2RlDQo+PiBvdmVyaGVhZCAoMTYwIGJ5dGVzIHBlciBTSE0gcmVnaW9uKToNCj4g
V2hhdCBpcyBpbmNsdWRlZCBpbiB0aGVzZSAxNjAgYnl0ZXM/IERpZCB5b3UgbWFudWFsbHkgY2hl
Y2sgYWxsIGZkdCBmdW5jdGlvbnMNCj4gaW5zaWRlIG1ha2Vfc2htX3Jlc3ZfbWVtb3J5X25vZGU/
DQoNCkFjY29yZGluZyB0byBteSBjYWxjdWxhdGlvbnMgKHdoaWNoLCBvZiBjb3Vyc2UsIG1pZ2h0
IGJlIG5vdCBwcmVjaXNlKToNCg0KLSBGRFRfQkVHSU5fTk9ERSArIHhlbi1zaG1lbUBmZmZmZmZm
ZmZmZmZmZmZmXDAgKDI3YiBwYWRkZWQgdG8gMjgpOiAzMiBieXRlcw0KLSBjb21wYXRpYmxlICgx
MmIgaGVhZGVyICsgMjFiIHN0cmluZyBwYWRkZWQgdG8gMjQpOiAzNiBieXRlcw0KLSByZWcgKDEy
YiBoZWFkZXIgKyAxNmIgcGF5bG9hZCBbNCBjZWxsc10pOiAyOCBieXRlcw0KLSB4ZW4saWQgKDEy
YiBoZWFkZXIgKyAxNmIgbWF4IHN0cmluZyBbMTUgY2hhcnMgKyBcMF0pOiAyOCBieXRlcw0KLSB4
ZW4sb2Zmc2V0ICgxMmIgaGVhZGVyICsgOGIgcGF5bG9hZCk6IDIwIGJ5dGVzDQotIEZEVF9FTkRf
Tk9ERTogNCBieXRlcw0KVG90YWwgZXhhY3Qgbm9kZSBwYXlsb2FkOiAxNDggYnl0ZXMuIEkgYWxz
byBhZGRlZCAxMi1ieXRlIG1hcmdpbiAoc28gaXQgDQpnZXRzIHJvdW5kZWQgdXAgdG8gdGhlIG5l
YXJlc3QgMTYtYnl0ZSBib3VuZGFyeSkuDQoNCj4gDQo+Pg0KPj4gI2RlZmluZSBET00wX0ZEVF9F
WFRSQV9TSVpFICgxMjggKyBzaXplb2Yoc3RydWN0IGZkdF9yZXNlcnZlX2VudHJ5KSArIFwNCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChOUl9NRU1fQkFOS1MgKiAxNikgKyAgICAg
ICAgICAgICAgICAgICAgXA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKE5SX1NI
TUVNX0JBTktTICogMTYwKSkNCj4gSSB0aGluayB5b3Ugb25seSBhY2NvdW50ZWQgZm9yIHNobSBu
b2RlcyB1bmRlciAvcmVzZXJ2ZWQtbWVtb3J5LiBBcyBhbnkgb3RoZXINCj4gcmVzZXJ2ZWQgbWVt
b3J5IG5vZGUsIHRoZXkgYXJlIGFsc28gYWRkZWQgdG8gL21lbW9yeSByZWcgcHJvcGVydHkgKHNl
ZQ0KPiBEVF9NRU1fTk9ERV9SRUdfUkFOR0VfU0laRSkuDQoNCllvdSBhcmUgcmlnaHQsIGFuZCBJ
IGNvbXBsZXRlbHkgbWlzc2VkIHRoaXMgaW4gbXkgb3JpZ2luYWwgY2FsY3VsYXRpb24uIA0KSSBt
aXN0YWtlbmx5IGJlbGlldmVkIChOUl9NRU1fQkFOS1MgKiAxNikgd291bGQgY292ZXIgdGhlIGVu
dGlyZSANCmNhcGFjaXR5IG9mIHRoZSAvbWVtb3J5IG5vZGUncyByZWcuDQoNClRoZSBzaG1fbWVt
X25vZGVfZmlsbF9yZWdfcmFuZ2UoKSBhcHBlbmRzIHRoZSBzaGFyZWQgbWVtb3J5IGJhbmtzIA0K
ZGlyZWN0bHkgaW50byB0aGUgbWFpbiAvbWVtb3J5IG5vZGUncyByZWcuIEVhY2ggU0hNIGJhbmsg
YWRkcyAxNiBieXRlcyANCig0IGNlbGxzID0gMTYgYnl0ZXMpIHRvIHRoZSBtYWluIG1lbW9yeSBu
b2RlLg0KDQpTbywgSSB3aWxsIHJlZmluZSB0aGUgbWFjcm8gdG8gZXhwbGljaXRseSByZWZsZWN0
IGJvdGggdGhlIDE2MC1ieXRlIA0KZGlzY3JldGUgc3ViLW5vZGUgYW5kIHRoZSAxNi1ieXRlIGV4
dHJhIHRvIHRoZSAvbWVtb3J5IG5vZGU6DQoNCiNkZWZpbmUgRE9NMF9GRFRfRVhUUkFfU0laRSAo
MTI4ICsgc2l6ZW9mKHN0cnVjdCBmZHRfcmVzZXJ2ZV9lbnRyeSkgKyBcDQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAoTlJfTUVNX0JBTktTICogMTYpICsgICAgICAgICAgICAgICAgICAg
IFwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChOUl9TSE1FTV9CQU5LUyAqICgxNjAg
KyAxNikpKQ0KDQpPciB3YWl0LCB3ZSBjYW4gYWN0dWFsbHkgZHJvcCB0aGUgU0hNIG92ZXJoZWFk
IGVudGlyZWx5IHdoZW4gDQpDT05GSUdfU1RBVElDX1NITT1uOg0KDQojZGVmaW5lIERPTTBfRkRU
X0VYVFJBX1NJWkUgKDEyOCArIHNpemVvZihzdHJ1Y3QgZmR0X3Jlc2VydmVfZW50cnkpICsgXA0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKE5SX01FTV9CQU5LUyAqIDE2KSArICAgICAg
ICAgICAgICAgICAgICBcDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoSVNfRU5BQkxF
RChDT05GSUdfU1RBVElDX1NITSkgPyAgICAgICAgIFwNCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIChOUl9TSE1FTV9CQU5LUyAqICgxNjAgKyAxNikpIDogMCkpDQoNCg0KPiANCj4gfk1p
Y2hhbA0KPiANCg==

