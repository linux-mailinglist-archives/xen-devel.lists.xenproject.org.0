Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m2STHsHOUGpb5QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 12:51:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CD3739D8B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 12:51:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=GJViQuOg;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1359096.1612862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi8pK-0000v9-5x; Fri, 10 Jul 2026 10:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359096.1612862; Fri, 10 Jul 2026 10:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi8pK-0000t4-20; Fri, 10 Jul 2026 10:51:26 +0000
Received: by outflank-mailman (input) for mailman id 1359096;
 Fri, 10 Jul 2026 10:51:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wi8pJ-0000sy-4C
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 10:51:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi8pI-006iTJ-0e
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 12:51:24 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a50ceab-5cb7-0a2a0a5109dd-0a2a4502ea2a-0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 12:51:23 +0200
Received: from [40.107.130.92]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a50ceab-64c6-0a2a45020019-286b825c29db-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 12:51:23 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by GV1PR03MB10632.eurprd03.prod.outlook.com (2603:10a6:150:204::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Fri, 10 Jul
 2026 10:51:20 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 10:51:15 +0000
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
 b=gPw0AnP+KIn5dEJtydbFXPhzc+V/fLlB+mTh8j97VQM1GyzvVB/MVgw5V/g/kmZEgxsuNsHhXuIeBc6uz2T43KSNzi9fgqOqZUTk9q0KUII5BcGhb4frz6rkAcrgabAI3iNBMoUMk5BforvxZ2ax+Ca6kJ2NErD8HFb4rC/n0UHxDUT2IWI+Drzrj9i0brcZqRyUhwWvM0W2DkePWAEhI/kOnbO1SUwzMX55QSz94Gq8ywuPFdjpbEnMVb/+1ufB8BiGXZybu/LGxHQYGT9kkV+9o/NGc2wBQo1kG0HDbDmpLVgcrUm6BHbr0w/1axi6zI9uex4BGh2pIOWdEM1lSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfUzPe4p8eBIzVKfVsexGP00E5WYXNm4vC1mhgF3uMA=;
 b=iJkFcRf9lC2617a520wuNuHSJNgYqRhZgg+Ld3Cv73RTBBqbeF0h+MWQBVKzEazst1wk11mRHWCAv71QJXMXnZDEdTYYS+5U0B3o/z3OBrip4coO3REWWWxqjWdmkC9cCkpkspDFSkrMdqTdGGUSOHfDd7tn05zIJBKUV7qDGBKEtDb8x4GNRZA8GyNA3UZ2H7HrbyGeto9VbOIBeOH6sgQuPsDowRzlDLw5f6jxJV/8JC4xI5RyQuOc0QBUhnDPBvMUlT0BYbrScwHqpGuPuxnWXStzVUyVA5OjwlJHVg6dBDC6icGy56EJHaG3+SiQIPn3d6vbaql+q1UggHufqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfUzPe4p8eBIzVKfVsexGP00E5WYXNm4vC1mhgF3uMA=;
 b=GJViQuOgLXKK6vnDDxADyjOGblSIIcz7vCUz5oKZ3edF5eWoDzknu4HyA8phN6P9SAAvFIgL+7b0FeYZCDbDsiSeZ9aEa+0us5MMfvBomhWR33W+81AzOD/r9HOkxZ4+kdCuC/+T7F/3PzaWVh4PgJSHX9aOoLDorSpjD1/h5H/LwouvUjyhqgtebRHNPKINtv8nYy4ZnVueqqWwhtOR3tbVhIh/eoG0i/ovpk2pds1Sy83rTKIDgW5Dv7R+GBSuZMwrTxuhqQ1k5LqPy9PbloL+donwid1WFjaljCct83gLdqj+Xbdj3ZKduyXnOiAXvgvz+bpQlqeTp+mVjV7C0Q==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH for-4.22 v5] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Topic: [PATCH for-4.22 v5] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Index: AQHdD57jetXi2xq2zkS8tff7r9QcYLZmWy2AgAA5pIA=
Date: Fri, 10 Jul 2026 10:51:15 +0000
Message-ID: <f0ba5b86-e15f-40a8-9335-3be303494a57@epam.com>
References:
 <7a146536c13431933899ffffc93c85724dfbaf87.1783599357.git.dmytro_prokopchuk1@epam.com>
 <a257b466-ce41-4073-b9dc-826059b9750d@amd.com>
In-Reply-To: <a257b466-ce41-4073-b9dc-826059b9750d@amd.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|GV1PR03MB10632:EE_
x-ms-office365-filtering-correlation-id: 7d421d40-05dd-42e7-06f7-08dede712a86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|42112799006|366016|1800799024|376014|3023799007|4133799003|22082099003|18002099003|4143699003|5023799004|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info:
 AOxXyByD4zTnxVnvwf6TZDNja6iqQrj3Lg2kkONaspgf/dUSFmXzyorxUnvVtrne/CBN6WfjUPRCHEW3G9bQYtdgugoqurDdyi95jLY6VEtD0DfECVPGRvnABHABZDKhI4EidGvG1pxxt05NEXlZiZukHMI/TljBCbIc2OaU4KL13ja4rUVzp2zEOjBvQnQOyUAqoCrBy3G8mt9RoEXNRwXfcZ85AEQPGKrQto3G6XzDfSAAF4XVob9jRPAipRD/iLfI5I0pT2DCkWGOfc8fwFEshrWDNPnSIrXBzL2f4HLAhWq3atZcX7zzAG+NJt3X2phyPdX0rbhAV31u6sqnZ3I/boUDDhdtTXzzdg4aCHpE5rAcr8fAhCpFDh0pzMNUmjxm0ec9p2iX3qY/DHm0ncf6+gZEePaRZc/53WXONhKNYkTmMVVxRX1mMaayxlFNBEX/TLk97TEJlQVA6wB57dbYZwP3rL0LlfxO6W/UBE+SMltJwm6HXnFUZRgn5bYTbj716eT/M2/QBWo2rT4DAnzYPKUjh4ewCPFjjuhnGsXhdCym1ExhPY0p/UVrhTAzJK7OwIi67U2JBsX0jAdc6rLtyFDcJzr81+AtW5It1TWxnkJzzkIdGck4fhddRdFVXWQVHH820oYMV31k0KaYc3+CfuWl4B2e/7otD3NG1yXQuPJDRoG5nXsnaP5Qdt3qnRTiWpDWRfx4e3xHKH5ei1DKYhGNAdZ2JLlbU0sZw1U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(42112799006)(366016)(1800799024)(376014)(3023799007)(4133799003)(22082099003)(18002099003)(4143699003)(5023799004)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ODVMWG8rQWFoYkZBVTdPazdlLzlqOGdpRDcveWtsTGZvaktRWk45WFRUR0sz?=
 =?utf-8?B?cW1PV3VDbmIyakwrc0hGMVhXdTQxWVYyeGhHYzZUUjN2MkRSN1ltUUVvaWd1?=
 =?utf-8?B?czdjdEhuS2FiMHFPeTR5azllNzVYSFd5dW1CeWhWbktGbnVUejM5MXhtQzhN?=
 =?utf-8?B?UHp2L3N1WklBbjBEVUZwcjJGTk1tcUM1VlBBNDc4bDJzeDhadG40bTlwRkR2?=
 =?utf-8?B?MDQ3NTVpN2FGYkxmeHlqR1VxVldRUFNld1Njd3J6amN4cG42dW9xNGxUY0lW?=
 =?utf-8?B?djdTVzg3WFNoVDArWGgrQ0tkVE5xc1psTzhiSk5iby9MbHpocklzQWJhVnpG?=
 =?utf-8?B?Q1pZSjRFcmpCbVE2dWxxbm5VWkhGL0Q1S2Jsc2U3MS9BM253bGtBMldSWmxn?=
 =?utf-8?B?am1XSUFIdW5nazU3VG9JdXNDT3VZRVhSazZWbDg0UjdOV3hGRm4wM1VOZmo5?=
 =?utf-8?B?ODBSNUFCdTk2Rkh3UHU3N3BvVDVvZFhrbVFVbnpRbUFpb3JXc0gvV0o1TzQz?=
 =?utf-8?B?QkRWYmh3QU5sSXFzblE2L2thTHljWjF0SXVrUHAxbHp4ODB5RzR5T05mdXhq?=
 =?utf-8?B?TktIUENiZTd3dzZZUTdzVzh0TSt2NHA1cWRJSUJYUXJNejNYZjNKQ0FlcVNR?=
 =?utf-8?B?N0R2a3Z1OWNZZ3FubGFiRHdGazd5eFRvamNxUzNvZUNMci95ZDkvZy9NVC9a?=
 =?utf-8?B?MjJjYWlSUkY5UW0zMzVKekFSbkxGbDB6MjJBTTRKWGNOcmpOOURsZUNHcUJ1?=
 =?utf-8?B?L3E5dkM3Z1p1Qm52S2ZqbXg3MnVPeThyT2crODFtaGQzcHZNaEhoQkR4b2xx?=
 =?utf-8?B?MzFFN2MybFNNUVZPcTFiQ2x4OElDcHgvSWh5bSswNjVtM3R6RS9mMWM4WG1t?=
 =?utf-8?B?MEUzbkdObUgrL3c1cSszMFd2aVJnb0owTS9HNEZ0MzMyWjBwWi9YVFRtLzNJ?=
 =?utf-8?B?dmt1S1hSMy9PbFJSVkhMalpPc3YwSTB0cXZVdlVaOElDZ1FtRExENTBDb0Jl?=
 =?utf-8?B?YUNFcTNVVE9UeXBtWktmK1kwQkZYT1dGT2ZVQ0tiM3ovQnNqMy9SQ0I5Z1R4?=
 =?utf-8?B?UjMwUlBVeXczOXZNSVp3V0paSkRWUE1DY1NGN1A3V3U2ZWlXSG52WU54YldX?=
 =?utf-8?B?NE81MEpVYXlhZ0ZSY1dqQW5nRk9HQXFvTjVXVzY5Znh2Y3JkaDJOYUpYNWMv?=
 =?utf-8?B?U2hzZk4zTjFFYW9hRWdSaEx5WXFIZE5IZndHRzI5N2gxU3RaZ0ZDOExGdFZ2?=
 =?utf-8?B?dDNVMlBVakJUZnppZHhqckxVVXltN3pORDdUUGJPNVJWbEpETVh4RDRWRzNL?=
 =?utf-8?B?OVVqTm1rcVBISnZBRWhab29OQW1LdjJSZ21HYnJxWGpNRG1kN0hMQmpTN3Bm?=
 =?utf-8?B?V0hWUmlTbG9CeE9hZDdEamhyZGNHZkg5NlR6emhaaEhUUmZvTG5IZlFkTWFL?=
 =?utf-8?B?ZnBId1Myc2hpNmc0TUpvT1RxYW5aOEdBSGRVZWJJNE53Z2Y1c05wU3hYaGlj?=
 =?utf-8?B?OHR0aXJnQW9QWVhUNmpvUTlBRFdxTHVzVnh6SjMwTUkzVnhsWFVXWFBXK1M1?=
 =?utf-8?B?VzBEb0tNNUNrL0ZwMmptT25FZVU3ZW5xSXJyRUllWjYwTXgvcCtxQmxJT2p6?=
 =?utf-8?B?YWZTbzVaQ2JSaUZuUkVSSnZSei80SEVOdm8yL0RXVkdDOTRSUlplMmIrY01p?=
 =?utf-8?B?eGlSS0NoWTBveVU4UEdubkdTeUNsc3ZiUnpYaE5wVWdFaHpjUHlvbEhvWWtQ?=
 =?utf-8?B?ME44UGYvLzU3dFBmb2ZpRldkRWoyWWpPZzUvcFZYMGMvMDhiRWR3czY5NXFS?=
 =?utf-8?B?bmpRSDJtdjBzcU4yVVFTSVI1UytvQ1Y1OUtRYlZTOGVoWWliS3QxS1czdjQ2?=
 =?utf-8?B?dmk5SUNnYjkwY2lSOW5BZDNjYnBrK2IwNk1uK0k5QU1wNk5BWUlPdkhNSFlX?=
 =?utf-8?B?ZHhTZURGY1dUM2w1NlE2eVY2YncrS0ZpMHFaeGY1UUNPNnZtd1Bjd2FtQkNV?=
 =?utf-8?B?THdGK2lGd0paTGpKVGo4N3BUVWNUNW40TkhHVElESjlxaG9TQ0JObzdhWFpl?=
 =?utf-8?B?MFczL3FCTjV4dTZYaWRCZG1QamFMNVk3M2pwU2IwY3Bhc2VJdC85Tzc5VGpK?=
 =?utf-8?B?SUxHSHI0L3VFT3J3eGtVb2JiQUd0SU5XTXJtUzcvZVZGbFIzcm1NMlNwWEdx?=
 =?utf-8?B?YU92M3VMcnFhMHJiRnJ2VGwzd1FTN0VUYXMzeStjbmZDMWlwa3hFNzUwaVo4?=
 =?utf-8?B?eldnNVBPOXV0ME00Z3pVZFgyOGdxYldXQWM5WmdyZVdUMlJoZTNyc0VqMnNn?=
 =?utf-8?B?VW5XMkZPMnQ1ak5ZNTdPVGJucnlVb0FCdVkvbVNVN09iOHc5eSt6VjIzd3pL?=
 =?utf-8?Q?rG5B/gcKFT2kSQNs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E82097BBE445F4D9E32701937F24B12@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d421d40-05dd-42e7-06f7-08dede712a86
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 10:51:15.8761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lI3M5T8HLMD4EuF9Sfq3BjLV9iLnriM0VMjAc1+iEiOi0lsxzzxmP+c40T9GFvOS29q9FsbwyXxsCGyMD4bA9xqBu7ArV4TYhbyx3hluXac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10632
X-purgate-ID: tlsNG-720697/1783680683-B3F4BA87-5EBE9DD3/0/0
X-purgate-type: clean
X-purgate-size: 4484
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,epam.com:from_mime,epam.com:email,epam.com:mid,epam.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C7CD3739D8B

DQoNCk9uIDcvMTAvMjYgMTA6MjQsIE9yemVsLCBNaWNoYWwgd3JvdGU6DQo+DQo+DQo+IE9uIDA5
LUp1bC0yNiAxNDozMSwgRG15dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4gQSBtYWxmb3JtZWQg
cGFydGlhbCBEVEIgc3BlY2lmeWluZyBib3RoICcjYWRkcmVzcy1jZWxscyA9IDwwPicgYW5kDQo+
PiAnI3NpemUtY2VsbHMgPSA8MD4nIGNhdXNlcyAnKGFkZHJlc3NfY2VsbHMgKiAyICsgc2l6ZV9j
ZWxscyknIHRvDQo+PiBldmFsdWF0ZSB0byAwLiBUaGlzIHN1bSBpcyBzdWJzZXF1ZW50bHkgdXNl
ZCBhcyBhIGRpdmlzb3Igd2hlbg0KPj4gY2FsY3VsYXRpbmcgdGhlIG51bWJlciBvZiByZWdpb25z
IGluIHRoZSAneGVuLHJlZycgcHJvcGVydHkgaW5zaWRlDQo+PiBoYW5kbGVfcGFzc3Rocm91Z2hf
cHJvcCgpOg0KPj4NCj4+ICAgICAgbGVuID0gZmR0MzJfdG9fY3B1KHhlbl9yZWctPmxlbikgLyAo
KGFkZHJlc3NfY2VsbHMgKiAyICsgc2l6ZV9jZWxscykgKg0KPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YodWludDMyX3QpKTsNCj4+DQo+PiBUaGlzIGxl
YWRzIHRvIGEgZGl2aXNpb24gYnkgemVybyBleGNlcHRpb24gaW4gdGhlIFhlbiBoeXBlcnZpc29y
IGR1cmluZw0KPj4gYm9vdCwgY2F1c2luZyBhIGh5cGVydmlzb3IgcGFuaWMvY3Jhc2guDQo+Pg0K
Pj4gRml4IHRoaXMgYnkgdmFsaWRhdGluZyB0aGF0IGJvdGggJ2FkZHJlc3NfY2VsbHMnIGFuZCAn
c2l6ZV9jZWxscycNCj4+IGFyZSB3aXRoaW4gdGhlIHZhbGlkIHJhbmdlIG9mIFsxLCAyXSBhdCB0
aGUgcmVhZCBzaWRlIGluIHNjYW5fcGZkdF9ub2RlKCkNCj4+IGltbWVkaWF0ZWx5IGFmdGVyIHRo
ZXkgYXJlIHBhcnNlZC4gQW55IGludmFsaWQgY2VsbCBzaXplIGNvbWJpbmF0aW9uIGlzDQo+PiBz
YWZlbHkgcmVqZWN0ZWQgZWFybHkgd2l0aCBhbiBlcnJvciBtZXNzYWdlIGFuZCByZXR1cm4gLUVJ
TlZBTC4NCj4+DQo+PiBGaXhlczogOWNlOTc0YzQ3NTg4ICgieGVuL2FybTogYXNzaWduIGRldmlj
ZXMgdG8gYm9vdCBkb21haW5zIikNCj4+IFNpZ25lZC1vZmYtYnk6IERteXRybyBQcm9rb3BjaHVr
IDxkbXl0cm9fcHJva29wY2h1azFAZXBhbS5jb20+DQo+PiAtLS0NCj4+IENoYW5nZXMgaW4gdjU6
DQo+PiAtIGZpeGVkIG1pc3Rha2VzIGFyb3VuZCBkcHJpbnRrKCkNCj4+IFRlc3QgQ0kgcGlwZWxp
bmU6DQo+PiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2RpbWFwcmtwNGsv
eGVuLy0vcGlwZWxpbmVzLzI2NjQ2MDA2NzgNCj4+IC0tLQ0KPj4gICB4ZW4vY29tbW9uL2Rldmlj
ZS10cmVlL2RvbTBsZXNzLWJ1aWxkLmMgfCA4ICsrKysrKysrDQo+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kZXZpY2Ut
dHJlZS9kb20wbGVzcy1idWlsZC5jIGIveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1i
dWlsZC5jDQo+PiBpbmRleCBlYWNmZDkzMDg3Li5jMDU0ZWE0ZTJmIDEwMDY0NA0KPj4gLS0tIGEv
eGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1idWlsZC5jDQo+PiArKysgYi94ZW4vY29t
bW9uL2RldmljZS10cmVlL2RvbTBsZXNzLWJ1aWxkLmMNCj4+IEBAIC0zNDEsNiArMzQxLDE0IEBA
IHN0YXRpYyBpbnQgX19pbml0IHNjYW5fcGZkdF9ub2RlKHN0cnVjdCBrZXJuZWxfaW5mbyAqa2lu
Zm8sIGNvbnN0IHZvaWQgKnBmZHQsDQo+PiAgICAgICBzaXplX2NlbGxzID0gZGV2aWNlX3RyZWVf
Z2V0X3UzMihwZmR0LCBub2Rlb2ZmLCAiI3NpemUtY2VsbHMiLA0KPj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgRFRfUk9PVF9OT0RFX1NJWkVfQ0VMTFNfREVGQVVMVCk7
DQo+Pg0KPj4gKyAgICBpZiAoIChhZGRyZXNzX2NlbGxzIDwgMSkgfHwgKGFkZHJlc3NfY2VsbHMg
PiAyKSB8fA0KPj4gKyAgICAgICAgIChzaXplX2NlbGxzIDwgMSkgfHwgKHNpemVfY2VsbHMgPiAy
KSApDQo+IFRvbyBtYW55IGRpc2N1c3Npb25zIHllc3RlcmRheS4uLiBUb2RheSwgSSBsb29rZWQg
YXQgdGhlIGNvbXBsZXRlIGZsb3cgb25jZQ0KPiBhZ2FpbiBhbmQgSSdtIHNvcnJ5IHRvIHNheSB0
aGF0IG15IHByZXZpb3VzIGNvbW1lbnQgdG8gbW92ZSB0aGUgY2hlY2sgcmlnaHQgYXQNCj4gdGhl
IHJlYWQgc2lkZSB3YXMgaW5jb3JyZWN0LiAjYWRkcmVzcy9zaXplLWNlbGxzIGRlZmluZSB0aGUg
bnVtYmVyIG9mIGNlbGxzIGZvcg0KPiB0aGVpciBjaGlsZHJlbiBhbmQgdGhlc2UgZG9uJ3QgbmVl
ZCB0byBoYXZlIHhlbixyZWcuIEV2ZW4gb3VyIHBhc3N0aHJvdWdoDQo+IGV4YW1wbGUgKGRvY3Mv
bWlzYy9hcm0vcGFzc3Rocm91Z2gudHh0KSBkZWZpbmVzIGEgZXRoZXJuZXQgbm9kZSB3aXRoICNz
aXplLWNlbGxzDQo+ID0gPDA+IGZvciBpdHMgUEhZIGNoaWxkIHdpdGggYSAxIGNlbGwgcmVnIGJ1
dCBubyB4ZW4scmVnLiBIZXJlLCBmb3Igb3VyIHNhbml0eQ0KPiBjaGVjaywgd2Ugb25seSBjYXJl
IHRoYXQgbnVtYmVyIG9mIGNlbGxzIGZvciB4ZW4scmVnIGlzIGVpdGhlciAxIG9yIDIuIDAgaXMg
YQ0KPiBsZWdpdGltYXRlIHZhbHVlIGZvciBub2RlcyB3aXRob3V0IHhlbixyZWcgKGNsb2NrIG5v
ZGVzLCBTUEksIEdQSU8sIGV0Yy4pLg0KPiBWYWx1ZXMgYWJvdmUgMiBpLmUuIDMgaXMgUENJIG9u
bHkgd2hpY2ggZG9lcyBub3QgZ28gdGhyb3VnaCB0aGlzIHBhdGggYnV0IHN0aWxsLA0KPiB3ZSBz
aG91bGQgb25seSBjYXJlIGFib3V0IG5vZGVzIHdpdGggeGVuLHJlZy4NCj4NCj4gVGhlcmVmb3Jl
LCBwbGVhc2UgbW92ZSB0aGlzIGNoZWNrIGF0IHRoZSB0b3Agb2YgaGFuZGxlX3Bhc3N0aHJvdWdo
X3Byb3AoKSB3aXRoIGENCj4gY29tbWVudCBiZWxvdyAodGhlIG51bWJlciBvZiBkaXNjdXNzaW9u
cyBhYm91dCB0aGlzIHN1YmplY3QgaXMgYSBjbGVhcg0KPiBpbmRpY2F0aW9uIHRoYXQgYSBjb21t
ZW50IGlzIG5lZWRlZCk6DQo+DQo+IC8qDQo+ICAgKiB4ZW4scmVnIGhvbGRzIGZsYXQgaG9zdC9n
dWVzdCBwaHlzaWNhbCBhZGRyZXNzZXMgYW5kIHNpemVzLCBzbyB0aGUNCj4gICAqIGluaGVyaXRl
ZCAjYWRkcmVzcy1jZWxscy8jc2l6ZS1jZWxscyBtdXN0IGVhY2ggYmUgMSBvciAyLiBUaGlzIGFs
c28NCj4gICAqIGd1YXJkcyB0aGUgbGVuIGRpdmlzaW9uIGJlbG93IGFnYWluc3QgYSB6ZXJvIG9y
IHdyYXBwZWQgZGl2aXNvci4NCj4gICAqLw0KPg0KPiB+TWljaGFsDQo+DQoNCkFjay4gSSB3aWxs
IGRvLg0KDQpUaGFua3MsIERteXRyby4NCg==

