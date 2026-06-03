Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1i0dBs7gH2qqrgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:07:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38314635855
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:07:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=ZwHHgxLO;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325844.1591194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUgdG-0002DJ-Of; Wed, 03 Jun 2026 08:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325844.1591194; Wed, 03 Jun 2026 08:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUgdG-0002AJ-LD; Wed, 03 Jun 2026 08:07:22 +0000
Received: by outflank-mailman (input) for mailman id 1325844;
 Wed, 03 Jun 2026 08:07:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wUgdE-00029T-GY
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:07:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUgdD-006BEl-Me
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 10:07:19 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1fe0b1-5cb7-0a2a0a5109dd-0a2a450bd76a-24
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:07:18 +0200
Received: from [40.107.74.102]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1fe0b3-212f-0a2a450b0019-286b4a664d05-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:07:18 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYYP286MB3042.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:30b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 08:07:13 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 08:07:13 +0000
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
 b=QPmmVIMcmPm6Gqnz/G0FFvU1/aktMMEvyXMvunlqYWT8mxLETTkQqvVWOLBnm0dq7ZVkOvBnwSMvQtfyi13v1Tuw7r0/8sbd6eG6jpHOC64i13wTcXCYO3CwtVkEJtIVHzWeeLxIGtPQE3odH3DS8y6sac9B+ASDhRODhwjRLGWWxUytbCaFuClsxkObyKr7Kk8mSUER/sDHFEBeiB8ECf4xjYnnkbXj8SP07OdZ6WkrvqVxlnvr75Efw4Lj2T6dTDxTTVeFEmTNstKL+CEZ1Ta1w/FNF3EgMnGI2H1sKqUddXu/CxuWbpuAlT158E1TcwQ4ZEF4rcALb3k1Vu+izA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEHeTls/6xv5dycGuBcEyWGJTo+duUAmIXOHEGMdFZ8=;
 b=IMUMoUezTSYtdTUFOpp4zSHb9HtkMOya1do31ReeAlAm1LTtWPN9pA/Lpa2C4fjQYoVDA16iPr3adiVT1UBa8OrgM+gk2ErVPq3ae2fUk24g4hwL+zGgWuFCvde6J/IYkpbojUwLhpv1W9rr7iD1YjxLFkV9sJgMYqUr/YQ295Sv3W92e5avCTLqdqMBtRcOgM/W0IVfA3g/jihmGm53mHS+GdM+rwjrnd5eO64f6YsW/817Uwu22tmcl806COebe+uclyDo73jomqXB0QNg3QzsTmJ+BhTlO59i2hvA3zxK5Est4heeuKVqrac8FT+DkQW/mMwz8n0eo1fdxfQ4PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEHeTls/6xv5dycGuBcEyWGJTo+duUAmIXOHEGMdFZ8=;
 b=ZwHHgxLOBgpRk49rzLFZLalqN8uMVvnVj0o6FYOchoX2OyuxbdeWdGdOxLn0drFPArkuMjU/cpaAJxiHffdLAgLFNtzP/0oMJ7bBQlyuXN8yBNDeB9TgweEwe2iXNEmpws7JF5X4alUyK8asHVrsSSdypcVk2R5Y20cho5UWrP0=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 03/24] xen/arm: Introduce CONFIG_DEVICE_TREE_NUMA
 config option
Thread-Topic: [PATCH v2 03/24] xen/arm: Introduce CONFIG_DEVICE_TREE_NUMA
 config option
Thread-Index: AQHc8U+LMsab0l8GlEOATMpCtUjho7YrBYyAgAF2RoA=
Date: Wed, 3 Jun 2026 08:07:12 +0000
Message-ID:
 <OS9P286MB7222C05A5503819BD2489B5382132@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260531224755.9481-1-taka@valinux.co.jp>
 <20260531224755.9481-4-taka@valinux.co.jp>
 <accbb6c7-3681-41ae-a712-5f481bea9a5a@suse.com>
In-Reply-To: <accbb6c7-3681-41ae-a712-5f481bea9a5a@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TYYP286MB3042:EE_
x-ms-office365-filtering-correlation-id: 2e5cfbbe-b8f8-4b50-6bb6-08dec1471e68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|4143699003|56012099006|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info:
 C6ZV/Ud26wGQmLx8BCdlpKsCZhBg+bEXLtRgO1/XcnIjnJB/FkWX2iQLM5xqR/+Pli7RzOOYqhn7LHvyCfROzwrJAoHPd0vYGZbLyERdKy+mECAhLbuHRUmrZ8Fd3oATGbKadEf0V8EXGq4yYujnBssMh9TKiBEQ2+EqFxXGo0l28ybWm4q1sRb0lUpFo+AlFjy7xYWJQv1PdKat4u4uL5j/6hjfGd/pQ6iU7Cmjkp8QAv4WgMXLukngPF/4LWMuHaa4quB9lJzWBrdwJx2fm390i6TOmkNOWpdgNhnAOt8FV931AGU2OQ7t8BhmC0OAO4Lr+RN71YDSMRJHAQPyKNcvhs3Zcz7gtf9dPlBbTq0Vzp8pe4CmFrQAepxqqjRSgclajWegnqwNKqQ7cts+KK6rbJ55meqeCbCr/Nl9PoWnvDPbrF66ycBAFAfawvoBYwNxfuEuaiM4CZ8VKSKAxiIJRHbrXIlUFygqsdcKACBi+sYasg7GOwhQl/f8L74pZ7NvEf8wj+hnFgxu+lmrIT5Uv1iy3zGNGzTzRTOZUsnjOIbvr+fAOZSldNqSklO15dEQ6uniOeSHpdUxoOVbmqTRNuMs8jmWQNLB5m1eVPxzUIrtWbUOsb69D94rl0iKkqpCquhz+N71+YKPmq9R7xntZl1iECijYfjxrmKSPR20fuuk5JhFDVjsQJvjPAbfHH+mU9ggpwK1ZHUqE/7jOHwozm1xJ35zzuiRm3PJ3F2iItg2s4Ixd0Yd9xlfMt+e
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(4143699003)(56012099006)(22082099003)(38070700021)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aVNuSkVaaW4vWmdyek5DUGZVNVdLUXQxanA3cERUQ3EyTldWWGM1ZHFvZlhV?=
 =?utf-8?B?K29Mc1hjdElEeFVZZmFMd2xWUXJGTHhFUkE4bDVKSUdGRUhNT2kvR1ZsU2g3?=
 =?utf-8?B?NmtHSk9jN3E4dVlQeUU3Wjh1R2dLTkFFWGVFM1Npd08vSEgvMVdtQ0RXN3A1?=
 =?utf-8?B?QmliSUFGaHJBS2pwMzdHVmpmTXRzWGdhYXkxVHRjbjA5L2dUVU1idk1EdHFr?=
 =?utf-8?B?Y3ZKUWdhZmpPNHVFcG0ydjhxY0JXNVpqRTJrdTBDT2d4SmNuRzNXSTJVRzAz?=
 =?utf-8?B?d0Z0ckptb0dYUEZlNjNsbVV5S1I2K2pOR3FlVWJNbGpTWTRjb1hXK2huUWlV?=
 =?utf-8?B?YUVWcXU3ZktFd2RhMzlNUjJqTC9YWnh6RWg4ZTRRSlJTRkpnS1lsK0pnOTEr?=
 =?utf-8?B?MHE1YkY2L3dYblRaeVpmenRMZWF3NGRmR1lGSFdMY3pIRFpINlhPTzF0ZktV?=
 =?utf-8?B?Wm5XS25CVVZ6TUFRTUFNY3ZnODczeWRJdGxsV1plZEZmd0ZoN1NYS1BqbEha?=
 =?utf-8?B?bVlqQ0hIdEVGbmF2ZzNMc0cyZWk2WjZhU1pzTXpHWmV6dmI0TzZUMHc5SzB5?=
 =?utf-8?B?ZGd6SWU1YllBSGx0UTdiQ3dNNVd5aHhPRVJ3VGVUY0d5dTd6UjB2MnJDZmtH?=
 =?utf-8?B?THNoUmh2L3lqM25oZUxKOHdvMG9iWXFhQ3B4NVIwaStLdzhBZmMvbWVLTkwx?=
 =?utf-8?B?YzJsMXI3aWVzT2FlOXpzSFNnd0NvOHFrQkEyUDg3aktsMHpvY0x0SWlyZlpx?=
 =?utf-8?B?TGNrWDNGZW5xQU1wb2FJN3p1R2VVK2Z1aGNtTTg3NVk0aGRYdTF1VEJZK2kr?=
 =?utf-8?B?eFo5b0NSZ0dja2hqOVA4R0hISUVBYzRzK1ZSKzBJcUhoZmo5T0pzMVFnckZx?=
 =?utf-8?B?bDFvZ0ZOWG03MjZFZW5oTVl3aDhpazlmeERvM0pZRWUrcFZDMGxzWmdmb25z?=
 =?utf-8?B?UkZjbExsVlRaNnY2dW5MdHpvaUV5b2x4ZUduS0xtOWwrQ2VYKy9hQ1grd2g2?=
 =?utf-8?B?ckF6eDcxQWp5a3BOZnVGaDYwRUk4WXdPV3lUQXk4RzFmZUpqUUtuRjBCUm9z?=
 =?utf-8?B?bzlDR0pVc3VyckdyV2NYSUFST3JneCtQUVBDVGt0UUtDMitqMFlQcXVRRVlL?=
 =?utf-8?B?ZUhMLzVGV0wxZ25iQm4xS1czRlZuRUdNSDZmMVppVTlvdjdnRDJqMmxWZm9n?=
 =?utf-8?B?azFpNXdpZlJTbjFWVk1zNElxamJoQlo2Mm1Yc2twUjc0TjFzL1BuSndvaXVD?=
 =?utf-8?B?U0RabnBqMVRwOU5DRURNNzhqMm1manBuRGJIMllIM2RRZDZoMmRXZ1pKZmhS?=
 =?utf-8?B?WHlySVJmaksyWE5wMXlXYU9DRGp5cWJwMGRmclA5S3pZQ0c1WGFyOUpBckw5?=
 =?utf-8?B?YTVscGczcmxEdTMwUFAzRE9XNTkySTFYSXl2N3dWUlFhR3VjOEJLaGRDSkNO?=
 =?utf-8?B?SUJNQ1A2bTJwQi9qNjlvU0hSRXFNZGpHSkxwTm9yTnJadTAxbjQrbGtmN2Rn?=
 =?utf-8?B?OUtMbDUzVXRQZ1V3NS9jQUdlUlUzNEdFa3JmTVdGeUg1VGtvVlk1MmpDUVAy?=
 =?utf-8?B?RHR0TkJ0Zms0VFB5N0U4d1ZIUTJmMEl4MGVQUlBRZW16NTVZSDVxbnJzblpZ?=
 =?utf-8?B?dHpEQ21DMGxaTUNIZW5HbkxwNWdpUFhpTUtFQXVnSC9Gc096Uk9aVnNWNWtQ?=
 =?utf-8?B?VW9NVnloaXNZQ0tyNk9LMWxCUHpHWTVSWEM5TFI4SE9rSk5pdUFJMk5SZVVt?=
 =?utf-8?B?bFY2aDY1eHU5TmRlWHJqS2FEekFrL040c2ZrQ2c3R1NzSWNsMEpEN1JDSk5r?=
 =?utf-8?B?a29YMENuVXZYdEhQMmxabUZnOXlvdm1td1JRUS8zR2NmY1pMZU5BK25kL3ZG?=
 =?utf-8?B?WUFtTTFFUmNMUVFSZmpzbFdmQVIyWEZPenJPaFoxOGx5WTA1U1lBQ3MxcllM?=
 =?utf-8?B?MFgzbHdyc0Rqb2Qrd2RwczFmU0RJd1BEbXp6S2w4RXR3ellOVGdYYjh4dUVm?=
 =?utf-8?B?MzJ2Rkc0Qi9LdDRLMkJpazgrUzNYOTNKUlM4ZU9wVDBFeU5zbWxQSjgyMGV1?=
 =?utf-8?B?eEVXd28yWi9ZcnU0ZTZTK00zc0wzT3pkeG84WStRVkYyMEVIbWhTVGtzd0FL?=
 =?utf-8?B?N2thdkNESEtCVCtRZ0ExRjczUlI5UitZTWd2VllSN1hXV0N0bXJsSTVVdGR6?=
 =?utf-8?B?aEVYRUYwdWZmcGtmcU1QTWNtT2t3RFAxN3RzbzlZZDY1QnJyejNvRlo4Yi93?=
 =?utf-8?B?eWMwcDNvdGZzV0ltZysvcUtIaHZ1QWh6Y0psYVJBeXh6Nm4xTEtFbzM2RlJx?=
 =?utf-8?Q?lfOgjL8t7MCQilOnMF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5cfbbe-b8f8-4b50-6bb6-08dec1471e68
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 08:07:12.9911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OOfl9UzbBOWYdCMvZNmouoF9dLt6E/MUjF+sklEtty6TLeSeUpCu+gEygaqXNV2BEjOmYgQVWkIUDeADhkrlYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB3042
X-purgate-ID: tlsNG-42698a/1780474038-1A16DF3B-CE10947F/0/0
X-purgate-type: clean
X-purgate-size: 690
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM:mid];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38314635855

SGVsbG8sDQoNCj4gPiArY29uZmlnIEFSTV9OVU1BDQo+ID4gKwlib29sICJEZXZpY2UgdHJlZSBi
YXNlZCBOVU1BIHN1cHBvcnQgKFVOU1VQUE9SVEVEKSIgaWYNCj4gVU5TVVBQT1JURUQNCj4gPiAr
ICAgIHNlbGVjdCBERVZJQ0VfVFJFRV9OVU1BDQo+IA0KPiBOaXQ6IEluZGVudGF0aW9uLg0KDQpP
aywgSSB3aWxsIGZpeCBpdC4NCg0KPiA+IC0tLSBhL3hlbi9jb21tb24vS2NvbmZpZw0KPiA+ICsr
KyBiL3hlbi9jb21tb24vS2NvbmZpZw0KPiA+IEBAIC0xODgsNiArMTg4LDEwIEBAIGNvbmZpZyBW
TV9FVkVOVA0KPiA+ICBjb25maWcgTkVFRFNfTElCRUxGDQo+ID4gIAlib29sDQo+ID4NCj4gPiAr
Y29uZmlnIERFVklDRV9UUkVFX05VTUENCj4gPiArCXNlbGVjdCBOVU1BDQo+ID4gKwlib29sDQo+
IA0KPiBOaXQ6IENhbiB3ZSBoYXZlIHR5cGUgKCJib29sIikgZmlyc3QsIHdpdGggInNlbGVjdCIg
KG9yICJkZXBlbmRzIG9uIikgY29taW5nDQo+IGFmdGVyd2FyZHM/DQoNCk9rLg0K

