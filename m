Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F07732C1
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 17:31:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqJCR-0004vN-0r; Wed, 24 Jul 2019 15:29:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9cpT=VV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqJCP-0004vG-A1
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 15:29:01 +0000
X-Inumbo-ID: c0826539-ae27-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c0826539-ae27-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 15:28:58 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 24 Jul 2019 15:28:44 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 24 Jul 2019 15:27:43 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 24 Jul 2019 15:27:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRNbAEOUB7FjPly+KnJZcOk1U6BojA5VhcFXLQSY7FOFTXEVdjXOYlku43U2dVeCEPhXGKpKe99ELVclc9PY9bB8Nwg2T/jMGXaVmtUKE/rrXoL0sVXq5EN64vXFdmDxBNAVse3q3RQQ7XLZObOLmslCTgv3BsvuI4eMB6BNxdEVDo0KN0S1WyFeDerc7GEieSoEDRBjXSjundehn0s/PKAz0XIhXUvI6N/v8yoRxdwCz0IJor7Y/IXTNTTJJPiWT6YgP46CrITDL6q+f38X6dD+Bkt1a0+JSSCS8ti8dkOtkwsTwLyPPUwsBPPBLhL5w9noSRqurYdKQV8bnA4ctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnCTVGLK0+PrVkQfCHxm8r/Tn4UxxO+CjEZ2pCJZEis=;
 b=EQZS6hIyXHka1PkVKwUqwL4GGK3HfVl6DvX31UNxGfBvbupmf+IVRLuc9NcXBpcYgd02ad/VfVnUncfPhCatrpTGuCzgAJ2YGQwrhzSDh1r7wM+WXk/q/8IUWg0CHwU8hJ7+bKrzxB8OPBD/xZyjU9lP53XcS/Me539vcSlqO2eMrEkkCtl0YabXXkGrPmL6cg349SWBO1xJKJcNIyv61/o3DU3+wK0y5bUePKEmZe494H2rBo2ockSNHQ4tEb+lfT7xG+NZrOyIc7L835HC1ZtQsKiLeIUJE3JoACmm+S5n9tghaFLMDIx+EjpH2NcpbLUitzki3lL2p7UbSPgnlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3089.namprd18.prod.outlook.com (10.255.137.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 15:27:42 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 15:27:42 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [PATCH v3 4/4] iommu / pci: re-implement
 XEN_DOMCTL_get_device_group...
Thread-Index: AQHVO7+30zOrUBDJqkW0fIy31yR4g6bZ8SWA
Date: Wed, 24 Jul 2019 15:27:42 +0000
Message-ID: <0bc10440-b270-261f-2047-c66911bf5b62@suse.com>
References: <20190716101657.23327-1-paul.durrant@citrix.com>
 <20190716101657.23327-5-paul.durrant@citrix.com>
In-Reply-To: <20190716101657.23327-5-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0601CA0012.eurprd06.prod.outlook.com
 (2603:10a6:4:7b::22) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb8bbbd9-e625-448a-ade9-08d7104b786a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3089; 
x-ms-traffictypediagnostic: BY5PR18MB3089:
x-microsoft-antispam-prvs: <BY5PR18MB3089B1D660445C859EF21461B3C60@BY5PR18MB3089.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(189003)(199004)(80792005)(386003)(53936002)(6506007)(53546011)(186003)(71200400001)(102836004)(6246003)(305945005)(6916009)(476003)(5660300002)(6436002)(26005)(68736007)(229853002)(3846002)(6116002)(52116002)(2906002)(31686004)(446003)(76176011)(11346002)(2616005)(6486002)(71190400001)(6512007)(8676002)(7736002)(64756008)(8936002)(81156014)(66446008)(66066001)(66946007)(81166006)(316002)(14454004)(256004)(4326008)(478600001)(486006)(31696002)(86362001)(25786009)(66476007)(14444005)(36756003)(66556008)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3089;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1bl76Z3xGY6fDHff+0lZvOYbNjOKnfSOsvJnwe9RU8djnIN0E6ruYie1po3m/NKePt9kJnzVK1uoNoY+GisPcuEyt5S5AB3Rt5zJiMKFu7FrZynD4Oi3j6IDZmx8sliC/rl/IVRHadP45IIQtsO2kUNejwQ6choRKymVVM4Nrp9/kDAzBC6jQvERqhiGtByT2b35GnGrYucM6NLk5YN1Z8sdila3BtT2PISPwcFK0N4bmpYjGFCcBEZLoP4NeIgzPc1gcBzDR4kNjRJSjt7oc2W8ZPMlrPxYhkTcmH13Sb+h8OrY1u1uTYaJHGIIf7pokg9v5S9Neaa3rxnyWNSGl7S3j18smANWCZFZzXWuJk9n7Wvzbd94s5vPeJbm3xHX8841SqfCDIM/fjEwkLaTe8JncsgW1vxvdJxU5h1BJD4=
Content-ID: <A41B7EEBE5B4054D9B46BC7E6BEE63E1@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8bbbd9-e625-448a-ade9-08d7104b786a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 15:27:42.7062 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3089
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxMjoxNiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiAraW50IGlvbW11X2dl
dF9kZXZpY2VfZ3JvdXAoc3RydWN0IGRvbWFpbiAqZCwgcGNpX3NiZGZfdCBzYmRmLA0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgWEVOX0dVRVNUX0hBTkRMRV82NCh1aW50MzIpIGJ1ZiwN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBtYXhfc2RldnMpDQo+
ICt7DQo+ICsgICAgc3RydWN0IGlvbW11X2dyb3VwICpncnAgPSBOVUxMOw0KPiArICAgIHN0cnVj
dCBwY2lfZGV2ICpwZGV2Ow0KPiArICAgIHVuc2lnbmVkIGludCBpID0gMDsNCj4gKw0KPiArICAg
IHBjaWRldnNfbG9jaygpOw0KPiArDQo+ICsgICAgZm9yX2VhY2hfcGRldiAoIGQsIHBkZXYgKQ0K
PiArICAgIHsNCj4gKyAgICAgICAgaWYgKCBwZGV2LT5zYmRmLnNiZGYgPT0gc2JkZi5zYmRmICkN
Cj4gKyAgICAgICAgew0KPiArICAgICAgICAgICAgZ3JwID0gcGRldi0+Z3JwOw0KPiArICAgICAg
ICAgICAgYnJlYWs7DQo+ICsgICAgICAgIH0NCj4gKyAgICB9DQo+ICsNCj4gKyAgICBpZiAoICFn
cnAgKQ0KPiArICAgICAgICBnb3RvIG91dDsNCj4gKw0KPiArICAgIGZvcl9lYWNoX3BkZXYgKCBk
LCBwZGV2ICkNCj4gKyAgICB7DQo+ICsgICAgICAgIGlmICggeHNtX2dldF9kZXZpY2VfZ3JvdXAo
WFNNX0hPT0ssIHBkZXYtPnNiZGYuc2JkZikgfHwNCj4gKyAgICAgICAgICAgICBwZGV2LT5ncnAg
IT0gZ3JwICkNCj4gKyAgICAgICAgICAgIGNvbnRpbnVlOw0KPiArDQo+ICsgICAgICAgIGlmICgg
aSA8IG1heF9zZGV2cyAmJg0KPiArICAgICAgICAgICAgIHVubGlrZWx5KGNvcHlfdG9fZ3Vlc3Rf
b2Zmc2V0KGJ1ZiwgaSsrLCAmcGRldi0+c2JkZi5zYmRmLCAxKSkgKQ0KDQpJZiB5b3Ugd2FudCB0
byBhdm9pZCBicmVha2luZyBleGlzdGluZyBjYWxsZXJzLCB5b3UnbGwgaGF2ZSB0byBtaW1pYw0K
aGVyZSAuLi4NCg0KPiAtc3RhdGljIGludCBpb21tdV9nZXRfZGV2aWNlX2dyb3VwKA0KPiAtICAg
IHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4sDQo+IC0gICAgWEVO
X0dVRVNUX0hBTkRMRV82NCh1aW50MzIpIGJ1ZiwgaW50IG1heF9zZGV2cykNCj4gLXsNCj4gLSAg
ICBjb25zdCBzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZCA9IGRvbV9pb21tdShkKTsNCj4gLSAgICBz
dHJ1Y3QgcGNpX2RldiAqcGRldjsNCj4gLSAgICBpbnQgZ3JvdXBfaWQsIHNkZXZfaWQ7DQo+IC0g
ICAgdTMyIGJkZjsNCj4gLSAgICBpbnQgaSA9IDA7DQo+IC0gICAgY29uc3Qgc3RydWN0IGlvbW11
X29wcyAqb3BzID0gaGQtPnBsYXRmb3JtX29wczsNCj4gLQ0KPiAtICAgIGlmICggIWlvbW11X2Vu
YWJsZWQgfHwgIW9wcyB8fCAhb3BzLT5nZXRfZGV2aWNlX2dyb3VwX2lkICkNCj4gLSAgICAgICAg
cmV0dXJuIDA7DQo+IC0NCj4gLSAgICBncm91cF9pZCA9IG9wcy0+Z2V0X2RldmljZV9ncm91cF9p
ZChzZWcsIGJ1cywgZGV2Zm4pOw0KPiAtDQo+IC0gICAgcGNpZGV2c19sb2NrKCk7DQo+IC0gICAg
Zm9yX2VhY2hfcGRldiggZCwgcGRldiApDQo+IC0gICAgew0KPiAtICAgICAgICBpZiAoIChwZGV2
LT5zZWcgIT0gc2VnKSB8fA0KPiAtICAgICAgICAgICAgICgocGRldi0+YnVzID09IGJ1cykgJiYg
KHBkZXYtPmRldmZuID09IGRldmZuKSkgKQ0KPiAtICAgICAgICAgICAgY29udGludWU7DQo+IC0N
Cj4gLSAgICAgICAgaWYgKCB4c21fZ2V0X2RldmljZV9ncm91cChYU01fSE9PSywgKHNlZyA8PCAx
NikgfCAocGRldi0+YnVzIDw8IDgpIHwgcGRldi0+ZGV2Zm4pICkNCj4gLSAgICAgICAgICAgIGNv
bnRpbnVlOw0KPiAtDQo+IC0gICAgICAgIHNkZXZfaWQgPSBvcHMtPmdldF9kZXZpY2VfZ3JvdXBf
aWQoc2VnLCBwZGV2LT5idXMsIHBkZXYtPmRldmZuKTsNCj4gLSAgICAgICAgaWYgKCAoc2Rldl9p
ZCA9PSBncm91cF9pZCkgJiYgKGkgPCBtYXhfc2RldnMpICkNCj4gLSAgICAgICAgew0KPiAtICAg
ICAgICAgICAgYmRmID0gMDsNCj4gLSAgICAgICAgICAgIGJkZiB8PSAocGRldi0+YnVzICYgMHhm
ZikgPDwgMTY7DQo+IC0gICAgICAgICAgICBiZGYgfD0gKHBkZXYtPmRldmZuICYgMHhmZikgPDwg
ODsNCj4gLQ0KPiAtICAgICAgICAgICAgaWYgKCB1bmxpa2VseShjb3B5X3RvX2d1ZXN0X29mZnNl
dChidWYsIGksICZiZGYsIDEpKSApDQoNCi4uLiB0aGlzIHJhdGhlciBvZGQgb3JnYW5pemF0aW9u
IG9mIEJERi4gT21pdHRpbmcgdGhlIHNlZ21lbnQgaXMsIEkNCnRoaW5rLCBmaW5lLCBhcyBJIGRv
bid0IGV4cGVjdCBncm91cHMgdG8gZXh0ZW5kIHBhc3Qgc2VnbWVudA0KYm91bmRhcmllcyAoYW5k
IGlpcmMgbmVpdGhlciBJbnRlbCdzIG5vciBBTUQncyBpbXBsZW1lbnRhdGlvbiBoYXZlDQphbnkg
bWVhbnMgZm9yIHRoaXMgdG8gaGFwcGVuKS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
