Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1CE732A8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 17:23:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqJ54-0004Tw-4M; Wed, 24 Jul 2019 15:21:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9cpT=VV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqJ52-0004Tq-5G
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 15:21:24 +0000
X-Inumbo-ID: afbae96e-ae26-11e9-89b4-cb577141e839
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id afbae96e-ae26-11e9-89b4-cb577141e839;
 Wed, 24 Jul 2019 15:21:20 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 24 Jul 2019 15:21:07 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 24 Jul 2019 15:20:14 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 24 Jul 2019 15:20:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbV/0hrsqcdJraAgb+0Zm2uHYYX3udV0D6ar3AH15umRyYkXOH8pDCBSh1xDMk6KD3sfAp+B1Z8khugouEa9X2B8Hjk7qid01hdOuq8rZf6bVHEilXGteiWSqA+sIittPLPtERm1VLPZ2B7R1gFSYaVChYu/Ox+jcQFTVFKtQQ7cw3CNpB9T0JRpVzjUERcU4ohOFyDE0nH0xsCiZQgyAeB0M9rYRvfVLMVPJUTMKPug8KM3TSvk56P0WD45tzZjTR62Fiin8TL1b+l+CrKXP7eFDVAkBw4/2HgAYJImlos192uM2yww4WEW42WxxkW2mwkUm8A2+423vm8ZEzVJ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1HPnmsvXdz5Av1JGh38239nJxWE0ILbT3YCvby4h6c=;
 b=E4LaBNptbjfjG6Y/5k3NOVtG1ZIXOhzvMNCvNbaLG13RWjGXXbtaAlt4rWUEcv9lzV1DYA4waq8GxOuazm+AREy3fONGnDx1ei1xvYRa8uPk4GaEqPdauHnXSDgcNEZehLGM4eARjxPXhTK3nl/87UkZZCUzw6zph59tJZjmAJywtvcrv9jileiZGFIGuimDH8U1piMVw5mfjWdko9ZtcLcyJlYcPFf/csnRAgLZaTh4ZZnNveWSc638FSdYYf7uwhng2UThSy9EuloVSwFvDa0BFkC+iCd29FZyhXtRVIVmEKo/6C1uHk84ebfPLeSgIHGRd3BP30wVWZBd6zD17g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3411.namprd18.prod.outlook.com (10.255.139.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Wed, 24 Jul 2019 15:20:13 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 15:20:13 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v3 4/4] iommu / pci: re-implement
 XEN_DOMCTL_get_device_group...
Thread-Index: AQHVO7+30zOrUBDJqkW0fIy31yR4g6bM+heAgAAtwjCADMc0gA==
Date: Wed, 24 Jul 2019 15:20:13 +0000
Message-ID: <5fabe43e-fffa-7a47-4e66-0e5db230555a@suse.com>
References: <20190716101657.23327-1-paul.durrant@citrix.com>
 <20190716101657.23327-5-paul.durrant@citrix.com>
 <20190716112815.xulpw3gcoilqv43k@Air-de-Roger.citrite.net>
 <f268871abbaf41b3811bf3296578c592@AMSPEX02CL03.citrite.net>
In-Reply-To: <f268871abbaf41b3811bf3296578c592@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::15) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6af8b16-c16a-4ab3-ffd9-08d7104a6c5f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3411; 
x-ms-traffictypediagnostic: BY5PR18MB3411:
x-microsoft-antispam-prvs: <BY5PR18MB34116BD10BF3B9E845451AB7B3C60@BY5PR18MB3411.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(189003)(199004)(6916009)(8676002)(31696002)(478600001)(6116002)(86362001)(6436002)(6486002)(486006)(31686004)(4326008)(99286004)(76176011)(54906003)(316002)(68736007)(3846002)(14454004)(25786009)(80792005)(66066001)(6512007)(2906002)(14444005)(256004)(26005)(102836004)(6246003)(229853002)(386003)(305945005)(476003)(52116002)(66446008)(186003)(5660300002)(64756008)(66476007)(8936002)(36756003)(446003)(81156014)(7736002)(71200400001)(11346002)(66946007)(81166006)(53546011)(71190400001)(53936002)(2616005)(6506007)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3411;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QLFhFJGO20QRrvvhGBpSNI6fYbAM3ZwAbxpMZJvblYVTtEqURlxzg6kVZZpMse3Cayo1Mp5l6/P4KEI9YqCChonX48NAZDcFZdvhFrwhPPXvBYJv0Qqw/pfbQFQOBIJzcSCQwGouZGqzRbB2pN9CWBVJ/218yOCs6G7aIO3ZE0uN7JQlX4wvMzLziKV4DD6Otpvu/cDMwpwOmmpnujjhCu09har2c8UwaVo/Bpoo++D54EU733Y1gwEDKkOiqxGWQcYWBEEqnLRaSwmBrg5SCZd0XpRwdAPMHR9ALIJGFB3mI3NHtIm0Y+cBkxs1Wnl0NL43ruk5ZpP/Rm+y796RMWZ8KacatvaQFGbaiE6QxWlxtN60N23fMI7BZDepdIrJJfjURInm64BAULdmkXum2UdsBHK0zpQuUUNoS/DlU7A=
Content-ID: <0502D897D1A1784B906A3C232654A296@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c6af8b16-c16a-4ab3-ffd9-08d7104a6c5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 15:20:13.0238 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3411
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 4/4] iommu / pci: re-implement
 XEN_DOMCTL_get_device_group...
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxNDoyMCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4gRnJvbTogUm9nZXIg
UGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4+IFNlbnQ6IDE2IEp1bHkgMjAxOSAx
MjoyOA0KPj4NCj4+IE9uIFR1ZSwgSnVsIDE2LCAyMDE5IGF0IDExOjE2OjU3QU0gKzAxMDAsIFBh
dWwgRHVycmFudCB3cm90ZToNCj4+PiBAQCAtODEsNiArODUsNDggQEAgaW50IGlvbW11X2dyb3Vw
X2Fzc2lnbihzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdm9pZCAqYXJnKQ0KPj4+ICAgICAgIHJldHVy
biAwOw0KPj4+ICAgfQ0KPj4+DQo+Pj4gK2ludCBpb21tdV9nZXRfZGV2aWNlX2dyb3VwKHN0cnVj
dCBkb21haW4gKmQsIHBjaV9zYmRmX3Qgc2JkZiwNCj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgWEVOX0dVRVNUX0hBTkRMRV82NCh1aW50MzIpIGJ1ZiwNCj4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG1heF9zZGV2cykNCj4+PiArew0KPj4+ICsgICAg
c3RydWN0IGlvbW11X2dyb3VwICpncnAgPSBOVUxMOw0KPj4+ICsgICAgc3RydWN0IHBjaV9kZXYg
KnBkZXY7DQo+Pj4gKyAgICB1bnNpZ25lZCBpbnQgaSA9IDA7DQo+Pj4gKw0KPj4+ICsgICAgcGNp
ZGV2c19sb2NrKCk7DQo+Pj4gKw0KPj4+ICsgICAgZm9yX2VhY2hfcGRldiAoIGQsIHBkZXYgKQ0K
Pj4+ICsgICAgew0KPj4+ICsgICAgICAgIGlmICggcGRldi0+c2JkZi5zYmRmID09IHNiZGYuc2Jk
ZiApDQo+Pj4gKyAgICAgICAgew0KPj4+ICsgICAgICAgICAgICBncnAgPSBwZGV2LT5ncnA7DQo+
Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+ICsgICAgICAgIH0NCj4+PiArICAgIH0NCj4+PiAr
DQo+Pj4gKyAgICBpZiAoICFncnAgKQ0KPj4+ICsgICAgICAgIGdvdG8gb3V0Ow0KPj4+ICsNCj4+
PiArICAgIGZvcl9lYWNoX3BkZXYgKCBkLCBwZGV2ICkNCj4+PiArICAgIHsNCj4+PiArICAgICAg
ICBpZiAoIHhzbV9nZXRfZGV2aWNlX2dyb3VwKFhTTV9IT09LLCBwZGV2LT5zYmRmLnNiZGYpIHx8
DQo+Pj4gKyAgICAgICAgICAgICBwZGV2LT5ncnAgIT0gZ3JwICkNCj4+PiArICAgICAgICAgICAg
Y29udGludWU7DQo+Pj4gKw0KPj4+ICsgICAgICAgIGlmICggaSA8IG1heF9zZGV2cyAmJg0KPj4N
Cj4+IEFGQUlDVCB5b3UgYXJlIGFkZGluZyB0aGUgY2hlY2sgaGVyZSBpbiBvcmRlciB0byBrZWVw
IGN1cnJlbnQNCj4+IGJlaGF2aW91cj8NCj4gDQo+IFllcy4NCj4gDQo+PiBCdXQgaXNuJ3QgaXQg
d3JvbmcgdG8gbm90IHJlcG9ydCB0byB0aGUgY2FsbGVyIHRoYXQgdGhlIGJ1ZmZlciB3YXMNCj4+
IHNtYWxsZXIgdGhhbiByZXF1aXJlZCwgYW5kIHRoYXQgdGhlIHJldHVybmVkIHJlc3VsdCBpcyBw
YXJ0aWFsPw0KPiANCj4gR2l2ZW4gdGhhdCB0aGVyZSBpcyB6ZXJvIGRvY3VtZW50YXRpb24gSSB0
aGluayB5b3VyIGd1ZXNzIGlzIGFzIGdvb2QNCj4gYXMgbWluZSBhcyB0byB3aGF0IGludGVudGlv
biBvZiB0aGUgaW1wbGVtZW50b3Igd2FzLg0KPiANCj4+DQo+PiBJIGRvbid0IHNlZSBhbnkgd2F5
IGEgY2FsbGVyIGNhbiBkaWZmZXJlbnRpYXRlIGJldHdlZW4gYSByZXN1bHQgdGhhdA0KPj4gdXNl
cyB0aGUgZnVsbCBidWZmZXIgYW5kIG9uZSB0aGF0J3MgYWN0dWFsbHkgcGFydGlhbCBkdWUgdG8g
c21hbGxlcg0KPj4gdGhhbiByZXF1aXJlZCBidWZmZXIgcHJvdmlkZWQuIEkgdGhpbmsgdGhpcyBm
dW5jdGlvbiBzaG91bGQgcmV0dXJuDQo+PiAtRU5PU1BDIGZvciBzdWNoIGNhc2UuDQo+IA0KPiBJ
J2QgcHJlZmVyIHRvIHN0aWNrIHRvIHRoZSBwcmluY2lwbGUgb2Ygbm8gY2hhbmdlIGluIGJlaGF2
aW91ci4gVEJIIEkNCj4gaGF2ZSBub3QgZm91bmQgYW55IGNhbGxlciBvZiB4Y19nZXRfZGV2aWNl
X2dyb3VwKCkgYXBhcnQgZnJvbSBhIHB5dGhvbg0KPiBiaW5kaW5nIGFuZCB3aG8ga25vd3Mgd2hh
dCBwaWVjZSBvZiBhbnRpcXVhdGVkIGNvZGUgbWlnaHQgc2l0IG9uIHRoZQ0KPiBvdGhlciBzaWRl
IG9mIHRoYXQuIEZXSVcgdGhhdCBjb2RlIHNldHMgbWF4X3NkZXZzIHRvIDEwMjQgc28gaXQncw0K
PiB1bmxpa2VseSB0byBydW4gb3V0IG9mIHNwYWNlIHNvIGFuIEVOT1NQQyBtaWdodCBiZSBvay4g
U3RpbGwsIEknZCBsaWtlDQo+IHRvIGhlYXIgbWFpbnRhaW5lciBvcGluaW9ucyBvbiB0aGlzLg0K
DQpIb3cgYWJvdXQgd2UgdHJ5IHRvIGZpbmQgYSBzdWZmaWNpZW50bHkgYmFja3dhcmRzIGNvbXBh
dGlibGUgc29sdXRpb24NCndoaWNoIHN0aWxsIGFsbG93cyByZWNvZ25pemluZyBpbnN1ZmZpY2ll
bnQgYnVmZmVyIHNwYWNlPyBGaXJzdCBvZiBhbGwNCnRoZSBjb21tb24gbnVsbC1oYW5kbGUgYXBw
cm9hY2ggY291bGQgYmUgdXNlZCB0byBnZXQgYSB0b3RhbCBjb3VudC4NClRoZXJlJ3Mgbm90IG11
Y2ggcmlzayBvZiB0aGlzIHZhbHVlIGdldHRpbmcgc3RhbGUgYmV0d2VlbiB0d28NCnN1Y2Nlc3Np
dmUgZG9tY3RsLXMuIEFuZCB0aGVuIHJldHVybmluZyAtRU5PQlVGUyB1cG9uIGV4Y2VlZGluZyB0
aGUNCnByb3ZpZGVkIGJ1ZmZlciBzaG91bGRuJ3QgcmVhbGx5IGJyZWFrIHByZS1leGlzdGluZyBj
b2RlOiBJdCBzdXJlbHkNCndvdWxkIG1pc2JlaGF2ZSBhbnl3YXkgaWYgdGhlIGdyb3VwIHdhcyBs
YXJnZXIgdGhhbiB3aGF0IHRoZXkgdGhpbmsNCml0IGlzLg0KDQpBbm90aGVyIG9wdGlvbiB3b3Vs
ZCBiZSB0byBpc29sYXRlIGFsbCBvZiB0aGlzIGNvbXBhdGliaWxpdHkgc3R1ZmYNCmludG8gdGhl
IGxpYnhjIHdyYXBwZXIsIG1ha2luZyB0aGUgaHlwZXJjYWxsIGl0c2VsZiByZXR1cm4gdGhlIGFj
dHVhbA0KY291bnQgaXJyZXNwZWN0aXZlIG9mIHRoZSBwYXNzZWQgaW4gYnVmZmVyIHNpemUgKGku
ZS4gYSBnZW5lcmFsaXphdGlvbg0Kb2YgdGhlIG51bGwtaGFuZGxlIG1vZGVsKS4NCg0KSmFuDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
