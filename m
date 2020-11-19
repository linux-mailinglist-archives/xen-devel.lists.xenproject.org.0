Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA8F2B8E71
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 10:13:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30503.60556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfg0V-0000XJ-OM; Thu, 19 Nov 2020 09:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30503.60556; Thu, 19 Nov 2020 09:13:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfg0V-0000Wu-K6; Thu, 19 Nov 2020 09:13:35 +0000
Received: by outflank-mailman (input) for mailman id 30503;
 Thu, 19 Nov 2020 09:13:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q+xm=EZ=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kfg0T-0000Wp-3z
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 09:13:33 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62c683b1-1c5c-4edb-8480-9dd439fe7e97;
 Thu, 19 Nov 2020 09:13:31 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=q+xm=EZ=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
	id 1kfg0T-0000Wp-3z
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 09:13:33 +0000
X-Inumbo-ID: 62c683b1-1c5c-4edb-8480-9dd439fe7e97
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 62c683b1-1c5c-4edb-8480-9dd439fe7e97;
	Thu, 19 Nov 2020 09:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605777211;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/i4zvbrgL4fwiEgjGJIRbLTZsFADwvrNUFh8fMCcY48=;
  b=ZxHv8INIDyFNTADZbRcln4knyaoC5ohh+nZaC7geL/F1MxEYIJUWe1Xk
   C1vQN3p4RUwlnj9j9M/f4Mwg2GwTGzlGFcRZOXfG1v5F56etRe3cGIGIp
   P9mjYM7+11HK3b5/vweDF70LrguvpoT9wZ+5g7bwn2CBJz1HAjIgrJ9zc
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wPzPK+Nv+M0aSvaeHU0HblsXuTbCsy37+Yc3XCYrpiScb2jZNTGHObyW4tfRlVjb1cXgL4Uv1w
 wv3+d1F9gh3YCfiubkfxEzD6FdcngAGak366SpzANmMbRgmniAD4ySqxjHhzLQe/o3wBMHckmw
 8Ec6uZNmmG+xcDaQs/jGC6+1Vc5JMCLEy4eURgVikemaxKmrR0m5S8DChtkX+TbRX1cNCHi59d
 4DZ/oPXUrrJDtAvR0t8hvcDx5Ml4Tm2kmRf+/aOOWZvySvrdVnbCUloaygZU/OFtncvPySCQQs
 6To=
X-SBRS: None
X-MesageID: 31517615
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,490,1596513600"; 
   d="scan'208";a="31517615"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgvZyuP9zkXAcvqXGdyBioncVjP2rfPxVb96okMcFmB4bopVIyCI+BQ6Oh/vtmLiCBTXw4BY+Elrm0LXuhwZGV2ARJX2fYGK4DzaNAP8tZfyUu9bJurVoh/2YnCcQ99ImlYxDGu/W2z8RKPT5/b2owACjxOBIrJAWtLKKC1hI/Damzf06ibf4RWx0IIrv8fw+JlUorkTXe7FDV75to0zZtUWLIONR/1VqHCXo2rnikpAzbNCqvuj2sfsT8ZHfZ/mID3ZriILcByPdnRFSH0OHr0NbgSeDJ4P2WqOolSDaCimc0UOzVHdYZ3+LDbYYzWw6j0hSMB3zkdlEJToSwAYpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/i4zvbrgL4fwiEgjGJIRbLTZsFADwvrNUFh8fMCcY48=;
 b=lLBUF4DcjJROsUDGq3DmzwyHM8/GxnGaM39t4F3Wqcm5fECR/O3ItEo6MUpAh3zpuLsIB0Nm7mbFef5z0ard7e8Zjr7O2X/qFKMWcGkwR9eJAJovHB2a8jdei+YbeKnH2f4OWCHCqvBjrkWJVxOPwlFnvhsuHOeGwmsgSDIqGW8lwuP6/97pd9i33iBSbAcnfyNXeD5L3PN/8s1OJeTBdDrJEa6u4umpCP6adYYci44okibOtRa51Pp+OIVFK/Vq2Kukz3HADhTQknRyMWubAqCucJip9ABBN+DKzRkM+s6/FwUtoX0iM03DHSQu3ctDw/pLcUe/aORQtsAEx07Tuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/i4zvbrgL4fwiEgjGJIRbLTZsFADwvrNUFh8fMCcY48=;
 b=fPjPn5d/DgmiI2ABoYhD+tJUnJ79femB+T4Nv0ONrEwi+PEkQumcXXdV1IlO8Ug+/tm/pABgCj/1qiWJlMlnBOW5O9H+JqKaJcI71+7VA582QHH2mZLniUlJNar9+MKqsQ58dWkHccO5ZhEtbyc6aygVZF+FeBJlaVMGz7YKC18=
From: Edwin Torok <edvin.torok@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "wl@xen.org" <wl@xen.org>, "dave@recoil.org" <dave@recoil.org>, "Christian
 Lindig" <christian.lindig@citrix.com>, "iwj@xenproject.org"
	<iwj@xenproject.org>
Subject: Re: [PATCH v1 4/4] tools/ocaml/libs/xc: backward compatible domid
 control at domain creation time
Thread-Topic: [PATCH v1 4/4] tools/ocaml/libs/xc: backward compatible domid
 control at domain creation time
Thread-Index: AQHWvQ7o705wPkFsE0eBdwc77BuOGKnOMtuAgAD7fYA=
Date: Thu, 19 Nov 2020 09:13:24 +0000
Message-ID: <705ac29eab72ea045b4c6be94227f26e1755cd18.camel@citrix.com>
References: <cover.1605636799.git.edvin.torok@citrix.com>
	 <559929d2ae95f6527e5050051c917b7586182ad2.1605636800.git.edvin.torok@citrix.com>
	 <dc2e5f92-2528-1475-1513-cfb8d8c3339d@citrix.com>
In-Reply-To: <dc2e5f92-2528-1475-1513-cfb8d8c3339d@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 853975cb-4921-434d-e1d8-08d88c6b5e6c
x-ms-traffictypediagnostic: BYAPR03MB4631:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB4631A9850F7E987A5DBFD0B99BE00@BYAPR03MB4631.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rzH2MBbp//5YPmjMCzRiEeL/PkAwU7YeQsvuqLhX5J+iA6LGqV0QxRS1CBEk1DA6z8QQ/2c0Tmb0RIgfjXzXJTMl+OrPlVuT4/i9X0giPbEDcqSyiafZhp7DBrm2h03yoyVw/3Pc1y0Ubsb8GMHpL5xogzkMsPs9OCuh4fPBxMmG9lvM++VJLTglPu/i85Unl+c0R7wS0SPZp3jpZKhtCxCn96tLXmYNwc8ppUvtCHQcBd961VRCdwJkibI9RUKFPsQgp5GEPZh+mGWkAeS2dOSljb24OfUXVY85l+BiW+wQe65Brf0CpK333+tD+Rj1aCmMD2283OPYxzfnilNyan3lzEWP5SkidTB5Lr427wE/DZqjplEaCjzeLBb9MaZ0i1FjgOu0KbKwBYdELUqoSw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(4001150100001)(91956017)(76116006)(64756008)(8936002)(66446008)(66556008)(66946007)(66476007)(5660300002)(53546011)(6506007)(66574015)(6512007)(4326008)(83380400001)(71200400001)(8676002)(186003)(6486002)(26005)(2616005)(316002)(2906002)(86362001)(54906003)(36756003)(110136005)(478600001)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: e3oobexYOR+GC95MIZM50hSEpOYUO0YzIzSbeFvsNnKWG+rLx8EtPnIXZjDKL0AO2VsolTpd/l2uDVpU518oWDIg2IHhXKeNd2xi9gWKGgCyf0Yc/CJtwvkAgRWreAGUPAxSjWp4OqqJ0rIe2yWZ8+hLWTSayGHWU7kt7AW01CqknihRHofe0ko0K102TqlIJUgRst4Uvgcy9GsH6EtRrJA5hTM1H98HFUwOb9/3gG/QmFkZPygSCbJXANzBtP3u+4ihIe7ojhkHbzArZNP6vBV9gBeimFoVomTL3qG5Qy4J+tYVWPIPIEzwSO7U4Nfd3T7alMqEVAfEQdPpka/4gAS8YnBMUDgOy4dX3Zbm61TfQJsbkdiQYetk2/xMMbAjOePWwVuNO26RxF80r2X6/NDjk9t+W9ubNvkqLMqkBq/SgK8wGn270jZUcIHAcMLHu4sZUE0ptHfkstOd3JRcjdM412h+68kvl9A1kJ1xL8OaOJu+5EKOriwmfW64oXccAGODkNEu//K/1a3nAI3ma05GaWPFW0lIV5huAre3210omoXA94qJcd1uInS5r7lw1tlgeMBJR7DG+bwbCYMPicnGreur1PqnjGoe/wJiMpfmPxYrUihV5NAhTrL7f/3tb2hdvMMQzSYJjmTNZF3S0crZXADs7T9+iamum67z9eV+ZLu/YfFbE7zY1mT3o7aVPMWTQHdLRNAs4MzAJ74kzXp1jpgZwmlCS6we1wlesTHIEzwNNsaOWF/lcxAS/YaljpDLThuJ+QJxB0cQQtkuyBOhaRGzjL8bgZhODzNkAawdGXC4fOsQJhYXDaX+H2yjICxM+A8luklt9+DdyFLed0Hoz2fDBAFAj6PsK2e5KfoEGC9vdNCZeZ3yYYKY+okWcB16v7wsPna+4oNdDP0wNg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <9852BCA91215564B961CE3BE2B46E5AD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 853975cb-4921-434d-e1d8-08d88c6b5e6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2020 09:13:24.5572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7+O0iDi1GjFKtnT7RAQI5QfvWsimP6exDnvqUL8i2UsMpNG9Yhh+9aQYSNBS0Tfnc1pEC40osqviIAIxW+6Mtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4631
X-OriginatorOrg: citrix.com

T24gV2VkLCAyMDIwLTExLTE4IGF0IDE4OjEzICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBPbiAxNy8xMS8yMDIwIDE4OjI0LCBFZHdpbiBUw7Zyw7ZrIHdyb3RlOg0KPiA+IE9uZSBjYW4g
c3BlY2lmeSB0aGUgZG9taWQgdG8gdXNlIHdoZW4gY3JlYXRpbmcgdGhlIGRvbWFpbiwgYnV0IHRo
aXMNCj4gPiB3YXMgaGFyZGNvZGVkIHRvIDAuDQo+ID4gDQo+ID4gS2VlcCB0aGUgZXhpc3Rpbmcg
YGRvbWFpbl9jcmVhdGVgIGZ1bmN0aW9uIChhbmQgdGhlIHR5cGUgb2YgaXRzDQo+ID4gcGFyYW1l
dGVycykgYXMgaXMgdG8gbWFrZQ0KPiA+IGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5IGVhc2llci4N
Cj4gPiBJbnRyb2R1Y2UgYSBuZXcgYGRvbWFpbl9jcmVhdGVfZG9taWRgIE9DYW1sIEFQSSB0aGF0
IGFsbG93cw0KPiA+IHNwZWNpZnlpbmcgdGhlIGRvbWlkLg0KPiA+IEEgbmV3IHZlcnNpb24gb2Yg
eGVub3BzZCBjYW4gY2hvb3NlIHRvIHN0YXJ0IHVzaW5nIHRoaXMsIHdoaWxlIG9sZA0KPiA+IHZl
cnNpb25zIG9mIHhlbm9wc2Qgd2lsbCBrZWVwDQo+ID4gYnVpbGRpbmcgYW5kIHVzaW5nIHRoZSBv
bGQgQVBJLg0KPiA+IA0KPiA+IENvbnRyb2xsaW5nIHRoZSBkb21pZCBjYW4gYmUgdXNlZnVsIGR1
cmluZyB0ZXN0aW5nIG9yIG1pZ3JhdGlvbi4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBFZHdp
biBUw7Zyw7ZrIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPg0KPiA+IC0tLQ0KPiA+IMKgdG9vbHMv
b2NhbWwvbGlicy94Yy94ZW5jdHJsLm1swqDCoMKgwqDCoCB8IDMgKysrDQo+ID4gwqB0b29scy9v
Y2FtbC9saWJzL3hjL3hlbmN0cmwubWxpwqDCoMKgwqAgfCAyICsrDQo+ID4gwqB0b29scy9vY2Ft
bC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyB8IDkgKysrKysrKy0tDQo+ID4gwqAzIGZpbGVzIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAt
LWdpdCBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbA0KPiA+IGIvdG9vbHMvb2NhbWwv
bGlicy94Yy94ZW5jdHJsLm1sDQo+ID4gaW5kZXggZTg3ODY5OWIwYS4uOWQ3MjA4ODZlOSAxMDA2
NDQNCj4gPiAtLS0gYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwNCj4gPiArKysgYi90
b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwNCj4gPiBAQCAtMTgyLDYgKzE4Miw5IEBAIGxl
dCB3aXRoX2ludGYgZiA9DQo+ID4gwqBleHRlcm5hbCBkb21haW5fY3JlYXRlOiBoYW5kbGUgLT4g
ZG9tY3RsX2NyZWF0ZV9jb25maWcgLT4gZG9taWQNCj4gPiDCoMKgwqDCoMKgwqDCoCA9ICJzdHVi
X3hjX2RvbWFpbl9jcmVhdGUiDQo+ID4gwqANCj4gPiArZXh0ZXJuYWwgZG9tYWluX2NyZWF0ZV9k
b21pZDogaGFuZGxlIC0+IGRvbWN0bF9jcmVhdGVfY29uZmlnIC0+DQo+ID4gZG9taWQgLT4gZG9t
aWQNCj4gPiArwqDCoMKgwqDCoMKgID0gInN0dWJfeGNfZG9tYWluX2NyZWF0ZV9kb21pZCINCj4g
DQo+IFdvdWxkbid0IHRoaXMgYmUgYmV0dGVyIGFzIGhhbmRsZSAtPiBkb21pZCAtPiBkb21jdGxf
Y3JlYXRlX2NvbmZpZyAtPg0KPiBkb21pZCA/DQo+IA0KPiBJJ20gbm90IG92ZXJ3aGVsbWVkIHdp
dGggdGhlIG5hbWUsIGJ1dA0KPiAiZG9tYWluX2NyZWF0ZV97c3BlY2lmaWMsd2l0aH1fZG9taWQi
IGRvbid0IHNlZW0gbXVjaCBiZXR0ZXIgZWl0aGVyLg0KPiANCj4gPiArDQo+ID4gwqBleHRlcm5h
bCBkb21haW5fc2V0aGFuZGxlOiBoYW5kbGUgLT4gZG9taWQgLT4gc3RyaW5nIC0+IHVuaXQNCj4g
PiDCoMKgwqDCoMKgwqDCoCA9ICJzdHViX3hjX2RvbWFpbl9zZXRoYW5kbGUiDQo+ID4gwqANCj4g
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saQ0KPiA+IGIvdG9v
bHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saQ0KPiA+IGluZGV4IGU2NDkwN2RmOGUuLmU2Mjkw
MjI5MDEgMTAwNjQ0DQo+ID4gLS0tIGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saQ0K
PiA+ICsrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkNCj4gPiBAQCAtMTQ1LDYg
KzE0NSw4IEBAIHZhbCBjbG9zZV9oYW5kbGU6IHVuaXQgLT4gdW5pdA0KPiA+IMKgDQo+ID4gwqBl
eHRlcm5hbCBkb21haW5fY3JlYXRlIDogaGFuZGxlIC0+IGRvbWN0bF9jcmVhdGVfY29uZmlnIC0+
IGRvbWlkDQo+ID4gwqDCoCA9ICJzdHViX3hjX2RvbWFpbl9jcmVhdGUiDQo+ID4gK2V4dGVybmFs
IGRvbWFpbl9jcmVhdGVfZG9taWQgOiBoYW5kbGUgLT4gZG9tY3RsX2NyZWF0ZV9jb25maWcgLT4N
Cj4gPiBkb21pZCAtPiBkb21pZA0KPiA+ICvCoCA9ICJzdHViX3hjX2RvbWFpbl9jcmVhdGVfZG9t
aWQiDQo+ID4gwqBleHRlcm5hbCBkb21haW5fc2V0aGFuZGxlIDogaGFuZGxlIC0+IGRvbWlkIC0+
IHN0cmluZyAtPiB1bml0ID0NCj4gPiAic3R1Yl94Y19kb21haW5fc2V0aGFuZGxlIg0KPiA+IMKg
ZXh0ZXJuYWwgZG9tYWluX21heF92Y3B1cyA6IGhhbmRsZSAtPiBkb21pZCAtPiBpbnQgLT4gdW5p
dA0KPiA+IMKgwqAgPSAic3R1Yl94Y19kb21haW5fbWF4X3ZjcHVzIg0KPiA+IGRpZmYgLS1naXQg
YS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYw0KPiA+IGIvdG9vbHMvb2NhbWwv
bGlicy94Yy94ZW5jdHJsX3N0dWJzLmMNCj4gPiBpbmRleCA5NGFiYTM4YTQyLi5iYjcxOGZkMTY0
IDEwMDY0NA0KPiA+IC0tLSBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jDQo+
ID4gKysrIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMNCj4gPiBAQCAtMTc1
LDcgKzE3NSw3IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQNCj4gPiBvY2FtbF9saXN0X3RvX2NfYml0
bWFwKHZhbHVlIGwpDQo+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiB2YWw7DQo+ID4gwqB9DQo+
ID4gwqANCj4gPiAtQ0FNTHByaW0gdmFsdWUgc3R1Yl94Y19kb21haW5fY3JlYXRlKHZhbHVlIHhj
aCwgdmFsdWUgY29uZmlnKQ0KPiA+ICtDQU1McHJpbSB2YWx1ZSBzdHViX3hjX2RvbWFpbl9jcmVh
dGVfZG9taWQodmFsdWUgeGNoLCB2YWx1ZQ0KPiA+IGNvbmZpZywgdmFsdWUgd2FudF9kb21pZCkN
Cj4gPiDCoHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgQ0FNTHBhcmFtMih4Y2gsIGNvbmZpZyk7DQo+
ID4gwqDCoMKgwqDCoMKgwqDCoENBTUxsb2NhbDIobCwgYXJjaF9kb21jb25maWcpOw0KPiA+IEBA
IC0xOTEsNyArMTkxLDcgQEAgQ0FNTHByaW0gdmFsdWUgc3R1Yl94Y19kb21haW5fY3JlYXRlKHZh
bHVlIHhjaCwNCj4gPiB2YWx1ZSBjb25maWcpDQo+ID4gwqAjZGVmaW5lIFZBTF9NQVhfTUFQVFJB
Q0tfRlJBTUVTIEZpZWxkKGNvbmZpZywgNykNCj4gPiDCoCNkZWZpbmUgVkFMX0FSQ0jCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRmllbGQoY29uZmlnLCA4KQ0KPiA+IMKgDQo+ID4gLcKg
wqDCoMKgwqDCoMKgdWludDMyX3QgZG9taWQgPSAwOw0KPiA+ICvCoMKgwqDCoMKgwqDCoHVpbnQz
Ml90IGRvbWlkID0gSW50X3ZhbCh3YW50X2RvbWlkKTsNCj4gDQo+IHdhbnRlZF9kb21pZCB3b3Vs
ZCBiZSBhIHNsaWdodGx5IGJldHRlciBuYW1lLCBiZWNhdXNlIGl0IGlzbid0DQo+IGFtYmlndW91
cw0KPiB3aXRoIGEgYm9vbGVhbiBmbGFnLg0KPiANCj4gPiDCoMKgwqDCoMKgwqDCoMKgaW50IHJl
c3VsdDsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWlu
IGNmZyA9IHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5zc2lkcmVmID0g
SW50MzJfdmFsKFZBTF9TU0lEUkVGKSwNCj4gPiBAQCAtMjYyLDYgKzI2MiwxMSBAQCBDQU1McHJp
bSB2YWx1ZSBzdHViX3hjX2RvbWFpbl9jcmVhdGUodmFsdWUNCj4gPiB4Y2gsIHZhbHVlIGNvbmZp
ZykNCj4gPiDCoMKgwqDCoMKgwqDCoMKgQ0FNTHJldHVybihWYWxfaW50KGRvbWlkKSk7DQo+ID4g
wqB9DQo+ID4gwqANCj4gPiArQ0FNTHByaW0gdmFsdWUgc3R1Yl94Y19kb21haW5fY3JlYXRlKHZh
bHVlIHhjaCwgdmFsdWUgY29uZmlnLA0KPiA+IHZhbHVlIHdhbnRfZG9taWQpDQo+ID4gK3sNCj4g
PiArwqDCoMKgIHJldHVybiBzdHViX3hjX2RvbWFpbl9jcmVhdGVfZG9taWQoeGNoLCBjb25maWcs
IFZhbF9pbnQoMCkpOw0KPiA+ICt9DQo+IA0KPiBVc2luZw0KPiBodHRwczovL3hlbmJpdHMueGVu
Lm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWNvbW1pdGRpZmY7aD0zNmQ5NGMxN2ZhMWU0OGNjOWZi
OWVkMTViYzlhMjIzN2ExNzM4YmJiDQo+IGFzIHJldmVyc2UgaW5zcGlyYXRpb24sIGNvdWxkbid0
IHdlIGRvIHRoZSBpbnNlcnRpb24gb2YgMCBhdCB0aGUNCj4gT2NhbWwNCj4gbGV2ZWwgYW5kIGF2
b2lkIGRvdWJsaW5nIHVwIHRoZSBDIHN0dWI/DQoNCkkgd2FudGVkIHRvIHJldGFpbiB0aGUgb2xk
IEFQSSBmb3IgYmFja3dhcmRzIGNvbXBhdGliaWxpdHksIGJ1dCB5b3UgYXJlDQpyaWdodCB0aGF0
IHRoaXMgY291bGQgYmUgZG9uZSBqdXN0IG9uIHRoZSBPQ2FtbCBsZXZlbCwgSSdsbCB1cGRhdGUg
dGhlDQpwYXRjaC4NCg0KSWYgeW91IHVwZ3JhZGUgWGVuIHdpdGhvdXQgdXBncmFkaW5nIHhlbm9w
c2QgeW91J2xsIGdldCBhIGZhaXJseQ0Kb2J2aW91cyBmYWlsdXJlIHRvIHN0YXJ0IHhlbm9wc2Qg
ZHVlIHRvIHRoZSBtaXNzaW5nIHN5bWJvbCwgYnV0IHRoYXQNCmNvdWxkIGJlIHNvbHZlZCB3aXRo
IGFuIGFwcHJvcHJpYXRlIGRlcGVuZGVuY3kgYXQgdGhlIGRpc3RybyBwYWNrYWdlDQpsZXZlbC4g
QXMgbG9uZyBhcyBtYXRjaGluZyBYZW4gYW5kIHhlbm9wc2QgZ2V0cyBpbnN0YWxsZWQgKGV2ZW4g
aWYgbm90DQpib290ZWQgaW50bykgeGVub3BzZCBzaG91bGQgc3VjY2VlZCBpbiByZXN0YXJ0aW5n
IHRoZW4uDQoNCkJlc3QgcmVnYXJkcywNCi0tRWR3aW4NCg0KPiANCj4gfkFuZHJldw0KPiANCj4g
PiArDQo+ID4gwqBDQU1McHJpbSB2YWx1ZSBzdHViX3hjX2RvbWFpbl9tYXhfdmNwdXModmFsdWUg
eGNoLCB2YWx1ZSBkb21pZCwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2YWx1ZSBtYXhf
dmNwdXMpDQo+ID4gwqB7DQo+IA0KDQo=

