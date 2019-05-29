Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED0E2DC42
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 13:55:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVx7v-0003vW-Ty; Wed, 29 May 2019 11:52:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QpgD=T5=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hVx7u-0003vR-Mi
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 11:52:14 +0000
X-Inumbo-ID: 31f4d50c-8208-11e9-809f-e7daa7134f6c
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31f4d50c-8208-11e9-809f-e7daa7134f6c;
 Wed, 29 May 2019 11:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNVmLbcuPieE5+8IKWVL/YfiM9ah7VXtHn0zCyHVM4g=;
 b=F9Yy3e7rugH3nToFuP5MrfBllaCBCSM4trHaA3Qqj8VS9lccL9rgpn2g8lxzQOnerPg4UZnWoC1qGvKLn9i1LdoHNQz4zHMp2rJ6FyNlc+b4wNhgf17ZG4K/5kU0ok99plFj8XOt0ep2i+OvGFY3EC5Z7OfmNhQlUKVO83QAM6Co74afhsbrsDaiCVfJw6NA3KAgJJsC5cYxi0eng1LwDT0J8Ldyof8CVUf/nk31e91KV5FlWbTK8NQD0Dq26rS1cMRLMwUl/o7Prb4mr7hpfov/yOxgs/caYXe8FvAeGRefUayJT7fLbv+xt75R/7o30F1/z5NNrjpk8DVnLif9Lg==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB4884.eurprd03.prod.outlook.com (20.178.21.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.23; Wed, 29 May 2019 11:52:10 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a%3]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 11:52:10 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH] get_maintainer: Improve patch recognition
Thread-Index: AQHVFhKmR9oYQeQHRUKX8vkFAoSAyKaB/CGAgAABnYA=
Date: Wed, 29 May 2019 11:52:10 +0000
Message-ID: <874l5d8oly.fsf@epam.com>
References: <20190529113534.23213-1-volodymyr_babchuk@epam.com>
 <5CEE710F0200007800233646@prv1-mh.provo.novell.com>
In-Reply-To: <5CEE710F0200007800233646@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 723999a8-feb7-44e8-ceec-08d6e42c1524
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB4884; 
x-ms-traffictypediagnostic: AM0PR03MB4884:
x-microsoft-antispam-prvs: <AM0PR03MB4884AA4B4A9A549488EEFD78E61F0@AM0PR03MB4884.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:826;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(366004)(39860400002)(136003)(189003)(199004)(256004)(72206003)(81166006)(53936002)(81156014)(6436002)(6246003)(4744005)(229853002)(71200400001)(71190400001)(478600001)(54906003)(3846002)(6486002)(99286004)(6512007)(66066001)(4326008)(305945005)(26005)(91956017)(66946007)(66556008)(8936002)(64756008)(2906002)(14454004)(73956011)(316002)(66446008)(7736002)(6116002)(102836004)(66476007)(6916009)(6506007)(186003)(486006)(36756003)(11346002)(80792005)(68736007)(476003)(86362001)(446003)(5660300002)(76176011)(7416002)(55236004)(25786009)(2616005)(53546011)(8676002)(76116006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4884;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uaknNDwxSW2k58QAyeYLJ15HSFTOA40bMfo98T65kzg5ZnIqbXvzsN2J9Um8U/Cs3368hrxLXl3iZn108xnxv76mEIMhOX0B4qBJLV0GBwjnffFoE5vly+JmqD4Aff0pC0cI1milXYRZNdlSzgtcsKJgLtI6/KmxqwyhkGItcXLLCmpT35wDnLtGjbf0vhRxTbRba8GhZEKroNpJAk4Fs2n1rBVpZrdiCt1Vj8v3IzB3yuZZAYIDRxMhM9JX52tfPCTcYV/Ys0T5VhntKT90pO00Pw3n3yxBrJrxNwHpiMagmzKoQuXe2jbkztO20JfdeV5FAGKrY7C+IfELM4XGolgb673N2u00MvrrcirJcnoBXCdmwTh/67WdFZzpW3+43yKMTrc7dLFg1UaN0EUO6PDNDCBH7xlCNU/4tR9NKx4=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 723999a8-feb7-44e8-ceec-08d6e42c1524
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 11:52:10.2479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4884
Subject: Re: [Xen-devel] [PATCH] get_maintainer: Improve patch recognition
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, "xypron.glpk@gmx.de" <xypron.glpk@gmx.de>,
 "joe@perches.com" <joe@perches.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEphbiwKCkphbiBCZXVsaWNoIHdyaXRlczoKCj4+Pj4gT24gMjkuMDUuMTkgYXQgMTM6MzUs
IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4gd3JvdGU6Cj4+IEZyb206IEpvZSBQZXJjaGVz
IDxqb2VAcGVyY2hlcy5jb20+Cj4+IAo+PiBGcm9tOiBKb2UgUGVyY2hlcyA8am9lQHBlcmNoZXMu
Y29tPgo+PiAKPj4gVGhlcmUgYXJlIG1vZGUgY2hhbmdlIGFuZCByZW5hbWUgb25seSBwYXRjaGVz
IHRoYXQgYXJlIHVucmVjb2duaXplZAo+PiBieSB0aGUgZ2V0X21haW50YWluZXIucGwgc2NyaXB0
Lgo+PiAKPj4gUmVjb2duaXplIHRoZW0uCj4+CgogWyBVcHN0cmVhbSBjb21taXQgMDQ1NWM3NDc4
OGZkNWFhZDQzOTlmMDBlM2ZiYmI3ZTg3NDUwY2E1OCBdCgo+PiBSZXBvcnRlZC1ieTogSGVpbnJp
Y2ggU2NodWNoYXJkdCA8eHlwcm9uLmdscGtAZ214LmRlPgo+PiBDQzogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSm9lIFBlcmNoZXMgPGpvZUBw
ZXJjaGVzLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15
cl9iYWJjaHVrQGVwYW0uY29tPgo+Cj4gTWVudGlvbmluZyB0aGUgb3JpZ2luYWwgTGludXggY29t
bWl0IElEIHdvdWxkIGhhdmUgYmVlbiBuaWNlLgpPaCwgdGhhbmsgeW91LiBUaGlzIGlzIHRoZSBm
aXJzdCB0aW1lIEknbSBwb3J0aW5nIHRoZSBwYXRjaCBmcm9tCnRoZSBvdGhlciB0cmVlLgoKLS0g
CkJlc3QgcmVnYXJkcyxWb2xvZHlteXIgQmFiY2h1awpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
