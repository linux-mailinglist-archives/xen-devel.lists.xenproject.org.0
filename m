Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D38875099
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 16:08:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqeNU-0003hZ-QQ; Thu, 25 Jul 2019 14:05:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqeNS-0003hQ-Tg
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 14:05:50 +0000
X-Inumbo-ID: 3cea45a0-aee5-11e9-8220-6b9f493d323c
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3cea45a0-aee5-11e9-8220-6b9f493d323c;
 Thu, 25 Jul 2019 14:05:48 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 14:05:27 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 13:59:24 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 13:59:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+JJ6p2tpfga19lbhLJg+co7HK5QKGZt31JJbE7Z8dVuFnuElW0zVevCXxUMMTDbibXt1eGxO2gPmDF9k7TiVZMzsmSvo6rDUAaJDhmBsHF3uhKh2lnRJpQr6dN9icuUETgwZkMKd3ZQR2NKdiyD/oFb+cGMriFgA1lsU9c0Gv7ffG9zbgznl9xXT6r+ztA+D7RxnlyV3MxnzbHlbtUx8QA6qa0GwWZKz6CDbpjDrfrKsHp/P9sNOCB5LArGbALg7KkkTT8Ye4rVXy5NJTtlyQHVSe6LKMNDFxnBP0COSC86fhfz15Er948SIJ8rcRAaURrqUA9wb9y7ej+34ZcDQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mf7HCANgWZzXO6AbdeyOHe9Dq2tJQ/e3dyuiKJdvTZg=;
 b=i7tpOfGDMLVAe5wYQZDkGgVsM3EdrdBIdGvh2E/l0DdGQa1lIY9qyLMDu+AqaPdaLG//kirJjB6gRXhTlVuSa4I53ESHWdvNZIsGI/otDG+oSq5m/T8EQacq6MgOKEmC5dWG+9Kocg9Sy++bQRx1bn5r7FYZ+ZjmBHfUj1WkM1lyqtqlZ8v5QqlzT0G+m3sHULppexwFjMoxaRn+CNtA1hROdO3CC7oLpGuXdLdf/cqd5mjzsOo6T0nfZwTwgmaHI1qmH0t7Wvkh8l2tVdfZfEp0l/QHpn9JR9yYVP1PMgIlSZWK4an7vQjvy/QpVws8AyWp1RU48s5V1p3JGpaxtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5SPR01MB0002.namprd18.prod.outlook.com (52.133.255.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Thu, 25 Jul 2019 13:59:23 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 13:59:23 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Fredy P.
 <fredy.pulido@savoirfairelinux.com>
Thread-Topic: [Xen-devel] CPU frequency throttling based on the temperature
Thread-Index: AQHVQu0HpijgxWKHrUqY6YxdJv9yhqbbWYdZgAAC64A=
Date: Thu, 25 Jul 2019 13:59:22 +0000
Message-ID: <0f520921-51a5-22c3-bd5d-7774f26bac30@suse.com>
References: <e23a10a75ea7a1bee33a8721d9bee209b736dee8.camel@savoirfairelinux.com>
 <20190724143643.lpg576p6psxqelrg@Air-de-Roger>
 <cc9a1959af91dc812553b700fee308573c5dea5d.camel@savoirfairelinux.com>
 <20190724154118.ourqzsecc6cylypd@Air-de-Roger>
 <40f51e942a4ce5d2f0aa6c557090cba1f0fccb16.camel@savoirfairelinux.com>
 <b9807309-6785-72ae-0a95-998f795fc51b@suse.com>
 <20190725131346.kve55aazhwls2rtb@Air-de-Roger>
 <7e05469ebe82e4564ed3cca3182e7bad41a3f2ed.camel@savoirfairelinux.com>
 <20190725134750.d5hw6dsxjowk4ann@Air-de-Roger>
In-Reply-To: <20190725134750.d5hw6dsxjowk4ann@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0172.eurprd07.prod.outlook.com
 (2603:10a6:6:43::26) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 137d0f03-162c-4945-a6ff-08d711084bec
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5SPR01MB0002; 
x-ms-traffictypediagnostic: BY5SPR01MB0002:
x-microsoft-antispam-prvs: <BY5SPR01MB0002097668E3E47151B66C23B3C10@BY5SPR01MB0002.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(189003)(199004)(11346002)(2616005)(476003)(102836004)(446003)(386003)(6246003)(31696002)(486006)(6486002)(53546011)(6506007)(66946007)(186003)(99286004)(76176011)(26005)(316002)(52116002)(14444005)(5660300002)(256004)(305945005)(25786009)(229853002)(64756008)(66556008)(66476007)(53936002)(71200400001)(86362001)(66446008)(71190400001)(4326008)(68736007)(478600001)(3846002)(8936002)(31686004)(6116002)(6436002)(6512007)(14454004)(8676002)(81166006)(81156014)(2906002)(66066001)(7736002)(36756003)(110136005)(54906003)(80792005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5SPR01MB0002;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WYXfZj0vNBVpm7wh2BtCRffSn+Ogu3xv0nwHf7yclhOWgwkHKN8lSYTYh3C5uoQZDTHEDIXWeSddmaQn9GQLjeZmCOXdVJSXx29nW8DP3ewXg6nE1NZF6Cie4AFIUFYU23p//8DOIg8CppncCp0tEtZydsehzxcK4wM7g0Xbo/zGFbhAPxJOYAJlAKJY5klBXAbzGlCKL2KdQ/tD0+HGzwKy4Q+k42CPKsphmgPivScXdv+9wqmBappOaj2JHHZ7rh6yUrkddajLuom8lXGYo3EBGdfAfxvzw9gbYGy36F8Pg1DYTwptjC10QcQP/tfo9U78IG4KYnqdHO6QulCqs0VshMHjb22GUefssY1wjwXEmqfns3rgLb4fhdarSbrr8FpFBrdsnDjLM45pjC+KG+fvgBczPI0ErHA/6/uvRak=
Content-ID: <08C42683AA5F444B8FF8EA2D09A2A6B1@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 137d0f03-162c-4945-a6ff-08d711084bec
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 13:59:22.9144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5SPR01MB0002
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] CPU frequency throttling based on the temperature
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDcuMjAxOSAxNTo0NywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIFRodSwg
SnVsIDI1LCAyMDE5IGF0IDA5OjI5OjAxQU0gLTA0MDAsIEZyZWR5IFAuIHdyb3RlOg0KPj4gT24g
VGh1LCAyMDE5LTA3LTI1IGF0IDE1OjEzICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0K
Pj4+IE9uIFRodSwgSnVsIDI1LCAyMDE5IGF0IDEyOjU0OjQ2UE0gKzAwMDAsIEphbiBCZXVsaWNo
IHdyb3RlOg0KPj4+PiBPbiAyNS4wNy4yMDE5IDE0OjQ0LCAgRnJlZHkgUC4gIHdyb3RlOg0KPj4+
Pj4gT24gV2VkLCAyMDE5LTA3LTI0IGF0IDE3OjQxICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdy
b3RlOg0KPj4+Pj4+Pj4gV2hhdCBoYXJkd2FyZSBpbnRlcmZhY2UgZG9lcyB0aGVybWFsZCAob3Ig
dGhlIGRyaXZlciBpbg0KPj4+Pj4+Pj4gTGludXggaWYNCj4+Pj4+Pj4+IHRoZXJlJ3Mgb25lKSB1
c2UgdG8gZ2V0IHRoZSB0ZW1wZXJhdHVyZSBkYXRhPw0KPj4+Pj4NCj4+Pj4+IEluIG91ciBpbml0
aWFsIFBPQyB1c2luZyBYZW4gNC44Lnggd2Ugd2hlcmUgdXNpbmcgTGludXggY29yZXRlbXANCj4+
Pj4+IGRyaXZlcg0KPj4+Pj4gcmVhZGluZyBieSBleGFtcGxlIC9jbGFzcy9zeXMvaHdtb24vaHdt
b24wL3RlbXAzX2lucHV0IGJ1dCBpdCBnb3QNCj4+Pj4+IGRlcHJlY2F0ZWQgYXQgY29tbWl0IDcy
ZTAzODQ1MGQzZDVkZTFhMzlmMGNmYTJkMmIwZjliM2Q0M2M2YzYNCj4+Pj4NCj4+Pj4gSG1tLCBJ
IHdvdWxkbid0IGNhbGwgdGhpcyBkZXByZWNhdGlvbiwgYnV0IGEgcmVncmVzc2lvbi4gSSB3b3Vs
ZA0KPj4+PiBzYXkgd2Ugd2FudCB0byByZS1leHBvc2UgdGhpcyBsZWFmIHRvIERvbTAsIHRoZSBt
b3JlIHRoYXQgdGhlDQo+Pj4+IGNvbW1pdCBhbHNvIG9ubHkgbWVudGlvbnMgdW5wcml2aWxlZ2Vk
IGRvbWFpbnMuIEFuZHJldz8NCj4+Pg0KPj4+IEFGQUlDVCBmcm9tIHRoZSBkb2N1bWVudHMgcHJv
dmlkZWQgYnkgRnJlZHkgdGhlIHRlbXBlcmF0dXJlIGlzIHJlYWQNCj4+PiBmcm9tIGEgTVNSIHRo
YXQgcmVwb3J0cyB0aGUgY3VycmVudCB0ZW1wZXJhdHVyZSBvZiB0aGUgY29yZSBvbiB3aGljaA0K
Pj4+IHRoZSBNU1IgaXMgcmVhZCBmcm9tLiBXaGVuIHJ1bm5pbmcgb24gWGVuIHRoaXMgd2lsbCBv
bmx5IHdvcmsNCj4+PiBjb3JyZWN0bHkgaWYgZG9tMCBpcyBnaXZlbiB0aGUgc2FtZSB2Q1BVcyBh
cyBwQ1BVcyBhbmQgdGhvc2UgYXJlDQo+Pj4gaWRlbnRpdHkgcGlubmVkLg0KPj4NCj4+IEkganVz
dCB3YW50IHRvIGJlIHN1cmUgSSBnb3QgaXQgY29ycmVjdGx5LCBieSBzYXlpbmcgIldoZW4gcnVu
bmluZyBvbg0KPj4gWGVuIHRoaXMgd2lsbCBvbmx5IHdvcmsgY29ycmVjdGx5IGlmIC4uLiIgbWVh
bnMgaW4gYSBmdXR1cmUNCj4+IGltcGxlbWVudGF0aW9uIG9yIHRoYXQgcmlnaHQgbm93IGNvdWxk
IHdvcmsgaWYgSSBwaW4gdGhpcyB2L3BDUFVTPw0KPiANCj4gTm8sIHJpZ2h0IG5vdyB0aGVyZSdz
IG5vIHdheSB0byBnZXQgdGhpcyBkYXRhIGZyb20gZG9tMCwgcmVnYXJkbGVzcyBvZg0KPiB0aGUg
cGlubmluZy4NCg0KT2YgY291cnNlIHlvdSBjYW4sIHVzaW5nIHRoZSBNU1IgImRldmljZSIgTGlu
dXggb3B0aW9uYWxseQ0KcHJvdmlkZXMgKHBsdXMgcGVyaGFwcyB0aGUgcmRtc3IgdXRpbGl0eSBm
cm9tIHRoZSBtc3ItdG9vbHMNCnBhY2thZ2UpLg0KDQo+IFRoZSBjb21taXQgeW91IG1lbnRpb24g
c2ltcGx5IHJlbW92ZXMgZXhwb3NpbmcgdGhlIGZlYXR1cmUgb24gQ1BVSUQsDQo+IGJ1dCBJJ20g
bm90IHN1cmUgd2hldGhlciBhY2Nlc3MgdG8gdGhlIGFjdHVhbCBNU1IgaXMgYWxzbyBmb3JiaWRk
ZW4uIEkNCj4gdGhpbmsgc28gc2luY2Ugd2UgZG8gTVNSIHdoaXRlIGxpc3RpbmcgSUlSQywgYW5k
IEkgZG9uJ3Qgc2VlbSB0byBmaW5kDQo+IE1TUl9JQTMyX1RIRVJNX1NUQVRVUyB3aGl0ZSBsaXN0
ZWQgYW55d2hlcmUuDQoNCkF0IGxlYXN0IGZvciBQViB3ZSBjb250aW51ZSB0byBsZXQgZXZlcnl0
aGluZyBub3Qgc3BlY2lhbGx5DQpoYW5kbGVkIHNoaW5lIHRocm91Z2ggLSBzZWUgdGhlIGJvdHRv
bSBvZiBwdi9lbXVsLXByby1vcC5jOnJlYWRfbXNyKCkuDQoNCkphbg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
