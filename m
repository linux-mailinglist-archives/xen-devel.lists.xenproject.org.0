Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C859127A42
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 12:51:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiGmW-0004po-D6; Fri, 20 Dec 2019 11:49:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KLOa=2K=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iiGmV-0004pj-Ln
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 11:49:19 +0000
X-Inumbo-ID: c0b305f4-231e-11ea-933a-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.97]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0b305f4-231e-11ea-933a-12813bfff9fa;
 Fri, 20 Dec 2019 11:49:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUTrMrN6q6cxdkgSh4nV0YTgJsJw1Wdt0QcQwV6GmT9rYq1CT93TodGWMWkDYUXLY04TFo1B5n6O6wmh4dFKXanPFQdAyEvWWJRCjASurt9uOuAkFZ3J+xfQvIeZ9vZ5WeSsacyceFZPw8x2mN0e3Dmv3N7co+MxWY+ViTlCm7TepiNBC+IqDXRGY0sxOxlI1HRYeQhE0EFxWI6HuFtDTOj1fIMQEN72q/xQG2D/NONZmWWxFUNoMWjFVLnX0Nd6rBuSGcgNLAFd413dnsJTqWhJTPGYWDy6DirAQBuFrMfDaq8/U7V/NAA4XXyjEOlFKFPAmfpnaqytUnC3jJRYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsQhaMEOmDsPpQP67JAwhzYKsyLIqMYyjBJmeNOgEz0=;
 b=eLEbTLK4nGskUSKeTeRv9iLWOMx7zpAl2bW0+T0/r9kEhXyM5Y8xkMgZL/ub3Mg+WUn4uM/lN9uCm8vOMUboH18M1or7h7QrVfI46jitIlqYIkY3PJTEHDsCFmmDFWp8zTsIDfWJK3EAqHPvQx5d2kPtjybMpwTk4fw1hyZgq5Q2k2G8wGUKU05Wdp0Vdt7tSZTUVCx4dA/Vl7fb3IwJ2HIOhxvd7JlRtKubuhhV7alLlQmtaIRYLGuHHpQ+/nTOCXX9mVZSHrsimVK7hWNDkOCco0IurqZ7RVpK1aFgWOl0tUj82dA2j5QjZIGpTsedf6UHuBsAptUPX9ZNcCbVDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsQhaMEOmDsPpQP67JAwhzYKsyLIqMYyjBJmeNOgEz0=;
 b=usAzh7PlYLiBLS5qBahgsnNyif0g6PECLpeRa0xKLDZnLVA8zNnQjnvE+b4duZ97zfZdnx7xavoH86UPG2LaKNABSYfiFjqiSuScshbSjLWrlWKmf0ucF9+NqJO0gMNPBKfShKEE+oOqrGGWQw7w2PjMcnFOyVBH2zHKCUn36xg=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB4978.eurprd02.prod.outlook.com (20.178.21.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Fri, 20 Dec 2019 11:49:16 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2559.015; Fri, 20 Dec 2019
 11:49:16 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH V5 1/4] x86/mm: Add array_index_nospec to guest provided
 index values
Thread-Index: AQHVtlCv9fBx8h7blUeN6Fd8ih9YqafBRckAgAGZaoD//+b9AIAAJC8A
Date: Fri, 20 Dec 2019 11:49:16 +0000
Message-ID: <d0b0e561-a2b2-ccc9-0d52-60615530dbe6@bitdefender.com>
References: <20191219094236.22002-1-aisaila@bitdefender.com>
 <b37fe84e-fe6f-9db4-ac5d-3dfbf7811470@suse.com>
 <9f1b936d-8a3c-8ef3-a184-c0846b01d250@bitdefender.com>
 <fcfd9555-9e02-5405-443a-e3f981f06494@suse.com>
In-Reply-To: <fcfd9555-9e02-5405-443a-e3f981f06494@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: FRYP281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::11)
 To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22405e20-7cbf-4b65-97d3-08d78542a3db
x-ms-traffictypediagnostic: AM0PR02MB4978:|AM0PR02MB4978:|AM0PR02MB4978:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB4978F0D2B72D84C56363469BAB2D0@AM0PR02MB4978.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 025796F161
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(136003)(376002)(346002)(39860400002)(189003)(199004)(66476007)(64756008)(66446008)(66556008)(2906002)(71200400001)(6916009)(186003)(8676002)(81156014)(26005)(53546011)(81166006)(2616005)(6506007)(8936002)(36756003)(52116002)(316002)(478600001)(31696002)(6512007)(6486002)(66946007)(5660300002)(31686004)(4326008)(54906003)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB4978;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qD5uzkZpgwn1Phl4qNZpwl+Du2ATWU7JzPmd9oDq/cfee1/O9q99cglSIIQcW1A5LyK4LDdj++V6r46DMYvqUzpcrxZl/kNe8XUYenZ8NPOcsHvb9LKZQk0sZgYmNgjn6gbDHJzqU8da932318SRBiIbualQVzeMnTwyFS/Fq5oXyqR05RxIskfEPcE8WYC94x/EKmUj1AmY+bySj4KcHXGkQVjrs8suMI7/Jul1+RXAIIONMlxXuocTmIrOrgq3ltqlaUWd2D7+iejavVVHsa94XyzvSw9oUh5S8N+qcKIkTRmK+DSToillo9kKqIHe4YerjypR4XAZkZiNpyh4c7Ms6jLfyXy3WacD42hshRV8JlLJc392UjBkF4Q3S4c17cLXS7SVt9eqgStgVu/QtHftTkVQb0dh1j7nWCuhsZQpxA2Ld30g0VKkEzShDyWt
Content-ID: <C89A7BBCC7177544988E79812080A2F6@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22405e20-7cbf-4b65-97d3-08d78542a3db
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2019 11:49:16.1196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YPs6PCHjUEJskPyH5Nz4B/GcfqgFfDEQ9L7z6BMFRan2SLPOT7Txy/D2qTZKIbNa2WGbDy/YismBUe3Hlqo2YnNZI9dEgcgqaSk6XaYH4Gk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4978
Subject: Re: [Xen-devel] [PATCH V5 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
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
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDIwLjEyLjIwMTkgMTE6MzksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMC4xMi4y
MDE5IDEwOjA5LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+DQo+Pg0KPj4gT24g
MTkuMTIuMjAxOSAxMjo0MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTkuMTIuMjAxOSAx
MDo0MiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4+IFRoaXMgcGF0Y2ggYWlt
cyB0byBzYW5pdGl6ZSBpbmRleGVzLCBwb3RlbnRpYWxseSBndWVzdCBwcm92aWRlZA0KPj4+PiB2
YWx1ZXMsIGZvciBhbHRwMm1fZXB0cFtdIGFuZCBhbHRwMm1fcDJtW10gYXJyYXlzLg0KPj4+Pg0K
Pj4+PiBSZXF1ZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+Pj4g
U2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+
DQo+Pj4+IC0tLQ0KPj4+PiBDQzogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5k
ZXIuY29tPg0KPj4+PiBDQzogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPg0K
Pj4+PiBDQzogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4NCj4+
Pj4gQ0M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4NCj4+Pj4g
Q0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+Pj4gQ0M6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+Pj4+IENDOiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPg0KPj4+PiBDQzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4N
Cj4+Pj4gQ0M6IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4NCj4+Pj4gQ0M6
IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KPj4+PiAtLS0NCj4+Pj4gQ2hhbmdl
cyBzaW5jZSBWNDoNCj4+Pj4gCS0gQ2hhbmdlIGJvdW5kcyBjaGVjayBmcm9tIE1BWF9FUFRQIHRv
IE1BWF9BTFRQMk0NCj4+Pj4gCS0gTW92ZSBhcnJheV9pbmRleF9ub3NwZWMoKSBjbG9zZXIgdG8g
dGhlIGJvdW5kcyBjaGVjay4NCj4+Pj4gLS0tDQo+Pj4+ICAgIHhlbi9hcmNoL3g4Ni9tbS9tZW1f
YWNjZXNzLmMgfCAxNSArKysrKysrKystLS0tLS0NCj4+Pj4gICAgeGVuL2FyY2gveDg2L21tL3Ay
bS5jICAgICAgICB8IDIwICsrKysrKysrKysrKysrLS0tLS0tDQo+Pj4+ICAgIDIgZmlsZXMgY2hh
bmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jIGIveGVuL2FyY2gveDg2L21tL21l
bV9hY2Nlc3MuYw0KPj4+PiBpbmRleCAzMjBiOWZlNjIxLi4zM2UzNzlkYjhmIDEwMDY0NA0KPj4+
PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jDQo+Pj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9tbS9tZW1fYWNjZXNzLmMNCj4+Pj4gQEAgLTM2NywxMCArMzY3LDExIEBAIGxvbmcgcDJt
X3NldF9tZW1fYWNjZXNzKHN0cnVjdCBkb21haW4gKmQsIGdmbl90IGdmbiwgdWludDMyX3QgbnIs
DQo+Pj4+ICAgICAgICBpZiAoIGFsdHAybV9pZHggKQ0KPj4+PiAgICAgICAgew0KPj4+PiAgICAg
ICAgICAgIGlmICggYWx0cDJtX2lkeCA+PSBNQVhfQUxUUDJNIHx8DQo+Pg0KPj4gT2ssIHNvIGhh
dmUgaWYgKCBhbHRwMm1faWR4ID49ICBtaW4oQVJSQVlfU0laRShkLT5hcmNoLmFsdHAybV9lcHRw
KSwNCj4+IE1BWF9FUFRQKSB8fA0KPj4gaGVyZSBhbmQgdGhlbi4uLg0KPj4NCj4+Pj4gLSAgICAg
ICAgICAgICBkLT5hcmNoLmFsdHAybV9lcHRwW2FsdHAybV9pZHhdID09IG1mbl94KElOVkFMSURf
TUZOKSApDQo+Pj4+ICsgICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fZXB0cFthcnJheV9pbmRl
eF9ub3NwZWMoYWx0cDJtX2lkeCwgTUFYX0FMVFAyTSldID09DQo+Pg0KPj4gaGF2ZSBNQVhfRVBU
UCBoZXJlIGFuZCAuLi4NCj4+DQo+Pj4NCj4+PiBBcyBpbXBsaWVkIGJ5IGEgcmVwbHkgdG8gdjQs
IHRoaXMgaXMgc3RpbGwgbGF0ZW50bHkgYnVnZ3k6IFRoZXJlJ3MNCj4+PiBubyBndWFyYW50ZWUg
YW55b25lIHdpbGwgbm90aWNlIHRoZSBpc3N1ZSBoZXJlIHdoZW4gYnVtcGluZw0KPj4+IE1BWF9B
TFRQMk0gcGFzdCBNQVhfRVBUUC4gVGhlIG9ubHkgZnV0dXJlIHByb29mIHRoaW5nIHRvIGRvIGhl
cmUNCj4+PiBpcywgYXMgc3VnZ2VzdGVkLCB1c2luZyBzb21lIGZvcm0gb2YgbWluKE1BWF9BTFRQ
Mk0sIE1BWF9FUFRQKSBpbg0KPj4+IHRoZSBhY3R1YWwgYm91bmRzIGNoZWNrLiBUaGVuIGVhY2gg
YXJyYXkgYWNjZXNzIGl0c2VsZiBjYW4gYmUgbWFkZQ0KPj4+IHVzZSB0aGUgY29ycmVjdCBib3Vu
ZC4gSW4gZmFjdCB5b3UnZCBwcm9iYWJseSBoYXZlIG5vdGljZWQgdGhpcyBpZg0KPj4+IHlvdSBo
YWQgbWFkZSB1c2Ugb2YgYXJyYXlfYWNjZXNzX25vc3BlYygpIHdoZXJlIHBvc3NpYmxlICh3aGlj
aA0KPj4+IGFsc28gd291bGQgaGVscCByZWFkYWJpbGl0eSkgLSBhcHBhcmVudGx5IG5vdCBoZXJl
LCBidXQgLi4uID4NCj4+Pj4gKyAgICAgICAgICAgICBtZm5feChJTlZBTElEX01GTikgKQ0KPj4+
PiAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+Pj4gICAgDQo+Pj4+IC0gICAgICAg
IGFwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1bYWx0cDJtX2lkeF07DQo+Pj4+ICsgICAgICAgIGFw
Mm0gPSBkLT5hcmNoLmFsdHAybV9wMm1bYXJyYXlfaW5kZXhfbm9zcGVjKGFsdHAybV9pZHgsIE1B
WF9BTFRQMk0pXTsNCj4+DQo+PiBNQVhfQUxUUDJNIGhlcmUgPw0KPiANCj4gWWVzLCB0aGF0J3Mg
aG93IEkgdGhpbmsgaXQgb3VnaHQgdG8gYmUuIEdpdmUgb3RoZXJzIGEgY2hhbmNlIHRvDQo+IGRp
c2FncmVlIHdpdGggbWUsIHRob3VnaC4NCj4gDQoNClRoZXJlIGlzIGEgc2xpZ2h0IHByb2JsZW0g
d2l0aCB1c2luZyAoQVJSQVlfU0laRSguLikpIGl0IHdpbGwgZ2l2ZSANCiJlcnJvcjogc3RhdGlj
IGFzc2VydGlvbiBmYWlsZWQ6IiBvbiAgX19tdXN0X2JlX2FycmF5KHgpIGJlY2F1c2UgDQpkLT5h
cmNoLmFsdHAybV9lcHRwIGlzIG5vdCBzdGF0aWMuDQoNCkFsZXgNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
