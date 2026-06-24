Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tQuiICymO2pDawgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 11:41:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E31B06BD025
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 11:40:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=VOrJbSuq;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344713.1603756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcK6B-0002G0-2D; Wed, 24 Jun 2026 09:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344713.1603756; Wed, 24 Jun 2026 09:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcK6A-0002Bs-Ua; Wed, 24 Jun 2026 09:40:46 +0000
Received: by outflank-mailman (input) for mailman id 1344713;
 Wed, 24 Jun 2026 09:40:45 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wcK68-00028r-K6
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 09:40:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcK68-004N96-0i
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 11:40:44 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a3ba614-e002-0a2a0a5209dd-0a2a45059402-14
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 11:40:43 +0200
Received: from [52.101.229.128]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a3ba618-ef3d-0a2a45050019-3465e580c69f-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 11:40:42 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY7P286MB6708.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:323::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 09:40:38 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 09:40:37 +0000
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
 b=w5xc8H6tsQTCP/w1Vx1LhmavJWUAUQbinhPxGUvIaOjpV5wsQxdCYD4kp0fjesCFc3geD32GF37NPhHVInXI5wJA41AmnwAWr+XHVTBt/dUdufZAU4drGUt+hJkKPOtjkav6c7WoRO9fdrYbySxhSGHMXqvihw7TgU9KMH/wXqvIDIPNyF+hfK2c6Dd4pZFdDWRC0KQU9Iz0eVKLFOe6VXulXXkn4wVKl/pqMxoRNDjvWBcc9nJETuMjH5VpG/4xTYh/xPhjMhK/WJ2ek/TsspXqLspaUStz0EzWSYHwwtTx16eK1sbGIXjd4KfGYMTzH05SoerDjf2RPqGuHa1KXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dXviQYPFcypXFYLM/XmTlMk93WlIy72PNblg3kjgEY=;
 b=jbYSAkMlOzjkYRfqT+y+3ZzHKf5Pt3GeAYbCQQf72PP7nx+ysDufIrtZiqMGeEQQ8i0Omyx1MegW5Nfy+h2w+kq8tQZu1GMo4JqTQ6BnC5z5MfrJHKwYsL2PgtDR161PLd2sRII3LbPR+0C25uLJo8wxYEW61nf8NWJF24Yd60NvmZPZrgajSjcpvGWtA+sQg9BmFMMKKZ2AopxJ0kUzfH6WgkZnysbShN4ZXAiOiCU1KHAAsywE4mkqqs039aUF+OoxYdDLr26cW9YYFPoy6FZNrWvxCqX/jIVqlfJdFyW9Ecx99Qn4w+ztuPFxAfYEdrUnGfhAIjKFvcwuvBSKDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dXviQYPFcypXFYLM/XmTlMk93WlIy72PNblg3kjgEY=;
 b=VOrJbSuq8NNiW7f3j4seUdoYoenR8Sn+27hvQP3kekTaxHSIJkh2ZYfjzWlD5QfPwq0Fk7GkmRaFaHJyXoTY5m/pAFsqlPUzwGjhy7jNALwTw6Tg62Z3Ex+5dHdTECwdXinciWauP304Pm4cfoYh4XVaFDUy23uZHJE45c9DWf0=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Dario
 Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 3/3] xen/sched: Make cpu_nr_siblings()
 architecture-specific
Thread-Topic: [PATCH v2 3/3] xen/sched: Make cpu_nr_siblings()
 architecture-specific
Thread-Index: AQHc/iigOqL0BnGAM0Om5K/tToBK0rZKmlYAgALcNwA=
Date: Wed, 24 Jun 2026 09:40:37 +0000
Message-ID:
 <OS9P286MB722263C23B2588D92D347BF582ED2@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260617071206.265599-1-taka@valinux.co.jp>
 <20260617071206.265599-4-taka@valinux.co.jp>
 <ec182f69-c5b2-481a-bb2f-cfd680036ac2@suse.com>
In-Reply-To: <ec182f69-c5b2-481a-bb2f-cfd680036ac2@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TY7P286MB6708:EE_
x-ms-office365-filtering-correlation-id: fc8ccc84-ebc8-4410-dea1-08ded1d4a57e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|38070700021|18002099003|22082099003|4143699003|56012099006;
x-microsoft-antispam-message-info:
 V9j+M1rJnsB6LucoFeto9t0lo7M5OtUSCmhUr3QwAF7JkkgWITTg/qzqPdoeVzy/k/Z2vgU3BV6B1vLAr9GdE/iIpF/nXfnzjzWj2K+m6FBipdwfalcZCZ93h1sRy4dysiVMkdwUbGoNkOc1GcighP+Q8pbcSR5cL40WB1uFu3bI4VQQ8Uvn3nno7XhqgOT3BN8718jUNHNGFBh1RY8PF+dspCWX6PC91iBXSekNng9B4VTYegOUiQ5r5QLf58YckXm94Yf+09ZLA5L9xopn9uhIY6VPwibO1YDnnLtFOHAe/3wnbh6gb43IpfeW6ubB0dlgJ/iDrgM4xDzXgV5rE71pYeyY/g8wqcPBCaRAt9Yu/56D2Ml1sIeqAzEUzJ4veqYb+eyb1P8+92c9q0AM2S0L92JN9ZtUQ8aEydzuHuEix7SHvJnP66gGaATEYJMLRS77NHW0OXFH4cqnCU4t74WvmanvqRv/yIBi0j9QsaeFvW1Cyv4vaJKj/gAUcjRjC6/1TfxngQ8837SQUP4je3IXaLwyvIi0OLHDbS+a2pd6BtWZ7/c6TKb10F5lxehhZWoTnlpFV/0j/VWjWFIQEdxRUrMUHl3IPLmfQbYTHVC7PL7UU2moZGsMiXJifFTlvrvSziCZcLEL2rMXjP81Cqif2lJJFsYHZ/UbUMhO7HVJYEchx4KUymz5vVg6LMRJRx3M1lHRefVhI/7jEIPbOy0MrV8r5MfQ30nTWPaNeAA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(38070700021)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YjRkYlJVaEdna013c0JMc2VjcUFRd3A2ZWhGc24ybW9YMWxSdmlncWU4WjY2?=
 =?utf-8?B?bUk3UmE1RnN2RmZlOW1jd0pxcWNtYWVBOWlQUjYvU0pLejQ3Q09iVlFOeUs0?=
 =?utf-8?B?cE9HVnV2NXI0aG1aZlIxeHV3NzJucTYzNmxZaUtMK0F5d1hVLys5YkZYekxS?=
 =?utf-8?B?YXZVQjZiL1pCSkNXYXhFNlVNT1U4eXNaUHRUZ0J5dVZuRk1ocVNLcklCOEtB?=
 =?utf-8?B?L29xMmRSRVdZdXlMWG9tUm81UTZkNGhJSWFUblBybmp2eks2QTZFR1VVZVlT?=
 =?utf-8?B?MVF2QWhPRkRBVHhMQVJmdU5BV0lBNjFCOVVTQ0trNTNLV2gwV1RjZ2NVZVJX?=
 =?utf-8?B?a3A2cDZIUDJGTE9XSHJpK3Nsa3JEQ1g2emlLLzVZV3BFa1BoNndtSUZhaUZP?=
 =?utf-8?B?RXRRQnNFSHdPSnVmQ0l1VXlSQXNWUkpiY1l2Nk56eE84Sy83RGNzV3BNSmpI?=
 =?utf-8?B?K0E3c2lVYkF4Z3JtYVVZakh5UUZYRkw2eWJGWkRnemRkSHhHVWszSVZtSVF4?=
 =?utf-8?B?ZElCcnhMcHlsT1NYaCtjVVcyWFJQdEc0ZmJrYUxuZHE1VWUxM1ZreWlnUkRl?=
 =?utf-8?B?djJaMXU5Q0V4VEJkVGZtZkR4R05FMUorb3hWOFkrZENSclFjcWorbCtHYS93?=
 =?utf-8?B?R1RJb1hmMFM4M1JJMDRuZ2hFS1NXcjhkL2dOWGNsdlhTei9Zdm9CK0p6OEpQ?=
 =?utf-8?B?RTZCSmF4cGIvMEdpMy8xUG5RZVI2dUVXL0xiMVJVS3hRMFkzY0dvMStqenM5?=
 =?utf-8?B?RkNxc2lsbzhFeXE0WGRuOXBVc1Q1VHpDZE05dURkelRnNW54OU5tQzJ5N3Fs?=
 =?utf-8?B?OWdKMDZJN2tYSU5xdEZYaE1TelRRdWErVG9PNmRYcEpEdFBWb2RFUEhmVjcy?=
 =?utf-8?B?aVJkVURqRmpHYkNJcE9HVmdmRGlyWmdFZk9WdVAvK0ZHUjVPbS9LQk51ZDJi?=
 =?utf-8?B?cEpZRGlKdFJEbGw1dis3THhPSTVJT3luQjYwRU5Nc1JXSDM0c0NyNVhEUDd0?=
 =?utf-8?B?NXJLQ3ZURDBqUXhjTkZyUUVDWFF6MEZwVUc2SGprajM1dG9UVTY3ekhOKzZW?=
 =?utf-8?B?eHFnTnZxOFhXM3dIcTVPTjFPMTI2VGh2eTFMR1NjRFlUcjc4L1ZFY3BLNmlK?=
 =?utf-8?B?dnpuVWVNc3hEdGw0YmpZV09tcWpKb0M0Y3lNQU92R21ZclRCMy9kdmJXUzRD?=
 =?utf-8?B?QWRaU2l3MW5pUTl6K282MXBVZW5WcDVacVNXOEZqa1JRR3Z0MUFTVG9hc0Iy?=
 =?utf-8?B?RjE4M0dTeVdMOHJtbWw1S2ZYazNjaUhLcGhiSUsrelk0ZTRhelFKRm5Ec3d6?=
 =?utf-8?B?OERpbWdoaUwzd1VDTDJpcUpFeFQ5UERnVTFKbnVWeFIvZVN5bDZISkcxZ3dQ?=
 =?utf-8?B?UjR6cTdXM0ZaRXNvSEVNNFFudStOd0p1Tm05UUdyTnNRTlN6ZjBtZUZINHk0?=
 =?utf-8?B?UUVYU3hjYlJJcDU4VTA1S2NzL2QwczB3N2VEWGV3K0h4NlBuYjVoSGNwS0Uv?=
 =?utf-8?B?SmEzdUVFb0NnOEZxMGNJVEM3ckJoaDB6YVBzYWhHelVGRll1d1V2MHBCdTJk?=
 =?utf-8?B?bVcwdWhjMisySHRpeWV2UExWWUJyN0xWek5iaHhwbDhwNG8vWm1KcDVmb0w2?=
 =?utf-8?B?S3FoSzZkWHdYU25mVUdPSXpzUTUzZDNMaUIzNFY4RzYzeVFiSW11M01iTTgr?=
 =?utf-8?B?RU5mODF1Rmc3U1pNZ1VWWFV4aUQ5dGRMM3daZi9GaERmYlMwQ0hCd09xV1hB?=
 =?utf-8?B?d0NVV3h6QzIrSVhqZUduNGNjV2Y1My9aN1NHUTloRnkyTmlqUXJWcnprTW1t?=
 =?utf-8?B?a21ieXl2cFZhNVhiTGlNdDViYXFCTTJLUnVka3h2cGRZYkJlRXhJbzZXR0hz?=
 =?utf-8?B?QmpGR3o4d2VhcURkb3k3MTkzVjJzVEowWjdTUk1uRElwcWJEUmRwOTNvQlJt?=
 =?utf-8?B?bGJ3VndYdTBVcXR4bjhxbTZjbm5kcHhEMnZNUHJGUnhrY3dYOTVDWjNkb2RL?=
 =?utf-8?B?ZlZVZ1FtY1NUeFEyeldEbUMvRktnK3ZoTDI3RUVDazBrZnlzUVRKTC9mUEdP?=
 =?utf-8?B?T200bU9ja3Ewd1g4RTlaeFFCYUVaNWFPazJwSGNOWERiQUpEc3BGbndOaHds?=
 =?utf-8?B?QmZCb2ZGekdqRFJsR1ZjTjNrNmQ3TkdySDYvSmUwQnVCMDZWRERmY2E2QTBC?=
 =?utf-8?B?bC9KRm0zWm0vUlJ4QWsxSE9rSnE3ZERqeVlPdzliM01IQjF5TVhyRUNBbjBl?=
 =?utf-8?B?SDFOQVBoZ2dZeTlvRXByQVlDRWlFQk1pL2lWYnJlSFhSdjNvVnFMKzRUd0t1?=
 =?utf-8?Q?sX3HY8rNdStz0TZyBp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8ccc84-ebc8-4410-dea1-08ded1d4a57e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 09:40:37.2615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HvaTZzY+ZdnE2Zxwo69uMesM2/rvC3cin2ulsBowBzuHPyrXYpbtLDRHt6UkVt6VMGRgu/fxvJ8/1z/xUcQ5Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6708
X-purgate-ID: tlsNG-c201ff/1782294043-9C9CD127-B16CDB94/0/0
X-purgate-type: clean
X-purgate-size: 3544
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.08 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E31B06BD025

SGVsbG8sDQoNCj4gT24gMTcuMDYuMjAyNiAwOToxMiwgSGlyb2thenUgVGFrYWhhc2hpIHdyb3Rl
Og0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaA0KPiA+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaA0KPiA+IEBAIC0xMDYsNiAr
MTA2LDcgQEAgZXh0ZXJuIHZvaWQgaW50ZWxfaW5pdF9hcmF0KHZvaWQpOw0KPiA+DQo+ID4gICNk
ZWZpbmUgY3B1X3RvX2NvcmUoX2NwdSkgICAoY3B1X2RhdGFbX2NwdV0uY3B1X2NvcmVfaWQpDQo+
ID4gICNkZWZpbmUgY3B1X3RvX3NvY2tldChfY3B1KSAoY3B1X2RhdGFbX2NwdV0ucGh5c19wcm9j
X2lkKQ0KPiA+ICsjZGVmaW5lIGNwdV9ucl9zaWJsaW5ncyhfY3B1KSAoY3B1X2RhdGFbX2NwdV0u
eDg2X251bV9zaWJsaW5ncykNCj4gDQo+IFRoaXMgaXMgdW5pZm9ybWx5IGF2YWlsYWJsZSB3aGVu
IGJ1aWxkaW5nIHg4Ni4gQW4gZWFybGllciBwYXRjaCBhZGRzIGFuDQo+ICNpbmNsdWRlIG9mIHRo
ZSBuZXcgY3B1LXRvcG9sb2d5LmggLi4uDQoNCiJUaGUgY3B1LXRvcG9sb2d5LmggaGVhZGVyIGlz
IGludGVuZGVkIGZvciBub24teDg2IGFyY2hpdGVjdHVyZXMgd2hlcmUgdG9wb2xvZ3kNCmluZm9y
bWF0aW9uIGlzIHJldHJpZXZlZCBmcm9tIERldmljZSBUcmVlIG9yIEFDUEkuIA0KRm9yIHg4Niwg
SSB3aWxsIGVuc3VyZSB0aGF0IGl0IGlzIHByb3Blcmx5IGRpc2FibGVkIHRvIGF2b2lkIGFueSBj
b25mbGljdHMuIg0KDQo+ID4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQyLmMNCj4gPiAr
KysgYi94ZW4vY29tbW9uL3NjaGVkL2NyZWRpdDIuYw0KPiA+IEBAIC0yOSwyMiArMjksNiBAQA0K
PiA+ICAvKiAjZGVmaW5lIGQycHJpbnRrIHByaW50ayAqLw0KPiA+ICAjZGVmaW5lIGQycHJpbnRr
KHguLi4pDQo+ID4NCj4gPiAtLyoNCj4gPiAtICogVE9ETzogQWJzdHJhY3QgdGhpcyBwcm9wZXJs
eSwgYW5kIGZpZ3VyZSBvdXQgd2hhdCBDcmVkaXQyIHdhbnRzIHRvIGRvIHdpdGgNCj4gPiAtICog
ICAgICAgdGhlIGZhY3QgdGhhdCB4ODZfbnVtX3NpYmxpbmdzIGRvZXNuJ3QgZXZlbiBoYXZlIHRo
ZSBzYW1lIG1lYW5pbmcNCj4gPiAtICogICAgICAgYmV0d2VlbiB4ODYgdmVuZG9ycy4NCj4gPiAt
ICovDQo+ID4gLXN0YXRpYyB1bnNpZ25lZCBpbnQgY3B1X25yX3NpYmxpbmdzKHVuc2lnbmVkIGlu
dCBjcHUpDQo+ID4gLXsNCj4gPiAtI2lmZGVmIENPTkZJR19YODYNCj4gPiAtICAgIHJldHVybiBj
cHVfZGF0YVtjcHVdLng4Nl9udW1fc2libGluZ3M7DQo+ID4gLSNlbGlmIGRlZmluZWQoQ09ORklH
X0NQVV9UT1BPTE9HWSkNCj4gPiAtICAgIHJldHVybiBjcHVfdG9wb2xvZ3lbY3B1XS5udW1fc2li
bGluZ3M7DQo+ID4gLSNlbHNlDQo+ID4gLSAgICByZXR1cm4gMTsNCj4gPiAtI2VuZGlmDQo+ID4g
LX0NCj4gDQo+IC4uLiB0byB0aGlzIGZpbGUsIHRodXMgYWxsb3dpbmcgZm9yIHRoZSBzdGF0aWMg
ZnVuY3Rpb24gdG8gYmUgZHJvcHBlZC4gSG93ZXZlciwNCj4gLi4uDQo+IA0KPiA+IC0tLSBhL3hl
bi9pbmNsdWRlL3hlbi9jcHUtdG9wb2xvZ3kuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9j
cHUtdG9wb2xvZ3kuaA0KPiA+IEBAIC0yNCw2ICsyNCw3IEBAIHZvaWQgaW5pdF9jcHVfdG9wb2xv
Z3kodm9pZCk7DQo+ID4NCj4gPiAgI2RlZmluZSBjcHVfdG9fY29yZShjcHUpICAgKGNwdV90b3Bv
bG9neVtjcHVdLnBoeXNfY29yZV9pZCkNCj4gPiAgI2RlZmluZSBjcHVfdG9fc29ja2V0KGNwdSkg
ICAoY3B1X3RvcG9sb2d5W2NwdV0ucGh5c19zb2NrZXRfaWQpDQo+ID4gKyNkZWZpbmUgY3B1X25y
X3NpYmxpbmdzKGNwdSkgKGNwdV90b3BvbG9neVtjcHVdLm51bV9zaWJsaW5ncykNCj4gPg0KPiA+
ICAjZWxzZSAvKiBDT05GSUdfQ1BVX1RPUE9MT0dZICovDQo+ID4NCj4gPiBAQCAtMzEsNiArMzIs
NyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaW5pdF9jcHVfdG9wb2xvZ3kodm9pZCkge30NCj4gPg0K
PiA+ICAjZGVmaW5lIGNwdV90b19jb3JlKGNwdSkgICAoMFUpDQo+ID4gICNkZWZpbmUgY3B1X3Rv
X3NvY2tldChjcHUpICgwVSkNCj4gPiArI2RlZmluZSBjcHVfbnJfc2libGluZ3MoY3B1KSAoMVUp
DQo+ID4NCj4gPiAgI2VuZGlmIC8qIENPTkZJR19DUFVfVE9QT0xPR1kgKi8NCj4gDQo+IC4uLiBv
bmUgb2YgdGhlIHR3byAjZGVmaW5lLXMgd2lsbCB0YWtlIGVmZmVjdCBoZXJlLiBXaGljaGV2ZXIg
b25lIGl0IGlzLCBpdCdsbA0KPiBjb25mbGljdCB3aXRoIHg4NidlcyAod2hlbiBidWlsZGluZyBm
b3IgeDg2KS4gQW0gSSBvdmVybG9va2luZyBzb21ldGhpbmcgaGVyZSwNCj4gb3IgZGlkIHlvdSBz
aW1wbHkgbm90IGJ1aWxkLXRlc3QgeDg2PyBMb29rcyBsaWtlIGEgcHJvYmxlbSBvZiB0aGUgc2Ft
ZSBraW5kDQo+IG1heSBhY3R1YWxseSBiZSBpbnRyb2R1Y2VkIGFscmVhZHkgYnkgcGF0Y2ggMi4N
Cg0KT29wcywgeW91IGFyZSBjb21wbGV0ZWx5IHJpZ2h0LCBhbmQgSSBzaW5jZXJlbHkgYXBvbG9n
aXplLiBJIGRpZCBub3QgcHJvcGVybHkgDQpidWlsZC10ZXN0IG9uIHg4Ni4NCg0KVGhhbmsgeW91
LA0KSGlyb2thenUgVGFrYWhhc2hpLg0K

