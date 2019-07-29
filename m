Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A0878D8F
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 16:14:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs6Nm-00014M-HV; Mon, 29 Jul 2019 14:12:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs6Nl-00014H-FI
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 14:12:09 +0000
X-Inumbo-ID: d179ba84-b20a-11e9-a302-9b15014410c1
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d179ba84-b20a-11e9-a302-9b15014410c1;
 Mon, 29 Jul 2019 14:12:06 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 14:11:58 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 13:54:26 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 13:54:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYIlAF8LErQX44CPUtCKTk5YIAMTXWMSz14TlAux2im7FAKWoX32/xbCm8IF0hFcnnYPsBwQi23wJQw+lzNVMJBVjjk6hAl0YVyTTxIcpC7shSoq20L0U4kufGdWbfcXxr+pN+DabiIdxqf5NuPmGO1MiXAzYoyaEARlQtZEa/Kz2kKtJLbR0CUKEBaDKZlW8lA7tWU2FOeio7LIAU0UHknPdRQsJL0CQ9sjXMJ+moq/bZLgh1NXySl9pWXNt2/DlwpnkB3q6hDwvFxkC478fIW1rOYVKSaaIxDUb/0UsOGh4pDZU/ZzN4MMM8EUGVBaXFXbsSSOkSm/wRIVk2abRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ivPjVcIjKM2OGYukKLViimQc9Wv5oflN8R4h1JIAeE=;
 b=ndz6tVphC/zmHlgUUae3xXEwduvOkmRFSuOGaskFH94a8KvKtPRApbG754AsM5rxylZw5SNge7OT88+S4K1nV7sKNYl2Y9CDVZgbzSra7W/S+FVQjsSk/Mgb5jlhyAmSvR8QTTIuxxCSc1ejGiWUQMsGJqpfpZDom/G/LE6145G9g44cUNJdrT/4kaytN1vhhM47+OTtIn1WSclDhZmXpbZgCQhckKNYskUFZooDlu9IzgtqlirIUs4g6PmHc4zSVFOhFnkZWnDfuEJ3GuVYZE6TCyQ0g6CP5A5LYZJBnIkZv/yCVX9aSlP4JBbzCe0iubV9EtO9Pn8egIys5q/UsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3219.namprd18.prod.outlook.com (10.255.137.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Mon, 29 Jul 2019 13:54:25 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 13:54:25 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH 4/4] xen/percpu: Make DECLARE_PER_CPU() and
 __DEFINE_PER_CPU() common
Thread-Index: AQHVQ/aLJfmONJuXtEOXa2NkIvPAfabhkz+AgAAGfoKAAAiSgA==
Date: Mon, 29 Jul 2019 13:54:25 +0000
Message-ID: <f585f767-f6a0-e9ce-bbab-2183dde59e97@suse.com>
References: <20190726210854.6408-1-andrew.cooper3@citrix.com>
 <20190726210854.6408-5-andrew.cooper3@citrix.com>
 <9c5c9972-801a-e01a-171e-bcabde79eb6f@suse.com>
 <bb203e66-6edd-4edd-4f96-1fe95c1f9ccd@citrix.com>
In-Reply-To: <bb203e66-6edd-4edd-4f96-1fe95c1f9ccd@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR03CA0065.eurprd03.prod.outlook.com
 (2603:10a6:5:2a::42) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4684aab9-6583-48e8-454d-08d7142c4431
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3219; 
x-ms-traffictypediagnostic: BY5PR18MB3219:
x-microsoft-antispam-prvs: <BY5PR18MB32193FACC41C125513B522E0B3DD0@BY5PR18MB3219.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(189003)(199004)(66476007)(66946007)(66556008)(64756008)(66446008)(486006)(54906003)(31686004)(71190400001)(71200400001)(478600001)(31696002)(80792005)(4326008)(7736002)(476003)(14454004)(86362001)(6246003)(8936002)(66066001)(6116002)(3846002)(6916009)(53546011)(6512007)(186003)(53936002)(6436002)(52116002)(6486002)(2616005)(68736007)(102836004)(2906002)(36756003)(8676002)(229853002)(11346002)(446003)(316002)(5660300002)(25786009)(26005)(99286004)(305945005)(6506007)(386003)(256004)(81166006)(81156014)(76176011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3219;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nNg+3NN7Ejh9zL+Wd736EfsU9r2hUCrisLljWPjkxg4DatKy8kGLayZvFE0dNVsnQInPvOghMTHLFf0/LnY0vWGaXg08CDwfjuYtjfTJIHCOqQjls/YIXLsq9z+0vJS9gLg9c13ewVSwc/ZdfZt5B2sOEqy0V1XJsS8/jHRKqSbZrpKD6HV7YmmFv+R5WeL0TDoOFS13ffvc/NrKycZ+08+s9AqZBRVL7PhyNH2gCd5TyYjCj0MNm8R6AxM0KtkQmhl/F0StBOOxA4CYuxkL+FV38wMBZVnOSRsQkkkWqGblWmA5oI/KsCTWULnPOzUjdu4xwunIpbJ3HNMznFNGlh+3GWo1VpH3/Tgn/2TQkYIF90+yvpGt8a6nhsml0y+VnHLglhQEcxr/aAVbgE7ijdh7VORGWnVHOtosAib1dO0=
Content-ID: <175E61A4D7410F41A08115F14BAD8659@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4684aab9-6583-48e8-454d-08d7142c4431
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 13:54:25.2749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3219
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 4/4] xen/percpu: Make DECLARE_PER_CPU() and
 __DEFINE_PER_CPU() common
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAxNToyMywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjkvMDcvMjAx
OSAxNDowMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAyNi4wNy4yMDE5IDIzOjA4LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wZXJjcHUuaA0KPj4+
ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9wZXJjcHUuaA0KPj4+IEBAIC0zLDYgKzMsMTIgQEANCj4+
PiAgICANCj4+PiAgICAjaW5jbHVkZSA8YXNtL3BlcmNwdS5oPg0KPj4+ICAgIA0KPj4+ICsjZGVm
aW5lIERFQ0xBUkVfUEVSX0NQVSh0eXBlLCBuYW1lKSBcDQo+Pj4gKyAgICBleHRlcm4gX190eXBl
b2ZfXyh0eXBlKSBwZXJfY3B1X18gIyMgbmFtZQ0KPj4+ICsNCj4+PiArI2RlZmluZSBfX0RFRklO
RV9QRVJfQ1BVKGF0dHIsIHR5cGUsIG5hbWUpIFwNCj4+PiArICAgIGF0dHIgX190eXBlb2ZfXyh0
eXBlKSBwZXJfY3B1XyAjIyBuYW1lDQo+Pj4gKw0KPj4+ICAgIC8qDQo+Pj4gICAgICogU2VwYXJh
dGUgb3V0IHRoZSB0eXBlLCBzbyAoaW50WzNdLCBmb28pIHdvcmtzLg0KPj4+ICAgICAqDQo+PiBC
eSBtb3ZpbmcgdGhpbmdzIGhlcmUgeW91IHJlbmRlciBzdGFsZSB0aGUgcmVtYWluZGVyIG9mIHRo
ZQ0KPj4gY29tbWVudCBpbiBjb250ZXh0IGFib3ZlOiBObyBwZXItYXJjaCBzeW1ib2wgbmFtZSBw
cmVmaXggaXMgZ29pbmcNCj4+IHRvIGJlIHBvc3NpYmxlIGFueW1vcmUuIEknbSBub3QgYWdhaW5z
dCBpdCwgYnV0IHRoaXMgY29tbWVudA0KPj4gd291bGQgdGhlbiB3YW50IGFkanVzdGluZy4gV2hh
dCdzIG5vdCBpbW1lZGlhdGVseSBjbGVhciB0byBtZSBpcw0KPj4gd2hldGhlciB0aGUgdHdvLXN0
YWdlIGNvbmNhdGVuYXRpb24gb2YgYW4gdW5kZXJzY29yZSBlYWNoIGlzIHRoZW4NCj4+IHN0aWxs
IG5lY2Vzc2FyeS4NCj4gDQo+IFllcyBpdCBpcyBzdGlsbCBuZWNlc3NhcnkuwqAgU2VlIHRoZSBU
U1MgdGhyZWFkIGZvciB3aHkuDQoNCk5vLCB0aGF0IHRocmVhZCBkb2Vzbid0IGV4cGxhaW4gaXQu
IEZyb20gYW4gaW5pdGlhbCBsb29rIEkgdGhpbmsNCnR3by1zdGFnZSBleHBhbnNpb24gaXMgc3Rp
bGwgbmVjZXNzYXJ5LCBidXQgaXQgY291bGQgdGhlbiBiZQ0KXyAjIyBuYW1lIG9uIHRoZSBmaXJz
dCBhbmQgcGVyX2NwdSAjIyBuYW1lIG9uIHRoZSBzZWNvbmQgKGkuZS4NCm5vIGRvdWJsZSB1bmRl
cnNjb3JlIGluIHRoZSBtaWRkbGUgYW55bW9yZSkuIE9mIGNvdXJzZSB0aGVyZSBtYXkNCmJlIHJl
YXNvbnMgd2h5IHdlIGFjdHVhbGx5IF93YW50XyBhIGRvdWJsZSB1bmRlcnNjb3JlIHRoZXJlLg0K
DQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
