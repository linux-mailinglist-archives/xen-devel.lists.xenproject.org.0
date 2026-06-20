Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pc3RNDMkN2puJgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 21 Jun 2026 01:37:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC44E6A9E14
	for <lists+xen-devel@lfdr.de>; Sun, 21 Jun 2026 01:37:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=kjBFmL6u;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1343172.1602774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wb5EV-0002Rh-LW; Sat, 20 Jun 2026 23:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343172.1602774; Sat, 20 Jun 2026 23:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wb5EV-0002PQ-IQ; Sat, 20 Jun 2026 23:36:15 +0000
Received: by outflank-mailman (input) for mailman id 1343172;
 Sat, 20 Jun 2026 23:36:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wb5ES-0002PJ-CS
 for xen-devel@lists.xenproject.org; Sat, 20 Jun 2026 23:36:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wb5ER-000ymL-9q
 for xen-devel@lists.xenproject.org; Sun, 21 Jun 2026 01:36:11 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a3723ea-2eae-0a2a0a5409dd-0a2a4506e616-0
 for <xen-devel@lists.xenproject.org>; Sun, 21 Jun 2026 01:36:10 +0200
Received: from [52.101.125.76]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a3723e8-b690-0a2a45060019-34657d4cb528-3
 for <xen-devel@lists.xenproject.org>; Sun, 21 Jun 2026 01:36:10 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY7P286MB6359.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:32d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Sat, 20 Jun
 2026 23:36:04 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Sat, 20 Jun 2026
 23:36:04 +0000
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
 b=UjJwTnh6u24GsCpvwwAGbG/jti5Gey8jmdWDK+GRmn0pg5auQptKJnMbkxF/kDD44LCHPCAvNZP22885/Y6srzmKshf/wczSNWYPwTMiP6Q14YKc+eFAq+tFb/Ttq2I2L6UUUPTKlyr/PYATPVFx2mybI83GeIOaxQsSQl6p0+4qW90o0n9z2YR7EGjcLoXzM2R3lHmPrZ+OwNyZaccEYNpjqaVPnC5oA5xTgqXjH1Xho84997pChu9hWoYBz6DIov344ihYUfzSZbp7g/YVTTn2izKZdg/+RkPwZ8pA+M65VdBrmWm2Rc4r/dvIHKoyi9G3Y/BvJicEYR0DakzJ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vH3P33ueemtZInBVOlThXMOcigARtXIntLobwA/G+8s=;
 b=qnHOLtfYLkSaD/U/nPJDyL59aW0bi6sdxpttuZvE/aElbc/TECTRVdoCyLNpPdpHVbpf1CzbXFbF20u/Xza1Uw6fba+aJdEDjit5EohiltXe08z81WdYW9Kl5LWX6Tesd9Z0IvG+EKb+dGiSAlQ1J5ciAUU5l5bnr6f5oUz2LNHjphnCfU6awFRWlPSjRnuiJCzLeWsBz7vjXJ/FU3DUJ2eGVo5Y9nMd5K7/vHDtqX2LeAO1XVOe19AgzjjF2srdrMqpYrtmcH9Sp2rvHFsUzVbCCTUSb5ywUcpnXJw3X8vJLaRw5cJ2cUN0aEEpwY3HxLFQ7FAsiAVQ7kggp5NFlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vH3P33ueemtZInBVOlThXMOcigARtXIntLobwA/G+8s=;
 b=kjBFmL6uAXlODEHzL0EXSpy7xUKSyTj3HLy/onRGGOT9bnJne0FS+PZ5lo5oSHzlIPJqOhYTdplGyI8j+x8y0vQj+TO5vdPFCToibAKtrpt7kXKM1k+7BPqROlXwoPYEvBMrDIlUhFRN3//yrnChB/EQ1IiNa/iMykqSAmmDJac=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 07/22] xen/device-tree: Read NUMA node distance from
 Device Tree 'distance-map'
Thread-Topic: [PATCH v3 07/22] xen/device-tree: Read NUMA node distance from
 Device Tree 'distance-map'
Thread-Index: AQHc/8BKTM3OweAnP0qpxuJk/PcKwrZFkCwAgAIwFqA=
Date: Sat, 20 Jun 2026 23:36:04 +0000
Message-ID:
 <OS9P286MB7222340F4909B9873B89D45082E12@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260619075011.377116-1-taka@valinux.co.jp>
 <20260619075011.377116-8-taka@valinux.co.jp>
 <926d2a7a-e278-4c3a-b168-aad003da6652@suse.com>
In-Reply-To: <926d2a7a-e278-4c3a-b168-aad003da6652@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TY7P286MB6359:EE_
x-ms-office365-filtering-correlation-id: 3d86f41e-2fa6-432f-e8f4-08decf24b206
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|38070700021|22082099003|18002099003|4143699003|56012099006|6133799003;
x-microsoft-antispam-message-info:
 Px6vImttOIhvTzorSMgbvAjiI++fimbsVOmDRPzU6VuaSfUnXu89k0csoyD9cyn1AmvXjXBr5mDGSxYagIB9nFStl9OOoWK1SsO+9kCaOnCW+9EXGI69rX3FOn9qv3SrCWaQG/HCxtnQ9WGTZiJw6E/qw8ERdB+OhNw5ShQUrSDpCsHa+oSOaX4rmk8MqN5nzJfs15WdhOXjwRdw9/7yIrXK7IS7Xw0hGU2vxLMJdlNmr3ul3d1Z4yum+Ecpcwfw5n+bYz+8Ep5hGAJs3Wsn0I0tDcpDyh8XkysblHzkmXy/6Po+QG8GqByio9Xv0Dl8crG+Y90vu15Y5ro7NFN4p8r45vGhmtG4A0jePi6FhlohdmOy7Q1XFlu2a859slLH0NCp7FNk+cRVQtGCsixX9HfOYj4WHDbqZFg0DaVr2zKeF2FbgsvF1+BNKibfxvPIv6PY+y3NA8ZzjltH40uSAqM5R+k93NghtKZDuNVAlCMmN/nuL4OntwjuasInzgjUfvNM2FlR2uJ8Xbc+pCkCVTbz8UaGkRAUixSZ8bt7NGs2DAttltOwjdeO4XwC50zP+b0ifmCsBVBgDnTZ5OKGT2UrouGscHk3+PQEjXXb2oZGaXJgLA3MvIDGBtieZmGFT4NxranDTsJDBuQ4XP71tcRZ6dfZwefVYbNAelDjspP+cTzI09O+x19y9zCoQiCKgz3IJ/7yGPLo+rVAvSCvk3ABcTjkWRLAj6tC128A0hU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RDUvMFBwSE1EamJpY3RQRWtqV2pjRk53NmQ3MmtTNkc2WmlkVkhFMzZqVTN1?=
 =?utf-8?B?OHBkRElFNlIwK1FYS0k1dTkraGNGOGljMXJhTUY4dTZwcXJWeTVlOEF3UWw5?=
 =?utf-8?B?Qi9ZNURxby9PZHU2cFdiSlVOTDc1SUNnaVF6YnArK2hBbitqMVBMVngydXlW?=
 =?utf-8?B?SXRWbTYxS0hPNTNmZnRxaGJCQ2R1V1pCQ1E0NTRjSEVuNFpRSUcxSlF1bTVV?=
 =?utf-8?B?NVJPWkdoNTFGYnhoNGRzeFJJN2pRWUVTOHNFeWY2L1J1QmJTYjM3ZXc5WlNv?=
 =?utf-8?B?d0ZncmJ0NnBtTURkRnFyeVNDV2VMVldnMUM2andOd3JlZ1FuV0JTSjk2aWNk?=
 =?utf-8?B?UUZWMHRsZTBCbXBlL0N1T2d3RTd6Uk4xdk9pLzZmWWNsZmMzQ0FrRXk2OXhk?=
 =?utf-8?B?NGxBYjB3ODA1aDgxTzE4dFZ2YVVrV2JjempuUU5PRy9zcjdUdGVvWmdwS09D?=
 =?utf-8?B?MG5ub1Q3OVZ3R2NhNjBoSU15RDRGWXdPWGVwbzllck0xWTB2OGl2R1plTEZS?=
 =?utf-8?B?eFNocG1zdzNqRFNCNHZUbzJEU3hkUUIxRU1TbjNmZ0ptZU50UUcwbFpwR2g1?=
 =?utf-8?B?bXhvRm1maDZNbU9pb3V1YzcxelY3U0hsUTVWOG9TcHgvWjdvRVprV1pkZ1Jv?=
 =?utf-8?B?TDd4NDZiUldUbXBBMmg1TTZkc3FCdHM0a3JKa3c3TzNwb1VvSHd2NWdUL2Rz?=
 =?utf-8?B?dVNQVERTR2dNZzcyY1dYYzFKL2xYcnhpOUNKY0hYTVRqV0xMaVIyRzlscVhp?=
 =?utf-8?B?YXBTZzY1TzZ5NEhWTW1kRkFrZVB5b2FFQjRvRDBrL21GWVNhWktyQjRJSnZv?=
 =?utf-8?B?cHJOOTd4S0NRU3crMWNXM3lnNkVGOHgxb3Q3L2NwUkJqU2NndFpNaEloRjRm?=
 =?utf-8?B?QkhTOWJ1VUZTZWJaNUVHOThZckJuVUtESkVETVdSWVFlQzd3S09jTmtrQnlv?=
 =?utf-8?B?NDlTcjUrTXZDWWtRZy9oVzJ0VXFocmpJRmF6Ly9YT1dVNWJpTGdGTlJKMDVh?=
 =?utf-8?B?aWwwY2Ywa0RVM0dyVnZ5SHpPNk1iRFRrRjRNcDEzT3pIdXFiRzBSYVBJd2JI?=
 =?utf-8?B?TkxFcEhaQjlMUVBUSnZSUEJLZVppU21SY1NIYkZlWEVJWG5rUm5VeEczK2hZ?=
 =?utf-8?B?aXpUak1CUUZSS3grUVJ5a3JxTnVhTkY4Z1Rhc0J4OGNuUW5pZ2VVcjVHZVln?=
 =?utf-8?B?Nk1mQnJsNWtsRHkybEg5dDNSY3NLMnYrMTA3NXhRMTRod0lWdWszVWZFRVl3?=
 =?utf-8?B?VDdvZWRaR0s2Vzl2bVhteHgvSUpZT2d2RklPa0RSSC9QbXRBVEpYTFcvazJJ?=
 =?utf-8?B?cWN1cHI4clQ3b1ZzdkR4R1g2MTduclJnbG0vaEtOMG8ra2JoWDYzVnY4Umtv?=
 =?utf-8?B?WituVG1BTjRhNzRUSlRyUjJsdDZTSWZrVk9IdkRhUWd2a3gzeSt2SlVGKzZT?=
 =?utf-8?B?UXRmaXFFcFdZMzlXMWwxV28wN0czOGhMS3ZhMUQyZlRndkpUUHdLaFpycWIz?=
 =?utf-8?B?Q3V6ZktoaGJzaEJqMTdZVUpJa0xGVXF1b1RLZDMrc3RNci9LcHlWT2orNURR?=
 =?utf-8?B?dkVMa2h3dHpPakI4TWd4VUJxbnZOQUwxVGM2UUx6ZEhoN3c0WldvS3AzMjVP?=
 =?utf-8?B?dFcxNGpkcm54c05RVnZ6djdDZHRkQ1hUNlphUVhaZ3JacDY0YVlGTFAvaDdZ?=
 =?utf-8?B?ZlNwWmh2RTVNU21hRmFFdGpvU21oMnhxWm85SFZmYkhxTWRiblZ1NmFxK3ds?=
 =?utf-8?B?aWx0UnBPd3pZUjQ0QXhWbFBndWxsbEpieVVkWWRWK016MHBTSXU0RE9Fc2NH?=
 =?utf-8?B?TjdtdVQweUdSWHRidnpLZzJJcGd4NDJ3ejZPb1hZend4emNLQjlXdCtKQ0My?=
 =?utf-8?B?RW9VZlV0NGNzZjB5YS9Hc2t0M1VVOTJvN2VlOFVSYno2YklxRWpvYzU5M3Qv?=
 =?utf-8?B?UHZHNXBVbmdXM2JpcUp1ODh1NlltRVFGbHNXT3RPVnBVOTZrRko4L3ZQVEpT?=
 =?utf-8?B?N3Zmak83QXNwS0Irb3o5NkxhRGFRN09UTFBiQU92Q2xWSG85SUZyeTE0TEhY?=
 =?utf-8?B?SDZmUkx6NEg5UVIybFZERjRueU1TV2gzaFFhb0hwRk53M3pCN25BTC9RYmxs?=
 =?utf-8?B?Zko5WDdpaStRMnlEaWI1UXltS2krVDJiNnRzZDNtZitMaHk5YUE5cEU0VGVt?=
 =?utf-8?B?QjN1RVQ1K0VwcFRYY0NrcEZnM1Z5ckd5a0hYKzgvOXJDeUZpUW1uZ1RLdSsz?=
 =?utf-8?B?ekYzNnlPcGN4c1EyQ3FLb0hSc0ZZaHpFM0JjdXFOZjQ0Y2lOTmg3dzc0L2FX?=
 =?utf-8?Q?+eQgVMaf6dw52l8S94?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d86f41e-2fa6-432f-e8f4-08decf24b206
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2026 23:36:04.5285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GzvPhlab37zLWV7PI0WjBAT5xo+yOhY5iaI1HkpyvZ017dSKWdTLfIajuSIQ0LiL8wXddj1NX3C/J9Ou6uv/eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6359
X-purgate-ID: tlsNG-16d1c6/1781998570-B33ED853-253EC341/0/0
X-purgate-type: clean
X-purgate-size: 7974
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM:mid,valinux.co.jp:dkim,valinux.co.jp:from_mime];
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
X-Rspamd-Queue-Id: EC44E6A9E14

SGVsbG8sDQoNCj4gPg0KPiA+ICsjaWZkZWYgQ09ORklHX05VTUENCj4gPiArICAgIG51bWFfZGlz
dGFuY2VfdGFibGVfaW5pdCgpOw0KPiA+ICsjZW5kaWYgLyogQ09ORklHX05VTUEgKi8NCj4gDQo+
IEdlbmVyYWxseSB3ZSBwcmVmZXIgdG8gYXZvaWQgc3VjaCAjaWZkZWYtYXJ5IGluIG1haW4gc291
cmNlIGNvZGUgYnkgcHJvdmlkaW5nIHN0dWINCj4gKGlubGluZSkgZnVuY3Rpb25zIGluIGhlYWRl
cnMuIFlldCB0aGVuIEknbSBub3QgYW4gQXJtIG1haW50YWluZXIgLi4uDQoNCk9rYXksIEkgd2ls
bCBhZGQgc3R1YiBpbmxpbmUgZnVuY3Rpb25zLg0KDQo+ID4gKy8qDQo+ID4gKyAqIFBhcnNlIHRo
ZSAnL2Rpc3RhbmNlLW1hcCcgbm9kZSBmcm9tIHRoZSBmbGF0dGVuZWQgZGV2aWNlIHRyZWUNCj4g
PiArICogYW5kIGV4dHJhY3QgdGhlIDMtdHVwbGUgdHJpcGxldHMgPGZyb20sIHRvLCBkaXN0YW5j
ZT4uDQo+ID4gKyAqLw0KPiA+ICtzdGF0aWMgdm9pZCBfX2luaXQgZHRfbnVtYV9wYXJzZV9kaXN0
YW5jZV9tYXAodm9pZCkNCj4gPiArew0KPiA+ICsgICAgY29uc3Qgdm9pZCAqZmR0ID0gZGV2aWNl
X3RyZWVfZmxhdHRlbmVkOw0KPiA+ICsgICAgY29uc3Qgc3RydWN0IGZkdF9wcm9wZXJ0eSAqcHJv
cDsNCj4gPiArICAgIGNvbnN0IF9fYmUzMiAqbWF0cml4Ow0KPiA+ICsgICAgaW50IGVudHJ5X2Nv
dW50Ow0KPiA+ICsgICAgaW50IG5vZGU7DQo+ID4gKyAgICBpbnQgbGVuOw0KPiA+ICsgICAgaW50
IGk7DQo+IA0KPiBOaXQ6IFBsYWluIGludCBvbmx5IHdoZW4gdmFsdWVzIGNhbiBhY3R1YWxseSBn
byBuZWdhdGl2ZSwgb3Igd2hlbiBub3QteWV0LQ0KPiB0aWRpZWQtdXAgY29kZSBlbHNld2hlcmUg
KGUuZy4gbGliZmR0IGhlcmUpIG1ha2VzIHRoaXMgbmVjZXNzYXJ5Lg0KDQpPa2F5LCBJIHdpbGwN
Cg0KPiA+ICsNCj4gPiArICAgIG1hdHJpeCA9IChjb25zdCBfX2JlMzIqKXByb3AtPmRhdGE7DQo+
IA0KPiBOaXQ6IEJsYW5rIGJlZm9yZSAqIHBsZWFzZS4NCg0KT2suDQoNCj4gPiArICAgIGVudHJ5
X2NvdW50ID0gbGVuIC8gc2l6ZW9mKF9fYmUzMik7DQo+IA0KPiBOaXQ6IEJldHRlciBzaXplb2Yo
PGV4cHJlc3Npb24+KS4NCg0KSXMgdGhlIGZvbGxvd2luZyBsaW5lIGJldHRlcj8NCmVudHJ5X2Nv
dW50ID0gbGVuIC8gc2l6ZW9mKCptYXRyaXgpOw0KDQo+ID4gKyAgICBpZiAoIChlbnRyeV9jb3Vu
dCA8PSAwKSB8fCAoZW50cnlfY291bnQgJSAzKSApDQo+ID4gKyAgICAgICAgcmV0dXJuOw0KPiA+
ICsNCj4gPiArICAgIGZvciAoIGkgPSAwOyBpICsgMiA8IGVudHJ5X2NvdW50OyBpICs9IDMgKQ0K
PiA+ICsgICAgew0KPiA+ICsgICAgICAgIHVpbnQzMl90IG5vZGVhLCBub2RlYiwgZGlzdGFuY2U7
DQo+IA0KPiBBZ2Fpbiwgbm8gYXBwYXJlbnQgbmVlZCBmb3IgYSBmaXhlZC13aWR0aCB0eXBlIGhl
cmUuDQoNCk9rYXksIEkgd2lsbCBtYWtlIHRoZW0gdW5zaWduZWQgaW50Lg0KDQo+ID4gKyAgICAg
ICAgbm9kZWEgPSBkdF9uZXh0X2NlbGwoMSwgJm1hdHJpeCk7DQo+ID4gKyAgICAgICAgbm9kZWIg
PSBkdF9uZXh0X2NlbGwoMSwgJm1hdHJpeCk7DQo+ID4gKyAgICAgICAgZGlzdGFuY2UgPSBkdF9u
ZXh0X2NlbGwoMSwgJm1hdHJpeCk7DQo+ID4gKw0KPiA+ICsgICAgICAgIGlmICggKG5vZGVhID09
IG5vZGViICYmIGRpc3RhbmNlICE9IExPQ0FMX0RJU1RBTkNFKSB8fA0KPiA+ICsgICAgICAgICAg
ICAgKG5vZGVhICE9IG5vZGViICYmIGRpc3RhbmNlIDw9IExPQ0FMX0RJU1RBTkNFKSApDQo+ID4g
KyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgIkludmFs
aWQgZGlzdGFuY2Vbbm9kZSVkIC0+DQo+IG5vZGUlZF0gPSAlZFxuIiwNCj4gPiArICAgICAgICAg
ICAgICAgICAgIG5vZGVhLCBub2RlYiwgZGlzdGFuY2UpOw0KPiANCj4gTml0OiAldSBwbGVhc2Ug
d2l0aCB1bnNpZ25lZCBxdWFudGl0aWVzIChhcHBsaWVzLCBsaWtlIGFsbCBzdWNoIGNvbW1lbnRz
LA0KPiBhbHNvIGVsc2V3aGVyZSkuDQoNCk9rYXkuDQoNCj4gPiArDQo+ID4gK3ZvaWQgX19pbml0
IGR0X251bWFfZGlzdGFuY2VfdGFibGVfaW5pdCh2b2lkKQ0KPiA+ICt7DQo+ID4gKyAgICBkdF9u
dW1hX3BhcnNlX2Rpc3RhbmNlX21hcCgpOw0KPiA+ICt9DQo+IA0KPiBJIGFzc3VtZSB0aGVyZSBh
cmUgZ29pbmcgdG8gYmUgZnVydGhlciBhZGRpdGlvbnMgdG8gdGhpcyBmdW5jdGlvbj8NCg0KWWVz
LiBDdXJyZW50bHksIHRoZSBwYXJzaW5nIGxvZ2ljIGlzIHNwZWNpZmljIHRvIHRoZSAibnVtYS1k
aXN0YW5jZS1tYXAtdjEiIA0KY29tcGF0aWJsZSBzdHJpbmcuIElmICJudW1hLWRpc3RhbmNlLW1h
cC12MiIgaXMgaW50cm9kdWNlZCBpbiB0aGUgZnV0dXJlLA0KSSB3aWxsIG1ha2UgdGhpcyBmdW5j
dGlvbiB0byBoYW5kbGUgdGhlIGJyYW5jaGluZyBsb2dpYyBmb3IgZGlmZmVyZW50IHZlcnNpb25z
Lg0KDQo+ID4gICNpbmNsdWRlIDx4ZW4vZXJybm8uaD4NCj4gPiAgI2luY2x1ZGUgPHhlbi9pbml0
Lmg+DQo+ID4gICNpbmNsdWRlIDx4ZW4vbm9kZW1hc2suaD4NCj4gPiAgI2luY2x1ZGUgPHhlbi9u
dW1hLmg+DQo+ID4gKyNpbmNsdWRlIDx4ZW4vYWNwaS5oPg0KPiA+ICsNCj4gPg0KPiA+ICAjZGVm
aW5lIExPQ0FMX0RJU1RBTkNFICAgICAgMTANCj4gDQo+IE5pdDogTm8gZG91YmxlIGJsYW5rIGxp
bmVzIHBsZWFzZS4NCg0KT2theS4NCg0KPiA+ICAjZGVmaW5lIFJFTU9URV9ESVNUQU5DRSAgICAg
MjANCj4gPg0KPiA+ICt1aW50OF90ICogX19yb19hZnRlcl9pbml0IG51bWFfZGlzdGFuY2U7DQo+
IA0KPiBOaXQ6IEV4Y2VzcyBibGFuayBhZnRlciAqLg0KDQpPa2F5Lg0KDQo+ID4gIC8qDQo+ID4g
ICAqIEdldCB0aGUgZGlzdGFuY2UgYmV0d2VlbiBub2RlICdmcm9tJyBhbmQgbm9kZSAndG8nLg0K
PiA+ICAgKi8NCj4gPiAgdWludDhfdCBudW1hX25vZGVfZGlzdGFuY2UodW5zaWduZWQgaW50IGZy
b20sIHVuc2lnbmVkIGludCB0bykNCj4gPiAgew0KPiA+IC0gICAgaWYgKCBmcm9tICE9IHRvICkN
Cj4gPiAtICAgICAgICByZXR1cm4gUkVNT1RFX0RJU1RBTkNFOw0KPiA+IC0gICAgcmV0dXJuIExP
Q0FMX0RJU1RBTkNFOw0KPiANCj4gV2h5IGRpZCB5b3UgaW50cm9kdWNlIHRoZSBmdW5jdGlvbiBh
cyBhIGZhbGxiYWNrIHdoZW4gbm93IHlvdSByZW1vdmUgdGhlDQo+IGZhbGxiYWNrIGxvZ2ljIGVu
dGlyZWx5PyBDYW4ndCB5b3UgaW50cm9kdWNlIHRoZSBmdW5jdGlvbiByaWdodCBoZXJlLA0KPiBv
bWl0dGluZyB0aGUgZWFybGllciBwYXRjaD8NCg0KSSB3aWxsIHJlbW92ZSB0aGUgZWFybGllciBw
YXRjaC4NCg0KPiA+ICsgICAgY29uc3QgdW5zaWduZWQgaW50IG5yX25vZGVzID0gbGFzdF9ub2Rl
KG5vZGVfb25saW5lX21hcCkgKyAxVTsNCj4gPiArDQo+ID4gKyAgICBpZiAoIGZyb20gPj0gbnJf
bm9kZXMgfHwgdG8gPj0gbnJfbm9kZXMgKQ0KPiA+ICsgICAgICAgIHJldHVybiBmcm9tID09IHRv
ID8gTE9DQUxfRElTVEFOQ0UgOiBSRU1PVEVfRElTVEFOQ0U7DQo+IA0KPiBXaGF0IGlmIGVpdGhl
ciBub2RlIGlzIE5VTUFfTk9fTk9ERT8NCg0KVGhpcyBiZWhhdmlvciBjb21lcyBmcm9tIHRoZSBM
aW51eCBrZXJuZWwuIEl0IHNlZW1zIGl0IGV4aXN0cyBhcyBhIGRlZmVuc2l2ZQ0KZmFsbGJhY2sg
dG8ga2VlcCB0aGUgc3lzdGVtIHJ1bm5pbmcgZXZlbiB3aXRoIGludmFsaWQgb3IgdW5hc3NpZ25l
ZCBub2Rlcy4NCg0KRG8geW91IHRoaW5rIGl0IGlzIGJldHRlciB0byBtYWtlIGl0IHJldHVybiAw
eEZGIGluc3RlYWQgd2hlbmV2ZXIgYW55DQpvdXQtb2YtYm91bmRzIG5vZGUgb3IgTlVNQV9OT19O
T0RFIGlzIHBhc3NlZD8NCg0KPiA+ICsgICAgcmV0dXJuIG51bWFfZGlzdGFuY2VbZnJvbSAqIG5y
X25vZGVzICsgdG9dOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICt2b2lkIF9faW5pdCBudW1hX3NldF9k
aXN0YW5jZSh1bnNpZ25lZCBpbnQgZnJvbSwgdW5zaWduZWQgaW50IHRvLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGRpc3RhbmNlKQ0KPiAN
Cj4gTml0OiBJbmRlbnRhdGlvbi4NCg0KT2theS4NCg0KPiA+ICt2b2lkIF9faW5pdCBudW1hX2Rp
c3RhbmNlX3RhYmxlX2luaXQodm9pZCkNCj4gPiArew0KPiA+ICsgICAgY29uc3QgdW5zaWduZWQg
aW50IG5yX25vZGVzID0gbGFzdF9ub2RlKG5vZGVfb25saW5lX21hcCkgKyAxVTsNCj4gPiArICAg
IHVuc2lnbmVkIGludCBpLCBqOw0KPiA+ICsNCj4gPiArICAgIG51bWFfZGlzdGFuY2UgPSB4emFs
bG9jX2FycmF5KHVpbnQ4X3QsIG5yX25vZGVzICogbnJfbm9kZXMpOw0KPiANCj4geHZ6YWxsb2Mq
KCkgZmFtaWx5IG9mIGZ1bmN0aW9ucyBpbiBuZXcgY29kZSwgcGxlYXNlLg0KPiANCj4gRnVydGhl
ciB0aGVyZSdzIGFuIGF0IGxlYXN0IGFic3RyYWN0IHJpc2sgb2YgdGhlIG11bHRpcGxpY2F0aW9u
IG92ZXJmbG93aW5nLg0KPiBTZWUgaG93IHh2bWFsbG9jX2FycmF5KCkgYWxsb3dzIGZvciBtdWx0
aXBsZSBkaW1lbnNpb25zIHRvIGJlIHBhc3NlZC4NCg0KVGhhbmtzIGZvciB0aGUgZ3JlYXQgYWR2
aWNlLg0KSSB3aWxsIHVzZSB4dm1hbGxvY19hcnJheSgpLg0KDQo+ID4gKyAgICBpZiAoICFudW1h
X2Rpc3RhbmNlICkNCj4gPiArICAgICAgICBwYW5pYygiRmFpbGVkIHRvIGFsbG9jYXRlIG1lbW9y
eSBmb3IgbnVtYSBkaXN0YW5jZS1tYXANCj4gYXJyYXlcbiIpOw0KPiA+ICsNCj4gPiArICAgIC8q
IGZpbGwgd2l0aCB0aGUgZGVmYXVsdCBkaXN0YW5jZXMgKi8NCj4gDQo+IE5pdDogQ29tbWVudCBz
dHlsZS4NCg0Kb2theS4NCg0KPiA+ICsgICAgZm9yICggaSA9IDBVOyBpIDwgbnJfbm9kZXM7IGkr
KyApDQo+ID4gKyAgICAgICAgZm9yICggaiA9IDBVOyBqIDwgbnJfbm9kZXM7IGorKyApDQo+IA0K
PiBXaHkgdGhlIFUgc3VmZml4ZXM/DQoNCkkgYWRkZWQgdGhlIFUgc3VmZml4ZXMgYmVjYXVzZSB2
YXJpYWJsZXMgaSBhbmQgaiBhcmUgdW5zaWduZWQgdHlwZXMuIA0KSWYgYSBwbGFpbiAwIGlzIHBy
ZWZlcnJlZCBoZXJlLCBJIHdpbGwgcmVtb3ZlIHRoZW0uDQoNCj4gPiArICAgICAgICAgICAgbnVt
YV9kaXN0YW5jZVtpICogbnJfbm9kZXMgKyBqXSA9IGkgPT0gaiA/DQo+ID4gKyAgICAgICAgICAg
ICAgICBMT0NBTF9ESVNUQU5DRSA6IFJFTU9URV9ESVNUQU5DRTsNCj4gDQo+IFdoaWxlIGJpbmFy
eSBvcGVyYXRvcnMgcmVhbGx5IHdhbnQgdG8gZ28gYXQgdGhlIGVuZCBvZiB3cmFwcGVkIGxpbmVz
LCBmb3INCj4gdGhlIGNvbmRpdGlvbmFsIG9wZXJhdG9yIHdlIHdvdWxkIGdlbmVyYWxseSBwcmVm
ZXIgZS5nLg0KPiANCj4gICAgICAgICAgICAgbnVtYV9kaXN0YW5jZVtpICogbnJfbm9kZXMgKyBq
XSA9IGkgPT0gag0KPiAgICAgICAgICAgICAgICAgPyBMT0NBTF9ESVNUQU5DRSA6IFJFTU9URV9E
SVNUQU5DRTsNCj4gDQo+IHdoaWxlIHNwZWNpZmljYWxseSBoZXJlIGl0IG1pZ2h0IGJlIHlldCBi
ZXR0ZXIgYXMNCj4gDQo+ICAgICAgICAgICAgIG51bWFfZGlzdGFuY2VbaSAqIG5yX25vZGVzICsg
al0gPQ0KPiAgICAgICAgICAgICAgICAgaSA9PSBqID8gTE9DQUxfRElTVEFOQ0UgOiBSRU1PVEVf
RElTVEFOQ0U7DQoNCkkgd2lsbCBjaG9zZSB0aGlzIHN0eWxlLg0KDQo+IFlvdSBmaWxsIHRoZSBl
bnRpcmUgYXJyYXkgaGVyZS4gV2h5IGRvIHlvdSB0aGVuIHVzZSB0aGUgemVyby1maWxsaW5nIGZv
cm0NCj4gb2YgdGhlIGFsbG9jYXRpb24gZnVuY3Rpb24/DQoNCllvdSBhcmUgcmlnaHQuIEkgd2ls
bCB1c2UgeHZtYWxsb2NfYXJyYXkoKSBpbnN0ZWFkLg0KDQpUaGFuayB5b3UsDQpIaXJva2F6dSBU
YWthaGFzaGkuDQo=

