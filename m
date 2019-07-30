Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8A27A9E7
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 15:43:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsSML-0004ow-FE; Tue, 30 Jul 2019 13:40:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsSMJ-0004ld-Av
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 13:40:07 +0000
X-Inumbo-ID: 83e5a15a-b2cf-11e9-bf8d-abbeecfdf0dd
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83e5a15a-b2cf-11e9-bf8d-abbeecfdf0dd;
 Tue, 30 Jul 2019 13:40:03 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 13:39:56 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 13:27:02 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 13:27:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnS0ryBMfY4CcA/cpMBGF0ftZOcrORCmJhMmYSlxnjE/YqGJPsAtTi0xPIyug83reCLJoTLxw34TU/fAfykGFD1hLdvUfeOB22SVjZjXLOu2jATk+Hz1zMrEMf0Re+wOKF16NSFrDaJIy+71BtlD0umhtZp+M53zpecXlg3hqoJF9A8eGx2oN4dtRIwZNqPMo0ELDtOc2/6LmXxmABUCFH+rHaORA3tBgMQohpb+BdlEvne62F+5WlSD0zZf6IVxHRxT6+h8Qo3jihP9efzE3Y7ub4A0Lyd4JeBh4tD7ZP8uHCDFzu8ZkLcrmaq6CA3eMCvu9VLVap6xxK2oLrjOfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IK53FLE/CCWZq6l9/WF96VwY2LEVWW+sLWKtngHw60=;
 b=eJ+xlrEXXY7bUCmWYriUFZhJZC9kpjMaiK4aF5zup3cqg0LHO88BBhR9G78irG85g0XJuJqrNJ43GMl9yuZnFWt2rYVhBpDpsFubIDIc9Yxg4dy3+Di4AhQVcigogavjCrKVYU3gGr89MarNmxFsH3RgZbNU7g8GBWlhOq64OhEJpFNXJe/lF9OJxW1gQ1BLiAjbJt9uOHZp3V3YkpdqU8FRFgJp7+EeILtoROMP5alfA986qHccYqp2/AiZHMWQP71KEjdSZrJswY5XyzRlTFbkXxrJLzeXkhNChm7XgvDlSzFZ5SCPEvFrDtXN9n4werP7wzqgLTFGwyDfG/gtqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3410.namprd18.prod.outlook.com (10.255.137.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 13:27:00 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 13:27:00 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Thread-Topic: [Xen-devel] [PATCH v7] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMY4Gmux1Y/IiSU2ZKtKyOfOCuKbQbceAgAG+GQD//9nvgIAEjgaAgAyrw4CAABIygA==
Date: Tue, 30 Jul 2019 13:27:00 +0000
Message-ID: <60651ad5-f0bd-caad-77f6-5f8fb71a8319@suse.com>
References: <20190703105639.23081-1-aisaila@bitdefender.com>
 <7a4c824d-3ccd-b289-3e8e-ff94ea916b3e@suse.com>
 <0d1ab92f-171b-98d9-a69e-5aa7cfbe0d85@bitdefender.com>
 <e61a882e-d2ea-a03d-fde8-2c2befd865da@suse.com>
 <23cebb01-38fc-ba49-5a71-e6129152e488@bitdefender.com>
 <1bdaee7b-a01f-7be8-426f-fe6c678c2859@bitdefender.com>
In-Reply-To: <1bdaee7b-a01f-7be8-426f-fe6c678c2859@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::14)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf626d6f-cab1-42d1-295f-08d714f19a51
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3410; 
x-ms-traffictypediagnostic: BY5PR18MB3410:
x-microsoft-antispam-prvs: <BY5PR18MB3410517D49AC299A24FA020BB3DC0@BY5PR18MB3410.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(199004)(189003)(81156014)(81166006)(8676002)(8936002)(102836004)(52116002)(386003)(66946007)(53546011)(25786009)(6506007)(53936002)(80792005)(76176011)(6486002)(6116002)(3846002)(7416002)(66556008)(64756008)(66446008)(86362001)(31696002)(71200400001)(6436002)(7736002)(2906002)(66476007)(229853002)(256004)(6512007)(54906003)(68736007)(14444005)(71190400001)(26005)(31686004)(486006)(316002)(4326008)(99286004)(36756003)(476003)(2616005)(6916009)(11346002)(186003)(305945005)(14454004)(446003)(478600001)(6246003)(5660300002)(66066001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3410;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NunlldnCMAfPCVirvYlsw7pXmoHTjfSkXqimbUipN6RdmIKvt1vlYiRsn8ZN2T2lQU+YFkk6fbSkLLMrdA/vB18yoKo7Y+BrDw7sakfZVER1FuZtMhMdTZI30Z+P0L21EfE1t0OYJ7ba+39uEce2JGyfEP0MbotUNuxvIaOZeqnpsM1EFIHYqVt9gWzm88dXpGxn7OHJwHnKQxhUzPCcLf4Nxfe6BgSb6IO2+vtqmcePLUrPz5cFmeQYfJ3gQYPNuKpFnq493pilpMxlPOhqN6BC5TCTJKCHdWr98nuS26wlVPrQWaFp+PW0ZvFfVP9mW2bDA+bOPbcAIwDb2Th3EkQJpghGCiO513GKaSdS6A2BHwr8+IKcAYpimH1q+AsrWCGAoXjQ572CDHTS7OaWrAWScgo7mRUm0ReNSoDqAjQ=
Content-ID: <40DC094425672944AC31F8ADCFE97583@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bf626d6f-cab1-42d1-295f-08d714f19a51
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 13:27:00.6717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3410
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v7] x86/emulate: Send vm_event from emulate
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
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAxNDoyMSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+IA0K
Pj4+Pj4+IEBAIC02MjksNiArNjk3LDE0IEBAIHN0YXRpYyB2b2lkICpodm1lbXVsX21hcF9saW5l
YXJfYWRkcigNCj4+Pj4+PiAgICAgICAgDQo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgIEFTU0VS
VChwMm10ID09IHAybV9yYW1fbG9nZGlydHkgfHwgIXAybV9pc19yZWFkb25seShwMm10KSk7DQo+
Pj4+Pj4gICAgICAgICAgICAgICAgfQ0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgICAgICBpZiAoIGN1
cnItPmFyY2gudm1fZXZlbnQgJiYNCj4+Pj4+PiArICAgICAgICAgICAgY3Vyci0+YXJjaC52bV9l
dmVudC0+c2VuZF9ldmVudCAmJg0KPj4+Pj4+ICsgICAgICAgICAgICBodm1fZW11bGF0ZV9zZW5k
X3ZtX2V2ZW50KGFkZHIsIGdmbiwgcGZlYykgKQ0KPj4+Pj4+ICsgICAgICAgIHsNCj4+Pj4+PiAr
ICAgICAgICAgICAgZXJyID0gRVJSX1BUUih+WDg2RU1VTF9SRVRSWSk7DQo+Pj4+Pj4gKyAgICAg
ICAgICAgIGdvdG8gb3V0Ow0KPj4+Pj4+ICsgICAgICAgIH0NCj4+Pj4+DQo+Pj4+PiBEaWQgeW91
IG5vdGljZSB0aGF0IHRoZXJlJ3MgYW4gaW1tZWRpYXRlIGV4aXQgZnJvbSB0aGUgbG9vcCBvbmx5
DQo+Pj4+PiBpbiBjYXNlIHRoZSBsaW5lYXIgLT4gcGh5c2ljYWwgdHJhbnNsYXRpb24gZmFpbHM/
IFRoaXMgaXMNCj4+Pj4+IHJlbGV2YW50IGZvciBwYWdlIGZhdWx0IGRlbGl2ZXJ5IGNvcnJlY3Ru
ZXNzIGZvciBhY2Nlc3Nlcw0KPj4+Pj4gY3Jvc3NpbmcgcGFnZSBib3VuZGFyaWVzLiBJIHRoaW5r
IHlvdSB3YW50IHRvIHVzZQ0KPj4+Pj4gdXBkYXRlX21hcF9lcnIoKSBhbmQgZHJvcCB0aGUgImdv
dG8gb3V0Ii4gSSBjYW4ndCByZWFsbHkgbWFrZSB1cA0KPj4+Pg0KPj4+PiBCeSB1cGRhdGVfbWFw
X2VycigpIGFyZSB5b3Ugc2F5aW5nIHRvIGhhdmUgdGhlIGVyciB2YXIgYXNzaWduZWQgYW5kIHRo
ZW4NCj4+Pj4gZHJvcCAiZ290byBvdXQiPyBJZiBzbyBob3cgZG8gSSBrZWVwIHRoZSBlcnIgZnJv
bSBteSBhY2Nlc3MgdmlvbGF0aW9uDQo+Pj4+IHdpdGhvdXQgZXhpdGluZyBmcm9tIHRoZSBsb29w
Pw0KPj4+DQo+Pj4gQ291bnRlciBxdWVzdGlvbjogV2h5IGRvIHlvdSBfbmVlZF8gdG8ga2VlcCAi
eW91ciIgdmFsdWUgb2YgZXJyPw0KPj4+IElmLCBqdXN0IGFzIGFuIGV4YW1wbGUsIHRoZXJlJ3Mg
Z29pbmcgdG8gYmUgYSAjUEYgb24gdGhlIG90aGVyDQo+Pj4gaGFsZiBvZiB0aGUgYWNjZXNzLCB0
aGVuICJ5b3VyIiBhY2Nlc3MgdmlvbGF0aW9uIGlzIG9mIG5vIGludGVyZXN0DQo+Pj4gYXQgYWxs
Lg0KPj4NCj4+IFlvdSBhcmUgcmlnaHQsIHRoZXJlIGlzIG5vIG5lZWQgdG8ga2VlcCB0aGUgImdv
dG8gb3V0IiBoZXJlLiBJdCB3YXMganVzdA0KPj4gZm9yIG9wdGltaXphdGlvbiBpbiB0aGUgaWRl
YSB0aGF0IHRoZXJlIGlzIG5vIG5lZWQgdG8gZG8gZnVydGhlciBzdGVwcw0KPj4gYnV0IEkgY2Fu
IGRyb3AgdGhlICJnb3RvIG91dCIgYW5kIHRoZSBjb2RlIHdpbGwgd29yayB0aGUgc2FtZS4NCj4+
DQo+IA0KPiBUaGVyZSBpcyBhIHByb2JsZW0gd2l0aCBkcm9wcGluZyB0aGUgImdvdG8gb3V0Ii4g
SWYgZXZlcnl0aGluZyBnb2VzIGZpbmUNCj4gdGhlbiBpdCB3aWxsIHJldHVybiB0aGUgbWFwcGlu
ZyBhbmQgSSBkb24ndCB3YW50IHRoYXQuIFRoaXMgY2FuIGJlDQo+IHN0b3BwZWQgYnkgY2hlY2tp
bmcgaWYgKCBlcnIgKSBhZnRlciB0aGUgbG9vcCBhbmQgaXQgaXMgbm90IG51bGwgdGhlbg0KPiBn
b3RvIG91dC4gQW5kIGdvaW5nIHdpdGggdGhpcyBpZGVhIEkgY2FuIGluaXQgKmVyciA9IE5VTEwg
YW5kIGRyb3AgdGhlDQo+IGVyciA9IE5VTEwgZnJvbSBodm1lbXVsX21hcF9saW5lYXJfYWRkcigp
LiBJcyB0aGlzIG9rIGZvciB0aGUgbmV4dCB2ZXJzaW9uPw0KDQpJJ2QgcHJlZmVyIHRvIHNlZSB0
aGUgY29kZSB0byBkZWNpZGUuIElmIHlvdSB3YW50IHRoaXMgc2V0dGxlZCBiZWZvcmUNCnNlbmRp
bmcgdGhlIG5leHQgZnVsbCB2ZXJzaW9uLCB0aGVuIHBsZWFzZSBzZW5kIGF0IGxlYXN0IHRoZSBy
ZXN1bHRpbmcNCnBhdGNoIGh1bmsocykuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
