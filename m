Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5E25E569
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 15:26:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hifDQ-0006Wv-E6; Wed, 03 Jul 2019 13:22:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hifDO-0006Wq-91
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 13:22:26 +0000
X-Inumbo-ID: 985f2ebd-9d95-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 985f2ebd-9d95-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 13:22:25 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 13:22:03 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 13:20:16 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 13:20:16 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3235.namprd18.prod.outlook.com (10.255.137.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.16; Wed, 3 Jul 2019 13:20:15 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 13:20:15 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] passthrough/pci: properly qualify the
 mem_sharing_enabled check...
Thread-Index: AQHVMA90BljvITdDGUqgQggQX/Boqqa44/GA
Date: Wed, 3 Jul 2019 13:20:15 +0000
Message-ID: <a57d3e6a-b28a-611b-9db7-c49004157da3@suse.com>
References: <20190701131750.37855-1-paul.durrant@citrix.com>
In-Reply-To: <20190701131750.37855-1-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0196.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::16) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7d8e5a6-ad36-4f5d-d2ec-08d6ffb92f45
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3235; 
x-ms-traffictypediagnostic: BY5PR18MB3235:
x-microsoft-antispam-prvs: <BY5PR18MB3235511ABBC7D4F2C954FE91B3FB0@BY5PR18MB3235.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(189003)(199004)(53546011)(26005)(186003)(6506007)(5660300002)(386003)(66066001)(102836004)(99286004)(486006)(7736002)(446003)(11346002)(14444005)(256004)(2616005)(476003)(81166006)(81156014)(52116002)(66476007)(8676002)(8936002)(4744005)(76176011)(71190400001)(66946007)(305945005)(66446008)(64756008)(66556008)(73956011)(71200400001)(25786009)(80792005)(2501003)(4326008)(68736007)(110136005)(86362001)(54906003)(6246003)(14454004)(31696002)(316002)(31686004)(478600001)(6512007)(229853002)(6486002)(6116002)(3846002)(36756003)(72206003)(2906002)(53936002)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3235;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cBG1qhsSKBGO6IR1VaQsg/owAvS1SumpO66MlEdGQgwosvjLigVM7V4KU2LgbAPcq1/jJtDoWwIEU9dhPov5jTdgHcx8SxBUN4abwY/gaiuwxJX7k5BA4WowX/3PgtIdjiODL9MXp3bOJWfVyBoRaeUrYkZOYQLj3lt07Ova5D3jjD+zBbHRQWev6n9iSiU0rz37Q28HQwMhofrfmAKXvoZB8ZB8JXLCDHLSB91Tpf1vTgnaBd1PGKzcPFCy32pqNskX3Cxf9nE7bMWkGf+Sd+dWpskTXSbqEsaWhDbcQ7qE8Poq1JR2aNeHQfacUcr+FhzNRrUZjlvuXG/8ckKXiYQVJuGyWDNSpACsXVAvfaj6YlqgKXZYjiIwMiskqS1VxutjN0fJ+k8q3E6SBiw9Fzzr3wOoLYFeTtAkl5UWDNk=
Content-ID: <FB909A39DE3BAF458A59E9E72FBDEEC3@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d8e5a6-ad36-4f5d-d2ec-08d6ffb92f45
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 13:20:15.0289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3235
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] passthrough/pci: properly qualify the
 mem_sharing_enabled check...
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, WeiLiu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDcuMjAxOSAxNToxNywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiAtLS0gYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9w
Y2kuYw0KPiBAQCAtMTQ1MCw3ICsxNDUwLDcgQEAgc3RhdGljIGludCBhc3NpZ25fZGV2aWNlKHN0
cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4sIHUzMiBmbGFnKQ0KPiAg
IA0KPiAgICAgICAvKiBQcmV2ZW50IGRldmljZSBhc3NpZ24gaWYgbWVtIHBhZ2luZyBvciBtZW0g
c2hhcmluZyBoYXZlIGJlZW4NCj4gICAgICAgICogZW5hYmxlZCBmb3IgdGhpcyBkb21haW4gKi8N
Cj4gLSAgICBpZiAoIHVubGlrZWx5KGQtPmFyY2guaHZtLm1lbV9zaGFyaW5nX2VuYWJsZWQgfHwN
Cj4gKyAgICBpZiAoIHVubGlrZWx5KG1lbV9zaGFyaW5nX2VuYWJsZWQoZCkgfHwNCj4gICAgICAg
ICAgICAgICAgICAgICB2bV9ldmVudF9jaGVja19yaW5nKGQtPnZtX2V2ZW50X3BhZ2luZykgfHwN
Cj4gICAgICAgICAgICAgICAgICAgICBwMm1fZ2V0X2hvc3RwMm0oZCktPmdsb2JhbF9sb2dkaXJ0
eSkgKQ0KPiAgICAgICAgICAgcmV0dXJuIC1FWERFVjsNCg0KVGhpcyBjaGFuZ2UgaXMgcmVkdW5k
YW50IHdpdGggdGhlIG1vcmUgZXh0ZW5zaXZlIG9uZSBieQ0KIng4Ni9IVk06IHAybV9yYW1fcm8g
aXMgaW5jb21wYXRpYmxlIHdpdGggZGV2aWNlIHBhc3MtdGhyb3VnaCIsDQpvZiB3aGljaCBJJ3Zl
IHNlbnQgdjIgZWFybGllciB0b2RheSwgYW5kIHYxIG9mIHdoaWNoIGhhcyBiZWVuDQpwZW5kaW5n
IGZvciBxdWl0ZSBzb21lIHRpbWUgd2l0aG91dCBoYXZpbmcgaGVhcmQgYmFjayBmcm9tDQpvdGhl
ciB0aGFuIHlvdS4NCg0KSmFuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
