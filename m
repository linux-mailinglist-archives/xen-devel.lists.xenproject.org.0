Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PQ69NoHvLWoUnAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 14 Jun 2026 02:02:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0F6680149
	for <lists+xen-devel@lfdr.de>; Sun, 14 Jun 2026 02:02:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=tVEfMazv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1337663.1598974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYYHZ-0001sL-8I; Sun, 14 Jun 2026 00:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337663.1598974; Sun, 14 Jun 2026 00:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYYHZ-0001px-5X; Sun, 14 Jun 2026 00:00:57 +0000
Received: by outflank-mailman (input) for mailman id 1337663;
 Sun, 14 Jun 2026 00:00:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wYYHW-0001pn-2m
 for xen-devel@lists.xenproject.org; Sun, 14 Jun 2026 00:00:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYYHV-0028z8-30
 for xen-devel@lists.xenproject.org; Sun, 14 Jun 2026 02:00:53 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a2def29-e002-0a2a0a5209dd-0a2a45049b98-6
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jun 2026 02:00:52 +0200
Received: from [52.101.229.97]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a2def31-1dec-0a2a45040019-3465e561be13-3
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jun 2026 02:00:51 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYRP286MB4184.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:134::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Sun, 14 Jun
 2026 00:00:46 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0113.015; Sun, 14 Jun 2026
 00:00:45 +0000
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
 b=G3J1D0b0rwb+S4xV9Y8xqnI44yDVK/+U53piPLHsxEPM7Mp9aOYbQF8+DE17cvPI9n7MiEm2Bm70sku10ovAiVMqLxv1ydeQRN1JIYA50qktJotWtendHbzUiGyCd1TlyKYEIhtk3n3TPLcJ29U0fKvBZdccxjWEI9kcz+Qf9cZyDg2r4vtse5Kpn34r1r2Bs5y1eZ8dtGQCtJ6Mhk1hDl2CbRmeBjnHog7N2Tt0EzNcYh3rdse362tX2rcMSOsyNiGCFo+/QakiYmY26KJ5jvFeVGjERCH1KiGNixn1ixwUq0RAAFjmERzfDHqQMg78jCSmGzKJxJsG3ozfduF6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gju0G6BUGfrAIq1ITyKQaK2KGIOreDoLWj0WRHoJLtc=;
 b=D2qjYxdDKLEAY2DIza1jI2SEVsUkKNhS42RYLZGzrb50sXPr6MXFCMrPNX9ZOerNAJWKmqv0LZwZe0oSbhwfLQiaQkol1J9CTqgZ99yl8WtYEIExINUsUwm2loys6IM7ZF+wcsbms/6saYjZU+pv1Auo0bPKcl2nKSB60djvvNBYwKtsfXGH9BR22krWpYtk9/l2MS4JxMLmba3sAXmFgdAmPXkqt2BeCyTJ7vKhnFpZceeU60yrICAO4RTVgZJwhLQ4SrFelmXuebVjNhFm0tfDWehSs/TgfpyQnm+EOhY6HPAZMzDvFj1Det3k2vPdn8N9rSDRleR55epatLrMXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gju0G6BUGfrAIq1ITyKQaK2KGIOreDoLWj0WRHoJLtc=;
 b=tVEfMazvxcIf0fc5N1DwtY91np6/VEYljb8l4YR8eN99H+RFAP7Cyme5eoyuh9KRLVcmOUJu9u09hdh8xL3V9ALeN1GM4MgMyisXztu6bCmuEnuoVC8aeY8elOklOrJLXw5ctO+RB77vzYVukNwSNM4Ia22O4rTxyX0VzSajC2M=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: RE: [PATCH 1/3] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Topic: [PATCH 1/3] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Index: AQHc+MoozrCC9Pa1YkC7YJKVJ6P2UbY5878AgAGxwTA=
Date: Sun, 14 Jun 2026 00:00:45 +0000
Message-ID:
 <OS9P286MB7222B82D2DCF599215D9700B82E72@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260610111320.133784-1-taka@valinux.co.jp>
 <20260610111320.133784-2-taka@valinux.co.jp>
 <8d8b8bcc-7c59-4ea7-bafd-6469643f8aaa@xen.org>
In-Reply-To: <8d8b8bcc-7c59-4ea7-bafd-6469643f8aaa@xen.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TYRP286MB4184:EE_
x-ms-office365-filtering-correlation-id: 8fed48c9-e856-4255-9f51-08dec9a7fbd7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|38070700021|18002099003|22082099003|4143699003|56012099006;
x-microsoft-antispam-message-info:
 1RVCpzsYZXr7Cn6FL/auAJlICrsm40iDN7QImPAxu6sHFln4ZjsgZ0001ax6zTJZ+7lThQWXSqw9sg/hyaCErSQ7IpptU8Ir7ASQ4bBjyA/K1Wy/N9afKFh3FqHSaJzzo9eWSPcQRYGAxjqxt0zzB02ZFzick+M9JJabR+YrAS+ziKDCYIMT55VwGR/HOilFJ/ZP7NFc4+vbOcVUjjAQkSgcLnNY+3XwW6DnN8H9jnxyv+zF3UncJpGU6Xqn+q4+NleRKct+BvksfJ9yhdXNQK6glin+nQij74peBZVcw3kS89nGGvQl53F1E1BZ0PP6r3Tes6QbeUDJj2bx0ucLN5K75GXKyhGJVzzbFQM3PBrAMOXas72IwNWyJJirrG56jDapj5srGMMpabEhIqCkgL0qwpSje0qjfVd94Bhu5wMseB9sJERnVITfllkgb19dUEc+LEKhpW1e2MjQI4LLUac5jjekrnZSVl/eZmz099SI6eEgTNE7lsTVloRPT727c/cV+p59ehAiWQLuuDPpCiCXcEei+5U+kaDcPZygzwweXnMoVAAnaM41uOoG5WInYK5ArhyU/WMNwtNcENbg9/XxxwmwACkdHeZ0Wl6ksbMJcTZ4gp1DFLflzWGX27xtLHhHS09QevvAFEEaVhSpcFtF0E2xa4JSeOq5IHITz/7PboQ+sugMw+wn4KKm8BmErjc6ig0nY/icBoNWfhP792+5tZXOunTILAdQSFBUHiSdx2Vyq77LGmbOIwAWqyjD
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(38070700021)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N1h6bWZsajlXN2FtbnZFdkcwZ1N6Mjc3alBiUmRMTHBMdU1HL3MwZjBpNjlL?=
 =?utf-8?B?YkYxSHEzSGZIbGw4cklkU3liWTI2cFRlOFZIWllPSmp6TkJhZEdKcmN2VHJh?=
 =?utf-8?B?T202b0d3TDlnUncxeGxuSmwwc01ZNkwremVzcHQ0WUphaGdLUUVQNEJySFBy?=
 =?utf-8?B?STdJUGpZYW0weHVNVEdZa0V3aklKZVN4T2N0elRqSU4zMnlSeE84ZktGNGdt?=
 =?utf-8?B?R2JtRVduVWNFT0ptanQ0enVvN3BFSy9IQnB0bGNDbE1xUG0xeUxmc28wRTk0?=
 =?utf-8?B?ODFJaXpTaktnQXp5bkQydjBKSjROYmxVUXVqMXVLcGxibkw3bVpQYWl4b2tX?=
 =?utf-8?B?Ullja05ubllEMk9BK2I3YUlNTS83WWtvU3ErZzY2Sm1uQ0J2cER3TTF3N0t2?=
 =?utf-8?B?S2tnVjNvTTM1UnU1ZVJKcUttVTJmNnhEN1UyNGZ0RDRwS0QvSSs3UlhxU2pN?=
 =?utf-8?B?Ymc2WFN3NkRNRS9GQjh0TlpkOStSRnlVV3grMStpb2NvNG12YnZMcEplTmR4?=
 =?utf-8?B?V0x3NHZ3WENoWlRZUzUyUVhCR3FlQ0RzRVlHMWd5M3k3YVVUWDVMTElZYzlj?=
 =?utf-8?B?aFI2eUtRa3EyLzE3TG4valRROGdwWEtFa1ZnenNmekpHVnNzcEFsNTBDVVgv?=
 =?utf-8?B?RVVkVWlyOFArcWJOWmxEcllhWnVEK3lJVVJmYU1WeFlkUk5vYk1BR3BzaVk0?=
 =?utf-8?B?U2lCcHRoemZtUktmZkg0clFUOWNCL3RwbGp3QW44QU1PQnAwQ2dlMzZPL0tV?=
 =?utf-8?B?UEg2SE93a2o3U2s1Umd3emFrVUxpVm9lejEzSG9lTlBxZGZXeURsemdtL3Nk?=
 =?utf-8?B?eThOWW5WOFpOVllscUdFVFBTV3VpdUlSTWhPSU5sbG4xZlZCbGQ0b1ZEaWNa?=
 =?utf-8?B?dXlPdEs3YW1QUFBRYmNLdFRJRGZYOTVlMjdpdENsWkFseTF1eFJ6VnZEQjFu?=
 =?utf-8?B?WmZYbTN2bE82a2ZZMUpYR3g4NUowUU45L0hmOFJ3bVltWTU1anFFZ0wwT0ZE?=
 =?utf-8?B?NWo1QUR4QndlNlRHSnBOUklsTG5LdW12eEtXN3RGRmVwdTczdkE1cnFnaFU1?=
 =?utf-8?B?Vjh2dVBZWjEwTWlHWDBFNzlCaFo5KzNzTU1aYjJsMmFIMVBMWmY0djh0TVcw?=
 =?utf-8?B?V3ZyVi9FYmFaeGJiSkJ1V2t0dXI3VEIzQ0lmVkJSZDRQdjBzbytYSWlqWjVn?=
 =?utf-8?B?MDdSNUcyNFE4ZWl1OEhtNUVvQjN4aWgvVWtTSFg0WENyM1ZsblBJNU1DQUdG?=
 =?utf-8?B?Z0UvdWJFVjd4Z1Z6cUd5TXdJSG9jNWtiYXY1b2F1K1JyWC9tOS9oVVpTb1lZ?=
 =?utf-8?B?M2orYkJUMm1zMUhjREFvTnRyWHdlWnhzb2RlSEI3bU51Q01mbGJMeGRaVzhV?=
 =?utf-8?B?UWxtLzRzdGp3VmprNkxzTThlWkxyNlhOR2loMnorN1Q5bHFTNXBWYVNabkJP?=
 =?utf-8?B?clJ2N2hlRXorMkNpWmxRZnd3NDVDZFNiZm1YUnFqNjRzZU5zdzNPN1pmVUd5?=
 =?utf-8?B?WHVFNW9LOGNxdTFxc2RERzhSOW9QR2tKam1TUXNUTS93aDIxblNFMUFiSWpZ?=
 =?utf-8?B?bS9ScUZwQnFYWUw5TGt4dUpnNE9EK1RZZHJaZVNOYXFPS0tFdk11NXBMNmNI?=
 =?utf-8?B?VnpINE80ZnhuQ1I3VTRJWXRkZUNkN29VVjZBRmtIMUtpLzlmcDF2NFh4QStl?=
 =?utf-8?B?K3pTek45bmZkY1RUVkd1OEV4VDJpdGluTXlidnJ4RW1oNTQxQXAyZ0IySFhL?=
 =?utf-8?B?OC9VV28yOEttZU9DODc2WjJ6SGdBR2hmenhZcGx2emxzNituelQ4K2dsYmdC?=
 =?utf-8?B?czBXT2hFS1NEbm1PdHZpVVJtR0ZnNjNMQnFJdUJ2NjZEd2xpOEpQdEhqM0FI?=
 =?utf-8?B?T2hJS1p1ZDloK1pyc1Qrc0I3ZmoycmZGblRRbW1QVUpIUXhBVitGWTVGZm1W?=
 =?utf-8?B?UGVWaDVjdzFWUk9HYjZMblJKODRrblpacVZPQStEb1VXUU9xNm9vblNwWDEx?=
 =?utf-8?B?Y0ZwdFc0Q0xaKzE5UWtqbm1td3N0cHpIM2d1aFhKaXY0dHZMSFpKL0QvVWFL?=
 =?utf-8?B?akdYSjJzUzdtTmRkZUR5SVp5aUxrRUZleWphaWtrUG5SV042Y1FheGRjdzZx?=
 =?utf-8?B?NC9hZHM0cmlWYlRtTHRuc2FVRDVVTDJlb1V0cTNxZUl5Y0IvS1Byb0swcWhx?=
 =?utf-8?B?TDJBRzBPUHozenY4RjdHUG5OVjYxdFdPL2NIZ0VNaVVvTG9tdEdzZmJNbWRy?=
 =?utf-8?B?elJFRGlhRVRCc0Rid3VNWUQ2LytBUlNWWTNlekszc2ZzaWg4aC9tOVplNVFz?=
 =?utf-8?Q?IUIdSU1+gMNcIvs3A4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fed48c9-e856-4255-9f51-08dec9a7fbd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2026 00:00:45.4878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +8eaYuIB0/A2XyHNFb2mb760BpWHV6xUCS4qlpl6o7vkovzg3Xl3IL54tkG4XHelyL5z5iyhJu++DWTvUto3fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4184
X-purgate-ID: tlsNG-ebf023/1781395252-4014E3FF-FDCD2867/0/0
X-purgate-type: clean
X-purgate-size: 3524
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB0F6680149

SGVsbG8sDQoNClRoYW5rIHlvdSBmb3IgeW91ciBhZHZpY2UuDQoNCj4gPiBkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9jcHUtdG9wb2xvZ3kuYw0KPiBiL3hlbi9jb21tb24vZGV2
aWNlLXRyZWUvY3B1LXRvcG9sb2d5LmMNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGlu
ZGV4IDAwMDAwMDAwMDAuLmJiZGYwZDFmZTgNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIv
eGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9jcHUtdG9wb2xvZ3kuYw0KPiA+IEBAIC0wLDAgKzEsMzQy
IEBADQo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyICov
DQo+ID4gKy8qDQo+ID4gKyAqIERlcml2ZWQgZnJvbSBMaW51eCBrZXJuZWwgNy4wJ3MgJGRyaXZl
cnMvYmFzZS9hcmNoX3RvcG9sb2d5LmMNCj4gPiArICogUGFyc2UgY3B1IHRvcG9sb2d5IGluZm9y
bWF0aW9uLg0KPiA+ICsgKg0KPiA+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjYgVkEgTGludXggU3lz
dGVtcyBKYXBhbiBLLksuDQo+ID4gKyAqIEF1dGhvcjogSGlyb2thenUgVGFrYWhhc2hpIDx0YWth
QHZhbGludXguY28uanA+DQo+IA0KPiBXZSBkb24ndCBjb21tb25seSBoYXZlIGNvcHlyaWdodCBo
ZWFkZXIgaW4gdGhlIHRyZWUgYW5kIGluc3RlYWQgdXNlIHRoZQ0KPiBjb21taXQgbWVzc2FnZSB0
byBrZWVwIHRyYWNrIG9mIENvcHlyaWdodC4gVGhhdCBzYWlkLCBpZiB5b3Ugd2FudCB0bw0KPiBr
ZWVwIGl0LCBJIHRoaW5rIHlvdSBvdWdodCB0byBrZWVwIHRoZSBjb3B5cmlnaHQgZnJvbSBMaW51
eCBiZWNhdXNlIHlvdXINCj4gY29kZSBpcyBiYXNlZCBvbiBpdC4NCg0KT2ssIEkgd2lsbCByZW1v
dmUgdGhlIGNvcHlyaWdodCBsaW5lcyBmcm9tIHRoZSBoZWFkZXIuDQoNCj4gPiArI2luY2x1ZGUg
PHhlbi9jcHUuaD4NCj4gPiArI2luY2x1ZGUgPHhlbi9jcHVtYXNrLmg+DQo+ID4gKyNpbmNsdWRl
IDx4ZW4vZGVsYXkuaD4NCj4gPiArI2luY2x1ZGUgPHhlbi9kZXZpY2VfdHJlZS5oPg0KPiA+ICsj
aW5jbHVkZSA8eGVuL2NwdS10b3BvbG9neS5oPg0KPiA+ICsjaW5jbHVkZSA8eGVuL251bWEuaD4N
Cj4gPiArI2luY2x1ZGUgPHhlbi9kb21haW5fcGFnZS5oPg0KPiA+ICsjaW5jbHVkZSA8eGVuL2Vy
cm5vLmg+DQo+ID4gKyNpbmNsdWRlIDx4ZW4vaW5pdC5oPg0KPiA+ICsNCj4gPiArc3RydWN0IGNw
dV9tYXAgew0KPiA+ICsgICAgdW5zaWduZWQgaW50IHRocmVhZF9pZDsNCj4gPiArICAgIHVuc2ln
bmVkIGludCBjb3JlX2lkOw0KPiA+ICsgICAgdW5zaWduZWQgaW50IGNsdXN0ZXJfaWQ7DQo+ID4g
KyAgICB1bnNpZ25lZCBpbnQgcGFja2FnZV9pZDsNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0cnVj
dCBjcHVfdG9wb2xvZ3kgKmNwdV90b3BvbG9neTsNCj4gDQo+IExvb2tpbmcgYXQgdGhlIHVzZSBp
biB0aGUgb3RoZXIgcGF0Y2gsIHlvdSBzZWVtIHRvIHVuY29uZGl0aW9uYWxseSB1c2UNCj4gY3B1
X3RvcG9sb2d5IHdoZW4gQ09ORklHX0RUX0NQVV9UT1BPTE9HWS4gSG93ZXZlciwgeW91IGRvbid0
IHNlZW0gdG8NCj4gZmlsbCBpdCB3aGVuIHRoZSBzeXN0ZW0gaXMgdXNpbmcgQUNQSS4NCj4gDQo+
IFNvIEkgdGhpbmsgdGhpcyBlaXRoZXIgbmVlZHMgdG8gYmUgbW92ZWQgdG8gY29tbW9uIGNvZGUg
YW5kIGZpbGxlZCBieQ0KPiBBQ1BJIG9yIHdlIG5lZWQgdG8gbWFrZSBjbGVhciBpbiB0aGUgbmFt
ZSB0aGF0IHRoaXMgaXMgRFQgc3BlY2lmaWMuDQo+IA0KPiBbLi4uXQ0KDQpZb3UgYXJlIGNvbXBs
ZXRlbHkgcmlnaHQsIGFuZCB0aGFuayB5b3UgZm9yIHBvaW50aW5nIG91dCB0aGlzIGdhcC4gDQpJ
IGFncmVlIHRoYXQgdGhlIEFDUEkgcGF0aCBuZWVkcyB0byBiZSBwcm9wZXJseSBoYW5kbGVkLg0K
SSB3aWxsIGZpbGwgdGhlIGNwdSBpbmZvcm1hdGlvbiB3aXRoIHRlbXBvcmFyeSB2YWx1ZXMgZm9y
IG5vdyB0aG91Z2ggdGhlIGdvYWwgaXMgdG8NCnBvcHVsYXRlIGl0IGJ5IHNjYW5uaW5nIHRoZSBB
Q1BJIFBQVFQgKFByb2Nlc3NvciBQcm9wZXJ0aWVzIFRvcG9sb2d5IFRhYmxlKS4NCg0KPiA+ICt2
b2lkIF9faW5pdCBkdF9pbml0X2NwdV90b3BvbG9neSh2b2lkKQ0KPiA+ICt7DQo+ID4gKyAgICB1
bnNpZ25lZCBpbnQgY3B1Ow0KPiA+ICsgICAgY29uc3QgdW5zaWduZWQgaW50IG5yX2NwdXMgPSBj
cHVtYXNrX2xhc3QoJmNwdV9wb3NzaWJsZV9tYXApICsgMVU7DQo+ID4gKw0KPiA+ICsgICAgY3B1
X3RvcG9sb2d5ID0geHphbGxvY19hcnJheShzdHJ1Y3QgY3B1X3RvcG9sb2d5LCBucl9jcHVzKTsN
Cj4gPiArICAgIGlmICggIWNwdV90b3BvbG9neSApDQo+ID4gKyAgICAgICAgcGFuaWMoIkZhaWxl
ZCB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yIGNwdV90b3BvbG9neSBhcnJheVxuIik7DQo+ID4gKw0K
PiA+ICsgICAgaWYgKHBhcnNlX2R0X3RvcG9sb2d5KCkpDQo+IA0KPiBTdHlsZTogQUZBSUNULCB0
aGlzIGlzIGZvbGxvd2luZyBYZW4gc3R5bGUuIFNvIGl0IHdhbnRzIHRvIGJlOg0KPiANCj4gaWYg
KCAuLi4gKQ0KDQpPaywgSSB3aWxsIGZpeCBpdC4NCg0KVGhhbmsgeW91LA0KSGlyb2thenUgVGFr
YWhhc2hpLg0K

