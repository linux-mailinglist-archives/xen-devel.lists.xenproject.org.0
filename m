Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 160946E644
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:24:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoSqI-0001a1-3Z; Fri, 19 Jul 2019 13:22:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoSqG-0001Zj-Fn
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:22:32 +0000
X-Inumbo-ID: 3c7fffcf-aa28-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3c7fffcf-aa28-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 13:22:31 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 13:22:21 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 13:21:50 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 13:21:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/v8fdknmGrApeq0q9hrBcCmOAiF9VLPraXHlUua3VCKe0mpH/PG+Ub0oHW53bwo2KT8SNSZleUpBeoSufCOABOsT1ZuQ6eEtJX2UwWFcVUh1tFr5tGcG+rINPE3fs0N/HmQCEeo2Tx+/qQVEUFuUrCn6ksl0FnkrRiHxcNoJEXhtDZ5+lal8j9yjDjuDjpntns8DGcU5PhMvjIFTX90od/F0ypJoheU+dv8S51cGxzoQut2fdUobOvp/EVIn00Asnb32e5f0/UG6EXZ8iCxojTIhasVQ9Ej5Xy53IIF5yBgBiuVaQrC8TrMqQqK+PsVqf3MAObKIfW1UZFekbYtZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjY8yoX4cT0UZtEcLVMCQt4QTUx/wTRBZV0nM6KY0Eg=;
 b=mEYfWk/mGBgAlXcOZxYjXCWulg1ua5JMlSG58IEmj63JNgoTog4RijQTNmxu5AQoLUpq+G8Po5SUEx5x9LQkjKnAAN9sjwAvUz0xreOoCkXfnppT0AubhL9sqMDfwJTd9xKMPseI+/ArNy3qtglWIY4NGon1F9dL9oe5VSpfPH6h/2ge6Og/FDEiIzAc00R/Wt/cPOKZR8KsNto7jf1zHe7sM+iQL8tThV3sZ8yq0o+0jHjkO4zBInIcLxtimk5FKgtApTkS6PxLyMtuOlboCmyRu0IooYFV7jSyiaolyh6rFZHO4Hu8AqSvtD1nWn/kwiesCcNOxuQ0aTpHgXe2Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2906.namprd18.prod.outlook.com (20.179.49.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 13:21:50 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 13:21:50 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Thread-Topic: [Xen-devel] [PATCH 1/2 RESEND] CODING_STYLE: explicitly call out
 label indentation
Thread-Index: AQHVPhLyGXH0Q4NjDEWXJddchwyDaKbR7RTbgAAAmQA=
Date: Fri, 19 Jul 2019 13:21:49 +0000
Message-ID: <b9b18428-6114-117d-a6b2-049b5d6dceec@suse.com>
References: <f1a5d1b0-564e-8f04-f43e-f5c68466751b@suse.com>
 <7072cc5e-8137-762b-53a1-c4a80d19ff08@suse.com>
 <CABfawhnyhLwjWqGvqtT6vohTYjzcW4+BGpjrEMw1M=yYrzXTPA@mail.gmail.com>
In-Reply-To: <CABfawhnyhLwjWqGvqtT6vohTYjzcW4+BGpjrEMw1M=yYrzXTPA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0198.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::18) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35483115-6cbd-4aa8-4b65-08d70c4c0e84
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2906; 
x-ms-traffictypediagnostic: DM6PR18MB2906:
x-microsoft-antispam-prvs: <DM6PR18MB2906DF5A35F12DF378D4F415B3CB0@DM6PR18MB2906.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(199004)(189003)(5660300002)(71200400001)(6916009)(6436002)(316002)(256004)(66066001)(6246003)(31696002)(86362001)(8936002)(6486002)(446003)(36756003)(31686004)(486006)(478600001)(25786009)(14444005)(68736007)(11346002)(53936002)(229853002)(386003)(476003)(2616005)(53546011)(6506007)(102836004)(54906003)(66556008)(186003)(26005)(14454004)(305945005)(64756008)(2906002)(52116002)(4744005)(66476007)(4326008)(6116002)(3846002)(66446008)(71190400001)(80792005)(76176011)(81166006)(7416002)(8676002)(99286004)(81156014)(6512007)(66946007)(7736002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2906;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7oYPeZQlJLqjZPxlC7qnw45sMq5GoUu/W7vWHnZNPCRywpMdbooBaxbyfC1+Hmnn5LYM+m3+1D5d+iIb8SgZjQYMFrHAhvEgKpOVYI8pvujzUaKqymPm68Rb1aGBXmVqREUD2lx4M6rInZa7VIHNMWmG1ZeGuXwngEkuF9vskqoLisG1ujoS0+q5lRYazgLIMuIKAazy6ppc06s99Ay3+XzIPfXQQcVl3MlspIrE/4wUvpAKUhchsBhunc/O3j8sgf98Bp1y7pAy9/+6oKyCBnb+wKuOhv/Akdl2EL4sOBk4Qn0Trv5tCstTiI76obphGX2Jbpnd63YQMP12Nj6DlBuzovcm07sNNSKhhhVE7f8u75bhnmHkp1yUWfS+uSAFJM/KGoxY2BtAenkYGJiCJdrRRE/PkO5eOWIvDTwkt9k=
Content-ID: <874786D1F227714FBD0A0856811EFE8D@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 35483115-6cbd-4aa8-4b65-08d70c4c0e84
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 13:21:49.8492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2906
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/2 RESEND] CODING_STYLE: explicitly call
 out label indentation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, JulienGrall <julien.grall@arm.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMjAxOSAxNToxOCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPiBPbiBGcmksIEp1
bCAxOSwgMjAxOSBhdCAzOjE5IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3Jv
dGU6DQo+Pg0KPj4gU2luY2UgdGhlIGJlaGF2aW9yIG9mICJkaWZmIC1wIiB0byB1c2UgYW4gdW5p
bmRlbnRlZCBsYWJlbCBhcyBjb250ZXh0DQo+PiBpZGVudGlmaWVyIG9mdGVuIG1ha2VzIGl0IGhh
cmRlciB0byByZXZpZXcgcGF0Y2hlcywgbWFrZSBleHBsaWNpdCB0aGUNCj4+IHJlcXVpcmVtZW50
IGZvciBsYWJlbHMgdG8gYmUgaW5kZW50ZWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiANCj4gVGhpcyBzdHlsZSByZXF1aXJlbWVudCB3
b3VsZG4ndCByZWFsbHkgd29yayB3aXRoIGFzdHlsZSBhcy1pcy4NCg0KUGVyc29uYWxseSBJIHZp
ZXcgcHJvcGVyICJkaWZmIC1wIiBjb250ZXh0IGluIHBhdGNoZXMgYXMgcXVpdGUNCmEgYml0IG1v
cmUgaW1wb3J0YW50IHRoYW4gYXV0b21hdGljIHN0eWxlIGNoZWNraW5nLiBCdXQgcGVyaGFwcw0K
dGhhdCdzIGp1c3QgYmVjYXVzZSBJIGRvIHF1aXRlIGEgbG90IG9mIHBhdGNoIHJldmlldyAuLi4N
Cg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
