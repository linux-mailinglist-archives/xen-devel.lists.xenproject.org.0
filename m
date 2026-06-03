Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EFAeEsIlIGraxQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:01:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF074637CE6
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:01:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=MEqrAgWR;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1326200.1591626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlDl-0003Te-3Z; Wed, 03 Jun 2026 13:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326200.1591626; Wed, 03 Jun 2026 13:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlDl-0003RX-0T; Wed, 03 Jun 2026 13:01:21 +0000
Received: by outflank-mailman (input) for mailman id 1326200;
 Wed, 03 Jun 2026 13:01:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wUlDi-0003RP-5f
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:01:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlDh-00FxiO-Hs
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:01:17 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a202596-2eae-0a2a0a5409dd-0a2a4508cb56-40
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:01:16 +0200
Received: from [52.101.228.137]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a202599-63b5-0a2a45080019-3465e48909e7-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:01:16 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB7519.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:454::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 13:01:10 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 13:01:04 +0000
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
 b=Rf2XGnE50FMA7tP+bmT8aAAZUrkCLVmsSt7Z+75ZICX4COBBrCFvrQfAaGuPPk/kkgjenLGRfsxl55zL77ko/obobqXObzrwG5/jbwtQhZxnIXNCwDQk3ifx1ZfIbOGUd7HiQAJicVLhXIiRD6isGRtwsMoFziF3DBctuJIJaBntPAxMcrOGjz2jrk7hCFPdOA92hAeAz6ioRRjTgtor6IUL5TpLazLsRlVqZLIzZMIKAp9JBjz/oXHpW5PjEUCWMRobQ2Nn2fKqxlmjgx76PK4lXeTZkxd9HFdwGBKg5PDmlENkkSQjKgvZbv2Ziy/0BpgcnCmwKg7st1Jsr7poWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHA8e+zbCgQWy8ZB117jcqSzUU8nXq9UdwZpZDQxgn0=;
 b=NkRH1yYVDS4zcyNxEWQg7GJUHBbjkoE5Brqak0JZTxhLGgS4Af1SboqbdG3SctBjvLixDsdKGP3iuglI252Xjps9WjB55RLopRgtprj+ySOvaGTYgrWty6vpJwiL95WFQt4TNPNJnKGH/sDtJs1KHq9crwAw5dFCm+sP9qQNGLf5UG5Hp9gLe5pfnCqolwNFIPfwrAQUCmgPXKRRh7RSj0/tEQDE/fz2lFCPHHmpBz2GF8ITHWMcMJL7uTwY6EqOjZP6aaCSx6YlBqE44CzpB6zb9ezrYBiyDlBAqJH1KhzMhp7M2dFCqcvlJzOmBJNlwMMHqFIyiDWk30Gb6B8ByQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHA8e+zbCgQWy8ZB117jcqSzUU8nXq9UdwZpZDQxgn0=;
 b=MEqrAgWRKtaL1UB1hxGhIJ2zAJaW9JTk6oAceuYGPx0nyH9eiBKEthagQQifppvCGXM2xvEj90ayjq0G0/t7J/MIQIWMN4ueYcLHwOgo/Td2jG2YIJT683Tot0x5Bq5t1JCbicjS1hQYfE9A63fA1pD0EsLRF0Y1JQCJZjyKoto=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Hirokazu Takahashi <taka@valinux.co.jp>, Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 07/24] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Topic: [PATCH v2 07/24] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Index: AQHc8U+PsZhvkHY9vEqKRtt8NHnfGrYrBomAgAF93dCAAEeY4A==
Date: Wed, 3 Jun 2026 13:01:04 +0000
Message-ID:
 <OS9P286MB722241B5C3E48A93F7E0BBA782132@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260531224755.9481-1-taka@valinux.co.jp>
 <20260531224755.9481-8-taka@valinux.co.jp>
 <7040c58f-2d4c-48f2-854f-c874efdcefbd@suse.com>
 <OS9P286MB72221F0A5D5195C7A4CAFD4082132@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To:
 <OS9P286MB72221F0A5D5195C7A4CAFD4082132@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|OS9P286MB7519:EE_
x-ms-office365-filtering-correlation-id: 8bfc12f8-4f3b-4b03-3e58-08dec1702b72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700021|6133799003|22082099003|18002099003|56012099006|4143699003;
x-microsoft-antispam-message-info:
 gqKQBx9n8cLF9O969W16BPKy3O2w6KdjtBBMNihovi7KY/YEOmiiBATNublJZZ7VKyX5mkeaaPtdu7pzSX/woFG8cyS2e6DuBBcE6rzk8TaEPekUIfZE06DVrv7EOlSEqT7TKeLiCEysHnafM/L/1VvvhI4ESZc+rQ+03t6MloQz6CsyDNcQ7G7AUWPZ/w/S17fJ26AbLpgETjSDsGntYghw5L3MuBkP1E1o7MxybwtXqIusEP3Avxg9JAtv8bfvp4ctV48u9N26UdirAFJlinZk6ADyz9Sutd3MmKikt4aH7ifTbbc5ijmdVDshXYetPP4HlYlNGiGhTsDVL4/NkSfJRjMb6lcOAqV7FDMJ6R0gI9zqETh6/BqxJ4eLpxvQZ92PrZomk/MN17wB/yacF6zosSWGqKLYxH41bniROX/qlwNR3BEV8dgAtrsDuDz9KEOwrj2V3wJarnmjM4ar6B+U0CDvNX1szHnCRm3CogcXc5S5yWEblrfCqikD5thK4yDpLM0kCduw6yO1C4sWbyUd+t4TzYKtpItLsqRjlPDzs22rR28l9zEMqT2eVnkMwfJtENhcx4muDuSl2DoTA1xSif0eDtATgZRfCAGiDHb2tP7SltKcYgbr3w2+/xa8eF7RKKzGek5VYCYWSapStRcaxALw7vmaFRvtrMLgAEgf5McQM5dDbvtmlcLvFwD1rCKKjWn3IftJLFdgI8dl4QbavEG+G4MSKg7MzxrzwNU9ac4H414IL1Hh+lQPIwZo
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UW9NNzl5MlBBZHlVU042TVZnYzFxWVNFR1VPSlpSc1BzRFFESzlDem9xa09u?=
 =?utf-8?B?Qm4rN0FWZ1lvNFVyNTFBUHVrbi94YUJZMmw3Sml6SXNhVkQwaFlLZzR4TUN1?=
 =?utf-8?B?Z2dvWGtSREhIcnIyQmN5bjVhYlNSM2FXSVpwQ29qNnN0dnp0N0dOYTJpUjg1?=
 =?utf-8?B?cEF2OHdVMVlxQ25VOVIwWi94NEpGdGZpR0hicGhEV3ExeFl4clB6S1FTTEp1?=
 =?utf-8?B?Q3E4ZWcrN1lNSDZHbTd2Q3I1elZKUDNWN0x3WTBZZ0oveUgvdDFzT2hjK0Ir?=
 =?utf-8?B?a25uWVJjLy9QaTA1Yjhhb2gydDBUR2xRR2VWTzRDWVAwVXFLYTEyZHV4NTFy?=
 =?utf-8?B?ZUo3WHByUzkyWDJrNUQySG9RTnhxbnpuM0NOT3M0dWFDVkJyQndHUHBHdnB6?=
 =?utf-8?B?TllHZjRKemo0Z2U3QnlGaFpQeVV5TGZiQmxTZDJFZzhCR0xtYlM1OENlWHZK?=
 =?utf-8?B?T3c5OTUvd2tLaklHVlMzdXB5OUdGOWtvTHBFMEdEcVExdmtmWGlMUnMrbFFC?=
 =?utf-8?B?U01hYmxqK1pkRFNya25SZHh4U3dXSStCUGJGUDVhUFMyUlEzV3QySDh6WE4v?=
 =?utf-8?B?dFZjR0YyNFNEOXQ1dEJidjhWK3g4RnN6QkREZ25DNHZWa2loV0w2VUEwR1p6?=
 =?utf-8?B?RUZ0bXkySEtqVEI3QVp2dTdJYnZyL0xvTjJWSFdYWDV3WkpRazhSVEY5azFI?=
 =?utf-8?B?bmtTUTdLb0pqdUlZUUdqa3VuL3hQZnZGREdOb0tyNXRwcmpodUNhUVFIajlt?=
 =?utf-8?B?VlBvU1E3dTRXVjUzQTlhVC9lcVJiOUExSGdBcTJoK0VmWnJkTnBKWmZmQzZD?=
 =?utf-8?B?K2p0MWFXbTErcURtdGNGUXdvc1A4N3NFSXNMZGMrTjNLcDlybm5yQXJrT0Iz?=
 =?utf-8?B?dEltRWg2SE1YMkVDL2pjMjRKVUROcDBYRnk5d2txM0w2RDdjTnI3a1NBRUNn?=
 =?utf-8?B?NW8rdFFmS2lYVHViakFMYTY0VXhlV1VXbWowSHE3cit4Y2pKUmErVm1kRmZ5?=
 =?utf-8?B?RjhDVGZ1UXZ0V2d2QmVkSWJTRkY4ZVlDYTJBNzZKSldvbDNJTWNUbnlHSHhC?=
 =?utf-8?B?R2s3RHdObGlCNDhaZ0RHZnlJRExnR2RtRGhUMnJqandWNzk3aGg4SHMySkNu?=
 =?utf-8?B?Rk15ZEpHOFZrbTZELzVCNzFhYUI2b1FaTFBrRkhOb0Q3RSt0NFBNQWNIUEYy?=
 =?utf-8?B?SGtoSHZrS0EybEE0YXJlWVRaS3dTVktKbTFMYzVON1dteTZYMjQ3a0YxZXk5?=
 =?utf-8?B?WkNYaWJ2SThFYTh1azJmbjdqSU5UdEhXdy9CMzQraitpWXJtbTRCMCtsdVZK?=
 =?utf-8?B?OGZJbEhKVitFdW9xdDVCc3QrcndyZzlOQkRFWTVPeklvNUswRnloZTcxOWpH?=
 =?utf-8?B?c2RGSlRkTlhUeng0RmZPTTU3dWE0b2xoeHBPWnFvVWNkMEUwV3RIZjZaTExi?=
 =?utf-8?B?NUFvR2NIRkJTaGdVRGhTWTlZSGVIL2xiYjlNOWh4K2JqVHJGUTNoRVBObC9s?=
 =?utf-8?B?K3lGaEN4L01OandqNDZ2eFVlUWhHYlJza3BLeGFHVklYYzcrUnlpL1ZEaFo3?=
 =?utf-8?B?c3BZTUN6cEpreERmcWFlNkdxdG54UC9OMVdFTENINmJZYklZenZkdHlrd2pp?=
 =?utf-8?B?Rkw3bVlRS0pGVlczY3J2OVhTY0pyUHhmVFVsM3VHekErazdYOGZWdll5UU1a?=
 =?utf-8?B?QmpmSlVRWmNXYkFGRmZjVlBuUXFJeDV3NG8ra0xlOHdhZzBRZjhVbk84V0p3?=
 =?utf-8?B?K1prTUw2S3ZhblpINmpCQ0tvV2xiUG13aGRnRi9DNVY1QTRFcGV5SWx3aHA2?=
 =?utf-8?B?eEpnRmluUFdULzdqalphKzNnTDduUjJocUI4VFh1dlZ0bUs0QXY1ZFYrbG54?=
 =?utf-8?B?NVJIdkNrNkRYZm1sV0xDWGRvdC9XdGpaVU1BS1JPb09GYVZDdEhrTXY1b2h3?=
 =?utf-8?B?VXRSL3poaEFMNUt4VDdjdnNOenVlWlJWTlFMaytGdFZtNFg1WjcxRmZTOGVR?=
 =?utf-8?B?U1ZVQkl6eWNRQ2NRQTF0Uk95Y3E2a3Zib2pwZVgrT0dtcDVtOWt1WlpHU3pC?=
 =?utf-8?B?NllUc1gwdDYyd1cxRWxTQnU4M05NNW1jdVBIUDA0eDliSGV0a2hpdHg4QlJZ?=
 =?utf-8?B?blpsbi9GM3YvZmEzTVVzZmlCeWx2ejIvZ21NQW5ERkNibDZHUERheFZOQ1V0?=
 =?utf-8?B?d1JveWg4TUdORzRKMmQyTGJrWWF5TFYvUDNBWHZjQ3lxNFRqamo3WU5aVi81?=
 =?utf-8?B?aGhzM05hRGFIczNDdGxVeU0xSUE3R0lYZlg4TUpid3BSRDlGQko4aDhmMFRa?=
 =?utf-8?Q?oBUZqxS0Fwy6lAN8fl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bfc12f8-4f3b-4b03-3e58-08dec1702b72
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 13:01:04.2077
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9sswc1IyYyZMFArML1nRTfAOvAk/86eZSMMDbMt7UdUZdqpgOuG1jDQ3ULkw2GmeXreIjg1O4RTLaNXY2rrHRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB7519
X-purgate-ID: tlsNG-c1860d/1780491676-B6975DB1-24DA512E/0/0
X-purgate-type: clean
X-purgate-size: 1988
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.90 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,valinux.co.jp:from_mime,valinux.co.jp:dkim,OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM:mid];
	FORWARDED(0.00)[mailman];
	RSPAMD_URIBL_FAIL(0.00)[os9p286mb7222.jpnp286.prod.outlook.com:query timed out,valinux.co.jp:query timed out];
	TAGGED_RCPT(0.00)[xen-devel];
	ALIAS_RESOLVED(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF074637CE6

SGVsbG8sDQoNCj4gPiA+ICsNCj4gPiA+ICsjaWZkZWYgQ09ORklHX0RUX0NQVV9UT1BPTE9HWQ0K
PiA+ID4gK2V4dGVybiBzdHJ1Y3QgY3B1X3RvcG9sb2d5IGNwdV90b3BvbG9neVtOUl9DUFVTXTsN
Cj4gPg0KPiA+IElmIGF0IGFsbCBwb3NzaWJsZSwgbm8gbmV3IE5SX0NQVVMgZGltZW5zaW9uZWQg
YXJyYXlzIHBsZWFzZS4NCj4gDQo+IFRoaXMgaXMgYWxzbyBwYXJ0IG9mIHRoZSBjb2RlIGltcG9y
dGVkIGZyb20gTGludXgga2VybmVsIDcuMCwgd2hpY2ggaXMgdXNlZCB0bw0KPiBzdG9yZQ0KPiB1
bmlxdWUgdG9wb2xvZ3kgZGF0YSBwZXIgQ1BVLg0KPiANCj4gSSBrZXB0IGl0IGFzIGFuIGFycmF5
IHRvIG1hdGNoIHRoZSBvcmlnaW5hbCBMaW51eCBzb3VyY2UsIGJ1dCBJIHVuZGVyc3RhbmQgdGhl
DQo+IGNvbmNlcm4NCj4gYWJvdXQgYWRkaW5nIG5ldyBOUl9DUFVTIGRpbWVuc2lvbmVkIGFycmF5
cyBpbiBYZW4uIEkgY2FuIHJlZmFjdG9yIGl0IHRvIHVzZQ0KPiBYZW4ncw0KPiBwZXItQ1BVIGlu
ZnJhc3RydWN0dXJlIGluc3RlYWQuDQoNCkp1c3QgYSBxdWljayBmb2xsb3ctdXAgdG8gbXkgcHJl
dmlvdXMgZW1haWw6DQoNCldoaWxlIEkgd2FzIGxvb2tpbmcgaW50byBtb3ZpbmcgdGhlIHRvcG9s
b2d5IGRhdGEgdG8gYSBwZXItQ1BVIHZhcmlhYmxlLCANCkkgcmVtZW1iZXJlZCB0aGUgb25nb2lu
ZyBlZmZvcnQgYnkgdGhlIHRlYW0gd29ya2luZyBvbiBDUFUgaG90cGx1Zy4gDQoNClRoaXMgaW50
cm9kdWNlcyBhIGRpbGVtbWE6IGR1cmluZyB0aGUgZWFybHkgYm9vdCBwaGFzZSB3aGVuIHdlIHBh
cnNlDQp0aGUgRGV2aWNlIFRyZWUgdG9wb2xvZ3ksIHRoZSBwZXItQ1BVIGFyZWFzIGZvciBDUFVz
IHRoYXQgYXJlIG5vdCB5ZXQgYWN0aXZlDQoob3IgeWV0IHRvIGJlIGhvdHBsdWdnZWQpIGhhdmUg
bm90IGJlZW4gYWxsb2NhdGVkIHlldC4gVGhlcmVmb3JlLCB3ZSB3b3VsZG4ndA0KaGF2ZSBhIHBs
YWNlIHRvIHJlY29yZCB0aGUgdG9wb2xvZ3kgaW5mb3JtYXRpb24gZm9yIHRob3NlIGluYWN0aXZl
IENQVXMgDQphdCBib290IHRpbWUuDQoNClNob3VsZCB3ZSBoYXZlIHRoZSBob3RwbHVnIHRlYW0g
cGFyc2UgdGhlIERldmljZSBUcmVlIHRvcG9sb2d5IGluZm9ybWF0aW9uDQpvbi1kZW1hbmQgd2hl
biBhIENQVSBpcyBob3QtcGx1Z2dlZD8gDQoNCkN1cnJlbnRseSwgdGhlIGZ1bmN0aW9ucyB1c2Vk
IHRvIHJlYWQgdGhlIHRvcG9sb2d5IGZyb20gdGhlIERldmljZSBUcmVlIGFyZSANCm1hcmtlZCB3
aXRoICdfX2luaXQnLiBSZW1vdmluZyAnX19pbml0JyB0byBrZWVwIHRoZXNlIGZ1bmN0aW9ucyBy
ZXNpZGVudCBpbiANCm1lbW9yeSBmZWVscyBsaWtlIGEgd2FzdGUgb2YgbWVtb3J5LiANCg0KV2hh
dCBkbyB5b3UgdGhpbmsgd291bGQgYmUgdGhlIGJlc3QgYXBwcm9hY2ggaGVyZT8NCg0KVGhhbmsg
eW91LA0KSGlyb2thenUgVGFrYWhhc2hpLg0K

