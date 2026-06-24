Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9ST5JuidO2q4aQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 11:05:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F0D6BCCDF
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 11:05:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=qYoviFNS;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344679.1603724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcJXx-0004Jc-R8; Wed, 24 Jun 2026 09:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344679.1603724; Wed, 24 Jun 2026 09:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcJXx-0004H1-NZ; Wed, 24 Jun 2026 09:05:25 +0000
Received: by outflank-mailman (input) for mailman id 1344679;
 Wed, 24 Jun 2026 09:05:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wcJXw-0004Gv-0Z
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 09:05:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcJXu-004DsS-QO
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 11:05:23 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a3b9dcc-e002-0a2a0a5209dd-0a2a45019d5e-26
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 11:05:22 +0200
Received: from [52.101.228.100]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a3b9dcf-e031-0a2a45010019-3465e464b060-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 11:05:21 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYXP286MB5622.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2a2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 09:05:15 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 09:05:14 +0000
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
 b=TYcyAjzu7O4v5oPwWlsVWEMPv++mrhweVZ2s0iNA1SBCVCuSc5fxY7vrybijS6/3C+xYwbcQhWA54385kTYOf1aitmtYoIw7fVh15PC0mEy7Q3tl2pw+JDF+Ayj+MD3q5fGFFUd9tcRJIED7xOziH2pjyYnLmS1oICgwbHf2amEaXjt6hI2PEN9CZk9b31FNhzfxydeAuFQfnyM9QLbmaYi+zMZWumEnGP5AgzqFU6Hupx1P27D64YP/ogyW8jv0wlhWN2QlbDSrC5rbmwsAjpC4tp04ldKfiTwJRZ5ro5W6MRWby9GBUq/3uBo4G+MpPqVpkO2Pyt4RtBjWaYoxcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ufy2fOBobuiF16MVIH9M5dCvDvs8ggseKk5ElueCWvw=;
 b=W7Op0HSvRdYhIDO8th+S5eEn5N1781luH2Itg/m4X8GyJhTER3GZ5sVViDz/kMFI44cpvwXfiyzdTJjb6xbkmj4Ga4hJ7yCDvSwWU9KKNzEi5uYll+cmwurCBti/d0+I4rYUJJ6cIKzCCs9bvNls08vxUFxtPpi/oxXAIAM+NUFcngXeYPopqsvlM3jFe+ctHVpVM5nZvvE7Fq/M9RK5nogffV1mEs0WYxLfioJqv8GrKxsQT7FoGxkw4TuHsyANAKZsJra/L9ZfLCHfNUB3q+Wxg8nGnGYnEPWFeuhqNi5vd4S4pDxHlbuo5NBbR0OZxe1eVV2I4nipnTvrdTQyEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ufy2fOBobuiF16MVIH9M5dCvDvs8ggseKk5ElueCWvw=;
 b=qYoviFNS5/cjZVhf6OcNK8kwDWJqTGSNL9n6fautxOm1g8WKnWV7MKMBc65s9DEFNmDocvHYYtJXqoG+/CRKEXYJuXnm0UonR7L1A/gBbO6rp4csZrbr4SYlMwzFQ/TR3dyYw0YtvPEIijhAEIypSHoMucpA+/ugqhhPo2/AqH8=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 1/3] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Topic: [PATCH v2 1/3] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Index: AQHc/iieS3lBNqoSEkmC0mA+RhjVELZKgS4AgALq9XA=
Date: Wed, 24 Jun 2026 09:05:14 +0000
Message-ID:
 <OS9P286MB7222059ECD370CD6137B698982ED2@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260617071206.265599-1-taka@valinux.co.jp>
 <20260617071206.265599-2-taka@valinux.co.jp>
 <0c37c031-cc21-44d2-9ef6-4baf6f24d74b@suse.com>
In-Reply-To: <0c37c031-cc21-44d2-9ef6-4baf6f24d74b@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TYXP286MB5622:EE_
x-ms-office365-filtering-correlation-id: adb14cd8-2896-4b0d-cd57-08ded1cfb412
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|18002099003|22082099003|38070700021|5023799004|4143699003|56012099006|6133799003;
x-microsoft-antispam-message-info:
 3qoge/4lCnpSNCfaKah5BTC73/TnAd7LNHOpVLVv8UkYUbx1Xs2vDzK6tW+6e0ue0BBUqb3GahnQKRVI/IlDCbAN5js8RlHFhJzPvCHo/dyU/srBBBzMZhyRVj8Ty4AhlkUw7BC+D6ofxJ+Td2imr1OF21wW29djfLZhS/5JqS5FDoMhxTzA4Op1vv+g/7nHnu1ryHvUF8V9/M9A7umxyCD9HIz40ivFPf6hv41dhun2OErWnThoBy3vUsOoccZPt2N209Af8WqlsftvmpayVmV93RceKgQ+5hzsKrH8ne9d4O7puQgk+9vbrodGHvP4uFxW5dKH1QS9TpyqM/hV7S5Sfa1Nps2B6HoL3H79NYwGY9vWwyRz8WNiPPRfZR2MM4dERvvwCexnQebWgaxaeF3s2hCYzuxFuEudiSj0TzhbedNGYLIBIxarQZgEZNgDRvlWGcmiFCuoYizkjvhaS6bbSOzP6FpYGEbAP8EYZxkYZO6hlCDUw/w6q/yS0uLgCAJL+W9wvWW6A84+CWWmR/blmYYh+i8+WV55hmto5lZ80y/AmoaM2otOpfYSYLYWOTrDw5aXz/wbCVwgd8vnprzsis1zBQC+nPNbbcqJiq4wrOfYKZ0Boh1hYU88PwiDkAiT0kvau7OTc8kR/q6fUYPaTRz2M33XDPC6yIc+uKNzcttT9iXFGwaZhtVMq0ecXoQKFr+ogKBWoNUS6PF80o0LFNnRjMJI3gAYUMneT08=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(38070700021)(5023799004)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MlZtb296TnkydmtnQi93QlcyZDBTc05adDBHejlpSXpxWWZ6TkxWZVY1b2Vm?=
 =?utf-8?B?NzhybVEyK25xbzRKcnhvTzdQS2hHQUZoY0c0MFNWSDBMdnFUOGpGelNwYTlY?=
 =?utf-8?B?QmtiOURLS2t0cm9rYy9YdlhLWFdJa1c5UEFWYngzdk1NOG9ET0JZL1Z4Mm44?=
 =?utf-8?B?Q05WZldDL0pZNkF5bzZVUUVCT0JXMjhBeHo0UnRCZWFkUDR3M3U1NWRSYTZ6?=
 =?utf-8?B?dldSTXlYWjliWFRpR09jaFljMUttQ2FlU1IxRE5CRUxjODZpRnljdGsyR09n?=
 =?utf-8?B?dVI3dkhCNXBCQVU0ZFJMWkd3Z2JEU1BIVE5DOEVHTjVvSGlIaHJ2eDZZcGg5?=
 =?utf-8?B?K2x3WVVTd2UyMVZFREZjejRsOE0vNml3anBjZEhNYlU5MlNTOEsrbFl2WHlS?=
 =?utf-8?B?VlB6bGVUM0VaR3ZvSzN3Mko3WHg1R3M2bTVEd25mUU9SeDVmMTNTYUgraXZ4?=
 =?utf-8?B?SDdVQi8veU1OMHJvdnZxd0M1blNxdCtOVitZVmF3MURNYjJ5UU1lMVFxamZ6?=
 =?utf-8?B?dTNmU25ST1NmRWp2dldHdnZOUW96SHZsTlZ5UjZMOG1zVDVnNW9HcVdYVlhQ?=
 =?utf-8?B?K25Cc3loOTQ4Q3kxL2l3eHRNdktTcEh4T3g1QUlUTHlsTFV2c0RiZ1k3VEh1?=
 =?utf-8?B?a00vRm45YXpKbjczRmNZbys2MG1hMnp4UzYrME5iWkxybjZEa1JwQlQwUzVp?=
 =?utf-8?B?bTdlaER1UjdRdEhYYkFpZmZCRjN0aU42V0ZDb2QyWHRrYUFFNFB4NkZqMzNF?=
 =?utf-8?B?enllaEZITDB5MFVuSTQxdjhoTzAvZ01jRUlVU3ZKNXhNcklkWUFGeStjYm1o?=
 =?utf-8?B?NHdEa1pMZG93RnY3T3FSNTRMS2lRc0VpNzJJQWlxNHJBa3J6Z0lnbHkvVmFm?=
 =?utf-8?B?S3QwZ1AxOXllcGgxR1BKRS9UTFhRcUJWaFpMT0swQmo5RERUbWZMdmR6U0hI?=
 =?utf-8?B?UjE2V01HTUxGYlRlNURTbUJmMU1YSVVzNDB5aVF4c3BRZnZLcEViRmxEZmlI?=
 =?utf-8?B?NnJ0MTR0d1RuWUhlYWI5eEJHVGhpaGViWFJmMVFVUVYwb3o2dTJ5SFlCQUVo?=
 =?utf-8?B?cE1yTVNqVGo3WFd0TENLT0lmYjBLeWp6Z1hFRWhiV3ZFMGprS0ppcW9UZGZZ?=
 =?utf-8?B?STB1S01uUUNBd25CeUYvT1pJdis5WWsrUXJTNWswamdLbkZCYkhaZHhrQnRK?=
 =?utf-8?B?eWZhenRkZmF4aUpDQVlTZ2VjT0syN1VuaVhTNmowRng4U2o1b2dyYkZDMkto?=
 =?utf-8?B?QVh3UWtyc0NpSUZpM082VHNVYzRDVW15UzA3cXQ0bEdoTHpta0RSd3l0b2Z6?=
 =?utf-8?B?Y0Y0ODN5eWZlTmFuM0tjbnlrNTh0YTEyRk50OHJiOXFKV0RNVEtvZXFuMGJq?=
 =?utf-8?B?SFYyOUx4U0Nld2xqLzJzWUtlTVVLQ2NrRFZsaktUTVV3VlpNLy92OEVxK2py?=
 =?utf-8?B?Z0lSeUZrSEQyT0tMYnh2YVUreHlCamxzNEI2ZHhhREQzajVtSGdzd0pscSs3?=
 =?utf-8?B?dFlaNjFsZUpzaFh4Ylh4R1JhSVNMWlRzaTZ1eUNsL0dIYlRNUUlINzNPQmhZ?=
 =?utf-8?B?T2V2U1RtMXhKaWFSRkdqQ2hjaGsrcTV2bkxoTS81YkU5aGQ0b2g2ckZOUEVp?=
 =?utf-8?B?MkxRTkp2cDdXRVliWEs1OFVyTURGaUpjK0FxdllsK0MrbW1vT3JUek9tM3JZ?=
 =?utf-8?B?MythYS9Fa3krNW1ldTVqdUhxaGpHYm42MmxMbStteEkrdmdWaWxveWtTTUd4?=
 =?utf-8?B?TkhnVEsyRDhmUDl0ckRKS3ZrYUp5SFBtQ3BoS3MyaTMzcng0WUR1M0x2ZXh3?=
 =?utf-8?B?NUU2TEpYUTM2dXdMYkdLUzJBQXhqU0NaZEdUektsZkVmTU9VY1NPMGJUM1Jw?=
 =?utf-8?B?TnAyN0RpQ2RycVF5WkxjL2RuK3NzckxBR2Rtano0enZpNkFhYXhyRkp5cDd2?=
 =?utf-8?B?elhoYWd5TVhnQndQZEE1dWRDS25MMC9EVVlETW0vTzFXTi9QRmVCSmcvZTRW?=
 =?utf-8?B?MDE3VlQ5MjR6UC9SeFJYbHJSWG5xY2JGQitMMVl5WTdJSmgrSm9NTUVsL2Fp?=
 =?utf-8?B?WmFUNjFlaWM3SmxtV1ZrWUU0Z1JKYkFiQ1lkcG9ZOTRPR254M2VaV0xFaDV5?=
 =?utf-8?B?KzQySVVxeXo2di9IaTg4OVYwankzZmJkbVJEdUFvdlo2WlV2ekt5QktSTGJw?=
 =?utf-8?B?VDNJTk1yZk8vMWlmWGFkclFCcHk4ZFpCYnJML0kyOEpqYXk2cVJqV0hXdXhO?=
 =?utf-8?B?NEh0SEU0RHFkM3BoNEdqdk9OdHc1SldGZ1MzUThDUFZNdEtGSzJLbnc2ZFd6?=
 =?utf-8?Q?Mev50i9Ger0xPzeyjV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: adb14cd8-2896-4b0d-cd57-08ded1cfb412
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 09:05:14.2416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h/F0ZcnTcoohFYPv+b0XhEAcfx54YiNovGPlWa8jGt5j4dm6F58wcLm/uESKf+qvq0vrOzwfl+gK1w+95zPf5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXP286MB5622
X-purgate-ID: tlsNG-d62444/1782291922-497B6E30-D2BD594F/0/0
X-purgate-type: clean
X-purgate-size: 6562
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,valinux.co.jp:dkim,valinux.co.jp:from_mime,OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM:mid];
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
X-Rspamd-Queue-Id: 52F0D6BCCDF

SGVsbG8sDQoNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIveGVuL2NvbW1vbi9jcHUtdG9w
b2xvZ3kuYw0KPiA+IEBAIC0wLDAgKzEsMzAgQEANCj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIgKi8NCj4gPiArDQo+ID4gKyNpbmNsdWRlIDx4ZW4vY3B1
bWFzay5oPg0KPiA+ICsjaW5jbHVkZSA8eGVuL2NwdS10b3BvbG9neS5oPg0KPiA+ICsjaW5jbHVk
ZSA8eGVuL2luaXQuaD4NCj4gPiArI2luY2x1ZGUgPHhlbi9hY3BpLmg+DQo+ID4gKw0KPiA+ICt2
b2lkIF9faW5pdCBpbml0X2NwdV90b3BvbG9neSh2b2lkKQ0KPiA+ICt7DQo+ID4gKyAgICBjb25z
dCB1bnNpZ25lZCBpbnQgbnJfY3B1cyA9IGNwdW1hc2tfbGFzdCgmY3B1X3Bvc3NpYmxlX21hcCkg
Kw0KPiAxVTsNCj4gPiArDQo+ID4gKyAgICBjcHVfdG9wb2xvZ3kgPSB4emFsbG9jX2FycmF5KHN0
cnVjdCBjcHVfdG9wb2xvZ3ksIG5yX2NwdXMpOw0KPiANCj4gY3B1X3RvcG9sb2d5IGV4aXN0cyBh
cyBhIGdsb2JhbCB2YXJpYWJsZSBvbmx5IHdoZW4gRFQgaXMgaW4gdXNlLiBJIHRoaW5rIHRoZQ0K
PiBkZWZpbml0aW9uIG5lZWRzIHRvIG1vdmUgaGVyZSAoZnJvbSBjb21tb24vZGV2aWNlLXRyZWUv
Y3B1LXRvcG9sb2d5LmMpLg0KDQpPa2F5DQoNCj4gQXMgdG8gdGhlIHNpemUgb2YgdGhlIGFycmF5
LCBpdCdzIG5vdCBxdWl0ZSBjbGVhciB0byBtZSB3aGV0aGVyIGJ5IGRvaW5nIGl0DQo+IHRoaXMg
d2F5IChpbnN0ZWFkIG9mIHVzaW5nIG5yX2NwdV9pZHMpIHdlJ3JlIG5vdCBzZXR0aW5nIG91cnNl
bHZlcyB1cCBmb3INCj4gdHJvdWJsZS4NCg0KT24gQVJNNjQgWGVuLCBucl9jcHVfaWRzIHJlcHJl
c2VudHMgdGhlIHRvdGFsIG51bWJlciBvZiBwb3B1bGF0ZWQvYXZhaWxhYmxlIA0KQ1BVcywgYnV0
IHVuZm9ydHVuYXRlbHkgaXQgY2Fubm90IGJlIHJlbGllZCB1cG9uIGFzIHRoZSBtYXhpbXVtIENQ
VSBJRC4gDQoNCkZvciBpbnN0YW5jZSwgaWYgYSBDUFUgbm9kZSBpbiB0aGUgRGV2aWNlIFRyZWUg
aGFzIGFuIGludmFsaWQgJ2VuYWJsZS1tZXRob2QnIA0KcHJvcGVydHksIHRoYXQgQ1BVIElEIHNs
b3QgaXMgc3RpbGwgY29uc3VtZWQgZHVyaW5nIHRoZSBpbml0aWFsIHBhcnNpbmcsIGJ1dCANCnRo
ZSBDUFUgaXMgbm90IGNvdW50ZWQgdG93YXJkcyBucl9jcHVfaWRzLiBUaGlzIGNhbiByZXN1bHQg
aW4gYSBzcGFyc2UgQ1BVIElEIA0KYWxsb2NhdGlvbiB3aGVyZSB0aGUgbWF4aW11bSBDUFUgSUQg
YWN0dWFsbHkgZXhjZWVkcy4gDQoNCklmIHdlIHdlcmUgdG8gdXNlIG5yX2NwdV9pZHMgYXMgdGhl
IGFycmF5IHNpemUgaGVyZSwgd2Ugd291bGQgcmlzayBhbiANCm91dC1vZi1ib3VuZHMgYWNjZXNz
IHVuZGVyIHN1Y2ggZmF1bHR5IERldmljZSBUcmVlIGNvbmZpZ3VyYXRpb25zLiBUaGlzIGlzIA0K
d2h5IEkgdXNlZCAiY3B1bWFza19sYXN0KCZjcHVfcG9zc2libGVfbWFwKSArIDFVIiB0byBlbnN1
cmUgdGhlIGFycmF5IGlzIA0KbGFyZ2UgZW5vdWdoIHRvIGNvdmVyIHRoZSBoaWdoZXN0IGFsbG9j
YXRlZCBDUFUgSUQuDQoNCkNvbnNlcXVlbnRseSwgdGhlcmUgbWlnaHQgYWN0dWFsbHkgYmUgcG90
ZW50aWFsIGJ1Z3MgaW4gb3RoZXIgcGFydHMgb2YgWGVuIA0Kd2hlcmUgbnJfY3B1X2lkcyBpcyBp
bmNvcnJlY3RseSBhc3N1bWVkIHRvIGJlIHRoZSB1cHBlciBib3VuZCBmb3IgQ1BVIElEIA0KaW5k
ZXhpbmcgb24gQVJNLg0KDQo+ID4gKyAgICBpZiAoICFjcHVfdG9wb2xvZ3kgKQ0KPiA+ICsgICAg
ICAgIHBhbmljKCJGYWlsZWQgdG8gYWxsb2NhdGUgbWVtb3J5IGZvciBjcHVfdG9wb2xvZ3kgYXJy
YXlcbiIpOw0KPiANCj4gSSBxdWVzdGlvbiBzdWNoIHVzZXMgb2YgcGFuaWMoKTogU3VyZWx5IHdl
IGNhbiBkbyB3aXRob3V0IGFueSBOVU1BIGluZm8sDQo+IGl0J3Mgb25seSBwZXJmb3JtYW5jZSB3
aGljaCBpcyBnb2luZyB0byBzdWZmZXIuDQoNCk9rYXksIEkgd2lsbCByZXBsYWNlIHRoZSBwYW5p
YygpIHdpdGggYSBYRU5MT0dfV0FSTklORyBwcmludGsuDQoNCj4gPiArDQo+ID4gK3N0YXRpYyBz
dHJ1Y3QgZHRfZGV2aWNlX25vZGUgKiBfX2luaXQgZHRfZmluZF9jaGlsZF9ub2RlX2J5X25hbWUo
c3RydWN0IGR0X2RldmljZV9ub2RlICpmcm9tLCBjb25zdCBjaGFyICpuYW1lKQ0KPiANCj4gTml0
OiBPdmVybG9uZyBsaW5lIGhlcmUsIGFuZCAuLi4NCg0KT2theSwgSSB3aWxsIGZpeCBpdC4NCg0K
PiA+ICtzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9jb3JlKHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAq
Y29yZSwNCj4gPiArICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBwYWNrYWdlX2lkLCB1bnNp
Z25lZCBpbnQgY2x1c3Rlcl9pZCwNCj4gPiArICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBj
b3JlX2lkKQ0KPiANCj4gLi4uIGJvZ3VzIGluZGVudGF0aW9uIGUuZy4gaGVyZS4gUGxlYXNlIGdv
IHRob3VnaCB5b3Vyc2VsZiB0byBjaGVjayBzdHlsZS4NCg0KT2theS4NCg0KPiA+IC0tLSAvZGV2
L251bGwNCj4gPiArKysgYi94ZW4vZHJpdmVycy9hY3BpL3RvcG9sb2d5LmMNCj4gPiBAQCAtMCww
ICsxLDM4IEBADQo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxh
dGVyICovDQo+ID4gKw0KPiA+ICsjaW5jbHVkZSA8eGVuL2NwdW1hc2suaD4NCj4gPiArI2luY2x1
ZGUgPHhlbi9jcHUtdG9wb2xvZ3kuaD4NCj4gPiArI2luY2x1ZGUgPHhlbi9pbml0Lmg+DQo+ID4g
KyNpbmNsdWRlIDx4ZW4vYWNwaS5oPg0KPiA+ICsNCj4gPiArLyoNCj4gPiArICogVG9EbzogUG9w
dWxhdGUgdGhlIHRvcG9sb2d5IGluZm9ybWF0aW9uIGJ5IHNjYW5uaW5nIHRoZSBBQ1BJDQo+ID4g
KyAqICAgICAgIFBQVFQgKFByb2Nlc3NvciBQcm9wZXJ0aWVzIFRvcG9sb2d5IFRhYmxlKS4NCj4g
DQo+IFBsZWFzZSBjYW4gdGhpcyBiZSBzcGVsbGVkICJUT0RPOiIsIHRvIHN0YW5kIG91dCBtb3Jl
IGFuZCB0byBiZSBhIGhpdCBhbHNvDQo+IHdpdGggY2FzZSBzZW5zaXRpdmUgZ3JlcCBmb3IgIlRP
RE8iPw0KDQpPa2F5Lg0KDQo+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2FjcGkuaA0KPiA+ICsr
KyBiL3hlbi9pbmNsdWRlL3hlbi9hY3BpLmgNCj4gPiBAQCAtMTAxLDYgKzEwMSw4IEBAIHZvaWQg
YWNwaV90YWJsZV9wcmludCAoc3RydWN0IGFjcGlfdGFibGVfaGVhZGVyDQo+ICpoZWFkZXIsIHVu
c2lnbmVkIGxvbmcgcGh5c19hZGRyDQo+ID4gIHZvaWQgYWNwaV90YWJsZV9wcmludF9tYWR0X2Vu
dHJ5IChzdHJ1Y3QgYWNwaV9zdWJ0YWJsZV9oZWFkZXIgKm1hZHQpOw0KPiA+ICB2b2lkIGFjcGlf
dGFibGVfcHJpbnRfc3JhdF9lbnRyeSAoc3RydWN0IGFjcGlfc3VidGFibGVfaGVhZGVyICpzcmF0
KTsNCj4gPg0KPiA+ICt2b2lkIGFjcGlfaW5pdF9jcHVfdG9wb2xvZ3kodm9pZCk7DQo+ID4gKw0K
PiA+ICAvKiB0aGUgZm9sbG93aW5nIGZvdXIgZnVuY3Rpb25zIGFyZSBhcmNoaXRlY3R1cmUtZGVw
ZW5kZW50ICovDQo+ID4gIHZvaWQgYWNwaV9udW1hX3NsaXRfaW5pdCAoc3RydWN0IGFjcGlfdGFi
bGVfc2xpdCAqc2xpdCk7DQo+ID4gIHZvaWQgYWNwaV9udW1hX3Byb2Nlc3Nvcl9hZmZpbml0eV9p
bml0KGNvbnN0IHN0cnVjdA0KPiBhY3BpX3NyYXRfY3B1X2FmZmluaXR5ICopOw0KPiA+IEBAIC0x
MzMsNiArMTM1LDggQEAgc3RhdGljIGlubGluZSBpbnQgYWNwaV9ib290X3RhYmxlX2luaXQodm9p
ZCkNCj4gPiAgCXJldHVybiAwOw0KPiA+ICB9DQo+ID4NCj4gPiArc3RhdGljIGlubGluZSB2b2lk
IGFjcGlfaW5pdF9jcHVfdG9wb2xvZ3kodm9pZCkge30NCj4gDQo+IFRoaXMgc2hvdWxkbid0IGJl
IG5lZWRlZC4gV2hlbiBBQ1BJPXksIGFjcGlfZGlzYWJsZWQgaXMgY29tcGlsZS10aW1lIHRydWUs
DQo+IGFuZCBoZW5jZSB0aGUgY29tcGlsZXIgY2FuIGFuZCB3aWxsIERDRSB0aGUgY2FsbC4gQWxs
IGl0IG5lZWRzIHRvIHNlZSBpcyBhDQo+IGRlY2xhcmF0aW9uLCB3aGljaCB0aGVyZWZvcmUgd2Fu
dHMgdG8gbW92ZSBvdXRzaWRlIG9mIHRoZSBDT05GSUdfQUNQSQ0KPiBjb25kaXRpb25hbC4NCg0K
b2theQ0KIA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vY3B1
LXRvcG9sb2d5LmgNCj4gPiBAQCAtMCwwICsxLDM2IEBADQo+ID4gKy8qIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8NCj4gPiArDQo+ID4gKyNpZm5kZWYgWEVOX0NQVV9U
T1BPTE9HWV9IDQo+ID4gKyNkZWZpbmUgWEVOX0NQVV9UT1BPTE9HWV9IDQo+ID4gKw0KPiA+ICsj
aW5jbHVkZSA8eGVuL3R5cGVzLmg+DQo+ID4gKyNpbmNsdWRlIDx4ZW4vZHQtY3B1LXRvcG9sb2d5
Lmg+DQo+ID4gKw0KPiA+ICtzdHJ1Y3QgY3B1X3RvcG9sb2d5IHsNCj4gPiArICAgIGNwdW1hc2tf
dCB0aHJlYWRfc2libGluZzsNCj4gPiArICAgIGNwdW1hc2tfdCBjb3JlX3NpYmxpbmc7DQo+ID4g
KyAgICBjcHVtYXNrX3QgY2x1c3Rlcl9zaWJsaW5nOw0KPiA+ICt9Ow0KPiANCj4gV2l0aCBodWdl
IE5SX0NQVVMgdGhpcyBjYW4gYmUgcHJldHR5IGxhcmdlIGEgc3RydWN0IChvZiB3aGljaCBpbiBp
bml0X2NwdV90b3BvbG9neSgpDQo+IHlvdSBhbGxvY2F0ZSBhbiBhcnJheSkuIEltbyB5b3Ugd2Fu
dCB0byB1c2UgY3B1bWFza192YXJfdCBoZXJlLCB3aXRoIGFsbG9jYXRpb24gYWRkZWQNCj4gYXMg
bmVlZGVkLg0KDQpPa2F5Lg0KDQo+ID4gKw0KPiA+ICsNCj4gDQo+IE5pdDogTm8gZG91YmxlIGJs
YW5rIGxpbmVzIHBsZWFzZS4NCg0KT2theS4NCg0KVGhhbmsgeW91LA0KSGlyb2thenUgVGFrYWhh
c2hpLg0K

