Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0166070A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 16:00:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjOi5-0007OM-Ke; Fri, 05 Jul 2019 13:57:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hjOi4-0007OH-QW
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 13:57:08 +0000
X-Inumbo-ID: c65ce67e-9f2c-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c65ce67e-9f2c-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 13:57:07 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  5 Jul 2019 13:53:28 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 5 Jul 2019 13:56:51 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 5 Jul 2019 13:56:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=eaJWK3Ykdr4Pgfep5AOkYWW5HChYH1WbfcuyGhI+oOlhBIvVr2afx5RnRwyKUfEE2OUTA1zZ86QyLiKJyhi4RPbbmp51289PtM1TdWkcw5wF3amurxBnl0g/+3bW13qRaJiwA4cGNMsZqEAzN91lR4huvG/oLRDwaRIap6iKTUg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSQOTPu6l3PmeFR7rjxLp6uQYXKLSHZ/jr+TYS9Rz2A=;
 b=DsflsW25r68IHao72fbb6FSLyC+1KQCBtPccoxa45HaaYwiC1E5lAe8CtbZpX9iKbtHA3qJed5rmQ7quI5umRJ/vQHLF+VG97cailvas2nwIsZT7NjMT9IguV/5dP7rPe79zIGMAV+gUZHE3663qy881eUDXDrCa+JJ/0hK3iE0=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3092.namprd18.prod.outlook.com (10.255.136.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Fri, 5 Jul 2019 13:56:49 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.019; Fri, 5 Jul 2019
 13:56:49 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] x86/ctxt-switch: Document and improve GDT handling
Thread-Index: AQHVMzl9f7XpHmXEn0SQQWgMTo0c+w==
Date: Fri, 5 Jul 2019 13:56:49 +0000
Message-ID: <01ed83cc-72ed-4800-3639-b74f9dfec9d6@suse.com>
References: <20190704175732.5943-1-andrew.cooper3@citrix.com>
 <b6372724-920c-5798-8615-55c1e992b97b@suse.com>
 <f0200191-c5d2-62a4-ef43-bee1ee8920de@citrix.com>
In-Reply-To: <f0200191-c5d2-62a4-ef43-bee1ee8920de@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB3PR0102CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:8::22) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2f89668-7831-421e-cc3e-08d70150a046
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3092; 
x-ms-traffictypediagnostic: BY5PR18MB3092:
x-microsoft-antispam-prvs: <BY5PR18MB3092D0BE41D2A67549C1459FB3F50@BY5PR18MB3092.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(199004)(189003)(51444003)(54094003)(6486002)(80792005)(229853002)(99286004)(36756003)(6512007)(76176011)(6436002)(25786009)(31696002)(305945005)(68736007)(6246003)(86362001)(486006)(66476007)(66446008)(66946007)(64756008)(386003)(66556008)(7736002)(446003)(73956011)(53936002)(52116002)(476003)(11346002)(2616005)(66066001)(4326008)(6506007)(54906003)(53546011)(186003)(31686004)(5660300002)(6116002)(71190400001)(71200400001)(26005)(3846002)(14444005)(14454004)(316002)(8676002)(8936002)(6916009)(478600001)(102836004)(81156014)(256004)(72206003)(81166006)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3092;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Az+QS5Kx4XwU1fUibzy4WL6ZtRi9V5v8Vp5A/BhOalAYvv3+CDKeOdP+evqYMT643I2pZN86xHgd8uN41nejwcSkWydlduWBRNpSQkGtEa7a2XzRAKYAmyuRJ9tVGWvEVEvB/wYf+IjUtoBcCOlZrS8Ez2IGHA2SEOgf7bYzJbsJSjHbQuG761y6R1lVP88Rrzg3NePUh9O+X1TvnJv1GD1oxrqIg58Dc1jeucRHrK7R1Bhcm4HIsJig76LfTRMKcLo2j/qv4AVoJgtg/saiCR6HIKJlCESzbZP/2mbr1MFEwNqguhbfvyzgr6W4t+fS0tOXJg1YBHYRSczu4HtPL//l/MBCqMB8sLn+/9sUmo1tnHusLmdzpKc5SGPYLpxpouJWbgmPl6Xr0RkH3hHo3E1NTuVZkBr7PGwNbXjv6Gc=
Content-ID: <7C350B6803A31A4AAEF9A93902F60D88@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f89668-7831-421e-cc3e-08d70150a046
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 13:56:49.5559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3092
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/ctxt-switch: Document and improve GDT
 handling
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
Cc: Juergen Gross <JGross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDcuMjAxOSAxNTozNiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDUvMDcvMjAx
OSAxMTowMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAwNC4wNy4yMDE5IDE5OjU3LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IEFsc28sIGl0IHNob3VsZCBub3cgYmUgdmVyeSBvYnZpb3Vz
IHRvIHBlb3BsZSB0aGF0IFhlbidzIGN1cnJlbnQgR0RUIGhhbmRsaW5nDQo+Pj4gZm9yIG5vbi1Q
ViB2Y3B1cyBpcyBhIHJlY2lwZSBzdWJ0bGUgYnVncywgaWYgd2UgZXZlciBtYW5hZ2UgdG8gZXhl
Y3V0ZSBhIHN0cmF5DQo+Pj4gbW92L3BvcCAlc3JlZyBpbnN0cnVjdGlvbi4gIFdlIHJlYWxseSBv
dWdodCB0byBoYXZlIFhlbidzIHJlZ3VsYXIgR0RUIGluIGFuDQo+Pj4gYXJlYSB3aGVyZSBzbG90
cyAwLTEzIGFyZSBlaXRoZXIgbWFwcGVkIHRvIHRoZSB6ZXJvIHBhZ2UsIG9yIG5vdCBwcmVzZW50
LCBzbw0KPj4+IHdlIGRvbid0IHJpc2sgbG9hZGluZyBhIG5vbi1mYXVsdGluZyBnYXJiYWdlIHNl
bGVjdG9yLg0KPj4gV2VsbCwgdGhlcmUncyBjZXJ0YWlubHkgcm9vbSBmb3IgaW1wcm92ZW1lbnQs
IGJ1dCBsb2FkaW5nIGEgc3RyYXkNCj4+IHNlbGVjdG9yIHNlZW1zIHByZXR0eSB1bmxpa2VseSBh
biBldmVudCB0byBoYXBwZW4sIGFuZCB0aGUNCj4+IHJlc3BlY3RpdmUgY29kZSBoYXZpbmcgZ290
IHNsaXBwZWQgaW4gd2l0aG91dCBhbnlvbmUgbm90aWNpbmcuDQo+PiBPdGhlciB0aGFuIGluIGNv
bnRleHQgc3dpdGNoaW5nIGNvZGUgSSBkb24ndCB0aGluayB0aGVyZSBhcmUgbWFueQ0KPj4gcGxh
Y2VzIGF0IGFsbCB3aGVyZSB3ZSB3cml0ZSB0byB0aGUgc2VsZWN0b3IgcmVnaXN0ZXJzLg0KPiAN
Cj4gVGhlcmUgYXJlIGhvd2V2ZXIgbWFueSBwbGFjZXMgd2hlcmUgd2Ugd3JpdGUgc29tZSBieXRl
cyBpbnRvIGEgc3R1YiBhbmQNCj4gdGhlbiBleGVjdXRlIHRoZW0uDQo+IA0KPiBUaGlzIGlzbid0
IGEgc2VjdXJpdHkgaXNzdWUuwqAgVGhlcmUgYXJlbid0IGFueSBsZWdpdGltYXRlIGNvZGVwYXRo
cyBmb3INCj4gd2hpY2ggaXMgdGhpcyBhIHByb2JsZW0sIGJ1dCB0aGVyZSBhcmUgcGxlbnR5IG9m
IGNhc2NhZGUgZmFpbHVyZXMgd2hlcmUNCj4gdGhpcyBpcyBsaWFibGUgdG8gbWFrZSBhIGJhZCBz
aXR1YXRpb24gd29yc2UgaXMgd2VpcmQgaGFyZC10by1kZWJ1ZyB3YXlzLg0KPiANCj4gTm90IHRv
IG1lbnRpb24gdGhhdCBmb3Igc2VjdXJpdHkgaGFyZGVuaW5nIHB1cnBvc2VzLCB3ZSBzaG91bGQg
YmUgdXNpbmcNCj4gYSBSTyBtYXBwaW5nIHRvIGNvbWJhdCBzZ2R0IG9yIGZpeGVkLUFCSSBrbm93
bGVkZ2UgZnJvbSBhbiBhdHRhY2tlci4NCg0KT2theSwgSSBjYW4gc2VlIGhvdyBTR0RUIGNhbiBy
ZXZlYWwgdW5kdWUga25vd2xlZGdlIHRvIGFuIGF0dGFja2VyLA0KZXZlbiBpZiB0aGV5IGNhbid0
IHVzZSB0aGUgYWRkcmVzcyBkaXJlY3RseSwgYnV0IG9ubHkgdG8gaW5mZXIgZnVydGhlcg0KdGhp
bmdzIChoZW5jZSBVTUlQJ3MgZXhpc3RlbmNlKS4gQnV0IEknbSBoYXZpbmcgdHJvdWJsZSBzZWVp
bmcgaG93IGENCnIvbyBtYXBwZWQgR0RUIGFkZHMgbXVjaCBzZWN1cml0eS4gQ291bGQgeW91IGV4
cGFuZCBvbiB0aGlzPw0KDQo+IEFuZCBvbiB0aGF0IG5vdGUuLi4gbm90aGluZyByZWFsbHkgdXBk
YXRlcyB0aGUgZnVsbCBHRFQgdmlhIHRoZQ0KPiBwZXJkb21haW4gbWFwcGluZ3MsIHNvIEkgdGhp
bmsgdGhhdCBjYW4gYWxyZWFkeSBtb3ZlIHRvIGJlaW5nIFJPLiAgVGhpcw0KPiBkb2VzIGRlcGVu
ZCBvbiB0aGUgZmFjdCB0aGF0IG5vb25lIGhhcyB1c2VkIHNlZ21lbnRlZCB2aXJ0dWFsIG1lbW9y
eQ0KPiBzaW5jZSBsb25nIGJlZm9yZSBYZW4gd2FzIGEgdGhpbmcuICBXZSBjYW4gdHJhcCBhbmQg
ZW11bGF0ZSB0aGUgc2V0dGluZw0KPiBvZiBBIGJpdHMsIGFuZCBJIGJldCB0aGF0IHBhdGggd2ls
bCBuZXZlciBnZXQgaGl0IGV2ZW4gd2l0aCBvbGQgUFYgZ3Vlc3RzLg0KDQpXZWxsLCB5b3UgY291
bGQgZ28gdGhlIGZpcnN0IHN0ZXAgaGVyZSBhbmQgbWFwIHRoZSBYZW4gcGFnZSByL28gcmlnaHQN
CmF3YXkuIFRoZXJlIHdlIGRvbid0IGV2ZW4gbmVlZCB0byBmZWFyIEEgYml0cyBuZWVkaW5nIHRv
IGdldCBzZXQsIHNpbmNlDQp3ZSBjb250cm9sIHRoZSBjb250ZW50cy4NCg0KPj4+IEBAIC0xNzE4
LDE1ICsxNzM3LDEyIEBAIHN0YXRpYyB2b2lkIF9fY29udGV4dF9zd2l0Y2godm9pZCkNCj4+PiAg
ICANCj4+PiAgICAgICAgcHNyX2N0eHRfc3dpdGNoX3RvKG5kKTsNCj4+PiAgICANCj4+PiAtICAg
IGdkdCA9ICFpc19wdl8zMmJpdF9kb21haW4obmQpID8gcGVyX2NwdShnZHRfdGFibGUsIGNwdSkg
Og0KPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwZXJfY3B1KGNvbXBh
dF9nZHRfdGFibGUsIGNwdSk7DQo+Pj4gLQ0KPj4+ICAgICAgICBpZiAoIG5lZWRfZnVsbF9nZHQo
bmQpICkNCj4+PiAtICAgICAgICB3cml0ZV9mdWxsX2dkdF9wdGVzKGdkdCwgbik7DQo+Pj4gKyAg
ICAgICAgdXBkYXRlX3hlbl9zbG90X2luX2Z1bGxfZ2R0KG4sIGNwdSk7DQo+Pj4gICAgDQo+Pj4g
ICAgICAgIGlmICggbmVlZF9mdWxsX2dkdChwZCkgJiYNCj4+PiAgICAgICAgICAgICAoKHAtPnZj
cHVfaWQgIT0gbi0+dmNwdV9pZCkgfHwgIW5lZWRfZnVsbF9nZHQobmQpKSApDQo+Pj4gLSAgICAg
ICAgbG9hZF9kZWZhdWx0X2dkdChnZHQsIGNwdSk7DQo+Pj4gKyAgICAgICAgbG9hZF9kZWZhdWx0
X2dkdChjcHUpOw0KPj4gICBGcm9tIGxvb2tpbmcgYXQgdGhpcyB0cmFuc2Zvcm1hdGlvbiBJIGNh
bm5vdCBzZWUgaG93LCBhcyBzYWlkIGluDQo+PiB0aGUgZGVzY3JpcHRpb24gYW5kIGFzIGV4cHJl
c3NlZCBieSByZW1vdmluZyB0aGUgZ2R0IHBhcmFtZXRlcg0KPj4gZnJvbSBsb2FkX2RlZmF1bHRf
Z2R0KCksIHRoZSBnZHQgaGF2aW5nIGdvdCBwYXNzZWQgaW4gaGVyZSB3b3VsZA0KPj4gYWx3YXlz
IGhhdmUgYmVlbiBwZXJfY3B1KGdkdF90YWJsZSwgY3B1KS4gSXQgcHJldHR5IGNsZWFybHkgd2Fz
DQo+PiB0aGUgY29tcGF0IG9uZSBmb3IgbmQgYmVpbmcgMzItYml0IFBWLiBXaGF0IGFtIEkgbWlz
c2luZz8NCj4gDQo+IFRvIGJlIHBlcmZlY3RseSBob25lc3QsIEkgd3JvdGUgImhvdyBpdCB7ZG9l
cyxzaG91bGR9IGxvZ2ljYWxseSB3b3JrIiwNCj4gdGhlbiBhZGp1c3RlZCB0aGUgY29kZS4NCj4g
DQo+PiBPciBpcyB0aGUgZGVzY3JpcHRpb24gcGVyaGFwcyBpbnN0ZWFkIG1lYW5pbmcgdG8gc2F5
IHRoYXQgaXQgZG9lc24ndA0KPj4gX25lZWRfIHRvIGJlIHRoZSBjb21wYXQgb25lIHRoYXQgd2Ug
bG9hZCBoZXJlLCBhcyBpbiBjYXNlIGl0IGlzDQo+PiB0aGUgc3Vic2VxdWVudCBsb2FkX2Z1bGxf
Z2R0KCkgd2lsbCByZXBsYWNlIGl0IGFnYWluIGFueXdheT8NCj4gDQo+IGxnZHQgaXMgYW4gZXhw
ZW5zaXZlIG9wZXJhdGlvbi7CoCBJIGhhZG4ndCBldmVuIHNwb3R0ZWQgdGhhdCB3ZSBhcmUgZG9p
bmcNCj4gaXQgdHdpY2Ugb24gdGhhdCBwYXRoLsKgIFRoZXJlIGlzIHN1cmVseSBzb21lIHJvb20g
Zm9yIGltcHJvdmVtZW50IGhlcmUNCj4gYXMgd2VsbC4NCg0KV2VsbCwgdGhlIGRvdWJsZSBsb2Fk
IGhhZCB0byBiZSBhZGRlZCBmb3IgYSB2ZXJ5IHNpbXBsZSByZWFzb246DQpXaGlsZSB3ZSdyZSBz
d2l0Y2hpbmcgcGFnZSB0YWJsZXMsIHRoZSBHRFQgbWFwcGluZyBoYXMgdG8gcmVtYWluDQppbnRh
Y3QuIEhlbmNlIHRoZSBkZXBlbmRlbmN5IHVwb24gdGhlIHR3byB2Q1BVIElEcyAobm90KSBtYXRj
aGluZy4NCklPVyBJIGRvbid0IGN1cnJlbnRseSBzZWUgcm9vbSBmb3IgaW1wcm92ZW1lbnQgaGVy
ZS4NCg0KPiBJIHdvbmRlciBpZiBjYWNoaW5nIHRoZSBsYXN0IGdkdCBiYXNlIGFkZHJlc3MgcGVy
IGNwdSB3b3VsZCBiZSBhIGJldHRlcg0KPiBvcHRpb24sIGFuZCBvbmx5IGRvaW5nIGEgImxhenki
IGxnZHQuwqAgSXQgd291bGQgY2VydGFpbmx5IHNpbXBseSB0aGUNCj4gIndoZW4gc2hvdWxkIEkg
bGdkdD8iIGxvZ2ljLg0KDQpBdCB0aGUgZmlyc3QgZ2xhbmNlIEknbSBub3QgY29udmluY2VkIHRo
aXMgd291bGQgc2ltcGxpZnkgdGhpbmdzLCBidXQNCkknZCBoYXZlIHRvIHNlZSBhY3R1YWwgY29k
ZS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
