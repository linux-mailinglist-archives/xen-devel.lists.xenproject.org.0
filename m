Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DB46B6F6
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 08:50:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hndjN-0006cj-Sz; Wed, 17 Jul 2019 06:48:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hndjM-0006cb-HS
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 06:48:00 +0000
X-Inumbo-ID: cdc8621a-a85e-11e9-bdd8-8b94ad2e519a
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cdc8621a-a85e-11e9-bdd8-8b94ad2e519a;
 Wed, 17 Jul 2019 06:47:55 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 06:47:54 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 06:47:35 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 06:47:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUi2SpBMEGa2iVZuM8RBvsduYdpby8UwPYidC4LnE4qXMfede3Zd5Qs26UbvbGBoqtf4xCvoRgJTUb5VZ/T8ix49Ooubtqtqfn9ebuHXwepReFn7gz9iG4hLpLSUNguGChgTzD9obl9fnXQeHlu/nlentoxzAov68VLithI7k+3DaiWlVvdbmr+O7TZYjlnZulQyZNvFjXsS4RUL7QZJANV4cgU64+fiwLuz3K7cmgrax7tvDkAgNxDnSLsZEJxKb3T+7DcyWMrfNZeNCmL7uR6MQO/O+qX7DDNqFL2EIG8ob2fZZ0C38iwYdXUkjdOgp89dgtXaf8JIum0qzjHErw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5b+uPodbBUie/MoyVnYCKTOJd6+psFNzMyUEz2oMvng=;
 b=Ur9uVv40MxCPcNj1U836nSxAVkksict3bMLM+KRjqsKxrsSWICTEBToz8WGK8BzTE7ApX/sPv2e9c/jSFlJ7QdzXr1c4VQJDWJBXVftkfC9MTdpJMrXKfzRiJCZpnIz9O6KswZAZGR/7zPiSA2Tg7dBW0X2n3+haOaW2GRREQvUy1ejXkWgTCCg+jfFnltBHZNlbiU4F52wInqnnAhwoVWQM7TnXBIpnBxvgWEdv0OMCWOaIFOcxb0AFFeHSAJJ/JfvrhWFM/VQwCIYs5VRgYrwLnqQu6CE5Z9iOynRhSw6jR7g8pLk6HtUN/pOmGJs45K6SKURP4i9jTM8uc+aYDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2650.namprd18.prod.outlook.com (20.179.106.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.11; Wed, 17 Jul 2019 06:47:33 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 06:47:33 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] dom0-build: fix build with clang5
Thread-Index: AQHVPGuDyWWK6Geo3ESEScpkr4UVEw==
Date: Wed, 17 Jul 2019 06:47:33 +0000
Message-ID: <5c88239b-de0f-5f81-72c4-7fdb07524278@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::35) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6ecb642-b54d-40aa-71c2-08d70a82a584
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2650; 
x-ms-traffictypediagnostic: DM6PR18MB2650:
x-microsoft-antispam-prvs: <DM6PR18MB26502E28FBE0F031484253B9B3C90@DM6PR18MB2650.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(189003)(199004)(6436002)(53936002)(8936002)(6506007)(386003)(478600001)(6486002)(2616005)(81166006)(81156014)(2351001)(25786009)(8676002)(5660300002)(26005)(102836004)(66946007)(476003)(64756008)(66556008)(66476007)(66446008)(99286004)(86362001)(186003)(316002)(54906003)(71190400001)(31696002)(71200400001)(31686004)(66066001)(305945005)(6116002)(3846002)(14454004)(2501003)(4326008)(256004)(7736002)(36756003)(14444005)(6916009)(68736007)(486006)(2906002)(6512007)(5640700003)(52116002)(80792005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2650;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KxyoNJxWbkXr7eym3w/CdiiQZ4gXedpsEBdYv0RVErVTCFuk3gLxPRQhJOu64RapblbWP9AagFcSy9ZxQx/KqAlf2LpvjYh0UNmJzR9dEIlFJm2QDvfnOx4QclBpBL8NYuLX2A/cNxm0E+VaMx3+H2yzRsTHowoEakrFDNf9xe14dCtyPod5qNxTGMe9cqMI3drlNs+zmN0ahRqlc/UBIury5yXVRApt4xM/wWlD8MJ0Yqz1r8mFGXPojSWfFddK34EyBsyE8jomXK8KusO9CrDDRNuuadijjPI6PlhDUw79zEMkd9RM3CBBcaWwuTg64F7Tem+tDERG2mgh/U4PfECfE4l3G9Hg33vnVrtFbA9st66Cqxio7cSoa8YUzLNj9Yxx3H+BVjUU5KYblabnQWYoUuxFN9QN0BvJvVyHkv4=
Content-ID: <6EBA2EE7D4344E408136FE7A6EF3CF54@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ecb642-b54d-40aa-71c2-08d70a82a584
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 06:47:33.8139 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2650
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v2] dom0-build: fix build with clang5
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aCBub24tZW1wdHkgQ09ORklHX0RPTTBfTUVNIGNsYW5nNSBwcm9kdWNlcw0KDQpkb20wX2J1
aWxkLmM6MzQ0OjI0OiBlcnJvcjogdXNlIG9mIGxvZ2ljYWwgJyYmJyB3aXRoIGNvbnN0YW50IG9w
ZXJhbmQgWy1XZXJyb3IsLVdjb25zdGFudC1sb2dpY2FsLW9wZXJhbmRdDQogICAgIGlmICggIWRv
bTBfbWVtX3NldCAmJiBDT05GSUdfRE9NMF9NRU1bMF0gKQ0KICAgICAgICAgICAgICAgICAgICAg
ICAgXiAgfn5+fn5+fn5+fn5+fn5+fn5+DQpkb20wX2J1aWxkLmM6MzQ0OjI0OiBub3RlOiB1c2Ug
JyYnIGZvciBhIGJpdHdpc2Ugb3BlcmF0aW9uDQogICAgIGlmICggIWRvbTBfbWVtX3NldCAmJiBD
T05GSUdfRE9NMF9NRU1bMF0gKQ0KICAgICAgICAgICAgICAgICAgICAgICAgXn4NCiAgICAgICAg
ICAgICAgICAgICAgICAgICYNCmRvbTBfYnVpbGQuYzozNDQ6MjQ6IG5vdGU6IHJlbW92ZSBjb25z
dGFudCB0byBzaWxlbmNlIHRoaXMgd2FybmluZw0KICAgICBpZiAoICFkb20wX21lbV9zZXQgJiYg
Q09ORklHX0RPTTBfTUVNWzBdICkNCiAgICAgICAgICAgICAgICAgICAgICAgfl5+fn5+fn5+fn5+
fn5+fn5+fn5+fg0KMSBlcnJvciBnZW5lcmF0ZWQuDQoNCk9idmlvdXNseSBuZWl0aGVyIG9mIHRo
ZSB0d28gc3VnZ2VzdGlvbnMgYXJlIGFuIG9wdGlvbiBoZXJlLiBPZGRseQ0KZW5vdWdoIHN3YXBw
aW5nIHRoZSBvcGVyYW5kcyBvZiB0aGUgJiYgaGVscHMsIHdoaWxlIGUuZy4gY2FzdGluZyBvcg0K
cGFyZW50aGVzaXppbmcgZG9lc24ndC4gQW5vdGhlciB3b3JrYWJsZSB2YXJpYW50IGxvb2tzIHRv
IGJlIHRoZSB1c2Ugb2YNCiEhIG9uIHRoZSBjb25zdGFudC4NCg0KU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KLS0tDQp2MjogQWxzbyBhZGp1c3QgdGhlIEFy
bSBpbmNhcm5hdGlvbiBvZiB0aGUgc2FtZSBjb25zdHJ1Y3QuDQotLS0NCkknbSBvcGVuIHRvIGdv
aW5nIHRoZSAhISBvciB5ZXQgc29tZSBkaWZmZXJlbnQgcm91dGUgKGJ1dCBub3QgcmVhbGx5IHRo
ZQ0Kc3VnZ2VzdGVkIHN0cmxlbigpIG9uZSkuIE5vIG1hdHRlciB3aGljaCBvbmUgd2UgY2hvb3Nl
LCBJJ20gYWZyYWlkIGl0IGlzDQpnb2luZyB0byByZW1haW4gZ3Vlc3N3b3JrIHdoYXQgbmV3ZXIg
KGFuZCBmdXR1cmUpIHZlcnNpb25zIG9mIGNsYW5nIHdpbGwNCmNob2tlIG9uLg0KDQotLS0gYS94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCisrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVp
bGQuYw0KQEAgLTIxMjUsNyArMjEyNSw3IEBAIGludCBfX2luaXQgY29uc3RydWN0X2RvbTAoc3Ry
dWN0IGRvbWFpbg0KICANCiAgICAgIHByaW50aygiKioqIExPQURJTkcgRE9NQUlOIDAgKioqXG4i
KTsNCiAgDQotICAgIGlmICggIWRvbTBfbWVtX3NldCAmJiBDT05GSUdfRE9NMF9NRU1bMF0gKQ0K
KyAgICBpZiAoIENPTkZJR19ET00wX01FTVswXSAmJiAhZG9tMF9tZW1fc2V0ICkNCiAgICAgICAg
ICBwYXJzZV9kb20wX21lbShDT05GSUdfRE9NMF9NRU0pOw0KICANCiAgICAgIGlmICggZG9tMF9t
ZW0gPD0gMCApDQotLS0gYS94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jDQorKysgYi94ZW4vYXJj
aC94ODYvZG9tMF9idWlsZC5jDQpAQCAtMzQxLDcgKzM0MSw3IEBAIHVuc2lnbmVkIGxvbmcgX19p
bml0IGRvbTBfY29tcHV0ZV9ucl9wYWcNCiAgICAgIHVuc2lnbmVkIGxvbmcgYXZhaWwgPSAwLCBu
cl9wYWdlcywgbWluX3BhZ2VzLCBtYXhfcGFnZXM7DQogICAgICBib29sIG5lZWRfcGFnaW5nOw0K
ICANCi0gICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYmIENPTkZJR19ET00wX01FTVswXSApDQorICAg
IGlmICggQ09ORklHX0RPTTBfTUVNWzBdICYmICFkb20wX21lbV9zZXQgKQ0KICAgICAgICAgIHBh
cnNlX2RvbTBfbWVtKENPTkZJR19ET00wX01FTSk7DQogIA0KICAgICAgZm9yX2VhY2hfbm9kZV9t
YXNrICggbm9kZSwgZG9tMF9ub2RlcyApDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
