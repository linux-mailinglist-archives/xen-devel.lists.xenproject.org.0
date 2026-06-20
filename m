Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pJ5wGCLWNmqxFQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jun 2026 20:04:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE386A971D
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jun 2026 20:04:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b="v/bE5PLd";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1343110.1602766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wb02y-0006It-Ev; Sat, 20 Jun 2026 18:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343110.1602766; Sat, 20 Jun 2026 18:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wb02y-0006GM-Bh; Sat, 20 Jun 2026 18:04:00 +0000
Received: by outflank-mailman (input) for mailman id 1343110;
 Sat, 20 Jun 2026 18:03:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wb02w-0006GF-D3
 for xen-devel@lists.xenproject.org; Sat, 20 Jun 2026 18:03:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wb02v-0051EX-MI
 for xen-devel@lists.xenproject.org; Sat, 20 Jun 2026 20:03:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a36d5fd-5cb7-0a2a0a5109dd-0a2a450ad5e4-20
 for <xen-devel@lists.xenproject.org>; Sat, 20 Jun 2026 20:03:57 +0200
Received: from [52.101.229.105]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a36d60a-93a5-0a2a450a0019-3465e569c67b-3
 for <xen-devel@lists.xenproject.org>; Sat, 20 Jun 2026 20:03:56 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY6P286MB7305.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:359::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Sat, 20 Jun
 2026 18:03:51 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Sat, 20 Jun 2026
 18:03:51 +0000
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
 b=iSRzxZA1Q9b81DovKZ6I/Wi2CV8ODqlVMuNNHYA9cIBKSdy12O2Dr6XaNtBMp8YHBHwB78btdyAgMP3bUCNWkRADytuIRUzKWpt9Q3RtWyETHONaO7sPf+y+A3bataANrgv3wZwnfUEN/h6eH6XKcbPBDbFy6c9SP/PXow/xLOel0vK9y2lDCIZBsHmEhyBGhHjSEWB4ICAodz62kSZOiNEkO7wkdVqiDAe4vKh63DwYQqxOp4OIPSuFLrLr7phKCvjExmVOcm7pn2/aGrxSgbIBqBPgsq3QNJ3Jy5xmzpMO8akyCBxjcjh9OBuVfpe1oET7OCajFWT5lme2vjkvxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYV49mpRWwqDqptKMhtgcSxT2vbrz66L6oD5Gx+10Ks=;
 b=u5HYjYgXu7Xwj3AuI1syvoBiV1vqLv582aBihnS7E6K0TJMhOZ/H8JUTRwcMEMtd/tTeW0F3JiJP34GHDLCG8oyLnxPbpMPOiwwlU3GNiLVPJ8TKi24Va01EDHP7yDRY3jQegwtyy1wFHKbiaKjnKPHDpPw/FfEZvF0iEEcqVcPjjoLvglCpWuGdSROfVK7cGY1uiZaOKuaoSmZ8KeyvUGChUoNMhCe1l0wWc5/iFX50p1RP6HkYvqFLtGX9cBipBc9Rmxek+onYdU0RtdMU8BvtsqVUyRG/2tCkhVclh0gdBXJnsSkY/U7TClSHccAesSR0qMR87De+0kppSBb3hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYV49mpRWwqDqptKMhtgcSxT2vbrz66L6oD5Gx+10Ks=;
 b=v/bE5PLdew2zbpHLTMn8xciKI4zhE9RGOri3PQRM1oBwJKo1e577ojnrHdhTYE1Fur2Ni9c1vGEt9UynhtxhoQ1J9qeaiu2MJZWZt/NNa3fhlZYAOdhIUZODuy18tLiqdvjiTa4XTdTsNtybmXMxeTH+MRq+lXUKInAc74Zp6L8=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 02/22] xen/common: Default function to get the distance
 between nodes
Thread-Topic: [PATCH v3 02/22] xen/common: Default function to get the
 distance between nodes
Thread-Index: AQHc/8BFrLztQEh49k68JcxFGb2JAbZFinQAgAIyZcA=
Date: Sat, 20 Jun 2026 18:03:51 +0000
Message-ID:
 <OS9P286MB7222051E59EED623736787AF82E12@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260619075011.377116-1-taka@valinux.co.jp>
 <20260619075011.377116-3-taka@valinux.co.jp>
 <3aefcd7c-d911-42b7-b731-5fc657b26622@suse.com>
In-Reply-To: <3aefcd7c-d911-42b7-b731-5fc657b26622@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TY6P286MB7305:EE_
x-ms-office365-filtering-correlation-id: 5a9b65e0-189b-47ec-5619-08decef64939
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|38070700021|18002099003|22082099003|4143699003|56012099006;
x-microsoft-antispam-message-info:
 EcNxUrBL740mzFf8zuqBjOlteTYz85XlqpUXhwhII/asplzaG6zeBmO0lgx7kNT2hUyJLFcupTxUW+w3ZlD6Pq1UEN91qMZQzka6aXTmThz8dAYddQ3deUgoVQBoeYsXaYdTy+X5ueBMMV97eMp012FbWdplQPCu4TwHyohMOAiNMubUpHGvQRM5ZjxPKTgzBIrx7Xk1z9tPptpDkI6TeQzTe+b7eqovr3aX8z3dbuDOTpjN4XQUSmSVaMKKN6bzpRNKCxA3T2spEoNB4EAou0mim5QNu/NAt/SzIpOcPlhAZ+tNAliPanU6sqBi+GCXwUQkvBhnOrYeRhfwAWCggo3P/jhBBzoqP6SHyR3SlhWlKPaXnW1PnlnclrUdbv4fEb1XaM1XBHASIPev4uXOO3ikwOtt4MNGF0/n4uggoCsDFO9/8nHRIJF15E5pmdULCItU/TXvf1pi7d6VI1Lc9nma4oTtJF8d7o7nodK/Ob7Qh7iBEAehZ11twSWdQ5fq+vaZ6OkV50jGyEsP9XHwiMHfOFckZ/fLeiPybDfc8+ohp55Hk/qaY+F7pKxfAtRPGI+l2drku8L2KWRsHBL0Oxoaw3TmbG95PsENJc+OwLGMuPcQgSo4RKR/fJnLK/25SOdt0wXXKLO2eG/1GxkASVuV30xA6zJaVPvkeX6DBUyPeRFhUUVbZxdWEAC0kj6fUk+yGSqjvHT9Wo6vKfbxbRK1gTnxy3HiJfahdr9rNRs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b0VZTjdtOTM0SzdRenlLUUluZndLZU4reVRRM0ltK1d4Q0phakp5amJ6OGU0?=
 =?utf-8?B?Wms3MXQxbDZQWjNyS3NwZjBwM3MwTEcybmV4cG5QcFU2Z0lja2EyMmhPMTJH?=
 =?utf-8?B?Y2pOOENYUDlieWEva2NhMU5hdEk2VmNqS2tYRTdWeDV3ZldZemNnODV6Z3R1?=
 =?utf-8?B?VmR3cUF1Rnc3RjY2cVhQNEJscUZ0SE1lM1MyaU50WGJmTlYxUW9nT3doMjRU?=
 =?utf-8?B?VE9RbUNsZ0RDV3dmTUhvUlZwSU00N0hXdjhXUjZkQjJGeWdVYi9xRy9McnQv?=
 =?utf-8?B?QVpveG9uUkI0ci8zRGFQRWhxa3lmM2tHdUtWTDBVRC8zZXd2TGw3UWZ1MVZB?=
 =?utf-8?B?TUVEbU5JazQvUVJmZEJBRGloTjQyZkxPd0hlalhRWmhxbUt6d3lQUS9Odk9J?=
 =?utf-8?B?OG1FZ3l1d1d4K2VQaHJwaUpMSlN4ZC9BKytYcENqd2d3T0dNanNwVHFZZ2hR?=
 =?utf-8?B?dnZ4dGhlU0VrdytrTUlZRE43RDVGWGtJZDZoQU4yL1RNZFowKzNURmVTb1VU?=
 =?utf-8?B?ajhWY1ZFV0FrNTBaZ2lWaS9WSVY4T0R2Q3FtMnlvejd3VHRuY3pJbG44ZDFC?=
 =?utf-8?B?RW4wcmx3SW9JbnFxS1hQK3N5RFpkY2E3R2dTempmRDVOTzZTc04wSHNTb2hQ?=
 =?utf-8?B?TE10b2pGcFVaTmxlUWppVEx4d1RLWUczYXNOK25YYjQzVENJdW9OTkR4YzY4?=
 =?utf-8?B?L05PQVlMM3J6NzZlVFphUWtGNXBqUUtXY2FUa1JWNGhZbjVaSHd0L3NTR1ZE?=
 =?utf-8?B?MzdpL0Z2aDJ2RkNoQlNPYmVOWldHTjFsajU2cmN4KzlPZE5vZVV5NzBhb3NM?=
 =?utf-8?B?MGd6NERKRW1SSlJmdXhKK3JSM2NGdW5nZnFOTWFYd0F3NktEQnBQVlp0YnhU?=
 =?utf-8?B?SHpVbEFFazErQ2FudGlWbUFkNk9vZGRweitPdEtrYnZjeFEwcjdVZHBVZExC?=
 =?utf-8?B?NG5jNVV4RDJtTkVENWRyTDhqV2lyKzZWSGowMnNzK3dLTDl6dWFEMkRzSzM4?=
 =?utf-8?B?MTZiZzliL2tUK2NzYWNWODdTa0p0ODJWNVB0bjlNNE5KYVNmZVNiMEMzWTdx?=
 =?utf-8?B?ZWVPUkY3dmQzSS9TbDhoMENoakcwV1J3NkpCSnJPZ2tNOFpxcXNUaDBkTkFI?=
 =?utf-8?B?RzBBeUptNEhGUS9xOG94NnYyNEtYL1VMbHRyYVJubjk4RkVEQndTSE92a3U3?=
 =?utf-8?B?YkpsNjdLNkhDZ0szd0ZkamJjZXkrRGlqV1dpSHVXVEp5M0hSUSs2RG04VktX?=
 =?utf-8?B?SE5tYUNYWjd5b1orT0t4bnhVK1EvZVlzZ0xZMFdzbHdudGtzUzdLZi9kRVhJ?=
 =?utf-8?B?SllPV1FzOVpBdW0wamlPYnpFUW9qNHFOVDVycEc2WmZISSttK2V4bnRBRlVD?=
 =?utf-8?B?NUpQZ25KWFNUNDBSMlZ1K2pCc1o3bVR3Q2htRTc1NlBFRHE0a3hkYlp3dE9q?=
 =?utf-8?B?dXJldzBXY1RRM3JHdnpYenBvN2tVY0hNME5rSCt1eFpuT3NPWGt3ZG40ZWU1?=
 =?utf-8?B?dXEybG8yUGtqM0dGTEN0N0JvQVhsQXZURFQ4NjJTNGJkN01jVHR5RTBMdjc1?=
 =?utf-8?B?NHlqL0ljT1ZFSkNBaEJaUEY0Wlp3M0xYckVGZ0M2N1BvSFZsVmNRT1BzRnJ1?=
 =?utf-8?B?SE4zcUZ5TDdzMHFHNlFPSTdCMS9FeElZVm0vYi93MWh2RE8vK1k2MmNWbndo?=
 =?utf-8?B?cHhCZFowdksxKzIrOUJBdXhWakxQKzgzUUU5RVIrRFJRZGxicDhxWlQ2UVdk?=
 =?utf-8?B?SG9XdDNIWXgrbzRWT2dLem8xZTNLcmxxUHFGZzA0dU0rRk1aOWovRlFFL09x?=
 =?utf-8?B?dEdEWC9ja3hpNG5uS1NZbXZxdDZQQkFwdDY5LzlSUTVEOUpZeFMrVjRRcEZ6?=
 =?utf-8?B?YXovckRoTEtKRmtPVlo0RWU0WkhaR3duL080UktTcHpMM0ZMeW5sM3FnVHQw?=
 =?utf-8?B?cWdzQlo2TDdUNjRPbFR3eXFUamh0Tllrd1pOMURzRGZwd2IyWjFFUFI0YmZV?=
 =?utf-8?B?WUwwb1A0SjAyb096bk9kUTV2dVBSQktIVEFlZnhCOVJUNmJPWHlweUtoM3I5?=
 =?utf-8?B?aGVkbGVZSHhlcDFTYlVobndzTGdDU1liZzdxdGIwTDRTRUZ1cllvQkxMZUJH?=
 =?utf-8?B?Vy8vbzhSYmdXS2NBbUlhOVpqMHY2R3FITGgvQlA1dXRVdDZSNExvRWlsWFkx?=
 =?utf-8?B?VFRMZjZHYjJ6cGxNVEl3YjRTRWFDUHhyRGdCNFR4NHhPTGNJSFBaN3FiRTAz?=
 =?utf-8?B?bzZBK09Oa2hRZU5zQnFIZjlEZ09iQUhCbENlaTdFWWxRU2c5SWEyZG02TjJ5?=
 =?utf-8?Q?AXMZOHqct0xx25tz63?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9b65e0-189b-47ec-5619-08decef64939
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2026 18:03:51.8707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +YEx5uL0ieoHzr3tdmK+ecudiKQExOVTP4UUDgFik+l0Tp/6hoEPleXAxEorpk5QonUCPZ+INR9664dEZK2ehw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6P286MB7305
X-purgate-ID: tlsNG-4011c0/1781978637-2DBF3DB8-1145FDA7/0/0
X-purgate-type: clean
X-purgate-size: 728
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,valinux.co.jp:dkim,valinux.co.jp:from_mime];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3BE386A971D

SGksDQoNCj4gPiArI2luY2x1ZGUgPHhlbi9udW1hLmg+DQo+ID4gKw0KPiA+ICsjZGVmaW5lIExP
Q0FMX0RJU1RBTkNFICAgICAgMTANCj4gPiArI2RlZmluZSBSRU1PVEVfRElTVEFOQ0UgICAgIDIw
DQo+ID4gKw0KPiA+ICsvKg0KPiA+ICsgKiBHZXQgdGhlIGRpc3RhbmNlIGJldHdlZW4gbm9kZSAn
ZnJvbScgYW5kIG5vZGUgJ3RvJy4NCj4gPiArICovDQo+IA0KPiBJbiB0aGUgZGVzY3JpcHRpb24g
eW91IHNheSB0aGlzIGlzIGEgZmFsbGJhY2ssIGJ1dCB0aGF0IGRvZXNuJ3QgYmVjb21lDQo+IGNs
ZWFyIGZyb20gdGhpcyBjb21tZW50IGF0IGFsbC4NCg0KSSBvcmlnaW5hbGx5IGludGVuZGVkIHRo
aXMgdG8gYmUgYSB0ZW1wb3JhcnkgZmFsbGJhY2sgZnVuY3Rpb24sIGJ1dCBzaW5jZSANCml0IGdl
dHMgY29tcGxldGVseSByZXBsYWNlZCBieSBhIGxhdGVyIHBhdGNoIGluIHRoZSBzZXJpZXMgYW55
d2F5LCBJIHdpbGwgDQpkcm9wIHRoaXMgcGF0Y2ggaW4gdjQuDQoNClRoYW5rIHlvdSwNCkhpcm9r
YXp1IFRha2FoYXNoaS4NCg==

