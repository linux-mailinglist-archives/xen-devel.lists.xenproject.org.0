Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C09C2F9BE0
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 10:28:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69497.124404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Qpb-0005Y4-7I; Mon, 18 Jan 2021 09:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69497.124404; Mon, 18 Jan 2021 09:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Qpb-0005Xe-49; Mon, 18 Jan 2021 09:28:15 +0000
Received: by outflank-mailman (input) for mailman id 69497;
 Mon, 18 Jan 2021 09:28:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LVP7=GV=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l1QpY-0005XX-RD
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 09:28:12 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cc0a1d7-af7d-46bd-9a0e-ba627520856a;
 Mon, 18 Jan 2021 09:28:11 +0000 (UTC)
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
X-Inumbo-ID: 9cc0a1d7-af7d-46bd-9a0e-ba627520856a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610962091;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cREkINcwAVWlpVT+b3AoRmFY6fbOLmNL+/3q7HDI/+g=;
  b=aZbRrIpv6spVfucXKi4XfOA5QgCU5mljBOi/8koCKPRgvBiqYya59Cq7
   QZOfnZ4Q1VH97HsahmacwBKSUefz6Cy3jE/u+gWnC907f9/J3bMh2Tmv4
   g1BeZimuGW7ZLyeRB9VhK8kuCab/C2iG6RChwpPpa56dlyzSBOlmn/6C1
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bBMfODjkBx10c5xIg/DqPsjEifeh8JPn/+mLvM6e7kol0/lgktVihN2C9IN9fNI4yYU3AykoC1
 RkQA4Kdz3ReRQZ3Sp03Y7iFuRhFT6NBKy19qSctTK5JmYnywYjCGfJGe9z5IqvLDBjd0CzIGH7
 dTqw7dNpVEjvqx6+4r5Wm1oeWr+lhwUKTcRANzinYlzp4q5FpgJwdsL8Zdoz31U6X9goK5o1VA
 tMxxwQunadFtUblK9Bz2GWHJiQRFwPSZKS17QYWmoHZ5pHlWJrugrPemCMhhLmeB4l0lgjWxb5
 1Xk=
X-SBRS: 5.2
X-MesageID: 35276261
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="35276261"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ddz/YQA61f7aw1GfzhcaYuo4TgqmMlHXaMetqjrZU0XUwv6+n8QHzr+80i/ALRm9BqWNiW/rKJt8Y3ePWCfhX+YzOy1WO2nU9MbScv6tXWvxfzDXfQFcemQ9sZlt78qs6aqmYj8IG5AsIdEfqq8GDdWcH9XhbXI0TD7bS5u308Mf4yPbNiQJNP0zn9ORCrjEsVTI9wlN6fYZBIuMFWLbsIWLGdgbUYAf2bzs9uaJxFDMyds34SEIDm3fRUcH1pGsBfwnBLMBPwjqoa9PHMIMaDqfrZMGQVW5LKMXvtBD6PuD9MD30GDRSSnBGgjscBwkKlm8v3/9sf+jQLPFcTlZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cREkINcwAVWlpVT+b3AoRmFY6fbOLmNL+/3q7HDI/+g=;
 b=efNIAPLV7z5QT76asgpJwIVHekvpzfSbnWjyXUjyX2Ftca809gXZLGox0s+WrW4Xb6/7LGS3DEneDXjirwbFIo1/y0q2IJ4VX/j4HPzYMdpiUPYucrbr0KhH76QWo6CoP3uSLvugcZlS4+giNcv+uKE/tFxhZgNMw+GaByX6MY86mtWfjE7CaiHyWxK0f3XXQQ8p1SHYelExw3uvYyjR1GuWegO7B9ktQjnNKgGTw+SEHQEmNy0OyssipJv1WGrWu+VrEObqFX/NrzidB2VlHvrl+guOUWTQELLM8jlk2Z0+rQykXZHTi0Xrlk/PBOoHvQZ2069dho4ELahtfvY2EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cREkINcwAVWlpVT+b3AoRmFY6fbOLmNL+/3q7HDI/+g=;
 b=eo58rik5PAFzZbItFnsAraFloJaQ0pnuI1GUTVOmP+xKJp7w8HpwN2osD90lL25F6zNSzEQpHk1E0X5Tof0HanV2H+G89Pst3x7Q9nMrG6K9R2RGzmHXB1NnEqbHw1ZtJALAvnZEi3I/IomW0DlBgkdL/0G9zsfNnhxl4wNYZGI=
From: Edwin Torok <edvin.torok@citrix.com>
To: "jgross@suse.com" <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "wl@xen.org" <wl@xen.org>, Pau Ruiz Safont <pau.safont@citrix.com>,
	"dave@recoil.org" <dave@recoil.org>, Christian Lindig
	<christian.lindig@citrix.com>, "iwj@xenproject.org" <iwj@xenproject.org>
Subject: Re: [PATCH v2 4/8] tools/ocaml/xenstored: only quit on SIGTERM when a
 reload is possible
Thread-Topic: [PATCH v2 4/8] tools/ocaml/xenstored: only quit on SIGTERM when
 a reload is possible
Thread-Index: AQHW64310ek+Wy0m9k+iQ4GibZAM76otBnOAgAAa5oA=
Date: Mon, 18 Jan 2021 09:28:08 +0000
Message-ID: <cd60ae8472c30407101eb42ab4d734008573ec3c.camel@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
	 <023574503750d06132e3ca260848c364ff439001.1610748224.git.edvin.torok@citrix.com>
	 <09b5ab23-2044-dc8c-cc61-14cd8055c21d@suse.com>
In-Reply-To: <09b5ab23-2044-dc8c-cc61-14cd8055c21d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.38.1-1 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bd5b50e-3268-4388-954b-08d8bb935dd9
x-ms-traffictypediagnostic: SJ0PR03MB5742:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR03MB57429951C739904EEC4352DE9BA40@SJ0PR03MB5742.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n/na/wpujVyMC3CXGW3VskyfBhAQ1aWdwTGs5AulYp8m33JTlAJl/wNpgPeEXIHcGyaEFUI5Z6JGJr2vxv1kDfP4/YhLxTibO48ZxK0di65YIftgSnXPYUj9+aH3vL2ZF3Db7vDiA5Wif42H+++lLKMGuRg4ujW4Yhr1Ygs0KK2fN0+EsXB+FG2c3y5S3Zt9Y4+tu/Fp7PTXQ1dDqiomUFffSLC4oRJ7e7/j1logWIGYaHxlbgo+W9I5PQCs4AETCtJXuSW9/+MzWMUsifJCzcqY9jdpIHL09o2YkCaQ6A5SEk+zyPwUYG9XeW8pdVzQ/14rTr2aC/W4VBYJl7LEchnTnA5QCfU6dQQXhEV2F6eT+Ks+UCo1dSwLMK/Xr6fzA2GRXmOC6fab2OG1FUuP04yWTI2fKaSDBCd2kiL3Eh0fjtszcvcjy6wYBG9jZhrV7vpqFk53NrOK53s0/UrtcA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(396003)(136003)(366004)(376002)(91956017)(76116006)(71200400001)(4326008)(66556008)(64756008)(5660300002)(966005)(2906002)(53546011)(2616005)(6506007)(66446008)(8676002)(26005)(8936002)(478600001)(36756003)(54906003)(316002)(110136005)(86362001)(6512007)(6486002)(66946007)(66574015)(186003)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?eUwzdWxZQ1oxZVc1OGl4aVZOdHNNc0RrdFVPVEM3VjVKMXVkbHNGSjdBYlBk?=
 =?utf-8?B?Tzlkai9iOHA2VVIydkV4dExheXJjTjVnZnN5KzMyaW04cUlQTU92VDFuNVdS?=
 =?utf-8?B?bGEwTnp6YlBQbXFkKzVZTGJYN3htdlB1OVZmQXc5MzJaeDVValNJb0FFcEM1?=
 =?utf-8?B?UDdYZlB3bFNoc2FpcXY4ZW5YWEhXZytYU3ZyNkRoSG55dG9rUlFnbWRYRVB3?=
 =?utf-8?B?aURzMTdqM21jaFJUY2VaTzVzc0NSRFdWYUk2MDVzWTBHYjNjdXV5dGhtNUVG?=
 =?utf-8?B?c0ZCa2dMRUJHSWJ0ZThmTG9WMHgrK2cvK2ZVS3BvcjB6TUJaV0QvL0V1bzl1?=
 =?utf-8?B?eHFzQ3NPUWc0UEhRNTV1OUw4V2VNUEcwcDhLeE1MdGZrSllDeC9zdjd3VVhp?=
 =?utf-8?B?UFA0akl5cGxOU0V0b2Z3bDdFMTgyUERXL3crTktsTG5CdElSeG9henVTdzNB?=
 =?utf-8?B?Y05XQlhYVkg2WVV0NXUyLy9ERHdBZmJ0YXQzbEltMjNNc2V1U1FIbUJ3SU5B?=
 =?utf-8?B?NE9MV1RQcG13aHBCSWxCNDRjZ0Z1VHQ1TmcvekFmZ21tQlhudURrRk5PdC9P?=
 =?utf-8?B?b21LcnFTbFc5VFFiaHpOOVFCM2ZRa0N1cGl4VXI1aW1JU25vN2NXaEhiblZl?=
 =?utf-8?B?N3I1STJCdEx2dE5hbmRlZllmK3FBeUlndytxV2hyL1dMN0YwWW9wak1YNVhG?=
 =?utf-8?B?WmZmQklLVUdoOTVvNlZTeHZoUnhzYmlZZnhnNWVVMmdDQUZRQ2dqaHNkRkJt?=
 =?utf-8?B?Wk80cW5yU3JQazF5UHhKckJGejUrRWwyblNVSVdPMVBONTdzNDN1SmNaOEZH?=
 =?utf-8?B?U0RuQ1F5ZmdYRFQxdDIyTFpNU3d4bjBWTWI5ZUZKUHZid0F1MGZMSVlkd1BF?=
 =?utf-8?B?OHdsNVB3MWtSQzBkTXVSc1JDT1NHTEpneFpOa044NFVCNml1Rkx0RVlFRTFN?=
 =?utf-8?B?ejhQSzdqQUYvS0dxaTF5SlVwaVU4SFZtbVNOZW1IRitZMkl0KzRpSDVWaVln?=
 =?utf-8?B?TEJBcGZlQXJCN0o2d29UN3EySFJOdHFaVzVpZit1ajkrQk5rZDVNTjA3MklV?=
 =?utf-8?B?eTVEOFI4RUJDMVdFRVI2UWxHNVo4d2dRYitDSCs0Y2p1V0FZZ0pHYlJpTFp5?=
 =?utf-8?B?ZjlpWDVGOTU2OUgzT0Exb05kQVRpLzFjMno1SmtxMUxURjNmRy9ycEx0d1oz?=
 =?utf-8?B?dkhvL3dSY1FpVUR6MVh6MjViU2szZnJEakdsdERRR2FEYmx1WHpOS2p2U0Rq?=
 =?utf-8?B?ZHNheXdpTFpmYlFNWnZxT21wVWFOQSt3ZGNLWEZRK0lEdWxLalB5aUIzY3c4?=
 =?utf-8?Q?HN2ydpCGENS6c2pHeqiSOrgNrDmTTLnOaM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <98E076F0913BDC4585C14A0741531311@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd5b50e-3268-4388-954b-08d8bb935dd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2021 09:28:08.1285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iTDrO51Z4qyxHM9v3BVBxEVyBcXVfxFW65kMyWtQh6cTttn25ZfTWkNKqkXjzRJf4YdPPm1qVwZq/UV/y1gluw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5742
X-OriginatorOrg: citrix.com

T24gTW9uLCAyMDIxLTAxLTE4IGF0IDA4OjUxICswMTAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0K
PiBPbiAxNS4wMS4yMSAyMzoyOCwgRWR3aW4gVMO2csO2ayB3cm90ZToNCj4gPiBDdXJyZW50bHkg
d2hlbiBveGVuc3RvcmVkIHJlY2VpdmVzIFNJR1RFUk0gaXQgZHVtcHMgaXRzIHN0YXRlIGFuZA0K
PiA+IHF1aXRzLg0KPiA+IEl0IGlzIHBvc3NpYmxlIHRvIHRoZW4gcmVzdGFydCBpdCBpZiAtLXJl
c3RhcnQgaXMgZ2l2ZW4sIGhvd2V2ZXINCj4gPiB0aGF0IGlzDQo+ID4gbm90IGFsd2F5cyBzYWZl
Og0KPiA+IA0KPiA+ICogZG9tYWlucyBjb3VsZCBoYXZlIGFjdGl2ZSB0cmFuc2FjdGlvbnMsIGFu
ZCBhZnRlciBhIHJlc3RhcnQgdGhleQ0KPiA+IHdvdWxkDQo+ID4gZWl0aGVyIHJldXNlIHRyYW5z
YWN0aW9uIElEcyBvZiBhbHJlYWR5IG9wZW4gdHJhbnNhY3Rpb25zLCBvciBnZXQNCj4gPiBhbg0K
PiA+IGVycm9yIGJhY2sgdGhhdCB0aGUgdHJhbnNhY3Rpb24gZG9lc24ndCBleGlzdA0KPiA+IA0K
PiA+ICogdGhlcmUgY291bGQgYmUgcGVuZGluZyBkYXRhIHRvIHNlbmQgdG8gYSBWTSBzdGlsbCBp
biBveGVuc3RvcmVkJ3MNCj4gPiDCoMKgIHF1ZXVlIHdoaWNoIHdvdWxkIGJlIGxvc3QNCj4gPiAN
Cj4gPiAqIHRoZXJlIGNvdWxkIGJlIHBlbmRpbmcgaW5wdXQgdG8gYmUgcHJvY2Vzc2VkIGZyb20g
YSBWTSBpbg0KPiA+IG94ZW5zdG9yZWQncw0KPiA+IMKgwqAgcXVldWUgd2hpY2ggd291bGQgYmUg
bG9zdA0KPiA+IA0KPiA+IFByZXZlbnQgc2h1dHRpbmcgZG93biBveGVuc3RvcmVkIHZpYSBTSUdU
RVJNIGluIHRoZSBhYm92ZQ0KPiA+IHNpdHVhdGlvbnMuDQo+ID4gQWxzbyBpZ25vcmUgZG9tYWlu
cyBtYXJrZWQgYXMgYmFkIGJlY2F1c2Ugb3hlbnN0b3JlZCB3b3VsZCBuZXZlcg0KPiA+IHRhbGsN
Cj4gPiB0byB0aGVtIGFnYWluLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEVkd2luIFTDtnLD
tmsgPGVkdmluLnRvcm9rQGNpdHJpeC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IFBhdSBSdWl6IFNh
Zm9udCA8cGF1LnNhZm9udEBjaXRyaXguY29tPg0KPiA+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4g
TGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+DQo+ID4gDQo+ID4gLS0tDQo+ID4g
Q2hhbmdlZCBzaW5jZSBWMToNCj4gPiAqIHBvc3QgcHVibGljbHkgbm93IHRoYXQgdGhlIFhTQSBp
cyBvdXQNCj4gPiAtLS0NCj4gPiDCoCB0b29scy9vY2FtbC94ZW5zdG9yZWQvY29ubmVjdGlvbi5t
bMKgIHwgMzUNCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gwqAgdG9vbHMv
b2NhbWwveGVuc3RvcmVkL2Nvbm5lY3Rpb25zLm1sIHzCoCA4ICsrKysrKysNCj4gPiDCoCB0b29s
cy9vY2FtbC94ZW5zdG9yZWQveGVuc3RvcmVkLm1swqDCoCB8IDEzICsrKysrKysrKy0tDQo+ID4g
wqAgdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuY8KgwqDCoMKgwqAgfMKgIDcgKysrKyst
DQo+IA0KPiBJIGRvbid0IHRoaW5rIHlvdSBzaG91bGQgbW9kaWZ5IHRvb2xzL3hlbnN0b3JlL3hl
bnN0b3JlZF9jb3JlLmMgaW4NCj4geW91cg0KPiBzZXJpZXMuDQo+IA0KDQpUaGFua3MgZm9yIHNw
b3R0aW5nLCBJIHRoaW5rIHRoYXQgaHVuayBlbmRlZCB1cCBpbiB0aGUgd3JvbmcgcGxhY2UNCmR1
cmluZyBhIHBhdGNocXVldWUgcmViYXNlIHdoZW4gc29sdmluZyBjb25mbGljdHMsIGl0IHNob3Vs
ZCBiZSBnb25lDQp3aGVuIEkgcG9zdCBhIFYzOg0KaHR0cHM6Ly9naXRodWIuY29tL2Vkd2ludG9y
b2sveGVuL3B1bGwvMS9jb21taXRzLzRlYzlmZmNlZTgzYTk2Njg0MzFiMjIwYmVmNGFiZGNkOWFj
NTExNzUNCg0KQmVzdCByZWdhcmRzLA0KLS1FZHdpbg0K

