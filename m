Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EAAB33200
	for <lists+xen-devel@lfdr.de>; Sun, 24 Aug 2025 20:17:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092201.1448215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqFHn-0003Tq-J1; Sun, 24 Aug 2025 18:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092201.1448215; Sun, 24 Aug 2025 18:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqFHn-0003RT-G0; Sun, 24 Aug 2025 18:17:47 +0000
Received: by outflank-mailman (input) for mailman id 1092201;
 Sun, 24 Aug 2025 18:17:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Bk9=3E=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uqFHl-0003RL-TE
 for xen-devel@lists.xenproject.org; Sun, 24 Aug 2025 18:17:46 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a15fdeda-8116-11f0-a32c-13f23c93f187;
 Sun, 24 Aug 2025 20:17:44 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV1PR03MB8094.eurprd03.prod.outlook.com (2603:10a6:150:1d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Sun, 24 Aug
 2025 18:17:40 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Sun, 24 Aug 2025
 18:17:39 +0000
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
X-Inumbo-ID: a15fdeda-8116-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mu90A8++mA7xFImcPiJplT2rJZPNuSrALNM7+xvN1AWPKih+HcMHIRgHiG1JlNWoebPHzgns+2xQIHskW97IhtB8jFQpo3+9iI+xuNpxePGQqooSn7tuvroyY19g2a0y+BRjNf6CubPPNA9rVVFga68aSQf2ftPyjTqo6JnuyDVjUGb+KIuZi4m6gXKceIciZz316f5OEBeO+dtT7qwsv3DIzEdsgHWATGFc49LWwlcxUaiQuQUgYMCZ/hhKZVHx3oZEUciKauIltddCSFU8akspVBYdHtcRfAr+h6eY+/SlIqIsOSuaIUya8sVz+uwQyvDT5u2jBs5oH1kc3juiRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YS+WNH9gGznC3QrojdQKbZOX/kso/dtGnxzGBlfxXlY=;
 b=jZDGyRQMwYjNBppxj+5i3MLfP6kav/YEoxMw7nWuTSK0/fbhUruApqOU7CdJ+cfOg0Icq8uku5UrLymo9dV7RznJoY1d1qNBApaqAIkSIKT5ywu5VoX7ZkYCeyP1tsGodIMMe/87ql2Qwjj92vD1VeR4XFm5ZL7PFWNiGGZ6uxqUeWUBGQok5YDPMwPk0ZQEVYvDFA6pezZVH9IcpFM7ACe3T074BzUEGoHrStOVCSfZnyoH2W7TKQy2HK0g00TorG0JZE7di94/ev8QUC7fOU4n+leNKMl4ZFXMlHjqH9APSzLm3LMSfnOQsL+xbqGdMsXRL0Ti6cMu3SBcSPtWqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YS+WNH9gGznC3QrojdQKbZOX/kso/dtGnxzGBlfxXlY=;
 b=uW9F2D3TIsuQuy6919rFrrNM6/qFOipHCTj2kp90ZpQynu+Trp84ZUNZwc4DavGQ18xj0POBpN4SBdBmJRf+nak7y2zxIN063u8R+M8a6jtEoz1nLQTXGzgh94DcqjJgH3Bqo+JTW28SkdFqsV7f9n5/ISzyfWUib/5Xlv2UFdy9o/X+xn1F7l9FR/X+UfSw4GOJn/YcdawkgK1pT9VzGQZhHwCs2XSNQMparfBS4dSLEion+HMgWFMk4h8eY/hJ9UKOAixFjn/9SC3rAoAaR64vB58TqULAPn/iBhZBRtKtEWm8THz5RxAJlxQkDcTeKt7PaQmgE25wH3VM7aSvpA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 05/10] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
Thread-Topic: [PATCH v2 05/10] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
Thread-Index: AQHcB5d8tjpgMfEXfkClUacVz54EpbRwY8yAgAHTxIA=
Date: Sun, 24 Aug 2025 18:17:39 +0000
Message-ID: <17c94c5c-3052-4cce-8978-b9b2ef6781a0@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <2491bee7441f13a3c1a01fd77ece1749e7276352.1754568795.git.leonid_komarianskyi@epam.com>
 <b2870d5f-cf54-41f4-9cfe-b83161c157df@gmail.com>
In-Reply-To: <b2870d5f-cf54-41f4-9cfe-b83161c157df@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV1PR03MB8094:EE_
x-ms-office365-filtering-correlation-id: 878e5625-245e-464b-7cce-08dde33a82d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y2FjWVI0amU2Q1ZRcWRGVHg2MTZLa3ovdTY5OCsranNnVGw4ckRFQ1RFV1hV?=
 =?utf-8?B?ZlQyc3F1U2ttcFZYSmltZU5tUEp4am8vY1pqdldZK2pTclFxMEh2eklHelJi?=
 =?utf-8?B?Umt5THJRMzdvVUN0MmRncVN3aE91ZndSUytZK1oxak4xdnRnSDZPMXpXWEpK?=
 =?utf-8?B?RXZzZ1RwOEN3WmNrQ29RU3VZd2ljWXhXTXp5WXR5dDd3aTlLR3NHUnRRNzd6?=
 =?utf-8?B?SGZaT0dlT290YkRHTnZkRkVZVVZ4UHY3cXFhRlc2V0VTQm5QTnlqYko0dGRU?=
 =?utf-8?B?ZWU2eWFrdExIRko0NkEvdDFPVGtuVGlGMVZmTFl5eEsxdWMwSmMyYUUxVTdh?=
 =?utf-8?B?cG9BYmRUZ21JQ0p1bnNMVHN5d01jT2E2d3gyTFlwNzcxMW5KWG1NaXZPbUpS?=
 =?utf-8?B?ZTZTYU9KYmorS1JUQWJCdFRUK2ljRVQ5RTdzNGdLKzE3Y2RZWWxjeHMvR0JD?=
 =?utf-8?B?L2NiMGVlMWdab3A4Tm13Ykk0d3F1OEFJeGZYZmVYdDVseEE4SzltYzRvUmtL?=
 =?utf-8?B?bkJCLyt3ZXJHWk1VM1QwK2RETUxaRGFZUTQrUGhCNVgrWWNsQ0JDRmxxZmR0?=
 =?utf-8?B?MWlxOHZRNVpraEZ4YVBQUHpad0g5andoNHExVjl6cWhYSUVMb3RKUGVSVnV1?=
 =?utf-8?B?ZFhQSTBzbThEVm5jMW11SHN6ZktuUFRESGZ6MjJlalBxUUNBYlhBblhYSVhi?=
 =?utf-8?B?em1XZ1l6UHI5L0diZG0yUEpmUWRPWVJzcW42R3hCb0ZabGxna3N2U2JPZkFz?=
 =?utf-8?B?dUJ1a3RhOSs1UkdSYUVjWWI0cmhveXl0aTFLbnRlbjRUeXFDZ3FRNVVadi85?=
 =?utf-8?B?SkJLcittOXlJSjVUN1NyWmRvZHRyck4rNWtRN1UxRUhyNXdoYXo3SGVmMjQz?=
 =?utf-8?B?UHRkRVR2ZEpFdGJSWVNnVkszcHltMVdkVTBpMDhMRC85TjZBRVUxL3VZM29W?=
 =?utf-8?B?dytlRXdUKzh6WHJtbjAwajlwZnFQUG43RGlCOEFqUWdmd1pFazBreVVZandm?=
 =?utf-8?B?aitidDVzdm9LaFFlOE90dDQ1VGozYVBTMldoODUxbWVRODJueTF1TllXS1Vj?=
 =?utf-8?B?ZW5sWW5KZ1NHTUd0YXhxRko5a0lBYXdLTi9sQlZ2MDBadXlzdXpYUnY4cERT?=
 =?utf-8?B?K0VJbWN1MU9XZ1VMdkhSeXp0cld3OUUzd21kb2E0ZHZhemxyY1FqUEdkdndU?=
 =?utf-8?B?THFoamVLTVU2a0dIcjZma1Nab0pIM2Jtencwa2xTZ2kzeUVOcU5qZEdRVUc2?=
 =?utf-8?B?Rk9zMUVYSzJGRGFGY2FNMnc5WFhQdW1sb3FWeXlmenFXTVoxZzgrcW1xdXRx?=
 =?utf-8?B?bURZcG5uZmY0VFdnNmROSmttWEVZMDcxbERkNmNHUHpXYjIxcndBZThQMTNT?=
 =?utf-8?B?M2ZxWDVwVGF3M0hmQnNoRUIyM2tIRURzVGRxei9OK0laaGM1L0IxRW9qRGFQ?=
 =?utf-8?B?VUc4OG5Ebkk1WWRHVnJ4aiszOWNZYkdDU1o4Q3c2eWRaREN0RURwVlNzZERH?=
 =?utf-8?B?dXE2R01va3V3T25vS1NKMzBjaVQ0cEZHS0xqU0RHaFFhbjVhUk1yaS9qWmFr?=
 =?utf-8?B?eWYzenlEY3JycTdwbVBRbERmOVUwd0dGMFBpOEdVRklIaVdRbk9DUEpaZGI0?=
 =?utf-8?B?NXdsU0p0ZHltS01qUnd5TWJjT29wUnFSYzZmdEc1V3Jtc3hqUFRjWkNMRDRB?=
 =?utf-8?B?ZzIrNkJXNzNOd2tFUldFdVZ4ZmVxZ3dYK1NSQlVrc255Z3lxdEh5dU5rTmNZ?=
 =?utf-8?B?ME8rc21OMU1zRWdqeDhwZGJxTlliY3BSNkVkdmVrRFJxd085VE5QT0haSDJn?=
 =?utf-8?B?VC9FalpoZGtqMkh1TGtoY0JZdExyWWxwNDBXS3g5TFRsUmlpaFhzWWovOTAw?=
 =?utf-8?B?RElrZVpGRE5TYUFYS0RSTW9BTFFMeU41TzdSNXhKQ3pQRnA1TmJ3U2NaK01S?=
 =?utf-8?B?WmgxejJlZFpzL01EdTVMSlRYcGUraFFPb2JUcHVWNUdmSStpQ1IyMUQrZWtG?=
 =?utf-8?B?TUVLZzFET2tnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RE1OVkU1Uk1RRjBCQ1lhMkRkZmNhZGNWWG02eTJPdGova0RMZTJXWkNEejZh?=
 =?utf-8?B?clhoQ3NKYkZ2YTVOTUE2Q21WeExEeWN5b20vNnZNR3NvR1pGM2ZOd2pFczRU?=
 =?utf-8?B?ZjJSempaQ2k0RS9BM09idDY4WVV0c1JrZkZsVGEzbGRERGRSTlFzUS91RFJJ?=
 =?utf-8?B?bklNMll1Wmlzd2VLYW1qT01GOE44WEMwZ09EbWdEU1JlZ3JXd291WUpJMTBk?=
 =?utf-8?B?WG1ydzVEYlRNQitEYzB1WmtxNGxpYTM1MGJsUGExQ2F1b3lIWlpoQTJhemJh?=
 =?utf-8?B?cjV6Nk15Mmgzb3dBaWZwTU92VUM0YlJPRVFjSGJZQWswcGtBa1ArQTB0cnRT?=
 =?utf-8?B?R3VEOElxZXVKaDE4VDVJOUhacVowYnJCbzBOTWdzM2JUU01ST2IyWU5EQVlW?=
 =?utf-8?B?Q0E5R2hrOUt1RDVRNlJsNFY1cXdPRGlJUlFadklJV3VjSkJjaENsSGFHT0RI?=
 =?utf-8?B?WlV3aDVpR0hQb2t1ZkZjMGFNRHNleW1WMWNsNmE1YzNhZEQyazFCMm80SlFF?=
 =?utf-8?B?MTJVSGloWk9XWGVXQktVa0MvN0ZwNzVXSFlYL2lFdWhtWjZpZDVwR1JRaDVt?=
 =?utf-8?B?Q0dhYUljWm9IQWQ1M2U1T1Vqamd0UGljMi82UmlNWlZDd0NDVmJBVGcrNDll?=
 =?utf-8?B?b2xQVzdhSEtPUWJtV1hZT3Q0VVNZRTUwbWxHaFhJdVJ6SEgwL215OFg0eUt4?=
 =?utf-8?B?cXBNbSt2UDg5OWZNSEVmUUVwZkhYZGNidXFJTlZFUktrOUwrbnlqTm1KM2Fy?=
 =?utf-8?B?Rzd6b1oxVXd4SSt5K1YyVUw2bWxTUkdWYmpaN2ZYRXVwVHJDaWtXNEp1RFZD?=
 =?utf-8?B?MW4yQVlnVnhDUFZNL3N0ZEVjSnY0bENBQzQvZGhmdUFSMGJwYStCRHRHVWNC?=
 =?utf-8?B?a0syYkJ3d000amNoRmo0dlpWZkJzM1c2UXhvRUEydWc2Y2cxK3hpV2paVHlu?=
 =?utf-8?B?Ti9xYlY5cGE4dFZHTkFtM2FEenJqeU9hdHZkUnl6aFduUW1hN3ZvNDVRdXRC?=
 =?utf-8?B?Sy9EckYxU1p4K3pKZVFaUXNxOEF5cy9JRU1PZVRlKy9CRlIwc2ZtQyt0c1Rn?=
 =?utf-8?B?YXhMOXpubS83RU9oUk9vZ3dtS0tYZy9lQkVvL2gzcG5ySkhQSFpCMWRHejhG?=
 =?utf-8?B?NlA0UTFEYXk2aHY3dVdHZ2R6ekFEbFNqNHVHV2FFOUp6SngyVmJTcitUc08x?=
 =?utf-8?B?UVcyZWdsNkRRMStNRG5wcUFBQzhqU0N2WmtRTm94ejZsWS8rMEY1V2puemlh?=
 =?utf-8?B?MkhZYXNtWkx3OGFUYVU5RFh4dEo5NEJwbmlTTklmUnF0Q00wckl6SjR6UDdK?=
 =?utf-8?B?M1NIclI4MDU5QzhKVDl0MkxlcHN6QmhYeVpabE5wQy9VSzV2OXVrbkM3TkpC?=
 =?utf-8?B?RnF3TzN5N1AwQS9yRllscHhxclZjd3JvZVdGR1ZVZzVINThPSGY0T1RtYU5L?=
 =?utf-8?B?UnhhaEZTelZZdXlRMFQrcXVGYzhYZzJqOFB3QVJxWmVIbWlLWUw3bVZlNFdO?=
 =?utf-8?B?VE9FbVlBbjA5ZnBiNUJNcU5ZSnhyVkNKN2FJd2hBSElvUCtXSytuNE4ycW9m?=
 =?utf-8?B?bnlWemN4M2ZsbTNjZW15a3dHWlc5UlpHUUdXRkhGMlhGZVdNT2ZIWjNVTDky?=
 =?utf-8?B?dHdvUmcvOVVERXVSYzZSNEFPOXhzY1NCM25mYzVlOFlCMDdGWlRIakZyc2RJ?=
 =?utf-8?B?NTVaV1d5WWJjcWRlNENRQXRFRUpyUXFxMUdwVmJLWXNzUCtsMUZXVjQrNnZy?=
 =?utf-8?B?aVVMdjVBdkZqa1hOT0Q2aVlIa09MR1hRZ3JWbWhGcFdYUDJ6eE8zcFpsbUpu?=
 =?utf-8?B?R2NDZDFPeXFDSDQ2eURFaGwyVGl4Y1VPa0dkZ0c3OG1kTEdVYW9oc0dCZjlo?=
 =?utf-8?B?aHpKa0hUVkYybjJhYkpGUU9LYWI2Q1p6SzdCNU1ab2VrUlhCQWsrY1ptVWgv?=
 =?utf-8?B?QVkrYk1VZ0RwS0hHeVBWNUF3YjNCeFBtd3Q3RFJTNVRyVW1vZ0FuOFhRS0NE?=
 =?utf-8?B?ODFoZ1dScGJQREFxbTlwd1ZzNHl0VmpKZEdzZityRWJTV1ppWWl1am14ODll?=
 =?utf-8?B?ZTdReGk5VTlFMldYL052MGU4YXlzWTR6S0ZTeGtGT1llV2k2S0lKMXZ0UnZD?=
 =?utf-8?B?UmRFMmFSc0dOY3dJTmNoK1l4emUyS25CeVk0WlhwTWFQR0pYNlNxWGc5Kys3?=
 =?utf-8?Q?LjpjHGmQTes84MWKWjvUD6o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE7B8177124BC34CB31E54F46B26611A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 878e5625-245e-464b-7cce-08dde33a82d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2025 18:17:39.9001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u80jpn/Vpd3aHi0cgskn+w8RjZ+bXMljvls0RFRe8imjDoPAc07/aKWgDWv7cVMSHm0vdRUx6RVetTuHWNDcb1WdhPiiTmHAXymIbmC6q7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8094

DQpIaSBPbGVrc2FuZHIsDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcgY29tbWVudHMuDQoN
Ck9uIDIzLjA4LjI1IDE3OjIzLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToNCj4gW1lvdSBk
b24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBvbGVrc3R5c2hAZ21haWwuY29tLiBMZWFybiB3aHkg
dGhpcyBpcyANCj4gaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJ
ZGVudGlmaWNhdGlvbiBdDQo+IA0KPiBPbiAwNy4wOC4yNSAxNTozMywgTGVvbmlkIEtvbWFyaWFu
c2t5aSB3cm90ZToNCj4gDQo+IEhlbGxvIExlb25pZA0KPiANCj4gDQo+PiBJbnRyb2R1Y2VkIGFw
cHJvcHJpYXRlIHJlZ2lzdGVyIGRlZmluaXRpb25zLCBoZWxwZXIgbWFjcm9zLA0KPj4gYW5kIGlu
aXRpYWxpemF0aW9uIG9mIHJlcXVpcmVkIEdJQ3YzLjEgZGlzdHJpYnV0b3IgcmVnaXN0ZXJzDQo+
PiB0byBzdXBwb3J0IGVTUEkuIFRoaXMgdHlwZSBvZiBpbnRlcnJ1cHQgaXMgaGFuZGxlZCBpbiB0
aGUNCj4+IHNhbWUgd2F5IGFzIHJlZ3VsYXIgU1BJIGludGVycnVwdHMsIHdpdGggdGhlIGZvbGxv
d2luZw0KPj4gZGlmZmVyZW5jZXM6DQo+Pg0KPj4gMSkgZVNQSXMgY2FuIGhhdmUgdXAgdG8gMTAy
NCBpbnRlcnJ1cHRzLCBzdGFydGluZyBmcm9tIHRoZQ0KPj4gYmVnaW5uaW5nIG9mIHRoZSByYW5n
ZSwgd2hlcmVhcyByZWd1bGFyIFNQSXMgdXNlIElOVElEcyBmcm9tDQo+PiAzMiB0byAxMDE5LCB0
b3RhbGluZyA5ODggaW50ZXJydXB0czsNCj4+IDIpIGVTUElzIHN0YXJ0IGF0IElOVElEIDQwOTYs
IG5lY2Vzc2l0YXRpbmcgYWRkaXRpb25hbCBpbnRlcnJ1cHQNCj4+IGluZGV4IGNvbnZlcnNpb24g
ZHVyaW5nIHJlZ2lzdGVyIG9wZXJhdGlvbnMuDQo+Pg0KPj4gSW4gY2FzZSBpZiBhcHByb3ByaWF0
ZSBjb25maWcgaXMgZGlzYWJsZWQsIG9yIEdJQyBIVyBkb2Vzbid0DQo+PiBzdXBwb3J0IGVTUEks
IHRoZSBleGlzdGluZyBmdW5jdGlvbmFsaXR5IHdpbGwgcmVtYWluIHRoZSBzYW1lLg0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IExlb25pZCBLb21hcmlhbnNreWkgPGxlb25pZF9rb21hcmlhbnNreWlA
ZXBhbS5jb20+DQo+Pg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGluIFYyOg0KPj4gLSBtb3ZlIGdpY19u
dW1iZXJfZXNwaXMgZnVuY3Rpb24gZnJvbQ0KPj4gwqDCoCBbUEFUQ0ggMDgvMTBdIHhlbi9hcm06
IHZnaWM6IGFkZCByZXNvdXJjZSBtYW5hZ2VtZW50IGZvciBleHRlbmRlZCBTUElzDQo+PiDCoMKg
IHRvIHVzZSBpdCBpbiB0aGUgbmV3bHkgaW50cm9kdWNlZCBnaWNfaXNfdmFsaWRfZXNwaQ0KPj4g
LSBhZGQgZ2ljX2lzX3ZhbGlkX2VzcGkgd2hpY2ggY2hlY2tzIGlmIElSUSBudW1iZXIgaXMgaW4g
c3VwcG9ydGVkDQo+PiDCoMKgIGJ5IEhXIGVTUEkgcmFuZ2UNCj4+IC0gdXBkYXRlIGdpY19pc192
YWxpZF9pcnEgY29uZGl0aW9ucyB0byBhbGxvdyBvcGVyYXRpb25zIHdpdGggZVNQSXMNCj4+IC0t
LQ0KPj4gwqAgeGVuL2FyY2gvYXJtL2dpYy12My5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8IDczICsrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiDCoCB4ZW4vYXJjaC9h
cm0vaW5jbHVkZS9hc20vZ2ljLmjCoMKgwqDCoMKgwqDCoMKgIHwgMTcgKysrKysrDQo+PiDCoCB4
ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZ2ljX3YzX2RlZnMuaCB8IDMzICsrKysrKysrKysrKw0K
Pj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCAxMjMgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vZ2ljLXYzLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLXYzLmMNCj4+IGlu
ZGV4IDhmZDc4YWJhNDQuLmEwZThlZTFhMWUgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
Z2ljLXYzLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9naWMtdjMuYw0KPj4gQEAgLTQ4NSw2ICs0
ODUsMzYgQEAgc3RhdGljIHZvaWQgX19pb21lbSAqZ2V0X2FkZHJfYnlfb2Zmc2V0KHN0cnVjdCAN
Cj4+IGlycV9kZXNjICppcnFkLCB1MzIgb2Zmc2V0KQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRl
ZmF1bHQ6DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCB9DQo+PiArI2lmZGVmIENPTkZJR19HSUNWM19FU1BJDQo+PiArwqDCoMKgIGNh
c2UgRVNQSV9CQVNFX0lOVElEIC4uLiBFU1BJX01BWF9JTlRJRDoNCj4+ICvCoMKgwqAgew0KPj4g
K8KgwqDCoMKgwqDCoMKgIHUzMiBpcnFfaW5kZXggPSBFU1BJX0lOVElEMklEWChpcnFkLT5pcnEp
Ow0KPj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKgIHN3aXRjaCAoIG9mZnNldCApDQo+PiArwqDCoMKg
wqDCoMKgwqAgew0KPj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgR0lDRF9JU0VOQUJMRVI6DQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gKEdJQ0QgKyBHSUNEX0lTRU5BQkxFUm5FICsg
KGlycV9pbmRleCAvIDMyKSAqIDQpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgR0lDRF9JQ0VO
QUJMRVI6DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gKEdJQ0QgKyBHSUNEX0lD
RU5BQkxFUm5FICsgKGlycV9pbmRleCAvIDMyKSAqIDQpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIGNh
c2UgR0lDRF9JU1BFTkRSOg0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIChHSUNE
ICsgR0lDRF9JU1BFTkRSbkUgKyAoaXJxX2luZGV4IC8gMzIpICogNCk7DQo+PiArwqDCoMKgwqDC
oMKgwqAgY2FzZSBHSUNEX0lDUEVORFI6DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gKEdJQ0QgKyBHSUNEX0lDUEVORFJuRSArIChpcnFfaW5kZXggLyAzMikgKiA0KTsNCj4+ICvC
oMKgwqDCoMKgwqDCoCBjYXNlIEdJQ0RfSVNBQ1RJVkVSOg0KPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIChHSUNEICsgR0lDRF9JU0FDVElWRVJuRSArIChpcnFfaW5kZXggLyAzMikg
KiA0KTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBjYXNlIEdJQ0RfSUNBQ1RJVkVSOg0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIChHSUNEICsgR0lDRF9JQ0FDVElWRVJuRSArIChpcnFf
aW5kZXggLyAzMikgKiA0KTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBjYXNlIEdJQ0RfSUNGR1I6DQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gKEdJQ0QgKyBHSUNEX0lDRkdSbkUgKyAo
aXJxX2luZGV4IC8gMTYpICogNCk7DQo+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSBHSUNEX0lST1VU
RVI6DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gKEdJQ0QgKyBHSUNEX0lST1VU
RVJuRSArIGlycV9pbmRleCAqIDgpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgR0lDRF9JUFJJ
T1JJVFlSOg0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIChHSUNEICsgR0lDRF9J
UFJJT1JJVFlSbkUgKyBpcnFfaW5kZXgpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIGRlZmF1bHQ6DQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+
PiArwqDCoMKgIH0NCj4+ICsjZW5kaWYNCj4+IMKgwqDCoMKgwqAgZGVmYXVsdDoNCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBicmVhazsNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gQEAgLTY0NSw2ICs2NzUs
NDAgQEAgc3RhdGljIHZvaWQgZ2ljdjNfc2V0X2lycV9wcmlvcml0eShzdHJ1Y3QgDQo+PiBpcnFf
ZGVzYyAqZGVzYywNCj4+IMKgwqDCoMKgwqAgc3Bpbl91bmxvY2soJmdpY3YzLmxvY2spOw0KPj4g
wqAgfQ0KPj4NCj4+ICsjaWZkZWYgQ09ORklHX0dJQ1YzX0VTUEkNCj4+ICt1bnNpZ25lZCBpbnQg
Z2ljX251bWJlcl9lc3Bpcyh2b2lkKQ0KPj4gK3sNCj4+ICvCoMKgwqAgcmV0dXJuIGdpY19od19v
cHMtPmluZm8tPm5yX2VzcGk7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIGdpY3YzX2Rp
c3RfZXNwaV9jb21tb25faW5pdCh1aW50MzJfdCB0eXBlKQ0KPiANCj4gbWlzc2luZyBfX2luaXQg
Pw0KPiANCg0KWWVzLCBJIG1pc3NlZCB0aGlzLiBJIHdpbGwgYWRkIGl0IGluIFYzLg0KDQo+PiAr
ew0KPj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgZXNwaV9ucjsNCj4+ICvCoMKgwqAgaW50IGk7DQo+
IA0KPiBwbGVhc2UgdXNlIHVuc2lnbmVkIGludCBpZiAiaSIgY2Fubm90IGJlIG5lZ2F0aXZlDQo+
IA0KDQpTdXJlLCBJIHdpbGwgY2hhbmdlIGludCB0byB1bnNpZ25lZCBpbnQsIGJlY2F1c2UgaXQg
cmVhbGx5IGNhbm5vdCBiZSANCm5lZ2F0aXZlLg0KDQo+PiArDQo+PiArwqDCoMKgIGVzcGlfbnIg
PSBtaW4oMTAyNFUsIEdJQ0RfVFlQRVJfRVNQSVNfTlVNKHR5cGUpKTsNCj4+ICvCoMKgwqAgZ2lj
djNfaW5mby5ucl9lc3BpID0gZXNwaV9ucjsNCj4+ICvCoMKgwqAgLyogVGhlIEdJQyBIVyBkb2Vz
bid0IHN1cHBvcnQgZVNQSSwgc28gd2UgY2FuIGxlYXZlIGZyb20gaGVyZSAqLw0KPj4gK8KgwqDC
oCBpZiAoIGdpY3YzX2luZm8ubnJfZXNwaSA9PSAwICkNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1
cm47DQo+PiArDQo+PiArwqDCoMKgIGZvciAoIGkgPSAwOyBpIDwgZXNwaV9ucjsgaSArPSAxNiAp
DQo+PiArwqDCoMKgwqDCoMKgwqAgd3JpdGVsX3JlbGF4ZWQoMCwgR0lDRCArIEdJQ0RfSUNGR1Ju
RSArIChpIC8gMTYpICogNCk7DQo+PiArDQo+PiArwqDCoMKgIGZvciAoIGkgPSAwOyBpIDwgZXNw
aV9ucjsgaSArPSA0ICkNCj4+ICvCoMKgwqDCoMKgwqDCoCB3cml0ZWxfcmVsYXhlZChHSUNfUFJJ
X0lSUV9BTEwsIEdJQ0QgKyBHSUNEX0lQUklPUklUWVJuRSArIA0KPj4gKGkgLyA0KSAqIDQpOw0K
Pj4gKw0KPj4gK8KgwqDCoCBmb3IgKCBpID0gMDsgaSA8IGVzcGlfbnI7IGkgKz0gMzIgKQ0KPj4g
K8KgwqDCoCB7DQo+PiArwqDCoMKgwqDCoMKgwqAgd3JpdGVsX3JlbGF4ZWQoMHhmZmZmZmZmZlUs
IEdJQ0QgKyBHSUNEX0lDRU5BQkxFUm5FICsgKGkgLyANCj4+IDMyKSAqIDQpOw0KPj4gK8KgwqDC
oMKgwqDCoMKgIHdyaXRlbF9yZWxheGVkKDB4ZmZmZmZmZmZVLCBHSUNEICsgR0lDRF9JQ0FDVElW
RVJuRSArIChpIC8gDQo+PiAzMikgKiA0KTsNCj4+ICvCoMKgwqAgfQ0KPj4gKw0KPj4gK8KgwqDC
oCBmb3IgKCBpID0gMDsgaSA8IGVzcGlfbnI7IGkgKz0gMzIgKQ0KPj4gK8KgwqDCoMKgwqDCoMKg
IHdyaXRlbF9yZWxheGVkKEdFTk1BU0soMzEsIDApLCBHSUNEICsgR0lDRF9JR1JPVVBSbkUgKyAo
aSAvIA0KPj4gMzIpICogNCk7DQo+PiArfQ0KPj4gKyNlbmRpZg0KPj4gKw0KPj4gwqAgc3RhdGlj
IHZvaWQgX19pbml0IGdpY3YzX2Rpc3RfaW5pdCh2b2lkKQ0KPj4gwqAgew0KPj4gwqDCoMKgwqDC
oCB1aW50MzJfdCB0eXBlOw0KPj4gQEAgLTY5MCw2ICs3NTQsMTAgQEAgc3RhdGljIHZvaWQgX19p
bml0IGdpY3YzX2Rpc3RfaW5pdCh2b2lkKQ0KPj4gwqDCoMKgwqDCoCBmb3IgKCBpID0gTlJfR0lD
X0xPQ0FMX0lSUVM7IGkgPCBucl9saW5lczsgaSArPSAzMiApDQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgd3JpdGVsX3JlbGF4ZWQoR0VOTUFTSygzMSwgMCksIEdJQ0QgKyBHSUNEX0lHUk9VUFIgKyAo
aSAvIA0KPj4gMzIpICogNCk7DQo+Pg0KPj4gKyNpZmRlZiBDT05GSUdfR0lDVjNfRVNQSQ0KPj4g
K8KgwqDCoCBnaWN2M19kaXN0X2VzcGlfY29tbW9uX2luaXQodHlwZSk7DQo+PiArI2VuZGlmDQo+
PiArDQo+PiDCoMKgwqDCoMKgIGdpY3YzX2Rpc3Rfd2FpdF9mb3JfcndwKCk7DQo+Pg0KPj4gwqDC
oMKgwqDCoCAvKiBUdXJuIG9uIHRoZSBkaXN0cmlidXRvciAqLw0KPj4gQEAgLTcwMyw2ICs3NzEs
MTEgQEAgc3RhdGljIHZvaWQgX19pbml0IGdpY3YzX2Rpc3RfaW5pdCh2b2lkKQ0KPj4NCj4+IMKg
wqDCoMKgwqAgZm9yICggaSA9IE5SX0dJQ19MT0NBTF9JUlFTOyBpIDwgbnJfbGluZXM7IGkrKyAp
DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVxX3JlbGF4ZWRfbm9uX2F0b21pYyhhZmZpbml0
eSwgR0lDRCArIEdJQ0RfSVJPVVRFUiArIGkgDQo+PiAqIDgpOw0KPj4gKw0KPj4gKyNpZmRlZiBD
T05GSUdfR0lDVjNfRVNQSQ0KPj4gK8KgwqDCoCBmb3IgKCBpID0gMDsgaSA8IGdpY3YzX2luZm8u
bnJfZXNwaTsgaSsrICkNCj4+ICvCoMKgwqDCoMKgwqDCoCB3cml0ZXFfcmVsYXhlZF9ub25fYXRv
bWljKGFmZmluaXR5LCBHSUNEICsgR0lDRF9JUk9VVEVSbkUgKyBpIA0KPj4gKiA4KTsNCj4+ICsj
ZW5kaWYNCj4+IMKgIH0NCj4+DQo+PiDCoCBzdGF0aWMgaW50IGdpY3YzX2VuYWJsZV9yZWRpc3Qo
dm9pZCkNCj4gDQo+IA0KPiBbc25pcF0NCj4gDQoNCkJlc3QgcmVnYXJkcywNCkxlb25pZA==

