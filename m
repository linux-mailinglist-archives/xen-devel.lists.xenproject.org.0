Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDB539161E
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 13:28:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132462.247069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llri7-0001W3-TE; Wed, 26 May 2021 11:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132462.247069; Wed, 26 May 2021 11:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llri7-0001Sp-P5; Wed, 26 May 2021 11:28:27 +0000
Received: by outflank-mailman (input) for mailman id 132462;
 Wed, 26 May 2021 11:28:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PyTD=KV=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1llri5-0001ST-LG
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 11:28:25 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b59d9ad-291e-4e0c-af65-ed2f37cbcac9;
 Wed, 26 May 2021 11:28:23 +0000 (UTC)
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
X-Inumbo-ID: 1b59d9ad-291e-4e0c-af65-ed2f37cbcac9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622028503;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mhzlBimBWcs8Mhhv3EymKBxQKVkKqOw57uSN1oly9Dg=;
  b=WXhynHbCAHlB02Kb72SOML5+2od82DjwXV1TecimzV8MrquvFvoZyd/P
   1d9yK4tiBbaBJd4UkuU2J7xJP4sJciIq0BeQRFUMQ4Cvq59PaoSGRheIJ
   jCPTPLrKXRmhHd7dm/REuqczdzmOmHO0ZdFWOUPK8bxa+tteUD45FwgAB
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QmFZioIRceKdE8PxmSCA+K+OxhnFyvRHebkJuHB8UYZbNfaMAznaqE3nyNYScI7Ga45pznXp12
 En44MwY1DOAUQdKBpOgbb7qDr/omeQPloeog8wTJ/X94N8hgHJN83yVK27nV/vYzbLlxV/DY/C
 jTrMIe+flEQRMc5Yeo3pLNk/8X/3zS8DgbNtYk2amcN+5I9OL/Wf72N4hmux74gL2521YWP9P9
 UzTG8zNaTEkJVW4CyK5wKk/4SxHxQzE1ZovM4KllMWTH5pUNo53HZS/E5a9xvKM3RIdH8RaYF3
 RVI=
X-SBRS: 5.1
X-MesageID: 45032342
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:6/ELQqu/DN0Cm+vtiNfPKoHg7skCv4Mji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJh5o6H9BEGBKUmskaKceeEqTPaftXrdyRSVxeZZnMvfKlzbamPDH4tmtJ
 uIHJIOcOEYYWIK7/oSpTPIburIo+P3s5xA592utEuFJDsCA8oLgmcJaTpzUHcGPjWubaBJSa
 Z0jfA3wAZIDE5nF/hTcUN1OdQryee78a7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFuxaR3NTgj9iLjjvnk0PD5ZVfn9XsjvFZAtaXt8QTIjLwzi61eYVaXaGYtjxdmpDr1L9qqq
 iJn/4TBbU015rjRBDtnfIr4Xi57N8a0Q6k9bZfuwq5nSW2fkNhNyMLv/MmTvKQ0TtQgDg76t
 MW44vRjeslMTrQ2Cv6/NTGTBdsiw69pmcji/caizhFXZIZc6I5l/1TwKvEeK1wbB4SxbpXW9
 WGNvusrsq+sGnqGUwxtVMfjOBEnk5DVituZ3Jy9fB9/wIm6EyR/nFojfD3xE1wga7VY6M0kN
 gsHJ4Y5o1zcg==
X-IronPort-AV: E=Sophos;i="5.82,331,1613451600"; 
   d="scan'208";a="45032342"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J91sTNOBheHCssWFPwnGhVCZMF0NQDJ1lnJkM+kkAdhonulKANfkNVOoHMxD1brtxt6j2ikACgqz3h2Z2WhZDuGUhs+REx2ac3VPPa06hXzRuvG2Jg853LSO+g/O19GI5nHQAQ+6IVHTcoVuuL9aaWgtBM1x7t2AnvCnnOj1tImeX8vfZS+5rc8N+pW9Ut3M0MV9iv8z+YmKmh8zOCXOjNLoooEGmJSq+B81IAA5AznVjKeQcUqqHpCaYWbziNCDohyr9MEDue2u6bFgjjDlo7UoiBi8GelSwkyAMLoj8qiT1RkqvEXCQ0qlR9ndRL9ky0Wie3rZvsauASeT4DUl7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhzlBimBWcs8Mhhv3EymKBxQKVkKqOw57uSN1oly9Dg=;
 b=AEhwRNCcn8Qaf5Eyl5e+9B3B1AIcJceiO+7Ho/830WTsVGFU7zhTxuMsqOJjdDLSp0BYzGVI/tHLOdRCOScCNwwbY78uInpwzxTv3olZHpKNPX9lao9yRv+JMboxcFfm9MgjcBehz+F90YhkFoLhFwNgXmYGD/+7WwKwhX3BeZWivm5e6GnZUGNPeTrS6xFh2RVLTEBh5gzG1aZUdLOllOpeVKWW7D6cbwblrCiTIdpc1N011ySpMlNQfjfiLMJ05wPTD6aOz8pEdyY0WdvJ3rlou3ZrGBzVAW5hI0WdCrm6hL3H7FBVt+EmY/8CQeoSVaxIqBetnTnlM/i/2eUE/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhzlBimBWcs8Mhhv3EymKBxQKVkKqOw57uSN1oly9Dg=;
 b=bQ9PTsST/soz2CW/Icx8ov7KRuZ28aOefQNvNo2eMbVolFBV+lIcjjh19RcQnH1LCPCJJ3EiBaXYPVaG63syndrttEk0HgmoYwEenX4rbC1b+NeR7iFYaNOzFb6I0/XUTy3v2OmSShfbNYDFxyqTMmSur44tyKeb3983IgzqTn8=
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"community.manager@xenproject.org" <community.manager@xenproject.org>
Subject: Re: IRC networks
Thread-Topic: IRC networks
Thread-Index: AQHXTMUre4pjfhF+RUKgWz01JlgFDKrq+tiAgAqpdACAAAaZgA==
Date: Wed, 26 May 2021 11:28:17 +0000
Message-ID: <728C3CFC-89BE-4084-A632-2E9502B28985@citrix.com>
References: <24741.12566.639691.461134@mariner.uk.xensource.com>
 <10B84448-21E3-41F2-AAD2-B9F6E9EB5DE8@citrix.com>
 <24750.11078.528225.772285@mariner.uk.xensource.com>
In-Reply-To: <24750.11078.528225.772285@mariner.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc81b949-d5ac-4689-363c-08d920395ba4
x-ms-traffictypediagnostic: PH0PR03MB6365:
x-microsoft-antispam-prvs: <PH0PR03MB6365933F7C85DC353BFF030199249@PH0PR03MB6365.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8KQ40Tx+R0YqfsbeROY79A/6SOYQ6urUnsmZ4F1zrF9F5PuBlMxoPaZbtGi2UOddkfdc35BrVgPlWODnLibFleF0+DP+90a8h9msvACJEOt9v309BQccN5fTuBemGjoezr8yXHnTbUfazjmLKEXKTb5FFtdxvE5fzJAc5th/LG4hznuGdAP4AVsY+4SDWRAMu8pB44VhcFcd58jo+w05hmUm0HwOrdTVDq7izXF/21RWvwzM5F3mVLpDhBgLoQBPz5w1BFZ1AHcP5BsxM+6eTs3530ufYLLt1b5AtslQ1AIxJ7tJfeKvL8jyK8WAf/nRUD7kWAoOJct6i2LlIeJlnrAvVM5Dyozdy22/BpERkURTNBCgheJLlh5Cr9VALWRQLNUcZ8sVFk6vpVPAtZ7OKIoVYj2hOLBV9Xlh1Cu6u/lTj7NyrrXB17S/cejJ9d88TD//HXdYBkXDoy1/B9dMEP+27AxKDGqKg2AgyycqwpmGosKIVVYAAWQhR8Yy260zf+alQ2E0Pd+q5PdHM7hZPMlq533He6GwEUr/Tg7E3WcWsz50+U2hfgCq3xQIPKFNErUDW7hdDGT/49BySe3tHOKpwpERluxdzneNWkVymvnOFl3SWIEQn38sfU6yhyiKQ0AVO/gfjeNoeAQZyK0s53H+CD4Ke8L+PoqMvwuc7/Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(39850400004)(396003)(186003)(2616005)(36756003)(6486002)(54906003)(53546011)(5660300002)(91956017)(6512007)(3480700007)(64756008)(66446008)(66556008)(2906002)(76116006)(6506007)(7116003)(26005)(8936002)(83380400001)(6916009)(38100700002)(33656002)(316002)(71200400001)(66946007)(86362001)(8676002)(66476007)(4326008)(478600001)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?QzRudWczQktpTEJoM0w4Zm1vSk50cERqdUJ2LzB1empYTzdqdmkwREFYaHlX?=
 =?utf-8?B?WmZVMXU0NzJWV3lMeFdRWUY1KzBIeHAwMms5bGhaM0V2d0JTR0pRQjR5a09D?=
 =?utf-8?B?ZFpjYVVNbzM0SDVQYkdaSnhaSzExVVkvTHFQL3I4dkgwOTBrOW1zRUw2NDcx?=
 =?utf-8?B?eEpGOS8zNUJlOUUvRjZmVWVsVXkrY2JGNVpDQXZyV2daRDJnRUIxdFVPOEZJ?=
 =?utf-8?B?ZGZabmRWbmt2QjV2Z0J5dTBqcFQ3bXI2QTByUjY1RFRQajMzUS9KNFZlTGpk?=
 =?utf-8?B?V1pDejBYVWM5QUpyWUZXRkRQUzJVa0VVN0UxOHBacjc4R3NqOXNIOEoxTGpD?=
 =?utf-8?B?WmJKTmFnVUo3d1VGUTI4MHNPdHZ0NjRZVU5Lc004SWJ4N0NHeXdiWFdQMUM2?=
 =?utf-8?B?MlRGNnZ3Y0ZuNDhONlh3N3NTcXhDN1Z3bGZMc3NlNjIwL1hUZmFGOTRCWVJw?=
 =?utf-8?B?dmREemE0Qy9xKyt5LzdFVkFUQnZRRUpWbGFxSTRUQTNqckdGbW50MjU1NTBI?=
 =?utf-8?B?Z0tZTTRoRytzMEFkQkE1dmlFaWlSWlBhSWRmalUzNHBwQmwxTklkZzB0aXBq?=
 =?utf-8?B?T05VcEptaTRMdjBCMFlrQjhwdUszemhSZ2k3ZHp4VzFtSE9qQjBVOVJ5MEg1?=
 =?utf-8?B?ZFFjbkhGV3JjU3lTMlJwdmdEY0Q4QVVHcXpzZFhIMDFCd3diSVlvVVNoQWtp?=
 =?utf-8?B?NVJ4TVNWbTd5NGdtMUJ3WjBVb1BVaERuODIycjV6YWNGNVVYNW5pZ1loUEdM?=
 =?utf-8?B?TnREaS8yUkl5K0dLRFB0ekFHd0wrUVJIWW1FNVJBdDFmdHFwNGtJcW00WFJI?=
 =?utf-8?B?VDhaa3JLRjhuZG1XWGZha1VweXlHM1lnaThEOXN1UWZXbWJSN21GSmE3TmdU?=
 =?utf-8?B?STBGQTYrS1RYcUxveFhMbjE1NkFSRnd4TDJ3eEMvTkpndkt2ZHV2OUJiTlg5?=
 =?utf-8?B?RjRPV3FWM2J3QWtRa21YQktSNk1yU3N1ZkVZeDQrN3YwVmlPNWZvQXZ0Z003?=
 =?utf-8?B?NFRwclJKa3RVa2lUb1BqT0ZWcURUakk0Z1RxaENTaWUrRmxLNTZHNzgzd2Rh?=
 =?utf-8?B?ZmVjZURDYlRKNm8ydXlVVDZISXJkVXU1eVUzcHg1M0xSV3h2ek1OTzlzcGZm?=
 =?utf-8?B?U3RKZ0JVR2xkR212VEd4WG9VZnc2WmNWNTJNYWdzVXpzM3l2NElLVThXTXJk?=
 =?utf-8?B?cUJMb3pPVjNXMVI5dGttNVNVc2tLU1BoNXExMkRxc0txQTFSMndKL0hYYmFm?=
 =?utf-8?B?RkVrWGtzMFBRYmlaV1NBeDJDT3p0THpVVk4yYXpMT1VucTY2MHhOMGtwR3Jk?=
 =?utf-8?B?VFJrVDVZdmdoZVJ3YkFOeE94cktsc2huMEVqcTQzWGFCVTBUMENKQWtDOUFM?=
 =?utf-8?B?M0dLWFVKRnN6Tml3QUtNbWFzWE1LQXdrcHlIa2w4K3hhQlFjODdzWDVvbkNZ?=
 =?utf-8?B?SWZjV1dyL1hUYm5reEJCL1N5YVF6VFFjZ1BEcUsrN3ZpQ1dSdzVJNlVXWkNK?=
 =?utf-8?B?czlwQW4yQW16TUdXNjZRanlhTy80WlN5NXkzekxJb3FwTUpNdnBHdGtiSlBt?=
 =?utf-8?B?aFJkZGIrSUNDT3VaaE9YWTdNWDZmYUVieEZOcnVwdTFNSWp3MnVpaDY4RVdq?=
 =?utf-8?B?bE9iZkpmVmZYd3ozenZmZ3NKSWpEQ2NWMGsrbWhXYXM1ZXVxYnZTRS8xSThX?=
 =?utf-8?B?RzZaQjZxZzdKdWdnbkNyY3FTYkhEWGhGeGk0cjJ3bTJxSXAveVNXYlY2KzBX?=
 =?utf-8?B?WmlXZmdlZzBTSnBsVSszVjRnVVR1Sy80ekNuNml1bUlsUmhqVk5ieTY2cVVU?=
 =?utf-8?B?QmtWL0dYVnZVZnFobFpmZz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9E627F48204FA48B0E897BA2DA5CD65@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc81b949-d5ac-4689-363c-08d920395ba4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2021 11:28:17.0646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nuCsYVGeHTl6E7QUgzOZBn5baMOERxLkGm73/OpbSKh/aniwrXY6cB0jbMv4UBclDNr5T5wot+s54nDy6vvoDZmV9pfQtdEJ+Jpftxzc3jw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6365
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTWF5IDI2LCAyMDIxLCBhdCAxMjowNCBQTSwgSWFuIEphY2tzb24gPGl3akB4ZW5w
cm9qZWN0Lm9yZz4gd3JvdGU6DQo+IA0KPiBHZW9yZ2UgRHVubGFwIHdyaXRlcyAoIlJlOiBJUkMg
bmV0d29ya3MiKToNCj4+IFRoYW5rcywgSWFuLiAgSSB0ZW5kIHRvIGFncmVlIHdpdGggdGhlIHJl
Y29tbWVuZGF0aW9uLiAgSSB0aGluayB1bmxlc3Mgc29tZW9uZSB3YW50cyB0byBhcmd1ZSB0aGF0
IHdlIGdvIHRvIGxpYmVyYSAob3Igc3RpY2sgd2l0aCBmcmVlbm9kZSksIHdlIHNob3VsZCBnbyB3
aXRoIHRoYXQgb3B0aW9uLiAgDQo+PiANCj4+IE5vcm1hbGx5IGZvciBhIGRlY2lzaW9uIGxpa2Ug
dGhpcyB3ZeKAmWQgd2FpdCAyIHdlZWtzIGZvciBjb3VudGVyLWFyZ3VtZW50cyBiZWZvcmUgbWFr
aW5nIGl0IG9mZmljaWFsLiAgRG9lcyBhbnlvbmUgd2FudCB0byBhcmd1ZSB0aGF0IHdlIHNob3Vs
ZCBtb3ZlIHVwIHRoZSB0aW1ldGFibGUgZm9yIHNvbWUgcmVhc29uPw0KPj4gDQo+PiBJ4oCZdmUg
cmVnaXN0ZXJlZCAjeGVuZGV2ZWwgb24gb2Z0YzsgSeKAmWQgZW5jb3VyYWdlIGVhcmx5IGFkb3B0
ZXJzIHRvIGdpdmUgaXQgYSB0cnkuDQo+IA0KPiBSZWNlbnQgYmVoYXZpb3VyIGJ5IHRoZSBuZXcg
ZGUgZmFjdG8gb3BlcmF0b3JzIG9mIEZyZWVub2RlIGhhcyBiZWVuDQo+IHF1aXRlIGVncmVnaW91
cy4gIEluIHBhcnRpY3VsYXIsIGl0IGlzIG5vdyBhZ2FpbnN0IHRoZSBydWxlcyB0byBzZXQNCj4g
eW91ciB0b3BpYyB0byBkaXJlY3QgeW91ciB1c2VycyB0byBsaWJlcmEuY2hhdCwgdGhlIHJlcGxh
Y2VtZW50IHNldCB1cA0KPiBieSB0aGUgcmVzaWduaW5nIEZyZWVub2RlIHN0YWZmLiAgVGhlIHNl
cnZlciBvcGVyYXRvcnMgaGF2ZSBiZWVuDQo+IHRha2luZyBvcHZlciBjaGFubmVscyB3aGVyZSB0
aGUgcHJvamVjdCBhcmUgdHJ5aW5nIHRvIG1pZ3JhdGUuICAoSQ0KPiB0aGluayB0aGF0IHByb2Jh
Ymx5IGFwcGxpZXMgdG8gT0ZUQyB0b28uKQ0KPiANCj4gQWxzbywgdGhlIG5ldyBkZSBmYWN0byBv
cGVyYXRvcnMgb2YgRnJlZW9ub2RlIGFyZSB1c2luZyB1c2VyIGNvdW50IHRvDQo+IGp1c3RpZnkg
dGhlaXIgYmVoYXZpb3VyLg0KDQpZZXMsIEkgc2F3IHRoaXMgdG9vLCBhbmQgSSBhZ3JlZS4gIEni
gJlsbCB0cnkgdG8gZ2V0IHRoZSB4ZW5wcm9qZWN0IHdlYnBhZ2UgY2hhbmdlZCB0b2RheSBpZiBw
b3NzaWJsZS4NCg0KIC1HZW9yZ2UNCg0K

