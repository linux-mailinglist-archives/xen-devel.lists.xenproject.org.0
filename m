Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 805076B8E6
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 11:08:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnfsI-0000hx-Mx; Wed, 17 Jul 2019 09:05:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnfsH-0000hq-1Z
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 09:05:21 +0000
X-Inumbo-ID: fdad006e-a871-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fdad006e-a871-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 09:05:18 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 09:05:14 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 09:04:55 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 09:04:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UT/WWc4yaEAmzbGZcimunO4GenytDyVNoANYKv9+tm/pHJ7zTLOWh5p95p4DOY/oqTKIY/cAZDZaCdMuenLwKBH/O+dkKFQsgeHLAjPFpbMQ9nYmlXAgifZ19ultt0ghGneWEY0LlodORWFoKaiTczkviP24CCyhk9ZNloougvM9uXxSRnSBxle2L7z3WwQxTkfuxbYjyB+ZAxvDKHtc+klBYVsRoIyPzQ5qr1H2finkyAzN8mVcSmZp9aHtFOt+5or2xDsAapkPhlvVL4JpPNvr0kvaEvCJyFtuNyJPqX/c8IdR8gqngIldN9PsDXxdqNcta9dHQCMBhL9suV5BRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4X3NNoIS/3FEsUQfr86EkFXjK602BejdYs0u249wKw=;
 b=XYjdIsFQT/BiIN1ZnMzOxfhNL+AOKfT7qGR/Mbjw0zKeC4gB+c4n+XmWnCyqwhUlbB/QdcFI8RpympWHzL3+0jnbkqqzfp1VZ8B0Qny+llkoE7z30/M7V+6KVbsrgN60Z/H9PleuKVy74U+LP9HBioN3JBEK9wvqqQVbSAFzP1DLaa+JdSK6DgyFRPLNY4+1BoiPHKvjdf+2g6ZGZ/eD5G7+cQzmvEMj09O/gh6n7CoLJqGTvxtuW5Z1s8LR1wDJhoeIbqJzq6u9FinlvEjedoqBjN+qHpilSK2eaKroZ0yeZX3RO5CGDMCopb30p6OPCAW9s1vI+1zpLPS58z7YIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3162.namprd18.prod.outlook.com (10.255.172.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Wed, 17 Jul 2019 09:04:55 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 09:04:55 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH v2 3/5] x86/AMD: make C-state handling independent of Dom0
Thread-Index: AQHVMZ95Pg5KTi9KKk6xsZ3jj2BciKbNYdpqgAE4SYA=
Date: Wed, 17 Jul 2019 09:04:55 +0000
Message-ID: <97f3e531-6c25-b8fa-c1b0-b68a183365f0@suse.com>
References: <0dbf8520-89c7-753e-c10a-13399aec9cd5@suse.com>
 <7e5fba10-b957-81ed-a1d8-d4c7447f0d51@suse.com>
 <20190716142632.zallvho5vor4ug75@Air-de-Roger.citrite.net>
In-Reply-To: <20190716142632.zallvho5vor4ug75@Air-de-Roger.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0144.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::36) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9dc5332a-9404-4969-7e8d-08d70a95d5d5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR18MB3162; 
x-ms-traffictypediagnostic: DM6PR18MB3162:
x-microsoft-antispam-prvs: <DM6PR18MB31627534B244C57F5771FE74B3C90@DM6PR18MB3162.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(189003)(199004)(476003)(80792005)(2616005)(11346002)(446003)(36756003)(81166006)(486006)(6486002)(31686004)(66556008)(64756008)(66446008)(71190400001)(71200400001)(6436002)(5660300002)(86362001)(25786009)(66946007)(66066001)(66476007)(6916009)(52116002)(6506007)(2906002)(8936002)(76176011)(54906003)(99286004)(386003)(14454004)(6246003)(316002)(3846002)(31696002)(53936002)(6116002)(6512007)(478600001)(4326008)(256004)(229853002)(305945005)(102836004)(26005)(186003)(8676002)(68736007)(81156014)(7736002)(53546011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3162;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7dg5BCVvToVMPvnPn2Q7MKtCIktJFNaP7ernNsVfw+3/hjzrPz6CYOK5U+UxXeFNq009I4iX/LrdTbAbAgGPM4pA+aRy8PoUkzPJ4r3axvj72V45ty6ffbKU5lxBEr4A3z65H6HwUzNwv4OSnESFRK0NSLD/cot/sKltTr0kjxme2Vc/+ZKQ36SsiD0cWhnD58j+VY2taekB/iHlkYNag4UezXvGIgcZbDIB1ym4d41ikUct6yVzOCLfCuTD9wcelymwoWRcoPTRUOVJB7EtwH1WMltw5/qDfv/fL2LsbNvFOLqpAbTCcZDhedbQ2/6L8wo6f3OA67ZP4jb9sIYuhjDP8zHAenIUDD1pBb4CjzPlB7HU8pKKkfRIQwGxm/I7W+QnVZCFPyx5WJoToJWBJU5g+VxO18ccTUa7jvk73TE=
Content-ID: <063BC460E8B8794F9109D36082FD0C1E@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc5332a-9404-4969-7e8d-08d70a95d5d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 09:04:55.1087 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3162
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 3/5] x86/AMD: make C-state handling
 independent of Dom0
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxNjoyNiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIFdlZCwg
SnVsIDAzLCAyMDE5IGF0IDAxOjAxOjQ4UE0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4g
LS0tIGEveGVuL2FyY2gveDg2L2FjcGkvY3B1X2lkbGUuYw0KPj4gKysrIGIveGVuL2FyY2gveDg2
L2FjcGkvY3B1X2lkbGUuYw0KPj4gQEAgLTExMCw2ICsxMTAsOCBAQCBib29sZWFuX3BhcmFtKCJs
YXBpY190aW1lcl9jMl9vayIsIGxvY2FsDQo+PiAgICANCj4+ICAgIHN0cnVjdCBhY3BpX3Byb2Nl
c3Nvcl9wb3dlciAqX19yZWFkX21vc3RseSBwcm9jZXNzb3JfcG93ZXJzW05SX0NQVVNdOw0KPj4g
ICAgDQo+PiArc3RhdGljIGludDhfdCBfX3JlYWRfbW9zdGx5IHZlbmRvcl9vdmVycmlkZTsNCj4g
DQo+IEFGQUlDVCBmcm9tIHRoZSBjb2RlIGJlbG93IHRoaXMgaXMgYSB0cmktc3RhdGUgKC0xLCAw
LCAxKS4gQ291bGQgaXQNCj4gbWF5YmUgYmUgdHVybmVkIGludG8gYW4gZW51bSB3aXRoIGRlZmlu
aXRpb25zIG9mIHRoZSBkaWZmZXJlbnQNCj4gc3RhdGVzPw0KPiANCj4gSSB0aGluayBpdCB3b3Vs
ZCBtYWtlIHRoZSB1c2FnZSBjbGVhcmVyLg0KDQpXZWxsLCBwZXJzb25hbGx5IEkgcHJlZmVyIGRv
aW5nIGl0IHRoaXMgd2F5IGZvciB0cmlzdGF0ZXMuIEknbGwNCndhaXQgdG8gc2VlIHdoYXQgb3Ro
ZXJzIHRoaW5rLg0KDQo+PiBAQCAtMTI4Niw2ICsxMjkxLDEwMyBAQCBsb25nIHNldF9jeF9wbWlu
Zm8odWludDMyX3QgYWNwaV9pZCwgc3RyDQo+PiAgICAgICAgcmV0dXJuIDA7DQo+PiAgICB9DQo+
PiAgICANCj4+ICtzdGF0aWMgdm9pZCBhbWRfY3B1aWRsZV9pbml0KHN0cnVjdCBhY3BpX3Byb2Nl
c3Nvcl9wb3dlciAqcG93ZXIpDQo+PiArew0KPj4gKyAgICB1bnNpZ25lZCBpbnQgaSwgbnIgPSAw
Ow0KPj4gKyAgICBjb25zdCBzdHJ1Y3QgY3B1aW5mb194ODYgKmMgPSAmY3VycmVudF9jcHVfZGF0
YTsNCj4+ICsgICAgY29uc3QgdW5zaWduZWQgaW50IGVjeF9yZXEgPSBDUFVJRDVfRUNYX0VYVEVO
U0lPTlNfU1VQUE9SVEVEIHwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBD
UFVJRDVfRUNYX0lOVEVSUlVQVF9CUkVBSzsNCj4+ICsgICAgY29uc3Qgc3RydWN0IGFjcGlfcHJv
Y2Vzc29yX2N4ICpjeCA9IE5VTEw7DQo+PiArICAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYWNwaV9w
cm9jZXNzb3JfY3ggZmFtMTdbXSA9IHsNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICAu
dHlwZSA9IEFDUElfU1RBVEVfQzEsDQo+PiArICAgICAgICAgICAgLmVudHJ5X21ldGhvZCA9IEFD
UElfQ1NUQVRFX0VNX0ZGSCwNCj4+ICsgICAgICAgICAgICAuYWRkcmVzcyA9IDAsDQo+IA0KPiBh
ZGRyZXNzIGZpZWxkIHdpbGwgYWxyZWFkeSBnZXQgc2V0IHRvIDAgYnkgZGVmYXVsdC4NCg0KSG1t
LCB5ZXMuIEknbSBuZXZlciByZWFsbHkgc3VyZSB3aGV0aGVyIGFkZGluZyBleHBsaWNpdCB6ZXJv
DQppbml0aWFsaXplcnMgZm9yIGZpZWxkcyB3aGVyZSB0aGV5IGFyZW4ndCBkb24ndC1jYXJlcyBp
cyBiZXR0ZXIuDQpOb3IgKG1vc3RseSBmb3IgdGhhdCByZWFzb24pIGFtIEkgcmVhbGx5IGNvbnNp
c3RlbnQgaW4gdGhpcy4gSQ0KZ3Vlc3MgSSdsbCBkcm9wIHRoZSBsaW5lLg0KDQo+PiArICAgICAg
ICAgICAgLmxhdGVuY3kgPSAxLA0KPj4gKyAgICAgICAgfSwNCj4+ICsgICAgICAgIHsNCj4+ICsg
ICAgICAgICAgICAudHlwZSA9IEFDUElfU1RBVEVfQzIsDQo+PiArICAgICAgICAgICAgLmVudHJ5
X21ldGhvZCA9IEFDUElfQ1NUQVRFX0VNX0hBTFQsDQo+PiArICAgICAgICAgICAgLmxhdGVuY3kg
PSA0MDAsDQo+IA0KPiBNYXliZSB0aGUgbGF0ZW5jeSB2YWx1ZXMgY291bGQgYmUgYWRkZWQgdG8g
Y3B1aWRsZS5oIGFzIGRlZmluZXM/DQoNCkknZCByYXRoZXIgbm90LCBhcyBzdWNoIGNvbnN0YW50
cyB3b3VsZG4ndCBiZSB1c2VkIGluIG1vcmUgdGhhbiBvbmUNCnBsYWNlLiBTZWUgeGVuL2FyY2gv
eDg2L2NwdS9td2FpdC1pZGxlLmMncyByZXNwZWN0aXZlIHRhYmxlcy4NCg0KPj4gKyAgICAgICAg
fSwNCj4+ICsgICAgfTsNCj4+ICsNCj4+ICsgICAgaWYgKCBwbV9pZGxlX3NhdmUgJiYgcG1faWRs
ZSAhPSBhY3BpX3Byb2Nlc3Nvcl9pZGxlICkNCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsNCj4+
ICsgICAgaWYgKCB2ZW5kb3Jfb3ZlcnJpZGUgPCAwICkNCj4+ICsgICAgICAgIHJldHVybjsNCj4+
ICsNCj4+ICsgICAgc3dpdGNoICggYy0+eDg2ICkNCj4+ICsgICAgew0KPj4gKyAgICBjYXNlIDB4
MTg6DQo+PiArICAgICAgICBpZiAoIGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAhPSBYODZfVkVO
RE9SX0hZR09OICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgZGVmYXVsdDoNCj4+ICsgICAgICAg
ICAgICB2ZW5kb3Jfb3ZlcnJpZGUgPSAtMTsNCj4+ICsgICAgICAgICAgICByZXR1cm47DQo+PiAr
ICAgICAgICB9DQo+PiArICAgICAgICAvKiBmYWxsIHRocm91Z2ggKi8NCj4+ICsgICAgY2FzZSAw
eDE3Og0KPj4gKyAgICAgICAgaWYgKCBjcHVfaGFzX21vbml0b3IgJiYgYy0+Y3B1aWRfbGV2ZWwg
Pj0gQ1BVSURfTVdBSVRfTEVBRiAmJg0KPj4gKyAgICAgICAgICAgICAoY3B1aWRfZWN4KENQVUlE
X01XQUlUX0xFQUYpICYgZWN4X3JlcSkgPT0gZWN4X3JlcSApDQo+PiArICAgICAgICB7DQo+PiAr
ICAgICAgICAgICAgY3ggPSBmYW0xNzsNCj4+ICsgICAgICAgICAgICBuciA9IEFSUkFZX1NJWkUo
ZmFtMTcpOw0KPj4gKyAgICAgICAgICAgIGxvY2FsX2FwaWNfdGltZXJfYzJfb2sgPSB0cnVlOw0K
Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4gKyAgICAgICAgfQ0KPj4gKyAgICAgICAgLyogZmFs
bCB0aHJvdWdoICovDQo+PiArICAgIGNhc2UgMHgxNToNCj4+ICsgICAgY2FzZSAweDE2Og0KPj4g
KyAgICAgICAgY3ggPSAmZmFtMTdbMV07DQo+PiArICAgICAgICBuciA9IEFSUkFZX1NJWkUoZmFt
MTcpIC0gMTsNCj4+ICsgICAgICAgIGJyZWFrOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIHBv
d2VyLT5mbGFncy5oYXNfY3N0ID0gdHJ1ZTsNCj4+ICsNCj4+ICsgICAgZm9yICggaSA9IDA7IGkg
PCBucjsgKytpICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgaWYgKCBjeFtpXS50eXBlID4gbWF4
X2NzdGF0ZSApDQo+PiArICAgICAgICAgICAgYnJlYWs7DQo+PiArICAgICAgICBwb3dlci0+c3Rh
dGVzW2kgKyAxXSA9IGN4W2ldOw0KPj4gKyAgICAgICAgcG93ZXItPnN0YXRlc1tpICsgMV0uaWR4
ID0gaSArIDE7DQo+PiArICAgICAgICBwb3dlci0+c3RhdGVzW2kgKyAxXS50YXJnZXRfcmVzaWRl
bmN5ID0gY3hbaV0ubGF0ZW5jeSAqIGxhdGVuY3lfZmFjdG9yOw0KPiANCj4gWW91IGNvdWxkIHNl
dCB0YXJnZXRfcmVzaWRlbmN5IGFzIHBhcnQgb2YgdGhlIGluaXRpYWxpemF0aW9uLCBidXQgSQ0K
PiBndWVzcyBsYXRlbmN5X2ZhY3RvciBiZWluZyBub24tY29uc3QgdGhhdCB3b3VsZCBtb3ZlIGZh
bTE3IG91dHNpZGUgb2YNCj4gLnJvZGF0YT8NCg0KVGhlIHN0YXRpYyBiZWluZyBmdW5jdGlvbiBs
b2NhbCAtIHllcywgSSBjb3VsZCwgYnV0IGJlc2lkZXMgdGhlIGFycmF5DQptb3Zpbmcgb3V0IG9m
IC5yb2RhdGEgSSdkIHRoZW4gYWxzbyBuZWVkIHRvIGR1cGxpY2F0ZSB0aGUgbGF0ZW5jeQ0KdmFs
dWVzIChhbmQgYXMgc2FpZCBhYm92ZSBJJ2QgbGlrZSB0byBhdm9pZCBpbnRyb2R1Y2luZyAjZGVm
aW5lLXMgZm9yDQp0aGVtKS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
