Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B747FB51
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 15:44:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htXoQ-0002KH-OY; Fri, 02 Aug 2019 13:41:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1htXoP-0002KC-PD
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 13:41:37 +0000
X-Inumbo-ID: 39d1a81c-b52b-11e9-8003-4b73c29c11e8
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39d1a81c-b52b-11e9-8003-4b73c29c11e8;
 Fri, 02 Aug 2019 13:41:33 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  2 Aug 2019 13:41:27 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 2 Aug 2019 13:39:43 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 2 Aug 2019 13:39:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTKRaMIcjU7aeToaWaz8hBYsJlny3Rbo/DRvk88BN4GtvHhHjYGD91bwQp5zeFiUaW0GyxhdowbwMPljyrwUafp4ugX6ZUtghKtpCB66l1U9ISkz8Nhw6MG1Zs5xNVBK1+R3qGxSi5pxk68MwZ5HXcUWxluxL3V7ee1sJT9uAXPGzZLn9354+suvpyl+CuZIRb9b/4+iVVL/KzzgXUp73QodB0cZFVByff1bHi4sVZy6gSvubGx++eqjLVIa1PtYd637Uo+B625cdSRi4hQhrATxiFGZArmRIk1hitPM0EynG2Zq6Qz1PyfTZwobiPfYgN3RMoPsmR8HpjxrXSrMHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awlSxgRq/NXqLi9pOxcixGtHtuKQG/c4nqEpeshAJz0=;
 b=ES4ctkHGZ6ZNoerflRnY0ky2LGXdtpo87+7FxHwYf+h7ggN57ilqEqyFWEO0UQk6JBR2sEss6v6E5RrcY9rAHsOI41CskIb+vnQ4v4Aye0GJ3LyCorvKZpPqbwBT+PQalTyvsc5YB3HiiNUdZaPOz4ZDovHZ11RAQcpyW1jmE6LxtFihpR6vjRLt2alhlj60poExu3Vm/dSPRvzik+0vs4Xb48XEMrAWMJ3h8h02914FsVrN/nbu3vJeiX+zqkToWguEGCFkBxxDv0ISTug8bnr8F4aCGrQtHL/sPE0jbSX/DYJ563vTUa2MrSTB8COppZ33qXZ3VE9x9N1RznKnPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2665.namprd18.prod.outlook.com (20.179.106.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Fri, 2 Aug 2019 13:39:42 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 13:39:42 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Chao Gao <chao.gao@intel.com>
Thread-Topic: [PATCH v8 04/16] microcode/amd: fix memory leak
Thread-Index: AQHVSFKOdk5vupejrkq3Gs8xPRZZh6bn3tGA
Date: Fri, 2 Aug 2019 13:39:42 +0000
Message-ID: <053a106b-2e46-062a-c48f-fcd9dc576ab0@suse.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-5-git-send-email-chao.gao@intel.com>
In-Reply-To: <1564654971-31328-5-git-send-email-chao.gao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:69::25) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffafc767-3ef2-4e6f-9e56-08d7174edf65
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2665; 
x-ms-traffictypediagnostic: DM6PR18MB2665:
x-microsoft-antispam-prvs: <DM6PR18MB2665C4D8C564BDB5CA9DC582B3D90@DM6PR18MB2665.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(199004)(189003)(31686004)(316002)(54906003)(71200400001)(71190400001)(14444005)(256004)(476003)(2616005)(11346002)(446003)(486006)(99286004)(80792005)(76176011)(52116002)(6116002)(3846002)(6246003)(53936002)(6436002)(6512007)(66946007)(66476007)(2906002)(26005)(66446008)(386003)(68736007)(25786009)(229853002)(4326008)(53546011)(6506007)(102836004)(478600001)(186003)(86362001)(6916009)(6486002)(66556008)(64756008)(66066001)(5660300002)(14454004)(8676002)(36756003)(81156014)(305945005)(81166006)(8936002)(31696002)(7736002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2665;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qmuirE4NRGrBCxmnlZ6ZL4XZwwxTxbniP/s5v+SqHRNNXY9cQiFjUZtM2d6bfzgZSXB3NY3h/Lk7FmdigYZEPjsFcMnoGltrhsLO2J5Ufxz0HeGWxJa7Gs1aUA0ks9NTO0XjeG45F/aOA+2oJ6cGX2ud/sfSWeCl9vOvqPAsqL49nlGr5tf7tB/rxVoWpxQGe6yAhHJcimSHmAxfVuZ8ZrTGjtLi9QnNkIPI63tLS0qEg5NCTYz7JMyT6Rqxs6X1Y5YBhhQn1w1488zkTcTHyYVGwnxDCjXQAhj58IoZGiE17ADD9FnkDM++n2dLmshgYt1R02kV36eN9FYFoF3zrSuW9dL8D3BvMPuweTdgd7CNKtX5ddXVutPOIqg1zYDJEDCyQbGuKQ1RoQXjqFUS0OVVydR4LmcLWZsuvUtyyv4=
Content-ID: <B8614BFED9FD5241A07B0FCF7DDD1AA1@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ffafc767-3ef2-4e6f-9e56-08d7174edf65
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 13:39:42.0510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2665
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v8 04/16] microcode/amd: fix memory leak
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
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDguMjAxOSAxMjoyMiwgQ2hhbyBHYW8gd3JvdGU6DQo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9taWNyb2NvZGVfYW1kLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L21pY3JvY29kZV9hbWQuYw0K
PiBAQCAtNDMzLDYgKzQzMyw5IEBAIHN0YXRpYyBpbnQgY3B1X3JlcXVlc3RfbWljcm9jb2RlKHVu
c2lnbmVkIGludCBjcHUsIGNvbnN0IHZvaWQgKmJ1ZiwNCj4gICAgICAgICAgIGdvdG8gb3V0Ow0K
PiAgICAgICB9DQo+ICAgDQo+ICsgICAgbWNfYW1kLT5lcXVpdl9jcHVfdGFibGVfc2l6ZSA9IDA7
DQo+ICsgICAgbWNfYW1kLT5lcXVpdl9jcHVfdGFibGUgPSBOVUxMOw0KDQpJbnN0ZWFkIG9mIGFk
ZGluZyB0aGVzZSwgeW91IGNvdWxkIGFzIHdlbGwgdXNlIHh6YWxsb2MoKQ0KZnVydGhlciB1cCBh
bmQgZHJvcCB0aGUgZXhwbGljaXQgaW5pdGlhbGl6YXRpb24gb2YgLT5tcGIgYW5kDQotPm1wYl9z
aXplIHRvIE5VTEwvMCBhIGZldyBsaW5lcyBkb3duLg0KDQo+IEBAIC00NzksNiArNDgyLDggQEAg
c3RhdGljIGludCBjcHVfcmVxdWVzdF9taWNyb2NvZGUodW5zaWduZWQgaW50IGNwdSwgY29uc3Qg
dm9pZCAqYnVmLA0KPiAgIA0KPiAgICAgICBpZiAoIGVycm9yICkNCj4gICAgICAgew0KPiArICAg
ICAgICBpZiAoIG1jX2FtZC0+ZXF1aXZfY3B1X3RhYmxlX3NpemUgKQ0KPiArICAgICAgICAgICAg
eGZyZWUobWNfYW1kLT5lcXVpdl9jcHVfdGFibGUpOw0KDQpXaHkgdGhlIGlmKCk/IFRoZXJlJ3Mg
bm8gcHJvYmxlbSBjYWxsaW5nIHhmcmVlKCkgd2l0aCBhIE5VTEwNCmFyZ3VtZW50Lg0KDQo+IEBA
IC01NDksMTEgKzU1NCwxNCBAQCBzdGF0aWMgaW50IGNwdV9yZXF1ZXN0X21pY3JvY29kZSh1bnNp
Z25lZCBpbnQgY3B1LCBjb25zdCB2b2lkICpidWYsDQo+ICAgDQo+ICAgICAgIGlmICggc2F2ZV9l
cnJvciApDQo+ICAgICAgIHsNCj4gLSAgICAgICAgeGZyZWUobWNfYW1kKTsNCj4gICAgICAgICAg
IHVjaS0+bWMubWNfYW1kID0gbWNfb2xkOw0KPiArICAgICAgICBtY19vbGQgPSBtY19hbWQ7DQo+
ICAgICAgIH0NCj4gLSAgICBlbHNlDQo+IC0gICAgICAgIHhmcmVlKG1jX29sZCk7DQo+ICsNCj4g
KyAgICBpZiAoIG1jX29sZC0+bXBiX3NpemUgKQ0KPiArICAgICAgICB4ZnJlZShtY19vbGQtPm1w
Yik7DQo+ICsgICAgeGZyZWUobWNfb2xkLT5lcXVpdl9jcHVfdGFibGUpOw0KDQpTYW1lIGhlcmUu
IFdpdGggdGhlIGFkanVzdG1lbnRzIG1hZGUgKGNvdWxkIHBvc3NpYmx5IGJlIGRvbmUNCmFnYWlu
IHdoaWxlIGNvbW1pdHRpbmcpDQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
