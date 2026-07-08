Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6AiVHfgVTmo9CwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 11:18:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2D172392A
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 11:18:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=fGzZP8Jh;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1356725.1611276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whOQI-0003RN-Gm; Wed, 08 Jul 2026 09:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356725.1611276; Wed, 08 Jul 2026 09:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whOQI-0003Of-DT; Wed, 08 Jul 2026 09:18:30 +0000
Received: by outflank-mailman (input) for mailman id 1356725;
 Wed, 08 Jul 2026 09:18:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1whOQG-0003OZ-Fl
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 09:18:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whOQF-00AcSt-Sm
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 11:18:27 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4e15c2-e002-0a2a0a5209dd-0a2a4509e7d2-48
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:18:27 +0200
Received: from [52.101.72.117]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4e15e3-97e6-0a2a45090019-34654875f51e-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:18:27 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by GV2PR03MB8558.eurprd03.prod.outlook.com (2603:10a6:150:aa::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 09:18:23 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 09:18:23 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uy9QtJlTnMNwYdewjNUwHjKmWDIaOuN7JEwFmacAr8sPkMQTjS73JbTzX7/28X63nB2XnDpRjCBbNM5In/X1qPMKJtsfe6mx8KqigTo5sgbkh7vjGKWC0TxROBn1nFDR1XCgb2p7bdTCoysTAn/ZWRTz76/cq7faDmIQ3DayYCywQsU08x8pSD/FQYyEztsJ/x7t0SfJbLtAnmNUxlCdi8LsIeIR6PduWAWA5n/FbM1CxgKJUhcWuhqUW01IaVLCAnkrPa9vkhXDomyb7nfCNGVQhep89ceeH6SI92N8TdK5VTS4To1N80siPQkDyB1GjJ3TREWOSHO4KVLYOPt1wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VUNT/jhTjskRtdJlHO4bSUe2g74vka9Yns7f8BraCY=;
 b=ZVngrr3K0Vi4vcQYA8bZaHovhkQCh72LE1WM3zh4jll/zU6WoudxFYdd1MwOjPyyn2cYCk1KbW4qqVPryV18FrttLpVfqgFkKWj6dD/Y04Sr7DJV2FWS9wMgOfabId7W8fJWear3I6WOBSB4FIfXHUJMknVyal1ET7PdiIwWctrM6rUbYhiRLOIGSPcndbfilBMy2Tw6juYo9v2nCR9Ma1x6Z5CLPJv0S+Kzclc0kMaRZJdx5HzaRxNCc27H8ZVAinn7eVGeb1+elHcYSl0JhVKhRm+RpqWgoqJGBZzQU3cdL/vEGUGRHxJM4yO8nb5XJs2lc+TNdBhKz2K+dU2oGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VUNT/jhTjskRtdJlHO4bSUe2g74vka9Yns7f8BraCY=;
 b=fGzZP8JhlNfdYUmo3lmUENw2NKJm1a4TkU0EdAQDtXcPSnkkZBGPLT6gEVMPvc5UTSXdieXZ1RiTuIxjMYOfvAC2Vw6CklZ8ukPIhwP27BIyLig3XBb26DQHz3qk36vm3UUerA9dsQctOqxa4zPvgyPjxL4HE/xwfTUPEqacQBmxX/SyTb+6jvtY0KIvVZMSmIZS9T+feOO8lVwWuXNGfuB99J7q6eOJ6ByE+IzICMTfzEMypzzOiCsPeTOEWmdvkHWi2pUTHneBHCaPEEHqnS+yGY2owNQTPjDypqyb8ayA3snffqlwjLrndx4IunT0tsdHHEibmjZfIhKuduRVqA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [for-4.22][PATCH] xen/arm: Fail domain construction if a
 secondary vCPU cannot be created
Thread-Topic: [for-4.22][PATCH] xen/arm: Fail domain construction if a
 secondary vCPU cannot be created
Thread-Index: AQHdDq5gOqNqAqj/K0Gfl8kk0v3OprZjWBUA
Date: Wed, 8 Jul 2026 09:18:23 +0000
Message-ID: <6594c467-4cc2-4a61-bbed-def8179cd712@epam.com>
References: <20260708074919.33381-1-michal.orzel@amd.com>
In-Reply-To: <20260708074919.33381-1-michal.orzel@amd.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|GV2PR03MB8558:EE_
x-ms-office365-filtering-correlation-id: bdc2a703-2a5c-4338-886a-08dedcd1dc22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|42112799006|366016|18002099003|22082099003|38070700021|11063799006|56012099006;
x-microsoft-antispam-message-info:
 tHfDiiMzsBHIUGgocqEvXm4i9TsOuAl+MyjRi2DP/gzmQTtc2iBazWY1aa69/kiHczE/Dtx20rTcrp0MxZyMTtKlK9SXxnQrIdWLsCxYwLruoNbFmqMBT9912CU3N9IY98cSh+6bx8mcWLvF5qmWh3p5MiOFfho23Bh5Ndgs8yj+9K0Tpqjmr5QA49Hh+qTJ8vDSkLBPKx4qbwVUurTZt1792npWx9kX4CeyrgbgKHSfDuV1iyq5MLTim5wUHp5xX1i7d8cmiGZDNTUWQ/Pkn5AvjIanZ5YuKtc8sNFCX3uK3b14GPGy2jT3mWri/I8a2s4x9LZVsZXesnM2ePASSCWgtE+gHPviweUlOjzKUMaZ3q5VnQNWdftLCUDyTugd2vm6mD83J9r533Dv6PnYO7fFaKOh74ilVVWyQGMaPZ6MBTTdi5aVYHT3XYDDNmti7lc09tTM4KZbHrWsyABHiE2NPuc59zj7Wwe6NjgmBAPlx9b3LEKTn7hpMqAtyjbT87BZ/arU0tkp5BK0L/9Aj6ng9sdJZZEgBDEqpklouEkZtIIKZyaLyA2n/YQtpXAdkYEJxmXC2mfTkqgoRgR0UJthSd6apy/3zKxDVyD+jRoGGnXgr/pZpfn1/eMgD34ii5ZD9KzCABfcZtQIl6hhTBGxr+Xc+tTaX3aSr7fOuHo/hXEwSfCECpyFs3TT26v0YC2p6GYVhq2zRX2vdfbJ2Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(42112799006)(366016)(18002099003)(22082099003)(38070700021)(11063799006)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?THg4TUFlZ21naFgrRjRlU295RkNEeWdMbGVOU1RyYWZrTkNlWHFRR0owbWR4?=
 =?utf-8?B?bCtKTHYvWThQMmpGTVRld21MVXNjUi9Qc3Q5VmtVNWp5Tk1RZ0F2ck5VL2Ru?=
 =?utf-8?B?ZTFmUGpybHVZTFR5SUM1ZS9WaW4vdkxWUS9kR0JyOW0rRDNWRFdGRmlTZmxz?=
 =?utf-8?B?VVFRVHpBbnBOSFdmNlZhNzJYUlVlS1dkNTR0Z3BXaTVFck9tU2dLMFJPUWNx?=
 =?utf-8?B?UnFpTXdPUVg2cWxiSytaN1c4bkNnTW1mTElsV1ZOSHV0THM5UW8rZktEdWMy?=
 =?utf-8?B?MWhETmc3dnFKemU2VS9TRmptRTBOdlQ5WDNuVE1rZ2oySmQ2Vng1WVZtVFFs?=
 =?utf-8?B?OWo3TW9MWTBJUWJGT3E1M0xodEVWeFQ4dHhhYXlRZWxXQndwSTVVK09IY2ZG?=
 =?utf-8?B?SENJb3NJbWxVMU4vQ2crdTRZYWpWSlVza0tVNVBXNUlpbVBPTWdBL1d0TThJ?=
 =?utf-8?B?TjRhZTNMbXRqS1dOUGhzc0Jsb0h6TXJQaXF1dkFuN0lyTkJZZ3czQXdTR3Ro?=
 =?utf-8?B?Q21MdWt2MlJvWUN4Vm1OZittNktJakRlTDl1ZnlyNVdSd1E3emxPUk02ZDB3?=
 =?utf-8?B?dzVtVEo4VkNlcmlpRnRYRkF1U3YvTjZZR29ScG5DdDlxNDZmM3dHSDRjZ3dX?=
 =?utf-8?B?SnFkdlhkN1ArSGtLY2QrMFErMHVuVTEzVllxaWdBWVBZa0dsU3FON0dWamYw?=
 =?utf-8?B?SFFvYmdlWkRiM1lxRXA4Q0NuQkNYVEVrQ3EydkpZTkdvTXRiMG5xYWNzM1dL?=
 =?utf-8?B?WnJtVyt1T0hrbjJkc2x1KzFPeFhpaGNQdWxyUVlobUdIblNvTGdzZGpna2lJ?=
 =?utf-8?B?aG5mblpwUHRDQWUvMWFBQVhWVlRraG5Zek1sOEpWY01pU2ZRQ3FsL1JHNmts?=
 =?utf-8?B?aVczSmNKbSttbGhZbDBHcVBLOTQ0eW5NYmxrb2NmWHV4dHk5Snlkam0yMTZq?=
 =?utf-8?B?YVdSS2R4ZkVZSkNjL29iSlVDalpDU0tHTWdRV1FIZXdOSWF0N1h2Tytoc3hD?=
 =?utf-8?B?YVpIc2ZGZW54NUVNT3Z1bmVBSXdmWEF0MmNESk5IeEdHUDNVR1FuUlczdThJ?=
 =?utf-8?B?MlRqcm1EZnl5UXBqLytSR0d5c3AwNlZZQVlaTGhFY2Z2TWtOYUVmOXFUS1JF?=
 =?utf-8?B?OFc0WUtoRFNNQUxVenIybGREandXc0RRVHNyUUdiOTFyS2FuQlBlSm1wSjdy?=
 =?utf-8?B?bGZUZXVBTzZ5NFZTS3RvaTd3cHJVM0N2YjZVS0RuRGNLZkFRN1dFU1BLL2Ji?=
 =?utf-8?B?OTlRWGRyWXdjQXZYby9JMzZGTHpnUkZSMUlyeENXQTVtTVdyMGhxSUIzcHN6?=
 =?utf-8?B?L2pJZytQN3prS01sNU9VcHhBVGZoVlBvNWlBYzVhR0I5MHpZc082R0tmSU4y?=
 =?utf-8?B?WVpNcFBHTGdBWHZ4Tm5lT0xKczZYRHZpT3grcmdNNGJ0UzNGM0gxZzJIak5y?=
 =?utf-8?B?eHpQWWZ5VnFGSzNieWZOaEdnNVZRMGxiWm8rQnpYTndzaHNBaXVwM1VRN0Vn?=
 =?utf-8?B?ODRXVXJBV2kwZW5WQzF6dDIxVCtmeFpSc24rWDcvUU1neUhoek45a3RwSklF?=
 =?utf-8?B?RUppeThZYTdvSm9ZejErYnZSbEVVM0ZxRGQ4SXRFYTRBajFDc2JhajlScVJP?=
 =?utf-8?B?RnEvYVhhZWg2aXk4dys3WlpVQVZVVkExRGJFZG9BQmpkWlREWWxVbFZvdmpI?=
 =?utf-8?B?b0VKdlNkYisyaElPUExrWGE2cVNrVWFyWW81TWx3MEpmdmM0aVBCckZrc3BN?=
 =?utf-8?B?Sjl6K0EyNHMxS3ZCcGlFQXhVSkUzQ2FjaWt6N1h3REtqUVRabDJRS2thSTJm?=
 =?utf-8?B?bzhGRWtwa3RuWHp1VElZSFludG1nTE4wdmkwV002RXBPVUladGE0YXNDbnVQ?=
 =?utf-8?B?S0VNaWRPMUlGbktpWkdLU3FxS1ZXMGxYbG1tbHNYRERabVVRL1JBWGZqZ1gz?=
 =?utf-8?B?ZWdYenQzMzB0VTZUSXU5bnN4T0VKSlRaVXJTUElnUlUrQW9INjJIczRiMEMv?=
 =?utf-8?B?WitrMjM2YlVJSndnWnVPeHhMc3I4QkplZzFRRERENFFYNXhZd2FNbVJIMVZZ?=
 =?utf-8?B?RmFKdGVQZUFuNHNSa0RKQkRLU3dTY2ErQXBlODNrdGRkYURwVFN6VVhBZXJF?=
 =?utf-8?B?R3A4OGFMbEJDR3owVVM0S3FOUDFaL2ZGNFdoOUJSM0lIOTEwWWpNeDFLcXBm?=
 =?utf-8?B?OXdYd1VSc1Z1R291QVNhalgxWG5jVXhZQzVHU0NhVFY5TFp4SEpFdXVoTDBB?=
 =?utf-8?B?SEh2bGV6NlZ0em42ckFEaHdGcmdNaHJreXdVV2VCUTFwQmlWUjdsSVgwVkNh?=
 =?utf-8?B?SWRBWE8raHUvK2w3WVVMRnlkVG1STW0yekMyeE1wQ1J0dFlRcWxFejdPMUpH?=
 =?utf-8?Q?Je+yqyWasHcHI3FM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6125DF7682BB9742B4F1623E1A00FB08@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc2a703-2a5c-4338-886a-08dedcd1dc22
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 09:18:23.1649
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NYBP4XjYP9qutP5saUYv6pbC/4K2FHRpi/wOBMPg7Wg1e2ul7RHpXDRVFVKr1iF5N7z+hNWukXzilegnDW/yT/s1QQVN/Eu4j8u4iTfsUmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8558
X-purgate-ID: tlsNG-bad1c0/1783502307-45F25986-FE54757F/0/0
X-purgate-type: clean
X-purgate-size: 2480
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD2D172392A

SGkgTWljaGFsLA0KDQpPbiA3LzgvMjYgMTA6NDksIE1pY2hhbCBPcnplbCB3cm90ZToNCj4gY29u
c3RydWN0X2RvbWFpbigpIGNyZWF0ZXMgdGhlIHNlY29uZGFyeSB2Q1BVcyBpbiBhIGxvb3AsIGJ1
dCBvbiBhDQo+IHZjcHVfY3JlYXRlKCkgZmFpbHVyZSBpdCBvbmx5IHByaW50cyBhIG1lc3NhZ2Ug
YW5kIGJyZWFrcyBvdXQgb2YgdGhlDQo+IGxvb3AgcmV0dXJuaW5nIHN1Y2Nlc3MuIEFzIGEgcmVz
dWx0IHRoZSBkb21haW4gY2FuIGJlIGNvbnN0cnVjdGVkDQo+IHdpdGggZmV3ZXIgdkNQVXMgdGhh
biBkLT5tYXhfdmNwdXMsIGxlYXZpbmcgTlVMTCBob2xlcyBpbiBkLT52Y3B1W10NCj4gYmVsb3cg
bWF4X3ZjcHVzLg0KPiANCj4gV2hlbiB0aGUgZ3Vlc3QgcHJvYmVzIHRoZSByZWRpc3RyaWJ1dG9y
IG9mIGEgdkNQVSB0aGF0IHdhcyBuZXZlciBjcmVhdGVkLA0KPiBnZXRfdmNwdV9mcm9tX3JkaXN0
KCkgb25seSBjaGVja3MgdmNwdV9pZCBhZ2FpbnN0IGQtPm1heF92Y3B1cyBhbmQgdGhlbg0KPiBk
ZXJlZmVyZW5jZXMgdGhlIE5VTEwgZC0+dmNwdVt2Y3B1X2lkXSwgcmVzdWx0aW5nIGluIGEgZGF0
YSBhYm9ydC4NCj4gDQo+IFJldHVybiBhbiBlcnJvciBpbnN0ZWFkIG9mIGJyZWFraW5nIG91dCBv
ZiB0aGUgbG9vcC4gQm90aCBjYWxsZXJzDQo+IChjb25zdHJ1Y3RfZG9tVSgpIGFuZCBjb25zdHJ1
Y3RfaHdkb20oKSkgYWxyZWFkeSBwcm9wYWdhdGUgYSBuZWdhdGl2ZQ0KPiByZXR1cm4gdmFsdWUg
YW5kIGZhaWwgZG9tYWluIGNvbnN0cnVjdGlvbiwgd2hpY2ggaXMgdGhlIGNvcnJlY3QNCj4gYmVo
YXZpb3VyOiBhIGRvbWFpbiB0aGF0IGNhbm5vdCBwcm92aWRlIHRoZSByZXF1ZXN0ZWQgbnVtYmVy
IG9mIHZDUFVzDQo+IHNob3VsZCBub3QgYmUgYnJvdWdodCB1cC4NCj4gDQo+IEZpeGVzOiA2YjBl
OGU0MzM0OGEgKCJ4ZW4vYXJtOiBhbGxvY2F0ZSBzZWNvbmRhcmllcyBkb20wIHZjcHVzIikNCj4g
U2lnbmVkLW9mZi1ieTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4NCj4gLS0t
DQo+ICAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0K
PiBpbmRleCA1NTA2MTdmMTUyYmIuLmI0NjU3NGZkMzJhYSAxMDA2NDQNCj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
Yw0KPiBAQCAtMTg0Nyw3ICsxODQ3LDcgQEAgaW50IF9faW5pdCBjb25zdHJ1Y3RfZG9tYWluKHN0
cnVjdCBkb21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pDQo+ICAgICAgICAgICBp
ZiAoIHZjcHVfY3JlYXRlKGQsIGkpID09IE5VTEwgKQ0KPiAgICAgICAgICAgew0KPiAgICAgICAg
ICAgICAgIHByaW50aygiRmFpbGVkIHRvIGFsbG9jYXRlIGQlZHYlZFxuIiwgZC0+ZG9tYWluX2lk
LCBpKTsNCj4gLSAgICAgICAgICAgIGJyZWFrOw0KPiArICAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7DQoNCkkgd291bGQgc2F5IHJldHVybmluZyAiLUVOT01FTSIgaXMgbW9yZSBhY3R1YWwgaGVy
ZSwgYmVjYXVzZSANCnZjcHVfY3JlYXRlKCkgZmFpbHMgaW4gbW9zdCBjYXNlcyBkdWUgdG8gdW5h
YmxlIHRvIGFsbG9jYXRlIG1lbW9yeS4NCg0KPiAgICAgICAgICAgfQ0KPiAgIA0KPiAgICAgICAg
ICAgaWYgKCBpc182NGJpdF9kb21haW4oZCkgKQ0KDQpCUiwgRG15dHJvLg==

