Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CA686131
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 13:55:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvgyO-000164-V5; Thu, 08 Aug 2019 11:52:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvgyN-00015z-Lt
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 11:52:47 +0000
X-Inumbo-ID: 01749c34-b9d3-11e9-862e-4bafdc461559
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01749c34-b9d3-11e9-862e-4bafdc461559;
 Thu, 08 Aug 2019 11:52:43 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 11:52:21 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 11:51:14 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 11:51:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNXWVGxwOgqsizZ+F1Z5q26mgrIegsAQYTVwlgQirIgr/UawZeOGP0gXnI4mA8rkC+pNUPhetxERnwLvVMD72fQIWdr5nWy+YxvL/SSBjoYXGPqjoyM9AQzZmTWM74HYLpCM2Jx+o8uFPI7/Dt8N8qCiFiS2MzCi/7ZOp6uUSE4nD98gb+a3+sOraItZZ89ApEwz7Gw7KBtbJ3tQFi9XaeSfHKB2mEbzwWaX0MYV2y9P3RWfR8TlBUELG3E2gZjVeuSKJyCwG0DEP6i3QRBz6j0kyyQCqoeWLsf0LwEA0XvThj16dDwJJEe6/rQuln8tU7//lAd+akzeMBhjCOdLZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GI7F5p8Hux2bQBlaXIuppTRv7HCfoENffhdApyoUk8=;
 b=KLVcdWMT8MARh9aAo8pdJgT3lu3aqx88Q270rRs7DUEIieIe5X5qnVBlcpMv/3vqfitBZdI6C6ghgCxbBe0ddwecSgcVMH9obB+k9W0BRxNI/xCm8KPyn/jYDJ0/QG5UL+DVt8sguPGnTo8RQ1rnkheFfDT406iZSPEv5XNtdaAJ4GNdKGkdwS0ROtPY0lmQt86qAm3/e8qPEaIVzCi7U02HuVp5IkGVmDs/QXxgOOhINKRYRxmeJjBe8BreAc67sSgtk0czouJ9Y4/MgoKWo6h3vo8KrRzAwOasCn836ThAWPLPXmwLFpkA7PKEnA0Er3O/16cmlioydfqzV32Hbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2909.namprd18.prod.outlook.com (20.179.20.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Thu, 8 Aug 2019 11:51:13 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 11:51:13 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH 0/4] enhance lock debugging
Thread-Index: AQHVTaTjLrtftDrvKkCKqSelFkELw6bw7JlBgAAJ1oCAAApms4AAIwSA
Date: Thu, 8 Aug 2019 11:51:13 +0000
Message-ID: <22a7623a-cb9d-a848-4f9a-61f81c8e03a1@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
 <bc9954e7-ef0a-aeaf-668b-eedcc78645d4@citrix.com>
 <3a8e76fd-ec10-9020-7f34-40c62dab0e6c@suse.com>
 <c1d979d8-eece-0065-c4a1-5f3d47a217ea@citrix.com>
 <b9911c5a-3c66-30a0-4147-4a69f6847d56@suse.com>
 <efbf84bf-fb0e-b96f-5274-185b976c14a2@citrix.com>
In-Reply-To: <efbf84bf-fb0e-b96f-5274-185b976c14a2@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0102CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:14::25) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0efa2515-23f7-415b-1812-08d71bf6b640
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR18MB2909; 
x-ms-traffictypediagnostic: MN2PR18MB2909:
x-microsoft-antispam-prvs: <MN2PR18MB2909CB7368DB4C123D75C40BB3D70@MN2PR18MB2909.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(199004)(189003)(64756008)(99286004)(5660300002)(66446008)(36756003)(26005)(8676002)(66476007)(66946007)(66556008)(186003)(81156014)(8936002)(81166006)(80792005)(52116002)(305945005)(66066001)(7736002)(31686004)(71190400001)(76176011)(2906002)(6116002)(3846002)(478600001)(6916009)(4326008)(102836004)(14444005)(71200400001)(54906003)(316002)(11346002)(6512007)(2616005)(14454004)(476003)(31696002)(53936002)(6486002)(446003)(6506007)(53546011)(86362001)(6246003)(25786009)(229853002)(486006)(6436002)(256004)(386003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2909;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tXCRdZRQ/gelUaWn1z6pwe4Mr1C4ab6FzJPk6Y6RTFyzHgrckK5LelsKhAjVAo7dE1+Y4rRdc+n/PlnIbR+lefzP+82VCa+3Trqj9UGEmjPj9BzCWmbmx9EAMoWpMSw7crgN78MNT88w1SKqVVld0NOmXkCbG/Ns/sM6kk4nGNfKO4hibfZDYCth86jcXS+pfhLhLsd9nm4giLSbcS8l2L0srNYoaSIqlnMGMa8n431b+s/zr0JhFCW+y88x5NchtzdCw5DMJq2JharG5b5x/Sz9c4XTOyJkvaxkM0RZK4loTvMvDtNNw6IC0MLYS1eUDgZk48DafDJC2IFznxD7nc4WSRAqUD8I6iixocyxwZHjOFpGiQh4eYrev3HL+eAlKzS+Df7k4jQ+iOZ+XISy2uDCBLvkgDk/rnNn0u/DKzc=
Content-ID: <92A7E63C174AC041804C680E828532F6@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0efa2515-23f7-415b-1812-08d71bf6b640
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 11:51:13.1352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4yp7R0/1K/c++eonK4uGRQD3b/EByETq5B7GxNUGh3+393ZgVZQ6H0h89wwEX0K0REwO9tc9m33VjuLV4TI7Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2909
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 0/4] enhance lock debugging
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
Cc: Juergen Gross <JGross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMjAxOSAxMTo0NSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDgvMDgvMjAx
OSAxMDowOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAwOC4wOC4yMDE5IDEwOjMzLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDA4LzA4LzIwMTkgMDU6NTAsIEp1ZXJnZW4gR3Jvc3Mg
d3JvdGU6DQo+Pj4+IE9uIDA3LjA4LjE5IDIwOjExLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+
Pj4gPHNuaXA+DQo+Pj4+PiBJdHMgbm90IGV4YWN0bHkgdGhlIGVhc2llc3QgdG8gZHVtcCB0byBm
b2xsb3cuDQo+Pj4+Pg0KPj4+Pj4gRmlyc3Qgb2YgYWxsIC0gSSBkb24ndCBzZWUgd2h5IHRoZSBo
b2xkL2Jsb2NrIHRpbWUgYXJlIHByaW50ZWQgbGlrZQ0KPj4+Pj4gdGhhdC7CoCBJdA0KPj4+Pj4g
bWlnaHQgYmUgYSBob2xkb3ZlciBmcm9tIHRoZSAzMmJpdCBidWlsZCwgcHJlIFBSSWQ2NCBzdXBw
b3J0LsKgIFRoZXkNCj4+Pj4+IHNob3VsZA0KPj4+Pj4gcHJvYmFibHkgdXNlIFBSSV9zdGltZSBh
bnl3YXkuDQo+Pj4+IEZpbmUgd2l0aCBtZS4NCj4+Pj4NCj4+Pj4+IFRoZSBkb21pZCByZW5kZXJp
bmcgaXMgdW5mb3J0dW5hdGUuwqAgSWRlYWxseSB3ZSdkIHVzZSAlcGQgYnV0IHRoYXQgd291bGQN
Cj4+Pj4+IGludm9sdmUgcmVhcnJhbmdpbmcgdGhlIGxvZ2ljIHRvIGdldCBhIHN0cnVjdCBkb21h
aW4qIGluIGhhbmQuDQo+Pj4+PiBTZWVpbmcgYXMNCj4+Pj4+IHlvdSdyZSB0aGUgbGFzdCBwZXJz
b24gdG8gbW9kaWZ5IHRoaXMgY29kZSwgaG93IGhhcmQgd291bGQgdGhhdCBiZSB0bw0KPj4+Pj4g
ZG8/DQo+Pj4+IEl0IHdvdWxkIGNvbXBsZXRlbHkgYnJlYWsgdGhlIHN0cnVjdCB0eXBlIGFnbm9z
dGljIGRlc2lnbi4NCj4+PiBPay7CoCBBcyBhbiBhbHRlcm5hdGl2ZWx5LCBob3cgYWJvdXQgJXBk
ciB3aGljaCB0YWtlcyBhIHJhdyBkb21pZD/CoCBJdA0KPj4+IHdvdWxkIGJlIGEgdHJpdmlhbCBh
ZGp1c3RtZW50IGluIHRoZSB2c25wcmludGYgY29kZSwgYW5kIGNvdWxkIHBsYXVzaWJseQ0KPj4+
IGJlIHVzZWZ1bCBlbHNld2hlcmUgd2hlcmUgd2UgaGF2ZSBhIGRvbWlkIGFuZCBub3QgYSBkb21h
aW4gcG9pbnRlci4NCj4+IEF0IHRoZSByaXNrIG9mIHVwc2V0dGluZyAvIGFubm95aW5nIHlvdToN
Cj4gDQo+IFllcyB5b3UgcmVhbGx5IGhhdmUNCj4gDQo+PiBBIGRvbWlkX3Qgd291bGQgYWdhaW4N
Cj4+IGJldHRlciBiZSBmb3JtYXR0ZWQgdmlhICVvZCAoYW5kIHdpdGhvdXQgdGhlIG5lZWQgdG8g
dGFrZSB0aGUNCj4+IGFkZHJlc3Mgb2YgYSByZXNwZWN0aXZlIHZhcmlhYmxlKS4gSW4gdGhlIGNh
c2UgaGVyZSBpdCB3b3VsZA0KPj4gaGF2ZSB0aGUgbWlub3IgYWRkaXRpb25hbCBiZW5lZml0IG9m
IGNvbnNlcnZpbmcgb24gZm9ybWF0IHN0cmluZw0KPj4gbGVuZ3RoLg0KPiANCj4gVGhlcmUgYXJl
IGNvbmNyZXRlIHJlYXNvbnMgd2h5IGl0IGlzIGEgdGVycmlibGUgaWRlYSwgYmVjYXVzZSBub25l
IG9mDQo+IHRoaXMgaGFzIGFueXRoaW5nIHRvIGRvIHdpdGggb2N0YWwsIGFuZCB0aGF0ICVvZCBo
YXMgYSB3ZWxsIGRlZmluZWQNCj4gbWVhbmluZyB3aGljaCBpcyBub3QgcmVsYXRlZCB0byBkb21p
ZCdzLg0KDQpJJ20gY3VyaW91cyB0byBsZWFybiB3aGF0IHdlbGwgZGVmaW5lZCBtZWFuaW5nICVv
ZCBoYXMuDQoNCj7CoCBUaGVyZSBpcyBhbHNvIGEgdmVyeSBnb29kDQo+IHJlYXNvbiB3aHkgYWxs
IHRoZSBtYWdpYyBpcyBoaWRkZW4gYmVoaW5kIG9uZSBzaW5nbGUgZm9ybWF0dGVyLg0KPiANCj4g
WW91IHNlZW0gaGVsbCBiZW50IG9uIG1ha2luZyBpdCBhY3RpdmVseSBjb25mdXNpbmcgYW5kIGNv
bXBsaWNhdGVkIHRvDQo+IHdyaXRlIGFuZCByZWFkIHByaW50aygpJ3MsIGFuZCBJIGFtIG5vdCB3
aWxsaW5nIHRvIGx1bWJlciBhbnlvbmUNCj4gZGV2ZWxvcGluZyBvbiBYZW4gd2l0aCB0aGlzIGNv
Z25pdGl2ZSBjb21wbGV4aXR5Lg0KPiANCj4gSSBhbSBzdGljayB0byBkZWF0aCBvZiBoYXZpbmcg
dGhlIHNhbWUgb3ZlciBhbmQgb3Zlciwgc28gbGV0IG1lIHN0b3AgYW55DQo+IGZ1cnRoZXIgd2Fz
dGluZyBvZiB0aW1lIGFuZCBiZSBhYnNvbHV0ZWx5IGNyeXN0YWwgY2xlYXIuDQo+IA0KPiBOQUNL
IHRvIGFueSBmb3JtIG9mIG92ZXJsb2FkaW5nICVvDQoNCkluIHdoaWNoIGNhc2UsIGlmIEkgdG9v
ayBhIHNpbWlsYXIgcG9zaXRpb24gZm9yIHRoZSBQQ0kgU0JERg0KZm9ybWF0dGluZyB1c2luZyAl
cHAsIHdlJ2QgYmUgaW4gYSBkZWFkIGVuZC4gV2FzdGUgb2YgdGltZSBvciBub3QNCi0gd2hpbGUg
eW91IGhhdmUgbWFkZSBjcnlzdGFsIGNsZWFyIHdoeSB5b3UgcGVyc29uYWxseSBkaXNsaWtlDQpv
dmVybG9hZGluZyAlbywgYWZhaWMgeW91J3ZlIG5vdCBwcm92aWRlZCBhbnkgbm9uLXN1YmplY3Rp
dmUNCihpLmUuIHRydWx5IHRlY2huaWNhbCkgcmVhc29ucywgd2hpY2ggd291bGQgYmUgd2hhdCBt
aWdodCBoZWxwDQpjb252aW5jZSBtZSBvZiBzdGlja2luZyB0byBqdXN0ICVwIG92ZXJsb2FkaW5n
Lg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
