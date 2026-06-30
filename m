Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sT1aFemdQ2rodQoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 12:43:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A22F6E310E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 12:43:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=mTSNV1ku;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1348665.1606397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weVvy-0003BN-El; Tue, 30 Jun 2026 10:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348665.1606397; Tue, 30 Jun 2026 10:43:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weVvy-000396-By; Tue, 30 Jun 2026 10:43:18 +0000
Received: by outflank-mailman (input) for mailman id 1348665;
 Tue, 30 Jun 2026 10:43:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1weVvv-00038y-1i
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 10:43:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weVvu-00G993-B0
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 12:43:14 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6a439dbb-5cb7-0a2a0a5109dd-0a2a450189d6-10
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 12:43:13 +0200
Received: from [52.101.229.85]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6a439dbe-400f-0a2a45010019-3465e555e962-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 12:43:12 +0200
Received: from TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:30e::6)
 by OS7P286MB7167.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:455::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 10:43:07 +0000
Received: from TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a377:45d3:a376:f515]) by TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a377:45d3:a376:f515%3]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 10:43:07 +0000
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
 b=rvq2qaLukNjuxlWT3YvrD0rMcF7HHZl3zsnT634D/HuHB19YKKeqDM4003KUH3wRX49VF5V8+FsPb8F3BcSbbDFR+OB1YWXO8zo8ToRqyMWF0ps4ef+bKTxaCpKi3rK75EGsHXLfrD6nzz/im34E0vQAH0HIv/H5sJN20DDS1MheAZj9BVPGhZIIbToYdtym3DEoUPud8Z9IPtcm73ejQn0AYB5ED4VWXdxQqp1vTpvOnHdN0FKHBF/3NSUWCOGH9zcBQ5GAWD/8WqpXFvMHVLoSzCyVQjUIA4DFX6oolIxIzsdVuXVxUfBGFiASq9Bg2iAJoLR3Sy1VfuTwv3UmiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOkdOVuKh+Ps+TW8/dWNcX8hc55YoFXNCYDBjl7awNk=;
 b=Hx/YbKJQldD+3la6Xtf7J9iC+3u3fEY3TP5g73QWoupUbv3XwK/2gTqOnDaUYCOPrvZhzkvHk+HevNqcYfoOftiW3jrtqegDwPQZbvNLlBhlpVJ3xjs6hkXRdlR34jzx7Lhxy1Xdj7OlfiPl5g1AgkfnNryVTY/X4CgTnfjLfao+A7VchTO2WQlovI+ZnR6n4DpWTe7aotGZ/1BeU+9iRzAXepnEAtEVKx3IPIZfR1JTm1igHOvAUI9QTm2P/l+KFu8GaIaVwhmuc1fNSC+stB+2PpM0ybmqNbzA+q+BWvdOEGSkVZaNBNkOCfWpmScas5pAVKzr64bmeSJQ8ExOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOkdOVuKh+Ps+TW8/dWNcX8hc55YoFXNCYDBjl7awNk=;
 b=mTSNV1kuB1dvGweKZtRokBe3z7EP2jmdm0bKcG5Bpydtf9y89IZ2dkacNZlKnTD46hnp+JIxYwlu7XYdcyPO5wuyCfI72DcD97V6nY6Uv45PbMp+2vPU1aeMmeQqfiURzO+84MvRZvArAA0VAl1KBsfhfleF1XS/qszsD8wNacc=
From: Ryo Takakura <takakura@valinux.co.jp>
To: Andrew Cooper <andrew.cooper3@citrix.com>, "roger.pau@citrix.com"
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"ross.lagerwall@citrix.com" <ross.lagerwall@citrix.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>, "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "anthony.perard@vates.tech"
	<anthony.perard@vates.tech>, "jbeulich@suse.com" <jbeulich@suse.com>,
	Hirokazu Takahashi <taka@valinux.co.jp>, Koichiro Den <den@valinux.co.jp>
Subject: Re: [RFC] xen/arm64: livepatch: enable attaching callbacks
Thread-Topic: [RFC] xen/arm64: livepatch: enable attaching callbacks
Thread-Index: AQHdB2s+PJSpKD90Jk2ujK1H9QnSmbZVuz4AgAEu/Fo=
Date: Tue, 30 Jun 2026 10:43:07 +0000
Message-ID:
 <TYYP286MB29465075AE7BF6306000EE968FF72@TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM>
References: <20260629020128.30561-1-takakura@valinux.co.jp>
 <69ae3671-aa66-4717-91e5-3b989e99c8d3@citrix.com>
In-Reply-To: <69ae3671-aa66-4717-91e5-3b989e99c8d3@citrix.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYP286MB2946:EE_|OS7P286MB7167:EE_
x-ms-office365-filtering-correlation-id: 6864702d-29aa-44ba-4780-08ded6945f72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|7416014|3023799007|4143699003|22082099003|18002099003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 oBiv6qjvLSQ/GpeIZIt45HLgc5lvbNkM9yMb+c00o2Cazu1wqMzN5cLgd8dqXnv4Ubp/jZfmwtRx2s+5M1goX/nZG2zcUuG/h/6Izu1WerP/lp7xifdZKOegQEArhbDotp/XQxetUErvBLOkOE9yj5XqFeaK+5yeekKPHijcNIt7/GVDcoof8cUFByyAHRmcXc3CKtsc3mdqigIxL0oDJJ3ObNlJZmI5Mmt99Kvv0ul5JCxiNPH8+jZrS74GAsUX2nmZ8Mdfr/TPVK073tr0AStEUiEL2PXnRUfvZFQcwklneoyK+4FTSVO9aC4i6Lvkbmlo6wtoTOp0CvQY3TKwjKrO0sHgwtrY+PDaNaWZfzy4dsDOrJj3dQD+NiqIWV+SiGSrT4tvz1RYycmonKADsZ2GStGEuSMY3yoKuADPwBIlHFwvztPcCp7DQJDCWN/QDZRXHuHYVHisv0YzaBqnSv5KLFWens7jUFT1x/YtOnSCgxPR/jnbMLBCoVHxt+O/VsS4SqHMQmgRDng0uBMc0JaQvf+yWJoQBP+PKSxTkCcRX8stcP97MO+N4wqCMeT9g/1BzKUKMatXIbxjpQ+VDRhNPx19xNc8bqO+fAmJbe62kvlxNOW6v3RZnEQX35qHDD626taCPUImJt4LZPvy68W66hAfOIbXvDjX5xNZ85EjgndLbXh4f1ZM9vWgrLrNqR57bnl0Aw1o/1pzUoVG+1P3AxsQwuKcPHbb0sTLNYI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(7416014)(3023799007)(4143699003)(22082099003)(18002099003)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?UVJwbmlOOTZFMkxUMlFKOUYrVEc0Vnd0Z2U1N29mTyt4SE9wUkFnTGI3?=
 =?iso-2022-jp?B?M2N0ZjU3VXFrdFNmL0REZXFPZVMva0xiMDFnb3RkTERuakJLdlJubnZk?=
 =?iso-2022-jp?B?MDl5cjROeFJHd1ladk5BYUxHeFdGVkkrWDlUYUhpbGoySlR2bjZ6UHRp?=
 =?iso-2022-jp?B?NDJ0ZklKbDA4SzhMUUJnUWNUZ25pVWFKMjFKN2JYeGVwYmowVDlPMWZ1?=
 =?iso-2022-jp?B?SmU2VXNJRWJ5UXpFdDZFQTJuU1FWT0xYWGdwODNQZytlK0x1QllwTDY4?=
 =?iso-2022-jp?B?Lyt2UXRuLzU5V2NlNzcvczdNa0xLclJ1MzNNTU1tK1VTV1pXOXFuZzNI?=
 =?iso-2022-jp?B?Wk1mZStkMW1nQWxSOVREMGc3UWxqM2ttaW5JUjJuNGU1dTZYSCtveDQz?=
 =?iso-2022-jp?B?dVpBbDdIVE5YS3hGeEJYNWRMcHBkaUxCTlZNalpITjFvWEdMOGt4ZXEr?=
 =?iso-2022-jp?B?RzlvUFcxV2NPeU5JWmppenNybHJtZkdwbHhYOXRMZ0lhSUEzT0MzU2hx?=
 =?iso-2022-jp?B?dTBHYnZ0aVBGR1JDNjhlbVRiaVNJYmVMd1V4bko5eE94TStQRGNjb0d0?=
 =?iso-2022-jp?B?VGpFRzExbktCSjI3dTlJVGpMejRWVHMvRTZBRzdyT25UMElnNWwrWXZs?=
 =?iso-2022-jp?B?dW1ldUtVc0tRMXpCeTNDVWZFWlIvSnBqN294YzVuZW1BZGgxL29pVFh3?=
 =?iso-2022-jp?B?NmVHcE94bGVxK3RtdUVlbDRFRVgrWW5iQ0N0dWZzaGVicU10cEZNZE1F?=
 =?iso-2022-jp?B?KzlDRHU3d01WN1IzTFc4NlUzR29sN0JEMDEyaWxYZWdFZGJwSFR3em4v?=
 =?iso-2022-jp?B?Mzgya2MyNVRpRy85STRwRjUxeTRoUlN6d1NjeE95N1hiYitaMjA2OE5K?=
 =?iso-2022-jp?B?V2N3R3EzUzdaOFFBNG1tWEp4RS84MkI5Y3lMM2EvZmpYL0pXTEpaZERL?=
 =?iso-2022-jp?B?bXdrN29nUk5NM2Z3MDNCajZBakVxZUNpKzcvZ1RLYXBnTmd0cFdNUjVt?=
 =?iso-2022-jp?B?aUNaM1hsR2lBWUVsRWswamQ4d095TjFieDJrZzcxY0FHK25Wc2lOTGJa?=
 =?iso-2022-jp?B?NU9CQ0JBQ0d6Vmd6TVFENnJlL0RKVlFyMnVtTW1KdEpNaVNiWm1LLzJq?=
 =?iso-2022-jp?B?ZitNRFJJRzI3MlMzTUFXV0tBYkxjUGFpS2hRbmMvenJEODhUdVVRVXE5?=
 =?iso-2022-jp?B?V0Fib0FIYVMrb1Rkeko1Z0xZTWFNLy9zN1VxTFBBZER5eURWL2Y1cHYv?=
 =?iso-2022-jp?B?V1RVWGJFa1lGSFFGaTQzL2ExMHIwNzBCZVNPOUpLc0Z6ZXI0dFR3Zk1X?=
 =?iso-2022-jp?B?RUJ0R0RGWmZkazVvV3RhcXNVNTFSSXU3UU1yM1IrcklZdEZnYUlpOFlr?=
 =?iso-2022-jp?B?WnNZMm5WNWh4NkZzdkgzMTdoRzAyOE5ETDdPWFF4czFvTDJpVWU5QlRn?=
 =?iso-2022-jp?B?NW85ZUhGek8vRXdNTlAvWmk4Sk1VajVLVmpOU1d2TFZCRnB1YjJ5eEtp?=
 =?iso-2022-jp?B?ZDZRYll4bTM3M0FjdEtxNlZ0ZXRNVjB1aXlZcGpSVC8zZXRyZFN4Vktu?=
 =?iso-2022-jp?B?M0xqZm04M3hzWHVQV0kwQWlFSzlpYlFtbE56MnhQcUdyM2JXNkRqbjVP?=
 =?iso-2022-jp?B?ZGpnZmJVak53czhkR0Y4b2tmNHc5cVVuQkNWYnlvNkZvMmd1VXRaTnA4?=
 =?iso-2022-jp?B?NlNtZjZEcTNTOHNmalJJbXA4MEVhSGRVNldsU2d5S0VyeUFRdTliM2FR?=
 =?iso-2022-jp?B?V2ZoRXJvRHVpSGFRZWxsdEZoKy8rZGhvK3BYeG9TMlFpMkJKSEZUUGU0?=
 =?iso-2022-jp?B?aUFKRXZTRFVxazFLUFQ1dGwxRnFSQW44cThrSlpaT1pRNGg1ejZLdW5S?=
 =?iso-2022-jp?B?NFpqVnBiZE5FM1ZsUDQ4V2w0QXlIbXF5TFZQNWJCMFJqMlZoWFRCTTRC?=
 =?iso-2022-jp?B?Z0hkU0wxWHYwOHFNYldYcU5tRGVFdE5XakZCM1QrWGJkTUdtUFQ0QnN2?=
 =?iso-2022-jp?B?dDh4amRVdi9vQmJjRlNTaFVCL1RKVDFZVUt5aC95VWVmb3NnVTU0VkZP?=
 =?iso-2022-jp?B?RnRwRDh2RWJQalFuZlhUM3pPWDVaNWdLclpwa00wY01EdVd2d3djSHFW?=
 =?iso-2022-jp?B?cnBqK0xiMjBGQVBPMkNRajZEYUN0bXlZaTh3TE95cHYwbjFWdXpqaWla?=
 =?iso-2022-jp?B?WWM3c0o5VlJUSTEzd0U4VW03Rk5aZEcvQ25jRkh3RnlYeE5iK2JqaXRO?=
 =?iso-2022-jp?B?RUd1eFlBT0dpQUkzcUFUcytaSlhQNGNVdWpoVzFnU3NxR2ptNjU4c1Fa?=
 =?iso-2022-jp?B?ODcvdjM3bmFaaWRBYlRwWE5vRGlFcEhObTBST1RiYkJtRThTK1FoOGQv?=
 =?iso-2022-jp?B?Y0ZOSWFCN3VHSlpPbzFpcDBEVDZteG9KVzJsaG5PeWU5bTd5TlFnaDE3?=
 =?iso-2022-jp?B?TitKNm5UMVFFbTUwOXd1aG1VYXFHK1hCWXJVN281K0kzME1vakg2N2cr?=
 =?iso-2022-jp?B?a0QyR3FY?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6864702d-29aa-44ba-4780-08ded6945f72
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 10:43:07.7128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: abODbiW4Y1j97PD1Zk6nvlkiMMKOL4RsmCihKuzI/H58v5k/ffmoOGUA+gZ5hpGhdFXr9Y/mzgtGKioz/RdUfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7167
X-purgate-ID: tlsNG-d62444/1782816193-81EDF1E0-CABF32B4/0/0
X-purgate-type: clean
X-purgate-size: 15901
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:taka@valinux.co.jp,m:den@valinux.co.jp,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[takakura@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[takakura@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A22F6E310E

Hi Andrew and Roger,

(I'm still looking into the feedback from
Roger but will reply shortly, thanks!)

On Mon, 29 Jun 2026 17:33:40 +0100, Andrew Cooper wrote:
>On 29/06/2026 3:01 am, Ryo Takakura wrote:
>> Linux ftrace allows registering callbacks which is useful
>> for debugging and tracing events. On Linux, it is done by
>> reserving function entry points at compile time which can
>> later be patched to branch to a trampoline.
>>
>> This patch implements similar callback feature, but with
>> different approach using existing livepatch infrastructure.
>> Instead of reserving function entry points at compile time,
>> the traced function will be livepatched so that it branches
>> to the trampoline.
>>
>> The role of the trampoline(illustrated below) is to preserve
>> the context while jumping to the tracer function, and return
>> back to the traced function with its context restored.
>>
>> trampoline:
>>     Save regs
>>     Call tracer function
>>     Restore regs
>>     old_addr
>>     return old_addr + 4
>>
>> One can request the feature by setting @trampoline_buf to 1
>> which will allocate a buffer for trampoline.
>>
>> Signed-off-by: Ryo Takakura <takakura@xxxxxxxxxxxxx>
>
>Having something a bit more like Linux tracing would be nice.  But, this
>is very different to the other livepatching functionality and a few bits
>don't match nicely.
>
>First, you write a lot of the trampoline manually.  You can do most of
>this in the target function with
>__attribute__((no_caller_saved_registers)), avoiding the need to do it
>by hand.   This would require a minimum GCC of 7 (where our baseline is
>5) but it's acceptable for new features to require a newer compiler.

I wasn't aware of the attribute. I agree using it for the sake of
avoiding manual save/restore. I'll look into using it.

>Secondly, what happens if the instruction at old_addr is an ADRP, or a
>branch?  Right now, there's no case where we move an instruction; we
>only produce new code, and branch from old to new.
>
>When you're moving the instruction at old_addr, you must compensate for
>any IP-relative component.  Also you can in principle have a conditional
>branch as the first instruction, which gives you two branches to fix up
>at the end of the trampoline, rather than one.
>
>On x86, you've got an additional problem that it's generally more than
>one instruction, and rarely an exect number of instructions overwritten
>at old_addr.
>
>Some high level comments, leaving aside the details until the above
>questions are better understood.

Thanks for the suggestion here!
I can come up with two solutions based on my understanding:

1. Fix the instruction when copying to trampoline

2. Reserve an empty function preamble(just like Linux)

I think the 1st approach can be rather easily implemented on arm
given its fixed instruction length. (Or maybe we can simply check
if its safe to be copied and reject otherwise?)

But I believe x86 with varying instruction size wouldn't be
as easy as arm. So as suggestted by Roger on the following email,
maybe better to add an empty function preamble?

>> diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepat=
ch.c
>> index e135bd5bf9..b7c9aba94e 100644
>> --- a/xen/arch/arm/arm64/livepatch.c
>> +++ b/xen/arch/arm/arm64/livepatch.c
>> @@ -34,12 +57,87 @@ void arch_livepatch_apply(const struct livepatch_fun=
c
>> *func,
>>      /* Save old ones. */
>>      memcpy(state->insn_buffer, func->old_addr, len);
>>
>> -    if ( func->new_addr )
>> +    if ( !func->new_addr )
>> +    {
>> +        insn =3D aarch64_insn_gen_nop();
>> +    }
>> +    else if ( func->trampoline_buf )
>> +    {
>> +        int rc;
>> +        uint32_t *trampoline =3D func->trampoline_buf;
>> +        uint32_t *tp =3D trampoline;
>> +        void *orig_cont_addr =3D (void *)func->old_addr + len;
>> +        unsigned int trampoline_code_size =3D len + 12 * ARCH_PATCH_INS=
N_SIZE;
>> +        unsigned long trampoline_start =3D (unsigned long)trampoline &
>> PAGE_MASK;
>> +        unsigned long trampoline_end =3D
>> +            PAGE_ALIGN((unsigned long)trampoline + trampoline_code_size=
);
>> +
>> +        /*
>> +         * Make the payload text area writeable while generating
>> +         * the trampoline instructions.
>> +         */
>> +        rc =3D modify_xen_mappings(trampoline_start, trampoline_end,
>> +                                 PAGE_HYPERVISOR);
>> +        if ( rc )
>> +        {
>> +            printk(XENLOG_ERR LIVEPATCH
>> +                   "Failed to make trampoline writable: %d\n", rc);
>> +            return;
>> +        }
>
>This ought not to be necessary.
>
>The trampoline is executable code, so should have space reserved for it
>in .text of the livepatch.
>
>Then, you can identify it simply by references in a new section, without
>having to have a pointer with a sentinel value (void *)1 in (which MISRA
>will have a fit at).

I like this idea as well! I'll try this together with the earlier
suggestion using __attribute__((no_caller_saved_registers)).

>> +
>> +        /* Save state before calling the tracer. */
>> +        *tp++ =3D aarch64_insn_gen_stp_pre(0, 1);
>> +        *tp++ =3D aarch64_insn_gen_stp_pre(2, 3);
>> +        *tp++ =3D aarch64_insn_gen_stp_pre(4, 5);
>> +        *tp++ =3D aarch64_insn_gen_stp_pre(6, 7);
>> +        *tp++ =3D aarch64_insn_gen_stp_pre(29, 30);
>> +
>> +        /* Call user's tracing function. */
>> +        insn =3D aarch64_insn_gen_branch_imm(
>> +            (unsigned long)tp,
>> +            (unsigned long)func->new_addr,
>> +            AARCH64_INSN_BRANCH_LINK);
>> +        *tp++ =3D insn;
>> +
>> +        /* Restore state before continuing original function. */
>> +        *tp++ =3D aarch64_insn_gen_ldp_post(29, 30);
>> +        *tp++ =3D aarch64_insn_gen_ldp_post(6, 7);
>> +        *tp++ =3D aarch64_insn_gen_ldp_post(4, 5);
>> +        *tp++ =3D aarch64_insn_gen_ldp_post(2, 3);
>> +        *tp++ =3D aarch64_insn_gen_ldp_post(0, 1);
>> +
>> +        /* Original instruction. */
>> +        memcpy(tp, state->insn_buffer, len);
>> +        tp +=3D len / ARCH_PATCH_INSN_SIZE;
>> +
>> +        /* Branch back to original function. */
>> +        insn =3D aarch64_insn_gen_branch_imm(
>> +            (unsigned long)tp,
>> +            (unsigned long)orig_cont_addr,
>> +            AARCH64_INSN_BRANCH_NOLINK);
>> +        *tp++ =3D insn;
>> +
>> +        clean_and_invalidate_dcache_va_range(trampoline,
>> trampoline_code_size);
>> +
>> +        rc =3D modify_xen_mappings(trampoline_start, trampoline_end,
>> +                                 PAGE_HYPERVISOR_RX);
>> +        if ( rc )
>> +        {
>> +            printk(XENLOG_ERR LIVEPATCH
>> +                   "Failed to restore trampoline RX mapping: %d\n", rc)=
;
>> +            return;
>> +        }
>> +
>> +        /* Branch from original function to trampoline. */
>> +        insn =3D aarch64_insn_gen_branch_imm(
>> +            (unsigned long)func->old_addr,
>> +            (unsigned long)func->trampoline_buf,
>> +            AARCH64_INSN_BRANCH_NOLINK);
>
>This entire block wants breaking out into a function for writing the
>trampoline.  It does not want to live inline in arch_livepatch_apply().

I'll fix this.

>> diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
>> index 45c8924f34..7a81763cf2 100644
>> --- a/xen/include/xen/livepatch.h
>> +++ b/xen/include/xen/livepatch.h
>> @@ -48,6 +48,8 @@ struct xen_sysctl_livepatch_op;
>>  #define ELF_LIVEPATCH_POSTREVERT_HOOK ".livepatch.hooks.postrevert"
>>  /* Arbitrary limit for payload size and .bss section size. */
>>  #define LIVEPATCH_MAX_SIZE     MB(2)
>> +/* Size of a trampoline used for function tracing */
>> +#define LIVEPATCH_TRAMPOLINE_SIZE 128
>
>This is a common header.  How have you calculate 128?
>
>At best, it's an Aarch64 specific number, but if you reserve space
>properly in .text then it won't even matter, I don't think.

The value was arbitrary which i thought would be enough
for buffer... This should be taken care with the suggested
approach as said.

Sincerely,
Ryo Takakura

>~Andrew

________________________________________
=1B$B:9=3DP?M=1B(B: Andrew Cooper <andrew.cooper3@citrix.com>
=1B$BAw?.F|;~=1B(B: 2026=1B$BG/=1B(B6=1B$B7n=1B(B30=1B$BF|=1B(B 1:33
=1B$B08@h=1B(B: Ryo Takakura; xen-devel@lists.xenproject.org
CC: Andrew Cooper; roger.pau@citrix.com; ross.lagerwall@citrix.com; sstabel=
lini@kernel.org; julien@xen.org; bertrand.marquis@arm.com; michal.orzel@amd=
.com; Volodymyr_Babchuk@epam.com; anthony.perard@vates.tech; jbeulich@suse.=
com; Hirokazu Takahashi; Koichiro Den
=1B$B7oL>=1B(B: Re: [RFC] xen/arm64: livepatch: enable attaching callbacks

On 29/06/2026 3:01 am, Ryo Takakura wrote:
> Linux ftrace allows registering callbacks which is useful
> for debugging and tracing events. On Linux, it is done by
> reserving function entry points at compile time which can
> later be patched to branch to a trampoline.
>
> This patch implements similar callback feature, but with
> different approach using existing livepatch infrastructure.
> Instead of reserving function entry points at compile time,
> the traced function will be livepatched so that it branches
> to the trampoline.
>
> The role of the trampoline(illustrated below) is to preserve
> the context while jumping to the tracer function, and return
> back to the traced function with its context restored.
>
> trampoline:
>     Save regs
>     Call tracer function
>     Restore regs
>     old_addr
>     return old_addr + 4
>
> One can request the feature by setting @trampoline_buf to 1
> which will allocate a buffer for trampoline.
>
> Signed-off-by: Ryo Takakura <takakura@valinux.co.jp>

Having something a bit more like Linux tracing would be nice.  But, this
is very different to the other livepatching functionality and a few bits
don't match nicely.

First, you write a lot of the trampoline manually.  You can do most of
this in the target function with
__attribute__((no_caller_saved_registers)), avoiding the need to do it
by hand.   This would require a minimum GCC of 7 (where our baseline is
5) but it's acceptable for new features to require a newer compiler.

Secondly, what happens if the instruction at old_addr is an ADRP, or a
branch?  Right now, there's no case where we move an instruction; we
only produce new code, and branch from old to new.

When you're moving the instruction at old_addr, you must compensate for
any IP-relative component.  Also you can in principle have a conditional
branch as the first instruction, which gives you two branches to fix up
at the end of the trampoline, rather than one.

On x86, you've got an additional problem that it's generally more than
one instruction, and rarely an exect number of instructions overwritten
at old_addr.

Some high level comments, leaving aside the details until the above
questions are better understood.

> diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatc=
h.c
> index e135bd5bf9..b7c9aba94e 100644
> --- a/xen/arch/arm/arm64/livepatch.c
> +++ b/xen/arch/arm/arm64/livepatch.c
> @@ -34,12 +57,87 @@ void arch_livepatch_apply(const struct livepatch_func=
 *func,
>      /* Save old ones. */
>      memcpy(state->insn_buffer, func->old_addr, len);
>
> -    if ( func->new_addr )
> +    if ( !func->new_addr )
> +    {
> +        insn =3D aarch64_insn_gen_nop();
> +    }
> +    else if ( func->trampoline_buf )
> +    {
> +        int rc;
> +        uint32_t *trampoline =3D func->trampoline_buf;
> +        uint32_t *tp =3D trampoline;
> +        void *orig_cont_addr =3D (void *)func->old_addr + len;
> +        unsigned int trampoline_code_size =3D len + 12 * ARCH_PATCH_INSN=
_SIZE;
> +        unsigned long trampoline_start =3D (unsigned long)trampoline & P=
AGE_MASK;
> +        unsigned long trampoline_end =3D
> +            PAGE_ALIGN((unsigned long)trampoline + trampoline_code_size)=
;
> +
> +        /*
> +         * Make the payload text area writeable while generating
> +         * the trampoline instructions.
> +         */
> +        rc =3D modify_xen_mappings(trampoline_start, trampoline_end,
> +                                 PAGE_HYPERVISOR);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR LIVEPATCH
> +                   "Failed to make trampoline writable: %d\n", rc);
> +            return;
> +        }

This ought not to be necessary.

The trampoline is executable code, so should have space reserved for it
in .text of the livepatch.

Then, you can identify it simply by references in a new section, without
having to have a pointer with a sentinel value (void *)1 in (which MISRA
will have a fit at).

> +
> +        /* Save state before calling the tracer. */
> +        *tp++ =3D aarch64_insn_gen_stp_pre(0, 1);
> +        *tp++ =3D aarch64_insn_gen_stp_pre(2, 3);
> +        *tp++ =3D aarch64_insn_gen_stp_pre(4, 5);
> +        *tp++ =3D aarch64_insn_gen_stp_pre(6, 7);
> +        *tp++ =3D aarch64_insn_gen_stp_pre(29, 30);
> +
> +        /* Call user's tracing function. */
> +        insn =3D aarch64_insn_gen_branch_imm(
> +            (unsigned long)tp,
> +            (unsigned long)func->new_addr,
> +            AARCH64_INSN_BRANCH_LINK);
> +        *tp++ =3D insn;
> +
> +        /* Restore state before continuing original function. */
> +        *tp++ =3D aarch64_insn_gen_ldp_post(29, 30);
> +        *tp++ =3D aarch64_insn_gen_ldp_post(6, 7);
> +        *tp++ =3D aarch64_insn_gen_ldp_post(4, 5);
> +        *tp++ =3D aarch64_insn_gen_ldp_post(2, 3);
> +        *tp++ =3D aarch64_insn_gen_ldp_post(0, 1);
> +
> +        /* Original instruction. */
> +        memcpy(tp, state->insn_buffer, len);
> +        tp +=3D len / ARCH_PATCH_INSN_SIZE;
> +
> +        /* Branch back to original function. */
> +        insn =3D aarch64_insn_gen_branch_imm(
> +            (unsigned long)tp,
> +            (unsigned long)orig_cont_addr,
> +            AARCH64_INSN_BRANCH_NOLINK);
> +        *tp++ =3D insn;
> +
> +        clean_and_invalidate_dcache_va_range(trampoline, trampoline_code=
_size);
> +
> +        rc =3D modify_xen_mappings(trampoline_start, trampoline_end,
> +                                 PAGE_HYPERVISOR_RX);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR LIVEPATCH
> +                   "Failed to restore trampoline RX mapping: %d\n", rc);
> +            return;
> +        }
> +
> +        /* Branch from original function to trampoline. */
> +        insn =3D aarch64_insn_gen_branch_imm(
> +            (unsigned long)func->old_addr,
> +            (unsigned long)func->trampoline_buf,
> +            AARCH64_INSN_BRANCH_NOLINK);

This entire block wants breaking out into a function for writing the
trampoline.  It does not want to live inline in arch_livepatch_apply().

> diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
> index 45c8924f34..7a81763cf2 100644
> --- a/xen/include/xen/livepatch.h
> +++ b/xen/include/xen/livepatch.h
> @@ -48,6 +48,8 @@ struct xen_sysctl_livepatch_op;
>  #define ELF_LIVEPATCH_POSTREVERT_HOOK ".livepatch.hooks.postrevert"
>  /* Arbitrary limit for payload size and .bss section size. */
>  #define LIVEPATCH_MAX_SIZE     MB(2)
> +/* Size of a trampoline used for function tracing */
> +#define LIVEPATCH_TRAMPOLINE_SIZE 128

This is a common header.  How have you calculate 128?

At best, it's an Aarch64 specific number, but if you reserve space
properly in .text then it won't even matter, I don't think.

~Andrew

