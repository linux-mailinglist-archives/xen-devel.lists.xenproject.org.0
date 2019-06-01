Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C34231BB0
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2019 14:08:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hX2jk-0005ZY-Gy; Sat, 01 Jun 2019 12:03:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7e6h=UA=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1hX2jj-0005ZT-Ee
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2019 12:03:47 +0000
X-Inumbo-ID: 4dec7fec-8465-11e9-8980-bc764e045a96
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.94]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4dec7fec-8465-11e9-8980-bc764e045a96;
 Sat, 01 Jun 2019 12:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector1-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvFdH+mtqs7frCVJwE5kmdI2Fc/rH5YvjlRQrvbF48s=;
 b=Ehu+eAE9NhR3BoKnkdEqIvJFItxVzRFqDWS4noTh0UUEoCnX4R6o49g/Q67M3b5JeChObnL+UxBpTDUJHSvmGOR4hqLjxC4tTypE1rq9j6C0/VKfh7EXfIRXlb6r62srmAj2djv1ODo2JyjwYNfP0d4nTQofP5vLfr0qpbn5sog=
Received: from VI1PR06MB4510.eurprd06.prod.outlook.com (20.177.52.159) by
 VI1PR06MB4511.eurprd06.prod.outlook.com (20.177.52.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.18; Sat, 1 Jun 2019 12:03:42 +0000
Received: from VI1PR06MB4510.eurprd06.prod.outlook.com
 ([fe80::a141:95ac:c636:a8ec]) by VI1PR06MB4510.eurprd06.prod.outlook.com
 ([fe80::a141:95ac:c636:a8ec%5]) with mapi id 15.20.1943.018; Sat, 1 Jun 2019
 12:03:42 +0000
From: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] booting domU guest as pvh works in xen-4.11.1 but
 fails in 4.12
Thread-Index: AQHU9FeD113I0DfAJUePnpXO0i/0gqY/bGGAgEZ2KoCAADGxAIAA5y2A
Date: Sat, 1 Jun 2019 12:03:42 +0000
Message-ID: <alpine.LFD.2.21.1906011300450.2877@austen3.home>
References: <CAHnBbQ8u+MywkV4+qmxhkA8216knGhGZjcy1Sz6Ukv3=PJZmXQ@mail.gmail.com>
 <293280a7-5011-e5a1-da53-80587b7b9a94@citrix.com>
 <alpine.DEB.2.11.1904162258280.33856@procyon.dur.ac.uk>
 <alpine.LFD.2.21.1905312010270.2763@austen3.home>
 <f0fe2652-5b00-3cc7-10c7-8af08969e3a4@citrix.com>
In-Reply-To: <f0fe2652-5b00-3cc7-10c7-8af08969e3a4@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Alpine 2.21 (LFD 202 2017-01-01)
x-originating-ip: [2a00:23c4:9208:400:c49a:db08:8036:b390]
x-clientproxiedby: LO2P265CA0139.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::31) To VI1PR06MB4510.eurprd06.prod.outlook.com
 (2603:10a6:803:62::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=m.a.young@durham.ac.uk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-x-sender: michael@austen3.home
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df003d70-5bd0-4e6a-d619-08d6e6893083
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR06MB4511; 
x-ms-traffictypediagnostic: VI1PR06MB4511:
x-microsoft-antispam-prvs: <VI1PR06MB4511B73F01092B26C89714CB871A0@VI1PR06MB4511.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 00550ABE1F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(136003)(376002)(396003)(366004)(189003)(199004)(25786009)(99286004)(4326008)(102836004)(52116002)(76176011)(386003)(14454004)(66946007)(36756003)(71190400001)(229853002)(9686003)(71200400001)(6486002)(5660300002)(6916009)(6436002)(86362001)(64756008)(73956011)(4744005)(66476007)(66556008)(6512007)(66446008)(8936002)(81166006)(11346002)(446003)(8676002)(7736002)(186003)(486006)(68736007)(14444005)(256004)(316002)(81156014)(476003)(786003)(53346004)(6246003)(53936002)(74482002)(54906003)(2906002)(6506007)(46003)(6116002)(478600001)(305945005)(58126008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR06MB4511;
 H:VI1PR06MB4510.eurprd06.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: durham.ac.uk does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1i4OLlq+PAjioNDERPIpWLs778XvpbI+dxwtJbVjhniLKkwisV3R1qT+1xkqrWKM0lK+nDkS5xlrGGMQmoYKQQ44hv+48zNWmttFefDYi2TekfciQIwTWFHG3Sao8D/a1YrPF7qVkZi7oNyC2NhOxOqmkC7+oHqyA/zd/z4XR27LVrOMubhxyFfz2F2Ha2u1nCJqL0NtHiAX3NXoqYCBaQtqTEyyjHPd4jJzShtBRLOszXGOlZdxGvZ6FgyHApTgwJ0attaLzaum+skRZZOtvpIL2Uz2T5NtAGu/hSrMz35fviAXdoSnyAaBkT5A4a0A4I9wANg28WNnAWA2/vGO49YUN/cSLVDwzU7LRvCDFSgob9OJxAhBq1sepYf/VsUfyg2i3QvrfpLIHiyTFN7ogX1QHBfAn13vrvVNtK1bKqQ=
Content-ID: <7625A308A8433243B7FB47E85E51BD2E@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: df003d70-5bd0-4e6a-d619-08d6e6893083
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2019 12:03:42.2126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dcl0may@durham.ac.uk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB4511
Subject: Re: [Xen-devel] booting domU guest as pvh works in xen-4.11.1 but
 fails in 4.12
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Pry Mar <pryorm09@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAzMSBNYXkgMjAxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKCj4+IEkgZGlkIGEgYmlz
ZWN0IG9uIHRoaXMgaXNzdWUsIGFuZCBpdCBpZGVudGlmaWVkIHRoZSBmaXJzdCBiYWQgY29tbWl0
IGFzCj4+IGZkMzJkY2ZlNGM5YTUzOWY4ZTVkMjZmZjRjNWNhNTBlZTU0NTU2YjIKPj4geDg2L3Zt
eDogRG9uJ3QgbGVhayBFRkVSLk5YRSBpbnRvIGd1ZXN0IGNvbnRleHQKPgo+IEFhaCAtIHRoaXMg
d2lsbCBiZSBhIGhhcnBlcnRvd24gY29yZS4KPgo+IFlvdSBuZWVkIGUyOGMwZWUzMzU2ZjUyZjU4
OWJiYWU1NGU4OWFhZWQyNWMxZjU5OWQgZnJvbSBzdGFnaW5nLCB3aGljaAo+IGhhcyBiZWVuIGJh
Y2twb3J0ZWQgdG8gc3RhZ2luZy00LjEyCj4gKDg0NTdjMTViOTgxYmEwNGMwNzA5ZTZmMjVhZjNi
NzZiZWIzNGNhZmEpIHR3byB3ZWVrcyBhZ28uCj4KPiBUaGlzIGJ1dCBhY2NpZGVudGFsbHkgcmVz
dWx0ZWQgaW4gdGhlIFNZU0NBTEwgaW5zdHJ1Y3Rpb24gYmVpbmcgZGlzYWJsZWQKPiBiZWhpbmQg
dGhlIGJhY2sgb2YgdGhlIGd1ZXN0LCB3aGljaCBicm9rZSBhbGwgdXNlcnNwYWNlIHN5c3RlbSBj
YWxscy4KClRoYW5rcywgdGhhdCBwYXRjaCBmaXhlcyB0aGUgRG9tVSBib290IHByb2JsZW0gSSB3
YXMgc2VlaW5nLgoKIAlNaWNoYWVsIFlvdW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
