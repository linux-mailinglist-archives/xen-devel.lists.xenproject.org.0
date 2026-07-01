Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n6WIOZB4RWobAwsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 22:29:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 014846F1778
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 22:29:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=Op7I9dWO;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1350888.1608296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf1Y4-0006nw-Hy; Wed, 01 Jul 2026 20:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350888.1608296; Wed, 01 Jul 2026 20:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf1Y4-0006lc-FK; Wed, 01 Jul 2026 20:28:44 +0000
Received: by outflank-mailman (input) for mailman id 1350888;
 Wed, 01 Jul 2026 20:28:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wf1Y1-0006i3-QZ
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 20:28:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf1Y0-00BCNG-W7
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 22:28:41 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a457834-5cb7-0a2a0a5109dd-0a2a4505b3fa-38
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 22:28:40 +0200
Received: from [40.107.74.122]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a457874-3cb2-0a2a45050019-286b4a7a2c73-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 22:28:38 +0200
Received: from TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:363::12)
 by TY7P286MB6868.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:31e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 20:28:33 +0000
Received: from TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM
 ([fe80::9caa:1ff:d16c:e15f]) by TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM
 ([fe80::9caa:1ff:d16c:e15f%3]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 20:28:33 +0000
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
 b=xjZn1xJWkSpz7WVskK1qVrCYlisHDPeFPWvt66lf4pB3++KW0z1g6sDTXiJZIWt1MzLugKPEj0gSDXzEBqo0xwwvRVwtOlOX5faHEnlRMyrSVgQ7icMAjFyfIOD9mGHPE2/fA470zbe9S08+SEECXk/bleL3xGbNNvEvFps5Lbbn8AqmEo2eZnnChexP3dqOmqNmew10su/PuUKU6LeKHnVnjwGaG56OBi94OqZy4Bca42mI2goTWWAeQVa+1WmIS/3H4HJG1yKWd4o+Rjf7QIIDy5D2tQC7Y6StQEOFa1ocQOjE7hCXHJfm0XMlvWBLLKnckaA56mlmnAF2mUInoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZS228F3QXeflNqzA5oshsUqALsaBJFHT4qC4wRbMdFw=;
 b=hG8xEOyLj5+1sFRCAS6wuCYa+5x87szN5phhEI32OVWECNgHqRHDt6qrAokpNOgYO8W+Z5mBPS8vrLoQBXxRCR4+Te/JQ0KdONaPtYZlLkVAgzPXN/81WsrIwlTvUOHPbo1RYfPGNFMhqo/wTjokE3DlpCnJ9KeN7mZsRujuw8nIK65z66x/KMJUKdKwsZsLcswX2YDGuaedoQMN5yLaMe28ylTCyfJriI+9ulkRI88fL+6efCagNQLOTLh3GkuGFqJRVFj68IbHYpjOkr4NPDtvwfhX3kvXRA2qdJNOtGlxFP8PcHhEzWtZvq8U3EYdb6pN8ntz59WrOIP4atHUbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZS228F3QXeflNqzA5oshsUqALsaBJFHT4qC4wRbMdFw=;
 b=Op7I9dWOVaQNW5as2Ii8+swXU2BGuy/DjrpoXMuOg5L0s1EXybKwNFrq8AFqZ5RiNxrgf4ihiDYm4u0G8jTRH9pMl/rrcyiQ2pfLPy73kzXhVxvCt0POJfgLOyBBN8AM5pZHvkJSlXoJYp0joWxJpPpp4fMC+sGE1C5edD+VlAY=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 1/3] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Topic: [PATCH v3 1/3] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Index: AQHdCBJguMZzJpb/JEe22XtErI4LcbZWqjWAgAHISeCAABufgIAAi7BQ
Date: Wed, 1 Jul 2026 20:28:33 +0000
Message-ID:
 <TY7P286MB72346237AC47028E012D145382F62@TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM>
References: <20260629215806.11610-1-taka@valinux.co.jp>
 <20260629215806.11610-2-taka@valinux.co.jp>
 <97dd9fd5-c0de-4125-a40a-b7f6e1aed27d@suse.com>
 <OS9P286MB722293D7D09513349055BA4B82F62@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
 <a69129b1-f16b-4ce4-bf88-971f37eec418@suse.com>
In-Reply-To: <a69129b1-f16b-4ce4-bf88-971f37eec418@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7P286MB7234:EE_|TY7P286MB6868:EE_
x-ms-office365-filtering-correlation-id: 091419fe-5b5c-4080-8f46-08ded7af5232
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|23010399003|18002099003|38070700021|56012099006|4143699003|22082099003;
x-microsoft-antispam-message-info:
 2zlWeQgIKBiBOlmuLs7zT0VBP1IVjymx4plA/oTpWHXAPdlWtPM74273HxHBIxjRVEqs7Adx0ZYpxzR3VtC8rSFcjlXPre9P7FwY+DcH1B/oUWuhv9jUdu9lYXFlbaTKTaQUFtrRjvuPRTN4mQqlQTpvMljUPWLo1fmnkhbXAs8XnhpIyBbR4LyKJQGmeAjr3/0FSvF8AhdeIBFLxmqVELeNJcyuvjZ/P7lL5BmATatPao6EwF8gRy2couHpWjubDRFCtVIjj7l+n4ph5U+OpmQ/ZPf1eQgsI6UHLiA4cWbRGyFoogxHBB5x7z8MftCb9YGCpuy5vxa0WHFqhYGYJjEAew9Af67ctY90ydi5axJ6QphIn6iBITcMWh5bGL4/x0aO27CqNXSBK4BgVS8j/cGJMj+XDNykW/pm1qkxV1/KvKnnPbXdbqur7OmHpww+Td0WaQvCTPVeIHbvHbM7eJpRzXASOtz/RBtMl5itqKQ0tEXCp0obABcNCCKH0TJG60pKVakHr9pp6hwDKtzbPet9YiGjQUyU+B6bDjTgz3M26kQH+Tuz4mf+8oj9cVY4685spMVVB7Iq8XyywTB1urZFAC5JK1/etMOKK0jeV0+3qv1yMRKz9zA+oKu1T55aIXy3Y+hXwRX7D9FI80S4Q0bcW31cYE1vMRMiJcSCiB3+abqKvfc2SfRwOXJgdtYcljflVgVJ+8/r4P3OCyPO7M88u55OzOxA9AMkQyhkTGs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(23010399003)(18002099003)(38070700021)(56012099006)(4143699003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NGlrWnhTaGMzY0J3bSttcUFNWk9MV090dTF2d0l6ZzhIOVpuaGFYTUdCaVUv?=
 =?utf-8?B?REtRdjBTNzNkQzRYSC91cjE5ZUI2YzRHVkYva3BBbEY2eldCZUcwb1JJaW5G?=
 =?utf-8?B?U2ZzNG5xcDdFam9xRmZnZWZpNTFXMi8xOXNWbUhkQlhqWXU2R1hOV3dzT2Rn?=
 =?utf-8?B?SHhTQlJ6UnJFQVRwSG5WbnA2NVVERnNTZkg1N2tWM1o1K01ERUUvRUR5VWY2?=
 =?utf-8?B?WVdHbzRoMzlwRmpCTWhoemhZd2RNQytWdE5WcTJTVUpQSHpVcVczL2V5OG41?=
 =?utf-8?B?d3pPaTUrSS85QkxTcUtHSmNtS2RNT3lNOEJBMGxqMzQ0Y1JleUdPOWxuTWYr?=
 =?utf-8?B?S1Qranc2bXRhdXpxTk4wQnFoTWYvQk5SUjd0L04zRmFmQ3Q3ZjU5VFRWWVlL?=
 =?utf-8?B?WWN4aVlNbUVOQ3Z3R29Bam96WVZxMTNEVnlBVnpUb3U0ZnNkVmxRa3krRVRn?=
 =?utf-8?B?OTlpbU1pSEdmdGVweVNqcWRETmg5TXpueFEvdkR6MVZUT1dIaU9adTVHTFk1?=
 =?utf-8?B?WVdmUUZZR0lqRG5hUHdPcUlOVENSNitWN3JtRDFqWTF4T2RsTmppUFRiUWhu?=
 =?utf-8?B?Mml5d1hMak9ZMmhiN2VjdkgxdjBlWjROZUZOTWRDTFFGTmQyL0V3eWZmWTY4?=
 =?utf-8?B?RU9JaVFocCtCZ05WSms4TEo0dUxDQW1RcHZmVGZDSkpxTHluUERGUkhjOExZ?=
 =?utf-8?B?S2k2YldFTmtBajFiZ3FrYy9tNXVRanF1eFoxdm14YkZPM2dob3NEL0NxYzQv?=
 =?utf-8?B?bzBpdU5Ob0Q4UCs0TmdqVGdsejRNQUNubXRTNlU2OVMwNHRJcy9VTnJLNmdS?=
 =?utf-8?B?TEJneU1CUDJoK3hqcjRMK0lIL0JZbFZqTVFkWG1DTHgxVWhZOHczLy9YY0ky?=
 =?utf-8?B?d3VNM3RLcnhJS0hpc0hWNEpYbWUzdjJkODJlVmxHWkF1ODhWQ1U2NUY0K29k?=
 =?utf-8?B?MHo5a1FGNE9CSGNOcERQbmZHRjNJZGVabWxFdmRlU3FyUGZyemdHVjBQbVJs?=
 =?utf-8?B?NHZYK0c3ZXM4OFZ4UjNoTzArRWFmR3NNV2h1Mld5bW5Sd1J6N21KazlhZG10?=
 =?utf-8?B?RnBoZUNhVDZkSEx3TWxNUitLeHd0aXY2TlZ4NkZPSFFSaUJrTHljRVVTeGZF?=
 =?utf-8?B?VktEd0UrRXMyN3pKa2FpZ01VMXhxZGJqdTkxcVYrZXB6SmNXa1h3TDEzNkJ0?=
 =?utf-8?B?SE9QdUczK09nM1JTVDJJZnBlZFNrTjZIaXVaZzZ0Vk5iM1cvVkFwc3JzblJE?=
 =?utf-8?B?THZiQzhzYW9wU2N1V05HQm5wU2lZM0tFZElCc2l6b016RVArT0ZHUm9Eamc5?=
 =?utf-8?B?TExwcDRPVldHWWpKNWkzaTh4TGtJam1FYWpjN1ptRU50MWJUOUZtbEtmWVF5?=
 =?utf-8?B?dXlZM2NzeWl2NGtiM1YzVlcvT1R6NStaMTM3M0pMOWNIeklXN2pkWjRwUVgx?=
 =?utf-8?B?NFQwU0pINmRQNG9PSFlHMGZtbTYwQW1jY1NEN3VxanFVK1dPdW54ekpHK2tD?=
 =?utf-8?B?bHV4N1d5d2FjaENrbmE0YUpIS3owOGFqS2k4MEtJbXd6bHcrOEl2Z0UybWV1?=
 =?utf-8?B?b1h2c25KQkRxdWxicmtaYVBvQnpEckhlaEdjMjBHVnFxdzI0ZHlVakFWRy9s?=
 =?utf-8?B?UmMvSlpBRjlaTDN5SUFYME1ZUUhNNHg2VkhDM0RJYWFmQzEvcEl6enQ1eCth?=
 =?utf-8?B?cWR4NWlzUDFFTlUxNnNxU0VaY21qSitMT2VSQ29RRlRSbGdwcFMrcVJPNlhh?=
 =?utf-8?B?VzMxYlhBRmJsWFVJYnN0bmNxamdVUkdabm5oVGErOVA1NkUyb3ludysrUVA2?=
 =?utf-8?B?LzRMQXp3cVNaamQwYmlyVUlGam1VeFVkMzBIYVZGT0VIYmJTdWdvWlJyNUho?=
 =?utf-8?B?OFJBVTBGTERzRkR5UTM3dTk5VGtsRnkxcWR0aVVycTVyS05QK1ZYNkc0bUNo?=
 =?utf-8?B?RmtscElZQjl2ZHM0Y0ttOFBOY3dVbjFwVjhwNStFZHlRcml5MmVGSHFlckNx?=
 =?utf-8?B?RnpHRW1RRm94ZklTbG52UmFUWlhtMXMxT1I5czl5bk1Dc3ZJL3F3azYxUllm?=
 =?utf-8?B?WERMeXNuY3JxMlpibUc3dzkvR1hpQnQ0M0Q1dVgwSm4yMmdQaWlMMjN0Q1RN?=
 =?utf-8?B?RkxoNWtXNTVaQWMxcW9tSVcrU1dBN1NtQWFicmVaY3hKWVhZNDZCeWNRc1Uv?=
 =?utf-8?B?YzQwbmlkQW5BT3ltVDF1SjVnSmxBMFN0N1ZwL3ZYZE5BRVBCVUZ5ZmJMWTZv?=
 =?utf-8?B?cXBZRitsT3RHZHk0M1FFRGcwQnlSMWNXWTNRS2hBbHQzUStmYVhTSXB6RFNp?=
 =?utf-8?Q?5m2wRADiYNCZD9DP6p?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 091419fe-5b5c-4080-8f46-08ded7af5232
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 20:28:33.0917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5T93KgGoX0qdt4pxhb5zUFnqe1ZLJO00pPZjmmr0mN1Tr2DVgCuH3itzTe5CChOq4aCakLYK2iA37OLdFb6X3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6868
X-purgate-ID: tlsNG-c201ff/1782937720-0E5122B8-A5AECE98/0/0
X-purgate-type: clean
X-purgate-size: 2538
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.09 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 014846F1778

SGVsbG8sDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzNdIHhlbi9kZXZpY2UtdHJlZTog
UGFyc2UgJ2NwdS1tYXAnIG5vZGUgZm9yIENQVQ0KPiB0b3BvbG9neSBleHBsb3JhdGlvbg0KPiAN
Cj4gT24gMDEuMDcuMjAyNiAxMzoxMSwgSGlyb2thenUgVGFrYWhhc2hpIHdyb3RlOg0KPiA+Pj4g
K3N0YXRpYyB1bnNpZ25lZCBpbnQgX19pbml0IGdldF9jcHVfZm9yX25vZGUoc3RydWN0IGR0X2Rl
dmljZV9ub2RlDQo+ICpub2RlKQ0KPiA+Pg0KPiA+PiBQb2ludGVyLXRvLWNvbnN0Pw0KPiA+DQo+
ID4gRG8geW91IG1lYW4gdGhpcyBzaG91bGQgYmUgcmVwbGFjZWQgd2l0aCB0aGUgZm9sbG93aW5n
IGxpbmU/DQo+ID4gc3RhdGljIHVuc2lnbmVkIGludCBfX2luaXQgZ2V0X2NwdV9mb3Jfbm9kZShz
dHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmNvbnN0DQo+IG5vZGUpDQo+IA0KPiBObywgdGhhdCdzIGEg
Y29uc3QgcG9pbnRlci10by1zb21ldGhpbmcuDQo+IA0KPiBzdGF0aWMgdW5zaWduZWQgaW50IF9f
aW5pdCBnZXRfY3B1X2Zvcl9ub2RlKGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqbm9kZSkN
Cg0KVW5kZXJzdG9vZC4NCiANCj4gPj4+ICsjZWxzZSAvKiBDT05GSUdfQ1BVX1RPUE9MT0dZICov
DQo+ID4+PiArDQo+ID4+PiArI2RlZmluZSBjcHVfdG9wb2xvZ3kgKChzdHJ1Y3QgY3B1X3RvcG9s
b2d5ICopTlVMTCkNCj4gPj4NCj4gPj4gV2h5IGV4YWN0bHkgaXMgdGhpcyBuZWVkZWQ/IEl0IHZl
cnkgbXVjaCBsb29rcyBhcyBpZiBpdHMgcHJlc2VuY2UgbWF5IGhpZGUNCj4gYnVncy4NCj4gPg0K
PiA+IEluIHRoZSBjdXJyZW50IGNvZGUsIHRoZSBjb25kaXRpb24gaWYgKCBjcHVfdG9wb2xvZ3kg
KSBpcyB1c2VkIHRvIGNvdmVyIGJvdGgNCj4gY2FzZXM6DQo+ID4gd2hlbiBDT05GSUdfQ1BVX1RP
UE9MT0dZIGlzIGRpc2FibGVkLCBhbmQgd2hlbiBtZW1vcnkgYWxsb2NhdGlvbiBmb3INCj4gPiB0
b3BvbG9neSB0YWJsZSBmYWlscy4NCj4gPg0KPiA+IFRoZSBuZXh0IHBhdGNoIHVzZXMgaWYgKCBj
cHVfdG9wb2xvZ3kgKS4NCj4gPg0KPiA+IHN0YXRpYyBpbnQgc2V0dXBfY3B1X3NpYmxpbmdfbWFw
KGludCBjcHUpDQo+ID4gew0KPiA+ICAgICBpZiAoICF6YWxsb2NfY3B1bWFza192YXIoJnBlcl9j
cHUoY3B1X3NpYmxpbmdfbWFzaywgY3B1KSkgfHwNCj4gPiAgICAgICAgICAhemFsbG9jX2NwdW1h
c2tfdmFyKCZwZXJfY3B1KGNwdV9jb3JlX21hc2ssIGNwdSkpICkNCj4gPiAgICAgICAgIHJldHVy
biAtRU5PTUVNOw0KPiA+DQo+ID4gICAgIGlmICggY3B1X3RvcG9sb2d5ICkNCj4gDQo+ICAgICBp
ZiAoIElTX0VOQUJMRUQoQ09ORklHX0dFTkVSSUNfQ1BVX1RPUE9MT0dZKSApDQoNClRoaXMgbGlu
ZSBzaG91bGQgYmUgaWYgKCBJU19FTkFCTEVEKENPTkZJR19HRU5FUklDX0NQVV9UT1BPTE9HWSkg
JiYgY3B1X3RvcG9sb2d5ICkNCmJlY2F1c2UgJ2NwdV90b3BvbG9neScgY2FuIGJlIE5VTEwgZXZl
biBpZiBDT05GSUdfR0VORVJJQ19DUFVfVE9QT0xPR1kgaXMgb24uDQoNCnZvaWQgX19pbml0IGlu
aXRfY3B1X3RvcG9sb2d5KHZvaWQpDQp7DQogICAgdW5zaWduZWQgaW50IGNwdTsNCg0KICAgIGNw
dV90b3BvbG9neSA9IHh6YWxsb2NfYXJyYXkoc3RydWN0IGNwdV90b3BvbG9neSwgbnJfY3B1X2lk
cyk7DQogICAgaWYgKCAhY3B1X3RvcG9sb2d5ICkNCiAgICB7DQogICAgICAgIHByaW50ayhYRU5M
T0dfRVJSICJGYWlsZWQgdG8gYWxsb2NhdGUgbWVtb3J5IGZvciBjcHVfdG9wb2xvZ3kgdGFibGVc
biIpOw0KICAgICAgICByZXR1cm47DQogICAgfQ0KICAgICAgICA6DQogICAgICAgIDoNCg0KVGhh
bmsgeW91LA0KSGlyb2thenUgVGFrYWhhc2hpLg0K

