Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5A06A290
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 09:03:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnHQh-0006zv-3B; Tue, 16 Jul 2019 06:59:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnHQf-0006zq-IS
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 06:59:13 +0000
X-Inumbo-ID: 254cbce8-a797-11e9-b1dc-3f6bf84500bb
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 254cbce8-a797-11e9-b1dc-3f6bf84500bb;
 Tue, 16 Jul 2019 06:59:10 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 06:59:01 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 06:58:15 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 06:58:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ml2PRUzrJ16OzBp8d5037HPN0xnJKrhkAhbom/z4Rzzbq96xuUzzy3fy2+3AmCu727gKYrtDjbvLUeiJyZDJgVgmyyNjqJKpVlZ1/To5KwipauBWawiPINgNmta9ztK6ZaWOw23gRMsE+05wRkbAaMx7368Fgfbrl4hrrHblH+7tuhaaL6tHaWsGLXzv82Kera/zaxNaaLAfqZBmvN4GMq94rbygpXDbYSwGm+5o6JrRcY1rE5VO+GC63Crmr6ukhuUD4mKZYHpmxCu8+ckIen9rRYLMTUfh+qgUFWzO4w2rvjSkO5K6iYMA1ZafQIhcSMZYo+Z9QiWFoqA3n+x28A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKyRRuUQWzc366NEb27Q+eh1+S0ZbrhGt2NxMTV/NUw=;
 b=GW9wG4PoDxs/LgF+i+McwC9pWzh6vYpwNSux4r/yZty8ZqQvwtkmonVTs/lMObX3ccdy6qQx5K2I2sSpJaEL2GTcn28dh55BHcSJz5yMQuyMuz9TqGMQFp0duWUV7es7AIIhBRfIhawssn1WBlWxqH0flMFg/JB7c64xpCslR43VdJ9BTcFTOpUqQ0uoqNZ6xbkjk0iZEWPfI1Ne4xVzuRsNdUUy4YLWWfcBJFkovrx1q3xTr4gxci6rHWVo+ChJbC1TyfwMS3eoplB1vJQi5/w1JR0kxw+jRtEyL+IQJ8uqOZ4lZrbSX9ZwlCkXnp1RLsncXgyldR695aETWwoOsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2361.namprd18.prod.outlook.com (20.179.71.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 06:58:14 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 06:58:14 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andy Lutomirski <luto@kernel.org>
Thread-Topic: [Xen-devel] [PATCH 0/2] Remove 32-bit Xen PV guest support
Thread-Index: AQHVOyspJT4e/CSPYU+qON3EVGWuQqbL7231gADh4YA=
Date: Tue, 16 Jul 2019 06:58:14 +0000
Message-ID: <88e295ad-6ae0-58c6-4395-3bfc7d968305@suse.com>
References: <20190715113739.17694-1-jgross@suse.com>
 <87y30zfe9z.fsf@linux.intel.com>
 <CALCETrUn=gho5Oug-yYvF2d1WYCe7gvtx+bXuhJ8LTjb9guvuA@mail.gmail.com>
In-Reply-To: <CALCETrUn=gho5Oug-yYvF2d1WYCe7gvtx+bXuhJ8LTjb9guvuA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR01CA0046.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:46::23) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d879b2c-63ba-4d88-6015-08d709baf906
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2361; 
x-ms-traffictypediagnostic: DM6PR18MB2361:
x-microsoft-antispam-prvs: <DM6PR18MB23615801898EF83702BDD3D4B3CE0@DM6PR18MB2361.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(189003)(199004)(478600001)(4326008)(71190400001)(71200400001)(66066001)(53936002)(68736007)(6246003)(229853002)(36756003)(7416002)(2906002)(305945005)(7736002)(86362001)(5660300002)(8676002)(31696002)(256004)(6916009)(14444005)(102836004)(6486002)(3846002)(6116002)(80792005)(186003)(26005)(14454004)(476003)(54906003)(99286004)(2616005)(25786009)(52116002)(6506007)(11346002)(6512007)(81166006)(486006)(64756008)(66476007)(66556008)(8936002)(66946007)(66446008)(81156014)(31686004)(386003)(76176011)(53546011)(446003)(6436002)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2361;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tY7YDSEodBEUys2lp+WX7kp5VMDpkbVwVMiirR+2rscWFpENWiervld1QZRjdsLKd/LKrL8cXsglLN5/CX506b4h3XQ69GkQ7OijMb5jHIzKxf6vDejVB4iYvRbXi08x7S7u1TQAuHJh/yQfbE/KxsKahG6nc3ujTi6aSVwAVdCoxfSd21nJ6Oihu9YdwD8GKlXAhWdaxwI7DyHMd8Ap3YuD/i3WTzD37CTeTMbXRvLmCWie66xppHp9NhUjnGk1z72nGp4Xqvrwa6N2fds+l8CucxvWKZhIhnvOSm7kpQBsp62fstPK+VpqBrcD3nUP9YfHqrSKfSnFmySDxBqNr8xmLQuHxD63kYI9apcMgxYESOAON664N95dQ5VwFyPV1d7PwDY3scLF2ntjAVuG2ntdBGQzvlbBNEeCJTRbmTo=
Content-ID: <E35FAA33AD37C8429158911267A42F18@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d879b2c-63ba-4d88-6015-08d709baf906
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 06:58:14.3945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2361
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 0/2] Remove 32-bit Xen PV guest support
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
Cc: Juergen Gross <JGross@suse.com>, Andi Kleen <ak@linux.intel.com>,
 X86 ML <x86@kernel.org>, Alok Kataria <akataria@vmware.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDcuMjAxOSAxOToyOCwgQW5keSBMdXRvbWlyc2tpIHdyb3RlOg0KPiBPbiBNb24sIEp1
bCAxNSwgMjAxOSBhdCA5OjM0IEFNIEFuZGkgS2xlZW4gPGFrQGxpbnV4LmludGVsLmNvbT4gd3Jv
dGU6DQo+Pg0KPj4gSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cml0ZXM6DQo+Pg0K
Pj4+IFRoZSBsb25nIHRlcm0gcGxhbiBoYXMgYmVlbiB0byByZXBsYWNlIFhlbiBQViBndWVzdHMg
YnkgUFZILiBUaGUgZmlyc3QNCj4+PiB2aWN0aW0gb2YgdGhhdCBwbGFuIGFyZSBub3cgMzItYml0
IFBWIGd1ZXN0cywgYXMgdGhvc2UgYXJlIHVzZWQgb25seQ0KPj4+IHJhdGhlciBzZWxkb20gdGhl
c2UgZGF5cy4gWGVuIG9uIHg4NiByZXF1aXJlcyA2NC1iaXQgc3VwcG9ydCBhbmQgd2l0aA0KPj4+
IEdydWIyIG5vdyBzdXBwb3J0aW5nIFBWSCBvZmZpY2lhbGx5IHNpbmNlIHZlcnNpb24gMi4wNCB0
aGVyZSBpcyBubw0KPj4+IG5lZWQgdG8ga2VlcCAzMi1iaXQgUFYgZ3Vlc3Qgc3VwcG9ydCBhbGl2
ZSBpbiB0aGUgTGludXgga2VybmVsLg0KPj4+IEFkZGl0aW9uYWxseSBNZWx0ZG93biBtaXRpZ2F0
aW9uIGlzIG5vdCBhdmFpbGFibGUgaW4gdGhlIGtlcm5lbCBydW5uaW5nDQo+Pj4gYXMgMzItYml0
IFBWIGd1ZXN0LCBzbyBkcm9wcGluZyB0aGlzIG1vZGUgbWFrZXMgc2Vuc2UgZnJvbSBzZWN1cml0
eQ0KPj4+IHBvaW50IG9mIHZpZXcsIHRvby4NCj4+DQo+PiBOb3JtYWxseSB3ZSBoYXZlIGEgZGVw
cmVjYXRpb24gcGVyaW9kIGZvciBmZWF0dXJlIHJlbW92YWxzIGxpa2UgdGhpcy4NCj4+IFlvdSB3
b3VsZCBtYWtlIHRoZSBrZXJuZWwgcHJpbnQgYSB3YXJuaW5nIGZvciBzb21lIHJlbGVhc2VzLCBh
bmQgd2hlbg0KPj4gbm8gdXNlciBjb21wbGFpbnMgeW91IGNhbiB0aGVuIHJlbW92ZS4gSWYgYSB1
c2VyIGNvbXBsYWlucyB5b3UgY2FuJ3QuDQo+Pg0KPiANCj4gQXMgSSB1bmRlcnN0YW5kIGl0LCB0
aGUga2VybmVsIHJ1bGVzIGRvIGFsbG93IGNoYW5nZXMgbGlrZSB0aGlzIGV2ZW4NCj4gaWYgdGhl
cmUncyBhIGNvbXBsYWludDogdGhpcyBpcyBhIHBhdGNoIHRoYXQgcmVtb3ZlcyB3aGF0IGlzDQo+
IGVmZmVjdGl2ZWx5IGhhcmR3YXJlIHN1cHBvcnQuICBJZiB0aGUgbWFpbnRlbmFuY2UgY29zdCBl
eGNlZWRzIHRoZQ0KPiB2YWx1ZSwgdGhlbiByZW1vdmFsIGlzIGZhaXIgZ2FtZS4gIChPYnZpb3Vz
bHkgd2Ugd2VpZ2h0IHRoZSB2YWx1ZSB0bw0KPiBwcmVzZXJ2aW5nIGNvbXBhdGliaWxpdHkgcXVp
dGUgaGlnaGx5LCBidXQgaW4gdGhpcyBjYXNlLCBYZW4gZHJvcHBlZA0KPiAzMi1iaXQgaGFyZHdh
cmUgc3VwcG9ydCBhIGxvbmcgdGltZSBhZ28uICBJZiB0aGUgWGVuIGh5cGVydmlzb3Igc2F5cw0K
PiB0aGF0IDMyLWJpdCBQViBndWVzdCBzdXBwb3J0IGlzIGRlcHJlY2F0ZWQsIGl0J3MgZGVwcmVj
YXRlZC4pDQoNClNpbmNlIGl0IHdhcyBpbXBsaWVkIGJ1dCBub3QgZXhwbGljaXQgZnJvbSBBbmRy
ZXcncyByZXBseSwganVzdCB0bw0KbWFrZSBpdCBleHBsaWNpdDogU28gZmFyIDMyLWJpdCBQViBn
dWVzdCBzdXBwb3J0IGhhcyBub3QgYmVlbg0KZGVwcmVjYXRlZCBpbiBYZW4gaXRzZWxmLg0KDQpK
YW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
