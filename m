Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA2012B28F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 09:07:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikkcU-0000vl-66; Fri, 27 Dec 2019 08:05:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ikkcT-0000vc-8q
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 08:05:13 +0000
X-Inumbo-ID: 8f08c5d2-287f-11ea-9b94-12813bfff9fa
Received: from m9a0014g.houston.softwaregrp.com (unknown [15.124.64.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f08c5d2-287f-11ea-9b94-12813bfff9fa;
 Fri, 27 Dec 2019 08:05:12 +0000 (UTC)
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0014g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 27 Dec 2019 08:04:01 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 27 Dec 2019 08:01:51 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 27 Dec 2019 08:01:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCXsG7yXsWkryWF4exuGX1VD1qWAR+svfadB5tGOPbR3+xX3m9PLFWN2fKVzn4TLptrPUfYO8jYcyqdUtT9Xv6uANHu/p2b2YQUldd8P/8rfe7k+FoNll8XuADmd2fqB5fpbzEwnWJAc1S5/cHPHE3zmKdro0rQWUvI1P0XZflSE76pmO0oQESfeRE6hENE3YsQha7/md0f268aoOtlJaOsOzOI3xamaaQXCHMwYR3ad47S3Pyy2RrHNsQcOLbSLJXOcrFV1VUvGB3qvOoL+gRT+NH8qXnbesod3oFH3/eXQF0qSfiNtE+mH3EnIkJQv2cbfIPu5/WUqTx1uZhFEbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsWcCCmo5rkHD87BEzkWsbyrqp7CnygNtddp1cHXRcM=;
 b=aNOih5w5/qZwFgq5wAh9ZfgedQhdDbSReyznckkRl0KhATMB0B+oLl8/07/31zhA2dUqTGlYYsD+mr4scPreLPPDBpwyhb7CPsAWDgucffC9zSNSy5UaN/W80fi4J2Wx8a8+oHg/KFnOMcArzL/UWNoea1cUuCWDKdryUJISNgg3jyIcO9Iwi1zFHTEERiKIDqEnDrjNj2Jx9eNYzBaF1RaFPl7d/CcJBgcYn10DmrUjmT/aIRPm9iIDnW6NAstXjUiKMPsHznV6BdsXIiiwnfEIHUr2UMfCVy+ZiTufNVgywbxX9k8/E+Z7g1jMNe8gh+8s5YjXez4TWLTec0b5pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.237.86) by
 MN2PR18MB2624.namprd18.prod.outlook.com (20.179.83.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11; Fri, 27 Dec 2019 08:01:50 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::19f2:b9fd:38db:7461]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::19f2:b9fd:38db:7461%4]) with mapi id 15.20.2581.007; Fri, 27 Dec 2019
 08:01:50 +0000
Received: from [10.156.60.99] (37.24.206.209) by
 LO2P265CA0115.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:c::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 08:01:48 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Thread-Topic: [PATCH V6 2/4] x86/altp2m: Add hypercall to set a range of sve
 bits
Thread-Index: AQHVuZoDNmDuDnEJ80qPa8O4OJEXKqfNpLkA
Date: Fri, 27 Dec 2019 08:01:50 +0000
Message-ID: <f0034743-477d-0f10-964b-f9d2128a35b7@suse.com>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
 <20191223140409.32449-2-aisaila@bitdefender.com>
In-Reply-To: <20191223140409.32449-2-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0115.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::31) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:166::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a535af7b-f710-43ee-afab-08d78aa30745
x-ms-traffictypediagnostic: MN2PR18MB2624:
x-microsoft-antispam-prvs: <MN2PR18MB2624728B6F113396418AA3AAB32A0@MN2PR18MB2624.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0264FEA5C3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(189003)(199004)(4744005)(6666004)(66946007)(186003)(16526019)(26005)(66446008)(64756008)(66476007)(478600001)(6916009)(8936002)(52116002)(4326008)(66556008)(31686004)(31696002)(2616005)(956004)(86362001)(16576012)(316002)(5660300002)(2906002)(53546011)(54906003)(81166006)(71200400001)(6486002)(7416002)(8676002)(36756003)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2624;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e/3PU6BBwJ3xOGdZBHMoRcnMJVwwmKFX6a4X6ZFkj3e6TxWcp2RgsG+feGtKJX3hV4XUJkuLGduIYMb/SGKuNKFs+jFICFGjYBqmBh/m43/26tY496ZLDXT5teG4yQ+f4AJLNkz9zPYOzPZLGQNt66MDEaGPj4kDp3Edb4AMfpri748qx8HqIY5m0GvwaY6UeTreA+nTAP+mK5HcV2sqJ75a05bVfXxkhQ3i2Zg/s2HDp8P5y9WSi+rZw27kwXbCcTM0PjZltBYEnIAEy+4MG6Aaxe9S8lsPrT3Ci1amGLKgZAyUvxvA+8xXa8qsJwGtX/7/3r8i8g/+NFTz4AtOfZ8qxnFe3dXSDZkjWkClX19h7ZP2vv9oex5mNH704s2O4mCy8CET/lJ64Xc6frl0DUOOV0mokmdsnH4kloGVD08U6mEr/XAuRMmR3NX0/gLc
x-ms-exchange-transport-forked: True
Content-ID: <25805B8E78E501479467B51393C87CEA@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a535af7b-f710-43ee-afab-08d78aa30745
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2019 08:01:50.4253 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tlz0Bc72RhxV7t/XlfLcjulFOWqPryUjQJR0tMzbYto9LF2q/JZzSWo0DrEPZzpj2q4U5OBl4tdRk+n44hqAQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2624
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH V6 2/4] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KHJlLXNlbmRpbmcsIGFzIEkgc3RpbGwgZG9uJ3Qgc2VlIHRoZSBtYWlsIGhhdmluZyBhcHBlYXJl
ZCBvbiB0aGUgbGlzdCkNCg0KT24gMjMuMTIuMjAxOSAxNTowNCwgQWxleGFuZHJ1IFN0ZWZhbiBJ
U0FJTEEgd3JvdGU6DQo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX29wLmgNCj4g
KysrIGIveGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaA0KPiBAQCAtNDYsNiArNDYsMTYg
QEAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlIHsNCj4gICAgICB1aW50NjRfdCBn
Zm47DQo+ICB9Ow0KPiAgDQo+ICtzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fc3VwcHJlc3NfdmVfbXVs
dGkgew0KPiArICAgIHVpbnQxNl90IHZpZXc7DQo+ICsgICAgdWludDhfdCBzdXBwcmVzc192ZTsg
LyogQm9vbGVhbiB0eXBlLiAqLw0KPiArICAgIHVpbnQ4X3QgcGFkMTsNCj4gKyAgICBpbnQzMl90
IGZpcnN0X2Vycm9yOyAvKiBTaG91bGQgYmUgc2V0IHRvIDAgLiAqLw0KDQpTdHJheSBibGFuayBi
ZWZvcmUgZnVsbCBzdG9wLg0KDQo+ICsgICAgdWludDY0X3QgZmlyc3RfZ2ZuOyAvKiBWYWx1ZSBt
YXkgYmUgdXBkYXRlZCAqLw0KPiArICAgIHVpbnQ2NF90IGxhc3RfZ2ZuOw0KPiArICAgIHVpbnQ2
NF90IGZpcnN0X2Vycm9yX2dmbjsgLyogR2ZuIG9mIHRoZSBmaXJzdCBlcnJvci4gKi8NCj4gK307
DQoNClBsZWFzZSBiZSBjb25zaXN0ZW50IGFib3V0IHlvdXIgY29tbWVudCBzdHlsZSBoZXJlOiBU
aGUgZnVsbA0Kc3RvcCBpc24ndCBtYW5kYXRvcnksIGJ1dCBhdCBsZWFzdCBhZGphY2VudCBjb21t
ZW50cyAoYWxsDQphZGRlZCBhdCB0aGUgc2FtZSB0aW1lKSBzaG91bGQgaGF2ZSBpZGVudGljYWwg
c3R5bGUuDQoNClBsZWFzZSBtYXkgSSBhc2sgdGhhdCB5b3UgYXBwbHkgYSBsaXR0bGUgbW9yZSBj
YXJlIHdoZW4gZG9pbmcNCnVwZGF0ZXMsIHJhdGhlciB0aGFuIHJlbHlpbmcgb24gb3RoZXJzIHRv
IHNwZW5kIHRoZWlyIHRpbWUgb24NCmNhdGNoaW5nIGlzc3Vlcz8NCg0KSmFuDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
