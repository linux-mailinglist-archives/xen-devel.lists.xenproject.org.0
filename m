Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id We0CLkX7H2pNtgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 12:00:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78511636604
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 12:00:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=pvH9cH4g;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1326027.1591450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUiOA-0003VH-1c; Wed, 03 Jun 2026 09:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326027.1591450; Wed, 03 Jun 2026 09:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUiO9-0003Tf-UT; Wed, 03 Jun 2026 09:59:53 +0000
Received: by outflank-mailman (input) for mailman id 1326027;
 Wed, 03 Jun 2026 09:59:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wUiO8-0003TX-3x
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 09:59:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUiO7-000Gjm-Gn
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 11:59:51 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1ffb00-2eae-0a2a0a5409dd-0a2a450b8c3c-48
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:59:51 +0200
Received: from [52.101.229.142]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1ffb14-212f-0a2a450b0019-3465e58e06e2-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:59:50 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYTP286MB3627.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3a0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 09:59:45 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 09:59:45 +0000
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
 b=I2vjYtn9SqIRePQy7I1h/oDQJqLEGGs9s8DBMa284WrO2ql+ylYO2aZKgd2FlICxaepOQ9yWOoLOUmJ4UlGt8oNxUIdfumhcIqOUwbXCx4JrGxxk7Rl9hj2PsPulBA7+aj9X4qrsDFvLuw7XLtUeQU9E1GfU8HCeCmpjvfZuY/BCiiQxcHsfNhAhz0aBQO1AL1XFMWr3T94qK+KLfssUUYV5+SzeJgAzzkpBknCBIvH7s4BYLENYo06+MybokyTp8ksTJtKAfJwwWC3LM5jHe2vhbHBAGz0rm1MuSlR6egjm2x+4FOJMyS4xOk2gWKXZJq662pQAZKgh1LR0DpMXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mISiI+NtV8gyfxPraswyLTz51xEPPhbrxccb0q1CX0c=;
 b=kf6PryD/3a3hPQGWZiFYjVkeG4x7hunvsy05l/DoiPyqMUoVZJjvc/9K2sY1mcZP22IreHXUgkC1slrvOehYzjnRnZn2mTf5vrcclo/g/8sg04EXJNV1Wli6Zy7Z1vrLReLJffOhFXZ1wDyA6+RtxRhOTXH945THXY6VdnOKaQq79mhXWW8Jek75UpU5FU2DOWAWTwWoB3WlmIkOLCPz88r9DMycTtORfdztgX2LOCQYUwj5/m74ehAx5E/Kt5OnYtPz6yer3TilZTSAFcbLYXr+0MqAWGAtoMXmDiLvKR48aPnaAHcx4Db0P6OtCW4xWF2PnXlPx9dK9BXhCYYoEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mISiI+NtV8gyfxPraswyLTz51xEPPhbrxccb0q1CX0c=;
 b=pvH9cH4gHWUtIt3zCcJPQmL+deDfkIvNeBC/bgEm1+WS228xiAEHqUSi0yrcLAY+X4VEwlg7NY3z0VJ6W7GWtEeqXGWPZI+pSu0PgBIDF1OKLFIXCBK6Bd/O4gY0WH/K84vFuxUYJOIEGFRZhoKMwrf8e3YqFYMvZxaEUE8Jsg4=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
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
Thread-Index: AQHc8U+PsZhvkHY9vEqKRtt8NHnfGrYrBomAgAF93dA=
Date: Wed, 3 Jun 2026 09:59:45 +0000
Message-ID:
 <OS9P286MB72221F0A5D5195C7A4CAFD4082132@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260531224755.9481-1-taka@valinux.co.jp>
 <20260531224755.9481-8-taka@valinux.co.jp>
 <7040c58f-2d4c-48f2-854f-c874efdcefbd@suse.com>
In-Reply-To: <7040c58f-2d4c-48f2-854f-c874efdcefbd@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TYTP286MB3627:EE_
x-ms-office365-filtering-correlation-id: 770ff0d4-3713-4540-a76b-08dec156d70b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|4143699003|56012099006|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info:
 01PSI5wxX9IUXpuCCS5bHqkwmvySvfyi1N1kVAAncWhsEEd5pvSMug3qzDupTo0KjexwSJlBG8aIAjE8vbogPeYvBjRJYn8gUBN+Zp/7vg+XhLmMxEBvLCW1sJY1ZPmxipLtgkzl5syxzNwdhSMNYouHmVOhr9NyqOxNpxUrF4qm8/QgIYgJ2YnIvyz57bOKiAPUP6jVabZcoaaBSDA1vbD7NloLPGIc6vmLGTAVB6Z9DykBFU9fji+qI6rELTM6DISiit4WHtrWrN3mHJOaDfs8n/fIdoMHdS7gBm+704SU4D8PjxPm/cfs7984wLaFYnKPDoYCloVJ6iuXoPdTuYDM0dIG11MI47xJ51VmtkVh1Y0poNfnVqA4G9UYYc0q3iVCT+CaGYUKdLptKonEDrJW+tFHxw6dSiw7wZeXMOPxeoSEuhDJAzeowKqtHCN1nFiezT6D0e5GVmkNoxY07Q62bx5vddslC/QQVRbkcEzSGJCTe32TDDOcKABS2WA8bksWQN3YVOf/AOEDcLjPmEURvvZgD+BNorW1oz4oJ2kHTWfphq2Jb99ebiFmSHPbA8QNw8/Ltms/zKXxKNqsWWEhRV+X7QZSsbGXWNAnZ3Nc+neIOSUFHaPRTy6phDuydAFspWdAexeHQvAgE9Xe6NRgguHxPjggYNdXTZb75q74MO6iwKG7eqY3bL7NUrqYZXMI2zdupCCkt8F9pNRHfgb9nXv3NUa/1vQIA/xq2+2SG8SpL7XTSQ5vyg/ekP1j
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(4143699003)(56012099006)(22082099003)(38070700021)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UmJBRHNIZjNmME9LM3p4bzBleGVWR3JGVjBVQy9EMGxkKytzYld5MW4xbGRH?=
 =?utf-8?B?R3BFcnhOZHhGRkxKZXU3TTVtWDJaMXI0RWM4RjYreFF3VnhsZ3VuWVloVlVF?=
 =?utf-8?B?MG1KamJEQkg3N3ZPYXlOZjhoS2dPbkZwQmxNWE5sZ0ZSM2pPRytkMmlpWW9B?=
 =?utf-8?B?M1ZmVFpiT0hjcnF0QmpSMW5jWjRTNjdRbmVZbFgrMHR4blN5ektjdVhGemNa?=
 =?utf-8?B?WUJOMURGdFM2NGR6NGxOTWg0RWp0WHk2eEwzLzlJNjBWTFdSZGd6NVNUZXpx?=
 =?utf-8?B?NFJWa0ZndjNqcTlheDczMnY2U3ZYTU95Q1h4UVc3YlZFdTBEME15OGhjOFl6?=
 =?utf-8?B?N3RwYXVCclJuWlJsc1hYcGtUSU9KNFZSU0wwMWdydjFLTVhWb1h1cnBMeUhJ?=
 =?utf-8?B?UmZuRmpDdmUxTmRKRVQzUnE3NGJicDl6UDJ1M0YvUkJBMXRrUld1enJ4c3J6?=
 =?utf-8?B?Q1V4cktKaGtjaEVsQk43dzlTZG1ObGE1RnpsZ1orUzFPNjM0TGVPb3RFdmJ6?=
 =?utf-8?B?UERYRjh3cmRLNzFLRXZCSVV0RU5rUW9KSzRwU3ZJZHNlQWlzYnhaa2FyVkRI?=
 =?utf-8?B?dW50QldwSHJBMTVUaDJuczlSeVcvYXBoVlNtOWNrd0NIYmFhY1ZYdDc5Qk5R?=
 =?utf-8?B?SG1rK0F6NWVESi9LRzZrZjRVK21MMjhIME9jQ0t4VVJna012NFN4UGZDMHV4?=
 =?utf-8?B?UkpyV0t3d2VlR0hGVzFsQTZqQ01vTXgyQkoyOHY0YVZacnlQcXFDdEhFT0NJ?=
 =?utf-8?B?d1ZkaWJMYThFKzhsSVlyVnVTSjJMSVVHR3haU1l5emVINVdXUnhaNUkySUlG?=
 =?utf-8?B?R3F3Z0cyWW9YclZJY1orTkJFdHRSZlR6M2w2SHBqd2ErREQ0WGd1OW16N1N0?=
 =?utf-8?B?c2doOTUzL2FKRzFVL3NlVzJwblUyck5Mc00wNVJjSlZZVGZmYWtrUS9rb2pI?=
 =?utf-8?B?TE1NMzkzYllZeXdvUDdYMlhZeXBzZzNENlNoc1QwVVVRbXVyRU5pbHBuK1Jw?=
 =?utf-8?B?L2NueU1YUndPNDZtNG4xYnNrQ0hwbGxrK0IrNzBQUW5mRXBzM0U0SjhJdVFv?=
 =?utf-8?B?ZlZzN1NjVmtUR1pjNTBvT2VSU3NmWUdBNHpINXBmeDJ0RnArRWJvUmNQWm1y?=
 =?utf-8?B?RVR4bi8vVlZsTjlzeEYrTW1yUm5FdUN0VWNBSmt6ZG9hakVTU1h2R3gyUytC?=
 =?utf-8?B?OFE5Y0ZmMkw3cVFKYkJxQ2MrR2JVMHp0QytPNHhUbkw5MUZMb054R2Q2NkFu?=
 =?utf-8?B?QU5oZTh6ZDVyd2Z2eWlyZS80aGltU0x2cTBsTUZ0YkE4bXNHL1ZKcThKclph?=
 =?utf-8?B?dGI1dUxSZXY2NE54ZW9vS21CeUZ4ZmU4RU5KZHRhR1VqK05sWEM0S3hxa0Y3?=
 =?utf-8?B?S0JUa1hNbC8rYm9tTkJUeUFRQmpaTDRxcG1hL21vU1Z4ZUxHajI0Yms1dkJE?=
 =?utf-8?B?RE56eHpNM0pJY21xdTE0Ukhoc3ZNTndVcmNvdldHbWVieThtTHMrdGhRdmRG?=
 =?utf-8?B?cUJsTlFoQ1FlOThZR21UQ3dHVDlscE5semtXWFFRM0JCV3h3SEdWampFemN4?=
 =?utf-8?B?QnNQajBwZHZxWjBRaWFhazlIcUlHTHFsNjZmcTlCQWdaejhvYjBEdldSbzZx?=
 =?utf-8?B?d0VDYkM1Nit3YmFZMHZPN1hrQStienA4NDhsdVNLb3I5cCtkcTNVWXNXRnNJ?=
 =?utf-8?B?cUVFdHZxdlMvb1JNRU5KaEpsaHE3dEdJZVlseGFEd01waXl1SElWN2ZlY2kw?=
 =?utf-8?B?WGpHM3JSdW40cDNSU3NWYkQzVnBteUpPOTA0K2xJM0FrdkdaODZkUGhwU0Jl?=
 =?utf-8?B?a04vODdGR3NNZ0hBeUIxa0s5Zmk2QkJ5L1czR3ZGTzNDNmsrWFg2YWhOWDNl?=
 =?utf-8?B?RWxYN2tVclU3eVpnRW43YlVsNWpvMzdZVkpXYWx5aXNobEl0cjFsSGNmcmI4?=
 =?utf-8?B?ajRuVFNyVVl2T3g5Vkl5WFFTVUpWZmtzQmtDVGVKS1BPMDUwU1g0Z3lPRmFW?=
 =?utf-8?B?eEhlSFVpb0FCNlpHNGg1ZFVoS2FCNlBLUUV5UEVyWk1ZK0k1STltQW1adGlh?=
 =?utf-8?B?YlV0NUpPbHJnR1ZYeXd2cUI1QkNPbFhKUVdrYkRwcjJGbHN6Ymc3MHBpbmlH?=
 =?utf-8?B?SDR0Q0Q1Ung1bE8wV2gzQzNlSEY2QTdsWk4zS0FJVWVTNVNBcE1JSXlDMlh2?=
 =?utf-8?B?NVdyb1JzcEJ4VDVmOUVqZVpScDlNQW9BYVRyQ3VoVUhkTGlTZHg4TU16UjNM?=
 =?utf-8?B?cDUzOC82bDNWV3VVUGxHeXQ2c0owSXhiYVdPSkhxOUpEa1JrM3B6eFAwSEU1?=
 =?utf-8?Q?kKBrH5Z2eNwf4MVd0P?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 770ff0d4-3713-4540-a76b-08dec156d70b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 09:59:45.2136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: snj2v1oFD+aRSaLcVPqmhH7R4KC98mvqkbCcNyN+Wj1b79G+rmW/58t17eJMJhnmXIdV4/2h6/ndGs0JLTgN5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTP286MB3627
X-purgate-ID: tlsNG-42698a/1780480790-22B8EF3B-766A1551/0/0
X-purgate-type: clean
X-purgate-size: 2620
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
X-Rspamd-Queue-Id: 78511636604

SGVsbG8sIA0KDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9j
cHUtdG9wb2xvZ3kuaA0KPiA+IEBAIC0wLDAgKzEsNDIgQEANCj4gPiArLyogU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLw0KPiA+ICsNCj4gPiArI2lmbmRlZiBYRU5fQ1BV
X1RPUE9MT0dZX0gNCj4gPiArI2RlZmluZSBYRU5fQ1BVX1RPUE9MT0dZX0gNCj4gPiArDQo+ID4g
KyNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4NCj4gPiArI2luY2x1ZGUgPHhlbi9kZXZpY2VfdHJlZS5o
Pg0KPiA+ICsNCj4gPiArc3RydWN0IGNwdV90b3BvbG9neSB7DQo+ID4gKyAgICBpbnQgdGhyZWFk
X2lkOw0KPiA+ICsgICAgaW50IGNvcmVfaWQ7DQo+ID4gKyAgICBpbnQgY2x1c3Rlcl9pZDsNCj4g
PiArICAgIGludCBwYWNrYWdlX2lkOw0KPiANCj4gQ2FuIGFueSBvZiB0aGVzZSBnbyBuZWdhdGl2
ZT8gSWYgbm90LCAidW5zaWduZWQgaW50IiBwbGVhc2UuIElpcmMgSSBzYWlkIHRoZQ0KPiBzYW1l
IGVsc2V3aGVyZSBvbiB2MS4gUGxlYXNlIGFwcGx5IHN1Y2ggY29tbWVudHMgdGhyb3VnaG91dCB0
aGUgc2VyaWVzLg0KDQpUaGVzZSBtZW1iZXJzIGNhbiBhY3R1YWxseSBiZSAnLTEnIHRvIHJlcHJl
c2VudCBhIG1pc3NpbmcgZW50cnkgd2hlbiBwYXJzaW5nIHRoZSBEZXZpY2UgVHJlZSdzIA0KJ2Nw
dS1tYXAnIG5vZGUuIA0KDQpTaW5jZSBJIGltcG9ydGVkIHRoaXMgZGlyZWN0bHkgZnJvbSBMaW51
eCBrZXJuZWwgNy4wIChzcGVjaWZpY2FsbHkgZnJvbSBpbmNsdWRlL2xpbnV4L2FyY2hfdG9wb2xv
Z3kuaCANCmFuZCBkcml2ZXJzL2Jhc2UvYXJjaF90b3BvbG9neS5jKSwgSSB3b3VsZCBsZWFuIHRv
d2FyZCBrZWVwaW5nIHRoZW0gYXMgJ2ludCcgdG8gbWluaW1pemUgDQphbnkgZGl2ZXJnZW5jZSBm
cm9tIHRoZSBvcmlnaW5hbCBMaW51eCBpbXBsZW1lbnRhdGlvbi4gDQoNCldvdWxkIHRoYXQgYmUg
YWNjZXB0YWJsZT8NCg0KDQo+ID4gKw0KPiA+ICsjaWZkZWYgQ09ORklHX0RUX0NQVV9UT1BPTE9H
WQ0KPiA+ICtleHRlcm4gc3RydWN0IGNwdV90b3BvbG9neSBjcHVfdG9wb2xvZ3lbTlJfQ1BVU107
DQo+IA0KPiBJZiBhdCBhbGwgcG9zc2libGUsIG5vIG5ldyBOUl9DUFVTIGRpbWVuc2lvbmVkIGFy
cmF5cyBwbGVhc2UuDQoNClRoaXMgaXMgYWxzbyBwYXJ0IG9mIHRoZSBjb2RlIGltcG9ydGVkIGZy
b20gTGludXgga2VybmVsIDcuMCwgd2hpY2ggaXMgdXNlZCB0byBzdG9yZQ0KdW5pcXVlIHRvcG9s
b2d5IGRhdGEgcGVyIENQVS4gDQoNCkkga2VwdCBpdCBhcyBhbiBhcnJheSB0byBtYXRjaCB0aGUg
b3JpZ2luYWwgTGludXggc291cmNlLCBidXQgSSB1bmRlcnN0YW5kIHRoZSBjb25jZXJuDQphYm91
dCBhZGRpbmcgbmV3IE5SX0NQVVMgZGltZW5zaW9uZWQgYXJyYXlzIGluIFhlbi4gSSBjYW4gcmVm
YWN0b3IgaXQgdG8gdXNlIFhlbidzDQpwZXItQ1BVIGluZnJhc3RydWN0dXJlIGluc3RlYWQuIA0K
IA0KPiA+ICt2b2lkIG1hcF9jcHVpZF90b19ub2RlKHUzMiBjcHVpZCwgc3RydWN0IGR0X2Rldmlj
ZV9ub2RlICpjcHVfbm9kZSk7DQo+ID4gK3ZvaWQgZHRfaW5pdF9jcHVfdG9wb2xvZ3kodm9pZCk7
DQo+ID4gKw0KPiA+ICsjZWxpZiBDT05GSUdfREVWSUNFX1RSRUVfUEFSU0UNCj4gPiArDQo+ID4g
K3N0YXRpYyBpbmxpbmUgdm9pZCBtYXBfY3B1aWRfdG9fbm9kZSh1MzIgY3B1aWQsIHN0cnVjdCBk
dF9kZXZpY2Vfbm9kZQ0KPiAqY3B1X25vZGUpIHt9DQo+IA0KPiBObyBuZXcgdXNlcyBvZiB1MzIg
cGxlYXNlLiBBcyB0byB1c2Ugb2YgZml4ZWQtd2lkdGggdHlwZSwgcGxlYXNlIHNlZQ0KPiAuL0NP
RElOR19TVFlMRS4NCg0KT2ssIEkgd2lsbCB1c2UgdW5zaWduZWQgaW50IGluc3RlYWQuDQoNClRo
YW5rIHlvdSwNCkhpcm9rYXp1IFRha2FoYXNoaS4NCg==

